@interface BLTImageAttachmentInfo
+ (id)imageAttachmentInfoForImageURL:(id)a3;
- (CGSize)size;
- (NSString)contentType;
- (void)setContentType:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation BLTImageAttachmentInfo

+ (id)imageAttachmentInfoForImageURL:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  CFURLRef v3 = (const __CFURL *)a3;
  v4 = objc_opt_new();
  v5 = [(id)*MEMORY[0x263F1DC08] identifier];
  [v4 setContentType:v5];

  CGImageSourceRef v6 = CGImageSourceCreateWithURL(v3, 0);
  if (v6)
  {
    v7 = v6;
    uint64_t v17 = *MEMORY[0x263F0F600];
    v18[0] = MEMORY[0x263EFFA80];
    CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    CFDictionaryRef v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, v8);
    if (v9)
    {
      CFDictionaryRef v10 = v9;
      v11 = CFDictionaryGetValue(v9, (const void *)*MEMORY[0x263F0F458]);
      if (([v11 BOOLValue] & 1) == 0)
      {
        v12 = [(id)*MEMORY[0x263F1DB40] identifier];
        [v4 setContentType:v12];
      }
      v13 = CFDictionaryGetValue(v10, (const void *)*MEMORY[0x263F0F4F0]);
      v14 = CFDictionaryGetValue(v10, (const void *)*MEMORY[0x263F0F4F8]);
      objc_msgSend(v4, "setSize:", (double)(int)objc_msgSend(v14, "intValue"), (double)(int)objc_msgSend(v13, "intValue"));
      CFRelease(v10);
      CFRelease(v7);
      id v15 = v4;
    }
    else
    {
      v11 = blt_ids_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[BLTImageAttachmentInfo imageAttachmentInfoForImageURL:]((uint64_t)v3, v11);
      }
      id v15 = 0;
    }
  }
  else
  {
    blt_ids_log();
    CFDictionaryRef v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      +[BLTImageAttachmentInfo imageAttachmentInfoForImageURL:]((uint64_t)v3, v8);
    }
    id v15 = 0;
  }

  return v15;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
}

+ (void)imageAttachmentInfoForImageURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "BLTImageAttachmentInfo CGImageSourceCreateWithURL failed for: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)imageAttachmentInfoForImageURL:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "BLTImageAttachmentInfo CGImageSourceCopyPropertiesAtIndex failed for: %@", (uint8_t *)&v2, 0xCu);
}

@end