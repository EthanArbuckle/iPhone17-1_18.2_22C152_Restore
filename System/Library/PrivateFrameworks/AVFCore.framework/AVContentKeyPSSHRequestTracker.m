@interface AVContentKeyPSSHRequestTracker
- (AVContentKeyPSSHRequestTracker)initWithRequestCount:(int64_t)a3;
- (BOOL)haveAllRequestsBeenReceived;
- (id)requests;
- (void)addRequest:(id)a3;
- (void)dealloc;
@end

@implementation AVContentKeyPSSHRequestTracker

- (AVContentKeyPSSHRequestTracker)initWithRequestCount:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVContentKeyPSSHRequestTracker;
  v4 = [(AVContentKeyPSSHRequestTracker *)&v7 init];
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_totalExpectedRequestCount = a3;
    v4->_requests = v5;
  }
  return v4;
}

- (void)addRequest:(id)a3
{
}

- (BOOL)haveAllRequestsBeenReceived
{
  int64_t totalExpectedRequestCount = self->_totalExpectedRequestCount;
  return totalExpectedRequestCount == [(NSMutableArray *)self->_requests count];
}

- (id)requests
{
  v2 = self->_requests;
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVContentKeyPSSHRequestTracker;
  [(AVContentKeyPSSHRequestTracker *)&v3 dealloc];
}

@end