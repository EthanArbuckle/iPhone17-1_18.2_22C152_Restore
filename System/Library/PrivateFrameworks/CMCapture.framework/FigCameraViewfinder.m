@interface FigCameraViewfinder
+ (BOOL)clientIsAllowedToUseCameraViewfinder:(id *)a3;
+ (id)cameraViewfinder;
- (FigCameraViewfinder)init;
- (FigCameraViewfinderDelegate)delegate;
- (FigCameraViewfinderSession)delegateActiveViewfinderSession;
- (OS_dispatch_queue)queue;
- (void)dealloc;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateActiveViewfinderSession:(id)a3;
- (void)startWithOptions:(id)a3;
- (void)stop;
@end

@implementation FigCameraViewfinder

- (void)setDelegate:(id)a3 queue:(id)a4
{
}

+ (BOOL)clientIsAllowedToUseCameraViewfinder:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v3;
  return FigCaptureClientHasEntitlement(v5, @"com.apple.coremedia.cameraviewfinder");
}

- (FigCameraViewfinder)init
{
  v5.receiver = self;
  v5.super_class = (Class)FigCameraViewfinder;
  v2 = [(FigCameraViewfinder *)&v5 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    if (v3 == objc_opt_class())
    {

      return (FigCameraViewfinder *)objc_alloc_init(FigCameraViewfinderRemote);
    }
    else
    {
      v2->_delegateStorage = objc_alloc_init(FigDelegateStorage);
    }
  }
  return v2;
}

- (void)setDelegateActiveViewfinderSession:(id)a3
{
}

- (FigCameraViewfinderDelegate)delegate
{
  return (FigCameraViewfinderDelegate *)[(FigDelegateStorage *)self->_delegateStorage delegate];
}

+ (id)cameraViewfinder
{
  return +[FigCameraViewfinderRemote cameraViewfinder];
}

- (void)startWithOptions:(id)a3
{
  objc_super v5 = (objc_class *)objc_opt_class();
  _requestConcreteImplementation((objc_class *)self, a2, v5);
}

- (void)stop
{
  v4 = (objc_class *)objc_opt_class();
  _requestConcreteImplementation((objc_class *)self, a2, v4);
}

- (OS_dispatch_queue)queue
{
  return [(FigDelegateStorage *)self->_delegateStorage delegateQueue];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinder;
  [(FigCameraViewfinder *)&v3 dealloc];
}

- (FigCameraViewfinderSession)delegateActiveViewfinderSession
{
  return self->_delegateActiveViewfinderSession;
}

@end