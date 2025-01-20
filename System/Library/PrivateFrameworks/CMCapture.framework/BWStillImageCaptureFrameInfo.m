@interface BWStillImageCaptureFrameInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BWStillImageCaptureFrameInfo)initWithCoder:(id)a3;
- (BWStillImageCaptureFrameInfo)initWithMainFlags:(unint64_t)a3 sifrFlags:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)mainFlags;
- (unint64_t)sifrFlags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BWStillImageCaptureFrameInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWStillImageCaptureFrameInfo)initWithMainFlags:(unint64_t)a3 sifrFlags:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BWStillImageCaptureFrameInfo;
  result = [(BWStillImageCaptureFrameInfo *)&v7 init];
  if (result)
  {
    result->_mainFlags = a3;
    result->_sifrFlags = a4;
  }
  return result;
}

- (BWStillImageCaptureFrameInfo)initWithCoder:(id)a3
{
  v4 = [(BWStillImageCaptureFrameInfo *)self init];
  if (v4)
  {
    v4->_mainFlags = [a3 decodeInt64ForKey:@"mainFlags"];
    v4->_sifrFlags = [a3 decodeInt64ForKey:@"sifrFlags"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt64:self->_mainFlags forKey:@"mainFlags"];
  unint64_t sifrFlags = self->_sifrFlags;
  [a3 encodeInt64:sifrFlags forKey:@"sifrFlags"];
}

- (unint64_t)hash
{
  return self->_sifrFlags ^ self->_mainFlags;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unint64_t mainFlags = self->_mainFlags;
  if (mainFlags != [a3 mainFlags]) {
    return 0;
  }
  unint64_t sifrFlags = self->_sifrFlags;
  return sifrFlags == [a3 sifrFlags];
}

- (unint64_t)mainFlags
{
  return self->_mainFlags;
}

- (unint64_t)sifrFlags
{
  return self->_sifrFlags;
}

@end