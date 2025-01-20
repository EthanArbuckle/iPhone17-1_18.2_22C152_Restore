@interface PKMetalUtility
+ (BOOL)deviceSupportsFramebufferFetch:(id)a3;
+ (BOOL)deviceSupportsMemorylessFramebuffers:(id)a3;
+ (BOOL)isMetalAvailable;
+ (CGAffineTransform)transformConvertingRect:(SEL)a3 toRect:(CGRect)a4 percent:(CGRect)a5;
+ (CGSize)clampedPixelSize:(CGSize)a3;
+ (double)layerContentsScale;
+ (id)defaultDevice;
+ (id)textureFromImage:(CGImage *)a3 device:(id)a4;
@end

@implementation PKMetalUtility

+ (CGSize)clampedPixelSize:(CGSize)a3
{
  if (a3.width > 8192.0)
  {
    a3.height = round(a3.height * 8192.0 / a3.width);
    a3.width = 8192.0;
  }
  if (a3.height > 8192.0)
  {
    a3.width = round(a3.width * 8192.0 / a3.height);
    a3.height = 8192.0;
  }
  double v3 = round(a3.width);
  if (v3 < 1.0) {
    double v3 = 1.0;
  }
  double v4 = round(a3.height);
  if (v4 < 1.0) {
    double v4 = 1.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

+ (double)layerContentsScale
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 nativeScale];
  double v4 = v3;

  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 bundleIdentifier];
  char v7 = [v6 isEqualToString:@"com.apple.PaperKit.MarkupPhotoEditingExtension"];

  if ((v7 & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B50] mainBundle];
    v9 = [v8 bundleIdentifier];
    if ([v9 isEqualToString:@"com.apple.quicklook.extension.previewUI"])
    {
    }
    else
    {
      v10 = [MEMORY[0x1E4F28B50] mainBundle];
      v11 = [v10 bundleIdentifier];
      int v12 = [v11 isEqualToString:@"com.apple.quicklook.UIExtension"];

      if (!v12) {
        return v4;
      }
    }
  }
  if (PKIsPhoneDevice() && v4 > 2.0) {
    return 2.0;
  }
  return v4;
}

+ (BOOL)isMetalAvailable
{
  return 1;
}

+ (id)defaultDevice
{
  id v2 = MTLCreateSystemDefaultDevice();

  return v2;
}

+ (BOOL)deviceSupportsFramebufferFetch:(id)a3
{
  return [a3 supportsFamily:1001];
}

+ (BOOL)deviceSupportsMemorylessFramebuffers:(id)a3
{
  return [a3 supportsFamily:1001];
}

+ (id)textureFromImage:(CGImage *)a3 device:(id)a4
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F353B8];
  id v6 = a4;
  char v7 = (void *)[[v5 alloc] initWithDevice:v6];

  uint64_t v8 = *MEMORY[0x1E4F35388];
  v13[0] = *MEMORY[0x1E4F35390];
  v13[1] = v8;
  v14[0] = &unk_1F200E580;
  v14[1] = &unk_1F200E598;
  v13[2] = *MEMORY[0x1E4F35370];
  v14[2] = MEMORY[0x1E4F1CC28];
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  uint64_t v12 = 0;
  v10 = (void *)[v7 newTextureWithCGImage:a3 options:v9 error:&v12];

  return v10;
}

+ (CGAffineTransform)transformConvertingRect:(SEL)a3 toRect:(CGRect)a4 percent:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double v8 = a4.size.height;
  double v9 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v13 = DKDSubtractPoints(a5.origin.x, a5.origin.y, a4.origin.x);
  double v15 = DKDMultiplyPointScalar(v13, v14, a6);
  uint64_t v16 = MEMORY[0x1E4F1DAB8];
  long long v17 = *MEMORY[0x1E4F1DAB8];
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v18;
  long long v19 = *(_OWORD *)(v16 + 32);
  *(_OWORD *)&retstr->tdouble x = v19;
  *(_OWORD *)&v29.a = v17;
  *(_OWORD *)&v29.c = v18;
  *(_OWORD *)&v29.tdouble x = v19;
  CGAffineTransformTranslate(retstr, &v29, v15, v20);
  long long v21 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v28.c = v21;
  *(_OWORD *)&v28.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v29, &v28, x, y);
  long long v22 = *(_OWORD *)&v29.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
  *(_OWORD *)&retstr->c = v22;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v29.tx;
  long long v23 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v28.c = v23;
  *(_OWORD *)&v28.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformScale(&v29, &v28, 1.0 - a6 + width / v9 * a6, 1.0 - a6 + height / v8 * a6);
  long long v24 = *(_OWORD *)&v29.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
  *(_OWORD *)&retstr->c = v24;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v29.tx;
  long long v25 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v28.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v28.c = v25;
  *(_OWORD *)&v28.tdouble x = *(_OWORD *)&retstr->tx;
  CGSize result = CGAffineTransformTranslate(&v29, &v28, -x, -y);
  long long v27 = *(_OWORD *)&v29.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v29.a;
  *(_OWORD *)&retstr->c = v27;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v29.tx;
  return result;
}

@end