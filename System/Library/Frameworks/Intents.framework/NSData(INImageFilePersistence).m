@interface NSData(INImageFilePersistence)
- (void)_in_writeDataToPathForImage:()INImageFilePersistence storeType:error:;
@end

@implementation NSData(INImageFilePersistence)

- (void)_in_writeDataToPathForImage:()INImageFilePersistence storeType:error:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = objc_msgSend(v8, "_in_writeableFilePersistenceConfigurationForStoreType:", a4);
  v10 = v9;
  if (v9)
  {
    v11 = [v9 filePath];
    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v13 = [v12 fileExistsAtPath:v11];

    uint64_t v14 = INSiriLogContextIntents;
    BOOL v15 = os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[NSData(INImageFilePersistence) _in_writeDataToPathForImage:storeType:error:]";
        __int16 v29 = 2112;
        id v30 = v11;
        v16 = "%s File already exists at path %@, overwriting";
        v17 = v14;
        uint32_t v18 = 22;
LABEL_9:
        _os_log_impl(&dword_18CB2F000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 136315650;
      v28 = "-[NSData(INImageFilePersistence) _in_writeDataToPathForImage:storeType:error:]";
      __int16 v29 = 2112;
      id v30 = v8;
      __int16 v31 = 2112;
      v32 = v11;
      v16 = "%s Writing image %@ to new file path %@";
      v17 = v14;
      uint32_t v18 = 32;
      goto LABEL_9;
    }
    [a1 writeToFile:v11 options:1 error:a5];
    id v23 = _INImageFilePersistenceUpdateModifiedDateAtFilePath(v11);
    a5 = [v10 identifier];
    goto LABEL_11;
  }
  if (!a5) {
    goto LABEL_12;
  }
  v19 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v25 = *MEMORY[0x1E4F28568];
  v20 = NSString;
  v11 = [v8 description];
  v21 = [v20 stringWithFormat:@"No writable file configuration available for image: %@", v11];
  v26 = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  *a5 = [v19 errorWithDomain:@"IntentsErrorDomain" code:6002 userInfo:v22];

  a5 = 0;
LABEL_11:

LABEL_12:

  return a5;
}

@end