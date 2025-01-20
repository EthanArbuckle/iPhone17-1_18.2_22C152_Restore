@interface CSFBnnsIrLookUp
+ (id)_generateHashBnnsIrPathForMilFile:(id)a3;
+ (id)getBnnsIrPathFromMilFile:(id)a3;
+ (id)readBnnsIrFromCacheMapWithMilFile:(id)a3;
+ (void)initialize;
+ (void)removeBnnsIrFromCacheMapWithMilFile:(id)a3;
+ (void)setCacheMapWithMilFile:(id)a3 bnnsIr:(id)a4;
@end

@implementation CSFBnnsIrLookUp

+ (id)_generateHashBnnsIrPathForMilFile:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = (const char *)[a3 UTF8String];
  CC_LONG v4 = strlen(v3);
  CC_SHA256(v3, v4, md);
  v5 = +[CSFPreferences sharedPreferences];
  v6 = [v5 getOnDeviceCompilationCacheDirectoryForBenchmark];

  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  for (uint64_t i = 0; i != 5; ++i)
    objc_msgSend(v7, "appendFormat:", @"%02x", md[i]);
  v9 = [v6 stringByAppendingPathComponent:v7];
  v10 = [v9 stringByAppendingPathExtension:@"bnnsir"];

  return v10;
}

+ (void)removeBnnsIrFromCacheMapWithMilFile:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)&milBnnsIrCacheMapLock);
    [(id)modelMilBnnsIrCacheMap removeObjectForKey:v4];
    os_unfair_lock_lock((os_unfair_lock_t)&milBnnsIrCacheMapLock);
    id v3 = v4;
  }
}

+ (void)setCacheMapWithMilFile:(id)a3 bnnsIr:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (v8 && v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&milBnnsIrCacheMapLock);
    v6 = (void *)modelMilBnnsIrCacheMap;
    id v7 = [v8 stringByStandardizingPath];
    [v6 setObject:v5 forKey:v7];

    os_unfair_lock_unlock((os_unfair_lock_t)&milBnnsIrCacheMapLock);
  }
}

+ (id)readBnnsIrFromCacheMapWithMilFile:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&milBnnsIrCacheMapLock);
    id v4 = (void *)modelMilBnnsIrCacheMap;
    id v5 = [v3 stringByStandardizingPath];
    v6 = [v4 objectForKeyedSubscript:v5];

    os_unfair_lock_unlock((os_unfair_lock_t)&milBnnsIrCacheMapLock);
    id v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      v10 = "+[CSFBnnsIrLookUp readBnnsIrFromCacheMapWithMilFile:]";
      __int16 v11 = 2112;
      v12 = v6;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s obtained bnnsir : %@ for milFile: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getBnnsIrPathFromMilFile:(id)a3
{
  id v4 = a3;
  if ([v4 hasSuffix:@"bnns.mil"])
  {
    id v5 = +[CSFBnnsIrLookUp readBnnsIrFromCacheMapWithMilFile:v4];
    if (!v5)
    {
      id v5 = [a1 _generateHashBnnsIrPathForMilFile:v4];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && +[CSFBnnsIrLookUp initialize]::onceToken != -1)
  {
    dispatch_once(&+[CSFBnnsIrLookUp initialize]::onceToken, &__block_literal_global_1094);
  }
}

uint64_t __29__CSFBnnsIrLookUp_initialize__block_invoke()
{
  modelMilBnnsIrCacheMap = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

@end