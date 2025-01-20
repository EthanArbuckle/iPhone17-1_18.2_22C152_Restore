@interface FBSOrientationObserverClient
- (FBSOrientationObserverClient)initWithDelegate:(id)a3 calloutQueue:(id)a4;
- (int64_t)activeInterfaceOrientation;
- (void)_getActiveInterfaceOrientationSynchronously:(BOOL)a3 withCompletion:(id)a4;
- (void)activeInterfaceOrientationWithCompletion:(id)a3;
- (void)configureConnectMessage:(id)a3;
- (void)handleMessage:(id)a3 withType:(int64_t)a4;
- (void)invalidate;
- (void)registerOrientationInterest:(unsigned int)a3;
@end

@implementation FBSOrientationObserverClient

- (FBSOrientationObserverClient)initWithDelegate:(id)a3 calloutQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__FBSOrientationObserverClient_initWithDelegate_calloutQueue___block_invoke;
  v13[3] = &unk_1E58F6448;
  id v8 = v7;
  id v14 = v8;
  v12.receiver = self;
  v12.super_class = (Class)FBSOrientationObserverClient;
  v9 = [(FBSServiceFacilityClient *)&v12 initWithConfigurator:v13];
  v10 = v9;
  if (v9) {
    objc_storeWeak((id *)&v9->_delegate, v6);
  }

  return v10;
}

- (void)activeInterfaceOrientationWithCompletion:(id)a3
{
}

- (void)_getActiveInterfaceOrientationSynchronously:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[FBSXPCMessage message];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__FBSOrientationObserverClient__getActiveInterfaceOrientationSynchronously_withCompletion___block_invoke;
  v9[3] = &unk_1E58F64E0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(FBSServiceFacilityClient *)self sendMessage:v7 withType:1 replyHandler:v9 waitForReply:v4 timeout:0.0];
}

void __60__FBSOrientationObserverClient_registerOrientationInterest___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
}

- (void)configureConnectMessage:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained handleOrientationResetForClient:self];

  xpc_object_t xdict = [v5 payload];

  xpc_dictionary_set_uint64(xdict, "interest", self->_interest);
}

void __62__FBSOrientationObserverClient_initWithDelegate_calloutQueue___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = +[FBSServiceFacilityClient defaultShellEndpoint];
  [v5 setEndpoint:v3];

  [v5 setIdentifier:@"com.apple.frontboardservices.orientation-observer"];
  BOOL v4 = [off_1E58F4580 userInitiated];
  [v5 setServiceQuality:v4];

  if (*(void *)(a1 + 32)) {
    [v5 setCalloutQueue:];
  }
}

uint64_t __60__FBSOrientationObserverClient_registerOrientationInterest___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) handleMessage:a2 withType:0];
  }
  return result;
}

- (void)registerOrientationInterest:(unsigned int)a3
{
  self->_interest = a3;
  if (a3)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __60__FBSOrientationObserverClient_registerOrientationInterest___block_invoke;
    objc_super v12 = &unk_1E58F6498;
    v13 = self;
  }
  id v5 = (void *)MEMORY[0x19F3991F0]();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__FBSOrientationObserverClient_registerOrientationInterest___block_invoke_2;
  v7[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
  unsigned int v8 = a3;
  id v6 = +[FBSXPCMessage messageWithPacker:v7];
  [(FBSServiceFacilityClient *)self sendMessage:v6 withType:0 replyHandler:v5 waitForReply:0 timeout:0.0];
}

- (void)handleMessage:(id)a3 withType:(int64_t)a4
{
  id v6 = [a3 payload];
  id v7 = v6;
  if (!a4)
  {
    int64_t int64 = xpc_dictionary_get_int64(v6, "uiorientation");
    uint64_t int64 = xpc_dictionary_get_uint64(v7, "sequence-number");
    if (!uint64)
    {
      uint64_t v10 = FBLogInterfaceOrientationObserver();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[FBSOrientationObserverClient handleMessage:withType:]((uint64_t)self, v10);
      }
    }
    v11 = xpc_dictionary_get_value(v7, "duration");
    objc_super v12 = v11;
    double value = 0.0;
    if (v11 && object_getClass(v11) == (Class)MEMORY[0x1E4F14598]) {
      double value = xpc_double_get_value(v12);
    }
    id v14 = xpc_dictionary_get_value(v7, "rotation-direction");
    v15 = v14;
    if (v14 && object_getClass(v14) == (Class)MEMORY[0x1E4F145C0]) {
      int64_t v16 = xpc_int64_get_value(v15);
    }
    else {
      int64_t v16 = 0;
    }
    v17 = [[FBSOrientationUpdate alloc] initWithOrientation:int64 sequenceNumber:uint64 duration:v16 rotationDirection:value];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained client:self handleOrientationUpdate:v17];
  }
}

void __91__FBSOrientationObserverClient__getActiveInterfaceOrientationSynchronously_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 payload];
  BOOL v4 = v3;
  if (v3)
  {
    int64_t int64 = xpc_dictionary_get_int64(v3, "uiorientation");
    uint64_t int64 = xpc_dictionary_get_uint64(v4, "sequence-number");
  }
  else
  {
    id v7 = FBLogInterfaceOrientationObserver();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __91__FBSOrientationObserverClient__getActiveInterfaceOrientationSynchronously_withCompletion___block_invoke_cold_1(a1, v7);
    }

    uint64_t int64 = 0;
    int64_t int64 = 0;
  }
  unsigned int v8 = [[FBSOrientationUpdate alloc] initWithOrientation:int64 sequenceNumber:uint64 duration:0 rotationDirection:0.0];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, FBSOrientationUpdate *))(v9 + 16))(v9, v8);
  }
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)FBSOrientationObserverClient;
  [(FBSServiceFacilityClient *)&v3 invalidate];
}

- (int64_t)activeInterfaceOrientation
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__FBSOrientationObserverClient_activeInterfaceOrientation__block_invoke;
  v4[3] = &unk_1E58F6470;
  v4[4] = &v5;
  [(FBSOrientationObserverClient *)self _getActiveInterfaceOrientationSynchronously:1 withCompletion:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __58__FBSOrientationObserverClient_activeInterfaceOrientation__block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    result = [a2 orientation];
    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 24) = result;
  }
  return result;
}

- (void).cxx_destruct
{
}

void __91__FBSOrientationObserverClient__getActiveInterfaceOrientationSynchronously_withCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19C680000, a2, OS_LOG_TYPE_ERROR, "<%p>: _getActiveInterfaceOrientationSynchronously:withCompletion - nil reply payload.", (uint8_t *)&v3, 0xCu);
}

- (void)handleMessage:(uint64_t)a1 withType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = 0;
  _os_log_error_impl(&dword_19C680000, a2, OS_LOG_TYPE_ERROR, "<%p>: handleMessage:withType: - invalid sequenceNumber: %lu for orientation change.", (uint8_t *)&v2, 0x16u);
}

@end