@interface AVMetadataCatHeadObject
+ (id)catHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5;
- (AVMetadataCatHeadObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6;
- (id)description;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
@end

@implementation AVMetadataCatHeadObject

+ (id)catHeadObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFigEmbeddedCaptureDeviceObjectDictionary:a3 input:a4 timeStamp:a5 type:@"catHead"];

  return v5;
}

- (AVMetadataCatHeadObject)initWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5 type:(id)a6
{
  long long v19 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&v25.value = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v10 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v25.epoch = v10;
  v11 = (double *)MEMORY[0x1E4F1DB28];
  if (a5)
  {
    [a5 longLongValue];
    int64_t v12 = FigHostTimeToNanoseconds();
    CMTimeMake(&v25, v12, 1000000000);
  }
  double x = *v11;
  double y = v11[1];
  double width = v11[2];
  double height = v11[3];
  CFDictionaryRef v17 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F523F8], v19);
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
  v23.receiver = self;
  v23.super_class = (Class)AVMetadataCatHeadObject;
  rect.origin = *(CGPoint *)&v25.value;
  *(void *)&rect.size.double width = v25.epoch;
  long long v21 = v20;
  CMTimeEpoch v22 = v10;
  return -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v23, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, a6, &rect, &v21, a3, 0, a4, x, y, width, height);
}

- (id)description
{
  [(AVMetadataObject *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  v11 = (void *)MEMORY[0x1E4F28E78];
  int64_t v12 = (objc_class *)objc_opt_class();
  v13 = (void *)[v11 stringWithFormat:@"<%@: %p, objectID=%ld, bounds={%.1f,%.1f %.1fx%.1f}", NSStringFromClass(v12), self, -[AVMetadataObject objectID](self, "objectID"), v4, v6, v8, v10];
  [v13 appendFormat:@", groupID=%ld, syntheticFocusMode=%lu", -[AVMetadataObject groupID](self, "groupID"), -[AVMetadataObject syntheticFocusMode](self, "syntheticFocusMode")];
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
  v21.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v21.size = v9;
  [a3 bounds];
  long long v10 = *(_OWORD *)&a4->c;
  v20[0] = *(_OWORD *)&a4->a;
  v20[1] = v10;
  v20[2] = *(_OWORD *)&a4->tx;
  if (AVMetadataObjectAdjustBaseClassProperties((uint64_t)v20, &v21, v11, v12, v13, v14))
  {
    if (a3)
    {
      [a3 time];
      [a3 duration];
    }
    else
    {
      memset(v19, 0, sizeof(v19));
      memset(v18, 0, sizeof(v18));
    }
    uint64_t v16 = [a3 input];
    v17.receiver = self;
    v17.super_class = (Class)AVMetadataCatHeadObject;
    return [(AVMetadataObject *)&v17 initWithType:@"catHead", v19, v18, 0, a3, v16, *(_OWORD *)&v21.origin, *(_OWORD *)&v21.size time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
  }
  else
  {

    return 0;
  }
}

@end