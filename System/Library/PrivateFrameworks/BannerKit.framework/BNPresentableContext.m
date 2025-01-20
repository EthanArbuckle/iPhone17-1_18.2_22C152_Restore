@interface BNPresentableContext
@end

@implementation BNPresentableContext

void __61___BNPresentableContext___setBannerAppearState_reason_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setBannerAppearState:reason:", objc_msgSend(*(id *)(a1 + 32), "intValue"), *(void *)(a1 + 40));
}

void __63___BNPresentableContext___bannerWillNotAppearWithReason_error___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector()) {
      [WeakRetained[6] presentableWillNotAppearAsBanner:WeakRetained[6] withReason:*(void *)(a1 + 32)];
    }
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __63___BNPresentableContext___bannerWillNotAppearWithReason_error___block_invoke_2;
    v3[3] = &unk_1E63B97C0;
    v3[4] = WeakRetained;
    id v4 = *(id *)(a1 + 32);
    [WeakRetained _enumerateObserversRespondingToSelector:sel_presentableWillNotAppearAsBanner_withReason_ usingBlock:v3];
  }
}

uint64_t __63___BNPresentableContext___bannerWillNotAppearWithReason_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 presentableWillNotAppearAsBanner:*(void *)(*(void *)(a1 + 32) + 48) withReason:*(void *)(a1 + 40)];
}

void __61___BNPresentableContext___setUserInteractionWillBegin_error___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) BOOLValue])
    {
      v3 = sel_userInteractionWillBeginForBannerForPresentable_;
      if (objc_opt_respondsToSelector()) {
        [WeakRetained[6] userInteractionWillBeginForBannerForPresentable:WeakRetained[6]];
      }
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      v12 = __61___BNPresentableContext___setUserInteractionWillBegin_error___block_invoke_2;
      v13 = &unk_1E63B9810;
      v14 = WeakRetained;
      id v4 = &v10;
LABEL_10:
      objc_msgSend(WeakRetained, "_enumerateObserversRespondingToSelector:usingBlock:", v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);
      goto LABEL_11;
    }
    if (([*(id *)(a1 + 32) BOOLValue] & 1) == 0)
    {
      v3 = sel_userInteractionDidEndForBannerForPresentable_;
      if (objc_opt_respondsToSelector()) {
        [WeakRetained[6] userInteractionDidEndForBannerForPresentable:WeakRetained[6]];
      }
      uint64_t v5 = MEMORY[0x1E4F143A8];
      uint64_t v6 = 3221225472;
      v7 = __61___BNPresentableContext___setUserInteractionWillBegin_error___block_invoke_3;
      v8 = &unk_1E63B9810;
      v9 = WeakRetained;
      id v4 = &v5;
      goto LABEL_10;
    }
  }
LABEL_11:
}

uint64_t __61___BNPresentableContext___setUserInteractionWillBegin_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 userInteractionWillBeginForBannerForPresentable:*(void *)(*(void *)(a1 + 32) + 48)];
}

uint64_t __61___BNPresentableContext___setUserInteractionWillBegin_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 userInteractionDidEndForBannerForPresentable:*(void *)(*(void *)(a1 + 32) + 48)];
}

uint64_t __60___BNPresentableContext___handleTemplateContentEvent_error___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) integerValue];
    return [v3 handleTemplateContentEvent:v4];
  }
  return result;
}

void __52___BNPresentableContext__activeConnectionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[BNPresentableContextSessionSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  uint64_t v5 = +[BNPresentableContextSessionSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52___BNPresentableContext__activeConnectionWithError___block_invoke_2;
  v10[3] = &unk_1E63B9540;
  objc_copyWeak(&v11, &location);
  [v3 setActivationHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52___BNPresentableContext__activeConnectionWithError___block_invoke_44;
  v8[3] = &unk_1E63B9540;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52___BNPresentableContext__activeConnectionWithError___block_invoke_45;
  v6[3] = &unk_1E63B9540;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __52___BNPresentableContext__activeConnectionWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_sync_enter(v3);
    uint64_t v4 = BNLogContextService;
    if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1BEC04000, v4, OS_LOG_TYPE_DEFAULT, "BNPresentableContext (service-side) connection activated: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    v3[45] = 1;
    objc_sync_exit(v3);
  }
}

void __52___BNPresentableContext__activeConnectionWithError___block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)BNLogContextService;
  if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v7 = 138543362;
    id v8 = WeakRetained;
    _os_log_impl(&dword_1BEC04000, v5, OS_LOG_TYPE_DEFAULT, "BNPresentableContext (service-side) connection interrupted: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [v3 activate];
}

void __52___BNPresentableContext__activeConnectionWithError___block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    objc_sync_enter(v6);
    int v7 = BNLogContextService;
    if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1BEC04000, v7, OS_LOG_TYPE_DEFAULT, "BNPresentableContext (service-side) connection invalidated: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    id v8 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = 0;

    if (*((unsigned char *)v6 + 45)) {
      [v6 _runPostConnectionInvalidation];
    }
    objc_sync_exit(v6);
  }
}

uint64_t __54___BNPresentableContext__setBannerAppearState_reason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentableWillAppearAsBanner:*(void *)(*(void *)(a1 + 32) + 48)];
}

uint64_t __54___BNPresentableContext__setBannerAppearState_reason___block_invoke_56(uint64_t a1, void *a2)
{
  return [a2 presentableDidAppearAsBanner:*(void *)(*(void *)(a1 + 32) + 48)];
}

uint64_t __54___BNPresentableContext__setBannerAppearState_reason___block_invoke_59(uint64_t a1, void *a2)
{
  return [a2 presentableWillDisappearAsBanner:*(void *)(*(void *)(a1 + 32) + 48) withReason:*(void *)(a1 + 40)];
}

uint64_t __54___BNPresentableContext__setBannerAppearState_reason___block_invoke_62(uint64_t a1, void *a2)
{
  return [a2 presentableDidDisappearAsBanner:*(void *)(*(void *)(a1 + 32) + 48) withReason:*(void *)(a1 + 40)];
}

void __55___BNPresentableContext__runPostConnectionInvalidation__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && WeakRetained[10])
  {
    id v3 = (void *)BNLogContextService;
    if (os_log_type_enabled((os_log_t)BNLogContextService, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = (void *)v2[6];
      int v5 = v3;
      id v6 = BNEffectivePresentableDescription(v4);
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1BEC04000, v5, OS_LOG_TYPE_DEFAULT, "Connection invalidated, updating banner appear state: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    if (*((_DWORD *)v2 + 10) != 3) {
      [v2 _setBannerAppearState:3 reason:@"BNPresentableContext (service-side) connection invalidated."];
    }
    [v2 _setBannerAppearState:0 reason:@"BNPresentableContext (service-side) connection invalidated."];
  }
}

@end