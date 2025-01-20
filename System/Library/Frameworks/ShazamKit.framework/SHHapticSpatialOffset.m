@interface SHHapticSpatialOffset
+ (BOOL)supportsSecureCoding;
- (SHHapticSpatialOffset)initWithCoder:(id)a3;
- (SHHapticSpatialOffset)initWithTimestamp:(double)a3 offset:(double)a4;
- (double)offset;
- (double)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHHapticSpatialOffset

- (SHHapticSpatialOffset)initWithTimestamp:(double)a3 offset:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SHHapticSpatialOffset;
  result = [(SHHapticSpatialOffset *)&v7 init];
  if (result)
  {
    result->_timestamp = a3;
    result->_offset = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHHapticSpatialOffset)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"SHHapticSpatialOffsetTimestampKey"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"SHHapticSpatialOffsetKey"];
  double v8 = v7;

  return [(SHHapticSpatialOffset *)self initWithTimestamp:v6 offset:v8];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(SHHapticSpatialOffset *)self timestamp];
  objc_msgSend(v4, "encodeDouble:forKey:", @"SHHapticSpatialOffsetTimestampKey");
  [(SHHapticSpatialOffset *)self offset];
  objc_msgSend(v4, "encodeDouble:forKey:", @"SHHapticSpatialOffsetKey");
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)offset
{
  return self->_offset;
}

@end