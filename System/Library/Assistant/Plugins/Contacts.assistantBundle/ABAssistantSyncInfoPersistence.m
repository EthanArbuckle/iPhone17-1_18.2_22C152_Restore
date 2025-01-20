@interface ABAssistantSyncInfoPersistence
+ (BOOL)saveFileForDictionary:(id)a3;
+ (id)filePath;
+ (id)infoDictionary;
+ (id)stringForKey:(id)a3;
+ (id)valueForKey:(id)a3;
+ (void)saveString:(id)a3 forKey:(id)a4;
+ (void)saveValue:(id)a3 forKey:(id)a4;
@end

@implementation ABAssistantSyncInfoPersistence

+ (id)filePath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v5 = objc_msgSend_firstObject(v2, v3, v4);

  v7 = objc_msgSend_stringByAppendingPathComponent_(v5, v6, @"com.apple.assistant.Contacts");

  v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9);
  objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v10, v11, (uint64_t)v7, 1, 0, 0);
  v13 = objc_msgSend_stringByAppendingPathComponent_(v7, v12, @"CNAssistantSyncInfo.plist");

  return v13;
}

+ (id)infoDictionary
{
  v3 = objc_msgSend_filePath(a1, a2, v2);
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

+ (BOOL)saveFileForDictionary:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_filePath(a1, v5, v6);
  v10 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v8, v9);
  if (objc_msgSend_fileExistsAtPath_(v10, v11, (uint64_t)v7))
  {
    uint64_t v14 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v12, v13);
    int isWritableFileAtPath = objc_msgSend_isWritableFileAtPath_(v14, v15, (uint64_t)v7);

    if (!isWritableFileAtPath)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_ERROR)) {
        sub_221CB0BD4();
      }
      char v18 = 0;
      goto LABEL_11;
    }
  }
  else
  {
  }
  v19 = objc_msgSend_fileURLWithPath_(NSURL, v17, (uint64_t)v7);
  id v23 = 0;
  char v18 = objc_msgSend_writeToURL_error_(v4, v20, (uint64_t)v19, &v23);
  id v21 = v23;
  if (v21 && os_log_type_enabled((os_log_t)*MEMORY[0x263F28380], OS_LOG_TYPE_ERROR)) {
    sub_221CB0B54();
  }

LABEL_11:
  return v18;
}

+ (void)saveString:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_infoDictionary(a1, v8, v9);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v10, (uint64_t)v7, v6);

  objc_msgSend_saveFileForDictionary_(a1, v11, (uint64_t)v12);
}

+ (id)stringForKey:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_infoDictionary(a1, v5, v6);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)v4);

  return v9;
}

+ (void)saveValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_infoDictionary(a1, v8, v9);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v10, (uint64_t)v7, v6);

  objc_msgSend_saveFileForDictionary_(a1, v11, (uint64_t)v12);
}

+ (id)valueForKey:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_infoDictionary(a1, v5, v6);
  uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)v4);

  return v9;
}

@end