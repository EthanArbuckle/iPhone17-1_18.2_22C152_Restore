@interface UIImage(MessagesAdditions)
- (id)__ms_HEICData;
- (id)__ms_PNGData;
@end

@implementation UIImage(MessagesAdditions)

- (id)__ms_PNGData
{
  v2 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v3 = CGImageDestinationCreateWithData(v2, (CFStringRef)*MEMORY[0x1E4F22678], 1uLL, 0);
  if (v3)
  {
    v4 = v3;
    CGImageDestinationAddImage(v3, (CGImageRef)[a1 CGImage], 0);
    CGImageDestinationFinalize(v4);
    CFRelease(v4);
  }
  if ([(__CFData *)v2 length]) {
    v5 = (void *)[(__CFData *)v2 copy];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (id)__ms_HEICData
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = (__CFData *)objc_opt_new();
  CGImageDestinationRef v3 = CGImageDestinationCreateWithData(v2, @"public.heic", 1uLL, 0);
  if (v3)
  {
    v4 = v3;
    uint64_t v8 = *MEMORY[0x1E4F2F430];
    v9[0] = &unk_1F406F180;
    CFDictionaryRef v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    CGImageDestinationAddImage(v4, (CGImageRef)[a1 CGImage], v5);
    CGImageDestinationFinalize(v4);
    CFAutorelease(v4);
    v6 = (void *)[(__CFData *)v2 copy];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end