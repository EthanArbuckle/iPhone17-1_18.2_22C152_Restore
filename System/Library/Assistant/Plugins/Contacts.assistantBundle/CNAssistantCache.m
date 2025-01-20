@interface CNAssistantCache
+ (BOOL)addUpdate:(id)a3 forAssistantUrl:(id)a4;
+ (BOOL)removeAllUpdates;
+ (BOOL)removeUpdatesForAssistantUrl:(id)a3;
+ (BOOL)saveCache:(id)a3;
+ (id)cacheDictionary;
+ (id)cachePath;
+ (id)updatesForAssistantUrl:(id)a3;
@end

@implementation CNAssistantCache

+ (id)cachePath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v5 = objc_msgSend_firstObject(v2, v3, v4);

  v7 = objc_msgSend_stringByAppendingPathComponent_(v5, v6, @"com.apple.AssistantServices");

  v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9);
  objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v10, v11, (uint64_t)v7, 1, 0, 0);
  v13 = objc_msgSend_stringByAppendingPathComponent_(v7, v12, @"CNAssistantUpdatesCache.plist");

  return v13;
}

+ (id)cacheDictionary
{
  v3 = objc_msgSend_cachePath(a1, a2, v2);
  v6 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v4, v5);
  if ((objc_msgSend_fileExistsAtPath_(v6, v7, (uint64_t)v3) & 1) == 0)
  {

LABEL_6:
    v15 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v13, v14);
    goto LABEL_7;
  }
  v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9);
  int isReadableFileAtPath = objc_msgSend_isReadableFileAtPath_(v10, v11, (uint64_t)v3);

  if (!isReadableFileAtPath) {
    goto LABEL_6;
  }
  v15 = objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x263EFF9A0], v13, (uint64_t)v3);
  if (!v15) {
    goto LABEL_6;
  }
LABEL_7:

  return v15;
}

+ (BOOL)saveCache:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_cachePath(a1, v5, v6);
  v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9);
  if ((objc_msgSend_fileExistsAtPath_(v10, v11, (uint64_t)v7) & 1) == 0)
  {

    goto LABEL_5;
  }
  uint64_t v14 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v12, v13);
  int isWritableFileAtPath = objc_msgSend_isWritableFileAtPath_(v14, v15, (uint64_t)v7);

  if (isWritableFileAtPath)
  {
LABEL_5:
    char v18 = objc_msgSend_writeToFile_atomically_(v4, v17, (uint64_t)v7, 1);
    goto LABEL_6;
  }
  char v18 = 0;
LABEL_6:

  return v18;
}

+ (BOOL)addUpdate:(id)a3 forAssistantUrl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10 = objc_msgSend_cacheDictionary(a1, v8, v9);
  uint64_t v13 = objc_msgSend_absoluteString(v7, v11, v12);
  v15 = (void *)v13;
  char v16 = 0;
  if (v10 && v13)
  {
    v17 = objc_msgSend_objectForKeyedSubscript_(v10, v14, v13);
    v20 = objc_msgSend_mutableCopy(v17, v18, v19);

    if (!v20)
    {
      id v22 = objc_alloc(MEMORY[0x263EFF980]);
      v20 = objc_msgSend_initWithCapacity_(v22, v23, 1);
    }
    objc_msgSend_addObject_(v20, v21, (uint64_t)v6);
    v26 = objc_msgSend_absoluteString(v7, v24, v25);
    objc_msgSend_setObject_forKeyedSubscript_(v10, v27, (uint64_t)v20, v26);

    char v16 = objc_msgSend_saveCache_(a1, v28, (uint64_t)v10);
  }

  return v16;
}

+ (BOOL)removeUpdatesForAssistantUrl:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_cacheDictionary(a1, v5, v6);
  v10 = objc_msgSend_absoluteString(v4, v8, v9);

  char v12 = 0;
  if (v7 && v10)
  {
    objc_msgSend_removeObjectForKey_(v7, v11, (uint64_t)v10);
    char v12 = objc_msgSend_saveCache_(a1, v13, (uint64_t)v7);
  }

  return v12;
}

+ (BOOL)removeAllUpdates
{
  v3 = objc_msgSend_cachePath(a1, a2, v2);
  uint64_t v6 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v4, v5);
  v8 = v6;
  if (v3 && objc_msgSend_fileExistsAtPath_(v6, v7, (uint64_t)v3))
  {
    v11 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v9, v10);
    char v13 = objc_msgSend_removeItemAtPath_error_(v11, v12, (uint64_t)v3, 0);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

+ (id)updatesForAssistantUrl:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_cacheDictionary(a1, v5, v6);
  uint64_t v10 = objc_msgSend_absoluteString(v4, v8, v9);

  char v12 = 0;
  if (v7 && v10)
  {
    char v12 = objc_msgSend_objectForKeyedSubscript_(v7, v11, (uint64_t)v10);
  }

  return v12;
}

@end