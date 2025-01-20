@interface AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl
- (AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl)initWithFigEndpointUIAgent:(OpaqueFigEndpointUIAgent *)a3;
- (AVOutputDeviceAuthorizationSession)parentAuthorizationSession;
- (OpaqueFigEndpointUIAgent)figEndpointUIAgent;
- (void)_finishedWithPrompt;
- (void)_notifyCurrentRequestOfTerminalStatus:(int64_t)a3 error:(id)a4;
- (void)_showAuthPromptWithUniqueID:(id)a3 routeDescriptor:(__CFDictionary *)a4 pinMode:(BOOL)a5 reason:(__CFString *)a6;
- (void)_startNewRequest:(id)a3 impl:(id)a4;
- (void)dealloc;
- (void)outputDeviceAuthorizationRequestImpl:(id)a3 didRespondWithAuthorizationToken:(id)a4;
- (void)outputDeviceAuthorizationRequestImplDidCancel:(id)a3;
- (void)setParentAuthorizationSession:(id)a3;
@end

@implementation AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl

- (AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl)initWithFigEndpointUIAgent:(OpaqueFigEndpointUIAgent *)a3
{
  id v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  v16.receiver = self;
  v16.super_class = (Class)AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl;
  v6 = [(AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *)&v16 init];
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
  [v5 addListenerWithWeakReference:v9 callback:AVOutputDeviceAuthorizationSessionShowAuthPrompt name:*MEMORY[0x1E4F754B0] object:v7->_agent flags:0];
  [v5 addListenerWithWeakReference:v7->_weakObserver callback:AVOutputDeviceAuthorizationSessionShowFinishedWithPrompt name:*MEMORY[0x1E4F754A0] object:v7->_agent flags:0];
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
  if (self->_weakObserver)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVOutputDeviceAuthorizationSessionShowAuthPrompt name:*MEMORY[0x1E4F754B0] object:self->_agent];
    [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVOutputDeviceAuthorizationSessionShowFinishedWithPrompt name:*MEMORY[0x1E4F754A0] object:self->_agent];
  }

  agent = self->_agent;
  if (agent) {
    CFRelease(agent);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl;
  [(AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *)&v5 dealloc];
}

- (OpaqueFigEndpointUIAgent)figEndpointUIAgent
{
  return self->_agent;
}

- (void)_showAuthPromptWithUniqueID:(id)a3 routeDescriptor:(__CFDictionary *)a4 pinMode:(BOOL)a5 reason:(__CFString *)a6
{
  BOOL v6 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a6 && dword_1E9356A10)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (FigCFEqual())
  {
    uint64_t v11 = +[AVOutputDevice outputDeviceWithRouteDescriptor:a4 withRoutingContext:0];
    uint64_t v12 = [AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl alloc];
    v13 = &AVOutputDeviceAuthorizationTokenTypePIN;
    if (!v6) {
      v13 = AVOutputDeviceAuthorizationTokenTypePassword;
    }
    v14 = -[AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl initWithID:outputDevice:authorizationTokenType:](v12, "initWithID:outputDevice:authorizationTokenType:", a3, v11, *v13, v25, v26);
    v15 = [[AVOutputDeviceAuthorizationRequest alloc] initWithOutputDeviceAuthorizationRequestImpl:v14];
    [(AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *)self _startNewRequest:v15 impl:v14];
  }
  else if (FigCFEqual())
  {
    objc_super v16 = self->_currentRequest;
    if ([(AVOutputDeviceAuthorizationSession *)[(AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *)self parentAuthorizationSession] outputDeviceAuthorizationSessionImpl:self shouldRetryAuthorizationRequest:v16 reason:@"AVOutputDeviceAuthorizationRequestRetryReasonIncorrectAuthorizationToken"])
    {
      v17 = [[AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl alloc] initWithID:[(AVOutputDeviceAuthorizationRequest *)v16 ID] outputDevice:[(AVOutputDeviceAuthorizationRequest *)v16 outputDevice] authorizationTokenType:[(AVOutputDeviceAuthorizationRequest *)v16 authorizationTokenType]];
      v18 = [[AVOutputDeviceAuthorizationRequest alloc] initWithOutputDeviceAuthorizationRequestImpl:v17];
      [(AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *)self _notifyCurrentRequestOfTerminalStatus:2 error:0];
      [(AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *)self _startNewRequest:v18 impl:v17];
    }
    else
    {
      if ([(NSString *)[(AVOutputDeviceAuthorizationRequest *)v16 authorizationTokenType] isEqualToString:@"AVOutputDeviceAuthorizationTokenTypePIN"])
      {
        uint64_t v20 = -11908;
      }
      else
      {
        uint64_t v20 = -11909;
      }
      [(AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *)self _notifyCurrentRequestOfTerminalStatus:5 error:AVLocalizedError(@"AVFoundationErrorDomain", v20, 0)];
      agent = self->_agent;
      uint64_t v22 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v22) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = 0;
      }
      v24 = *(void (**)(OpaqueFigEndpointUIAgent *, void, uint64_t))(v23 + 8);
      if (v24) {
        v24(agent, 0, 1);
      }
    }
  }
  else
  {
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)_startNewRequest:(id)a3 impl:(id)a4
{
  self->_currentRequest = (AVOutputDeviceAuthorizationRequest *)a3;
  v7 = (AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl *)a4;
  self->_currentRequestImpl = v7;
  [(AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl *)v7 setParentAuthorizationSessionImpl:self];
  v8 = [(AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *)self parentAuthorizationSession];
  [(AVOutputDeviceAuthorizationSession *)v8 outputDeviceAuthorizationSessionImpl:self didProvideAuthorizationRequest:a3];
}

- (void)_notifyCurrentRequestOfTerminalStatus:(int64_t)a3 error:(id)a4
{
  self->_currentRequestImpl = 0;
  self->_currentRequest = 0;
}

- (void)_finishedWithPrompt
{
}

- (void)outputDeviceAuthorizationRequestImpl:(id)a3 didRespondWithAuthorizationToken:(id)a4
{
  if (dword_1E9356A10)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  agent = self->_agent;
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = *(void (**)(OpaqueFigEndpointUIAgent *, id, void))(v9 + 8);
  if (v10) {
    v10(agent, a4, 0);
  }
}

- (void)outputDeviceAuthorizationRequestImplDidCancel:(id)a3
{
  if (dword_1E9356A10)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  agent = self->_agent;
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void (**)(OpaqueFigEndpointUIAgent *, void, uint64_t))(v7 + 8);
  if (v8) {
    v8(agent, 0, 1);
  }
}

- (AVOutputDeviceAuthorizationSession)parentAuthorizationSession
{
  return (AVOutputDeviceAuthorizationSession *)objc_loadWeak((id *)&self->_parentSession);
}

- (void)setParentAuthorizationSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end