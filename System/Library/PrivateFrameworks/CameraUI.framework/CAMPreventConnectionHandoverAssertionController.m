@interface CAMPreventConnectionHandoverAssertionController
- (CAMPreventConnectionHandoverAssertionController)init;
- (NFAssertion)_preventConnectionHandoverAssertion;
- (OS_dispatch_queue)_accessQueue;
- (void)_releaseAssertionIfHeld;
- (void)_requestAssertionIfUnheld;
- (void)_setPreventConnectionHandoverAssertion:(id)a3;
- (void)dealloc;
- (void)releaseAssertionIfHeld;
- (void)requestAssertionIfUnheld;
@end

@implementation CAMPreventConnectionHandoverAssertionController

- (CAMPreventConnectionHandoverAssertionController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CAMPreventConnectionHandoverAssertionController;
  v2 = [(CAMPreventConnectionHandoverAssertionController *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.camera.preventConnectionHandoverAssertionControllerQueue", v3);
    accessQueue = v2->__accessQueue;
    v2->__accessQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)dealloc
{
  [(CAMPreventConnectionHandoverAssertionController *)self _releaseAssertionIfHeld];
  v3.receiver = self;
  v3.super_class = (Class)CAMPreventConnectionHandoverAssertionController;
  [(CAMPreventConnectionHandoverAssertionController *)&v3 dealloc];
}

- (void)requestAssertionIfUnheld
{
  objc_initWeak(&location, self);
  objc_super v3 = [(CAMPreventConnectionHandoverAssertionController *)self _accessQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __75__CAMPreventConnectionHandoverAssertionController_requestAssertionIfUnheld__block_invoke;
  v4[3] = &unk_263FA0E00;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __75__CAMPreventConnectionHandoverAssertionController_requestAssertionIfUnheld__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _requestAssertionIfUnheld];
}

- (void)_requestAssertionIfUnheld
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "CAMPreventConnectionHandoverAssertionController - assertion request did fail with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)releaseAssertionIfHeld
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(CAMPreventConnectionHandoverAssertionController *)self _accessQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __73__CAMPreventConnectionHandoverAssertionController_releaseAssertionIfHeld__block_invoke;
  v4[3] = &unk_263FA0E00;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __73__CAMPreventConnectionHandoverAssertionController_releaseAssertionIfHeld__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _releaseAssertionIfHeld];
}

- (void)_releaseAssertionIfHeld
{
  uint64_t v3 = [(CAMPreventConnectionHandoverAssertionController *)self _preventConnectionHandoverAssertion];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F58118] sharedHardwareManagerWithNoUI];
    id v5 = [(CAMPreventConnectionHandoverAssertionController *)self _preventConnectionHandoverAssertion];
    id v6 = (id)[v4 releaseAssertion:v5];

    [(CAMPreventConnectionHandoverAssertionController *)self _setPreventConnectionHandoverAssertion:0];
    objc_super v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "CAMPreventConnectionHandoverAssertionController - assertion released", v8, 2u);
    }
  }
}

- (NFAssertion)_preventConnectionHandoverAssertion
{
  return self->__preventConnectionHandoverAssertion;
}

- (void)_setPreventConnectionHandoverAssertion:(id)a3
{
}

- (OS_dispatch_queue)_accessQueue
{
  return self->__accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessQueue, 0);
  objc_storeStrong((id *)&self->__preventConnectionHandoverAssertion, 0);
}

@end