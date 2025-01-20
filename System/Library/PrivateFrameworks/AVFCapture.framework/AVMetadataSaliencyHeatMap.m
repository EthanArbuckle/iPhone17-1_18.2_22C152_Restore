@interface AVMetadataSaliencyHeatMap
+ (id)saliencyHeatMapWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5;
- (AVMetadataSaliencyHeatMap)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6;
- (AVMetadataSaliencyHeatMap)initWithHeatMap:(id)a3 width:(int64_t)a4 height:(int64_t)a5 bytesPerRow:(int64_t)a6 time:(id *)a7 duration:(id *)a8 bounds:(CGRect)a9 optionalInfoDict:(id)a10 originalMetadataObject:(id)a11 sourceCaptureInput:(id)a12;
- (NSData)heatMap;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
- (int64_t)bytesPerRow;
- (int64_t)height;
- (int64_t)width;
- (void)dealloc;
@end

@implementation AVMetadataSaliencyHeatMap

+ (id)saliencyHeatMapWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFigEmbeddedCaptureDeviceObjectDictionary:a3 input:a4 timeStamp:a5 type:@"saliencyHeatMap"];

  return v5;
}

- (AVMetadataSaliencyHeatMap)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6
{
  long long v20 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&v26.value = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v10 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v26.epoch = v10;
  v11 = (double *)MEMORY[0x1E4F1DB28];
  if (a5)
  {
    [a5 longLongValue];
    int64_t v12 = FigHostTimeToNanoseconds();
    CMTimeMake(&v26, v12, 1000000000);
  }
  double x = *v11;
  double y = v11[1];
  double width = v11[2];
  double height = v11[3];
  CFDictionaryRef v17 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F523F8], v20);
  if (v17)
  {
    memset(&rect, 0, sizeof(rect));
    if (CGRectMakeWithDictionaryRepresentation(v17, &rect))
    {
      double x = rect.origin.x;
      double y = rect.origin.y;
      double width = rect.size.width;
      double height = rect.size.height;
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)AVMetadataSaliencyHeatMap;
  rect.origin = *(CGPoint *)&v26.value;
  *(void *)&rect.size.double width = v26.epoch;
  long long v22 = v21;
  CMTimeEpoch v23 = v10;
  v18 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v24, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, a6, &rect, &v22, 0, 0, a4, x, y, width, height);
  if (v18)
  {
    v18->_bytesPerRow = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52460]), "integerValue");
    v18->_double width = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52478]), "integerValue");
    v18->_double height = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F52468]), "integerValue");
    v18->_heatMap = (NSData *)(id)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52470]];
  }
  return v18;
}

- (AVMetadataSaliencyHeatMap)initWithHeatMap:(id)a3 width:(int64_t)a4 height:(int64_t)a5 bytesPerRow:(int64_t)a6 time:(id *)a7 duration:(id *)a8 bounds:(CGRect)a9 optionalInfoDict:(id)a10 originalMetadataObject:(id)a11 sourceCaptureInput:(id)a12
{
  v20.receiver = self;
  v20.super_class = (Class)AVMetadataSaliencyHeatMap;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = *a7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = *a8;
  v16 = [(AVMetadataObject *)&v20 initWithType:@"saliencyHeatMap", &v19, &v18, a10, a11, a12, a9.origin.x, a9.origin.y, a9.size.width, a9.size.height time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
  if (v16)
  {
    v16->_heatMap = (NSData *)a3;
    v16->_double width = a4;
    v16->_double height = a5;
    v16->_bytesPerRow = a6;
  }
  return v16;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v24.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v24.size = v9;
  [a3 bounds];
  long long v10 = *(_OWORD *)&a4->c;
  v23[0] = *(_OWORD *)&a4->a;
  v23[1] = v10;
  v23[2] = *(_OWORD *)&a4->tx;
  if (AVMetadataObjectAdjustBaseClassProperties((uint64_t)v23, &v24, v11, v12, v13, v14))
  {
    uint64_t v15 = [a3 heatMap];
    uint64_t v16 = [a3 width];
    uint64_t v17 = [a3 height];
    uint64_t v18 = [a3 bytesPerRow];
    if (a3)
    {
      [a3 time];
      [a3 duration];
    }
    else
    {
      memset(v22, 0, sizeof(v22));
      memset(v21, 0, sizeof(v21));
    }
    uint64_t v20 = [a3 input];
    return -[AVMetadataSaliencyHeatMap initWithHeatMap:width:height:bytesPerRow:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithHeatMap:width:height:bytesPerRow:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", v15, v16, v17, v18, v22, v21, *(_OWORD *)&v24.origin, *(_OWORD *)&v24.size, 0, a3, v20);
  }
  else
  {

    return 0;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataSaliencyHeatMap;
  [(AVMetadataObject *)&v3 dealloc];
}

- (int64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (int64_t)width
{
  return self->_width;
}

- (int64_t)height
{
  return self->_height;
}

- (NSData)heatMap
{
  return self->_heatMap;
}

@end