@interface AVMetadataTrackedFacesObject
+ (id)trackedFacesWithTime:(id *)a3 faceTrackingDictionary:(id)a4 input:(id)a5;
- (AVMetadataTrackedFacesObject)initWithTime:(id *)a3 faceTrackingDictionary:(id)a4 input:(id)a5;
- (NSDictionary)payload;
- (id)description;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
- (void)dealloc;
@end

@implementation AVMetadataTrackedFacesObject

- (AVMetadataTrackedFacesObject)initWithTime:(id *)a3 faceTrackingDictionary:(id)a4 input:(id)a5
{
  long long v6 = *MEMORY[0x1E4F1F9F8];
  uint64_t v15 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v14 = v6;
  v17.receiver = self;
  v17.super_class = (Class)AVMetadataTrackedFacesObject;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a3;
  v11 = [(AVMetadataObject *)&v17 initWithType:@"trackedFaces", &v16, &v14, 0, 0, a5, v7, v8, v9, v10 time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
  if (v11)
  {
    v12 = objc_alloc_init(AVMetadataTrackedFacesObjectInternal);
    v11->_trackedFacesObjectInternal = v12;
    if (v12)
    {
      [(AVMetadataTrackedFacesObjectInternal *)v12 setPayload:a4];
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v11;
}

+ (id)trackedFacesWithTime:(id *)a3 faceTrackingDictionary:(id)a4 input:(id)a5
{
  id v8 = objc_alloc((Class)objc_opt_class());
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  return (id)[v8 initWithTime:&v10 faceTrackingDictionary:a4 input:a5];
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataTrackedFacesObject;
  [(AVMetadataObject *)&v3 dealloc];
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)[v3 stringWithFormat:@"<%@: %p", NSStringFromClass(v4), self];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(NSDictionary *)[(AVMetadataTrackedFacesObject *)self payload] objectForKeyedSubscript:@"tracked_faces"];
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    CGSize v15 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    CGPoint v16 = (CGPoint)*MEMORY[0x1E4F1DB28];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        rect.origin = v16;
        rect.size = v15;
        CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v10 objectForKeyedSubscript:@"Rect"], &rect);
        [v5 appendFormat:@", faceID=%@", objc_msgSend(v10, "objectForKeyedSubscript:", @"face_id"];
        [v5 appendFormat:@", pos=(%.2f,%.2f)", *(void *)&rect.origin.x, *(void *)&rect.origin.y];
        [v5 appendFormat:@", size=(%.2f,%.2f)", *(void *)&rect.size.width, *(void *)&rect.size.height];
        objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", @"AngleInfoRoll"), "floatValue");
        [v5 appendFormat:@", roll=%f", v11];
        [v5 appendFormat:@", failure=%@", objc_msgSend(v10, "objectForKeyedSubscript:", @"failure_type"];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  if (self)
  {
    [(AVMetadataObject *)self time];
    uint64_t v12 = v17;
  }
  else
  {
    uint64_t v12 = 0;
  }
  [v5 appendFormat:@", time=%lld", v12];
  [v5 appendString:@">"];
  return v5;
}

- (NSDictionary)payload
{
  v2 = [(AVMetadataTrackedFacesObjectInternal *)self->_trackedFacesObjectInternal payload];

  return v2;
}

@end