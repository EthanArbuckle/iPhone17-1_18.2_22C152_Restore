@interface CAMStillImagePersistenceCoordinator
- (BOOL)hasReceivedAllExpectedResponses;
- (CAMStillImagePersistenceCoordinator)initWithDelegate:(id)a3 loggingIdentifier:(id)a4;
- (CAMStillImagePersistenceCoordinatorDelegate)delegate;
- (NSMutableDictionary)_pendingLocalPersistenceResults;
- (NSMutableDictionary)_receivedCoordinationInfos;
- (NSString)_loggingPrefix;
- (NSString)loggingIdentifier;
- (id)_debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:(id)a3 receivedCoordinationInfos:(id)a4;
- (unsigned)_powerAssertionReasonForResultSpecifiers:(unint64_t)a3;
- (void)_dispatchRemotePersistenceIfPossibleForPairWithOriginalResultSpecifiers:(unint64_t)a3 processedResultSpecifiers:(unint64_t)a4 request:(id)a5 shouldPersistAsSingleAsset:(BOOL)a6;
- (void)_dispatchRemotePersistenceIfPossibleForResultSpecifiers:(unint64_t)a3 request:(id)a4;
- (void)updateForCoordinationInfo:(id)a3 localPersistenceResult:(id)a4 request:(id)a5;
- (void)updateForTimeoutTimerFiredForCoordinationInfo:(id)a3 request:(id)a4;
@end

@implementation CAMStillImagePersistenceCoordinator

- (void)updateForCoordinationInfo:(id)a3 localPersistenceResult:(id)a4 request:(id)a5
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v96 = a5;
  v10 = [(CAMStillImagePersistenceCoordinator *)self delegate];
  v11 = [(CAMStillImagePersistenceCoordinator *)self _receivedCoordinationInfos];
  v97 = self;
  v95 = [(CAMStillImagePersistenceCoordinator *)self _pendingLocalPersistenceResults];
  uint64_t v12 = [v8 resultSpecifiers];
  v13 = [v8 allExpectedResultSpecifiers];
  v14 = [NSNumber numberWithUnsignedInteger:v12];
  v15 = [v11 objectForKeyedSubscript:v14];

  if (v15)
  {
    v16 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CAMStillImagePersistenceCoordinator updateForCoordinationInfo:localPersistenceResult:request:](self, v12, v16);
    }
  }
  v94 = v9;
  if (!v9 || ([v9 error], v17 = objc_claimAutoreleasedReturnValue(), v17, v17))
  {
    v18 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    v87 = [(CAMStillImagePersistenceCoordinator *)v97 _loggingPrefix];
    if ((v12 & 2) != 0)
    {
      v19 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      if ((v12 & 1) == 0)
      {
LABEL_17:
        if (![(__CFString *)v19 length])
        {

          v19 = @"None";
        }
        *(_DWORD *)buf = 138543618;
        v99 = v87;
        __int16 v100 = 2114;
        v101 = v19;
        _os_log_impl(&dword_2099F8000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating persistence coordination with %{public}@ image (unusable result)", buf, 0x16u);

        goto LABEL_25;
      }
    }
    else
    {
      v19 = &stru_26BD78BA0;
      if ((v12 & 1) == 0) {
        goto LABEL_17;
      }
    }
    [(__CFString *)v19 stringByAppendingString:@"HDR"];
    id v90 = v8;
    uint64_t v22 = v21 = v10;

    v19 = (__CFString *)v22;
    v10 = v21;
    id v8 = v90;
    goto LABEL_17;
  }
  v18 = os_log_create("com.apple.camera", "Camera");
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_25;
  }
  v89 = [(CAMStillImagePersistenceCoordinator *)v97 _loggingPrefix];
  if ((v12 & 2) == 0)
  {
    v20 = &stru_26BD78BA0;
    if ((v12 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  v20 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
  if (v12)
  {
LABEL_21:
    [(__CFString *)v20 stringByAppendingString:@"HDR"];
    uint64_t v24 = v23 = v10;

    v20 = (__CFString *)v24;
    v10 = v23;
    id v9 = v94;
  }
LABEL_22:
  if (![(__CFString *)v20 length])
  {

    v20 = @"None";
  }
  *(_DWORD *)buf = 138543618;
  v99 = v89;
  __int16 v100 = 2114;
  v101 = v20;
  _os_log_impl(&dword_2099F8000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating persistence coordination with %{public}@ image", buf, 0x16u);

LABEL_25:
  v25 = [NSNumber numberWithUnsignedInteger:v12];
  [v11 setObject:v8 forKeyedSubscript:v25];

  if (v9)
  {
    v26 = [v9 error];

    if (!v26)
    {
      v27 = [NSNumber numberWithUnsignedInteger:v12];
      [v95 setObject:v9 forKeyedSubscript:v27];
    }
  }
  int v28 = [v13 containsObject:&unk_26BDDE0A0];
  int v29 = [v13 containsObject:&unk_26BDDE0B8];
  int v30 = [v13 containsObject:&unk_26BDDE0D0];
  v93 = v10;
  if ([v13 containsObject:&unk_26BDDE0E8] && v30 && v29 && v28)
  {
    v31 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = [(CAMStillImagePersistenceCoordinator *)v97 _loggingPrefix];
      uint64_t v33 = [&stru_26BD78BA0 length];
      v34 = @"None";
      if (v33) {
        v34 = &stru_26BD78BA0;
      }
      v84 = v34;
      v35 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      v88 = (void *)v32;
      if (![(__CFString *)v35 length])
      {

        v35 = @"None";
      }
      v86 = v15;
      id v91 = v8;
      v36 = v35;
      v37 = [&stru_26BD78BA0 stringByAppendingString:@"HDR"];
      v38 = v13;
      if (![(__CFString *)v37 length])
      {

        v37 = @"None";
      }
      v39 = v37;
      v40 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      v41 = [v40 stringByAppendingString:@"HDR"];

      if (![(__CFString *)v41 length])
      {

        v41 = @"None";
      }
      v13 = v38;
      *(_DWORD *)buf = 138544386;
      v99 = v88;
      __int16 v100 = 2114;
      v101 = v84;
      __int16 v102 = 2114;
      v103 = v36;
      __int16 v104 = 2114;
      v105 = v37;
      __int16 v106 = 2114;
      v107 = v41;
      _os_log_impl(&dword_2099F8000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ Expecting %{public}@+%{public}@ and %{public}@+%{public}@ pairs", buf, 0x34u);

      id v8 = v91;
      v10 = v93;
      v15 = v86;
    }

    v42 = [v11 objectForKey:&unk_26BDDE0A0];

    v43 = [v11 objectForKey:&unk_26BDDE0D0];

    if (v42 && v43)
    {
      [(CAMStillImagePersistenceCoordinator *)v97 _dispatchRemotePersistenceIfPossibleForPairWithOriginalResultSpecifiers:0 processedResultSpecifiers:2 request:v96 shouldPersistAsSingleAsset:1];
      v44 = v97;
      uint64_t v45 = 1;
      uint64_t v46 = 3;
      id v47 = v96;
      uint64_t v48 = 1;
LABEL_59:
      [(CAMStillImagePersistenceCoordinator *)v44 _dispatchRemotePersistenceIfPossibleForPairWithOriginalResultSpecifiers:v45 processedResultSpecifiers:v46 request:v47 shouldPersistAsSingleAsset:v48];
    }
  }
  else if (([v8 isUnfilteredImageForFilteredPair] & 1) != 0 {
         || [v8 isFilteredImageForFilteredPair])
  }
  {
    unint64_t v49 = v12 & 0xFFFFFFFFFFFFFFFDLL;
    uint64_t v50 = v12 | 2;
    v51 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v85 = [(CAMStillImagePersistenceCoordinator *)v97 _loggingPrefix];
      if (v12)
      {
        v52 = [&stru_26BD78BA0 stringByAppendingString:@"HDR"];
      }
      else
      {
        v52 = &stru_26BD78BA0;
      }
      if (![(__CFString *)v52 length])
      {

        v52 = @"None";
      }
      v83 = v52;
      v58 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      v59 = v58;
      if (v12)
      {
        [(__CFString *)v58 stringByAppendingString:@"HDR"];
        uint64_t v61 = v60 = v13;

        v59 = (__CFString *)v61;
        v13 = v60;
      }
      if (![(__CFString *)v59 length])
      {

        v59 = @"None";
      }
      *(_DWORD *)buf = 138543874;
      v99 = v85;
      __int16 v100 = 2114;
      v101 = v52;
      __int16 v102 = 2114;
      v103 = v59;
      _os_log_impl(&dword_2099F8000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ Expecting %{public}@+%{public}@", buf, 0x20u);

      uint64_t v50 = v12 | 2;
      unint64_t v49 = v12 & 0xFFFFFFFFFFFFFFFDLL;
    }

    [(CAMStillImagePersistenceCoordinator *)v97 _dispatchRemotePersistenceIfPossibleForPairWithOriginalResultSpecifiers:v49 processedResultSpecifiers:v50 request:v96 shouldPersistAsSingleAsset:1];
    v10 = v93;
  }
  else
  {
    v53 = os_log_create("com.apple.camera", "Camera");
    BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
    if ((v29 & v28) == 1)
    {
      if (v54)
      {
        v92 = v13;
        v55 = [(CAMStillImagePersistenceCoordinator *)v97 _loggingPrefix];
        if ([&stru_26BD78BA0 length]) {
          v56 = &stru_26BD78BA0;
        }
        else {
          v56 = @"None";
        }
        v57 = [&stru_26BD78BA0 stringByAppendingString:@"HDR"];
        if (![(__CFString *)v57 length])
        {

          v57 = @"None";
        }
        *(_DWORD *)buf = 138543874;
        v99 = v55;
        __int16 v100 = 2114;
        v101 = v56;
        __int16 v102 = 2114;
        v103 = v57;
        _os_log_impl(&dword_2099F8000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ Expecting %{public}@+%{public}@", buf, 0x20u);

        v13 = v92;
      }

      id v47 = v96;
      v44 = v97;
      uint64_t v45 = 0;
      uint64_t v46 = 1;
      uint64_t v48 = 0;
      goto LABEL_59;
    }
    if (v54)
    {
      v76 = [(CAMStillImagePersistenceCoordinator *)v97 _loggingPrefix];
      if ((v12 & 2) != 0)
      {
        v77 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      }
      else
      {
        v77 = &stru_26BD78BA0;
      }
      if (v12)
      {
        [(__CFString *)v77 stringByAppendingString:@"HDR"];
        uint64_t v78 = v12;
        v79 = v76;
        v80 = v15;
        uint64_t v82 = v81 = v13;

        v77 = (__CFString *)v82;
        v13 = v81;
        v15 = v80;
        v76 = v79;
        uint64_t v12 = v78;
      }
      if (![(__CFString *)v77 length])
      {

        v77 = @"None";
      }
      *(_DWORD *)buf = 138543618;
      v99 = v76;
      __int16 v100 = 2114;
      v101 = v77;
      _os_log_impl(&dword_2099F8000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ Not expecting any pairs, persisting %{public}@ on its own", buf, 0x16u);
    }
    [(CAMStillImagePersistenceCoordinator *)v97 _dispatchRemotePersistenceIfPossibleForResultSpecifiers:v12 request:v96];
  }
  v62 = [NSNumber numberWithUnsignedInteger:v12];
  v63 = [v95 objectForKeyedSubscript:v62];

  if (v63)
  {
    v64 = [(CAMStillImagePersistenceCoordinator *)v97 _debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:v13 receivedCoordinationInfos:v11];
    os_log_t v65 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
LABEL_79:

      [v10 stillImagePersistenceCoordinator:v97 requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo:v8 request:v96];
      goto LABEL_80;
    }
    v66 = [(CAMStillImagePersistenceCoordinator *)v97 _loggingPrefix];
    if ((v12 & 2) != 0)
    {
      v67 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      if (v12) {
        goto LABEL_73;
      }
    }
    else
    {
      v67 = &stru_26BD78BA0;
      if (v12)
      {
LABEL_73:
        uint64_t v68 = [(__CFString *)v67 stringByAppendingString:@"HDR"];
        v69 = v11;
        v70 = v66;
        v71 = v15;
        v72 = v69;
        v73 = v13;
        v74 = (__CFString *)v68;

        v67 = v74;
        v13 = v73;
        v75 = v72;
        v15 = v71;
        v66 = v70;
LABEL_76:
        if (![(__CFString *)v67 length])
        {

          v67 = @"None";
        }
        v11 = v75;
        *(_DWORD *)buf = 138543874;
        v99 = v66;
        __int16 v100 = 2114;
        v101 = v67;
        __int16 v102 = 2114;
        v103 = v64;
        _os_log_impl(&dword_2099F8000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@ Deferring persistence of %{public}@ image while waiting on %{public}@", buf, 0x20u);

        v10 = v93;
        goto LABEL_79;
      }
    }
    v75 = v11;
    goto LABEL_76;
  }
LABEL_80:
}

- (CAMStillImagePersistenceCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMStillImagePersistenceCoordinatorDelegate *)WeakRetained;
}

- (NSMutableDictionary)_receivedCoordinationInfos
{
  return self->__receivedCoordinationInfos;
}

- (NSMutableDictionary)_pendingLocalPersistenceResults
{
  return self->__pendingLocalPersistenceResults;
}

- (void)_dispatchRemotePersistenceIfPossibleForResultSpecifiers:(unint64_t)a3 request:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [(CAMStillImagePersistenceCoordinator *)self delegate];
  id v8 = [(CAMStillImagePersistenceCoordinator *)self _pendingLocalPersistenceResults];
  id v9 = [NSNumber numberWithUnsignedInteger:a3];
  v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    v11 = [v10 localPersistenceUUID];
    os_log_t v12 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      objc_msgSend(v7, "stillImagePersistenceCoordinator:requestsRemotePersistenceForLocalPersistenceResult:filteredLocalResult:request:powerAssertionReason:", self, v10, 0, v6, -[CAMStillImagePersistenceCoordinator _powerAssertionReasonForResultSpecifiers:](self, "_powerAssertionReasonForResultSpecifiers:", a3));
      v15 = [NSNumber numberWithUnsignedInteger:a3];
      [v8 setObject:0 forKeyedSubscript:v15];

      goto LABEL_12;
    }
    v17 = [(CAMStillImagePersistenceCoordinator *)self _loggingPrefix];
    if ((a3 & 2) != 0)
    {
      v13 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      if ((a3 & 1) == 0)
      {
LABEL_8:
        if (![(__CFString *)v13 length])
        {

          v13 = @"None";
        }
        *(_DWORD *)buf = 138543874;
        v19 = v17;
        __int16 v20 = 2114;
        v21 = v13;
        __int16 v22 = 2114;
        v23 = v11;
        _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Dispatching remote persistence for %{public}@ as %{public}@", buf, 0x20u);

        id v6 = v16;
        goto LABEL_11;
      }
    }
    else
    {
      v13 = &stru_26BD78BA0;
      if ((a3 & 1) == 0) {
        goto LABEL_8;
      }
    }
    uint64_t v14 = [(__CFString *)v13 stringByAppendingString:@"HDR"];

    v13 = (__CFString *)v14;
    goto LABEL_8;
  }
LABEL_12:
}

- (unsigned)_powerAssertionReasonForResultSpecifiers:(unint64_t)a3
{
  if (a3) {
    unsigned int v3 = 1024;
  }
  else {
    unsigned int v3 = 512;
  }
  if ((a3 & 2) != 0) {
    unsigned int v3 = 2048;
  }
  if ((~(_BYTE)a3 & 3) != 0) {
    return v3;
  }
  else {
    return 4096;
  }
}

- (BOOL)hasReceivedAllExpectedResponses
{
  v2 = [(CAMStillImagePersistenceCoordinator *)self _receivedCoordinationInfos];
  if ([v2 count])
  {
    unsigned int v3 = [v2 allValues];
    v4 = [v3 firstObject];
    v5 = [v4 allExpectedResultSpecifiers];
    uint64_t v11 = 0;
    os_log_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 1;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __70__CAMStillImagePersistenceCoordinator_hasReceivedAllExpectedResponses__block_invoke;
    v8[3] = &unk_263FA28A8;
    id v9 = v2;
    v10 = &v11;
    [v5 enumerateObjectsUsingBlock:v8];
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __70__CAMStillImagePersistenceCoordinator_hasReceivedAllExpectedResponses__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  v5 = [*(id *)(a1 + 32) objectForKey:a2];

  if (!v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__loggingPrefix, 0);
  objc_storeStrong((id *)&self->__pendingLocalPersistenceResults, 0);
  objc_storeStrong((id *)&self->__receivedCoordinationInfos, 0);
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (CAMStillImagePersistenceCoordinator)initWithDelegate:(id)a3 loggingIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CAMStillImagePersistenceCoordinator;
  id v8 = [(CAMStillImagePersistenceCoordinator *)&v20 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v10 = [v7 copy];
    loggingIdentifier = v9->_loggingIdentifier;
    v9->_loggingIdentifier = (NSString *)v10;

    uint64_t v12 = [NSString stringWithFormat:@"%@ PersistenceCoordinator:", v7];
    loggingPrefix = v9->__loggingPrefix;
    v9->__loggingPrefix = (NSString *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    receivedCoordinationInfos = v9->__receivedCoordinationInfos;
    v9->__receivedCoordinationInfos = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    pendingLocalPersistenceResults = v9->__pendingLocalPersistenceResults;
    v9->__pendingLocalPersistenceResults = (NSMutableDictionary *)v16;

    v18 = v9;
  }

  return v9;
}

- (void)_dispatchRemotePersistenceIfPossibleForPairWithOriginalResultSpecifiers:(unint64_t)a3 processedResultSpecifiers:(unint64_t)a4 request:(id)a5 shouldPersistAsSingleAsset:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v44 = a5;
  uint64_t v45 = [(CAMStillImagePersistenceCoordinator *)self delegate];
  uint64_t v10 = [(CAMStillImagePersistenceCoordinator *)self _receivedCoordinationInfos];
  uint64_t v46 = [(CAMStillImagePersistenceCoordinator *)self _pendingLocalPersistenceResults];
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v13 = [v10 objectForKey:v11];

  uint64_t v14 = [v10 objectForKey:v12];

  if (v6)
  {
    v15 = v44;
    if (v13 && v14)
    {
      uint64_t v16 = [v46 objectForKeyedSubscript:v11];
      uint64_t v17 = [v46 objectForKeyedSubscript:v12];
      v18 = (void *)v17;
      v43 = v16;
      if (v16 && v17)
      {
        v19 = [v16 localPersistenceUUID];
        objc_super v20 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v40 = [(CAMStillImagePersistenceCoordinator *)self _loggingPrefix];
          if ((a3 & 2) != 0)
          {
            v21 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
          }
          else
          {
            v21 = &stru_26BD78BA0;
          }
          v37 = v18;
          if (a3)
          {
            uint64_t v26 = [(__CFString *)v21 stringByAppendingString:@"HDR"];

            v21 = (__CFString *)v26;
          }
          if (![(__CFString *)v21 length])
          {

            v21 = @"None";
          }
          v35 = v21;
          if ((a4 & 2) != 0)
          {
            v27 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
          }
          else
          {
            v27 = &stru_26BD78BA0;
          }
          v15 = v44;
          if (a4)
          {
            uint64_t v28 = [(__CFString *)v27 stringByAppendingString:@"HDR"];

            v27 = (__CFString *)v28;
          }
          v18 = v37;
          if (![(__CFString *)v27 length])
          {

            v27 = @"None";
          }
          *(_DWORD *)buf = 138544130;
          uint64_t v48 = v40;
          __int16 v49 = 2114;
          uint64_t v50 = v36;
          __int16 v51 = 2114;
          v52 = v27;
          __int16 v53 = 2114;
          uint64_t v54 = (uint64_t)v19;
          _os_log_impl(&dword_2099F8000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Dispatching remote persistence for %{public}@+%{public}@ as %{public}@", buf, 0x2Au);
        }
        objc_msgSend(v45, "stillImagePersistenceCoordinator:requestsRemotePersistenceForLocalPersistenceResult:filteredLocalResult:request:powerAssertionReason:", self, v43, v18, v15, -[CAMStillImagePersistenceCoordinator _powerAssertionReasonForResultSpecifiers:](self, "_powerAssertionReasonForResultSpecifiers:", a4));
        [v46 setObject:0 forKeyedSubscript:v11];
        [v46 setObject:0 forKeyedSubscript:v12];

        goto LABEL_34;
      }
      if (v16)
      {
        __int16 v22 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v38 = [(CAMStillImagePersistenceCoordinator *)self _loggingPrefix];
          v34 = CAMDebugStringForCaptureResultSpecifiers(a4);
          CAMDebugStringForCaptureResultSpecifiers(a3);
          v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
          int v29 = CAMDebugStringForCaptureResultSpecifiers(a4);
          int v30 = CAMDebugStringForCaptureResultSpecifiers(a3);
          *(_DWORD *)buf = 138544386;
          uint64_t v48 = v38;
          __int16 v49 = 2114;
          uint64_t v50 = v34;
          __int16 v51 = 2114;
          v52 = v41;
          __int16 v53 = 2114;
          uint64_t v54 = (uint64_t)v29;
          __int16 v55 = 2114;
          uint64_t v56 = (uint64_t)v30;
          _os_log_error_impl(&dword_2099F8000, v22, OS_LOG_TYPE_ERROR, "%{public}@ Missing %{public}@ image for %{public}@+%{public}@ pair. Submitting %{public}@ image as a standalone image", buf, 0x34u);

          v15 = v44;
        }

        v23 = self;
        unint64_t v24 = a3;
      }
      else
      {
        if (!v17)
        {
LABEL_34:

          goto LABEL_35;
        }
        v25 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v34 = [(CAMStillImagePersistenceCoordinator *)self _loggingPrefix];
          v42 = CAMDebugStringForCaptureResultSpecifiers(a3);
          CAMDebugStringForCaptureResultSpecifiers(a3);
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v31 = CAMDebugStringForCaptureResultSpecifiers(a4);
          CAMDebugStringForCaptureResultSpecifiers(a4);
          *(_DWORD *)buf = 138544386;
          uint64_t v48 = v34;
          __int16 v49 = 2114;
          uint64_t v50 = v42;
          __int16 v51 = 2114;
          v52 = v39;
          __int16 v53 = 2114;
          uint64_t v54 = v31;
          uint64_t v32 = (void *)v31;
          v56 = __int16 v55 = 2114;
          uint64_t v33 = (void *)v56;
          _os_log_error_impl(&dword_2099F8000, v25, OS_LOG_TYPE_ERROR, "%{public}@ Missing %{public}@ image for %{public}@+%{public}@ pair. Submitting %{public}@ image as a standalone image", buf, 0x34u);

          v15 = v44;
        }

        v23 = self;
        unint64_t v24 = a4;
      }
      -[CAMStillImagePersistenceCoordinator _dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:](v23, "_dispatchRemotePersistenceIfPossibleForResultSpecifiers:request:", v24, v15, v34);
      goto LABEL_34;
    }
  }
  else
  {
    v15 = v44;
    if (v13)
    {
      [(CAMStillImagePersistenceCoordinator *)self _dispatchRemotePersistenceIfPossibleForResultSpecifiers:a3 request:v44];
      [(CAMStillImagePersistenceCoordinator *)self _dispatchRemotePersistenceIfPossibleForResultSpecifiers:a4 request:v44];
    }
  }
LABEL_35:
}

- (void)updateForTimeoutTimerFiredForCoordinationInfo:(id)a3 request:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CAMStillImagePersistenceCoordinator *)self _receivedCoordinationInfos];
  id v9 = [(CAMStillImagePersistenceCoordinator *)self _pendingLocalPersistenceResults];
  uint64_t v10 = [v7 allExpectedResultSpecifiers];
  uint64_t v11 = [v7 resultSpecifiers];

  uint64_t v12 = [NSNumber numberWithUnsignedInteger:v11];
  uint64_t v13 = [v9 objectForKeyedSubscript:v12];

  if (v13)
  {
    uint64_t v14 = [(CAMStillImagePersistenceCoordinator *)self _debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:v10 receivedCoordinationInfos:v8];
    v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = [(CAMStillImagePersistenceCoordinator *)self _loggingPrefix];
      if ((v11 & 2) != 0)
      {
        uint64_t v16 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      }
      else
      {
        uint64_t v16 = &stru_26BD78BA0;
      }
      if (v11)
      {
        uint64_t v17 = [(__CFString *)v16 stringByAppendingString:@"HDR"];

        uint64_t v16 = (__CFString *)v17;
      }
      if (![(__CFString *)v16 length])
      {

        uint64_t v16 = @"None";
      }
      *(_DWORD *)buf = 138543874;
      objc_super v20 = v18;
      __int16 v21 = 2114;
      __int16 v22 = v14;
      __int16 v23 = 2114;
      unint64_t v24 = v16;
      _os_log_error_impl(&dword_2099F8000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Timed out while waiting for other capture results (%{public}@). Submitting %{public}@ image as a standalone image", buf, 0x20u);
    }
    [(CAMStillImagePersistenceCoordinator *)self _dispatchRemotePersistenceIfPossibleForResultSpecifiers:v11 request:v6];
  }
}

- (id)_debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:(id)a3 receivedCoordinationInfos:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__5;
  uint64_t v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __135__CAMStillImagePersistenceCoordinator__debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers_receivedCoordinationInfos___block_invoke;
  v10[3] = &unk_263FA28A8;
  id v7 = v6;
  id v11 = v7;
  uint64_t v12 = &v13;
  [v5 enumerateObjectsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __135__CAMStillImagePersistenceCoordinator__debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers_receivedCoordinationInfos___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  unsigned int v3 = [*(id *)(a1 + 32) objectForKey:v14];

  v4 = v14;
  if (v3) {
    goto LABEL_13;
  }
  char v5 = [v14 integerValue];
  char v6 = v5;
  if ((v5 & 2) == 0)
  {
    id v7 = &stru_26BD78BA0;
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v7 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
  if (v6)
  {
LABEL_6:
    uint64_t v8 = [(__CFString *)v7 stringByAppendingString:@"HDR"];

    id v7 = (__CFString *)v8;
  }
LABEL_7:
  if (![(__CFString *)v7 length])
  {

    id v7 = @"None";
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v9 + 40))
  {
    uint64_t v10 = [NSString stringWithFormat:@"%@, %@", *(void *)(v9 + 40), v7];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    uint64_t v13 = v7;
    uint64_t v12 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v13;
  }

  v4 = v14;
LABEL_13:
}

- (NSString)loggingIdentifier
{
  return self->_loggingIdentifier;
}

- (NSString)_loggingPrefix
{
  return self->__loggingPrefix;
}

- (void)updateForCoordinationInfo:(void *)a1 localPersistenceResult:(char)a2 request:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v5 = [a1 _loggingPrefix];
  if ((a2 & 2) != 0)
  {
    char v6 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
    if ((a2 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v6 = &stru_26BD78BA0;
  if (a2)
  {
LABEL_5:
    uint64_t v7 = [(__CFString *)v6 stringByAppendingString:@"HDR"];

    char v6 = (__CFString *)v7;
  }
LABEL_6:
  if (![(__CFString *)v6 length])
  {

    char v6 = @"None";
  }
  int v8 = 138543618;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v6;
  _os_log_error_impl(&dword_2099F8000, a3, OS_LOG_TYPE_ERROR, "%{public}@ Already received results for %{public}@! Updating anyway...", (uint8_t *)&v8, 0x16u);
}

@end