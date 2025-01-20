@interface LPFetcher
- (Class)responseClass;
- (LPEvent)_event;
- (LPFetcher)init;
- (id)userData;
- (unsigned)_loggingID;
- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setResponseClass:(Class)a3;
- (void)setUserData:(id)a3;
- (void)set_event:(id)a3;
@end

@implementation LPFetcher

- (LPFetcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPFetcher;
  v2 = [(LPFetcher *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_loggingID = ++init_nextLoggingID;
    v4 = v2;
  }

  return v3;
}

- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4
{
}

- (unsigned)_loggingID
{
  return self->_loggingID;
}

- (LPEvent)_event
{
  return self->_event;
}

- (void)set_event:(id)a3
{
}

- (id)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
}

- (Class)responseClass
{
  return self->_responseClass;
}

- (void)setResponseClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseClass, 0);
  objc_storeStrong(&self->_userData, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end