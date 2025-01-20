@interface CATDeviceSessionBackedDevicePairingTerminal
- (BOOL)isInvalidated;
- (CATDeviceSessionBackedDevicePairingTerminal)initWithDeviceSession:(id)a3;
- (CATSharingDevice)device;
- (void)_beginPairing:(id)a3 withCompletion:(id)a4;
- (void)_invalidate;
- (void)_tryPIN:(id)a3;
- (void)_verifyPairingAndFetchStableIdentifierWithCompletion:(id)a3;
- (void)addSessionHandlers;
- (void)beginPairing:(id)a3 withCompletion:(id)a4;
- (void)deviceSessionEncounteredError:(id)a3;
- (void)deviceSessionInvalidated:(id)a3;
- (void)deviceSessionReady;
- (void)fetchStableIdentifier;
- (void)fetchStableIdentifierFinished:(id)a3;
- (void)invalidate;
- (void)invalidateWithError:(id)a3;
- (void)pairingCompleteWithError:(id)a3;
- (void)removeSessionHandlers;
- (void)sessionHasPromptedForPINWithWaitTime:(unint64_t)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)tryPIN:(id)a3;
- (void)vendConnectionForCompletion:(id)a3;
- (void)verifyPairing;
- (void)verifyPairingAndFetchStableIdentifierWithCompletion:(id)a3;
- (void)verifyPairingFinished:(BOOL)a3;
@end

@implementation CATDeviceSessionBackedDevicePairingTerminal

- (CATDeviceSessionBackedDevicePairingTerminal)initWithDeviceSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATDeviceSessionBackedDevicePairingTerminal;
  v6 = [(CATDeviceSessionBackedDevicePairingTerminal *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mDeviceSession, a3);
  }

  return v7;
}

- (CATSharingDevice)device
{
  return (CATSharingDevice *)[(CATSharingDeviceSession *)self->mDeviceSession remoteDevice];
}

- (void)verifyPairingAndFetchStableIdentifierWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __99__CATDeviceSessionBackedDevicePairingTerminal_verifyPairingAndFetchStableIdentifierWithCompletion___block_invoke;
  v8[3] = &unk_2641DC2F0;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  v6 = v8;
  v7 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_2641DBD98;
  id v13 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __99__CATDeviceSessionBackedDevicePairingTerminal_verifyPairingAndFetchStableIdentifierWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _verifyPairingAndFetchStableIdentifierWithCompletion:*(void *)(a1 + 32)];
}

- (void)beginPairing:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__CATDeviceSessionBackedDevicePairingTerminal_beginPairing_withCompletion___block_invoke;
  v12[3] = &unk_2641DC318;
  objc_copyWeak(&v15, &location);
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v10 = v12;
  v11 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_2641DBD98;
  id v18 = v10;
  dispatch_async(v11, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __75__CATDeviceSessionBackedDevicePairingTerminal_beginPairing_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _beginPairing:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

- (void)tryPIN:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__CATDeviceSessionBackedDevicePairingTerminal_tryPIN___block_invoke;
  v8[3] = &unk_2641DC0C0;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = v8;
  id v7 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_2641DBD98;
  id v13 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __54__CATDeviceSessionBackedDevicePairingTerminal_tryPIN___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _tryPIN:*(void *)(a1 + 32)];
}

- (void)invalidate
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__CATDeviceSessionBackedDevicePairingTerminal_invalidate__block_invoke;
  v4[3] = &unk_2641DBCB0;
  objc_copyWeak(&v5, &location);
  v2 = v4;
  v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_2641DBD98;
  id v8 = v2;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__CATDeviceSessionBackedDevicePairingTerminal_invalidate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidate];
}

- (void)_verifyPairingAndFetchStableIdentifierWithCompletion:(id)a3
{
  id v9 = (void (**)(id, void *, void))a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if ([(CATDeviceSessionBackedDevicePairingTerminal *)self isInvalidated])
  {
    uint64_t v5 = 706;
LABEL_5:
    id v6 = CATErrorWithCodeAndUserInfo(v5, 0);
    v9[2](v9, v6, 0);

    goto LABEL_7;
  }
  if (self->mVerifyPairingCompletion)
  {
    uint64_t v5 = 707;
    goto LABEL_5;
  }
  id v7 = (void *)MEMORY[0x216693330](v9);
  id mVerifyPairingCompletion = self->mVerifyPairingCompletion;
  self->id mVerifyPairingCompletion = v7;

  [(CATDeviceSessionBackedDevicePairingTerminal *)self addSessionHandlers];
  [(CATSharingDeviceSession *)self->mDeviceSession activate];
LABEL_7:
}

- (void)_beginPairing:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = CATGetCatalystQueue();
  CATAssertIsQueue(v8);

  if ([(CATDeviceSessionBackedDevicePairingTerminal *)self isInvalidated])
  {
    uint64_t v9 = 706;
  }
  else if (self->mVerifyPairingCompletion)
  {
    uint64_t v9 = 707;
  }
  else if ([(CATSharingDeviceSession *)self->mDeviceSession isReady])
  {
    if (!self->mBeginPairingCompletion)
    {
      v11 = (void *)MEMORY[0x216693330](v7);
      id mBeginPairingCompletion = self->mBeginPairingCompletion;
      self->id mBeginPairingCompletion = v11;

      id v13 = (void *)MEMORY[0x216693330](v6);
      id mPINPromptHandler = self->mPINPromptHandler;
      self->id mPINPromptHandler = v13;

      objc_initWeak(&location, self);
      mDeviceSession = self->mDeviceSession;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __76__CATDeviceSessionBackedDevicePairingTerminal__beginPairing_withCompletion___block_invoke;
      v16[3] = &unk_2641DC340;
      objc_copyWeak(&v17, &location);
      [(CATSharingDeviceSession *)mDeviceSession beginPairWithCompletion:v16];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
      goto LABEL_10;
    }
    uint64_t v9 = 709;
  }
  else
  {
    uint64_t v9 = 708;
  }
  id v10 = CATErrorWithCodeAndUserInfo(v9, 0);
  v7[2](v7, v10, 0);

LABEL_10:
}

void __76__CATDeviceSessionBackedDevicePairingTerminal__beginPairing_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__CATDeviceSessionBackedDevicePairingTerminal__beginPairing_withCompletion___block_invoke_2;
  v7[3] = &unk_2641DC138;
  id v4 = v3;
  id v8 = v4;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  uint64_t v5 = v7;
  id v6 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_2641DBD98;
  id v11 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v9);
}

void __76__CATDeviceSessionBackedDevicePairingTerminal__beginPairing_withCompletion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2 && [v2 failureType])
  {
    id v4 = [*(id *)(a1 + 32) underlyingError];
  }
  else
  {
    id v4 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained pairingCompleteWithError:v4];
}

- (void)_tryPIN:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  if ([(CATDeviceSessionBackedDevicePairingTerminal *)self isInvalidated])
  {
    id v7 = _CATLogGeneral_3();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = NSStringFromSelector(a2);
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_213B7F000, v7, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    [(CATSharingDeviceSession *)self->mDeviceSession tryPairingPIN:v5];
  }
}

- (void)_invalidate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if ([(CATDeviceSessionBackedDevicePairingTerminal *)self isInvalidated])
  {
    id v5 = _CATLogGeneral_3();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      int v9 = v6;
      _os_log_impl(&dword_213B7F000, v5, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", buf, 0xCu);
    }
  }
  else
  {
    [(CATDeviceSessionBackedDevicePairingTerminal *)self removeSessionHandlers];
    [(CATSharingDeviceSession *)self->mDeviceSession deactivate];
    CATErrorWithCodeAndUserInfo(705, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CATDeviceSessionBackedDevicePairingTerminal invalidateWithError:](self, "invalidateWithError:");
  }
}

- (void)addSessionHandlers
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke;
  v10[3] = &unk_2641DC028;
  objc_copyWeak(&v11, &location);
  [(CATSharingDeviceSession *)self->mDeviceSession setDeviceSessionInvalidatedHandler:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_3;
  v8[3] = &unk_2641DC028;
  objc_copyWeak(&v9, &location);
  [(CATSharingDeviceSession *)self->mDeviceSession setDeviceSessionErrorHandler:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_5;
  v6[3] = &unk_2641DBCB0;
  objc_copyWeak(&v7, &location);
  [(CATSharingDeviceSession *)self->mDeviceSession setDeviceSessionReadyHandler:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_7;
  v4[3] = &unk_2641DC390;
  objc_copyWeak(&v5, &location);
  [(CATSharingDeviceSession *)self->mDeviceSession setPinPromptHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_2;
  v7[3] = &unk_2641DC0C0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v4 = v3;
  id v8 = v4;
  id v5 = v7;
  id v6 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_2641DBD98;
  id v11 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v9);
}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained deviceSessionInvalidated:*(void *)(a1 + 32)];
}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_4;
  v7[3] = &unk_2641DC0C0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v4 = v3;
  id v8 = v4;
  id v5 = v7;
  id v6 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_2641DBD98;
  id v11 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(&v9);
}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained deviceSessionEncounteredError:*(void *)(a1 + 32)];
}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_5(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_6;
  v3[3] = &unk_2641DBCB0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v1 = v3;
  v2 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_2641DBD98;
  id v6 = v1;
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained deviceSessionReady];
}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_8;
  v8[3] = &unk_2641DC368;
  objc_copyWeak(v9, (id *)(a1 + 32));
  v9[1] = a3;
  id v6 = v8;
  id v7 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_2641DBD98;
  id v11 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(v9);
}

void __65__CATDeviceSessionBackedDevicePairingTerminal_addSessionHandlers__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sessionHasPromptedForPINWithWaitTime:*(void *)(a1 + 40)];
}

- (void)deviceSessionInvalidated:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  BOOL v7 = [(CATDeviceSessionBackedDevicePairingTerminal *)self isInvalidated];
  id v8 = _CATLogGeneral_3();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = NSStringFromSelector(a2);
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_213B7F000, v9, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[CATDeviceSessionBackedDevicePairingTerminal deviceSessionInvalidated:]((uint64_t)self, v9);
  }

  [(CATDeviceSessionBackedDevicePairingTerminal *)self removeSessionHandlers];
  if (!v5)
  {
    id v9 = CATErrorWithCodeAndUserInfo(1, 0);
    [(CATDeviceSessionBackedDevicePairingTerminal *)self invalidateWithError:v9];
LABEL_9:

    goto LABEL_10;
  }
  [(CATDeviceSessionBackedDevicePairingTerminal *)self invalidateWithError:v5];
LABEL_10:
}

- (void)deviceSessionEncounteredError:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  BOOL v7 = [(CATDeviceSessionBackedDevicePairingTerminal *)self isInvalidated];
  id v8 = _CATLogGeneral_3();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = NSStringFromSelector(a2);
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_213B7F000, v9, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(CATDeviceSessionBackedDevicePairingTerminal *)(uint64_t)self deviceSessionEncounteredError:v9];
  }

  [(CATDeviceSessionBackedDevicePairingTerminal *)self removeSessionHandlers];
  if (!v5)
  {
    id v9 = CATErrorWithCodeAndUserInfo(1, 0);
    [(CATDeviceSessionBackedDevicePairingTerminal *)self invalidateWithError:v9];
LABEL_9:

    goto LABEL_10;
  }
  [(CATDeviceSessionBackedDevicePairingTerminal *)self invalidateWithError:v5];
LABEL_10:
}

- (void)deviceSessionReady
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  BOOL v5 = [(CATDeviceSessionBackedDevicePairingTerminal *)self isInvalidated];
  id v6 = _CATLogGeneral_3();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      id v8 = NSStringFromSelector(a2);
      int v10 = 138543362;
      int v11 = v8;
      _os_log_impl(&dword_213B7F000, v6, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      id v9 = [(CATSharingDeviceSession *)self->mDeviceSession description];
      int v10 = 138543362;
      int v11 = v9;
      _os_log_impl(&dword_213B7F000, v6, OS_LOG_TYPE_INFO, "Device Session %{public}@ ready", (uint8_t *)&v10, 0xCu);
    }
    [(CATDeviceSessionBackedDevicePairingTerminal *)self verifyPairing];
  }
}

- (void)verifyPairing
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if ([(CATDeviceSessionBackedDevicePairingTerminal *)self isInvalidated])
  {
    BOOL v5 = _CATLogGeneral_3();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      int v10 = v6;
      _os_log_impl(&dword_213B7F000, v5, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", buf, 0xCu);
    }
  }
  else
  {
    mDeviceSession = self->mDeviceSession;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__CATDeviceSessionBackedDevicePairingTerminal_verifyPairing__block_invoke;
    v8[3] = &unk_2641DC3B8;
    void v8[4] = self;
    [(CATSharingDeviceSession *)mDeviceSession verifyPairing:v8];
  }
}

void __60__CATDeviceSessionBackedDevicePairingTerminal_verifyPairing__block_invoke(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__CATDeviceSessionBackedDevicePairingTerminal_verifyPairing__block_invoke_2;
  v4[3] = &unk_2641DC160;
  void v4[4] = *(void *)(a1 + 32);
  char v5 = a2;
  v2 = v4;
  id v3 = CATGetCatalystQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_8;
  block[3] = &unk_2641DBD98;
  id v7 = v2;
  dispatch_async(v3, block);
}

uint64_t __60__CATDeviceSessionBackedDevicePairingTerminal_verifyPairing__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) verifyPairingFinished:*(unsigned __int8 *)(a1 + 40)];
}

- (void)verifyPairingFinished:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  if ([(CATDeviceSessionBackedDevicePairingTerminal *)self isInvalidated])
  {
    id v7 = _CATLogGeneral_3();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v8;
      _os_log_impl(&dword_213B7F000, v7, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", buf, 0xCu);
    }
  }
  else if (a3)
  {
    [(CATDeviceSessionBackedDevicePairingTerminal *)self fetchStableIdentifier];
  }
  else
  {
    uint64_t v11 = (void (**)(id, void *, void))MEMORY[0x216693330](self->mVerifyPairingCompletion);
    id mVerifyPairingCompletion = self->mVerifyPairingCompletion;
    self->id mVerifyPairingCompletion = 0;

    int v10 = CATErrorWithCodeAndUserInfo(704, 0);
    v11[2](v11, v10, 0);
  }
}

- (void)sessionHasPromptedForPINWithWaitTime:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = CATGetCatalystQueue();
  CATAssertIsQueue(v6);

  if ([(CATDeviceSessionBackedDevicePairingTerminal *)self isInvalidated])
  {
    id v7 = _CATLogGeneral_3();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_213B7F000, v7, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", buf, 0xCu);
    }
  }
  else
  {
    id v9 = (void (**)(void, void))MEMORY[0x216693330](self->mPINPromptHandler);
    if (v9)
    {
      id v10 = v9;
      v9[2](v9, a3);
      id v9 = (void (**)(void, void))v10;
    }
  }
}

- (void)fetchStableIdentifier
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  if ([(CATDeviceSessionBackedDevicePairingTerminal *)self isInvalidated])
  {
    char v5 = _CATLogGeneral_3();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = NSStringFromSelector(a2);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_213B7F000, v5, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    id v9[2] = __68__CATDeviceSessionBackedDevicePairingTerminal_fetchStableIdentifier__block_invoke;
    v9[3] = &unk_2641DBE60;
    v9[4] = self;
    id v7 = v9;
    id v8 = CATGetCatalystQueue();
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v11 = __CATPerformBlock_block_invoke_8;
    uint64_t v12 = &unk_2641DBD98;
    id v13 = v7;
    dispatch_async(v8, &buf);
  }
}

uint64_t __68__CATDeviceSessionBackedDevicePairingTerminal_fetchStableIdentifier__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchStableIdentifierFinished:0];
}

- (void)fetchStableIdentifierFinished:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  if ([(CATDeviceSessionBackedDevicePairingTerminal *)self isInvalidated])
  {
    id v6 = _CATLogGeneral_3();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = NSStringFromSelector(a2);
      *(_DWORD *)long long buf = 138543362;
      id v17 = v7;
      _os_log_impl(&dword_213B7F000, v6, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", buf, 0xCu);
    }
    return;
  }
  id v15 = (id)MEMORY[0x216693330](self->mVerifyPairingCompletion);
  id v8 = (void *)MEMORY[0x216693330](self->mBeginPairingCompletion);
  if (v15)
  {
    id mVerifyPairingCompletion = self->mVerifyPairingCompletion;
    self->id mVerifyPairingCompletion = 0;

    id v10 = self;
    id v11 = v15;
  }
  else
  {
    if (!v8)
    {
      uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"CATDeviceSessionBackedDevicePairingTerminal.m", 349, @"Stable identifier was fetched, but no completions were set." object file lineNumber description];

      goto LABEL_10;
    }
    id mBeginPairingCompletion = self->mBeginPairingCompletion;
    self->id mBeginPairingCompletion = 0;

    id mPINPromptHandler = self->mPINPromptHandler;
    self->id mPINPromptHandler = 0;

    id v10 = self;
    id v11 = v8;
  }
  [(CATDeviceSessionBackedDevicePairingTerminal *)v10 vendConnectionForCompletion:v11];
LABEL_10:
}

- (void)pairingCompleteWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  if ([(CATDeviceSessionBackedDevicePairingTerminal *)self isInvalidated])
  {
    id v6 = _CATLogGeneral_3();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = NSStringFromSelector(a2);
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_213B7F000, v6, OS_LOG_TYPE_INFO, "Already invalidated upon reaching %{public}@, quietly returning", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    [(CATDeviceSessionBackedDevicePairingTerminal *)self fetchStableIdentifier];
  }
}

- (void)vendConnectionForCompletion:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  char v5 = CATGetCatalystQueue();
  CATAssertIsQueue(v5);

  [(CATDeviceSessionBackedDevicePairingTerminal *)self removeSessionHandlers];
  id v6 = [CATSharingDeviceSessionConnection alloc];
  mDeviceSession = self->mDeviceSession;
  int v8 = objc_opt_new();
  uint64_t v10 = [(CATSharingDeviceSessionConnection *)v6 initWithDeviceSession:mDeviceSession timerSource:v8];

  v4[2](v4, 0, v10);
  id v9 = CATErrorWithCodeAndUserInfo(702, 0);
  [(CATDeviceSessionBackedDevicePairingTerminal *)self invalidateWithError:v9];
}

- (void)invalidateWithError:(id)a3
{
  id v7 = a3;
  id v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  id mVerifyPairingCompletion = (void (**)(id, id, void))self->mVerifyPairingCompletion;
  if (mVerifyPairingCompletion) {
    mVerifyPairingCompletion[2](mVerifyPairingCompletion, v7, 0);
  }
  id mBeginPairingCompletion = (void (**)(id, id, void))self->mBeginPairingCompletion;
  if (mBeginPairingCompletion) {
    mBeginPairingCompletion[2](mBeginPairingCompletion, v7, 0);
  }
  [(CATDeviceSessionBackedDevicePairingTerminal *)self setInvalidated:1];
}

- (void)removeSessionHandlers
{
  id v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  [(CATSharingDeviceSession *)self->mDeviceSession setDeviceSessionReadyHandler:0];
  [(CATSharingDeviceSession *)self->mDeviceSession setPinPromptHandler:0];
  [(CATSharingDeviceSession *)self->mDeviceSession setDeviceSessionErrorHandler:0];
  mDeviceSession = self->mDeviceSession;

  [(CATSharingDeviceSession *)mDeviceSession setDeviceSessionInvalidatedHandler:0];
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mPINPromptHandler, 0);
  objc_storeStrong(&self->mBeginPairingCompletion, 0);
  objc_storeStrong(&self->mVerifyPairingCompletion, 0);

  objc_storeStrong((id *)&self->mDeviceSession, 0);
}

- (void)deviceSessionInvalidated:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [*(id *)(a1 + 8) description];
  int v4 = 138543362;
  char v5 = v3;
  _os_log_error_impl(&dword_213B7F000, a2, OS_LOG_TYPE_ERROR, "Device Session %{public}@ invalidated", (uint8_t *)&v4, 0xCu);
}

- (void)deviceSessionEncounteredError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 8);
  char v5 = [a2 verboseDescription];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_213B7F000, a3, OS_LOG_TYPE_ERROR, "Device Session %{public}@ encountered error: %{public}@, invalidating", (uint8_t *)&v6, 0x16u);
}

@end