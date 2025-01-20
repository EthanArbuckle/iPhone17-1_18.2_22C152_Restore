@interface AVMetadataBodyObject
- (AVMetadataBodyObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6;
- (AVMetadataBodyObject)initWithType:(id)a3 bodyID:(int64_t)a4 time:(id *)a5 duration:(id *)a6 bounds:(CGRect)a7 optionalInfoDict:(id)a8 originalMetadataObject:(id)a9 sourceCaptureInput:(id)a10;
- (NSInteger)bodyID;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6 type:(id)a7 bodyID:(int64_t)a8;
@end

@implementation AVMetadataBodyObject

- (AVMetadataBodyObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6
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
  v24.super_class = (Class)AVMetadataBodyObject;
  rect.origin = *(CGPoint *)&v26.value;
  *(void *)&rect.size.double width = v26.epoch;
  long long v22 = v21;
  CMTimeEpoch v23 = v10;
  v18 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v24, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, a6, &rect, &v22, a3, 0, a4, x, y, width, height);
  if (v18) {
    v18->_bodyID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F522C8]), "integerValue");
  }
  return v18;
}

- (AVMetadataBodyObject)initWithType:(id)a3 bodyID:(int64_t)a4 time:(id *)a5 duration:(id *)a6 bounds:(CGRect)a7 optionalInfoDict:(id)a8 originalMetadataObject:(id)a9 sourceCaptureInput:(id)a10
{
  v14.receiver = self;
  v14.super_class = (Class)AVMetadataBodyObject;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a6;
  result = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v14, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, a3, &v13, &v12, a8, a9, a10, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height);
  if (result) {
    result->_bodyID = a4;
  }
  return result;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6 type:(id)a7 bodyID:(int64_t)a8
{
  long long v29 = 0uLL;
  uint64_t v30 = 0;
  if (a3)
  {
    objc_msgSend(a3, "time", a3, a4, a5, a6);
    long long v27 = 0uLL;
    uint64_t v28 = 0;
    [a3 duration];
  }
  else
  {
    long long v27 = 0uLL;
    uint64_t v28 = 0;
  }
  CGSize v13 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v26.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v26.size = v13;
  [a3 bounds];
  long long v14 = *(_OWORD *)&a4->c;
  long long v23 = *(_OWORD *)&a4->a;
  long long v24 = v14;
  long long v25 = *(_OWORD *)&a4->tx;
  if (AVMetadataObjectAdjustBaseClassProperties((uint64_t)&v23, &v26, v15, v16, v17, v18))
  {
    uint64_t v19 = [a3 input];
    long long v23 = v29;
    *(void *)&long long v24 = v30;
    long long v21 = v27;
    uint64_t v22 = v28;
    return -[AVMetadataBodyObject initWithType:bodyID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithType:bodyID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", a7, a8, &v23, &v21, 0, a3, *(_OWORD *)&v26.origin, *(_OWORD *)&v26.size, v19);
  }
  else
  {

    return 0;
  }
}

- (NSInteger)bodyID
{
  return self->_bodyID;
}

@end