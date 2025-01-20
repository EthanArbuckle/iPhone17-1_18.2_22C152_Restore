@interface NSURL(CRKAdditions)
+ (id)crk_uniqueTemporaryDirectoryURL;
+ (id)crk_uniqueTemporaryFileURL;
- (id)crk_escapedPath;
- (uint64_t)crk_isBundle;
- (void)crk_isBundle;
@end

@implementation NSURL(CRKAdditions)

+ (id)crk_uniqueTemporaryDirectoryURL
{
  v2 = NSTemporaryDirectory();
  v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [v3 UUIDString];
  v5 = [v2 stringByAppendingPathComponent:v4];
  v6 = [a1 fileURLWithPath:v5];

  return v6;
}

+ (id)crk_uniqueTemporaryFileURL
{
  v1 = objc_msgSend(a1, "crk_uniqueTemporaryDirectoryURL");
  v2 = [MEMORY[0x263F08C38] UUID];
  v3 = [v2 UUIDString];
  v4 = [v1 URLByAppendingPathComponent:v3];

  return v4;
}

- (id)crk_escapedPath
{
  v1 = [a1 path];
  v2 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  v3 = [v1 stringByAddingPercentEncodingWithAllowedCharacters:v2];

  return v3;
}

- (uint64_t)crk_isBundle
{
  id v10 = 0;
  uint64_t v2 = *MEMORY[0x263EFF6A8];
  id v9 = 0;
  int v3 = [a1 getResourceValue:&v10 forKey:v2 error:&v9];
  id v4 = v10;
  id v5 = v9;
  if (v3)
  {
    uint64_t v6 = [v4 BOOLValue];
  }
  else
  {
    if (_CRKLogGeneral_onceToken_20 != -1) {
      dispatch_once(&_CRKLogGeneral_onceToken_20, &__block_literal_global_62);
    }
    v7 = (void *)_CRKLogGeneral_logObj_20;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_20, OS_LOG_TYPE_ERROR)) {
      [(NSURL(CRKAdditions) *)v7 crk_isBundle];
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)crk_isBundle
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = [a2 path];
  int v7 = 138543618;
  v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_224C00000, v5, OS_LOG_TYPE_ERROR, "Failed to check if %{public}@ is a directory. Error: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end