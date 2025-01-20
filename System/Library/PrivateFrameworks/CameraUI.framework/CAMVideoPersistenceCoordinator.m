@interface CAMVideoPersistenceCoordinator
- (BOOL)hasReceivedAllExpectedResponses;
- (CAMVideoPersistenceCoordinationDelegate)delegate;
- (CAMVideoPersistenceCoordinator)initWithDelegate:(id)a3 loggingIdentifier:(id)a4;
- (NSMutableDictionary)_pendingLocalPersistenceResults;
- (NSMutableDictionary)_receivedCoordinationInfos;
- (NSString)_loggingPrefix;
- (NSString)loggingIdentifier;
- (id)_debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:(id)a3 receivedCoordinationInfos:(id)a4;
- (unsigned)_powerAssertionReasonForResultSpecifiers:(unint64_t)a3;
- (void)_dispatchRemotePersistenceIfPossibleForResultSpecifiers:(unint64_t)a3 request:(id)a4;
- (void)updateForCoordinationInfo:(id)a3 localPersistenceResult:(id)a4 request:(id)a5;
- (void)updateForTimeoutTimerFiredForCoordinationInfo:(id)a3 request:(id)a4;
@end

@implementation CAMVideoPersistenceCoordinator

- (CAMVideoPersistenceCoordinator)initWithDelegate:(id)a3 loggingIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CAMVideoPersistenceCoordinator;
  v8 = [(CAMVideoPersistenceCoordinator *)&v20 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v10 = [v7 copy];
    loggingIdentifier = v9->_loggingIdentifier;
    v9->_loggingIdentifier = (NSString *)v10;

    uint64_t v12 = [NSString stringWithFormat:@"%@ VideoPersistenceCoordinator:", v7];
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

- (void)updateForCoordinationInfo:(id)a3 localPersistenceResult:(id)a4 request:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v45 = a5;
  uint64_t v10 = [(CAMVideoPersistenceCoordinator *)self delegate];
  v11 = [(CAMVideoPersistenceCoordinator *)self _receivedCoordinationInfos];
  uint64_t v12 = [(CAMVideoPersistenceCoordinator *)self _pendingLocalPersistenceResults];
  uint64_t v13 = [v8 resultSpecifiers];
  v43 = [v8 allExpectedResultSpecifiers];
  unint64_t v14 = 0x263F08000uLL;
  v15 = [NSNumber numberWithUnsignedInteger:v13];
  v44 = v11;
  uint64_t v16 = [v11 objectForKeyedSubscript:v15];

  if (v16)
  {
    v17 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CAMStillImagePersistenceCoordinator updateForCoordinationInfo:localPersistenceResult:request:](self, v13, v17);
    }
  }
  if (!v9 || ([v9 error], v18 = objc_claimAutoreleasedReturnValue(), v18, v18))
  {
    v19 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    v38 = [(CAMVideoPersistenceCoordinator *)self _loggingPrefix];
    if ((v13 & 2) != 0)
    {
      objc_super v20 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      if ((v13 & 1) == 0)
      {
LABEL_17:
        if (![(__CFString *)v20 length])
        {

          objc_super v20 = @"None";
        }
        *(_DWORD *)buf = 138543618;
        v47 = v38;
        __int16 v48 = 2114;
        v49 = v20;
        _os_log_impl(&dword_2099F8000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating persistence coordination with %{public}@ video (unusable result)", buf, 0x16u);

        unint64_t v14 = 0x263F08000;
        goto LABEL_25;
      }
    }
    else
    {
      objc_super v20 = &stru_26BD78BA0;
      if ((v13 & 1) == 0) {
        goto LABEL_17;
      }
    }
    [(__CFString *)v20 stringByAppendingString:@"HDR"];
    uint64_t v23 = v22 = v10;

    objc_super v20 = (__CFString *)v23;
    uint64_t v10 = v22;
    goto LABEL_17;
  }
  v19 = os_log_create("com.apple.camera", "Camera");
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_25;
  }
  v39 = [(CAMVideoPersistenceCoordinator *)self _loggingPrefix];
  if ((v13 & 2) == 0)
  {
    v21 = &stru_26BD78BA0;
    if ((v13 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  v21 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
  if (v13)
  {
LABEL_21:
    [(__CFString *)v21 stringByAppendingString:@"HDR"];
    v41 = v16;
    v24 = v12;
    uint64_t v26 = v25 = v10;

    v21 = (__CFString *)v26;
    uint64_t v10 = v25;
    uint64_t v12 = v24;
    uint64_t v16 = v41;
  }
LABEL_22:
  if (![(__CFString *)v21 length])
  {

    v21 = @"None";
  }
  *(_DWORD *)buf = 138543618;
  v47 = v39;
  __int16 v48 = 2114;
  v49 = v21;
  _os_log_impl(&dword_2099F8000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating persistence coordination with %{public}@ video", buf, 0x16u);

  unint64_t v14 = 0x263F08000uLL;
LABEL_25:

  v27 = [*(id *)(v14 + 2584) numberWithUnsignedInteger:v13];
  [v44 setObject:v8 forKeyedSubscript:v27];

  if (v9)
  {
    v28 = [v9 error];

    if (!v28)
    {
      v29 = [*(id *)(v14 + 2584) numberWithUnsignedInteger:v13];
      [v12 setObject:v9 forKeyedSubscript:v29];
    }
  }
  [(CAMVideoPersistenceCoordinator *)self _dispatchRemotePersistenceIfPossibleForResultSpecifiers:v13 request:v45];
  v30 = [*(id *)(v14 + 2584) numberWithUnsignedInteger:v13];
  v31 = [v12 objectForKeyedSubscript:v30];

  if (v31)
  {
    v42 = v16;
    v32 = v12;
    v33 = [(CAMVideoPersistenceCoordinator *)self _debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:v43 receivedCoordinationInfos:v44];
    os_log_t v34 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
LABEL_38:

      [v10 videoPersistenceCoordinator:self requestsTimeoutScheduledForDeferredRemotePersistenceForCoordinationInfo:v8 request:v45];
      uint64_t v12 = v32;
      uint64_t v16 = v42;
      goto LABEL_39;
    }
    v40 = v10;
    v35 = [(CAMVideoPersistenceCoordinator *)self _loggingPrefix];
    if ((v13 & 2) != 0)
    {
      v36 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      if ((v13 & 1) == 0)
      {
LABEL_35:
        if (![(__CFString *)v36 length])
        {

          v36 = @"None";
        }
        *(_DWORD *)buf = 138543874;
        v47 = v35;
        __int16 v48 = 2114;
        v49 = v36;
        __int16 v50 = 2114;
        v51 = v33;
        _os_log_impl(&dword_2099F8000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Deferring persistence of %{public}@ video while waiting on %{public}@", buf, 0x20u);

        uint64_t v10 = v40;
        goto LABEL_38;
      }
    }
    else
    {
      v36 = &stru_26BD78BA0;
      if ((v13 & 1) == 0) {
        goto LABEL_35;
      }
    }
    uint64_t v37 = [(__CFString *)v36 stringByAppendingString:@"HDR"];

    v36 = (__CFString *)v37;
    goto LABEL_35;
  }
LABEL_39:
}

- (void)_dispatchRemotePersistenceIfPossibleForResultSpecifiers:(unint64_t)a3 request:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(CAMVideoPersistenceCoordinator *)self delegate];
  id v8 = [(CAMVideoPersistenceCoordinator *)self _pendingLocalPersistenceResults];
  id v9 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    v11 = [v10 localPersistenceUUID];
    os_log_t v12 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      objc_msgSend(v7, "videoPersistenceCoordinator:requestsRemotePersistenceForLocalPersistenceResult:captureRequest:powerAssertionReason:", self, v10, v6, -[CAMVideoPersistenceCoordinator _powerAssertionReasonForResultSpecifiers:](self, "_powerAssertionReasonForResultSpecifiers:", a3));
      v15 = [NSNumber numberWithUnsignedInteger:a3];
      [v8 setObject:0 forKeyedSubscript:v15];

      goto LABEL_12;
    }
    v17 = [(CAMVideoPersistenceCoordinator *)self _loggingPrefix];
    if ((a3 & 2) != 0)
    {
      uint64_t v13 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      if ((a3 & 1) == 0)
      {
LABEL_8:
        if (![(__CFString *)v13 length])
        {

          uint64_t v13 = @"None";
        }
        *(_DWORD *)buf = 138543874;
        v19 = v17;
        __int16 v20 = 2114;
        v21 = v13;
        __int16 v22 = 2114;
        uint64_t v23 = v11;
        _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Dispatching remote persistence for %{public}@ as %{public}@", buf, 0x20u);

        id v6 = v16;
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v13 = &stru_26BD78BA0;
      if ((a3 & 1) == 0) {
        goto LABEL_8;
      }
    }
    uint64_t v14 = [(__CFString *)v13 stringByAppendingString:@"HDR"];

    uint64_t v13 = (__CFString *)v14;
    goto LABEL_8;
  }
LABEL_12:
}

- (void)updateForTimeoutTimerFiredForCoordinationInfo:(id)a3 request:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CAMVideoPersistenceCoordinator *)self _receivedCoordinationInfos];
  id v9 = [(CAMVideoPersistenceCoordinator *)self _pendingLocalPersistenceResults];
  uint64_t v10 = [v7 allExpectedResultSpecifiers];
  uint64_t v11 = [v7 resultSpecifiers];

  os_log_t v12 = [NSNumber numberWithUnsignedInteger:v11];
  uint64_t v13 = [v9 objectForKeyedSubscript:v12];

  if (v13)
  {
    uint64_t v14 = [(CAMVideoPersistenceCoordinator *)self _debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:v10 receivedCoordinationInfos:v8];
    v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = [(CAMVideoPersistenceCoordinator *)self _loggingPrefix];
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
      __int16 v20 = v18;
      __int16 v21 = 2114;
      __int16 v22 = v14;
      __int16 v23 = 2114;
      uint64_t v24 = v16;
      _os_log_error_impl(&dword_2099F8000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Timed out while waiting for other capture results (%{public}@). Submitting %{public}@ video as a standalone video", buf, 0x20u);
    }
    [(CAMVideoPersistenceCoordinator *)self _dispatchRemotePersistenceIfPossibleForResultSpecifiers:v11 request:v6];
  }
}

- (BOOL)hasReceivedAllExpectedResponses
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(CAMVideoPersistenceCoordinator *)self _receivedCoordinationInfos];
  if ([v2 count])
  {
    v3 = [v2 allValues];
    v4 = [v3 firstObject];
    [v4 allExpectedResultSpecifiers];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(v2, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);

          if (!v10)
          {
            BOOL v11 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 1;
LABEL_12:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unsigned)_powerAssertionReasonForResultSpecifiers:(unint64_t)a3
{
  if (a3) {
    return 0x40000;
  }
  else {
    return 0x20000;
  }
}

- (id)_debugStringForUnreceivedResultSpecifiersFromExpectedResultSpecifiers:(id)a3 receivedCoordinationInfos:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7)
  {
    id v9 = 0;
    goto LABEL_21;
  }
  uint64_t v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v5);
      }
      os_log_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      long long v13 = [v6 objectForKeyedSubscript:v12];

      if (!v13)
      {
        char v14 = [v12 integerValue];
        long long v15 = &stru_26BD78BA0;
        if ((v14 & 2) != 0)
        {
          long long v15 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
        }
        if (v14)
        {
          uint64_t v16 = [(__CFString *)v15 stringByAppendingString:@"HDR"];

          long long v15 = (__CFString *)v16;
        }
        if ([(__CFString *)v15 length])
        {
          if (v9) {
            goto LABEL_13;
          }
LABEL_15:
          id v9 = v15;
        }
        else
        {

          long long v15 = @"None";
          if (!v9) {
            goto LABEL_15;
          }
LABEL_13:
          uint64_t v17 = [NSString stringWithFormat:@"%@, %@", v9, v15];

          id v9 = (__CFString *)v17;
        }

        continue;
      }
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v8);
LABEL_21:

  return v9;
}

- (CAMVideoPersistenceCoordinationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMVideoPersistenceCoordinationDelegate *)WeakRetained;
}

- (NSString)loggingIdentifier
{
  return self->_loggingIdentifier;
}

- (NSMutableDictionary)_receivedCoordinationInfos
{
  return self->__receivedCoordinationInfos;
}

- (NSMutableDictionary)_pendingLocalPersistenceResults
{
  return self->__pendingLocalPersistenceResults;
}

- (NSString)_loggingPrefix
{
  return self->__loggingPrefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__loggingPrefix, 0);
  objc_storeStrong((id *)&self->__pendingLocalPersistenceResults, 0);
  objc_storeStrong((id *)&self->__receivedCoordinationInfos, 0);
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end