@interface AVMetadataVideoPreviewHistogramObject
+ (id)videoPreviewHistogramObjectWithLumaHistogramData:(id)a3 input:(id)a4 time:(id *)a5;
- (AVMetadataVideoPreviewHistogramObject)initWithLumaHistogramData:(id)a3 time:(id *)a4 sourceCaptureInput:(id)a5;
- (NSData)lumaHistogramData;
- (id)description;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
- (unint64_t)lumaHistogramBinCount;
- (void)dealloc;
@end

@implementation AVMetadataVideoPreviewHistogramObject

+ (id)videoPreviewHistogramObjectWithLumaHistogramData:(id)a3 input:(id)a4 time:(id *)a5
{
  id v8 = objc_alloc((Class)objc_opt_class());
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a5;
  return (id)[v8 initWithLumaHistogramData:a3 time:&v10 sourceCaptureInput:a4];
}

- (AVMetadataVideoPreviewHistogramObject)initWithLumaHistogramData:(id)a3 time:(id *)a4 sourceCaptureInput:(id)a5
{
  long long v12 = *MEMORY[0x1E4F1F9F8];
  uint64_t v13 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v15.receiver = self;
  v15.super_class = (Class)AVMetadataVideoPreviewHistogramObject;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [(AVMetadataObject *)&v15 initWithType:@"videoPreviewHistogram", &v14, &v12, 0, 0, a5, v6, v7, v8, v9 time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
  if (v10) {
    v10->_lumaHistogramData = (NSData *)a3;
  }
  return v10;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  uint64_t v8 = objc_msgSend(a3, "lumaHistogramData", a6);
  if (a3) {
    [a3 time];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  return -[AVMetadataVideoPreviewHistogramObject initWithLumaHistogramData:time:sourceCaptureInput:](self, "initWithLumaHistogramData:time:sourceCaptureInput:", v8, v10, [a3 input]);
}

- (unint64_t)lumaHistogramBinCount
{
  return [(NSData *)self->_lumaHistogramData length] >> 2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataVideoPreviewHistogramObject;
  [(AVMetadataObject *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  lumaHistogramData = self->_lumaHistogramData;
  unint64_t v7 = [(AVMetadataVideoPreviewHistogramObject *)self lumaHistogramBinCount];
  [(AVMetadataObject *)self time];
  return (id)[v3 stringWithFormat:@"<%@: %p, lumaHistogramData: %@, lumaHistogramBinCount: %lu, time=%lld>", v5, self, lumaHistogramData, v7, v9];
}

- (NSData)lumaHistogramData
{
  return self->_lumaHistogramData;
}

@end