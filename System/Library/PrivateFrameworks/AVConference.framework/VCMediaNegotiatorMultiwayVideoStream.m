@interface VCMediaNegotiatorMultiwayVideoStream
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)payload;
- (unsigned)frameRate;
- (unsigned)keyFrameInterval;
- (void)setFrameRate:(unsigned int)a3;
- (void)setKeyFrameInterval:(unsigned int)a3;
- (void)setPayload:(int)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation VCMediaNegotiatorMultiwayVideoStream

- (id)description
{
  return (id)[NSString stringWithFormat:@"frameRate: %u, _keyFrameInterval: %u, payload: %d\n", -[VCMediaNegotiatorMultiwayVideoStream frameRate](self, "frameRate"), -[VCMediaNegotiatorMultiwayVideoStream keyFrameInterval](self, "keyFrameInterval"), -[VCMediaNegotiatorMultiwayVideoStream payload](self, "payload")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaNegotiatorMultiwayVideoStream;
  id v4 = [(VCMediaNegotiatorMultiwayMediaStream *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setSize:", self->_size.width, self->_size.height);
    [v5 setFrameRate:self->_frameRate];
    [v5 setKeyFrameInterval:self->_keyFrameInterval];
    [v5 setPayload:self->_payload];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  v9.receiver = self;
  v9.super_class = (Class)VCMediaNegotiatorMultiwayVideoStream;
  BOOL v5 = [(VCMediaNegotiatorMultiwayMediaStream *)&v9 isEqual:a3];
  if (v5)
  {
    [a3 size];
    if (v6 == self->_size.width)
    {
      [a3 size];
      if (v7 == self->_size.height
        && [a3 frameRate] == self->_frameRate
        && [a3 keyFrameInterval] == self->_keyFrameInterval)
      {
        LOBYTE(v5) = [a3 payload] == self->_payload;
        return v5;
      }
    }
LABEL_8:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (unsigned)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(unsigned int)a3
{
  self->_frameRate = a3;
}

- (unsigned)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setKeyFrameInterval:(unsigned int)a3
{
  self->_keyFrameInterval = a3;
}

- (int)payload
{
  return self->_payload;
}

- (void)setPayload:(int)a3
{
  self->_payload = a3;
}

@end