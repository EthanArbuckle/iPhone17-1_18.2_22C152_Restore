@interface MSSubscribedStream
+ (BOOL)supportsSecureCoding;
+ (id)subscribedStreamWithStreamID:(id)a3;
- (MSSubscribedStream)initWithCoder:(id)a3;
- (MSSubscribedStream)initWithStreamID:(id)a3;
- (NSString)ctag;
- (NSString)streamID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCtag:(id)a3;
- (void)setStreamID:(id)a3;
@end

@implementation MSSubscribedStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctag, 0);
  objc_storeStrong((id *)&self->_streamID, 0);
}

- (void)setCtag:(id)a3
{
}

- (NSString)ctag
{
  return self->_ctag;
}

- (void)setStreamID:(id)a3
{
}

- (NSString)streamID
{
  return self->_streamID;
}

- (MSSubscribedStream)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSSubscribedStream;
  v5 = [(MSSubscribedStream *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"streamID"];
    streamID = v5->_streamID;
    v5->_streamID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ctag"];
    ctag = v5->_ctag;
    v5->_ctag = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  streamID = self->_streamID;
  id v7 = v4;
  if (streamID)
  {
    [v4 encodeObject:streamID forKey:@"streamID"];
    id v4 = v7;
  }
  ctag = self->_ctag;
  if (ctag)
  {
    [v7 encodeObject:ctag forKey:@"ctag"];
    id v4 = v7;
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@\nStream ID: %@\nCTAG: %@", objc_opt_class(), self->_streamID, self->_ctag];
}

- (MSSubscribedStream)initWithStreamID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSSubscribedStream;
  uint64_t v6 = [(MSSubscribedStream *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_streamID, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)subscribedStreamWithStreamID:(id)a3
{
  id v3 = a3;
  id v4 = [[MSSubscribedStream alloc] initWithStreamID:v3];

  return v4;
}

@end