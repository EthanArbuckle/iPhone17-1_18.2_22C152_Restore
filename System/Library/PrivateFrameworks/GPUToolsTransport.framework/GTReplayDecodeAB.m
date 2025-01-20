@interface GTReplayDecodeAB
+ (BOOL)supportsSecureCoding;
- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID;
- (GTReplayDecodeAB)initWithCoder:(id)a3;
- (unsigned)index;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDispatchUID:(id)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setType:(unsigned __int16)a3;
@end

@implementation GTReplayDecodeAB

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayDecodeAB)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayDecodeAB;
  v5 = [(GTReplayRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_type = [v4 decodeInt32ForKey:@"type"];
    v5->_index = [v4 decodeInt32ForKey:@"index"];
    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, @"dispatchUID");
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayDecodeAB;
  id v4 = a3;
  [(GTReplayRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", self->_type, @"type", v5.receiver, v5.super_class);
  [v4 encodeInt32:self->_index forKey:@"index"];
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, @"dispatchUID");
}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

@end