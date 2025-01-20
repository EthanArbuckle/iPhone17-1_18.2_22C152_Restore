@interface CSMil2BnnsUtils
+ (BOOL)_isBnnsIrReadable:(id)a3;
+ (id)compileModelWithMilFile:(id)a3 bnnsIrCachePath:(id)a4 compilationFramework:(int64_t)a5;
+ (id)readBnnsIrFromCacheMapWithMilFile:(id)a3;
+ (id)readBnnsIrFromModelConfig:(id)a3 modelType:(int64_t)a4;
+ (void)_changePermissionOfBnnsIr:(id)a3;
+ (void)_compileWithExceptionHandlingUsingModelFilePath:(id)a3 bnnsIrPath:(id)a4 milConfigPath:(id)a5 compilationFramework:(int64_t)a6 error:(id *)a7;
+ (void)removeConfigFromQuasarComputeEngineCacheWithMilBnnsPath:(id)a3 bnnsIrPath:(id)a4;
@end

@implementation CSMil2BnnsUtils

+ (void)_changePermissionOfBnnsIr:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v14 = *MEMORY[0x1E4F28330];
  v15[0] = &unk_1F13B8140;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v9 = 0;
  char v6 = [v4 setAttributes:v5 ofItemAtPath:v3 error:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "+[CSMil2BnnsUtils _changePermissionOfBnnsIr:]";
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Error setting file permissions: %@", buf, 0x16u);
    }
  }
}

+ (void)_compileWithExceptionHandlingUsingModelFilePath:(id)a3 bnnsIrPath:(id)a4 milConfigPath:(id)a5 compilationFramework:(int64_t)a6 error:(id *)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = [[CSOSTransaction alloc] initWithDescription:@"Mil2Bnns compilation"];
  if (a6 == 2)
  {
    id v15 = +[CSFModelComputeBackendUtils compileWithMilFile:v11 bnnsIrPath:v12];
  }
  else if (a6 == 1)
  {
    id v18 = 0;
    [MEMORY[0x1E4F61038] compileWithModelMilPath:v11 bnnsIrOutPath:v12 milConfigPath:v13 errorOut:&v18];
    id v15 = v18;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:2251 userInfo:&unk_1F13B7F38];
  }
  v16 = v15;
  if (v15)
  {
    v17 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      if (!a7) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315906;
    v20 = "+[CSMil2BnnsUtils _compileWithExceptionHandlingUsingModelFilePath:bnnsIrPath:milConfigPath:compilationFramework:error:]";
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2112;
    v26 = v16;
    _os_log_error_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_ERROR, "%s mil2Bnns compilation error for modelFilePath: %@ to bnnsIrCachePath: %@ with error: %@", buf, 0x2Au);
    if (a7) {
LABEL_9:
    }
      *a7 = v16;
  }
LABEL_10:
  if (v14) {
}
  }

+ (BOOL)_isBnnsIrReadable:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = open((const char *)[v3 UTF8String], 0);
  int v5 = v4;
  if (v4 == -1)
  {
    id v11 = (id)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = __error();
      id v13 = strerror(*v12);
      v19.st_dev = 136315394;
      *(void *)&v19.st_mode = "+[CSMil2BnnsUtils _isBnnsIrReadable:]";
      WORD2(v19.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v19.st_ino + 6) = (__darwin_ino64_t)v13;
      _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Could not read OPEN() BNNSIR: %s", (uint8_t *)&v19, 0x16u);
    }

    BOOL v7 = 0;
  }
  else
  {
    int v6 = fstat(v4, &v19);
    close(v5);
    BOOL v7 = v6 == 0;
    if (v6)
    {
      v8 = (id)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = __error();
        v10 = strerror(*v9);
        int v15 = 136315394;
        v16 = "+[CSMil2BnnsUtils _isBnnsIrReadable:]";
        __int16 v17 = 2080;
        id v18 = v10;
        _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Could not fstat() BNNSIR: %s", (uint8_t *)&v15, 0x16u);
      }
    }
  }

  return v7;
}

+ (id)readBnnsIrFromCacheMapWithMilFile:(id)a3
{
  id v3 = +[CSFBnnsIrLookUp readBnnsIrFromCacheMapWithMilFile:a3];
  return v3;
}

+ (id)readBnnsIrFromModelConfig:(id)a3 modelType:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = +[CSOnDeviceCompilationUtils readMilFilePathFromConfig:a3 modelType:a4];
  if (+[CSOnDeviceCompilationUtils getBackendTypeFromModelFile:v5] == 1)
  {
    int v6 = [v5 stringByStandardizingPath];
    BOOL v7 = [a1 readBnnsIrFromCacheMapWithMilFile:v6];
  }
  else
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "+[CSMil2BnnsUtils readBnnsIrFromModelConfig:modelType:]";
      _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Only mil2Bnns is supported for prewarm", (uint8_t *)&v10, 0xCu);
    }
    BOOL v7 = 0;
  }

  return v7;
}

+ (void)removeConfigFromQuasarComputeEngineCacheWithMilBnnsPath:(id)a3 bnnsIrPath:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 stringByStandardizingPath];
  uint64_t v9 = [v7 stringByStandardizingPath];
  int v10 = (void *)v9;
  if (v8 && v9)
  {
    id v11 = [a1 readBnnsIrFromCacheMapWithMilFile:v8];
    if ([v11 isEqualToString:v10])
    {
      +[CSFBnnsIrLookUp removeBnnsIrFromCacheMapWithMilFile:v8];
      uint64_t v12 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315394;
        uint64_t v14 = "+[CSMil2BnnsUtils removeConfigFromQuasarComputeEngineCacheWithMilBnnsPath:bnnsIrPath:]";
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s removing milBnns model file path from cacheMap :%@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
  MEMORY[0x1BA9E6A50](CSModelEngineCacheLookUpHandler);
}

+ (id)compileModelWithMilFile:(id)a3 bnnsIrCachePath:(id)a4 compilationFramework:(int64_t)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v36 = "+[CSMil2BnnsUtils compileModelWithMilFile:bnnsIrCachePath:compilationFramework:]";
    __int16 v37 = 2112;
    id v38 = v7;
    __int16 v39 = 2112;
    id v40 = v8;
    _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Compile MIL: %@ to BNNS IR: %@", buf, 0x20u);
  }
  uint64_t v27 = +[CSOnDeviceCompilationUtils getMilConfigFromMilFilePath:v7];
  int v10 = [v8 stringByDeletingLastPathComponent];
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v32 = 0;
  if ([v11 fileExistsAtPath:v10 isDirectory:&v32])
  {
    id v12 = 0;
    goto LABEL_6;
  }
  id v31 = 0;
  char v13 = [v11 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v31];
  id v12 = v31;
  if (v13)
  {
LABEL_6:
    if ([v11 fileExistsAtPath:v8])
    {
      char v14 = [a1 _isBnnsIrReadable:v8];
      __int16 v15 = CSLogContextFacilityCoreSpeech;
      if (v14)
      {
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "+[CSMil2BnnsUtils compileModelWithMilFile:bnnsIrCachePath:compilationFramework:]";
          __int16 v37 = 2112;
          id v38 = v8;
          _os_log_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEFAULT, "%s bnnsIr already existed, touch file but skipping compilation for: %@", buf, 0x16u);
        }
        uint64_t v33 = *MEMORY[0x1E4F28310];
        id v16 = [MEMORY[0x1E4F1C9C8] date];
        v34 = v16;
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];

        id v18 = 0;
        [v11 setAttributes:v17 ofItemAtPath:v8 error:0];
      }
      else
      {
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "+[CSMil2BnnsUtils compileModelWithMilFile:bnnsIrCachePath:compilationFramework:]";
          __int16 v37 = 2112;
          id v38 = v8;
          _os_log_error_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_ERROR, "%s can't open bnnsIr: %@, recompiling to a new bnnsir file", buf, 0x16u);
        }
        __int16 v21 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v29 = 0;
        [v21 removeItemAtPath:v8 error:&v29];
        id v17 = v29;

        id v22 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "+[CSMil2BnnsUtils compileModelWithMilFile:bnnsIrCachePath:compilationFramework:]";
          __int16 v37 = 2112;
          id v38 = v17;
          _os_log_error_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_ERROR, "%s Invalid bnnsIr removal error: %@", buf, 0x16u);
        }
        id v28 = 0;
        [a1 _compileWithExceptionHandlingUsingModelFilePath:v7 bnnsIrPath:v8 milConfigPath:v27 compilationFramework:a5 error:&v28];
        id v18 = v28;
      }
    }
    else
    {
      id v30 = 0;
      [a1 _compileWithExceptionHandlingUsingModelFilePath:v7 bnnsIrPath:v8 milConfigPath:v27 compilationFramework:a5 error:&v30];
      id v18 = v30;
      if (v18)
      {
LABEL_24:
        id v20 = v18;

        goto LABEL_25;
      }
    }
    __int16 v23 = [v7 stringByStandardizingPath];
    id v24 = [v8 stringByStandardizingPath];
    +[CSFBnnsIrLookUp setCacheMapWithMilFile:v23 bnnsIr:v24];

    if (a5 == 1) {
      MEMORY[0x1BA9E6A50](CSModelEngineCacheLookUpHandler);
    }
    goto LABEL_24;
  }
  stat v19 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "+[CSMil2BnnsUtils compileModelWithMilFile:bnnsIrCachePath:compilationFramework:]";
    __int16 v37 = 2112;
    id v38 = v12;
    _os_log_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEFAULT, "%s Creating model directory not success %@", buf, 0x16u);
  }
  id v12 = v12;
  id v20 = v12;
LABEL_25:

  return v20;
}

@end