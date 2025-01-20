@interface AVMetadataOfflineVideoStabilizationMotionObject
+ (id)offlineVideoStabilizationMotionObjectWithTime:(id *)a3 motionDictionary:(id)a4 input:(id)a5;
- (AVMetadataOfflineVideoStabilizationMotionObject)initWithTime:(id *)a3 motionDictionary:(id)a4 input:(id)a5;
- (NSDictionary)payload;
- (id)description;
- (void)dealloc;
@end

@implementation AVMetadataOfflineVideoStabilizationMotionObject

- (AVMetadataOfflineVideoStabilizationMotionObject)initWithTime:(id *)a3 motionDictionary:(id)a4 input:(id)a5
{
  long long v6 = *MEMORY[0x1E4F1F9F8];
  uint64_t v15 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v14 = v6;
  v17.receiver = self;
  v17.super_class = (Class)AVMetadataOfflineVideoStabilizationMotionObject;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a3;
  v11 = [(AVMetadataObject *)&v17 initWithType:@"offlineVideoStabilizationMotion", &v16, &v14, 0, 0, a5, v7, v8, v9, v10 time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
  if (v11)
  {
    v12 = objc_alloc_init(AVMetadataOfflineVideoStabilizationMotionObjectInternal);
    v11->_offlineVISMotionObjectInternal = v12;
    if (v12)
    {
      [(AVMetadataOfflineVideoStabilizationMotionObjectInternal *)v12 setPayload:a4];
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

+ (id)offlineVideoStabilizationMotionObjectWithTime:(id *)a3 motionDictionary:(id)a4 input:(id)a5
{
  id v8 = objc_alloc((Class)objc_opt_class());
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  return (id)[v8 initWithTime:&v10 motionDictionary:a4 input:a5];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataOfflineVideoStabilizationMotionObject;
  [(AVMetadataObject *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  long long v6 = [(AVMetadataOfflineVideoStabilizationMotionObject *)self payload];
  if (self)
  {
    [(AVMetadataObject *)self time];
    uint64_t v7 = v9;
  }
  else
  {
    uint64_t v7 = 0;
  }
  return (id)[v3 stringWithFormat:@"<%@: %p %@, time=%lld>", v5, self, v6, v7];
}

- (NSDictionary)payload
{
  v2 = [(AVMetadataOfflineVideoStabilizationMotionObjectInternal *)self->_offlineVISMotionObjectInternal payload];

  return v2;
}

@end