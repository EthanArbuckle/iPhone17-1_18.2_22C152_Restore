@interface CAMNebulaUtilities
+ (id)locationFromJPEGAtPath:(id)a3;
@end

@implementation CAMNebulaUtilities

+ (id)locationFromJPEGAtPath:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  v3 = [NSURL fileURLWithPath:a3];
  CFDataRef v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v3 options:1 error:0];
  if ([(__CFData *)v4 length])
  {
    uint64_t v5 = [(id)*MEMORY[0x263F1DB40] identifier];
    v6 = v5;
    if (v5)
    {
      uint64_t v13 = *MEMORY[0x263F0F640];
      v14[0] = v5;
      CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    }
    else
    {
      CFDictionaryRef v7 = 0;
    }
    v9 = CGImageSourceCreateWithData(v4, v7);
    if (v9)
    {
      v10 = v9;
      v11 = CGImageSourceCopyPropertiesAtIndex(v9, 0, 0);
      v8 = [MEMORY[0x263F5DB38] locationFromImageProperties:v11];
      CFRelease(v10);
    }
    else
    {
      v11 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[CAMNebulaUtilities locationFromJPEGAtPath:](v3);
      }
      v8 = 0;
    }
  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[CAMNebulaUtilities locationFromJPEGAtPath:](v3);
    }
    v8 = 0;
  }

  return v8;
}

+ (void)locationFromJPEGAtPath:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 path];
  OUTLINED_FUNCTION_0(&dword_2099F8000, v2, v3, "locationFromJPEGAtPath: Unable to read data from file '%{public}@'.", v4, v5, v6, v7, 2u);
}

+ (void)locationFromJPEGAtPath:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 path];
  OUTLINED_FUNCTION_0(&dword_2099F8000, v2, v3, "Unable to create image source for '%{public}@'.", v4, v5, v6, v7, 2u);
}

@end