@interface AKNativeAnisetteServiceTrafficManager
+ (id)sharedSigningService;
- (AKNativeAnisetteServiceTrafficManager)init;
- (AKSigningTrafficClearanceRequest)activeSigningRequest;
- (NSMutableArray)pendingSigningRequests;
- (OS_dispatch_queue)trafficQueue;
- (void)setActiveSigningRequest:(id)a3;
- (void)setPendingSigningRequests:(id)a3;
@end

@implementation AKNativeAnisetteServiceTrafficManager

- (AKSigningTrafficClearanceRequest)activeSigningRequest
{
  return self->_activeSigningRequest;
}

- (NSMutableArray)pendingSigningRequests
{
  return self->_pendingSigningRequests;
}

+ (id)sharedSigningService
{
  if (qword_100272388 != -1) {
    dispatch_once(&qword_100272388, &stru_100227AE0);
  }
  v2 = (void *)qword_100272380;

  return v2;
}

- (void)setActiveSigningRequest:(id)a3
{
}

- (OS_dispatch_queue)trafficQueue
{
  return self->_trafficQueue;
}

- (AKNativeAnisetteServiceTrafficManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKNativeAnisetteServiceTrafficManager;
  v2 = [(AKNativeAnisetteServiceTrafficManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    pendingSigningRequests = v2->_pendingSigningRequests;
    v2->_pendingSigningRequests = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)setPendingSigningRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficQueue, 0);
  objc_storeStrong((id *)&self->_activeSigningRequest, 0);

  objc_storeStrong((id *)&self->_pendingSigningRequests, 0);
}

@end