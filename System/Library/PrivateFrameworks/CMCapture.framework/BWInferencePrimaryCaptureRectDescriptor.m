@interface BWInferencePrimaryCaptureRectDescriptor
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)maxCropForDimensions:(id)a3;
- (BOOL)applicableToSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaKey:(id)a4;
- (CGRect)rectForSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (char)identifier;
@end

@implementation BWInferencePrimaryCaptureRectDescriptor

- (char)identifier
{
  return 2;
}

- ($2825F4736939C4A6D3AD43837233062D)maxCropForDimensions:(id)a3
{
  double var0 = (double)a3.var0;
  double var1 = (double)a3.var1;
  if (a3.var0 <= a3.var1) {
    float v5 = 0.5625;
  }
  else {
    float v5 = 1.7778;
  }
  double v6 = FigCaptureMetadataUtilitiesRectWithAspectRatioInsideDimensions((double)a3.var0, (double)a3.var1, v5);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  v22.origin.x = FigCaptureMetadataUtilitiesRectWithAspectRatioInsideDimensions(var0, var1, 1.0);
  v22.origin.y = v13;
  v22.size.width = v14;
  v22.size.height = v15;
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  CGRect v21 = CGRectUnion(v20, v22);
  LODWORD(v16) = vcvtpd_s64_f64(v21.size.width);
  LODWORD(v17) = vcvtpd_s64_f64(v21.size.height);
  return ($2825F4736939C4A6D3AD43837233062D)(v16 | (v17 << 32));
}

- (BOOL)applicableToSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaKey:(id)a4
{
  return 1;
}

+ (void)initialize
{
}

- (CGRect)rectForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  v9.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v9.size = v3;
  CFDictionaryRef v4 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530D0], 0);
  if (v4) {
    CGRectMakeWithDictionaryRepresentation(v4, &v9);
  }
  double y = v9.origin.y;
  double x = v9.origin.x;
  double height = v9.size.height;
  double width = v9.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end