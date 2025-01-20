@interface BKUIMatchVerifyPearlOperation
- (BKDevicePearl)device;
- (BKIdentity)identity;
- (BKIdentity)matchedIdentity;
- (BKMatchPearlOperation)matchOperation;
- (BKUIFaceIDEnrollOperationsHandler)weakHandler;
- (BKUIMatchVerifyPearlOperation)init;
- (BKUIPearlEnrollOperationsDelegate)operationsDelegate;
- (BOOL)delegateUIAtNeedsPosition;
- (BOOL)faceDetected;
- (BOOL)matchFailed;
- (NSData)credentialSet;
- (id)matchOperationDidMatch;
- (int)currentUIDelegateDisplaySubState;
- (int)lastErrorousSubState;
- (int)substate;
- (int)substateForFaceDetectionFeedBack:(int64_t)a3;
- (int64_t)failReason;
- (unint64_t)enrollmentConfiguration;
- (void)cancelMatchOperation;
- (void)matchOperation:(id)a3 failedWithReason:(int64_t)a4;
- (void)matchOperation:(id)a3 matchedWithResult:(id)a4;
- (void)matchOperation:(id)a3 presenceDetectedInLockout:(int64_t)a4;
- (void)matchOperation:(id)a3 providedFeedback:(int64_t)a4;
- (void)moveEnrollStateToNeedsPositioning:(int)a3;
- (void)operation:(id)a3 faceDetectStateChanged:(id)a4;
- (void)operation:(id)a3 stateChanged:(int64_t)a4;
- (void)retryMatchOperation;
- (void)setCredentialSet:(id)a3;
- (void)setCurrentUIDelegateDisplaySubState:(int)a3;
- (void)setDelegateUIAtNeedsPosition:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setEnrollmentConfiguration:(unint64_t)a3;
- (void)setFaceDetected:(BOOL)a3;
- (void)setFailReason:(int64_t)a3;
- (void)setIdentity:(id)a3;
- (void)setLastErrorousSubState:(int)a3;
- (void)setMatchFailed:(BOOL)a3;
- (void)setMatchOperation:(id)a3;
- (void)setMatchOperationDidMatch:(id)a3;
- (void)setMatchedIdentity:(id)a3;
- (void)setOperationsDelegate:(id)a3;
- (void)setSubstate:(int)a3;
- (void)setWeakHandler:(id)a3;
- (void)startMatchOperationWithDevice:(id)a3 identity:(id)a4 credential:(id)a5 withConfiguration:(unint64_t)a6 matchOperationActionBlock:(id)a7;
@end

@implementation BKUIMatchVerifyPearlOperation

- (BKUIMatchVerifyPearlOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKUIMatchVerifyPearlOperation;
  result = [(BKUIMatchVerifyPearlOperation *)&v3 init];
  if (result)
  {
    result->_failReason = -314159;
    *(void *)&result->_substate = 0;
    result->_lastErrorousSubState = 0;
  }
  return result;
}

- (void)retryMatchOperation
{
  objc_super v3 = _BKUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "_matchOperation retrying match operation", v13, 2u);
  }

  v4 = [(BKUIMatchVerifyPearlOperation *)self matchOperation];
  uint64_t v5 = [v4 state];

  if (v5 != 4)
  {
    v6 = [(BKUIMatchVerifyPearlOperation *)self matchOperation];
    [v6 cancel];
  }
  self->_failReason = -314159;
  self->_lastErrorousSubState = 0;
  self->_substate = 0;
  matchedIdentity = self->_matchedIdentity;
  self->_matchedIdentity = 0;

  v8 = [(BKUIMatchVerifyPearlOperation *)self device];
  v9 = [(BKUIMatchVerifyPearlOperation *)self identity];
  v10 = [(BKUIMatchVerifyPearlOperation *)self credentialSet];
  unint64_t v11 = [(BKUIMatchVerifyPearlOperation *)self enrollmentConfiguration];
  v12 = [(BKUIMatchVerifyPearlOperation *)self matchOperationDidMatch];
  [(BKUIMatchVerifyPearlOperation *)self startMatchOperationWithDevice:v8 identity:v9 credential:v10 withConfiguration:v11 matchOperationActionBlock:v12];
}

- (void)startMatchOperationWithDevice:(id)a3 identity:(id)a4 credential:(id)a5 withConfiguration:(unint64_t)a6 matchOperationActionBlock:(id)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = _Block_copy(a7);
  id matchOperationDidMatch = self->_matchOperationDidMatch;
  self->_id matchOperationDidMatch = v16;

  objc_storeStrong((id *)&self->_device, a3);
  objc_storeStrong((id *)&self->_credentialSet, a5);
  p_identity = &self->_identity;
  objc_storeStrong((id *)&self->_identity, a4);
  self->_enrollmentConfiguration = a6;
  v18 = _BKUILoggingFacility();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v54 = v13;
    __int16 v55 = 2112;
    id v56 = v14;
    __int16 v57 = 2112;
    id v58 = v15;
    __int16 v59 = 2048;
    unint64_t v60 = a6;
    _os_log_impl(&dword_1E4B6C000, v18, OS_LOG_TYPE_DEFAULT, "startMatchOperationWithDevice: device:%@ identity:%@ credentails::%@ config:%lu", buf, 0x2Au);
  }
  id v44 = v15;
  id v19 = v14;

  id v51 = 0;
  id v20 = v13;
  v21 = [v13 identitiesWithError:&v51];
  id v22 = v51;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v23 = v21;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = 0;
    uint64_t v27 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v48 != v27) {
          objc_enumerationMutation(v23);
        }
        v26 += objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * i), "hasPeriocularEnrollment", p_identity);
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v25);
  }
  else
  {
    uint64_t v26 = 0;
  }

  if (v22)
  {
    v29 = _BKUILoggingFacility();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[BKUIMatchVerifyPearlOperation startMatchOperationWithDevice:identity:credential:withConfiguration:matchOperationActionBlock:]((uint64_t)v22, v29);
    }
    v30 = v19;
    v31 = v20;
    v32 = v44;
    goto LABEL_16;
  }
  v31 = v20;
  if (a6 == 4)
  {
    v30 = v19;
    v32 = v44;
    if ((unint64_t)[v23 count] >= 2 && v26 == 1)
    {
      id v22 = [v23 firstObject];
      if (([v22 hasPeriocularEnrollment] & 1) == 0) {
        goto LABEL_26;
      }
      goto LABEL_40;
    }
  }
  else
  {
    v30 = v19;
    v32 = v44;
    if (a6 == 3 && (unint64_t)[v23 count] >= 2 && v26 == 1)
    {
      id v22 = [v23 firstObject];
      if ([v22 hasPeriocularEnrollment])
      {
LABEL_26:
        uint64_t v37 = objc_msgSend(v23, "lastObject", p_identity);
LABEL_41:
        v29 = *p_identity;
        *p_identity = (BKIdentity *)v37;
LABEL_16:

        goto LABEL_17;
      }
LABEL_40:
      uint64_t v37 = objc_msgSend(v23, "firstObject", p_identity);
      goto LABEL_41;
    }
  }
LABEL_17:
  id v46 = 0;
  objc_msgSend(v31, "createMatchOperationWithError:", &v46, p_identity);
  v33 = (BKMatchPearlOperation *)objc_claimAutoreleasedReturnValue();
  id v34 = v46;
  matchOperation = self->_matchOperation;
  self->_matchOperation = v33;

  if (v34)
  {
    v36 = _BKUILoggingFacility();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v34;
      _os_log_impl(&dword_1E4B6C000, v36, OS_LOG_TYPE_DEFAULT, "_matchOperation createMatchOperation Error:%@", buf, 0xCu);
    }
  }
  else
  {
    v38 = self->_matchOperation;
    if (v38)
    {
      [(BKMatchPearlOperation *)v38 setPreAugmentationCheck:1];
      [(BKMatchPearlOperation *)self->_matchOperation setPreAugmentationCheckIdentity:self->_identity];
      [(BKMatchPearlOperation *)self->_matchOperation setPurpose:6];
      [(BKMatchPearlOperation *)self->_matchOperation setCredentialSet:v32];
      [(BKMatchPearlOperation *)self->_matchOperation setStopOnSuccess:1];
      [(BKMatchPearlOperation *)self->_matchOperation setDelegate:self];
      [(BKMatchPearlOperation *)self->_matchOperation setShouldAutoRetry:1];
      v38 = self->_matchOperation;
    }
    id v45 = 0;
    char v39 = [(BKMatchPearlOperation *)v38 startWithError:&v45];
    id v34 = v45;
    if (v39)
    {
      [(BKUIMatchVerifyPearlOperation *)self setFailReason:-314159];
      goto LABEL_36;
    }
    v40 = _BKUILoggingFacility();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v34;
      _os_log_impl(&dword_1E4B6C000, v40, OS_LOG_TYPE_DEFAULT, "_matchOperation failed to start with Error:%@", buf, 0xCu);
    }

    [(BKMatchPearlOperation *)self->_matchOperation setDelegate:0];
    [(BKUIMatchVerifyPearlOperation *)self setFailReason:-9999];
  }
  v41 = [(BKUIMatchVerifyPearlOperation *)self matchOperationDidMatch];

  if (v41)
  {
    v42 = [(BKUIMatchVerifyPearlOperation *)self matchOperationDidMatch];
    v42[2](v42, 0);
  }
LABEL_36:
}

- (void)matchOperation:(id)a3 matchedWithResult:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 feedback];
  v7 = _BKUILoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int lastErrorousSubState = self->_lastErrorousSubState;
    int substate = self->_substate;
    v10 = [v5 identity];
    *(_DWORD *)buf = 138413058;
    id v18 = v5;
    __int16 v19 = 1024;
    int v20 = lastErrorousSubState;
    __int16 v21 = 1024;
    int v22 = substate;
    __int16 v23 = 2112;
    uint64_t v24 = v10;
    _os_log_impl(&dword_1E4B6C000, v7, OS_LOG_TYPE_DEFAULT, "_matchOperation matchedWithResult BKMatchResultInfo:%@ lastSubState:%u converted substate %u identity %@", buf, 0x22u);
  }
  unint64_t v11 = [(BKUIMatchVerifyPearlOperation *)self matchOperationDidMatch];

  if (v11)
  {
    v12 = [v5 identity];

    if (v12)
    {
      id v13 = [v5 identity];
      [(BKUIMatchVerifyPearlOperation *)self setMatchedIdentity:v13];
    }
    else
    {
      [(BKUIMatchVerifyPearlOperation *)self setFailReason:1];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__BKUIMatchVerifyPearlOperation_matchOperation_matchedWithResult___block_invoke;
    block[3] = &unk_1E6EA24F0;
    block[4] = self;
    uint64_t v16 = v6;
    id v15 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __66__BKUIMatchVerifyPearlOperation_matchOperation_matchedWithResult___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) substateForFaceDetectionFeedBack:*(void *)(a1 + 48)];
  *(_DWORD *)(*(void *)(a1 + 32) + 12) = *(_DWORD *)(*(void *)(a1 + 32) + 16);
  *(_DWORD *)(*(void *)(a1 + 32) + 16) = v2;
  objc_super v3 = *(_DWORD **)(a1 + 32);
  if (!v3[3] && !v3[4])
  {
    v4 = [*(id *)(a1 + 40) identity];

    objc_super v3 = *(_DWORD **)(a1 + 32);
    if (!v4)
    {
      v3[3] = 11;
      *(_DWORD *)(*(void *)(a1 + 32) + 16) = 11;
      objc_super v3 = *(_DWORD **)(a1 + 32);
    }
  }
  uint64_t v6 = [v3 matchOperationDidMatch];
  id v5 = [*(id *)(a1 + 40) identity];
  v6[2](v6, v5);
}

- (void)matchOperation:(id)a3 presenceDetectedInLockout:(int64_t)a4
{
  id v4 = a3;
  __assert_rtn("-[BKUIMatchVerifyPearlOperation matchOperation:presenceDetectedInLockout:]", "BKUIMatchVerifyPearlOperation.m", 139, "0");
}

- (void)matchOperation:(id)a3 failedWithReason:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _BKUILoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int lastErrorousSubState = self->_lastErrorousSubState;
    int v10 = 134218240;
    int64_t v11 = a4;
    __int16 v12 = 1024;
    int v13 = lastErrorousSubState;
    _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "_matchOperation failedWithReason with BKMatchFailReason:%li lastSubState:%i", (uint8_t *)&v10, 0x12u);
  }

  [(BKMatchPearlOperation *)self->_matchOperation setDelegate:0];
  [(BKUIMatchVerifyPearlOperation *)self setFailReason:a4];
  v8 = [(BKUIMatchVerifyPearlOperation *)self matchOperationDidMatch];

  if (v8)
  {
    v9 = [(BKUIMatchVerifyPearlOperation *)self matchOperationDidMatch];
    v9[2](v9, 0);
  }
}

- (int)substateForFaceDetectionFeedBack:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 9) {
    return 0;
  }
  else {
    return dword_1E4BD1500[a3 - 2];
  }
}

- (void)matchOperation:(id)a3 providedFeedback:(int64_t)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__BKUIMatchVerifyPearlOperation_matchOperation_providedFeedback___block_invoke;
  block[3] = &unk_1E6EA24F0;
  id v9 = v6;
  int64_t v10 = a4;
  block[4] = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__BKUIMatchVerifyPearlOperation_matchOperation_providedFeedback___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) failReason] == -314159)
  {
    int v2 = [*(id *)(a1 + 32) matchedIdentity];

    if (!v2)
    {
      int v3 = [*(id *)(a1 + 32) substateForFaceDetectionFeedBack:*(void *)(a1 + 48)];
      id v4 = _BKUILoggingFacility();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        uint64_t v6 = *(void *)(a1 + 48);
        int v7 = 138412802;
        uint64_t v8 = v5;
        __int16 v9 = 2048;
        uint64_t v10 = v6;
        __int16 v11 = 1024;
        int v12 = v3;
        _os_log_impl(&dword_1E4B6C000, v4, OS_LOG_TYPE_DEFAULT, "matchOperation providedFeedback with operation:%@ lastSubState:%li converted substate %u", (uint8_t *)&v7, 0x1Cu);
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 12) = *(_DWORD *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)(*(void *)(a1 + 32) + 16) = v3;
      if ([*(id *)(a1 + 32) substate]) {
        objc_msgSend(*(id *)(a1 + 32), "moveEnrollStateToNeedsPositioning:", objc_msgSend(*(id *)(a1 + 32), "substate"));
      }
    }
  }
}

- (void)moveEnrollStateToNeedsPositioning:(int)a3
{
  [(BKUIMatchVerifyPearlOperation *)self setCurrentUIDelegateDisplaySubState:*(void *)&a3];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__BKUIMatchVerifyPearlOperation_moveEnrollStateToNeedsPositioning___block_invoke;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__BKUIMatchVerifyPearlOperation_moveEnrollStateToNeedsPositioning___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) delegateUIAtNeedsPosition];
  int v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 operationsDelegate];
    objc_msgSend(v4, "setSubstate:animated:afterDelay:", objc_msgSend(*(id *)(a1 + 32), "currentUIDelegateDisplaySubState"), 1, 0.0);

    id v9 = [*(id *)(a1 + 32) operationsDelegate];
    [v9 refreshEscapeHatchForCurrentState];
  }
  else
  {
    [v3 setDelegateUIAtNeedsPosition:1];
    uint64_t v5 = [*(id *)(a1 + 32) operationsDelegate];
    int v6 = [v5 state];

    if (v6 == 6)
    {
      int v7 = [*(id *)(a1 + 32) operationsDelegate];
      [v7 setState:5 animated:1];
    }
    dispatch_time_t v8 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__BKUIMatchVerifyPearlOperation_moveEnrollStateToNeedsPositioning___block_invoke_2;
    block[3] = &unk_1E6EA20C0;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
}

void __67__BKUIMatchVerifyPearlOperation_moveEnrollStateToNeedsPositioning___block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) operationsDelegate];
  [v2 setState:3 animated:1];

  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__BKUIMatchVerifyPearlOperation_moveEnrollStateToNeedsPositioning___block_invoke_3;
  block[3] = &unk_1E6EA20C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

void __67__BKUIMatchVerifyPearlOperation_moveEnrollStateToNeedsPositioning___block_invoke_3(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) operationsDelegate];
  objc_msgSend(v2, "setSubstate:animated:afterDelay:", objc_msgSend(*(id *)(a1 + 32), "currentUIDelegateDisplaySubState"), 1, 0.1);

  id v3 = [*(id *)(a1 + 32) operationsDelegate];
  [v3 refreshEscapeHatchForCurrentState];
}

- (void)operation:(id)a3 faceDetectStateChanged:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "faceDetected", a3);

  [(BKUIMatchVerifyPearlOperation *)self setFaceDetected:v5];
}

- (void)operation:(id)a3 stateChanged:(int64_t)a4
{
  if ([(BKUIMatchVerifyPearlOperation *)self failReason] == -314159)
  {
    int v6 = [(BKUIMatchVerifyPearlOperation *)self matchedIdentity];

    if (a4 == 5 && !v6 && ![(BKUIMatchVerifyPearlOperation *)self faceDetected])
    {
      [(BKUIMatchVerifyPearlOperation *)self moveEnrollStateToNeedsPositioning:0];
      int v7 = [(BKUIMatchVerifyPearlOperation *)self matchOperation];
      id v10 = 0;
      [v7 startNewMatchAttemptWithError:&v10];
      id v8 = v10;

      if (v8)
      {
        id v9 = _BKUILoggingFacility();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[BKUIMatchVerifyPearlOperation operation:stateChanged:](v8, v9);
        }
      }
    }
  }
}

- (void)cancelMatchOperation
{
  id v3 = [(BKUIMatchVerifyPearlOperation *)self matchOperation];
  [v3 setDelegate:0];

  id v4 = [(BKUIMatchVerifyPearlOperation *)self matchOperation];
  [v4 cancel];
}

- (id)matchOperationDidMatch
{
  return self->_matchOperationDidMatch;
}

- (void)setMatchOperationDidMatch:(id)a3
{
}

- (BKMatchPearlOperation)matchOperation
{
  return self->_matchOperation;
}

- (void)setMatchOperation:(id)a3
{
}

- (BKUIFaceIDEnrollOperationsHandler)weakHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakHandler);

  return (BKUIFaceIDEnrollOperationsHandler *)WeakRetained;
}

- (void)setWeakHandler:(id)a3
{
}

- (BKUIPearlEnrollOperationsDelegate)operationsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operationsDelegate);

  return (BKUIPearlEnrollOperationsDelegate *)WeakRetained;
}

- (void)setOperationsDelegate:(id)a3
{
}

- (int)lastErrorousSubState
{
  return self->_lastErrorousSubState;
}

- (void)setLastErrorousSubState:(int)a3
{
  self->_int lastErrorousSubState = a3;
}

- (int)substate
{
  return self->_substate;
}

- (void)setSubstate:(int)a3
{
  self->_int substate = a3;
}

- (int)currentUIDelegateDisplaySubState
{
  return self->_currentUIDelegateDisplaySubState;
}

- (void)setCurrentUIDelegateDisplaySubState:(int)a3
{
  self->_currentUIDelegateDisplaySubState = a3;
}

- (int64_t)failReason
{
  return self->_failReason;
}

- (void)setFailReason:(int64_t)a3
{
  self->_failReason = a3;
}

- (BKIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (BKDevicePearl)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BKIdentity)matchedIdentity
{
  return self->_matchedIdentity;
}

- (void)setMatchedIdentity:(id)a3
{
}

- (NSData)credentialSet
{
  return self->_credentialSet;
}

- (void)setCredentialSet:(id)a3
{
}

- (unint64_t)enrollmentConfiguration
{
  return self->_enrollmentConfiguration;
}

- (void)setEnrollmentConfiguration:(unint64_t)a3
{
  self->_enrollmentConfiguration = a3;
}

- (BOOL)delegateUIAtNeedsPosition
{
  return self->_delegateUIAtNeedsPosition;
}

- (void)setDelegateUIAtNeedsPosition:(BOOL)a3
{
  self->_delegateUIAtNeedsPosition = a3;
}

- (BOOL)faceDetected
{
  return self->_faceDetected;
}

- (void)setFaceDetected:(BOOL)a3
{
  self->_faceDetected = a3;
}

- (BOOL)matchFailed
{
  return self->_matchFailed;
}

- (void)setMatchFailed:(BOOL)a3
{
  self->_matchFailed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialSet, 0);
  objc_storeStrong((id *)&self->_matchedIdentity, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_destroyWeak((id *)&self->_operationsDelegate);
  objc_destroyWeak((id *)&self->_weakHandler);
  objc_storeStrong((id *)&self->_matchOperation, 0);

  objc_storeStrong(&self->_matchOperationDidMatch, 0);
}

- (void)startMatchOperationWithDevice:(uint64_t)a1 identity:(NSObject *)a2 credential:withConfiguration:matchOperationActionBlock:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_ERROR, "unable to fetch identities for user:%@ matching may be unreliable and users may run in to Face ID not available", (uint8_t *)&v2, 0xCu);
}

- (void)operation:(void *)a1 stateChanged:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_ERROR, "_matchOperation stateChanged == HOLD + !Face ... startNewMatchAttemptWithError errored out :%@", (uint8_t *)&v4, 0xCu);
}

@end