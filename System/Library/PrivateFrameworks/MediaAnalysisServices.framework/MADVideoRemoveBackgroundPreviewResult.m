@interface MADVideoRemoveBackgroundPreviewResult
+ (BOOL)supportsSecureCoding;
- ($1C75447F214D9465CD650DD956230C7F)timeRange;
- (CGRect)normalizedCropRect;
- (MADVideoRemoveBackgroundPreviewResult)initWithCoder:(id)a3;
- (MADVideoRemoveBackgroundPreviewResult)initWithTimeRange:(id *)a3 frames:(id)a4 normalizedCropRect:(CGRect)a5;
- (NSArray)frames;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADVideoRemoveBackgroundPreviewResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVideoRemoveBackgroundPreviewResult)initWithTimeRange:(id *)a3 frames:(id)a4 normalizedCropRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MADVideoRemoveBackgroundPreviewResult;
  v13 = [(MADVideoRemoveBackgroundPreviewResult *)&v18 init];
  v14 = v13;
  if (v13)
  {
    long long v16 = *(_OWORD *)&a3->var0.var3;
    long long v15 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&v13->_timeRange.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&v13->_timeRange.start.epoch = v16;
    *(_OWORD *)&v13->_timeRange.duration.timescale = v15;
    objc_storeStrong((id *)&v13->_frames, a4);
    v14->_normalizedCropRect.origin.CGFloat x = x;
    v14->_normalizedCropRect.origin.CGFloat y = y;
    v14->_normalizedCropRect.size.CGFloat width = width;
    v14->_normalizedCropRect.size.CGFloat height = height;
  }

  return v14;
}

- (MADVideoRemoveBackgroundPreviewResult)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MADVideoRemoveBackgroundPreviewResult;
  v5 = [(MADVideoResult *)&v16 initWithCoder:v4];
  if (v5)
  {
    v5->_timeRange.start.value = [v4 decodeInt64ForKey:@"TimeRangeStartValue"];
    v5->_timeRange.start.timescale = [v4 decodeInt32ForKey:@"TimeRangeStartScale"];
    v5->_timeRange.start.flags = [v4 decodeInt32ForKey:@"TimeRangeStartFlags"];
    v5->_timeRange.start.epoch = [v4 decodeInt64ForKey:@"TimeRangeStartEpoch"];
    v5->_timeRange.duration.value = [v4 decodeInt64ForKey:@"TimeRangeDurationValue"];
    v5->_timeRange.duration.timescale = [v4 decodeInt32ForKey:@"TimeRangeDurationScale"];
    v5->_timeRange.duration.flags = [v4 decodeInt32ForKey:@"TimeRangeDurationFlags"];
    v5->_timeRange.duration.epoch = [v4 decodeInt64ForKey:@"TimeRangeDurationEpoch"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Frames"];
    frames = v5->_frames;
    v5->_frames = (NSArray *)v9;

    [v4 decodeRectForKey:@"NormalizedCropRect"];
    v5->_normalizedCropRect.origin.CGFloat x = v11;
    v5->_normalizedCropRect.origin.CGFloat y = v12;
    v5->_normalizedCropRect.size.CGFloat width = v13;
    v5->_normalizedCropRect.size.CGFloat height = v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADVideoRemoveBackgroundPreviewResult;
  [(MADVideoResult *)&v5 encodeWithCoder:v4];
  [v4 encodeInt64:self->_timeRange.start.value forKey:@"TimeRangeStartValue"];
  [v4 encodeInt32:self->_timeRange.start.timescale forKey:@"TimeRangeStartScale"];
  [v4 encodeInt32:self->_timeRange.start.flags forKey:@"TimeRangeStartFlags"];
  [v4 encodeInt64:self->_timeRange.start.epoch forKey:@"TimeRangeStartEpoch"];
  [v4 encodeInt64:self->_timeRange.duration.value forKey:@"TimeRangeDurationValue"];
  [v4 encodeInt32:self->_timeRange.duration.timescale forKey:@"TimeRangeDurationScale"];
  [v4 encodeInt32:self->_timeRange.duration.flags forKey:@"TimeRangeDurationFlags"];
  [v4 encodeInt64:self->_timeRange.duration.epoch forKey:@"TimeRangeDurationEpoch"];
  [v4 encodeObject:self->_frames forKey:@"Frames"];
  objc_msgSend(v4, "encodeRect:forKey:", @"NormalizedCropRect", self->_normalizedCropRect.origin.x, self->_normalizedCropRect.origin.y, self->_normalizedCropRect.size.width, self->_normalizedCropRect.size.height);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  uint64_t timescale = self->_timeRange.start.timescale;
  CMTime time = (CMTime)self->_timeRange.start;
  [v3 appendFormat:@"start: %lld/%d (%0.3fs), ", time.value, timescale, CMTimeGetSeconds(&time)];
  uint64_t v7 = self->_timeRange.duration.timescale;
  CMTime duration = (CMTime)self->_timeRange.duration;
  [v3 appendFormat:@"duration: %lld/%d (%0.3fs), ", duration.value, v7, CMTimeGetSeconds(&duration)];
  [v3 appendFormat:@"frames: %@,", self->_frames];
  [v3 appendFormat:@"normalizedCropRect: (%0.3f, %0.3f) to (%0.3f, %0.3f)>", *(void *)&self->_normalizedCropRect.origin.x, *(void *)&self->_normalizedCropRect.origin.y, self->_normalizedCropRect.origin.x + self->_normalizedCropRect.size.width, self->_normalizedCropRect.origin.y + self->_normalizedCropRect.size.height];
  return v3;
}

- ($1C75447F214D9465CD650DD956230C7F)timeRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var1;
  return self;
}

- (NSArray)frames
{
  return self->_frames;
}

- (CGRect)normalizedCropRect
{
  double x = self->_normalizedCropRect.origin.x;
  double y = self->_normalizedCropRect.origin.y;
  double width = self->_normalizedCropRect.size.width;
  double height = self->_normalizedCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end