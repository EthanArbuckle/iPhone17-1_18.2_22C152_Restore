@interface CMCaptureFrameSenderEndpointObserver
- (CMCaptureFrameSenderEndpointObserver)initWithEndpointsChangedHandler:(id)a3;
- (void)_handleFrameServerEndpointsChangedNotification:(id)a3;
- (void)dealloc;
@end

@implementation CMCaptureFrameSenderEndpointObserver

- (CMCaptureFrameSenderEndpointObserver)initWithEndpointsChangedHandler:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMCaptureFrameSenderEndpointObserver;
  v4 = [(CMCaptureFrameSenderEndpointObserver *)&v8 init];
  if (v4)
  {
    v4->_endpointsChangedHandler = (id)[a3 copy];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4->_frameSenderEndpointsChangedNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.cmio.frame-sender-endpoint-observer", v5);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter"), "addObserver:selector:name:object:", v4, sel__handleFrameServerEndpointsChangedNotification_, @"FrameServerEndpointsChanged", 0);
    v6 = FigCaptureSourceRemoteCopyFrameSenderEndpoints();
    (*((void (**)(void))v4->_endpointsChangedHandler + 2))();
  }
  return v4;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter"), "removeObserver:name:object:", self, @"FrameServerEndpointsChanged", 0);

  v3.receiver = self;
  v3.super_class = (Class)CMCaptureFrameSenderEndpointObserver;
  [(CMCaptureFrameSenderEndpointObserver *)&v3 dealloc];
}

- (void)_handleFrameServerEndpointsChangedNotification:(id)a3
{
  frameSenderEndpointsChangedNotificationQueue = self->_frameSenderEndpointsChangedNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__CMCaptureFrameSenderEndpointObserver__handleFrameServerEndpointsChangedNotification___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(frameSenderEndpointsChangedNotificationQueue, block);
}

void __87__CMCaptureFrameSenderEndpointObserver__handleFrameServerEndpointsChangedNotification___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    v2 = FigCaptureSourceRemoteCopyFrameSenderEndpoints();
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
  }
}

@end