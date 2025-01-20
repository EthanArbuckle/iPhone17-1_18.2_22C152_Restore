@interface BNBannerController
+ (void)initialize;
- (BNBannerController)initWithAuthority:(id)a3 pender:(id)a4 presenter:(id)a5;
- (BNConsidering)authority;
- (BNPresenting)presenter;
- (BNRequesterPending)pender;
- (BOOL)_isSuspended;
- (BOOL)_presentNextPendingPresentableIfPossible;
- (BOOL)_presentNextPendingPresentableIfPossible:(id *)a3;
- (BOOL)_presentPresentableWithContext:(id)a3;
- (BOOL)_shouldMorphToPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5 stateChange:(id *)a6;
- (BOOL)_shouldPostPresentable:(id)a3 userInfo:(id)a4 error:(id *)a5;
- (BOOL)_shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5;
- (BOOL)postPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5 error:(id *)a6;
- (BOOL)revokeAllPresentablesWithRequesterIdentifier:(id)a3 reason:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7;
- (BOOL)revokePresentableWithRequestIdentifier:(id)a3 requesterIdentifier:(id)a4 reason:(id)a5 options:(unint64_t)a6 animated:(BOOL)a7 userInfo:(id)a8 error:(id *)a9;
- (BOOL)revokePresentableWithRequestIdentifier:(id)a3 requesterIdentifier:(id)a4 reason:(id)a5 options:(unint64_t)a6 userInfo:(id)a7 error:(id *)a8;
- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4 revokingCurrent:(BOOL)a5 error:(id *)a6;
- (NSTimer)_autoDequeueTimer;
- (id)_activeSuspensionReasons;
- (id)_revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 animated:(id)a6 userInfo:(id)a7 error:(id *)a8;
- (id)_suspensionReasonForEnqueuedPresentable:(id)a3;
- (id)revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 animated:(BOOL)a6 userInfo:(id)a7 error:(id *)a8;
- (id)revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7;
- (void)_cancelAutoDequeueTimer;
- (void)_resumeForResponsiblePresentableIfNecessary:(id)a3;
- (void)_resumeForResponsiblePresentableIfNecessaryWithIdentification:(id)a3;
- (void)_setAuthority:(id)a3;
- (void)_setAutoDequeueTimer:(id)a3;
- (void)_startAutoDequeueTimerIfNecessary;
- (void)_suspendPenderForRequesterIdentifier:(id)a3 withResponsiblePresentable:(id)a4;
- (void)bannerAuthority:(id)a3 mayChangeDecisionForResponsiblePresentable:(id)a4;
@end

@implementation BNBannerController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    BNRegisterBannerKitLogging();
  }
}

- (BNBannerController)initWithAuthority:(id)a3 pender:(id)a4 presenter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"BNBannerController.m", 59, @"Invalid parameter not satisfying: %@", @"authority" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"BNBannerController.m", 60, @"Invalid parameter not satisfying: %@", @"presenter" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)BNBannerController;
  v13 = [(BNBannerController *)&v23 init];
  v14 = v13;
  if (v13)
  {
    [(BNBannerController *)v13 _setAuthority:v9];
    if (v10) {
      v15 = (BNPenderQueue *)v10;
    }
    else {
      v15 = objc_alloc_init(BNPenderQueue);
    }
    pender = v14->_pender;
    v14->_pender = (BNRequesterPending *)v15;

    v17 = v14->_pender;
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    [(BNRequesterPending *)v17 setPenderIdentifier:v19];

    objc_storeStrong((id *)&v14->_presenter, a5);
  }

  return v14;
}

- (BOOL)postPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5 error:(id *)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = (void *)BNLogPosting;
  if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = BNEffectivePresentableDescription(v10);
    int v17 = 138543362;
    v18 = v14;
    _os_log_impl(&dword_1BEC04000, v13, OS_LOG_TYPE_DEFAULT, "Asked to post presentable: %{public}@", (uint8_t *)&v17, 0xCu);
  }
  BOOL v15 = [(BNBannerController *)self _shouldPostPresentable:v10 userInfo:v11 error:a6];
  if (v15)
  {
    [(BNRequesterPending *)self->_pender enqueuePresentable:v10 withOptions:a4 userInfo:v11];
    [(BNBannerController *)self _presentNextPendingPresentableIfPossible];
  }

  return v15;
}

- (id)revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7
{
  return [(BNBannerController *)self _revokePresentablesWithIdentification:a3 reason:a4 options:a5 animated:0 userInfo:a6 error:a7];
}

- (BOOL)revokePresentableWithRequestIdentifier:(id)a3 requesterIdentifier:(id)a4 reason:(id)a5 options:(unint64_t)a6 userInfo:(id)a7 error:(id *)a8
{
  id v14 = a7;
  id v15 = a5;
  v16 = +[BNPresentableIdentification identificationWithRequesterIdentifier:a4 requestIdentifier:a3];
  int v17 = [(BNBannerController *)self revokePresentablesWithIdentification:v16 reason:v15 options:a6 userInfo:v14 error:a8];

  return v17 != 0;
}

- (BOOL)revokeAllPresentablesWithRequesterIdentifier:(id)a3 reason:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a4;
  id v14 = +[BNPresentableIdentification identificationWithRequesterIdentifier:a3];
  id v15 = [(BNBannerController *)self revokePresentablesWithIdentification:v14 reason:v13 options:a5 userInfo:v12 error:a7];

  return v15 != 0;
}

- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4 revokingCurrent:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if (v10)
  {
    [(BNRequesterPending *)self->_pender setSuspended:v8 forReason:v10];
    if ([(BNBannerController *)self _isSuspended])
    {
      [(BNBannerController *)self _cancelAutoDequeueTimer];
      if (v7)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id obj = [(BNPresenting *)self->_presenter presentedPresentables];
        uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(obj);
              }
              uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              v16 = +[BNPresentableIdentification uniqueIdentificationForPresentable:v15];
              id v24 = 0;
              int v17 = [(BNBannerController *)self revokePresentablesWithIdentification:v16 reason:@"BNBannerControllerBannerRevocationReasonSuspensionDismissal" options:1 animated:1 userInfo:0 error:&v24];
              id v18 = v24;

              if (!v17)
              {
                uint64_t v19 = BNLogPosting;
                if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  uint64_t v32 = v15;
                  __int16 v33 = 2114;
                  id v34 = v18;
                  _os_log_error_impl(&dword_1BEC04000, v19, OS_LOG_TYPE_ERROR, "Error attempting to revoke posted presentable: presentable: %{public}@; error: %{public}@",
                    buf,
                    0x16u);
                }
              }
            }
            uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
          }
          while (v12);
        }
      }
    }
    else
    {
      [(BNBannerController *)self _presentNextPendingPresentableIfPossible];
      [(BNBannerController *)self _startAutoDequeueTimerIfNecessary];
    }
  }
  else if (a6)
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30 = @"Missing 'reason' argument";
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    *a6 = [v20 errorWithDomain:@"BNBannerSourceErrorDomain" code:2 userInfo:v21];
  }
  return v10 != 0;
}

- (void)bannerAuthority:(id)a3 mayChangeDecisionForResponsiblePresentable:(id)a4
{
}

- (void)_setAuthority:(id)a3
{
  v5 = (BNConsidering *)a3;
  uint64_t p_authority = (uint64_t)&self->_authority;
  if (self->_authority != v5)
  {
    id v10 = v5;
    objc_storeStrong((id *)p_authority, a3);
    *(unsigned char *)&self->_bannerAuthorityFlags = *(unsigned char *)&self->_bannerAuthorityFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    char v7 = (objc_opt_respondsToSelector() & 1) != 0 ? 2 : 0;
    *(unsigned char *)&self->_bannerAuthorityFlags = *(unsigned char *)&self->_bannerAuthorityFlags & 0xFD | v7;
    char v8 = (objc_opt_respondsToSelector() & 1) != 0 ? 8 : 0;
    *(unsigned char *)&self->_bannerAuthorityFlags = *(unsigned char *)&self->_bannerAuthorityFlags & 0xF7 | v8;
    char v9 = (objc_opt_respondsToSelector() & 1) != 0 ? 4 : 0;
    *(unsigned char *)&self->_bannerAuthorityFlags = *(unsigned char *)&self->_bannerAuthorityFlags & 0xFB | v9;
    uint64_t p_authority = objc_opt_respondsToSelector();
    v5 = v10;
    if (p_authority)
    {
      uint64_t p_authority = [(BNConsidering *)self->_authority setDelegate:self];
      v5 = v10;
    }
  }
  MEMORY[0x1F41817F8](p_authority, v5);
}

- (BOOL)_shouldPostPresentable:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    if (a5)
    {
      int v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22 = @"Missing 'presentable' argument";
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      *a5 = [v17 errorWithDomain:@"BNBannerSourceErrorDomain" code:2 userInfo:v18];

      BOOL v16 = 0;
      goto LABEL_12;
    }
LABEL_11:
    BOOL v16 = 1;
    goto LABEL_12;
  }
  if ((*(unsigned char *)&self->_bannerAuthorityFlags & 1) == 0) {
    goto LABEL_11;
  }
  authority = self->_authority;
  id v20 = 0;
  uint64_t v11 = [(BNConsidering *)authority shouldPostPresentable:v8 userInfo:v9 reason:&v20];
  id v12 = v20;
  if (v11 == -1)
  {
    uint64_t v13 = (void *)BNLogPosting;
    if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v13;
      uint64_t v15 = BNEffectivePresentableDescription(v8);
      *(_DWORD *)buf = 138543618;
      id v24 = v15;
      __int16 v25 = 2114;
      id v26 = v12;
      _os_log_impl(&dword_1BEC04000, v14, OS_LOG_TYPE_DEFAULT, "Authority denied request to post presentable: %{public}@ (%{public}@)", buf, 0x16u);
    }
    if (objc_opt_respondsToSelector()) {
      [v8 presentableWillNotAppearAsBanner:v8 withReason:v12];
    }
  }

  BOOL v16 = v11 != -1;
LABEL_12:

  return v16;
}

- (BOOL)_shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if ((*(unsigned char *)&self->_bannerAuthorityFlags & 2) == 0)
  {
    BOOL v11 = 0;
LABEL_7:
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"BNBannerController.m" lineNumber:172 description:@"The authority needs to provide a concrete decision"];

    goto LABEL_8;
  }
  uint64_t v12 = [(BNConsidering *)self->_authority shouldPresentPresentable:v9 withPresentedPresentables:v10 responsiblePresentable:a5];
  BOOL v11 = v12 == 1;
  if (v12 != -1 && v12 != 1) {
    goto LABEL_7;
  }
LABEL_8:

  return v11;
}

- (BOOL)_shouldMorphToPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5 stateChange:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  char bannerAuthorityFlags = (char)self->_bannerAuthorityFlags;
  if ((bannerAuthorityFlags & 4) != 0)
  {
    uint64_t v13 = [(BNConsidering *)self->_authority shouldMorphToPresentable:v10 withPresentedPresentables:v11 responsiblePresentable:a5 stateChange:a6];
    if (v13) {
      goto LABEL_7;
    }
    char bannerAuthorityFlags = (char)self->_bannerAuthorityFlags;
  }
  if ((bannerAuthorityFlags & 8) != 0) {
    uint64_t v13 = [(BNConsidering *)self->_authority shouldMorphToPresentable:v10 withPresentedPresentables:v11 responsiblePresentable:a5];
  }
  else {
    uint64_t v13 = 0;
  }
LABEL_7:
  BOOL v14 = v13 == 1;

  return v14;
}

- (id)_suspensionReasonForEnqueuedPresentable:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 requesterIdentifier];
  v9[0] = v4;
  v5 = [v3 requestIdentifier];

  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  char v7 = [v6 componentsJoinedByString:@"."];

  return v7;
}

- (void)_suspendPenderForRequesterIdentifier:(id)a3 withResponsiblePresentable:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  if ([v15 length])
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BNBannerController.m", 189, @"Invalid parameter not satisfying: %@", @"[penderRequesterID length] > 0" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  BOOL v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"BNBannerController.m", 190, @"Invalid parameter not satisfying: %@", @"responsiblePresentable" object file lineNumber description];

LABEL_3:
  id v8 = [(BNBannerController *)self _suspensionReasonForEnqueuedPresentable:v7];
  [(BNRequesterPending *)self->_pender setSuspended:1 forRequesterWithIdentifier:v15 reason:v8];
  id v9 = [(NSMapTable *)self->_presentablesInducingSuspensionToSuspendedRequesterIDs objectForKey:v7];
  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    presentablesInducingSuspensionToSuspendedRequesterIDs = self->_presentablesInducingSuspensionToSuspendedRequesterIDs;
    if (!presentablesInducingSuspensionToSuspendedRequesterIDs)
    {
      id v11 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:0];
      uint64_t v12 = self->_presentablesInducingSuspensionToSuspendedRequesterIDs;
      self->_presentablesInducingSuspensionToSuspendedRequesterIDs = v11;

      presentablesInducingSuspensionToSuspendedRequesterIDs = self->_presentablesInducingSuspensionToSuspendedRequesterIDs;
    }
    [(NSMapTable *)presentablesInducingSuspensionToSuspendedRequesterIDs setObject:v9 forKey:v7];
  }
  [v9 addObject:v15];
}

- (void)_resumeForResponsiblePresentableIfNecessary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSMapTable *)self->_presentablesInducingSuspensionToSuspendedRequesterIDs objectForKey:v4];
    if (v5)
    {
      v6 = [(BNBannerController *)self _suspensionReasonForEnqueuedPresentable:v4];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = objc_msgSend(v5, "copy", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            [(BNRequesterPending *)self->_pender setSuspended:0 forRequesterWithIdentifier:*(void *)(*((void *)&v13 + 1) + 8 * v11++) reason:v6];
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }

      [(NSMapTable *)self->_presentablesInducingSuspensionToSuspendedRequesterIDs removeObjectForKey:v4];
      if (![(NSMapTable *)self->_presentablesInducingSuspensionToSuspendedRequesterIDs count])
      {
        presentablesInducingSuspensionToSuspendedRequesterIDs = self->_presentablesInducingSuspensionToSuspendedRequesterIDs;
        self->_presentablesInducingSuspensionToSuspendedRequesterIDs = 0;
      }
      [(BNBannerController *)self _presentNextPendingPresentableIfPossible];
      [(BNBannerController *)self _startAutoDequeueTimerIfNecessary];
    }
  }
}

- (BOOL)_presentPresentableWithContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 presentable];
  id v7 = (void *)BNLogPosting;
  if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    uint64_t v9 = BNEffectivePresentableDescription(v6);
    *(_DWORD *)buf = 138543362;
    __int16 v33 = v9;
    _os_log_impl(&dword_1BEC04000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to present presentable: %{public}@", buf, 0xCu);
  }
  if (v5)
  {
    uint64_t v10 = [(BNPresenting *)self->_presenter topPresentables];
    id v31 = 0;
    BOOL v11 = [(BNBannerController *)self _shouldPresentPresentable:v6 withPresentedPresentables:v10 responsiblePresentable:&v31];
    id v12 = v31;
    if (v11)
    {
      SEL v26 = a2;
      uint64_t v13 = [v5 presentationOptions];
      long long v14 = [v5 userInfo];
      id v29 = 0;
      id v30 = 0;
      BOOL v15 = [(BNBannerController *)self _shouldMorphToPresentable:v6 withPresentedPresentables:v10 responsiblePresentable:&v30 stateChange:&v29];
      id v27 = v30;

      id v16 = v29;
      if (v15)
      {
        if (objc_opt_respondsToSelector()) {
          -[BNPresenting morphFromPresentable:toPresentable:withOptions:userInfo:stateChange:](self->_presenter, "morphFromPresentable:toPresentable:withOptions:userInfo:stateChange:", v27, v6, v13, v14, [v16 BOOLValue]);
        }
      }
      else
      {
        [(BNPresenting *)self->_presenter presentPresentable:v6 withOptions:v13 userInfo:v14];
      }
      if ((BNPresentationOptionsPrivateSuspend & v13) != 0)
      {
        id v20 = [v14 objectForKey:@"BNBannerPresentationOptionsSuspendReason"];
        if (!v20)
        {
          __int16 v25 = [MEMORY[0x1E4F28B00] currentHandler];
          [v25 handleFailureInMethod:v26 object:self file:@"BNBannerController.m" lineNumber:242 description:@"Use of 'BNPresentationOptionsSuspend' option requires specifying a reason in userInfo with 'kBNBannerPresentationOptionsSuspendReasonKey'"];
        }
        id v28 = 0;
        BOOL v21 = [(BNBannerController *)self setSuspended:1 forReason:v20 revokingCurrent:0 error:&v28];
        id v22 = v28;
        if (!v21)
        {
          objc_super v23 = BNLogPosting;
          if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_ERROR)) {
            [(BNBannerController *)(uint64_t)v20 _presentPresentableWithContext:v23];
          }
        }
      }
      id v12 = v27;
    }
    else
    {
      int v17 = (void *)BNLogPosting;
      if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = v17;
        uint64_t v19 = BNEffectivePresentableDescription(v6);
        *(_DWORD *)buf = 138543362;
        __int16 v33 = v19;
        _os_log_impl(&dword_1BEC04000, v18, OS_LOG_TYPE_DEFAULT, "Authority denied request to present presentable: %{public}@", buf, 0xCu);
      }
      if (!v12)
      {
        id v12 = [v10 firstObject];
      }
      long long v14 = [v6 requesterIdentifier];
      [(BNBannerController *)self _suspendPenderForRequesterIdentifier:v14 withResponsiblePresentable:v12];
      id v16 = (id)MEMORY[0x1E4F1CC28];
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)_isSuspended
{
  return [(BNRequesterPending *)self->_pender isSuspended];
}

- (id)_activeSuspensionReasons
{
  return (id)[(BNRequesterPending *)self->_pender activeSuspensionReasons];
}

- (BOOL)_presentNextPendingPresentableIfPossible:(id *)a3
{
  id v4 = self;
  if ([(BNBannerController *)self _isSuspended])
  {
    id v5 = NSString;
    v6 = [(BNBannerController *)v4 _activeSuspensionReasons];
    id v7 = [v5 stringWithFormat:@"suspended: %@", v6];
    LOBYTE(v4) = 0;
  }
  else
  {
    uint64_t v8 = [(BNRequesterPending *)v4->_pender peekPresentable];
    v6 = v8;
    if (v8)
    {
      uint64_t v9 = [v8 postingContext];
      LODWORD(v4) = [(BNBannerController *)v4 _presentPresentableWithContext:v9];
      if (v4)
      {
        [v6 dequeue];
        id v7 = 0;
      }
      else
      {
        id v7 = @"presentation failed";
      }
    }
    else
    {
      LOBYTE(v4) = 0;
      id v7 = @"no pending presentable";
    }
  }

  if (a3 && v7) {
    *a3 = v7;
  }

  return (char)v4;
}

- (BOOL)_presentNextPendingPresentableIfPossible
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  BOOL v2 = [(BNBannerController *)self _presentNextPendingPresentableIfPossible:&v6];
  id v3 = v6;
  if (!v2)
  {
    id v4 = BNLogPosting;
    if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v8 = v3;
      _os_log_impl(&dword_1BEC04000, v4, OS_LOG_TYPE_DEFAULT, "Not presenting next pending presentable: %{public}@", buf, 0xCu);
    }
  }

  return v2;
}

- (id)_revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 animated:(id)a6 userInfo:(id)a7 error:(id *)a8
{
  char v11 = a5;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = (id)BNLogPosting;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v45 = v17;
    uint64_t v19 = self;
    BNPresentableIdentificationDescription(v14);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      [v16 BOOLValue];
      BOOL v21 = NSStringFromBOOL();
    }
    else
    {
      BOOL v21 = 0;
    }
    *(_DWORD *)buf = 138543874;
    id v57 = v20;
    __int16 v58 = 2114;
    id v59 = v15;
    __int16 v60 = 2114;
    v61 = v21;
    _os_log_impl(&dword_1BEC04000, v18, OS_LOG_TYPE_DEFAULT, "Asked to revoke presentables with identification %{public}@ with reason '%{public}@' (animated=%{public}@)", buf, 0x20u);
    if (v16) {

    }
    self = v19;
    id v17 = v45;
  }

  if (v14)
  {
    if (v11)
    {
      id v22 = 0;
    }
    else
    {
      id v22 = [(BNRequesterPending *)self->_pender pullPresentablesWithIdentification:v14];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        v43 = a8;
        id v46 = v17;
        uint64_t v25 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v48 != v25) {
              objc_enumerationMutation(v22);
            }
            id v27 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v27 presentableWillNotAppearAsBanner:v27 withReason:@"BNBannerControllerBannerRejectionReasonRevokedWhilePended"];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v55 count:16];
        }
        while (v24);
        a8 = v43;
        id v17 = v46;
      }
    }
    if (v16) {
      -[BNPresenting dismissPresentablesWithIdentification:reason:animated:userInfo:](self->_presenter, "dismissPresentablesWithIdentification:reason:animated:userInfo:", v14, v15, [v16 BOOLValue], v17);
    }
    else {
    id v31 = [(BNPresenting *)self->_presenter dismissPresentablesWithIdentification:v14 reason:v15 userInfo:v17];
    }
    id v30 = v31;
    if (v31)
    {
      if (!v22)
      {
        id v22 = v31;
LABEL_33:
        [(BNBannerController *)self _resumeForResponsiblePresentableIfNecessaryWithIdentification:v14];
        goto LABEL_34;
      }
      [v22 arrayByAddingObjectsFromArray:v31];
      v33 = uint64_t v32 = a8;

      id v22 = (id)v33;
      a8 = v32;
    }
    if (a8 && !v22)
    {
      v44 = a8;
      uint64_t v34 = NSString;
      v35 = BNPresentableIdentificationDescription(v14);
      uint64_t v36 = [v34 stringWithFormat:@"No pending or presented presentables with identification %@", v35];

      v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v53 = *MEMORY[0x1E4F28568];
      v54 = v36;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      id v38 = v16;
      id v39 = v17;
      v41 = v40 = self;
      id *v44 = [v37 errorWithDomain:@"BNBannerSourceErrorDomain" code:3 userInfo:v41];

      self = v40;
      id v17 = v39;
      id v16 = v38;

      id v22 = 0;
    }
    goto LABEL_33;
  }
  if (a8)
  {
    id v28 = a8;
    id v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    v52 = @"Missing 'presentableIdentification' argument";
    id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    [v29 errorWithDomain:@"BNBannerSourceErrorDomain" code:2 userInfo:v30];
    id v22 = 0;
    *id v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:

    goto LABEL_35;
  }
  id v22 = 0;
LABEL_35:

  return v22;
}

- (void)_startAutoDequeueTimerIfNecessary
{
  if (!self->_autoDequeueTimer)
  {
    id v3 = [(BNRequesterPending *)self->_pender peekPresentable];

    if (v3)
    {
      objc_initWeak(&location, self);
      id v4 = BNLogPosting;
      if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BEC04000, v4, OS_LOG_TYPE_DEFAULT, "Scheduling auto dequeue timer", buf, 2u);
      }
      id v5 = (void *)MEMORY[0x1E4F1CB00];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __55__BNBannerController__startAutoDequeueTimerIfNecessary__block_invoke;
      v8[3] = &unk_1E63B9658;
      objc_copyWeak(&v9, &location);
      id v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v8 block:2.0];
      autoDequeueTimer = self->_autoDequeueTimer;
      self->_autoDequeueTimer = v6;

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
}

void __55__BNBannerController__startAutoDequeueTimerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _autoDequeueTimer];

  if (v5 == v3) {
    [WeakRetained _setAutoDequeueTimer:0];
  }
  id v6 = BNLogPosting;
  if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BEC04000, v6, OS_LOG_TYPE_DEFAULT, "Auto dequeue timer expired – attempting to present next pending presentable", buf, 2u);
  }
  id v10 = 0;
  int v7 = [WeakRetained _presentNextPendingPresentableIfPossible:&v10];
  id v8 = v10;
  if (v7)
  {
    [WeakRetained _startAutoDequeueTimerIfNecessary];
  }
  else
  {
    id v9 = BNLogPosting;
    if (os_log_type_enabled((os_log_t)BNLogPosting, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v8;
      _os_log_impl(&dword_1BEC04000, v9, OS_LOG_TYPE_DEFAULT, "Auto dequeue timer failed to present next pending presentable: %{public}@", buf, 0xCu);
    }
  }
}

- (void)_cancelAutoDequeueTimer
{
  [(NSTimer *)self->_autoDequeueTimer invalidate];
  autoDequeueTimer = self->_autoDequeueTimer;
  self->_autoDequeueTimer = 0;
}

- (void)_resumeForResponsiblePresentableIfNecessaryWithIdentification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    char v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BNBannerController.m", 360, @"Invalid parameter not satisfying: %@", @"presentableIdentification" object file lineNumber description];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_presentablesInducingSuspensionToSuspendedRequesterIDs;
  id v7 = (id)[(NSMapTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (BNIsPresentableIdentifiedByIdentification(v10, v5, 0))
        {
          id v7 = v10;
          goto LABEL_13;
        }
      }
      id v7 = (id)[(NSMapTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  [(BNBannerController *)self _resumeForResponsiblePresentableIfNecessary:v7];
}

- (BNConsidering)authority
{
  return self->_authority;
}

- (BNRequesterPending)pender
{
  return self->_pender;
}

- (BNPresenting)presenter
{
  return self->_presenter;
}

- (NSTimer)_autoDequeueTimer
{
  return self->_autoDequeueTimer;
}

- (void)_setAutoDequeueTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoDequeueTimer, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_pender, 0);
  objc_storeStrong((id *)&self->_authority, 0);
  objc_storeStrong((id *)&self->_presentablesInducingSuspensionToSuspendedRequesterIDs, 0);
}

- (id)revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 animated:(BOOL)a6 userInfo:(id)a7 error:(id *)a8
{
  BOOL v9 = a6;
  long long v14 = NSNumber;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [v14 numberWithBool:v9];
  uint64_t v19 = [(BNBannerController *)self _revokePresentablesWithIdentification:v17 reason:v16 options:a5 animated:v18 userInfo:v15 error:a8];

  return v19;
}

- (BOOL)revokePresentableWithRequestIdentifier:(id)a3 requesterIdentifier:(id)a4 reason:(id)a5 options:(unint64_t)a6 animated:(BOOL)a7 userInfo:(id)a8 error:(id *)a9
{
  BOOL v9 = a7;
  id v15 = a8;
  id v16 = a5;
  id v17 = +[BNPresentableIdentification identificationWithRequesterIdentifier:a4 requestIdentifier:a3];
  uint64_t v18 = [(BNBannerController *)self revokePresentablesWithIdentification:v17 reason:v16 options:a6 animated:v9 userInfo:v15 error:a9];

  return v18 != 0;
}

- (void)_presentPresentableWithContext:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BEC04000, log, OS_LOG_TYPE_ERROR, "Error attempting to suspend: reason: %{public}@; error: %{public}@",
    (uint8_t *)&v3,
    0x16u);
}

@end