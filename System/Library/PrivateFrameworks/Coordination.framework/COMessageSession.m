@interface COMessageSession
- (BOOL)didUseNotice;
- (BOOL)didUseRequest;
- (BOOL)didUseResponse;
- (BOOL)isEqual:(id)a3;
- (COClusterMember)member;
- (COMessageSession)initWithMember:(id)a3;
- (NSString)subTopic;
- (id)messageChannel;
- (unint64_t)hash;
- (unint64_t)startTime;
- (void)setDidUseNotice:(BOOL)a3;
- (void)setDidUseRequest:(BOOL)a3;
- (void)setDidUseResponse:(BOOL)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)stopWithNotice:(id)a3;
@end

@implementation COMessageSession

- (COMessageSession)initWithMember:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMessageSession;
  v6 = [(COMessageSession *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_member, a3);
    v7->_startTime = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  }

  return v7;
}

- (void)stopWithNotice:(id)a3
{
  id v6 = a3;
  v4 = [(COMessageSession *)self messageChannel];
  id v5 = v4;
  if (v4) {
    [v4 stopMessageSession:self withNotice:v6];
  }
}

- (id)messageChannel
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(COMessageSession *)self producer];
  }
  else {
  v3 = [(COMessageSession *)self consumer];
  }
  v4 = [v3 messageChannel];

  return v4;
}

- (NSString)subTopic
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(COMessageSession *)self producer];
  }
  else {
  v3 = [(COMessageSession *)self consumer];
  }
  v4 = [v3 subTopic];

  return (NSString *)v4;
}

- (unint64_t)hash
{
  v3 = [(COMessageSession *)self subTopic];
  uint64_t v4 = [v3 hash];
  id v5 = [(COMessageSession *)self member];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (COMessageSession *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    id v5 = [(COMessageSession *)self subTopic];
    unint64_t v6 = [(COMessageSession *)v4 subTopic];
    int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      v8 = [(COMessageSession *)self member];
      objc_super v9 = [(COMessageSession *)v4 member];
      char v10 = [v8 isEqualToMember:v9];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (COClusterMember)member
{
  return self->_member;
}

- (BOOL)didUseRequest
{
  return self->_didUseRequest;
}

- (void)setDidUseRequest:(BOOL)a3
{
  self->_didUseRequest = a3;
}

- (BOOL)didUseResponse
{
  return self->_didUseResponse;
}

- (void)setDidUseResponse:(BOOL)a3
{
  self->_didUseResponse = a3;
}

- (BOOL)didUseNotice
{
  return self->_didUseNotice;
}

- (void)setDidUseNotice:(BOOL)a3
{
  self->_didUseNotice = a3;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
}

@end