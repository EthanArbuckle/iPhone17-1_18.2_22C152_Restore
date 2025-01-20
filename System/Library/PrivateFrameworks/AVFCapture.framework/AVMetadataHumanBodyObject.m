@interface AVMetadataHumanBodyObject
+ (AVMetadataHumanBodyObject)humanBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5;
- (AVMetadataHumanBodyObject)initWithBodyID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6;
- (AVMetadataHumanBodyObject)initWithBodyID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9;
- (AVMetadataHumanBodyObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5;
- (BOOL)hasConfidence;
- (double)confidence;
- (id)description;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
@end

@implementation AVMetadataHumanBodyObject

+ (AVMetadataHumanBodyObject)humanBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFigEmbeddedCaptureDeviceObjectDictionary:a3 input:a4 timeStamp:a5];

  return (AVMetadataHumanBodyObject *)v5;
}

- (AVMetadataHumanBodyObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AVMetadataHumanBodyObject;
  v6 = [(AVMetadataBodyObject *)&v9 initWithFigEmbeddedCaptureDeviceObjectDictionary:a3 input:a4 timeStamp:a5 type:@"humanBody"];
  if (v6)
  {
    v7 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52390]];
    if (v7)
    {
      v6->_hasConfidence = 1;
      v6->_confidence = (float)((float)(int)[v7 intValue] / 1000.0);
    }
  }
  return v6;
}

- (AVMetadataHumanBodyObject)initWithBodyID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a5;
  return -[AVMetadataHumanBodyObject initWithBodyID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithBodyID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", a3, &v8, &v7, 0, 0, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (AVMetadataHumanBodyObject)initWithBodyID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9
{
  v12.receiver = self;
  v12.super_class = (Class)AVMetadataHumanBodyObject;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a5;
  return [(AVMetadataBodyObject *)&v12 initWithType:@"humanBody", a3, &v11, &v10, a7, a8, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a9 bodyID time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
}

- (id)description
{
  [(AVMetadataObject *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = (void *)MEMORY[0x1E4F28E78];
  objc_super v12 = (objc_class *)objc_opt_class();
  v13 = (void *)[v11 stringWithFormat:@"<%@: %p, bodyID=%d, bounds={%.1f,%.1f %.1fx%.1f}", NSStringFromClass(v12), self, -[AVMetadataBodyObject bodyID](self, "bodyID"), v4, v6, v8, v10];
  if ([(AVMetadataHumanBodyObject *)self hasConfidence])
  {
    [(AVMetadataHumanBodyObject *)self confidence];
    [v13 appendFormat:@", confidence=(%f)", v14];
  }
  if (self)
  {
    [(AVMetadataObject *)self time];
    uint64_t v15 = v17;
  }
  else
  {
    uint64_t v15 = 0;
  }
  [v13 appendFormat:@", time=%lld", v15];
  [v13 appendString:@">"];
  return v13;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  BOOL v7 = a5;
  uint64_t v11 = [a3 bodyID];
  v17.receiver = self;
  v17.super_class = (Class)AVMetadataHumanBodyObject;
  long long v12 = *(_OWORD *)&a4->c;
  v16[0] = *(_OWORD *)&a4->a;
  v16[1] = v12;
  v16[2] = *(_OWORD *)&a4->tx;
  v13 = [(AVMetadataBodyObject *)&v17 initDerivedMetadataObjectFromMetadataObject:a3 withTransform:v16 isVideoMirrored:v7 rollAdjustment:@"humanBody" type:v11 bodyID:a6];
  if (v13)
  {
    v13[24] = [a3 hasConfidence];
    [a3 confidence];
    *((void *)v13 + 4) = v14;
  }
  return v13;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (double)confidence
{
  return self->_confidence;
}

@end