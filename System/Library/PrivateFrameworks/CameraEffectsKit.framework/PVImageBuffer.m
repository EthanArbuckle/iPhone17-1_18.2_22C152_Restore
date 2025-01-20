@interface PVImageBuffer
@end

@implementation PVImageBuffer

void __75__PVImageBuffer_JTAdditions__copyOfUIImageFromRectInPixels_atSizeInPixels___block_invoke()
{
  id v1 = [MEMORY[0x263F1C920] mainScreen];
  [v1 scale];
  copyOfUIImageFromRectInPixels_atSizeInPixels__screenScale = v0;
}

void __75__PVImageBuffer_JTAdditions__copyOfUIImageFromRectInPixels_atSizeInPixels___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (CGContext *)[v3 CGContext];
  v5 = [v3 format];
  [v5 bounds];
  CGFloat Height = CGRectGetHeight(v14);
  CGContextTranslateCTM(v4, 0.0, Height);

  CGContextScaleCTM((CGContextRef)[v3 CGContext], 1.0, -1.0);
  v7 = (CGContext *)[v3 CGContext];

  uint64_t v8 = a1[4];
  uint64_t v9 = a1[5];
  v10 = (CGImage *)a1[6];
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  CGContextDrawImage(v7, *(CGRect *)&v11, v10);
}

@end