@interface UIImage(MediaControls)
- (UIImage)mru_imageFittingSize:()MediaControls;
@end

@implementation UIImage(MediaControls)

- (UIImage)mru_imageFittingSize:()MediaControls
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if ([(UIImage *)a1 isSymbolImage])
  {
    v6 = a1;
  }
  else
  {
    if (a2 < a3) {
      a2 = a3;
    }
    v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
    double v9 = v8;

    v10 = UIImagePNGRepresentation(a1);
    uint64_t v21 = *MEMORY[0x1E4F2FF08];
    v22[0] = MEMORY[0x1E4F1CC28];
    v11 = CGImageSourceCreateWithData((CFDataRef)v10, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1]);
    uint64_t v12 = *MEMORY[0x1E4F2FF18];
    v19[0] = *MEMORY[0x1E4F2FE28];
    v19[1] = v12;
    v20[0] = MEMORY[0x1E4F1CC38];
    v20[1] = MEMORY[0x1E4F1CC38];
    uint64_t v13 = *MEMORY[0x1E4F2FE48];
    v20[2] = MEMORY[0x1E4F1CC38];
    uint64_t v14 = *MEMORY[0x1E4F2FF68];
    v19[2] = v13;
    v19[3] = v14;
    v15 = [NSNumber numberWithDouble:a2 * v9];
    v20[3] = v15;
    CFDictionaryRef v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];

    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v11, 0, v16);
    v6 = [MEMORY[0x1E4FB1818] imageWithCGImage:ThumbnailAtIndex];
    CGImageRelease(ThumbnailAtIndex);
    CFRelease(v11);
  }

  return v6;
}

@end