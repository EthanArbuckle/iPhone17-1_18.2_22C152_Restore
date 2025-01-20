@interface BNBannerSource
+ (id)bannerSourceForDestination:(int64_t)a3 forRequesterIdentifier:(id)a4;
+ (void)_invalidateBannerSource:(id)a3;
+ (void)initialize;
- (BNBannerSource)initWithDestination:(int64_t)a3 andRequesterIdentifier:(id)a4;
- (BNBannerSource)initWithMachName:(id)a3 andRequesterIdentifier:(id)a4;
- (BNBannerSourceDelegate)delegate;
- (BOOL)_isValidPresentable:(id)a3 errorDescription:(id *)a4;
- (BOOL)bannerClientContainerShouldDeferFocus:(id)a3;
- (BOOL)isValid;
- (BOOL)postPresentable:(id)a3 options:(unint64_t)a4 userInfo:(id)a5 error:(id *)a6;
- (BOOL)revokePresentableWithRequestIdentifier:(id)a3 animated:(BOOL)a4 reason:(id)a5 userInfo:(id)a6 error:(id *)a7;
- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4 revokingCurrent:(BOOL)a5 error:(id *)a6;
- (NSString)description;
- (NSString)requesterIdentifier;
- (id)_activeConnectionWithError:(id *)a3;
- (id)_presentableContextForPresentableWithUniqueIdentifier:(id)a3;
- (id)_presentableForUniqueIdentifier:(id)a3;
- (id)_revokePresentableWithIdentification:(id)a3 reason:(id)a4 animated:(id)a5 userInfo:(id)a6 error:(id *)a7;
- (id)containerViewControllerForBannerSceneComponentProvider:(id)a3;
- (id)keyWindowForScreen:(id)a3;
- (id)layoutDescriptionWithError:(id *)a3;
- (id)revokeAllPresentablesWithReason:(id)a3 userInfo:(id)a4 error:(id *)a5;
- (id)revokePresentableWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6 error:(id *)a7;
- (id)revokePresentableWithRequestIdentifier:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6 error:(id *)a7;
- (int64_t)destination;
- (void)_addPresentableContext:(id)a3;
- (void)_invalidateConnection;
- (void)_removePresentable:(id)a3 reason:(id)a4;
- (void)_removePresentableContextForPresentableWithUniqueIdentifier:(id)a3 reason:(id)a4;
- (void)bannerClientContainerStoppedDeferringFocus:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)sceneWillInvalidateForBannerSceneComponentProvider:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BNBannerSource

+ (id)bannerSourceForDestination:(int64_t)a3 forRequesterIdentifier:(id)a4
{
  id v7 = a4;
  v8 = v7;
  if ((unint64_t)a3 >= 2)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"+[BNBannerSource bannerSourceForDestination:forRequesterIdentifier:]"];
    [v13 handleFailureInFunction:v14, @"BNBannerSource.m", 233, @"Invalid destination: %@", @"[INVALID]" file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"BNBannerSource.m", 234, @"Invalid parameter not satisfying: %@", @"requesterIdentifier" object file lineNumber description];

LABEL_3:
  if (bannerSourceForDestination_forRequesterIdentifier__onceToken != -1) {
    dispatch_once(&bannerSourceForDestination_forRequesterIdentifier__onceToken, &__block_literal_global_0);
  }
  id v9 = [(id)__requesterIDsToMachNamesToSources objectForKeyedSubscript:v8];
  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(id)__requesterIDsToMachNamesToSources setObject:v9 forKeyedSubscript:v8];
  }
  v10 = _MachNameForDestination(a3);
  v11 = [v9 objectForKeyedSubscript:v10];
  if (!v11)
  {
    v11 = [[BNBannerSource alloc] initWithDestination:a3 andRequesterIdentifier:v8];
    [v9 setObject:v11 forKeyedSubscript:v10];
    v11->_valid = 1;
  }

  return v11;
}

- (BNBannerSource)initWithDestination:(int64_t)a3 andRequesterIdentifier:(id)a4
{
  id v7 = a4;
  v8 = _MachNameForDestination(a3);
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BNBannerSource.m", 213, @"Invalid parameter not satisfying: %@", @"requesterIdentifier" object file lineNumber description];
  }
  id v9 = [(BNBannerSource *)self initWithMachName:v8 andRequesterIdentifier:v7];
  v10 = v9;
  if (v9) {
    v9->_destination = a3;
  }

  return v10;
}

- (BNBannerSource)initWithMachName:(id)a3 andRequesterIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"BNBannerSource.m", 201, @"Invalid parameter not satisfying: %@", @"machName" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"BNBannerSource.m", 202, @"Invalid parameter not satisfying: %@", @"requesterIdentifier" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)BNBannerSource;
  v10 = [(BNBannerSource *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    machName = v10->_machName;
    v10->_machName = (NSString *)v11;

    objc_storeStrong((id *)&v10->_requesterIdentifier, a4);
    uint64_t Serial = BSDispatchQueueCreateSerial();
    connectionQueue = v10->_connectionQueue;
    v10->_connectionQueue = (OS_dispatch_queue *)Serial;
  }
  return v10;
}

uint64_t __68__BNBannerSource_bannerSourceForDestination_forRequesterIdentifier___block_invoke()
{
  __requesterIDsToMachNamesToSources = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    BNRegisterBannerKitLogging();
  }
}

- (void)dealloc
{
  [(BNBannerSource *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BNBannerSource;
  [(BNBannerSource *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = @"[INVALID]";
  int64_t destination = self->_destination;
  requesterIdentifier = self->_requesterIdentifier;
  if (destination == 1) {
    v5 = @"CarPlay";
  }
  if (!destination) {
    v5 = @"Default system shell";
  }
  machName = self->_machName;
  id v9 = v5;
  v10 = NSStringFromBOOL();
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; destination: %@; machName: %@; requesterIdentifier: %@; isValid: %@>",
    v4,
    self,
    v9,
    machName,
    requesterIdentifier,
  uint64_t v11 = v10);

  return (NSString *)v11;
}

- (id)layoutDescriptionWithError:(id *)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  objc_super v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id obj = 0;
  uint64_t v4 = [(BNBannerSource *)self _activeConnectionWithError:&obj];
  objc_storeStrong(&v20, obj);
  v5 = objc_msgSend(v4, "bn_remoteTargetEnforceLaunching");

  if (v5)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__BNBannerSource_layoutDescriptionWithError___block_invoke;
    v13[3] = &unk_1E63B94C8;
    v13[4] = &v21;
    v13[5] = &v15;
    objc_msgSend(v5, "__layoutDescriptionWithReply:", v13);
  }
  else if (!v16[5])
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = @"Failed to obtain remote target from connection";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    uint64_t v8 = [v6 errorWithDomain:@"BNBannerSourceErrorDomain" code:1 userInfo:v7];
    id v9 = (void *)v16[5];
    v16[5] = v8;
  }
  if (a3)
  {
    v10 = (void *)v16[5];
    if (v10) {
      *a3 = v10;
    }
  }
  id v11 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __45__BNBannerSource_layoutDescriptionWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)postPresentable:(id)a3 options:(unint64_t)a4 userInfo:(id)a5 error:(id *)a6
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v67 = a5;
  uint64_t v9 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    id v11 = BNEffectivePresentableDescription(v8);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1BEC04000, v10, OS_LOG_TYPE_DEFAULT, "Asked to post presentable: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2020000000;
  char v80 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v91 = 0x3032000000;
  v92 = __Block_byref_object_copy_;
  v93 = __Block_byref_object_dispose_;
  id v94 = 0;
  if (v8)
  {
    id v76 = 0;
    BOOL v12 = [(BNBannerSource *)self _isValidPresentable:v8 errorDescription:&v76];
    id v13 = v76;
    v14 = v13;
    if (v12)
    {
      uint64_t v15 = [v8 requesterIdentifier];
      int v16 = [v15 isEqualToString:self->_requesterIdentifier];

      if (v16)
      {
        [v8 ensurePresentableIsUniquelyIdentifiable];
        uint64_t v17 = [v8 uniquePresentableIdentifier];
        uint64_t v18 = [(BNBannerSource *)self _presentableContextForPresentableWithUniqueIdentifier:v17];

        v19 = (_BNPresentableContext *)v18;
        if (!v18)
        {
          v19 = [[_BNPresentableContext alloc] initWithMachName:self->_machName presentable:v8];
          [(BNBannerSource *)self _addPresentableContext:v19];
        }
        if (objc_opt_respondsToSelector()) {
          char v20 = 1;
        }
        else {
          char v20 = objc_opt_respondsToSelector();
        }
        if (objc_opt_respondsToSelector()) {
          char v31 = [v8 providesTemplateContent];
        }
        else {
          char v31 = 0;
        }
        char v63 = v31 | ~v20;
        if (v31 & 1 | ((v20 & 1) == 0))
        {
          if (objc_opt_respondsToSelector()) {
            [v8 setPresentableContext:v19];
          }
        }
        else if (!v18)
        {
          v32 = [v8 uniquePresentableIdentifier];
          +[BNBannerSceneComponentProvider registerDelegate:self forSceneForPresentableWithUniqueIdentifier:v32];
        }
        uint64_t v33 = *((void *)&buf + 1);
        id obj = 0;
        v34 = [(BNBannerSource *)self _activeConnectionWithError:&obj];
        objc_storeStrong((id *)(v33 + 40), obj);
        v25 = objc_msgSend(v34, "bn_remoteTargetEnforceLaunching");

        if (v25)
        {
          objc_initWeak(location, self);
          id v35 = v8;
          if ((objc_opt_respondsToSelector() & 1) != 0 && [v35 providesTemplateContent])
          {
            id v36 = v35;
            v37 = [v36 requesterIdentifier];
            v38 = [v36 requestIdentifier];
            v39 = [v36 uniquePresentableIdentifier];
            v64 = +[BNPresentableIdentification identificationWithRequesterIdentifier:v37 requestIdentifier:v38 uniqueIdentifier:v39];

            if (objc_opt_respondsToSelector())
            {
              v40 = [v36 leadingTemplateViewProvider];
              [v64 setLeadingTemplateViewProvider:v40];
            }
            else
            {
              [v64 setLeadingTemplateViewProvider:0];
            }
            if (objc_opt_respondsToSelector())
            {
              v50 = [v36 trailingTemplateViewProvider];
              [v64 setTrailingTemplateViewProvider:v50];
            }
            else
            {
              [v64 setTrailingTemplateViewProvider:0];
            }
            if (objc_opt_respondsToSelector())
            {
              v51 = [v36 primaryTemplateItemProvider];
              [v64 setPrimaryTemplateItemProvider:v51];
            }
            else
            {
              [v64 setPrimaryTemplateItemProvider:0];
            }
            if (objc_opt_respondsToSelector())
            {
              v52 = [v36 secondaryTemplateItemProvider];
              [v64 setSecondaryTemplateItemProvider:v52];
            }
            else
            {
              [v64 setSecondaryTemplateItemProvider:0];
            }
            [v64 setContentBehavior:1];
          }
          else
          {
            v41 = [v35 requesterIdentifier];
            v42 = [v35 requestIdentifier];
            v43 = [v35 uniquePresentableIdentifier];
            v64 = +[BNPresentableIdentification identificationWithRequesterIdentifier:v41 requestIdentifier:v42 uniqueIdentifier:v43];

            v44 = UIViewControllerFromPresentable(v35);
            v45 = v44;
            if (v44)
            {
              [v44 preferredContentSize];
              objc_msgSend(v64, "setPreferredContentSize:");
              [v45 bannerContentOutsets];
              objc_msgSend(v64, "setContentOutsets:");
            }
            else
            {
              [v64 setContentBehavior:2];
            }

            id v36 = 0;
          }
          if (objc_opt_respondsToSelector()) {
            uint64_t v53 = [v35 presentableBehavior];
          }
          else {
            uint64_t v53 = (objc_opt_respondsToSelector() & 1) != 0 && [v35 presentableType] == 1;
          }
          [v64 setPresentableBehavior:v53];

          if (v67) {
            id v54 = (id)[v67 mutableCopy];
          }
          else {
            id v54 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          v55 = v54;
          v56 = (objc_class *)objc_opt_class();
          v57 = NSStringFromClass(v56);
          [v55 setObject:v57 forKeyedSubscript:@"BNBannerSourcePresentableClassName"];

          v58 = [NSNumber numberWithUnsignedInteger:a4];
          v68[0] = MEMORY[0x1E4F143A8];
          v68[1] = 3221225472;
          v68[2] = __57__BNBannerSource_postPresentable_options_userInfo_error___block_invoke;
          v68[3] = &unk_1E63B94F0;
          v71 = &v77;
          p_long long buf = &buf;
          char v74 = v63 & 1;
          v19 = v19;
          v69 = v19;
          objc_copyWeak(&v73, location);
          id v70 = v35;
          objc_msgSend(v25, "__postPresentableWithSpecification:options:userInfo:reply:", v64, v58, v55, v68);

          objc_destroyWeak(&v73);
          objc_destroyWeak(location);
        }
        else
        {
          [(BNBannerSource *)self _removePresentable:v8 reason:@"failed to obtain remote target from connection"];
          if (!*(void *)(*((void *)&buf + 1) + 40))
          {
            v46 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v88 = *MEMORY[0x1E4F28568];
            v89 = @"Failed to obtain remote target from connection";
            v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
            uint64_t v48 = [v46 errorWithDomain:@"BNBannerSourceErrorDomain" code:1 userInfo:v47];
            v49 = *(void **)(*((void *)&buf + 1) + 40);
            *(void *)(*((void *)&buf + 1) + 40) = v48;
          }
        }
      }
      else
      {
        id v26 = NSString;
        uint64_t v27 = [v8 requesterIdentifier];
        v19 = [v26 stringWithFormat:@"Presentable requesterID (%@) doesn't match source (%@)", v27, self->_requesterIdentifier];

        v28 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v86 = *MEMORY[0x1E4F28568];
        v87 = v19;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
        uint64_t v29 = [v28 errorWithDomain:@"BNBannerSourceErrorDomain" code:2 userInfo:v25];
        v30 = *(void **)(*((void *)&buf + 1) + 40);
        *(void *)(*((void *)&buf + 1) + 40) = v29;
      }
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v84 = *MEMORY[0x1E4F28568];
      id v85 = v13;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
      uint64_t v24 = [v23 errorWithDomain:@"BNBannerSourceErrorDomain" code:2 userInfo:v19];
      v25 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v24;
    }
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v82 = *MEMORY[0x1E4F28568];
    v83 = @"Missing presentable";
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    uint64_t v22 = [v21 errorWithDomain:@"BNBannerSourceErrorDomain" code:2 userInfo:v14];
    v19 = *(_BNPresentableContext **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v22;
  }

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    v59 = (id)BNLogHostingService;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v60 = BNEffectivePresentableDescription(v8);
      -[BNBannerSource postPresentable:options:userInfo:error:](v60, (uint64_t)&buf + 8, (uint64_t)location, v59);
    }

    if (a6) {
      *a6 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }
  BOOL v61 = *((unsigned char *)v78 + 24) != 0;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v77, 8);
  return v61;
}

void __57__BNBannerSource_postPresentable_options_userInfo_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 BOOLValue];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (*(unsigned char *)(a1 + 72)) {
      [*(id *)(a1 + 32) setHostNeedsUpdate];
    }
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_sync_enter(v6);
    [v6 _removePresentable:*(void *)(a1 + 40) reason:@"error encountered posting to remote target"];
    objc_sync_exit(v6);
  }
}

- (id)revokePresentableWithRequestIdentifier:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    requesterIdentifier = self->_requesterIdentifier;
    uint64_t v17 = v15;
    uint64_t v18 = NSStringFromBOOL();
    int v23 = 138544130;
    id v24 = v12;
    __int16 v25 = 2114;
    id v26 = requesterIdentifier;
    __int16 v27 = 2114;
    id v28 = v13;
    __int16 v29 = 2114;
    v30 = v18;
    _os_log_impl(&dword_1BEC04000, v17, OS_LOG_TYPE_DEFAULT, "Asked to revoke presentable with requestID %{public}@ and requesterID %{public}@ with reason '%{public}@' (animated=%{public}@)", (uint8_t *)&v23, 0x2Au);
  }
  v19 = +[BNPresentableIdentification identificationWithRequesterIdentifier:self->_requesterIdentifier requestIdentifier:v12];
  char v20 = [NSNumber numberWithBool:v9];
  uint64_t v21 = [(BNBannerSource *)self _revokePresentableWithIdentification:v19 reason:v13 animated:v20 userInfo:v14 error:a7];

  return v21;
}

- (id)revokeAllPresentablesWithReason:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    requesterIdentifier = self->_requesterIdentifier;
    int v15 = 138543618;
    int v16 = requesterIdentifier;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_impl(&dword_1BEC04000, v10, OS_LOG_TYPE_DEFAULT, "Asked to revoke all presentables with requester ID %{public}@ with reason '%{public}@'", (uint8_t *)&v15, 0x16u);
  }
  id v12 = +[BNPresentableIdentification identificationWithRequesterIdentifier:self->_requesterIdentifier];
  id v13 = [(BNBannerSource *)self _revokePresentableWithIdentification:v12 reason:v8 animated:0 userInfo:v9 error:a5];

  return v13;
}

- (BOOL)revokePresentableWithRequestIdentifier:(id)a3 animated:(BOOL)a4 reason:(id)a5 userInfo:(id)a6 error:(id *)a7
{
  id v7 = [(BNBannerSource *)self revokePresentableWithRequestIdentifier:a3 reason:a5 animated:a4 userInfo:a6 error:a7];
  BOOL v8 = v7 != 0;

  return v8;
}

- (id)revokePresentableWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 userInfo:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  int v15 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = v15;
    __int16 v17 = [v12 requestIdentifier];
    id v18 = [v12 requesterIdentifier];
    uint64_t v19 = [v12 uniquePresentableIdentifier];
    NSStringFromBOOL();
    __int16 v25 = self;
    v21 = char v20 = a7;
    *(_DWORD *)long long buf = 138544386;
    __int16 v27 = v17;
    __int16 v28 = 2114;
    __int16 v29 = v18;
    __int16 v30 = 2114;
    uint64_t v31 = v19;
    __int16 v32 = 2114;
    id v33 = v13;
    __int16 v34 = 2114;
    id v35 = v21;
    _os_log_impl(&dword_1BEC04000, v16, OS_LOG_TYPE_DEFAULT, "Asked to revoke presentable with requestID %{public}@, requesterID %{public}@, and uniqueID %{public}@ with reason '%{public}@' (animated=%{public}@)", buf, 0x34u);

    a7 = v20;
    self = v25;
  }
  uint64_t v22 = [NSNumber numberWithBool:v9];
  int v23 = [(BNBannerSource *)self _revokePresentableWithIdentification:v12 reason:v13 animated:v22 userInfo:v14 error:a7];

  return v23;
}

- (id)keyWindowForScreen:(id)a3
{
  id v4 = a3;
  p_bannerClientContainerDeferringFocus = &self->_bannerClientContainerDeferringFocus;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bannerClientContainerDeferringFocus);
  if ([WeakRetained isDeferringFocus])
  {
    id v7 = objc_loadWeakRetained((id *)p_bannerClientContainerDeferringFocus);
    BOOL v8 = [v7 keyWindowForScreen:v4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4 revokingCurrent:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a3;
  v37[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x3032000000;
  __int16 v27 = __Block_byref_object_copy_;
  __int16 v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  if (v10)
  {
    id obj = 0;
    id v11 = [(BNBannerSource *)self _activeConnectionWithError:&obj];
    objc_storeStrong(&v29, obj);
    id v12 = objc_msgSend(v11, "bn_remoteTargetEnforceLaunching");

    if (v12)
    {
      id v13 = [NSNumber numberWithBool:v8];
      id v14 = [NSNumber numberWithBool:v7];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __63__BNBannerSource_setSuspended_forReason_revokingCurrent_error___block_invoke;
      v22[3] = &unk_1E63B9518;
      v22[4] = &v30;
      v22[5] = &v24;
      objc_msgSend(v12, "__recommendSuspension:forReason:revokingCurrent:reply:", v13, v10, v14, v22);
    }
    else
    {
      if (v25[5]) {
        goto LABEL_7;
      }
      char v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      v37[0] = @"Failed to obtain remote target from connection";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      uint64_t v21 = [v20 errorWithDomain:@"BNBannerSourceErrorDomain" code:1 userInfo:v13];
      id v14 = (void *)v25[5];
      v25[5] = v21;
    }
  }
  else
  {
    int v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    id v35 = @"Missing 'reason'";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    uint64_t v16 = [v15 errorWithDomain:@"BNBannerSourceErrorDomain" code:2 userInfo:v12];
    id v13 = (void *)v25[5];
    v25[5] = v16;
  }

LABEL_7:
  if (a6)
  {
    __int16 v17 = (void *)v25[5];
    if (v17) {
      *a6 = v17;
    }
  }
  BOOL v18 = *((unsigned char *)v31 + 24) != 0;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v18;
}

void __63__BNBannerSource_setSuspended_forReason_revokingCurrent_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(BNBannerSource *)self isValid])
  {
    objc_super v3 = BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      uint64_t v6 = self;
      _os_log_impl(&dword_1BEC04000, v3, OS_LOG_TYPE_DEFAULT, "BNBannerSource invalidated: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    [(BNBannerSource *)self _invalidateConnection];
    [(id)objc_opt_class() _invalidateBannerSource:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained bannerSourceDidInvalidate:self];
    }
  }
}

- (id)containerViewControllerForBannerSceneComponentProvider:(id)a3
{
  int v5 = [a3 _scene];
  uint64_t v6 = [v5 _FBSScene];
  uint64_t v7 = [v6 settings];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = v10;

  id v12 = objc_msgSend(v5, "bn_presentableUniqueIdentifier");
  id v13 = [(BNBannerSource *)self _presentableForUniqueIdentifier:v12];
  if (!v13)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    char v20 = [v5 _FBSScene];
    uint64_t v21 = [v20 identifier];
    [v19 handleFailureInMethod:a2, self, @"BNBannerSource.m", 424, @"No presentable for scene with ID '%@'", v21 object file lineNumber description];
  }
  id v14 = (objc_class *)[v11 clientContainerViewControllerClass];
  if (!v14) {
    id v14 = (objc_class *)objc_opt_class();
  }
  int v15 = [v13 uniquePresentableIdentifier];
  uint64_t v16 = [(BNBannerSource *)self _presentableContextForPresentableWithUniqueIdentifier:v15];

  __int16 v17 = (void *)[[v14 alloc] initWithScene:v5 presentable:v13 context:v16];
  [v17 setDelegate:self];

  return v17;
}

- (void)sceneWillInvalidateForBannerSceneComponentProvider:(id)a3
{
  id v5 = [a3 _scene];
  id v4 = objc_msgSend(v5, "bn_presentableUniqueIdentifier");
  [(BNBannerSource *)self _removePresentableWithUniqueIdentifier:v4 reason:@"scene will invalidate"];
}

- (BOOL)bannerClientContainerShouldDeferFocus:(id)a3
{
  int64_t destination = self->_destination;
  if (destination == 1) {
    objc_storeWeak((id *)&self->_bannerClientContainerDeferringFocus, a3);
  }
  return destination == 1;
}

- (void)bannerClientContainerStoppedDeferringFocus:(id)a3
{
  p_bannerClientContainerDeferringFocus = &self->_bannerClientContainerDeferringFocus;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_bannerClientContainerDeferringFocus);

  if (WeakRetained == v4)
  {
    objc_storeWeak((id *)p_bannerClientContainerDeferringFocus, 0);
  }
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v10 providesTemplateContent])
  {
    uint64_t v7 = [v10 uniquePresentableIdentifier];
    uint64_t v8 = [(BNBannerSource *)self _presentableContextForPresentableWithUniqueIdentifier:v7];
    [v8 removePresentableObserver:self];

    id v9 = [NSString stringWithFormat:@"template presentable did disappear as banner (%@)", v6];
    [(BNBannerSource *)self _removePresentable:v10 reason:v9];
  }
}

+ (void)_invalidateBannerSource:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v3;
      _os_log_impl(&dword_1BEC04000, v4, OS_LOG_TYPE_DEFAULT, "Removing reference to invalidated banner source: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    id v5 = (void *)__requesterIDsToMachNamesToSources;
    id v6 = [v3 requesterIdentifier];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
    [v7 setObject:0 forKeyedSubscript:*((void *)v3 + 1)];

    *((unsigned char *)v3 + 48) = 0;
  }
}

- (id)_activeConnectionWithError:(id *)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_valid)
  {
    if (v4->_connection) {
      goto LABEL_9;
    }
    id v5 = (void *)MEMORY[0x1E4F623E8];
    machName = v4->_machName;
    uint64_t v7 = +[BNBannerSourceSessionSpecification identifier];
    int v8 = [v5 endpointForMachName:machName service:v7 instance:0];

    uint64_t v9 = [MEMORY[0x1E4F623E0] connectionWithEndpoint:v8];
    connection = v4->_connection;
    v4->_connection = (BSServiceConnection *)v9;

    id v11 = v4->_connection;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__BNBannerSource__activeConnectionWithError___block_invoke;
    v15[3] = &unk_1E63B9568;
    v15[4] = v4;
    [(BSServiceConnection *)v11 configureConnection:v15];
    [(BSServiceConnection *)v4->_connection activate];
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR)) {
    -[BNBannerSource _activeConnectionWithError:]();
  }
  if (a3)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"Attempt to establish connection with an invalidated BNBannerSource";
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    *a3 = [v12 errorWithDomain:@"BNBannerSourceErrorDomain" code:0 userInfo:v8];
LABEL_8:
  }
LABEL_9:
  objc_sync_exit(v4);

  id v13 = v4->_connection;
  return v13;
}

void __45__BNBannerSource__activeConnectionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[BNBannerSourceSessionSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  id v5 = +[BNBannerSourceSessionSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__BNBannerSource__activeConnectionWithError___block_invoke_2;
  v10[3] = &unk_1E63B9540;
  objc_copyWeak(&v11, &location);
  [v3 setActivationHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__BNBannerSource__activeConnectionWithError___block_invoke_97;
  v8[3] = &unk_1E63B9540;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__BNBannerSource__activeConnectionWithError___block_invoke_98;
  v6[3] = &unk_1E63B9540;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __45__BNBannerSource__activeConnectionWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v5 = 138543362;
    id v6 = WeakRetained;
    _os_log_impl(&dword_1BEC04000, v3, OS_LOG_TYPE_DEFAULT, "BNBannerSource (service-side) connection activated: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

void __45__BNBannerSource__activeConnectionWithError___block_invoke_97(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v7 = 138543362;
    id v8 = WeakRetained;
    _os_log_impl(&dword_1BEC04000, v5, OS_LOG_TYPE_DEFAULT, "BNBannerSource (service-side) connection interrupted: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [v3 activate];
}

void __45__BNBannerSource__activeConnectionWithError___block_invoke_98(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_sync_enter(v3);
    id v4 = BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      int v7 = v3;
      _os_log_impl(&dword_1BEC04000, v4, OS_LOG_TYPE_DEFAULT, "BNBannerSource (service-side) connection invalidated: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    int v5 = (void *)v3[3];
    v3[3] = 0;

    objc_sync_exit(v3);
  }
}

- (void)_invalidateConnection
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_connection)
  {
    id v3 = BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      int v6 = v2;
      _os_log_impl(&dword_1BEC04000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating connection: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    [(BSServiceConnection *)v2->_connection invalidate];
    connection = v2->_connection;
    v2->_connection = 0;
  }
  objc_sync_exit(v2);
}

- (BOOL)_isValidPresentable:(id)a3 errorDescription:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [v5 requestIdentifier];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    int v15 = NSString;
    uint64_t v16 = BNEffectivePresentableDescription(v5);
    [v15 stringWithFormat:@"Presentable missing requestID: %@", v16];
LABEL_11:
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v14 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = [v5 requesterIdentifier];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    __int16 v17 = NSString;
    uint64_t v16 = BNEffectivePresentableDescription(v5);
    [v17 stringWithFormat:@"Presentable missing requesterID: %@", v16];
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || ([v5 providesTemplateContent] & 1) == 0)
  {
    uint64_t v10 = UIViewControllerFromPresentable(v5);

    if (!v10)
    {
      id v11 = (void *)BNLogHostingService;
      if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = v11;
        id v13 = BNEffectivePresentableDescription(v5);
        *(_DWORD *)long long buf = 138543362;
        __int16 v27 = v13;
        _os_log_impl(&dword_1BEC04000, v12, OS_LOG_TYPE_DEFAULT, "Presentable provides neither template content nor a view controller – deferring to listener to manage UI: %{public}@", buf, 0xCu);
      }
    }
  }
  BOOL v14 = 1;
LABEL_12:
  BOOL v18 = [v5 requesterIdentifier];
  char v19 = [v18 hasPrefix:@"com."];

  if ((v19 & 1) == 0)
  {
    char v20 = (void *)BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR)) {
      -[BNBannerSource _isValidPresentable:errorDescription:](v20, v5);
    }
  }
  uint64_t v21 = [v5 requesterIdentifier];
  uint64_t v22 = [v5 requestIdentifier];
  int v23 = BSEqualStrings();

  if (v23)
  {
    uint64_t v24 = (void *)BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR)) {
      -[BNBannerSource _isValidPresentable:errorDescription:](v24, v5);
    }
  }

  return v14;
}

- (void)_addPresentableContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    uniqueIDsToContexts = v5->_uniqueIDsToContexts;
    if (!uniqueIDsToContexts)
    {
      uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v8 = v5->_uniqueIDsToContexts;
      v5->_uniqueIDsToContexts = v7;

      uniqueIDsToContexts = v5->_uniqueIDsToContexts;
    }
    uint64_t v9 = [v4 presentable];
    uint64_t v10 = [v9 uniquePresentableIdentifier];
    [(NSMutableDictionary *)uniqueIDsToContexts setObject:v4 forKey:v10];

    [v4 addPresentableObserver:v5];
    id v11 = BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v4;
      _os_log_impl(&dword_1BEC04000, v11, OS_LOG_TYPE_DEFAULT, "Added presentable context: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    objc_sync_exit(v5);
  }
}

- (id)_presentableContextForPresentableWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    int v6 = [(NSMutableDictionary *)v5->_uniqueIDsToContexts objectForKey:v4];
    objc_sync_exit(v5);
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)_presentableForUniqueIdentifier:(id)a3
{
  id v3 = [(BNBannerSource *)self _presentableContextForPresentableWithUniqueIdentifier:a3];
  id v4 = [v3 presentable];

  return v4;
}

- (void)_removePresentableContextForPresentableWithUniqueIdentifier:(id)a3 reason:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v8 length])
  {
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BNBannerSource.m", 577, @"Invalid parameter not satisfying: %@", @"[reason length] > 0" object file lineNumber description];

    if (!v7) {
      goto LABEL_10;
    }
  }
  uint64_t v9 = self;
  objc_sync_enter(v9);
  uint64_t v10 = [(BNBannerSource *)v9 _presentableContextForPresentableWithUniqueIdentifier:v7];
  if (v10)
  {
    [(NSMutableDictionary *)v9->_uniqueIDsToContexts removeObjectForKey:v7];
    id v11 = BNLogHostingService;
    if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      id v14 = v8;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1BEC04000, v11, OS_LOG_TYPE_DEFAULT, "Removed presentable context for reason '%{public}@': %{public}@", buf, 0x16u);
    }
    [v10 invalidate];
  }
  else if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR))
  {
    -[BNBannerSource _removePresentableContextForPresentableWithUniqueIdentifier:reason:]();
  }

  objc_sync_exit(v9);
LABEL_10:
}

- (void)_removePresentable:(id)a3 reason:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    uint64_t v9 = [v7 uniquePresentableIdentifier];
    if (!v9)
    {
      __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"BNBannerSource.m", 599, @"Presentable has no unique identifier: %@", v7 object file lineNumber description];
    }
    id v10 = [(BNBannerSource *)self _presentableForUniqueIdentifier:v9];
    if (v10 == v7)
    {
      [(BNBannerSource *)self _removePresentableWithUniqueIdentifier:v9 reason:v8];
    }
    else
    {
      id v11 = (void *)BNLogHostingService;
      if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_ERROR))
      {
        int v12 = v11;
        id v13 = BNEffectivePresentableDescription(v10);
        id v14 = BNEffectivePresentableDescription(v7);
        *(_DWORD *)long long buf = 138543874;
        id v17 = v8;
        __int16 v18 = 2114;
        char v19 = v13;
        __int16 v20 = 2114;
        uint64_t v21 = v14;
        _os_log_error_impl(&dword_1BEC04000, v12, OS_LOG_TYPE_ERROR, "Retrieved different presentable to remove for reason '%{public}@': argument: %{public}@; retrieved presentable: %{public}@",
          buf,
          0x20u);
      }
    }
  }
}

- (id)_revokePresentableWithIdentification:(id)a3 reason:(id)a4 animated:(id)a5 userInfo:(id)a6 error:(id *)a7
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = (id *)&v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  id v44 = 0;
  if (!v12 || !v13)
  {
    __int16 v25 = NSString;
    uint64_t v26 = [v12 requesterIdentifier];
    __int16 v20 = [v25 stringWithFormat:@"Requester identifier in identification (%@) doesn't match banner source (%@)", v26, self->_requesterIdentifier];

    __int16 v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v59 = *MEMORY[0x1E4F28568];
    v60 = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    uint64_t v28 = [v27 errorWithDomain:@"BNBannerSourceErrorDomain" code:2 userInfo:v21];
LABEL_8:
    id v22 = v40[5];
    v40[5] = (id)v28;
    goto LABEL_9;
  }
  uint64_t v16 = [v12 requesterIdentifier];
  int v17 = [v16 isEqualToString:self->_requesterIdentifier];

  if (!v17)
  {
    __int16 v20 = [NSString stringWithFormat:@"Missing %@%@", @"identification", &stru_1F19B7378];
    id v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v61 = *MEMORY[0x1E4F28568];
    v62 = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    uint64_t v28 = [v29 errorWithDomain:@"BNBannerSourceErrorDomain" code:2 userInfo:v21];
    goto LABEL_8;
  }
  __int16 v18 = v40;
  id obj = 0;
  char v19 = [(BNBannerSource *)self _activeConnectionWithError:&obj];
  objc_storeStrong(v18 + 5, obj);
  __int16 v20 = objc_msgSend(v19, "bn_remoteTargetEnforceLaunching");

  if (v20)
  {
    uint64_t v21 = [v12 requesterIdentifier];
    id v22 = [v12 requestIdentifier];
    int v23 = [v12 uniquePresentableIdentifier];
    uint64_t v24 = +[BNPresentableIdentification identificationWithRequesterIdentifier:v21 requestIdentifier:v22 uniqueIdentifier:v23];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    void v37[2] = __86__BNBannerSource__revokePresentableWithIdentification_reason_animated_userInfo_error___block_invoke;
    v37[3] = &unk_1E63B9590;
    v37[4] = &v45;
    v37[5] = &v39;
    objc_msgSend(v20, "__revokePresentablesWithIdentification:withAnimation:reason:userInfo:reply:", v24, v14, v13, v15, v37);

LABEL_9:
    goto LABEL_10;
  }
  if (!v40[5])
  {
    char v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v63 = *MEMORY[0x1E4F28568];
    v64[0] = @"Failed to obtain remote target from connection";
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
    uint64_t v28 = [v33 errorWithDomain:@"BNBannerSourceErrorDomain" code:1 userInfo:v21];
    goto LABEL_8;
  }
LABEL_10:

  if (v40[5])
  {
    uint64_t v30 = (id)BNLogHostingService;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v34 = [v12 requestIdentifier];
      id v35 = [v12 requesterIdentifier];
      id v36 = v40[5];
      *(_DWORD *)long long buf = 138544130;
      id v52 = v34;
      __int16 v53 = 2114;
      id v54 = v35;
      __int16 v55 = 2114;
      id v56 = v13;
      __int16 v57 = 2114;
      id v58 = v36;
      _os_log_error_impl(&dword_1BEC04000, v30, OS_LOG_TYPE_ERROR, "Error encountered attempting to revoke presentable with requestID %{public}@ and requesterID %{public}@ for reason '%{public}@': %{public}@", buf, 0x2Au);
    }
    if (a7) {
      *a7 = v40[5];
    }
  }
  id v31 = (id)v46[5];
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v31;
}

void __86__BNBannerSource__revokePresentableWithIdentification_reason_animated_userInfo_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (int64_t)destination
{
  return self->_destination;
}

- (NSString)requesterIdentifier
{
  return self->_requesterIdentifier;
}

- (BNBannerSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BNBannerSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requesterIdentifier, 0);
  objc_destroyWeak((id *)&self->_bannerClientContainerDeferringFocus);
  objc_storeStrong((id *)&self->_uniqueIDsToContexts, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_machName, 0);
}

- (void)postPresentable:(void *)a1 options:(uint64_t)a2 userInfo:(uint64_t)a3 error:(NSObject *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v5 = *(void *)(*(void *)a2 + 40);
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = v5;
  OUTLINED_FUNCTION_1(&dword_1BEC04000, a4, a3, "Error encountered attempting to post: presentable: %{public}@; error: %{public}@",
    (uint8_t *)a3);
}

- (void)_activeConnectionWithError:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1BEC04000, v0, v1, "Attempt to establish connection with an invalidated BNBannerSource: %{public}@", v2);
}

- (void)_isValidPresentable:(void *)a1 errorDescription:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = BNEffectivePresentableDescription(a2);
  OUTLINED_FUNCTION_2();
}

- (void)_isValidPresentable:(void *)a1 errorDescription:(void *)a2 .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = BNEffectivePresentableDescription(a2);
  OUTLINED_FUNCTION_2();
}

- (void)_removePresentableContextForPresentableWithUniqueIdentifier:reason:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BEC04000, v0, (uint64_t)v0, "No presentable context to remove for reason '%{public}@' with unique identifier: %{public}@", v1);
}

@end