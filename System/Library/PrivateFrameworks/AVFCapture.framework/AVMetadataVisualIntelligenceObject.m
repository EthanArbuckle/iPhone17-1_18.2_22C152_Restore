@interface AVMetadataVisualIntelligenceObject
+ (id)visualIntelligenceObjectWithVisualIntelligenceDictionary:(id)a3 input:(id)a4 time:(id *)a5;
- (NSData)objectDetectionCachedResult;
- (NSDictionary)visualIntelligence;
- (id)description;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
- (id)initVisualIntelligenceObjectWithVisualIntelligenceDictionary:(id)a3 time:(id *)a4 sourceCaptureInput:(id)a5;
- (unsigned)objectDetectionUprightExifOrientation;
- (void)dealloc;
@end

@implementation AVMetadataVisualIntelligenceObject

+ (id)visualIntelligenceObjectWithVisualIntelligenceDictionary:(id)a3 input:(id)a4 time:(id *)a5
{
  id v8 = objc_alloc((Class)objc_opt_class());
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a5;
  return (id)[v8 initVisualIntelligenceObjectWithVisualIntelligenceDictionary:a3 time:&v10 sourceCaptureInput:a4];
}

- (id)initVisualIntelligenceObjectWithVisualIntelligenceDictionary:(id)a3 time:(id *)a4 sourceCaptureInput:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)AVMetadataVisualIntelligenceObject;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  long long v8 = *MEMORY[0x1E4F1F9F8];
  uint64_t v9 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v6 = [(AVMetadataObject *)&v11 initWithType:@"visualIntelligence", &v10, &v8, 0, 0, a5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24) time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
  if (v6) {
    v6->_visualIntelligence = (NSDictionary *)[a3 copy];
  }
  return v6;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  uint64_t v8 = objc_msgSend(a3, "visualIntelligence", a6);
  if (a3) {
    [a3 time];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  return -[AVMetadataVisualIntelligenceObject initVisualIntelligenceObjectWithVisualIntelligenceDictionary:time:sourceCaptureInput:](self, "initVisualIntelligenceObjectWithVisualIntelligenceDictionary:time:sourceCaptureInput:", v8, v10, [a3 input]);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataVisualIntelligenceObject;
  [(AVMetadataObject *)&v3 dealloc];
}

- (NSData)objectDetectionCachedResult
{
  return (NSData *)[(NSDictionary *)self->_visualIntelligence objectForKeyedSubscript:*MEMORY[0x1E4F514C8]];
}

- (unsigned)objectDetectionUprightExifOrientation
{
  id v2 = [(NSDictionary *)self->_visualIntelligence objectForKeyedSubscript:*MEMORY[0x1E4F514D0]];

  return [v2 intValue];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
  {
    [(AVMetadataObject *)self time];
    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (id)[v3 stringWithFormat:@"<%@: %p, time=%lld, cachedResult=%@", v5, self, v6, -[AVMetadataVisualIntelligenceObject objectDetectionCachedResult](self, "objectDetectionCachedResult")];
}

- (NSDictionary)visualIntelligence
{
  return self->_visualIntelligence;
}

@end