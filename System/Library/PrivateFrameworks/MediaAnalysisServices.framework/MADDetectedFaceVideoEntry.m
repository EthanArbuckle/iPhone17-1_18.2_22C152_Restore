@interface MADDetectedFaceVideoEntry
+ (BOOL)supportsSecureCoding;
+ (id)entryWithTimeRange:(id *)a3 confidence:(double)a4 boundingBox:(CGRect)a5;
- ($1C75447F214D9465CD650DD956230C7F)timeRange;
- (CGRect)boundingBox;
- (MADDetectedFaceVideoEntry)initWithCoder:(id)a3;
- (MADDetectedFaceVideoEntry)initWithTimeRange:(id *)a3 confidence:(double)a4 boundingBox:(CGRect)a5;
- (double)confidence;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADDetectedFaceVideoEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADDetectedFaceVideoEntry)initWithTimeRange:(id *)a3 confidence:(double)a4 boundingBox:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)MADDetectedFaceVideoEntry;
  result = [(MADDetectedFaceVideoEntry *)&v14 init];
  if (result)
  {
    long long v12 = *(_OWORD *)&a3->var0.var0;
    long long v13 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&result->_timeRange.duration.timescale = v13;
    *(_OWORD *)&result->_timeRange.start.value = v12;
    result->_boundingBox.origin.CGFloat y = y;
    result->_boundingBox.size.CGFloat width = width;
    result->_boundingBox.size.CGFloat height = height;
    result->_confidence = a4;
    result->_boundingBox.origin.CGFloat x = x;
  }
  return result;
}

+ (id)entryWithTimeRange:(id *)a3 confidence:(double)a4 boundingBox:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = objc_alloc((Class)a1);
  long long v12 = *(_OWORD *)&a3->var0.var3;
  v15[0] = *(_OWORD *)&a3->var0.var0;
  v15[1] = v12;
  v15[2] = *(_OWORD *)&a3->var1.var1;
  long long v13 = objc_msgSend(v11, "initWithTimeRange:confidence:boundingBox:", v15, a4, x, y, width, height);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  v6[0] = *(_OWORD *)&self->_timeRange.start.value;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  [v4 encodeCMTimeRange:v6 forKey:@"TimeRange"];
  [v4 encodeDouble:@"Confidence" forKey:self->_confidence];
  objc_msgSend(v4, "encodeRect:forKey:", @"BoundingBox", self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
}

- (MADDetectedFaceVideoEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MADDetectedFaceVideoEntry;
  long long v5 = [(MADDetectedFaceVideoEntry *)&v15 init];
  if (v5)
  {
    if (v4)
    {
      [v4 decodeCMTimeRangeForKey:@"TimeRange"];
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v12 = 0u;
    }
    *(_OWORD *)&v5->_timeRange.start.value = v12;
    *(_OWORD *)&v5->_timeRange.start.epoch = v13;
    *(_OWORD *)&v5->_timeRange.duration.timescale = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", @"Confidence", v12, v13, v14);
    v5->_confidence = v6;
    [v4 decodeRectForKey:@"BoundingBox"];
    v5->_boundingBox.origin.double x = v7;
    v5->_boundingBox.origin.double y = v8;
    v5->_boundingBox.size.double width = v9;
    v5->_boundingBox.size.double height = v10;
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  CMTime time = (CMTime)self->_timeRange.start;
  Float64 Seconds = CMTimeGetSeconds(&time);
  long long v7 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  CMTimeRangeGetEnd(&v12, &range);
  [v3 appendFormat:@"%@: %-.4fs-%-.4fs, ", @"TimeRange", *(void *)&Seconds, CMTimeGetSeconds(&v12)];
  [(MADDetectedFaceVideoEntry *)self boundingBox];
  CGFloat v8 = NSStringFromRect(v15);
  [v3 appendFormat:@"%@: %@, ", @"BoundingBox", v8];

  [(MADDetectedFaceVideoEntry *)self confidence];
  [v3 appendFormat:@"%@: %.2f>", @"Confidence", v9];
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

- (double)confidence
{
  return self->_confidence;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end