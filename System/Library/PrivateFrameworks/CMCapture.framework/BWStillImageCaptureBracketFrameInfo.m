@interface BWStillImageCaptureBracketFrameInfo
+ (BOOL)supportsSecureCoding;
+ (id)infoWithBracketedCaptureSequenceNumber:(int)a3 mainFlags:(unint64_t)a4 sifrFlags:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BWStillImageCaptureBracketFrameInfo)initWithBracketedCaptureSequenceNumber:(int)a3 mainFlags:(unint64_t)a4 sifrFlags:(unint64_t)a5;
- (BWStillImageCaptureBracketFrameInfo)initWithCoder:(id)a3;
- (id)description;
- (int)bracketedCaptureSequenceNumber;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BWStillImageCaptureBracketFrameInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWStillImageCaptureBracketFrameInfo)initWithBracketedCaptureSequenceNumber:(int)a3 mainFlags:(unint64_t)a4 sifrFlags:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)BWStillImageCaptureBracketFrameInfo;
  result = [(BWStillImageCaptureFrameInfo *)&v7 initWithMainFlags:a4 sifrFlags:a5];
  if (result) {
    result->_bracketedCaptureSequenceNumber = a3;
  }
  return result;
}

+ (id)infoWithBracketedCaptureSequenceNumber:(int)a3 mainFlags:(unint64_t)a4 sifrFlags:(unint64_t)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithBracketedCaptureSequenceNumber:*(void *)&a3 mainFlags:a4 sifrFlags:a5];
  return v5;
}

- (BWStillImageCaptureBracketFrameInfo)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWStillImageCaptureBracketFrameInfo;
  v4 = -[BWStillImageCaptureFrameInfo initWithCoder:](&v6, sel_initWithCoder_);
  if (v4) {
    v4->_bracketedCaptureSequenceNumber = [a3 decodeInt32ForKey:@"bracketedCaptureSequenceNumber"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageCaptureBracketFrameInfo;
  -[BWStillImageCaptureFrameInfo encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeInt32:self->_bracketedCaptureSequenceNumber forKey:@"bracketedCaptureSequenceNumber"];
}

- (id)description
{
  uint64_t bracketedCaptureSequenceNumber = self->_bracketedCaptureSequenceNumber;
  if ((int)bracketedCaptureSequenceNumber < 1) {
    v4 = @"PB";
  }
  else {
    v4 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"B%.2d", bracketedCaptureSequenceNumber);
  }
  objc_super v5 = NSString;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = BWStillImageCaptureFrameFlagsToShortString([(BWStillImageCaptureFrameInfo *)self mainFlags]);
  return (id)[v5 stringWithFormat:@"<%@ %p>: %@ main:%@ sifr:%@", v6, self, v4, v7, BWStillImageCaptureFrameFlagsToShortString(-[BWStillImageCaptureFrameInfo sifrFlags](self, "sifrFlags"))];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageCaptureBracketFrameInfo;
  return [(BWStillImageCaptureFrameInfo *)&v3 hash] ^ self->_bracketedCaptureSequenceNumber;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v11 = v3;
    uint64_t v12 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10.receiver = self;
      v10.super_class = (Class)BWStillImageCaptureBracketFrameInfo;
      BOOL v7 = [(BWStillImageCaptureFrameInfo *)&v10 isEqual:a3];
      if (v7)
      {
        int bracketedCaptureSequenceNumber = self->_bracketedCaptureSequenceNumber;
        LOBYTE(v7) = bracketedCaptureSequenceNumber == [a3 bracketedCaptureSequenceNumber];
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (int)bracketedCaptureSequenceNumber
{
  return self->_bracketedCaptureSequenceNumber;
}

@end