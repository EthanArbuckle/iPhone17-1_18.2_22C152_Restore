@interface GTReplayLoadRequest
+ (BOOL)supportsSecureCoding;
- (GTReplayLoadRequest)initWithCoder:(id)a3;
- (NSURL)gputraceURL;
- (void)encodeWithCoder:(id)a3;
- (void)setGputraceURL:(id)a3;
@end

@implementation GTReplayLoadRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayLoadRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTReplayLoadRequest;
  v5 = [(GTReplayRequest *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gputraceURL"];
    uint64_t v7 = [NSURL fileURLWithPath:v6];
    gputraceURL = v5->_gputraceURL;
    v5->_gputraceURL = (NSURL *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  gputraceURL = self->_gputraceURL;
  id v4 = a3;
  id v5 = [(NSURL *)gputraceURL path];
  [v4 encodeObject:v5 forKey:@"gputraceURL"];
}

- (NSURL)gputraceURL
{
  return self->_gputraceURL;
}

- (void)setGputraceURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end