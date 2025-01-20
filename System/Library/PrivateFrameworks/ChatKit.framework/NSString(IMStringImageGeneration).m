@interface NSString(IMStringImageGeneration)
- (id)__ck_generateImageForFont:()IMStringImageGeneration imageGenerationScale:;
- (id)__ck_generateImageForFontSize:()IMStringImageGeneration imageGenerationScale:;
@end

@implementation NSString(IMStringImageGeneration)

- (id)__ck_generateImageForFontSize:()IMStringImageGeneration imageGenerationScale:
{
  v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:a2 / a3];
  v6 = objc_msgSend(a1, "__ck_generateImageForFont:imageGenerationScale:", v5, a3);

  return v6;
}

- (id)__ck_generateImageForFont:()IMStringImageGeneration imageGenerationScale:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = *MEMORY[0x1E4FB06F8];
  v15[0] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v15 forKeys:&v14 count:1];

  [a1 sizeWithAttributes:v8];
  v17.width = v9 * a2;
  v17.height = v10 * a2;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  objc_msgSend(a1, "drawAtPoint:withAttributes:", v8, 0.0, 0.0);
  v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v12 = objc_msgSend(v11, "__ck_imageWithTrimmedTransparency");

  return v12;
}

@end