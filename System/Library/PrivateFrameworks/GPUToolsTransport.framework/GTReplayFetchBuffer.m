@interface GTReplayFetchBuffer
+ (BOOL)supportsSecureCoding;
- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID;
- (GTRange)range;
- (GTReplayFetchBuffer)initWithCoder:(id)a3;
- (unint64_t)streamRef;
- (void)encodeWithCoder:(id)a3;
- (void)setDispatchUID:(id)a3;
- (void)setRange:(GTRange)a3;
- (void)setStreamRef:(unint64_t)a3;
@end

@implementation GTReplayFetchBuffer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayFetchBuffer)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayFetchBuffer;
  v5 = [(GTReplayRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_streamRef = [v4 decodeInt64ForKey:@"streamRef"];
    v5->_range.location = [v4 decodeInt64ForKey:@"range.location"];
    v5->_range.length = [v4 decodeInt64ForKey:@"range.length"];
    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, @"dispatchUID");
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayFetchBuffer;
  id v4 = a3;
  [(GTReplayRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_streamRef, @"streamRef", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_range.location forKey:@"range.location"];
  [v4 encodeInt64:self->_range.length forKey:@"range.length"];
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

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (GTRange)range
{
  p_range = &self->_range;
  unint64_t location = self->_range.location;
  unint64_t length = p_range->length;
  result.unint64_t length = length;
  result.unint64_t location = location;
  return result;
}

- (void)setRange:(GTRange)a3
{
  self->_range = a3;
}

@end