@interface AVMetadataSalientObject
+ (AVMetadataSalientObject)salientObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5;
- (AVMetadataSalientObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6;
- (AVMetadataSalientObject)initWithObjectID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6;
- (AVMetadataSalientObject)initWithObjectID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9;
- (NSInteger)objectID;
- (id)description;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
@end

@implementation AVMetadataSalientObject

+ (AVMetadataSalientObject)salientObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFigEmbeddedCaptureDeviceObjectDictionary:a3 input:a4 timeStamp:a5 type:@"salientObject"];

  return (AVMetadataSalientObject *)v5;
}

- (AVMetadataSalientObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6
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
  v24.super_class = (Class)AVMetadataSalientObject;
  rect.origin = *(CGPoint *)&v26.value;
  *(void *)&rect.size.double width = v26.epoch;
  long long v22 = v21;
  CMTimeEpoch v23 = v10;
  v18 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v24, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, a6, &rect, &v22, a3, 0, a4, x, y, width, height);
  if (v18) {
    v18->_objectID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F522C8]), "integerValue");
  }
  return v18;
}

- (AVMetadataSalientObject)initWithObjectID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a5;
  return -[AVMetadataSalientObject initWithObjectID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithObjectID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", a3, &v8, &v7, 0, 0, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (AVMetadataSalientObject)initWithObjectID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9
{
  v13.receiver = self;
  v13.super_class = (Class)AVMetadataSalientObject;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a5;
  result = [(AVMetadataObject *)&v13 initWithType:@"salientObject", &v12, &v11, a7, a8, a9, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
  if (result) {
    result->_objectID = a3;
  }
  return result;
}

- (id)description
{
  [(AVMetadataObject *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = (void *)MEMORY[0x1E4F28E78];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = (objc_class *)objc_opt_class();
  objc_super v13 = (void *)[v11 stringWithFormat:@"<%@: %p, objectID=%d, bounds={%.1f,%.1f %.1fx%.1f}", NSStringFromClass(v12), self, -[AVMetadataSalientObject objectID](self, "objectID"), v4, v6, v8, v10];
  if (self)
  {
    [(AVMetadataObject *)self time];
    uint64_t v14 = v16;
  }
  else
  {
    uint64_t v14 = 0;
  }
  [v13 appendFormat:@", time=%lld", v14];
  [v13 appendString:@">"];
  return v13;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v25.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v25.size = v9;
  [a3 bounds];
  long long v10 = *(_OWORD *)&a4->c;
  v24[0] = *(_OWORD *)&a4->a;
  v24[1] = v10;
  v24[2] = *(_OWORD *)&a4->tx;
  if (AVMetadataObjectAdjustBaseClassProperties((uint64_t)v24, &v25, v11, v12, v13, v14))
  {
    uint64_t v15 = [a3 objectID];
    if (a3)
    {
      [a3 time];
      [a3 duration];
    }
    else
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v18 = 0;
    }
    uint64_t v17 = objc_msgSend(a3, "input", v18, v19, v20, v21, v22, v23);
    return -[AVMetadataSalientObject initWithObjectID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithObjectID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", v15, &v21, &v18, 0, a3, v17, *(_OWORD *)&v25.origin, *(_OWORD *)&v25.size);
  }
  else
  {

    return 0;
  }
}

- (NSInteger)objectID
{
  return self->_objectID;
}

@end