@interface GTReplayerDisplayRequest
+ (BOOL)supportsSecureCoding;
- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID;
- (GTReplayerDisplayRequest)initWithCoder:(id)a3;
- (int)filters;
- (unint64_t)streamRef;
- (unsigned)index;
- (void)encodeWithCoder:(id)a3;
- (void)setDispatchUID:(id)a3;
- (void)setFilters:(int)a3;
- (void)setIndex:(unsigned int)a3;
- (void)setStreamRef:(unint64_t)a3;
@end

@implementation GTReplayerDisplayRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayerDisplayRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayerDisplayRequest;
  v5 = [(GTReplayRequest *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_streamRef = [v4 decodeInt64ForKey:@"streamRef"];
    v5->_index = [v4 decodeInt32ForKey:@"index"];
    v5->_filters = [v4 decodeInt32ForKey:@"filters"];
    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, @"dispatchUID");
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayerDisplayRequest;
  id v4 = a3;
  [(GTReplayRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_streamRef, @"streamRef", v5.receiver, v5.super_class);
  [v4 encodeInt32:self->_index forKey:@"index"];
  [v4 encodeInt32:self->_filters forKey:@"filters"];
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

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (int)filters
{
  return self->_filters;
}

- (void)setFilters:(int)a3
{
  self->_filters = a3;
}

@end