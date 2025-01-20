@interface AVMetadataObjectInternal
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (AVCaptureInput)input;
- (AVMetadataObject)originalMetadataObject;
- (AVMetadataObjectInternal)init;
- (CGRect)bounds;
- (NSString)type;
- (int64_t)detectionSource;
- (int64_t)groupID;
- (int64_t)objectID;
- (unint64_t)syntheticFocusMode;
- (void)dealloc;
- (void)setBounds:(CGRect)a3;
- (void)setDetectionSource:(int64_t)a3;
- (void)setDuration:(id *)a3;
- (void)setGroupID:(int64_t)a3;
- (void)setInput:(id)a3;
- (void)setObjectID:(int64_t)a3;
- (void)setOriginalMetadataObject:(id)a3;
- (void)setSyntheticFocusMode:(unint64_t)a3;
- (void)setTime:(id *)a3;
- (void)setType:(id)a3;
@end

@implementation AVMetadataObjectInternal

- (AVMetadataObjectInternal)init
{
  v7.receiver = self;
  v7.super_class = (Class)AVMetadataObjectInternal;
  result = [(AVMetadataObjectInternal *)&v7 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1F9F8];
    long long v4 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&result->_time.value = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&result->_duration.value = v4;
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    result->_bounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    int64_t v6 = *(void *)(v3 + 16);
    result->_time.epoch = v6;
    result->_duration.epoch = v6;
    result->_bounds.size = v5;
    result->_groupID = -1;
    result->_objectID = -1;
    result->_syntheticFocusMode = 0;
    result->_detectionSource = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataObjectInternal;
  [(AVMetadataObjectInternal *)&v3 dealloc];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (void)setTime:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  objc_copyStruct(retstr, &self->_duration, 24, 1, 0);
  return result;
}

- (void)setDuration:(id *)a3
{
}

- (CGRect)bounds
{
  objc_copyStruct(v6, &self->_bounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_bounds, &v3, 32, 1, 0);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setType:(id)a3
{
}

- (AVCaptureInput)input
{
  return (AVCaptureInput *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInput:(id)a3
{
}

- (AVMetadataObject)originalMetadataObject
{
  return (AVMetadataObject *)objc_getProperty(self, a2, 104, 1);
}

- (void)setOriginalMetadataObject:(id)a3
{
}

- (int64_t)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(int64_t)a3
{
  self->_groupID = a3;
}

- (int64_t)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(int64_t)a3
{
  self->_objectID = a3;
}

- (unint64_t)syntheticFocusMode
{
  return self->_syntheticFocusMode;
}

- (void)setSyntheticFocusMode:(unint64_t)a3
{
  self->_syntheticFocusMode = a3;
}

- (int64_t)detectionSource
{
  return self->_detectionSource;
}

- (void)setDetectionSource:(int64_t)a3
{
  self->_detectionSource = a3;
}

@end