@interface TDTextureAsset
- (CGSize)sourceImageSizeWithDocument:(id)a3;
- (id)sourceImageWithDocument:(id)a3;
- (int)exifOrientation;
- (void)_logError:(id)a3;
- (void)setExifOrientation:(int)a3;
@end

@implementation TDTextureAsset

- (void)_logError:(id)a3
{
}

- (CGSize)sourceImageSizeWithDocument:(id)a3
{
  v21[3] = *MEMORY[0x263EF8340];
  *(_OWORD *)v19 = *MEMORY[0x263F001B0];
  CFURLRef v4 = [(TDAsset *)self fileURLWithDocument:a3];
  if ((int)[(TDAsset *)self scaleFactor] < 1) {
    unsigned int v5 = 72;
  }
  else {
    unsigned int v5 = 72 * [(TDAsset *)self scaleFactor];
  }
  unsigned int valuePtr = v5;
  CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  uint64_t v7 = *MEMORY[0x263F0F600];
  v20[0] = *MEMORY[0x263F0F5F0];
  v20[1] = v7;
  uint64_t v8 = *MEMORY[0x263EFFB38];
  v21[0] = v6;
  v21[1] = v8;
  v20[2] = *MEMORY[0x263F0F620];
  v21[2] = *MEMORY[0x263EFFB40];
  CFDictionaryRef v9 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  CFRelease(v6);
  v10 = CGImageSourceCreateWithURL(v4, 0);
  if (v10)
  {
    v11 = v10;
    CFDictionaryRef v12 = CGImageSourceCopyPropertiesAtIndex(v10, 0, v9);
    if (v12)
    {
      CFDictionaryRef v13 = v12;
      CFNumberRef number = 0;
      value = 0;
      if (CFDictionaryGetValueIfPresent(v12, (const void *)*MEMORY[0x263F0F4F8], (const void **)&value)
        && CFDictionaryGetValueIfPresent(v13, (const void *)*MEMORY[0x263F0F4F0], (const void **)&number))
      {
        CFNumberGetValue((CFNumberRef)value, kCFNumberCGFloatType, v19);
        CFNumberGetValue(number, kCFNumberCGFloatType, &v19[1]);
      }
      CFRelease(v13);
    }
    CFRelease(v11);
  }
  else
  {
    -[TDTextureAsset _logError:](self, "_logError:", [NSString stringWithFormat:@"Unable to get image dimensions for %@", v4]);
  }
  double v15 = v19[1];
  double v14 = v19[0];
  result.height = v15;
  result.width = v14;
  return result;
}

- (id)sourceImageWithDocument:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  CFURLRef v4 = [(TDAsset *)self fileURLWithDocument:a3];
  unsigned int v5 = CGImageSourceCreateWithURL(v4, 0);
  uint64_t v20 = *MEMORY[0x263F0F620];
  v21[0] = *MEMORY[0x263EFFB40];
  CFDictionaryRef v6 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  if (!v5) {
    goto LABEL_17;
  }
  CFDictionaryRef v7 = v6;
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, v6);
  if (!ImageAtIndex)
  {
    CFRelease(v5);
LABEL_17:
    -[TDTextureAsset _logError:](self, "_logError:", [NSString stringWithFormat:@"CoreThemeDefinition: Unable to create image for %@", v4]);
    return 0;
  }
  CFDictionaryRef v9 = ImageAtIndex;
  [(TDTextureAsset *)self setExifOrientation:1];
  unsigned int valuePtr = 0;
  CFDictionaryRef v10 = CGImageSourceCopyPropertiesAtIndex(v5, 0, v7);
  if (v10)
  {
    CFDictionaryRef v11 = v10;
    CFDictionaryRef v12 = (const void *)*MEMORY[0x263F0F4C8];
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x263F0F4C8]);
    if (Value)
    {
      if (CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr)) {
        uint64_t v14 = valuePtr;
      }
      else {
        uint64_t v14 = 1;
      }
      [(TDTextureAsset *)self setExifOrientation:v14];
    }
    CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(v11, v12);
    if (v15)
    {
      if (CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr)) {
        uint64_t v16 = valuePtr;
      }
      else {
        uint64_t v16 = 1;
      }
      [(TDTextureAsset *)self setExifOrientation:v16];
    }
    CFRelease(v11);
  }
  v17 = (void *)[MEMORY[0x263F38388] imageWithCGImage:v9];
  CGImageRelease(v9);
  CFRelease(v5);
  return v17;
}

- (int)exifOrientation
{
  return *(&self->super._scaleFactor + 1);
}

- (void)setExifOrientation:(int)a3
{
  *(&self->super._scaleFactor + 1) = a3;
}

@end