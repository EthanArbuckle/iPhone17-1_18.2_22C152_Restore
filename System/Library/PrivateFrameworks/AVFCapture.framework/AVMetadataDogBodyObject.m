@interface AVMetadataDogBodyObject
+ (AVMetadataDogBodyObject)dogBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5;
- (AVMetadataDogBodyObject)initWithBodyID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6;
- (AVMetadataDogBodyObject)initWithBodyID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9;
- (AVMetadataDogBodyObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5;
- (id)description;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
@end

@implementation AVMetadataDogBodyObject

+ (AVMetadataDogBodyObject)dogBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFigEmbeddedCaptureDeviceObjectDictionary:a3 input:a4 timeStamp:a5];

  return (AVMetadataDogBodyObject *)v5;
}

- (AVMetadataDogBodyObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)AVMetadataDogBodyObject;
  return [(AVMetadataBodyObject *)&v6 initWithFigEmbeddedCaptureDeviceObjectDictionary:a3 input:a4 timeStamp:a5 type:@"dogBody"];
}

- (AVMetadataDogBodyObject)initWithBodyID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a5;
  return -[AVMetadataDogBodyObject initWithBodyID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithBodyID:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", a3, &v8, &v7, 0, 0, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (AVMetadataDogBodyObject)initWithBodyID:(int64_t)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9
{
  v12.receiver = self;
  v12.super_class = (Class)AVMetadataDogBodyObject;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a5;
  return [(AVMetadataBodyObject *)&v12 initWithType:@"dogBody", a3, &v11, &v10, a7, a8, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a9 bodyID time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
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
  BOOL v7 = a5;
  uint64_t v11 = [a3 bodyID];
  v15.receiver = self;
  v15.super_class = (Class)AVMetadataDogBodyObject;
  long long v12 = *(_OWORD *)&a4->c;
  v14[0] = *(_OWORD *)&a4->a;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a4->tx;
  return [(AVMetadataBodyObject *)&v15 initDerivedMetadataObjectFromMetadataObject:a3 withTransform:v14 isVideoMirrored:v7 rollAdjustment:@"dogBody" type:v11 bodyID:a6];
}

@end