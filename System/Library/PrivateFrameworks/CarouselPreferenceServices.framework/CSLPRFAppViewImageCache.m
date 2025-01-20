@interface CSLPRFAppViewImageCache
+ (id)getImageForLauncherMode:(int64_t)a3;
+ (void)storeImage:(id)a3 forLauncherMode:(int64_t)a4;
@end

@implementation CSLPRFAppViewImageCache

+ (id)getImageForLauncherMode:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = CSLPRFCachedAppViewImageURL(a3);
  if (!v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_ERROR, ">>>> no path for app view image", (uint8_t *)&v8, 2u);
    }
    goto LABEL_10;
  }
  uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v3];
  if (!v4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, ">>>> could not read from %@", (uint8_t *)&v8, 0xCu);
    }
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  v5 = (void *)v4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_INFO, ">>>> read data from %@", (uint8_t *)&v8, 0xCu);
  }
  v6 = [MEMORY[0x263F827E8] imageWithData:v5 scale:2.0];

LABEL_11:
  return v6;
}

+ (void)storeImage:(id)a3 forLauncherMode:(int64_t)a4
{
  image = (UIImage *)a3;
  v5 = CSLPRFCachedAppViewImageURL(a4);
  if (v5)
  {
    v6 = UIImagePNGRepresentation(image);
    [v6 writeToURL:v5 atomically:1];
  }
}

@end