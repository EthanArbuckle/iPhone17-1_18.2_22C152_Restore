@interface APVersionData
- (APVersionData)init;
- (NSFileManager)fileManager;
- (id)subdirectoriesAtURL:(id)a3;
- (void)setFileManager:(id)a3;
@end

@implementation APVersionData

- (APVersionData)init
{
  v8.receiver = self;
  v8.super_class = (Class)APVersionData;
  v4 = [(APVersionData *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v2, v3);
    fileManager = v4->_fileManager;
    v4->_fileManager = (NSFileManager *)v5;
  }
  return v4;
}

- (id)subdirectoriesAtURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7 = objc_msgSend_fileManager(self, v5, v6);
  v9 = objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v7, v8, (uint64_t)v4, 0, 1, 0);

  if (v9)
  {
    v12 = objc_msgSend_allObjects(v9, v10, v11);
  }
  else
  {
    v13 = APLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138477827;
      id v17 = (id)objc_opt_class();
      id v14 = v17;
      _os_log_impl(&dword_24718C000, v13, OS_LOG_TYPE_ERROR, "[%{private}@] Error: Unable to create Enumerator from URL.", (uint8_t *)&v16, 0xCu);
    }
    v12 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end