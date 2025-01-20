@interface AVFigEndpointUIAgentOutputContextManagerImpl
+ (OpaqueFigEndpointUIAgent)copySharedEndpointUIAgent;
- (AVFigEndpointUIAgentOutputContextManagerImpl)initWithEndpointUIAgent:(OpaqueFigEndpointUIAgent *)a3;
- (AVOutputContextManager)parentOutputContextManager;
- (void)_showErrorPromptForRouteDescriptor:(__CFDictionary *)a3 reason:(__CFString *)a4 didFailToConnectToOutputDeviceDictionary:(__CFDictionary *)a5;
- (void)dealloc;
- (void)setParentOutputContextManager:(id)a3;
@end

@implementation AVFigEndpointUIAgentOutputContextManagerImpl

+ (OpaqueFigEndpointUIAgent)copySharedEndpointUIAgent
{
  if (copySharedEndpointUIAgent_onceToken != -1) {
    dispatch_once(&copySharedEndpointUIAgent_onceToken, &__block_literal_global_344);
  }
  dispatch_sync((dispatch_queue_t)sSharedAgentQueue, &__block_literal_global_347);
  return (OpaqueFigEndpointUIAgent *)sSharedAgent;
}

dispatch_queue_t __73__AVFigEndpointUIAgentOutputContextManagerImpl_copySharedEndpointUIAgent__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("com.apple.avfoundation.avoutputcontext.uiagentqueue", v0);
  sSharedAgentQueue = (uint64_t)result;
  return result;
}

CFTypeRef __73__AVFigEndpointUIAgentOutputContextManagerImpl_copySharedEndpointUIAgent__block_invoke_2()
{
  CFTypeRef result = (CFTypeRef)sSharedAgent;
  if (sSharedAgent
    || (CFTypeRef result = (CFTypeRef)FigEndpointUIAgentXPCRemoteCreate(), sSharedAgent)
    && (CMNotificationCenterGetDefaultLocalCenter(),
        CMNotificationCenterAddListener(),
        (CFTypeRef result = (CFTypeRef)sSharedAgent) != 0))
  {
    return CFRetain(result);
  }
  return result;
}

- (AVFigEndpointUIAgentOutputContextManagerImpl)initWithEndpointUIAgent:(OpaqueFigEndpointUIAgent *)a3
{
  id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  v16.receiver = self;
  v16.super_class = (Class)AVFigEndpointUIAgentOutputContextManagerImpl;
  v6 = [(AVFigEndpointUIAgentOutputContextManagerImpl *)&v16 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_12;
  }
  if (!a3)
  {
    v13 = 0;
    v6->_agent = 0;
    goto LABEL_11;
  }
  v8 = (OpaqueFigEndpointUIAgent *)CFRetain(a3);
  v7->_agent = v8;
  if (!v8)
  {
LABEL_12:
    v13 = 0;
    goto LABEL_11;
  }
  v9 = [[AVWeakReference alloc] initWithReferencedObject:v7];
  v7->_weakObserver = v9;
  [v5 addListenerWithWeakReference:v9 callback:AVOutputContextManagerShowErrorPrompt name:*MEMORY[0x1E4F754B8] object:v7->_agent flags:0];
  agent = v7->_agent;
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  v14 = *(void (**)(OpaqueFigEndpointUIAgent *, uint64_t))(v12 + 24);
  if (v14) {
    v14(agent, 1);
  }
  v13 = v7;
LABEL_11:

  return v13;
}

- (void)dealloc
{
  if (self->_weakObserver) {
    objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVOutputContextManagerShowErrorPrompt, *MEMORY[0x1E4F754B8], self->_agent);
  }
  agent = self->_agent;
  if (agent) {
    CFRelease(agent);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVFigEndpointUIAgentOutputContextManagerImpl;
  [(AVFigEndpointUIAgentOutputContextManagerImpl *)&v4 dealloc];
}

- (void)_showErrorPromptForRouteDescriptor:(__CFDictionary *)a3 reason:(__CFString *)a4 didFailToConnectToOutputDeviceDictionary:(__CFDictionary *)a5
{
  v7 = +[AVOutputDevice outputDeviceWithRouteDescriptor:a3 withRoutingContext:0];
  if (FigCFEqual())
  {
    v8 = AVOutputContextDeviceConnectionFailureReasonDeviceInUse;
LABEL_13:
    v9 = *v8;
    goto LABEL_14;
  }
  if (FigCFEqual())
  {
    v8 = AVOutputContextDeviceConnectionFailureReasonDeviceOutOfRange;
    goto LABEL_13;
  }
  if (FigCFEqual())
  {
    v8 = AVOutputContextDeviceConnectionFailureReasonNotAPeerInHomeGroup;
    goto LABEL_13;
  }
  if (FigCFEqual())
  {
    v8 = AVOutputContextDeviceConnectionFailureReasonDeviceNotConnectedToInternet;
    goto LABEL_13;
  }
  if (FigCFEqual())
  {
    v8 = AVOutputContextDeviceConnectionFailureReasonDeviceNotMFiCertified;
    goto LABEL_13;
  }
  if (FigCFEqual())
  {
    v8 = AVOutputContextDeviceConnectionFailureReasonInfraRelayFailed2GHzNetwork;
    goto LABEL_13;
  }
  if (FigCFEqual()) {
    v9 = @"AVOutputContextDeviceConnectionFailureReasonInfraRelayFailedMultiDFSNetwork";
  }
  else {
    v9 = 0;
  }
LABEL_14:
  v10 = [(AVFigEndpointUIAgentOutputContextManagerImpl *)self parentOutputContextManager];
  [(AVOutputContextManager *)v10 outputContextManagerImpl:self observedFailureToConnectToOutputDevice:v7 reason:v9 didFailToConnectToOutputDeviceDictionary:a5];
}

- (AVOutputContextManager)parentOutputContextManager
{
  return (AVOutputContextManager *)objc_loadWeak((id *)&self->_parentManager);
}

- (void)setParentOutputContextManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end