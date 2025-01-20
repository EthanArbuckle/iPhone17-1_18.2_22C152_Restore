@interface BKMatchPearlOperation
- (BKIdentity)preAugmentationCheckIdentity;
- (BOOL)enableAutoRetry:(BOOL)a3 error:(id *)a4;
- (BOOL)fullFaceOnly;
- (BOOL)longTimeout;
- (BOOL)pauseFaceDetectTimer:(BOOL)a3 error:(id *)a4;
- (BOOL)preAugmentationCheck;
- (BOOL)shouldAutoRetry;
- (BOOL)startNewMatchAttemptWithError:(id *)a3;
- (id)matchResultInfoWithServerIdentity:(id)a3 details:(id)a4;
- (id)optionsDictionaryWithError:(id *)a3;
- (unint64_t)trigger;
- (void)setFullFaceOnly:(BOOL)a3;
- (void)setLongTimeout:(BOOL)a3;
- (void)setPreAugmentationCheck:(BOOL)a3;
- (void)setPreAugmentationCheckIdentity:(id)a3;
- (void)setShouldAutoRetry:(BOOL)a3;
- (void)setTrigger:(unint64_t)a3;
- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4;
- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5;
@end

@implementation BKMatchPearlOperation

- (id)optionsDictionaryWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)BKMatchPearlOperation;
  v5 = -[BKMatchOperation optionsDictionaryWithError:](&v16, sel_optionsDictionaryWithError_);
  if (!v5)
  {
    if (__osLog) {
      v14 = __osLog;
    }
    else {
      v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "superOptions";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v25 = 1024;
      int v26 = 1046;
      _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v7 = 0;
    goto LABEL_31;
  }
  v6 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
  id v7 = v6;
  if (self->_longTimeout) {
    [v6 setObject:MEMORY[0x1E4F1CC38] forKey:@"BKOptionMatchLongTimeout"];
  }
  if (self->_shouldAutoRetry) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:@"BKOptionMatchAutoRetry"];
  }
  if (self->_preAugmentationCheck) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:@"BKOptionMatchPreAugmentationCheck"];
  }
  preAugmentationCheckIdentity = self->_preAugmentationCheckIdentity;
  if (!preAugmentationCheckIdentity) {
    goto LABEL_11;
  }
  uint64_t v9 = [(BKIdentity *)preAugmentationCheckIdentity serverIdentity];
  if (!v9)
  {
    if (__osLog) {
      v15 = __osLog;
    }
    else {
      v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "serverIdentity";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v25 = 1024;
      int v26 = 1067;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    setError((id)1, a3);
LABEL_31:
    v12 = 0;
    goto LABEL_16;
  }
  v10 = (void *)v9;
  [v7 setObject:v9 forKey:@"BKOptionMatchPreAugmentationCheckIdentity"];

LABEL_11:
  if (self->_fullFaceOnly) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:@"BKOptionMatchFullFaceOnly"];
  }
  if (self->_trigger - 1 <= 5)
  {
    v11 = [NSNumber numberWithUnsignedInt:LODWORD(self->_trigger)];
    [v7 setObject:v11 forKey:@"BKOptionMatchOperationTrigger"];
  }
  id v7 = v7;
  v12 = v7;
LABEL_16:

  return v12;
}

- (BOOL)startNewMatchAttemptWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v6 = __osLogTrace;
  }
  else {
    v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super.super._xpcClient;
    v8 = v6;
    int v18 = 134217984;
    *(void *)__int16 v19 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::startNewMatchAttemptWithError (_cid %lu)\n", (uint8_t *)&v18, 0xCu);
  }
  uint64_t v9 = self;
  objc_sync_enter(v9);
  if ([(BKOperation *)v9 state] == 5)
  {
    v10 = (void *)[(BiometricKitXPCClient *)v9->super.super._xpcClient startNewMatchAttempt];
    if (!v10)
    {
      BKLogEvent(0x40001u);
      objc_sync_exit(v9);

      if (__osLogTrace) {
        v11 = __osLogTrace;
      }
      else {
        v11 = v5;
      }
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      if (a3) {
        id v12 = *a3;
      }
      else {
        id v12 = 0;
      }
      int v18 = 67109634;
      BOOL v13 = 1;
      *(_DWORD *)__int16 v19 = 1;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = 0;
      *(_WORD *)uint64_t v20 = 2112;
      *(void *)&v20[2] = v12;
      _os_log_impl(&dword_1B3AF1000, v11, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::startNewMatchAttemptWithError -> %d(%{errno}d) %@\n", (uint8_t *)&v18, 0x18u);
      return v13;
    }
    if (__osLog) {
      v15 = __osLog;
    }
    else {
      v15 = v5;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136316162;
      *(void *)__int16 v19 = "err == 0 ";
      *(_WORD *)&v19[8] = 2048;
      *(void *)uint64_t v20 = (int)v10;
      *(_WORD *)&v20[8] = 2080;
      __int16 v21 = &unk_1B3B370EE;
      __int16 v22 = 2080;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v24 = 1024;
      int v25 = 1118;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v18, 0x30u);
    }
    setErrorWithOSStatus(v10, a3);
  }
  else
  {
    setError((id)1, a3);
    LODWORD(v10) = 0;
  }
  objc_sync_exit(v9);

  if (__osLogTrace) {
    objc_super v16 = __osLogTrace;
  }
  else {
    objc_super v16 = v5;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      id v17 = *a3;
    }
    else {
      id v17 = 0;
    }
    int v18 = 67109634;
    *(_DWORD *)__int16 v19 = 0;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v10;
    *(_WORD *)uint64_t v20 = 2112;
    *(void *)&v20[2] = v17;
    _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "BKMatchPearlOperation::startNewMatchAttemptWithError -> %d(%{errno}d) %@\n", (uint8_t *)&v18, 0x18u);
  }
  return 0;
}

- (BOOL)enableAutoRetry:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v8 = __osLogTrace;
  }
  else {
    v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super.super._xpcClient;
    v10 = v8;
    int v20 = 67109376;
    *(_DWORD *)__int16 v21 = v5;
    *(_WORD *)&v21[4] = 2048;
    *(void *)&v21[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::enableAutoRetry: %u (_cid %lu)\n", (uint8_t *)&v20, 0x12u);
  }
  v11 = (void *)[(BiometricKitXPCClient *)self->super.super._xpcClient enableMatchAutoRetry:v5];
  if (v11)
  {
    if (__osLog) {
      id v17 = __osLog;
    }
    else {
      id v17 = v7;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136316162;
      *(void *)__int16 v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(void *)&v21[10] = (int)v11;
      *(_WORD *)&v21[18] = 2080;
      __int16 v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v25 = 1024;
      int v26 = 1143;
      _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
    setErrorWithOSStatus(v11, a4);
    if (__osLogTrace) {
      int v18 = __osLogTrace;
    }
    else {
      int v18 = v7;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v19 = *a4;
      }
      else {
        id v19 = 0;
      }
      int v20 = 67109634;
      *(_DWORD *)__int16 v21 = 0;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = v11;
      *(_WORD *)&v21[10] = 2112;
      *(void *)&v21[12] = v19;
      v14 = v18;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace) {
      id v12 = __osLogTrace;
    }
    else {
      id v12 = v7;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        id v13 = *a4;
      }
      else {
        id v13 = 0;
      }
      int v20 = 67109634;
      *(_DWORD *)__int16 v21 = 1;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = 0;
      *(_WORD *)&v21[10] = 2112;
      *(void *)&v21[12] = v13;
      v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1B3AF1000, v14, v15, "BKMatchPearlOperation::enableAutoRetry -> %d(%{errno}d) %@\n", (uint8_t *)&v20, 0x18u);
    }
  }
  return v11 == 0;
}

- (BOOL)pauseFaceDetectTimer:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v8 = __osLogTrace;
  }
  else {
    v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super.super._xpcClient;
    v10 = v8;
    int v20 = 67109376;
    *(_DWORD *)__int16 v21 = v5;
    *(_WORD *)&v21[4] = 2048;
    *(void *)&v21[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::pauseFaceDetectTimer: %u (_cid %lu)\n", (uint8_t *)&v20, 0x12u);
  }
  v11 = (void *)[(BiometricKitXPCClient *)self->super.super._xpcClient pauseFaceDetectTimer:v5];
  if (v11)
  {
    if (__osLog) {
      id v17 = __osLog;
    }
    else {
      id v17 = v7;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136316162;
      *(void *)__int16 v21 = "err == 0 ";
      *(_WORD *)&v21[8] = 2048;
      *(void *)&v21[10] = (int)v11;
      *(_WORD *)&v21[18] = 2080;
      __int16 v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v25 = 1024;
      int v26 = 1166;
      _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v20, 0x30u);
    }
    setErrorWithOSStatus(v11, a4);
    if (__osLogTrace) {
      int v18 = __osLogTrace;
    }
    else {
      int v18 = v7;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      if (a4) {
        id v19 = *a4;
      }
      else {
        id v19 = 0;
      }
      int v20 = 67109634;
      *(_DWORD *)__int16 v21 = 0;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = v11;
      *(_WORD *)&v21[10] = 2112;
      *(void *)&v21[12] = v19;
      v14 = v18;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace) {
      id v12 = __osLogTrace;
    }
    else {
      id v12 = v7;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        id v13 = *a4;
      }
      else {
        id v13 = 0;
      }
      int v20 = 67109634;
      *(_DWORD *)__int16 v21 = 1;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = 0;
      *(_WORD *)&v21[10] = 2112;
      *(void *)&v21[12] = v13;
      v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1B3AF1000, v14, v15, "BKMatchPearlOperation::pauseFaceDetectTimer -> %d(%{errno}d) %@\n", (uint8_t *)&v20, 0x18u);
    }
  }
  return v11 == 0;
}

- (id)matchResultInfoWithServerIdentity:(id)a3 details:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [BKMatchPearlResultInfo alloc];
  uint64_t v9 = [(BKOperation *)self device];
  v10 = [(BKMatchPearlResultInfo *)v8 initWithServerIdentity:v7 details:v6 device:v9];

  return v10;
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
}

- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  kdebug_trace();
  uint64_t v9 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v10 = __osLogTrace;
  }
  else {
    v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v83 = v6;
    *(_WORD *)&v83[4] = 2112;
    *(void *)&v83[6] = v8;
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: %u, details = %@\n", buf, 0x12u);
  }
  BKLogCode(1, v6);
  switch((int)v6)
  {
    case 1067:
      v11 = [(BKOperation *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        if (v8)
        {
          id v13 = [v8 objectForKeyedSubscript:@"BKStatusDetailFaceDetectFeedback"];
          v14 = v13;
          if (v13) {
            uint64_t v15 = __faceDetectFeedback([v13 integerValue]);
          }
          else {
            uint64_t v15 = 1;
          }
        }
        else
        {
          uint64_t v15 = 1;
        }
        if (__osLog) {
          v58 = __osLog;
        }
        else {
          v58 = v9;
        }
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          v59 = v58;
          v60 = [(BKOperation *)self delegate];
          v61 = [(BKOperation *)self delegate];
          *(_DWORD *)buf = 134218498;
          *(void *)v83 = v60;
          *(_WORD *)&v83[8] = 2112;
          *(void *)&v83[10] = v61;
          __int16 v84 = 2048;
          uint64_t v85 = v15;
          _os_log_impl(&dword_1B3AF1000, v59, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: %p(%@) providedFeedback: %ld\n", buf, 0x20u);
        }
        v62 = [(BKOperation *)self dispatchQueue];
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke;
        v81[3] = &unk_1E6067BF8;
        v81[4] = self;
        v81[5] = v15;
        dispatch_async(v62, v81);
      }
      goto LABEL_85;
    case 1068:
    case 1069:
    case 1070:
    case 1073:
    case 1074:
      goto LABEL_14;
    case 1071:
      __int16 v25 = [(BKOperation *)self delegate];
      char v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) == 0) {
        goto LABEL_85;
      }
      uint64_t v27 = [[BKFaceOcclusionInfo alloc] initWithDictionary:v8];
      if (__osLog) {
        v28 = __osLog;
      }
      else {
        v28 = v9;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        v30 = [(BKOperation *)self delegate];
        v31 = [(BKOperation *)self delegate];
        BOOL v32 = [(BKFaceOcclusionInfo *)v27 hasFaceOcclusion];
        *(_DWORD *)buf = 134218498;
        *(void *)v83 = v30;
        *(_WORD *)&v83[8] = 2112;
        *(void *)&v83[10] = v31;
        __int16 v84 = 1024;
        LODWORD(v85) = v32;
        _os_log_impl(&dword_1B3AF1000, v29, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: %p(%@) providedFaceOcclusionInfo: hasFaceOcclusion=%d\n", buf, 0x1Cu);
      }
      v33 = [(BKOperation *)self dispatchQueue];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_452;
      v79[3] = &unk_1E6068040;
      v79[4] = self;
      v80 = v27;
      v34 = v27;
      dispatch_async(v33, v79);

      v35 = v80;
      goto LABEL_36;
    case 1072:
      v36 = [(BKOperation *)self delegate];
      char v37 = objc_opt_respondsToSelector();

      if ((v37 & 1) == 0) {
        goto LABEL_85;
      }
      v38 = [[BKFaceWUPoseEligibilityInfo alloc] initWithDictionary:v8];
      if (__osLog) {
        v39 = __osLog;
      }
      else {
        v39 = v9;
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = v39;
        v41 = [(BKOperation *)self delegate];
        v42 = [(BKOperation *)self delegate];
        BOOL v43 = [(BKFaceWUPoseEligibilityInfo *)v38 isEligible];
        *(_DWORD *)buf = 134218498;
        *(void *)v83 = v41;
        *(_WORD *)&v83[8] = 2112;
        *(void *)&v83[10] = v42;
        __int16 v84 = 1024;
        LODWORD(v85) = v43;
        _os_log_impl(&dword_1B3AF1000, v40, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: %p(%@) providedFaceWUPoseEligibilityInfo: isEligible=%d\n", buf, 0x1Cu);
      }
      v44 = [(BKOperation *)self dispatchQueue];
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_456;
      v77[3] = &unk_1E6068040;
      v77[4] = self;
      v78 = v38;
      v34 = v38;
      dispatch_async(v44, v77);

      v35 = v78;
LABEL_36:

      goto LABEL_85;
    case 1075:
      v45 = [(BKOperation *)self delegate];
      char v46 = objc_opt_respondsToSelector();

      if (v46)
      {
        if (v8)
        {
          v47 = [v8 objectForKeyedSubscript:@"BKStatusDetailPSRequestReason"];
          uint64_t v48 = [v47 integerValue];
          if ((unint64_t)(v48 - 1) >= 5) {
            uint64_t v49 = 0;
          }
          else {
            uint64_t v49 = v48;
          }
        }
        else
        {
          uint64_t v49 = 0;
        }
        if (__osLog) {
          v53 = __osLog;
        }
        else {
          v53 = v9;
        }
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v54 = v53;
          v55 = [(BKOperation *)self delegate];
          v56 = [(BKOperation *)self delegate];
          *(_DWORD *)buf = 134218498;
          *(void *)v83 = v55;
          *(_WORD *)&v83[8] = 2112;
          *(void *)&v83[10] = v56;
          __int16 v84 = 2048;
          uint64_t v85 = v49;
          _os_log_impl(&dword_1B3AF1000, v54, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: %p(%@) requestedPasscodeShortcutWithReason: reason=%ld\n", buf, 0x20u);
        }
        v57 = [(BKOperation *)self dispatchQueue];
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_462;
        v76[3] = &unk_1E6067BF8;
        v76[4] = self;
        v76[5] = v49;
        dispatch_async(v57, v76);
      }
      goto LABEL_85;
    default:
      if (v6 == 1053)
      {
        objc_super v16 = self;
        uint64_t v17 = 2;
        goto LABEL_44;
      }
      if (v6 == 1052)
      {
        objc_super v16 = self;
        uint64_t v17 = 5;
LABEL_44:
        [(BKOperation *)v16 changeState:v17];
        goto LABEL_85;
      }
LABEL_14:
      if ((v6 - 63) > 1)
      {
        if ((v6 - 1059) <= 0x17 && ((1 << (v6 - 35)) & 0xA80453) != 0)
        {
          v50 = [(BKOperation *)self delegate];
          char v51 = objc_opt_respondsToSelector();

          if (v51)
          {
            uint64_t v52 = 1;
            if ((int)v6 > 1077)
            {
              switch(v6)
              {
                case 0x436:
                  uint64_t v52 = 9;
                  break;
                case 0x438:
                  uint64_t v52 = 10;
                  break;
                case 0x43A:
                  uint64_t v52 = 11;
                  break;
              }
            }
            else
            {
              switch((int)v6)
              {
                case 1059:
                  uint64_t v52 = 3;
                  break;
                case 1060:
                  uint64_t v52 = 4;
                  break;
                case 1063:
                  uint64_t v52 = 5;
                  break;
                case 1065:
                  uint64_t v52 = 6;
                  break;
                case 1069:
                  uint64_t v52 = 7;
                  break;
                default:
                  break;
              }
            }
            if (__osLog) {
              v63 = __osLog;
            }
            else {
              v63 = v9;
            }
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              loga = v63;
              [(BKOperation *)self delegate];
              v65 = uint64_t v64 = v52;
              v66 = [(BKOperation *)self delegate];
              *(_DWORD *)buf = 134218498;
              *(void *)v83 = v65;
              *(_WORD *)&v83[8] = 2112;
              *(void *)&v83[10] = v66;
              __int16 v84 = 2048;
              uint64_t v85 = v64;
              _os_log_impl(&dword_1B3AF1000, loga, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: %p(%@) failedWithReason: %ld\n", buf, 0x20u);

              uint64_t v52 = v64;
            }
            v67 = [(BKOperation *)self dispatchQueue];
            v72[0] = MEMORY[0x1E4F143A8];
            v72[1] = 3221225472;
            v72[2] = __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_466;
            v72[3] = &unk_1E6067BF8;
            v72[4] = self;
            v72[5] = v52;
            dispatch_async(v67, v72);
          }
          [(BKOperation *)self operationEndsWithReason:3];
        }
      }
      else
      {
        int v18 = [(BKOperation *)self delegate];
        char v19 = objc_opt_respondsToSelector();

        if (v19)
        {
          if (__osLog) {
            int v20 = __osLog;
          }
          else {
            int v20 = v9;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(log) = v6 == 63;
            __int16 v21 = v20;
            __int16 v22 = [(BKOperation *)self delegate];
            __int16 v23 = [(BKOperation *)self delegate];
            *(_DWORD *)buf = 134218498;
            *(void *)v83 = v22;
            *(_WORD *)&v83[8] = 2112;
            *(void *)&v83[10] = v23;
            __int16 v84 = 1024;
            LODWORD(v85) = log;
            _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: %p(%@) faceDetectStateChanged: %d\n", buf, 0x1Cu);
          }
          __int16 v24 = [(BKOperation *)self dispatchQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_463;
          block[3] = &unk_1E6068220;
          block[4] = self;
          int v75 = v6;
          id v74 = v8;
          dispatch_async(v24, block);
        }
      }
      v71.receiver = self;
      v71.super_class = (Class)BKMatchPearlOperation;
      [(BKMatchOperation *)&v71 statusMessage:v6 client:a5];
LABEL_85:
      if (__osLogTrace) {
        v68 = __osLogTrace;
      }
      else {
        v68 = v9;
      }
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3AF1000, v68, OS_LOG_TYPE_DEFAULT, "BKMatchPearlOperation::statusMessage: -> void\n", buf, 2u);
      }
      kdebug_trace();

      return;
  }
}

void __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 matchOperation:*(void *)(a1 + 32) providedFeedback:*(void *)(a1 + 40)];
}

void __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_452(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 matchOperation:*(void *)(a1 + 32) providedFaceOcclusionInfo:*(void *)(a1 + 40)];
}

void __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_456(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 matchOperation:*(void *)(a1 + 32) providedFaceWUPoseEligibilityInfo:*(void *)(a1 + 40)];
}

void __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_462(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 matchOperation:*(void *)(a1 + 32) requestedPasscodeShortcutWithReason:*(void *)(a1 + 40)];
}

void __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_463(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [[BKFaceDetectStateInfo alloc] initWithPresenceState:*(_DWORD *)(a1 + 48) == 63 details:*(void *)(a1 + 40)];
  [v4 operation:v2 faceDetectStateChanged:v3];
}

void __54__BKMatchPearlOperation_statusMessage_details_client___block_invoke_466(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 matchOperation:*(void *)(a1 + 32) failedWithReason:*(void *)(a1 + 40)];
}

- (BOOL)longTimeout
{
  return self->_longTimeout;
}

- (void)setLongTimeout:(BOOL)a3
{
  self->_longTimeout = a3;
}

- (BOOL)shouldAutoRetry
{
  return self->_shouldAutoRetry;
}

- (void)setShouldAutoRetry:(BOOL)a3
{
  self->_shouldAutoRetry = a3;
}

- (BOOL)preAugmentationCheck
{
  return self->_preAugmentationCheck;
}

- (void)setPreAugmentationCheck:(BOOL)a3
{
  self->_preAugmentationCheck = a3;
}

- (BKIdentity)preAugmentationCheckIdentity
{
  return self->_preAugmentationCheckIdentity;
}

- (void)setPreAugmentationCheckIdentity:(id)a3
{
}

- (BOOL)fullFaceOnly
{
  return self->_fullFaceOnly;
}

- (void)setFullFaceOnly:(BOOL)a3
{
  self->_fullFaceOnly = a3;
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(unint64_t)a3
{
  self->_trigger = a3;
}

- (void).cxx_destruct
{
}

@end