@interface PVImageBuffer(JTAdditions)
- (uint64_t)copyOfUIImage;
- (uint64_t)copyOfUIImage:()JTAdditions;
- (uint64_t)copyOfUIImageFromRectInPixels:()JTAdditions atSizeInPixels:;
@end

@implementation PVImageBuffer(JTAdditions)

- (uint64_t)copyOfUIImage
{
  v1 = [a1 uiImage];
  if (!v1) {
    return 0;
  }
  v2 = v1;
  v3 = UIImagePNGRepresentation(v1);
  uint64_t v4 = [MEMORY[0x263F1C6B0] imageWithData:v3];

  return v4;
}

- (uint64_t)copyOfUIImage:()JTAdditions
{
  v9 = (CGImage *)[a1 cgImage];
  if (!v9) {
    return 0;
  }
  v15.origin.x = a2;
  v15.origin.y = a3;
  v15.size.width = a4;
  v15.size.height = a5;
  v10 = CGImageCreateWithImageInRect(v9, v15);
  v11 = [MEMORY[0x263F1C6B0] imageWithCGImage:v10];
  CGImageRelease(v10);
  v12 = UIImagePNGRepresentation(v11);
  uint64_t v13 = [MEMORY[0x263F1C6B0] imageWithData:v12];

  return v13;
}

- (uint64_t)copyOfUIImageFromRectInPixels:()JTAdditions atSizeInPixels:
{
  uint64_t v13 = (CGImage *)[a1 cgImage];
  if (!v13) {
    return 0;
  }
  v22.origin.x = a2;
  v22.origin.y = a3;
  v22.size.width = a4;
  v22.size.height = a5;
  v14 = CGImageCreateWithImageInRect(v13, v22);
  if (copyOfUIImageFromRectInPixels_atSizeInPixels__onceToken != -1) {
    dispatch_once(&copyOfUIImageFromRectInPixels_atSizeInPixels__onceToken, &__block_literal_global_58);
  }
  double v15 = a6 / *(double *)&copyOfUIImageFromRectInPixels_atSizeInPixels__screenScale;
  double v16 = a7 / *(double *)&copyOfUIImageFromRectInPixels_atSizeInPixels__screenScale;
  v17 = [MEMORY[0x263F1C688] defaultFormat];
  [v17 setOpaque:0];
  [v17 setPreferredRange:2];
  [v17 setScale:*(double *)&copyOfUIImageFromRectInPixels_atSizeInPixels__screenScale];
  v18 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithBounds:format:", v17, 0.0, 0.0, v15, v16);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __75__PVImageBuffer_JTAdditions__copyOfUIImageFromRectInPixels_atSizeInPixels___block_invoke_2;
  v21[3] = &__block_descriptor_56_e35_v16__0__UIGraphicsRendererContext_8l;
  *(double *)&v21[4] = v15;
  *(double *)&v21[5] = v16;
  v21[6] = v14;
  uint64_t v19 = [v18 imageWithActions:v21];
  CGImageRelease(v14);

  return v19;
}

@end