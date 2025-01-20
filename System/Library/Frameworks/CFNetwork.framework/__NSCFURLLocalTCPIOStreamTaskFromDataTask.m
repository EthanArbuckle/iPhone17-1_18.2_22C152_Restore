@interface __NSCFURLLocalTCPIOStreamTaskFromDataTask
- (__NSCFURLLocalTCPIOStreamTaskFromDataTask)initWithTask:(id)a3 connection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5 disavow:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (void)connection:(id)a3 _conditionalRequirementsChanged:(BOOL)a4;
- (void)connection:(id)a3 _willSendRequestForEstablishedConnection:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 alternatePathAvailable:(int)a4;
- (void)connection:(id)a3 challenged:(id)a4 authCallback:(id)a5;
- (void)connection:(id)a3 didFinishLoadingWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 didReceiveInformationalResponse:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 didReceiveSocketInputStream:(id)a4 outputStream:(id)a5;
- (void)connection:(id)a3 didReceiveTCPConnection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5;
- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamCallback:(id)a5;
- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamFromOffset:(int64_t)a5 callback:(id)a6;
- (void)connection:(id)a3 sentBodyBytes:(id)a4 totalBytes:(id)a5 expectedBytes:(id)a6;
- (void)connection:(id)a3 waitingWithReason:(int64_t)a4;
- (void)connection:(id)a3 wasRedirected:(id)a4 newRequest:(id)a5 responseCallback:(id)a6;
- (void)connection:(id)a3 willCacheResponse:(id)a4 responseCallback:(id)a5;
- (void)connectionWillFinishLoading:(id)a3;
@end

@implementation __NSCFURLLocalTCPIOStreamTaskFromDataTask

- (void)connectionWillFinishLoading:(id)a3
{
  v4 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v4);
}

- (void)connection:(id)a3 willCacheResponse:(id)a4 responseCallback:(id)a5
{
  v6 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 wasRedirected:(id)a4 newRequest:(id)a5 responseCallback:(id)a6
{
  v7 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v7);
}

- (void)connection:(id)a3 alternatePathAvailable:(int)a4
{
  v5 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v5);
}

- (void)connection:(id)a3 waitingWithReason:(int64_t)a4
{
  v5 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v5);
}

- (void)connection:(id)a3 sentBodyBytes:(id)a4 totalBytes:(id)a5 expectedBytes:(id)a6
{
  v7 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v7);
}

- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamFromOffset:(int64_t)a5 callback:(id)a6
{
  v7 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v7);
}

- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamCallback:(id)a5
{
  v6 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 didReceiveTCPConnection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5
{
  v6 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 didReceiveSocketInputStream:(id)a4 outputStream:(id)a5
{
  v6 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4 completion:(id)a5
{
  v6 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 didReceiveInformationalResponse:(id)a4
{
  v5 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v5);
}

- (void)connection:(id)a3 didReceiveData:(id)a4 completion:(id)a5
{
  v6 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 didFinishLoadingWithError:(id)a4
{
  v5 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v5);
}

- (void)connection:(id)a3 challenged:(id)a4 authCallback:(id)a5
{
  v6 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 _willSendRequestForEstablishedConnection:(id)a4 completion:(id)a5
{
  v6 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 _conditionalRequirementsChanged:(BOOL)a4
{
  v5 = (objc_class *)objc_opt_class();

  subclassMissingImplementation((objc_selector *)a2, v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = self;
  return self;
}

- (__NSCFURLLocalTCPIOStreamTaskFromDataTask)initWithTask:(id)a3 connection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5 disavow:(id)a6
{
  v6 = (std::__shared_weak_count *)*((void *)a4.__ptr_ + 1);
  uint64_t v10 = *(void *)a4.__ptr_;
  v11 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v9.receiver = self;
  v9.super_class = (Class)__NSCFURLLocalTCPIOStreamTaskFromDataTask;
  v7 = -[__NSCFTCPIOStreamTask initWithTask:connection:extraBytes:disavow:](&v9, sel_initWithTask_connection_extraBytes_disavow_, a3, &v10, a4.__cntrl_, a5, a6);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v11);
  }
  return v7;
}

@end