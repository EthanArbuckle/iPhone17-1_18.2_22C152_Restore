@interface NSDictionary(Exif)
+ (CFDictionaryRef)vcp_exifFromImageURL:()Exif;
- (float)vcp_scaledExposureTime;
- (id)vcp_captureDeviceMake;
- (id)vcp_captureDeviceModel;
- (uint64_t)vcp_flashFired;
- (uint64_t)vcp_isAppleCapture;
@end

@implementation NSDictionary(Exif)

+ (CFDictionaryRef)vcp_exifFromImageURL:()Exif
{
  v10[1] = *MEMORY[0x1E4F143B8];
  CFURLRef v3 = a3;
  CFURLRef v4 = v3;
  if (v3 && (v5 = CGImageSourceCreateWithURL(v3, 0)) != 0)
  {
    uint64_t v9 = *MEMORY[0x1E4F2FF08];
    v10[0] = MEMORY[0x1E4F1CC28];
    CFDictionaryRef v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(v5, 0, v6);
    CFRelease(v5);
  }
  else
  {
    CFDictionaryRef v7 = 0;
  }

  return v7;
}

- (float)vcp_scaledExposureTime
{
  v2 = [a1 objectForKey:*MEMORY[0x1E4F2F800]];
  CFURLRef v3 = v2;
  float v4 = -1.0;
  if (v2)
  {
    uint64_t v5 = *MEMORY[0x1E4F2F828];
    CFDictionaryRef v6 = [v2 objectForKey:*MEMORY[0x1E4F2F828]];

    if (v6)
    {
      CFDictionaryRef v7 = [v3 objectForKey:v5];
      [v7 floatValue];
      float v4 = v8;
    }
  }
  uint64_t v9 = [a1 objectForKey:*MEMORY[0x1E4F2FC20]];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 objectForKey:VCPAppleMakerNote_SISMethod];
    v12 = v11;
    if (v11)
    {
      int v13 = [v11 intValue];
      if (v13 > 4370)
      {
        if (v13 != 4627 && v13 != 4371) {
          goto LABEL_16;
        }
      }
      else if (v13 != 275 && v13 != 531)
      {
        goto LABEL_16;
      }
      float v4 = v4 * 0.125;
    }
LABEL_16:
  }
  return v4;
}

- (uint64_t)vcp_flashFired
{
  v1 = [a1 objectForKey:*MEMORY[0x1E4F2F800]];
  v2 = v1;
  if (v1
    && (uint64_t v3 = *MEMORY[0x1E4F2F838],
        [v1 objectForKey:*MEMORY[0x1E4F2F838]],
        float v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    uint64_t v5 = [v2 objectForKey:v3];
    char v6 = [v5 intValue];

    uint64_t v7 = v6 & 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)vcp_captureDeviceMake
{
  v1 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F2FD60]];

  return v2;
}

- (id)vcp_captureDeviceModel
{
  v1 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F2FD68]];

  return v2;
}

- (uint64_t)vcp_isAppleCapture
{
  v1 = objc_msgSend(a1, "vcp_captureDeviceMake");
  uint64_t v2 = [v1 isEqualToString:@"Apple"];

  return v2;
}

@end