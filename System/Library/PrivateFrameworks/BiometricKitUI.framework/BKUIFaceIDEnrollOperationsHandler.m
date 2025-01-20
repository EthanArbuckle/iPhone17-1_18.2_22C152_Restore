@interface BKUIFaceIDEnrollOperationsHandler
+ (id)handlersForEnrollmentConfiguration:(unint64_t)a3 inBuddy:(BOOL)a4 delegate:(id)a5 credential:(id)a6 externalizedAuthContext:(id)a7;
- (BKDevicePearl)device;
- (BKEnrollPearlOperation)enrollOperation;
- (BKIdentity)identity;
- (BKUIAnalyticsManager)analyticsManager;
- (BKUIFaceIDEnrollOperationsHandler)init;
- (BKUIFaceIDEnrollOperationsHandler)initWithBKPearlEnrollmentType:(int64_t)a3;
- (BKUIMatchVerifyPearlOperation)matchOperation;
- (BKUIPearlEnrollOperationsDelegate)operationsDelegate;
- (BOOL)_completeOperationWithError:(id *)a3;
- (BOOL)_matchOperationPreflightCheck:(id *)a3;
- (BOOL)_startOperationWithError:(id *)a3;
- (BOOL)_validateEnrolledPoses:(id)a3;
- (BOOL)canStartEnrollmentOperation;
- (BOOL)centerBinComplete;
- (BOOL)completeCurrentEnrollOperationWithError:(id *)a3;
- (BOOL)glassesEnforcementError;
- (BOOL)glassesFound;
- (BOOL)inbuddy;
- (BOOL)isActive;
- (BOOL)isEnrollmentAugmentationOnly;
- (BOOL)isSuspended;
- (BOOL)needsCancellationForState:(int)a3;
- (BOOL)shouldShowRetryUI;
- (BOOL)showAddGlassesButton;
- (BOOL)supportsPeriocularEnrollment;
- (BOOL)userSelectedUseAccessibilityEnrollment;
- (NSData)externalizedAuthContext;
- (NSMutableArray)poseStatus;
- (NSString)credential;
- (double)bioKitCompletionPercentage;
- (id)bkIdentities;
- (id)getAuthContextForCredentialError:(id *)a3;
- (id)getAuthContextForCredentialError:(id *)a3 authContext:(id *)a4;
- (id)matchUserThenDoSingleEnrollmentCompletion;
- (int64_t)enrollmentType;
- (int64_t)glassesRequirement;
- (unint64_t)enrollmentConfiguration;
- (void)_cleanupEnroll;
- (void)_cleanupEnroll:(BOOL)a3;
- (void)_removeIdentity;
- (void)advanceEnrollmentState;
- (void)bkIdentities;
- (void)cancelCurrentEnrollmentOperationIfUnfinished;
- (void)cancelEnroll;
- (void)cancelEnrollForRotation;
- (void)cancelEnrollPreserveIdentity;
- (void)enrollOperation:(id)a3 failedWithReason:(int64_t)a4;
- (void)enrollOperation:(id)a3 finishedWithEnrollResult:(id)a4;
- (void)enrollOperation:(id)a3 percentCompleted:(int64_t)a4;
- (void)enrollOperation:(id)a3 progressedWithInfo:(id)a4;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)matchOperation:(id)a3 failedToMatchWithUserPositionSubstate:(int)a4 operationCompleteAction:(id)a5;
- (void)matchUserForGlassesPhaseEnrollmentWithCompletionAction:(id)a3;
- (void)matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction:(id)a3;
- (void)operation:(id)a3 faceDetectStateChanged:(id)a4;
- (void)retryOperation;
- (void)retryPressed;
- (void)setAnalyticsManager:(id)a3;
- (void)setBioKitCompletionPercentage:(double)a3;
- (void)setCanStartEnrollmentOperation:(BOOL)a3;
- (void)setCenterBinComplete:(BOOL)a3;
- (void)setCredential:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEnrollOperation:(id)a3;
- (void)setEnrollmentConfiguration:(unint64_t)a3;
- (void)setEnrollmentType:(int64_t)a3;
- (void)setExternalizedAuthContext:(id)a3;
- (void)setGlassesEnforcementError:(BOOL)a3;
- (void)setGlassesFound:(BOOL)a3;
- (void)setIdentity:(id)a3;
- (void)setInbuddy:(BOOL)a3;
- (void)setMatchOperation:(id)a3;
- (void)setMatchUserThenDoSingleEnrollmentCompletion:(id)a3;
- (void)setOperationsDelegate:(id)a3;
- (void)setPoseStatus:(id)a3;
- (void)setSupportsPeriocularEnrollment:(BOOL)a3;
- (void)setSuspend:(BOOL)a3;
- (void)setUserSelectedUseAccessibilityEnrollment:(BOOL)a3;
- (void)startEnroll;
- (void)startEnrollForEnrollmentType:(int64_t)a3 glassesRequirement:(int64_t)a4 identity:(id)a5 operationStartedActionBlock:(id)a6;
@end

@implementation BKUIFaceIDEnrollOperationsHandler

- (void)retryOperation
{
  enrollOperation = self->_enrollOperation;
  self->_enrollOperation = 0;

  [(NSMutableArray *)self->_poseStatus removeAllObjects];
  self->_canStartEnrollmentOperation = 1;
  self->_bioKitCompletionPercentage = 0.0;
  lastFaceFoundDate = self->_lastFaceFoundDate;
  self->_lastFaceFoundDate = 0;

  v5 = _BKUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "retryOperation: enrollOperationInProgress = NO", buf, 2u);
  }

  self->_enrollOperationInProgress = 0;
  self->_centerBinComplete = 0;
  if ([(BKUIFaceIDEnrollOperationsHandler *)self glassesEnforcementError])
  {
    v6 = _BKUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "Retrying Glasses enrollment for enforcemnt error", v8, 2u);
    }

    [(BKUIFaceIDEnrollOperationsHandler *)self setGlassesEnforcementError:0];
    v7 = [(BKUIFaceIDEnrollOperationsHandler *)self matchUserThenDoSingleEnrollmentCompletion];
    [(BKUIFaceIDEnrollOperationsHandler *)self matchUserForSecondPhaseEnrollmentWithCompletionAction:v7];
  }
}

- (BKUIFaceIDEnrollOperationsHandler)initWithBKPearlEnrollmentType:(int64_t)a3
{
  result = [(BKUIFaceIDEnrollOperationsHandler *)self init];
  if (result) {
    result->_enrollmentType = a3;
  }
  return result;
}

- (BKUIFaceIDEnrollOperationsHandler)init
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)BKUIFaceIDEnrollOperationsHandler;
  v2 = [(BKUIFaceIDEnrollOperationsHandler *)&v23 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.biometrickitui.enrollmentStartStopQueue", v3);
    enrollStartStopQueue = v2->_enrollStartStopQueue;
    v2->_enrollStartStopQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    poseStatus = v2->_poseStatus;
    v2->_poseStatus = (NSMutableArray *)v6;

    v2->_canStartEnrollmentOperation = 1;
    Class BKDeviceClass_0 = getBKDeviceClass_0();
    v9 = [(objc_class *)getBKDeviceDescriptorClass_0() deviceDescriptorForType:2];
    id v22 = 0;
    uint64_t v10 = [(objc_class *)BKDeviceClass_0 deviceWithDescriptor:v9 error:&v22];
    id v11 = v22;
    device = v2->_device;
    v2->_device = (BKDevicePearl *)v10;

    if (!v2->_device || v11)
    {
      v13 = _BKUILoggingFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v11;
        _os_log_impl(&dword_1E4B6C000, v13, OS_LOG_TYPE_DEFAULT, "Failed to fetch BKDevice: %@", buf, 0xCu);
      }
    }
    uint64_t v14 = objc_opt_new();
    analyticsManager = v2->_analyticsManager;
    v2->_analyticsManager = (BKUIAnalyticsManager *)v14;

    v16 = [(BKUIFaceIDEnrollOperationsHandler *)v2 device];
    id v21 = 0;
    v17 = [v16 supportsPeriocularEnrollmentWithError:&v21];
    id v18 = v21;

    if (v18)
    {
      v19 = _BKUILoggingFacility();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v18;
        _os_log_impl(&dword_1E4B6C000, v19, OS_LOG_TYPE_DEFAULT, "Failed to fetch if periocular is supported supportsPeriocularEnrollmentWithError failed, defaulting to NO ....error: %@", buf, 0xCu);
      }

      v2->_supportsPeriocularEnrollment = 0;
    }
    else
    {
      v2->_supportsPeriocularEnrollment = [v17 BOOLValue];
    }
  }
  return v2;
}

- (BOOL)isActive
{
  enrollOperation = self->_enrollOperation;
  if (enrollOperation) {
    LOBYTE(enrollOperation) = [(BKEnrollPearlOperation *)enrollOperation state] != 4;
  }
  return (char)enrollOperation;
}

- (void)setSuspend:(BOOL)a3
{
  enrollOperation = self->_enrollOperation;
  if (a3)
  {
    id v13 = 0;
    [(BKEnrollPearlOperation *)enrollOperation suspendWithError:&v13];
    id v5 = v13;
    if (!v5) {
      return;
    }
    uint64_t v6 = v5;
    v7 = _BKUILoggingFacility();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v8 = "Pearl: Failed suspending enroll";
    goto LABEL_8;
  }
  id v11 = 0;
  [(BKEnrollPearlOperation *)enrollOperation resumeWithError:&v11];
  id v9 = v11;
  if (!v9) {
    return;
  }
  uint64_t v6 = v9;
  v7 = _BKUILoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v8 = "Pearl: Failed resuming enroll";
LABEL_8:
    _os_log_impl(&dword_1E4B6C000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
  }
LABEL_9:

  uint64_t v10 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  [v10 endEnrollFlowWithError:v6];
}

- (void)_cleanupEnroll
{
  [(BKUIFaceIDEnrollOperationsHandler *)self _cleanupEnroll:1];
  id v3 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  [v3 invalidateSubstateTimer];
}

- (void)_cleanupEnroll:(BOOL)a3
{
  BOOL v3 = a3;
  enrollOperation = self->_enrollOperation;
  if (enrollOperation)
  {
    [(BKEnrollPearlOperation *)enrollOperation setDelegate:0];
    uint64_t v6 = self->_enrollOperation;
    self->_enrollOperation = 0;

    v7 = [MEMORY[0x1E4F42738] sharedApplication];
    [v7 setIdleTimerDisabled:0];
  }
  [(SFClient *)self->_sharingclient invalidate];
  sharingclient = self->_sharingclient;
  self->_sharingclient = 0;

  if (v3)
  {
    [(LAContext *)self->_authContext invalidate];
    authContext = self->_authContext;
    self->_authContext = 0;
  }
  uint64_t v10 = _BKUILoggingFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1E4B6C000, v10, OS_LOG_TYPE_DEFAULT, "_cleanupEnroll: enrollOperationInProgress = NO", v11, 2u);
  }

  self->_enrollOperationInProgress = 0;
}

- (BOOL)completeCurrentEnrollOperationWithError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v5 = -[BKEnrollPearlOperation completeWithError:](self->_enrollOperation, "completeWithError:");
  if (v5)
  {
    self->_userSelectedUseAccessibilityEnrollment = 1;
    uint64_t v6 = _BKUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      enrollOperation = self->_enrollOperation;
      int v12 = 138412546;
      id v13 = enrollOperation;
      __int16 v14 = 2048;
      uint64_t v15 = [(BKEnrollPearlOperation *)enrollOperation enrollmentType];
      v8 = "sucessfully completed enroll operation:%@, type:%li";
LABEL_6:
      _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    uint64_t v6 = _BKUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = self->_enrollOperation;
      id v10 = *a3;
      int v12 = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = (uint64_t)v10;
      v8 = "Failed to complete current enroll operation:%@, error:%@";
      goto LABEL_6;
    }
  }

  return v5;
}

- (void)cancelCurrentEnrollmentOperationIfUnfinished
{
  if ([(BKEnrollPearlOperation *)self->_enrollOperation state] != 4)
  {
    enrollOperation = self->_enrollOperation;
    [(BKEnrollPearlOperation *)enrollOperation cancel];
  }
}

- (void)cancelEnrollForRotation
{
  enrollStartStopQueue = self->_enrollStartStopQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__BKUIFaceIDEnrollOperationsHandler_cancelEnrollForRotation__block_invoke;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_sync(enrollStartStopQueue, block);
}

void __60__BKUIFaceIDEnrollOperationsHandler_cancelEnrollForRotation__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 operationsDelegate];
  uint64_t v4 = objc_msgSend(v2, "needsCancellationForState:", objc_msgSend(v3, "state"));

  int v5 = [*(id *)(a1 + 32) operationsDelegate];
  uint64_t v6 = [v5 getEnrollview];
  [v6 percentOfPillsCompleted];
  double v8 = v7;

  id v9 = _BKUILoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_msgSend(*(id *)(a1 + 32), "operationsDelegate", 1.0);
    int v11 = [v10 state];
    int v12 = [NSNumber numberWithBool:v4];
    id v13 = [NSNumber numberWithBool:v8 >= 1.0];
    v20[0] = 67109634;
    v20[1] = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    v24 = v13;
    _os_log_impl(&dword_1E4B6C000, v9, OS_LOG_TYPE_DEFAULT, "cancelEnrollForRotation: currentState[%u]demandsCancellation: %@, hasPartialPillCompletion: %@", (uint8_t *)v20, 0x1Cu);
  }
  if (v8 >= 1.0) {
    int v14 = 1;
  }
  else {
    int v14 = v4;
  }
  uint64_t v15 = _BKUILoggingFacility();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14 == 1)
  {
    if (v16)
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_1E4B6C000, v15, OS_LOG_TYPE_DEFAULT, "cancelEnrollForRotation early exit", (uint8_t *)v20, 2u);
    }
  }
  else
  {
    if (v16)
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_1E4B6C000, v15, OS_LOG_TYPE_DEFAULT, "cancelEnrollForRotation: cancelling now", (uint8_t *)v20, 2u);
    }

    v17 = [*(id *)(a1 + 32) operationsDelegate];
    id v18 = [v17 getEnrollview];
    [v18 setState:0 completion:0];

    [*(id *)(a1 + 32) _removeIdentity];
    [*(id *)(a1 + 32) _cleanupEnroll:0];
    [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
    *(void *)(*(void *)(a1 + 32) + 120) = 0;
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v15 = *(NSObject **)(v19 + 40);
    *(void *)(v19 + 40) = 0;
  }
}

- (BOOL)needsCancellationForState:(int)a3
{
  return (a3 < 0xB) & (0x707u >> a3);
}

- (void)startEnrollForEnrollmentType:(int64_t)a3 glassesRequirement:(int64_t)a4 identity:(id)a5 operationStartedActionBlock:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  BOOL enrollOperationInProgress = self->_enrollOperationInProgress;
  id v13 = _BKUILoggingFacility();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (enrollOperationInProgress)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4B6C000, v13, OS_LOG_TYPE_DEFAULT, "startEnrollForEnrollmentType: BOOL enrollOperationInProgress = YES - Enroll already in progress", buf, 2u);
    }
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412802;
      v36 = self;
      __int16 v37 = 2048;
      int64_t v38 = a3;
      __int16 v39 = 2112;
      id v40 = v10;
      _os_log_impl(&dword_1E4B6C000, v13, OS_LOG_TYPE_DEFAULT, "%@ Starting Enroll... type:%li identity:%@ BOOL enrollOperationInProgress = YES", buf, 0x20u);
    }

    uint64_t v15 = [(BKUIFaceIDEnrollOperationsHandler *)self analyticsManager];
    v33[0] = @"inBuddy";
    BOOL v16 = objc_msgSend(NSNumber, "numberWithBool:", -[BKUIFaceIDEnrollOperationsHandler inbuddy](self, "inbuddy"));
    v34[0] = v16;
    v33[1] = @"enrollmentType";
    [NSNumber numberWithInteger:a3];
    v17 = int64_t v27 = a3;
    v34[1] = v17;
    v33[2] = @"enrollmentState";
    id v18 = NSNumber;
    uint64_t v19 = [(BKUIFaceIDEnrollOperationsHandler *)self enrollOperation];
    v20 = objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "state"));
    v34[2] = v20;
    v33[3] = @"enrollmentNeedsGlasses";
    [NSNumber numberWithInteger:a4];
    __int16 v21 = v26 = a4;
    v34[3] = v21;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:4];
    [v15 traceEvent:@"com.apple.BKUI.FaceIDEnrollmentStarted" withPayload:v22];

    self->_bioKitCompletionPercentage = 0.0;
    self->_BOOL enrollOperationInProgress = 1;
    __int16 v23 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
    v24 = [v23 view];
    [v24 setNeedsLayout];

    enrollStartStopQueue = self->_enrollStartStopQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke;
    block[3] = &unk_1E6EA25B8;
    block[4] = self;
    int64_t v31 = v27;
    id v29 = v10;
    int64_t v32 = v26;
    id v30 = v11;
    dispatch_sync(enrollStartStopQueue, block);
  }
}

void __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = _BKUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = [*(id *)(a1 + 32) credential];
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v3 != 0;
    _os_log_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEFAULT, "Has credential: %d", (uint8_t *)&buf, 8u);
  }
  uint64_t v4 = *(void **)(a1 + 32);
  id v32 = 0;
  int v5 = [v4 getAuthContextForCredentialError:&v32];
  id v6 = v32;
  double v7 = _BKUILoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v5 != 0;
    _os_log_impl(&dword_1E4B6C000, v7, OS_LOG_TYPE_DEFAULT, "Has credentialSet: %d", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&location, *(id *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_77;
  aBlock[3] = &unk_1E6EA2540;
  aBlock[4] = *(void *)(a1 + 32);
  objc_copyWeak(v30, &location);
  v30[1] = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(void **)(a1 + 64);
  id v27 = v8;
  v30[2] = v9;
  id v10 = v5;
  id v28 = v10;
  id v29 = *(id *)(a1 + 48);
  id v11 = _Block_copy(aBlock);
  if (v6)
  {
    objc_initWeak(&buf, *(id *)(a1 + 32));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_2_88;
    block[3] = &unk_1E6EA2268;
    objc_copyWeak(&v22, &buf);
    id v21 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&buf);
  }
  else
  {
    int v12 = _AXSVoiceOverTouchEnabled();
    id v13 = objc_alloc_init(MEMORY[0x1E4F50540]);
    BOOL v14 = _BKUILoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = v12 != 0;
      BOOL v16 = v12 == 0;
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = v16;
      __int16 v34 = 1024;
      BOOL v35 = v15;
      _os_log_impl(&dword_1E4B6C000, v14, OS_LOG_TYPE_DEFAULT, "Setting attention detection to %d because VoiceOver is %d", (uint8_t *)&buf, 0xEu);
    }
    else
    {
      BOOL v16 = v12 == 0;
    }

    v17 = [NSNumber numberWithInt:v16];
    [v13 setAttentionDetectionEnabled:v17];

    objc_initWeak(&buf, *(id *)(a1 + 32));
    id v18 = [*(id *)(a1 + 32) device];
    uint64_t v19 = getuid();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_85;
    v23[3] = &unk_1E6EA2590;
    objc_copyWeak(&v25, &buf);
    id v24 = v11;
    [v18 setProtectedConfiguration:v13 forUser:v19 credentialSet:v10 reply:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&buf);
  }
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
}

void __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_77(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  BOOL v3 = [WeakRetained device];
  id v24 = 0;
  uint64_t v4 = [v3 createEnrollOperationWithError:&v24];
  id v5 = v24;
  uint64_t v6 = *(void *)(a1 + 32);
  double v7 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v4;

  [*(id *)(*(void *)(a1 + 32) + 128) setEnrollmentType:*(void *)(a1 + 72)];
  if (*(void *)(a1 + 72) != 1)
  {
    id v8 = _BKUILoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 40);
      *(_DWORD *)id buf = 138412290;
      id v26 = v9;
      _os_log_impl(&dword_1E4B6C000, v8, OS_LOG_TYPE_DEFAULT, "Set enroll operation enrollment type to augment identity: %@", buf, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 128) setAugmentedIdentity:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 128) setPeriocularGlassesRequirement:*(void *)(a1 + 80)];
  }
  [*(id *)(*(void *)(a1 + 32) + 128) setCredentialSet:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 128) setUserID:getuid()];
  [*(id *)(*(void *)(a1 + 32) + 128) setClientToComplete:1];
  id v10 = *(void **)(*(void *)(a1 + 32) + 128);
  if (!v10 || v5)
  {
    id v11 = _BKUILoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412290;
      id v26 = v5;
      _os_log_impl(&dword_1E4B6C000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create enroll operation: %@", buf, 0xCu);
    }
  }
  else
  {
    [v10 setDelegate:WeakRetained];
  }
  int v12 = *(void **)(a1 + 32);
  id v23 = v5;
  char v13 = [v12 _startOperationWithError:&v23];
  id v14 = v23;

  if (v13)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_2;
    v18[3] = &unk_1E6EA2518;
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 72);
    v18[4] = v15;
    v18[5] = WeakRetained;
    id v19 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E4F14428], v18);
    BOOL v16 = v19;
  }
  else
  {
    v17 = _BKUILoggingFacility();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412290;
      id v26 = v14;
      _os_log_impl(&dword_1E4B6C000, v17, OS_LOG_TYPE_DEFAULT, "Failed to start enroll: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_78;
    block[3] = &unk_1E6EA2180;
    void block[4] = WeakRetained;
    id v22 = v14;
    dispatch_async(MEMORY[0x1E4F14428], block);
    BOOL v16 = v22;
  }
}

void __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_78(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) operationsDelegate];
  BOOL v3 = [NSString stringWithFormat:@"Failed to start enroll: %@", *(void *)(a1 + 40)];
  [v2 setStatus:v3];

  id v4 = [*(id *)(a1 + 32) operationsDelegate];
  [v4 endEnrollFlowWithError:*(void *)(a1 + 40)];
}

void __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F42738] sharedApplication];
  [v2 setIdleTimerDisabled:1];

  id v3 = objc_alloc_init(getSFClientClass());
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v3;

  [*(id *)(*(void *)(a1 + 32) + 8) activateAssertionWithIdentifier:@"com.apple.sharing.PreventProxCards"];
  if (*(void *)(a1 + 56) == 1 || [*(id *)(a1 + 40) isEnrollmentAugmentationOnly])
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (!v6)
    {
      double v7 = [*(id *)(a1 + 40) operationsDelegate];
      int v8 = [v7 state];

      if (v8 == 2)
      {
        id v10 = [*(id *)(a1 + 32) operationsDelegate];
        [v10 setState:3 animated:1];
      }
      return;
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (!v6) {
      return;
    }
  }
  id v9 = *(void (**)(void))(v6 + 16);

  v9();
}

void __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_85(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5 || (a2 & 1) == 0)
  {
    double v7 = _BKUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_1E4B6C000, v7, OS_LOG_TYPE_DEFAULT, "Failed to disable attention detection with VoiceOver, reason: %@", buf, 0xCu);
    }
  }
  int v8 = WeakRetained[4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_86;
  block[3] = &unk_1E6EA2568;
  id v10 = *(id *)(a1 + 32);
  dispatch_async(v8, block);
}

uint64_t __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_86(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __122__BKUIFaceIDEnrollOperationsHandler_startEnrollForEnrollmentType_glassesRequirement_identity_operationStartedActionBlock___block_invoke_2_88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained operationsDelegate];
  [v2 endEnrollFlowWithError:*(void *)(a1 + 32)];
}

- (void)startEnroll
{
  self->_userSelectedUseAccessibilityEnrollment = 0;
  [(BKUIFaceIDEnrollOperationsHandler *)self startEnrollForEnrollmentType:1 glassesRequirement:0 identity:0 operationStartedActionBlock:0];
}

- (void)matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(BKUIMatchVerifyPearlOperation);
  [(BKUIFaceIDEnrollOperationsHandler *)self setMatchOperation:v5];

  uint64_t v6 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  double v7 = [(BKUIFaceIDEnrollOperationsHandler *)self matchOperation];
  [v7 setOperationsDelegate:v6];

  [(BKUIFaceIDEnrollOperationsHandler *)self setGlassesEnforcementError:0];
  [(BKUIFaceIDEnrollOperationsHandler *)self setMatchUserThenDoSingleEnrollmentCompletion:v4];
  id v28 = 0;
  LODWORD(v7) = [(BKUIFaceIDEnrollOperationsHandler *)self _matchOperationPreflightCheck:&v28];
  id v8 = v28;
  if (v7)
  {
    if ([(BKUIFaceIDEnrollOperationsHandler *)self inbuddy]
      && [(BKUIFaceIDEnrollOperationsHandler *)self enrollmentConfiguration] == 3
      && +[BKUIPasscodeEntryController isDevicePasscodeSet]&& !v8)
    {
      dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
      [(BKUIFaceIDEnrollOperationsHandler *)self setExternalizedAuthContext:0];
      [(BKUIFaceIDEnrollOperationsHandler *)self setCredential:0];
      objc_initWeak(&location, self);
      id v9 = [BKUIPasscodeEntryController alloc];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke;
      v24[3] = &unk_1E6EA2608;
      objc_copyWeak(&v26, &location);
      id v25 = v4;
      id v10 = [(BKUIPasscodeEntryController *)v9 initWithVerifiedPasscodeAction:v24];
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v10];
      id v12 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
      [v12 presentViewController:v11 animated:1 completion:0];

      uint64_t v13 = &v26;
    }
    else
    {
      if ([(BKUIFaceIDEnrollOperationsHandler *)self isEnrollmentAugmentationOnly])
      {
        id v14 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
        int v15 = [v14 substate];

        if (v15 != 15)
        {
          BOOL v16 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
          [v16 setState:3 animated:1];
        }
      }
      objc_initWeak(&location, self);
      v17 = [(BKUIFaceIDEnrollOperationsHandler *)self matchOperation];
      id v18 = [(BKUIFaceIDEnrollOperationsHandler *)self device];
      id v19 = [(BKUIFaceIDEnrollOperationsHandler *)self identity];
      unint64_t v20 = [(BKUIFaceIDEnrollOperationsHandler *)self enrollmentConfiguration];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_4;
      v21[3] = &unk_1E6EA2630;
      objc_copyWeak(&v23, &location);
      v21[4] = self;
      id v22 = v4;
      [v17 startMatchOperationWithDevice:v18 identity:v19 credential:v8 withConfiguration:v20 matchOperationActionBlock:v21];

      uint64_t v13 = &v23;
    }
    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

void __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v3)
  {
    [WeakRetained setCredential:v3];
    uint64_t v6 = [v5 operationsDelegate];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_2;
    v9[3] = &unk_1E6EA25E0;
    v9[4] = v5;
    id v10 = *(id *)(a1 + 32);
    [v6 dismissViewControllerAnimated:1 completion:v9];

    double v7 = v10;
  }
  else
  {
    double v7 = [WeakRetained operationsDelegate];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_3;
    v8[3] = &unk_1E6EA20C0;
    v8[4] = v5;
    [v7 dismissViewControllerAnimated:1 completion:v8];
  }
}

uint64_t __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction:*(void *)(a1 + 40)];
}

void __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) operationsDelegate];
  v1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.biometrickitui.pearl_enroll" code:-1 userInfo:0];
  [v2 endEnrollFlowWithError:v1];
}

void __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (v3)
  {
    if (([WeakRetained supportsPeriocularEnrollment] & 1) != 0
      || [v5 enrollmentType] != 3)
    {
      objc_msgSend(v5, "startEnrollForEnrollmentType:glassesRequirement:identity:operationStartedActionBlock:", objc_msgSend(v5, "enrollmentType"), 0, v3, *(void *)(a1 + 40));
    }
    else
    {
      uint64_t v6 = _BKUILoggingFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_4_cold_1(v6);
      }

      double v7 = [v5 operationsDelegate];
      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.biometrickitui.pearl_enroll" code:-4 userInfo:0];
      [v7 endEnrollFlowWithError:v8];
    }
  }
  else
  {
    id v9 = [WeakRetained matchOperation];
    id v10 = [*(id *)(a1 + 32) matchOperation];
    objc_msgSend(v5, "matchOperation:failedToMatchWithUserPositionSubstate:operationCompleteAction:", v9, objc_msgSend(v10, "lastErrorousSubState"), *(void *)(a1 + 40));
  }
}

- (void)matchUserForGlassesPhaseEnrollmentWithCompletionAction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(BKUIMatchVerifyPearlOperation);
  [(BKUIFaceIDEnrollOperationsHandler *)self setMatchOperation:v5];

  uint64_t v6 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  uint64_t v7 = [(BKUIFaceIDEnrollOperationsHandler *)self matchOperation];
  [(id)v7 setOperationsDelegate:v6];

  id v18 = 0;
  LOBYTE(v7) = [(BKUIFaceIDEnrollOperationsHandler *)self _matchOperationPreflightCheck:&v18];
  id v8 = v18;
  if (v7)
  {
    objc_initWeak(&location, self);
    id v9 = [(BKUIFaceIDEnrollOperationsHandler *)self matchOperation];
    id v10 = [(BKUIFaceIDEnrollOperationsHandler *)self device];
    id v11 = [(BKUIFaceIDEnrollOperationsHandler *)self identity];
    unint64_t v12 = [(BKUIFaceIDEnrollOperationsHandler *)self enrollmentConfiguration];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __92__BKUIFaceIDEnrollOperationsHandler_matchUserForGlassesPhaseEnrollmentWithCompletionAction___block_invoke;
    v14[3] = &unk_1E6EA2630;
    objc_copyWeak(&v16, &location);
    v14[4] = self;
    id v15 = v4;
    [v9 startMatchOperationWithDevice:v10 identity:v11 credential:v8 withConfiguration:v12 matchOperationActionBlock:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v13 = _BKUILoggingFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BKUIFaceIDEnrollOperationsHandler matchUserForGlassesPhaseEnrollmentWithCompletionAction:](v13);
    }
  }
}

void __92__BKUIFaceIDEnrollOperationsHandler_matchUserForGlassesPhaseEnrollmentWithCompletionAction___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (v7)
  {
    [WeakRetained startEnrollForEnrollmentType:3 glassesRequirement:1 identity:v7 operationStartedActionBlock:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = [WeakRetained matchOperation];
    uint64_t v6 = [*(id *)(a1 + 32) matchOperation];
    objc_msgSend(v4, "matchOperation:failedToMatchWithUserPositionSubstate:operationCompleteAction:", v5, objc_msgSend(v6, "lastErrorousSubState"), *(void *)(a1 + 40));
  }
}

- (BOOL)_matchOperationPreflightCheck:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__BKUIFaceIDEnrollOperationsHandler__matchOperationPreflightCheck___block_invoke;
  aBlock[3] = &unk_1E6EA2658;
  aBlock[4] = self;
  id v5 = (void (**)(void *, id))_Block_copy(aBlock);
  uint64_t v6 = _BKUILoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(BKUIFaceIDEnrollOperationsHandler *)self credential];
    *(_DWORD *)id buf = 67109120;
    BOOL v23 = v7 != 0;
    _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "Has credential: %d", buf, 8u);
  }
  id v20 = 0;
  id v8 = [(BKUIFaceIDEnrollOperationsHandler *)self getAuthContextForCredentialError:&v20];
  id v9 = v20;
  id v10 = _BKUILoggingFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109120;
    BOOL v23 = v8 != 0;
    _os_log_impl(&dword_1E4B6C000, v10, OS_LOG_TYPE_DEFAULT, "Has credentialSet: %d", buf, 8u);
  }

  id v11 = [(BKUIFaceIDEnrollOperationsHandler *)self device];

  if (v11) {
    goto LABEL_6;
  }
  Class BKDeviceClass_0 = getBKDeviceClass_0();
  id v14 = [(objc_class *)getBKDeviceDescriptorClass_0() deviceDescriptorForType:2];
  id v19 = 0;
  id v15 = [(objc_class *)BKDeviceClass_0 deviceWithDescriptor:v14 error:&v19];
  id v16 = v19;
  [(BKUIFaceIDEnrollOperationsHandler *)self setDevice:v15];

  if (!v16)
  {
LABEL_6:
    *a3 = v8;
    BOOL v12 = 1;
  }
  else
  {
    v17 = _BKUILoggingFacility();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[BKUIFaceIDEnrollOperationsHandler _matchOperationPreflightCheck:]((uint64_t)v16, v17);
    }

    v5[2](v5, v16);
    BOOL v12 = 0;
  }

  return v12;
}

uint64_t __67__BKUIFaceIDEnrollOperationsHandler__matchOperationPreflightCheck___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeIdentity];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[16];

  return [v2 enrollOperation:v3 failedWithReason:2];
}

- (void)cancelEnrollPreserveIdentity
{
  [(BKUIFaceIDEnrollOperationsHandler *)self _cleanupEnroll:0];
  uint64_t v3 = [(BKUIFaceIDEnrollOperationsHandler *)self matchOperation];
  [v3 cancelMatchOperation];

  [(NSMutableArray *)self->_poseStatus removeAllObjects];
  self->_bioKitCompletionPercentage = 0.0;
  lastFaceFoundDate = self->_lastFaceFoundDate;
  self->_lastFaceFoundDate = 0;
}

- (void)cancelEnroll
{
  [(BKUIFaceIDEnrollOperationsHandler *)self _removeIdentity];

  [(BKUIFaceIDEnrollOperationsHandler *)self cancelEnrollPreserveIdentity];
}

- (void)_removeIdentity
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BKUIFaceIDEnrollOperationsHandler *)self identity];

  if (v3 && ![(BKUIFaceIDEnrollOperationsHandler *)self isEnrollmentAugmentationOnly])
  {
    id v4 = _BKUILoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(BKUIFaceIDEnrollOperationsHandler *)self identity];
      *(_DWORD *)id buf = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1E4B6C000, v4, OS_LOG_TYPE_DEFAULT, "Removing identity: %@", buf, 0xCu);
    }
    [(BKUIFaceIDEnrollOperationsHandler *)self setCanStartEnrollmentOperation:0];
    uint64_t v6 = [(BKUIFaceIDEnrollOperationsHandler *)self device];
    id v7 = [(BKUIFaceIDEnrollOperationsHandler *)self identity];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__BKUIFaceIDEnrollOperationsHandler__removeIdentity__block_invoke;
    v8[3] = &unk_1E6EA26A8;
    v8[4] = self;
    [v6 removeIdentity:v7 reply:v8];
  }
}

void __52__BKUIFaceIDEnrollOperationsHandler__removeIdentity__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__BKUIFaceIDEnrollOperationsHandler__removeIdentity__block_invoke_2;
  block[3] = &unk_1E6EA2680;
  uint64_t v6 = *(void *)(a1 + 32);
  char v10 = a2;
  void block[4] = v6;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __52__BKUIFaceIDEnrollOperationsHandler__removeIdentity__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setCanStartEnrollmentOperation:1];
  id v2 = [*(id *)(a1 + 32) operationsDelegate];
  [v2 updateButtonsVisibility];

  if (!*(unsigned char *)(a1 + 48) || *(void *)(a1 + 40))
  {
    uint64_t v3 = _BKUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "Failed removing identity: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)advanceEnrollmentState
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  uint64_t v4 = NSString;
  uint64_t v5 = (int)(self->_bioKitCompletionPercentage * 100.0);
  uint64_t v6 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  [v6 percentOfPillsCompleted];
  id v8 = [v4 stringWithFormat:@"BioKit: %d%%, rings: %d%%", v5, (int)(v7 * 100.0)];
  [v3 setProgressString:v8];

  id v9 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  [v9 _updateDebugLabel];

  char v10 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  [v10 percentOfPillsCompleted];
  double v12 = v11;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v13 = self->_poseStatus;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v56;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v56 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v55 + 1) + 8 * v17++) integerValue];
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v15);
  }

  id v18 = _BKUILoggingFacility();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
    int v20 = [v19 state];
    int v21 = (int)(self->_bioKitCompletionPercentage * 100.0);
    id v22 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
    [v22 percentOfPillsCompleted];
    *(_DWORD *)id buf = 134218752;
    double v60 = v12;
    __int16 v61 = 1024;
    *(_DWORD *)v62 = v20;
    *(_WORD *)&v62[4] = 1024;
    *(_DWORD *)&v62[6] = v21;
    LOWORD(v63[0]) = 1024;
    *(_DWORD *)((char *)v63 + 2) = (int)(v23 * 100.0);
    _os_log_impl(&dword_1E4B6C000, v18, OS_LOG_TYPE_DEFAULT, "advanceEnrollmentState evaluate next state for advancement... percentPillsCompleted:%f state:%i BioKit: %d%%, rings: %d%%", buf, 0x1Eu);
  }
  uint64_t v24 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  int v25 = [v24 state];

  if (v25 == 5 && v12 >= 1.0)
  {
    id v26 = _BKUILoggingFacility();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1E4B6C000, v26, OS_LOG_TYPE_DEFAULT, "Finishing 1st enroll operation...", buf, 2u);
    }

    uint64_t v27 = [(BKUIFaceIDEnrollOperationsHandler *)self enrollOperation];
    uint64_t v28 = [v27 state];

    if (v28 != 4)
    {
      id v29 = [(BKUIFaceIDEnrollOperationsHandler *)self enrollOperation];
      id v54 = 0;
      int v30 = [v29 completeWithError:&v54];
      id v31 = v54;

      id v32 = _BKUILoggingFacility();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (v33)
        {
          *(_WORD *)id buf = 0;
          _os_log_impl(&dword_1E4B6C000, v32, OS_LOG_TYPE_DEFAULT, "1st Enroll  operation marked as completed!", buf, 2u);
        }

        if ([(BKUIFaceIDEnrollOperationsHandler *)self isEnrollmentAugmentationOnly])
        {
          BOOL v34 = [(BKUIFaceIDEnrollOperationsHandler *)self isEnrollmentAugmentationOnly];
          BOOL v35 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
          uint64_t v36 = v35;
          if (v34) {
            double v37 = 0.5;
          }
          else {
            double v37 = 0.1;
          }
        }
        else
        {
          BOOL v35 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
          uint64_t v36 = v35;
          double v37 = 1.0;
        }
        uint64_t v50 = 6;
        goto LABEL_47;
      }
      if (v33)
      {
        *(_DWORD *)id buf = 138412290;
        double v60 = *(double *)&v31;
        _os_log_impl(&dword_1E4B6C000, v32, OS_LOG_TYPE_DEFAULT, "Failed to complete 1st enroll: %@", buf, 0xCu);
      }

      uint64_t v36 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
      [NSString stringWithFormat:@"Failed to complete 1st enroll: %@", v31, v52];
      goto LABEL_43;
    }
  }
  else
  {
    id v31 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
    if ([v31 state] != 7 || v12 < 1.0) {
      goto LABEL_49;
    }
    double bioKitCompletionPercentage = self->_bioKitCompletionPercentage;

    if (bioKitCompletionPercentage >= 1.0)
    {
      if ([(BKUIFaceIDEnrollOperationsHandler *)self supportsPeriocularEnrollment]) {
        __int16 v39 = @"extended";
      }
      else {
        __int16 v39 = &stru_1F4081468;
      }
      id v40 = _BKUILoggingFacility();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        double v41 = self->_bioKitCompletionPercentage;
        v42 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
        int v43 = [v42 state];
        *(_DWORD *)id buf = 138412802;
        double v60 = *(double *)&v39;
        __int16 v61 = 2048;
        *(double *)v62 = v41;
        *(_WORD *)&v62[8] = 1024;
        v63[0] = v43 == 7;
        _os_log_impl(&dword_1E4B6C000, v40, OS_LOG_TYPE_DEFAULT, "Finishing %@ enroll operation... %f %i", buf, 0x1Cu);
      }
      if ([(BKEnrollPearlOperation *)self->_enrollOperation state] != 4)
      {
        id v53 = 0;
        BOOL v44 = [(BKUIFaceIDEnrollOperationsHandler *)self _completeOperationWithError:&v53];
        id v31 = v53;
        v45 = _BKUILoggingFacility();
        BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
        if (v44)
        {
          if (v46)
          {
            *(_DWORD *)id buf = 138412290;
            double v60 = *(double *)&v39;
            _os_log_impl(&dword_1E4B6C000, v45, OS_LOG_TYPE_DEFAULT, "%@ enroll operation marked as completed!", buf, 0xCu);
          }

          unint64_t v47 = [(BKUIFaceIDEnrollOperationsHandler *)self enrollmentConfiguration];
          v48 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
          uint64_t v36 = v48;
          if (!v47
            || (int v49 = [v48 state],
                v36,
                [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate],
                uint64_t v36 = objc_claimAutoreleasedReturnValue(),
                v49 == 7))
          {
            double v37 = 0.5;
            BOOL v35 = v36;
            uint64_t v50 = 8;
LABEL_47:
            [v35 setState:v50 animated:1 afterDelay:v37];
            goto LABEL_48;
          }
          v51 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
          objc_msgSend(v36, "setState:animated:afterDelay:", objc_msgSend(v51, "state") + 1, 1, 0.5);
LABEL_44:

LABEL_48:
LABEL_49:

          return;
        }
        if (v46)
        {
          *(_DWORD *)id buf = 138412546;
          double v60 = *(double *)&v39;
          __int16 v61 = 2112;
          *(void *)v62 = v31;
          _os_log_impl(&dword_1E4B6C000, v45, OS_LOG_TYPE_DEFAULT, "Failed to complete %@ enroll operation: %@", buf, 0x16u);
        }

        uint64_t v36 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
        [NSString stringWithFormat:@"Failed to complete %@ enroll: %@", v39, v31];
        v51 = LABEL_43:;
        [v36 setStatus:v51];
        goto LABEL_44;
      }
    }
  }
}

- (BOOL)showAddGlassesButton
{
  return 0;
}

- (void)operation:(id)a3 faceDetectStateChanged:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__BKUIFaceIDEnrollOperationsHandler_operation_faceDetectStateChanged___block_invoke;
  v7[3] = &unk_1E6EA2180;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __70__BKUIFaceIDEnrollOperationsHandler_operation_faceDetectStateChanged___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) tooCloseToCamera])
  {
    id v2 = [*(id *)(a1 + 40) operationsDelegate];
    [v2 setStatus:@"Too close to camera"];
    int v3 = 0;
    char v4 = 0;
    uint64_t v5 = 1;
    goto LABEL_17;
  }
  if ([*(id *)(a1 + 32) tooFarFromCamera])
  {
    id v2 = [*(id *)(a1 + 40) operationsDelegate];
    [v2 setStatus:@"Too far from camera"];
    int v3 = 0;
    char v4 = 0;
    uint64_t v5 = 2;
    goto LABEL_17;
  }
  if ([*(id *)(a1 + 32) multipleFaces])
  {
    id v2 = [*(id *)(a1 + 40) operationsDelegate];
    [v2 setStatus:@"Multiple faces in view"];
    int v3 = 0;
    char v4 = 0;
    uint64_t v5 = 4;
    goto LABEL_17;
  }
  if ([*(id *)(a1 + 32) flare])
  {
    id v2 = [*(id *)(a1 + 40) operationsDelegate];
    [v2 setStatus:@"Bright light on camera"];
    int v3 = 0;
    char v4 = 0;
    uint64_t v5 = 7;
    goto LABEL_17;
  }
  if ([*(id *)(a1 + 32) partiallyOutOfView])
  {
    id v6 = [*(id *)(a1 + 40) operationsDelegate];
    id v2 = v6;
    double v7 = @"Face not fully visible";
  }
  else
  {
    if ([*(id *)(a1 + 32) occlusion])
    {
      id v2 = [*(id *)(a1 + 40) operationsDelegate];
      [v2 setStatus:@"Face is occluded"];
      int v3 = 0;
      char v4 = 0;
      uint64_t v5 = 8;
      goto LABEL_17;
    }
    int v8 = [*(id *)(a1 + 32) faceDetected];
    id v6 = [*(id *)(a1 + 40) operationsDelegate];
    id v2 = v6;
    if (v8)
    {
      [v6 setStatus:@"Face found!"];
      char v4 = 0;
      uint64_t v5 = 0;
      int v3 = 1;
      goto LABEL_17;
    }
    double v7 = @"No face in view";
  }
  [v6 setStatus:v7];
  int v3 = 0;
  uint64_t v5 = 9;
  char v4 = 1;
LABEL_17:

  if ([*(id *)(a1 + 32) faceDetected])
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v10 = *(void *)(a1 + 40);
    double v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 72) count];
  uint64_t v13 = *(id **)(a1 + 40);
  if (v12)
  {
    uint64_t v14 = [v13[9] objectAtIndexedSubscript:8];
    objc_msgSend(*(id *)(a1 + 40), "setCenterBinComplete:", objc_msgSend(v14, "integerValue") == 3);
  }
  else
  {
    [v13 setCenterBinComplete:0];
  }
  uint64_t v15 = [*(id *)(a1 + 40) operationsDelegate];
  int v16 = [v15 state];

  if ((v3 & [*(id *)(a1 + 32) faceDetected]) == 1 && v16 == 3)
  {
    if (([*(id *)(a1 + 40) centerBinComplete] & 1) == 0)
    {
      uint64_t v17 = [*(id *)(a1 + 40) operationsDelegate];
      id v18 = v17;
      uint64_t v19 = 4;
LABEL_30:
      [v17 setState:v19 animated:1];
LABEL_54:

      goto LABEL_55;
    }
  }
  else
  {
    if (v16 == 4)
    {
      if (*(void *)(*(void *)(a1 + 40) + 40))
      {
        int v20 = [MEMORY[0x1E4F1C9C8] date];
        [v20 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 40) + 40)];
        double v22 = v21;

        if (v22 > 2.0)
        {
          uint64_t v17 = [*(id *)(a1 + 40) operationsDelegate];
          id v18 = v17;
          uint64_t v19 = 3;
          goto LABEL_30;
        }
      }
      goto LABEL_46;
    }
    if ((v16 & 0xFFFFFFFD) == 5)
    {
      if (*(void *)(*(void *)(a1 + 40) + 40))
      {
        double v23 = [MEMORY[0x1E4F1C9C8] date];
        [v23 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 40) + 40)];
        if (v24 <= 1.15)
        {
        }
        else
        {
          int v25 = [*(id *)(a1 + 40) operationsDelegate];
          id v26 = [v25 getEnrollview];
          [v26 percentOfPillsCompleted];
          double v28 = v27;

          if (v28 < 1.0)
          {
            id v29 = [*(id *)(a1 + 40) operationsDelegate];
            [v29 setState:3 animated:1];

            int v30 = [*(id *)(a1 + 40) operationsDelegate];
            id v31 = [v30 audioManager];
            id v32 = [*(id *)(a1 + 40) operationsDelegate];
            objc_msgSend(v31, "triggerSoundHapticForTransitionToSubstate:fromSubstate:", 9, objc_msgSend(v32, "substate"));

            id v18 = [*(id *)(a1 + 40) operationsDelegate];
            [v18 setSubstate:9];
            goto LABEL_54;
          }
        }
      }
      goto LABEL_46;
    }
  }
  char v33 = v3 ^ 1;
  if (v16 != 3) {
    char v33 = 1;
  }
  if ((v33 & 1) == 0
    && [*(id *)(a1 + 40) centerBinComplete]
    && [*(id *)(a1 + 32) faceDetected])
  {
    BOOL v34 = [*(id *)(a1 + 40) operationsDelegate];
    if ([v34 previousState] == 5)
    {

LABEL_45:
      id v18 = [*(id *)(a1 + 40) operationsDelegate];
      double v37 = [*(id *)(a1 + 40) operationsDelegate];
      objc_msgSend(v18, "setState:animated:", objc_msgSend(v37, "previousState"), 1);

      goto LABEL_54;
    }
    BOOL v35 = [*(id *)(a1 + 40) operationsDelegate];
    int v36 = [v35 previousState];

    if (v36 == 7) {
      goto LABEL_45;
    }
  }
LABEL_46:
  int64_t v38 = *(void **)(a1 + 40);
  if (v38[5]) {
    char v39 = 0;
  }
  else {
    char v39 = v4;
  }
  if ((v39 & 1) == 0)
  {
    id v40 = [v38 operationsDelegate];
    int v41 = [v40 substate];

    v42 = [*(id *)(a1 + 40) operationsDelegate];
    id v18 = v42;
    if (v41) {
      double v43 = 4.0;
    }
    else {
      double v43 = 1.25;
    }
    [v42 setSubstate:v5 animated:1 afterDelay:v43];
    goto LABEL_54;
  }
LABEL_55:
  if (([*(id *)(a1 + 32) occlusion] & 1) == 0)
  {
    BOOL v44 = [*(id *)(a1 + 40) operationsDelegate];
    v45 = [v44 getEnrollview];
    [v45 updateWithFaceState:*(void *)(a1 + 32)];

    [*(id *)(a1 + 40) advanceEnrollmentState];
    BOOL v46 = *(double **)(a1 + 40);
    if (v46[15] >= 1.0)
    {
      id v47 = [v46 operationsDelegate];
      [v47 refreshEscapeHatchForCurrentState];
    }
  }
}

- (void)enrollOperation:(id)a3 percentCompleted:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_percentCompleted___block_invoke;
  v4[3] = &unk_1E6EA26D0;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_percentCompleted___block_invoke(uint64_t a1)
{
  *(double *)(*(void *)(a1 + 32) + 120) = (double)*(uint64_t *)(a1 + 40) / 100.0;
  return [*(id *)(a1 + 32) advanceEnrollmentState];
}

- (void)enrollOperation:(id)a3 finishedWithEnrollResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 enrolledIdentity];
  if (!v8) {
    -[BKUIFaceIDEnrollOperationsHandler enrollOperation:finishedWithEnrollResult:]();
  }
  uint64_t v9 = (void *)v8;
  if ([v7 glassesDetected]
    && ![v6 periocularGlassesRequirement]
    && [v6 enrollmentType] == 3)
  {
    uint64_t v10 = _BKUILoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1E4B6C000, v10, OS_LOG_TYPE_DEFAULT, "glasses found!", v12, 2u);
    }

    [(BKUIFaceIDEnrollOperationsHandler *)self setGlassesFound:1];
  }
  double v11 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  [v11 enrollOperation:v6 finishedWithIdentity:v9 animateImmediately:0];

  [(BKUIFaceIDEnrollOperationsHandler *)self _cleanupEnroll];
}

- (void)enrollOperation:(id)a3 failedWithReason:(int64_t)a4
{
  id v6 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
  {
    [(BKUIFaceIDEnrollOperationsHandler *)self setGlassesEnforcementError:1];
    if (a4 == 11)
    {
      if ([(BKUIFaceIDEnrollOperationsHandler *)self glassesRequirement] == 2) {
        int v7 = 12;
      }
      else {
        int v7 = 13;
      }
    }
    else
    {
      int v7 = 14;
    }
    dispatch_time_t v8 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke;
    block[3] = &unk_1E6EA26F8;
    void block[4] = self;
    int v11 = v7;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
  else if (a4 != 1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke_3;
    v9[3] = &unk_1E6EA26D0;
    v9[4] = self;
    void v9[5] = a4;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

void __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) operationsDelegate];
  [v2 setState:3 animated:1];

  int v3 = [*(id *)(a1 + 32) operationsDelegate];
  [v3 setSubstate:*(unsigned int *)(a1 + 40) animated:1 afterDelay:0.0];

  dispatch_time_t v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke_2;
  block[3] = &unk_1E6EA20C0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

void __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) operationsDelegate];
  [v1 refreshEscapeHatchForCurrentState];
}

void __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke_3(uint64_t a1)
{
  id v2 = _BKUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke_3_cold_1(a1, v2);
  }

  [*(id *)(a1 + 32) _removeIdentity];
  int v3 = [*(id *)(a1 + 32) operationsDelegate];
  dispatch_time_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Enroll failed with reason %d", *(void *)(a1 + 40));
  [v3 setStatus:v4];

  uint64_t v5 = [*(id *)(a1 + 32) operationsDelegate];
  id v6 = [v5 getEnrollview];
  [v6 setFailed];

  int v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.biometrickitui.biokit" code:*(void *)(a1 + 40) userInfo:0];
  dispatch_time_t v8 = [*(id *)(a1 + 32) operationsDelegate];
  [v8 endEnrollFlowWithError:v7];
}

- (void)matchOperation:(id)a3 failedToMatchWithUserPositionSubstate:(int)a4 operationCompleteAction:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__BKUIFaceIDEnrollOperationsHandler_matchOperation_failedToMatchWithUserPositionSubstate_operationCompleteAction___block_invoke;
  v5[3] = &unk_1E6EA26F8;
  v5[4] = self;
  int v6 = a4;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __114__BKUIFaceIDEnrollOperationsHandler_matchOperation_failedToMatchWithUserPositionSubstate_operationCompleteAction___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) operationsDelegate];
  int v3 = objc_msgSend(NSString, "stringWithFormat:", @"Enroll failed with last substate %d", *(unsigned int *)(a1 + 40));
  [v2 setStatus:v3];

  dispatch_time_t v4 = [*(id *)(a1 + 32) matchOperation];
  uint64_t v5 = [v4 failReason];

  int v6 = *(void **)(a1 + 32);
  if (v5 == -9999)
  {
    if ([v6 isEnrollmentAugmentationOnly]) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 6;
    }
    dispatch_time_t v8 = _BKUILoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)id buf = 67109120;
      int v17 = v9;
      _os_log_impl(&dword_1E4B6C000, v8, OS_LOG_TYPE_DEFAULT, "PearlMatchOperation: BKUIMatchVerifyFailReasonStartFailed failed to start match operation error = %d .... showing RetryUI", buf, 8u);
    }

    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.biometrickitui.biokit" code:v7 userInfo:0];
    int v11 = [*(id *)(a1 + 32) operationsDelegate];
    [v11 endEnrollFlowWithError:v10];
  }
  else
  {
    uint64_t v12 = [v6 matchOperation];
    uint64_t v13 = [*(id *)(a1 + 32) matchOperation];
    objc_msgSend(v12, "moveEnrollStateToNeedsPositioning:", objc_msgSend(v13, "lastErrorousSubState"));

    if (([*(id *)(a1 + 32) shouldShowRetryUI] & 1) == 0)
    {
      uint64_t v14 = [*(id *)(a1 + 32) matchOperation];
      [v14 retryMatchOperation];
    }
    uint64_t v10 = _BKUILoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)id buf = 67109120;
      int v17 = v15;
      _os_log_impl(&dword_1E4B6C000, v10, OS_LOG_TYPE_DEFAULT, "PearlMatchOperation: failedToMatchWithUserPositionSubstate to enroll, error = %d .... showing RetryUI start retry", buf, 8u);
    }
  }
}

- (BOOL)_validateEnrolledPoses:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4 != 3)
  {
    uint64_t v11 = v4;
    uint64_t v12 = _BKUILoggingFacility();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v16 = 134218240;
    uint64_t v17 = v11;
    __int16 v18 = 2048;
    uint64_t v19 = 3;
    uint64_t v13 = "Error: Unexpected number of enrolled poses, there are %lu rows, expected %lu";
LABEL_11:
    _os_log_impl(&dword_1E4B6C000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0x16u);
    goto LABEL_12;
  }
  uint64_t v5 = [v3 objectAtIndexedSubscript:0];
  uint64_t v6 = [v5 count];

  if (v6 != 3)
  {
    uint64_t v12 = _BKUILoggingFacility();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v16 = 134218240;
    uint64_t v17 = v6;
    __int16 v18 = 2048;
    uint64_t v19 = 3;
    uint64_t v13 = "Error: Unexpected number of enrolled poses, there are %lu cols, expected %lu";
    goto LABEL_11;
  }
  uint64_t v7 = 0;
  while (1)
  {
    dispatch_time_t v8 = [v3 objectAtIndexedSubscript:v7];
    uint64_t v9 = [v8 count];

    if (v9 != 3) {
      break;
    }
    if (++v7 == 3)
    {
      BOOL v10 = 1;
      goto LABEL_13;
    }
  }
  uint64_t v12 = _BKUILoggingFacility();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = [v3 objectAtIndexedSubscript:v7];
    int v16 = 134218496;
    uint64_t v17 = v7;
    __int16 v18 = 2048;
    uint64_t v19 = [v15 count];
    __int16 v20 = 2048;
    uint64_t v21 = 3;
    _os_log_impl(&dword_1E4B6C000, v12, OS_LOG_TYPE_DEFAULT, "Error: Unexpected number of enrolled poses, row %lu has %lu cols, expected %lu!", (uint8_t *)&v16, 0x20u);
  }
LABEL_12:

  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (void)enrollOperation:(id)a3 progressedWithInfo:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__BKUIFaceIDEnrollOperationsHandler_enrollOperation_progressedWithInfo___block_invoke;
  v7[3] = &unk_1E6EA2180;
  id v8 = v5;
  uint64_t v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __72__BKUIFaceIDEnrollOperationsHandler_enrollOperation_progressedWithInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) enrolledPoses];
  if ([*(id *)(a1 + 40) _validateEnrolledPoses:v2])
  {
    [*(id *)(*(void *)(a1 + 40) + 72) removeAllObjects];
    id v3 = *(void **)(*(void *)(a1 + 40) + 72);
    uint64_t v4 = [v2 objectAtIndexedSubscript:1];
    id v5 = [v4 objectAtIndexedSubscript:2];
    [v3 addObject:v5];

    id v6 = *(void **)(*(void *)(a1 + 40) + 72);
    uint64_t v7 = [v2 objectAtIndexedSubscript:0];
    id v8 = [v7 objectAtIndexedSubscript:2];
    [v6 addObject:v8];

    uint64_t v9 = *(void **)(*(void *)(a1 + 40) + 72);
    BOOL v10 = [v2 objectAtIndexedSubscript:0];
    uint64_t v11 = [v10 objectAtIndexedSubscript:1];
    [v9 addObject:v11];

    uint64_t v12 = *(void **)(*(void *)(a1 + 40) + 72);
    uint64_t v13 = [v2 objectAtIndexedSubscript:0];
    uint64_t v14 = [v13 objectAtIndexedSubscript:0];
    [v12 addObject:v14];

    int v15 = *(void **)(*(void *)(a1 + 40) + 72);
    int v16 = [v2 objectAtIndexedSubscript:1];
    uint64_t v17 = [v16 objectAtIndexedSubscript:0];
    [v15 addObject:v17];

    __int16 v18 = *(void **)(*(void *)(a1 + 40) + 72);
    uint64_t v19 = [v2 objectAtIndexedSubscript:2];
    __int16 v20 = [v19 objectAtIndexedSubscript:0];
    [v18 addObject:v20];

    uint64_t v21 = *(void **)(*(void *)(a1 + 40) + 72);
    uint64_t v22 = [v2 objectAtIndexedSubscript:2];
    double v23 = [v22 objectAtIndexedSubscript:1];
    [v21 addObject:v23];

    double v24 = *(void **)(*(void *)(a1 + 40) + 72);
    int v25 = [v2 objectAtIndexedSubscript:2];
    id v26 = [v25 objectAtIndexedSubscript:2];
    [v24 addObject:v26];

    double v27 = *(void **)(*(void *)(a1 + 40) + 72);
    double v28 = [v2 objectAtIndexedSubscript:1];
    id v29 = [v28 objectAtIndexedSubscript:1];
    [v27 addObject:v29];

    int v30 = [*(id *)(*(void *)(a1 + 40) + 72) objectAtIndexedSubscript:8];
    id v31 = (void *)[v30 integerValue];

    if (v31 != (void *)3)
    {
LABEL_21:
      id v47 = [*(id *)(a1 + 40) operationsDelegate];
      v48 = [v47 getEnrollview];
      [v48 updateWithProgress:*(void *)(a1 + 32)];

      [*(id *)(a1 + 40) advanceEnrollmentState];
      goto LABEL_22;
    }
    id v32 = [*(id *)(a1 + 40) operationsDelegate];
    int v33 = [v32 state];
    if (v33 != 3)
    {
      id v31 = [*(id *)(a1 + 40) operationsDelegate];
      if ([v31 state] != 4) {
        goto LABEL_7;
      }
    }
    BOOL v34 = [*(id *)(a1 + 40) operationsDelegate];
    if ([v34 previousState] != 5)
    {
      BOOL v35 = [*(id *)(a1 + 40) operationsDelegate];
      int v36 = [v35 previousState];

      if (v33 != 3) {
      if (v36 == 7)
      }
        goto LABEL_21;
      if ([*(id *)(a1 + 32) percentageCompleted] != 100)
      {
        double v37 = [MEMORY[0x1E4F42948] currentDevice];
        int v38 = objc_msgSend(v37, "bkui_IsInternalInstall");

        if (v38)
        {
          char v39 = _BKUILoggingFacility();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)int v49 = 0;
            _os_log_impl(&dword_1E4B6C000, v39, OS_LOG_TYPE_DEFAULT, "enroll progress not complete on first pose ...", v49, 2u);
          }

          id v40 = +[BKUIAlertController alertControllerWithTitle:@"BioCapture Error" message:@"(Internal) Center bin complete without enroll completion. Please run \"/usr/libexec/seputil --get TRBC > trbc.trace\" and attach the resulting file to a radar against Pearl ID // New Bugs." preferredStyle:1];
          int v41 = [MEMORY[0x1E4F42720] actionWithTitle:@"OK" style:0 handler:0];
          [v40 addAction:v41];

          v42 = [*(id *)(a1 + 40) operationsDelegate];
          [v42 presentViewController:v40 animated:1 completion:0];
        }
      }
      double v43 = [*(id *)(a1 + 40) operationsDelegate];
      [v43 clearPendingStateWorkItems];

      uint64_t v44 = [*(id *)(*(void *)(a1 + 40) + 128) enrollmentType];
      v45 = [*(id *)(a1 + 40) operationsDelegate];
      id v32 = v45;
      if (v44 == 1) {
        uint64_t v46 = 5;
      }
      else {
        uint64_t v46 = 7;
      }
      [v45 setState:v46 animated:1];
      goto LABEL_20;
    }

    if (v33 != 3) {
LABEL_7:
    }

LABEL_20:
    goto LABEL_21;
  }
LABEL_22:
}

- (id)getAuthContextForCredentialError:(id *)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(BKUIFaceIDEnrollOperationsHandler *)self credential];
  if (v5)
  {

LABEL_4:
    uint64_t v7 = [(BKUIFaceIDEnrollOperationsHandler *)self credential];

    LAContextClass = getLAContextClass();
    if (v7)
    {
      uint64_t v9 = (LAContext *)objc_opt_new();
      authContext = self->_authContext;
      self->_authContext = v9;
    }
    else
    {
      id v11 = [LAContextClass alloc];
      authContext = [(BKUIFaceIDEnrollOperationsHandler *)self externalizedAuthContext];
      uint64_t v12 = (LAContext *)[v11 initWithExternalizedContext:authContext];
      uint64_t v13 = self->_authContext;
      self->_authContext = v12;
    }
    [(LAContext *)self->_authContext setUiDelegate:self];
    uint64_t v14 = self->_authContext;
    int v25 = &unk_1F40947D0;
    v26[0] = &unk_1F40947E8;
    int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    id v22 = 0;
    id v16 = (id)[(LAContext *)v14 evaluatePolicy:1007 options:v15 error:&v22];
    id v17 = v22;

    if (v17)
    {
      __int16 v18 = _BKUILoggingFacility();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138412290;
        id v24 = v17;
        _os_log_impl(&dword_1E4B6C000, v18, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Error evaluating policy: %@", buf, 0xCu);
      }

      uint64_t v19 = 0;
      if (a3) {
        *a3 = v17;
      }
    }
    else
    {
      uint64_t v19 = [(LAContext *)self->_authContext externalizedContext];
    }

    goto LABEL_14;
  }
  id v6 = [(BKUIFaceIDEnrollOperationsHandler *)self externalizedAuthContext];

  if (v6) {
    goto LABEL_4;
  }
  if (self->_authContext)
  {
    uint64_t v21 = _BKUILoggingFacility();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1E4B6C000, v21, OS_LOG_TYPE_DEFAULT, "Using cached authentication context", buf, 2u);
    }

    uint64_t v19 = [(LAContext *)self->_authContext externalizedContext];
  }
  else
  {
    uint64_t v19 = 0;
  }
LABEL_14:

  return v19;
}

- (BOOL)_startOperationWithError:(id *)a3
{
  return [(BKEnrollPearlOperation *)self->_enrollOperation startWithError:a3];
}

- (BOOL)_completeOperationWithError:(id *)a3
{
  uint64_t v4 = [(BKUIFaceIDEnrollOperationsHandler *)self enrollOperation];
  LOBYTE(a3) = [v4 completeWithError:a3];

  return (char)a3;
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v8 = a5;
  if (a3 == 2)
  {
    uint64_t v9 = [a4 objectForKey:&unk_1F4094800];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      authContext = self->_authContext;
      uint64_t v12 = [(BKUIFaceIDEnrollOperationsHandler *)self credential];
      uint64_t v13 = [v12 dataUsingEncoding:4];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __56__BKUIFaceIDEnrollOperationsHandler_event_params_reply___block_invoke;
      v14[3] = &unk_1E6EA2720;
      id v15 = v8;
      [(LAContext *)authContext setCredential:v13 forProcessedEvent:2 credentialType:-1 reply:v14];
    }
  }
}

uint64_t __56__BKUIFaceIDEnrollOperationsHandler_event_params_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldShowRetryUI
{
  if ([(BKUIFaceIDEnrollOperationsHandler *)self glassesEnforcementError]) {
    return 1;
  }
  uint64_t v4 = [(BKUIFaceIDEnrollOperationsHandler *)self matchOperation];
  if (v4)
  {
    id v5 = [(BKUIFaceIDEnrollOperationsHandler *)self matchOperation];
    id v6 = [v5 matchedIdentity];
    if (v6)
    {
      BOOL v3 = 0;
    }
    else
    {
      uint64_t v7 = [(BKUIFaceIDEnrollOperationsHandler *)self matchOperation];
      BOOL v3 = [v7 failReason] == 1;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isEnrollmentAugmentationOnly
{
  return [(BKUIFaceIDEnrollOperationsHandler *)self enrollmentConfiguration] == 3
      || [(BKUIFaceIDEnrollOperationsHandler *)self enrollmentConfiguration] == 4;
}

- (BKUIPearlEnrollOperationsDelegate)operationsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operationsDelegate);

  return (BKUIPearlEnrollOperationsDelegate *)WeakRetained;
}

- (void)retryPressed
{
  if ([(BKUIFaceIDEnrollOperationsHandler *)self glassesEnforcementError])
  {
    [(BKUIFaceIDEnrollOperationsHandler *)self retryOperation];
  }
  else
  {
    BOOL v3 = [(BKUIFaceIDEnrollOperationsHandler *)self matchOperation];
    [v3 retryMatchOperation];

    id v4 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
    [v4 setSubstate:0 animated:1 afterDelay:0.0];
  }
}

- (id)getAuthContextForCredentialError:(id *)a3 authContext:(id *)a4
{
  id v6 = [(BKUIFaceIDEnrollOperationsHandler *)self getAuthContextForCredentialError:a3];
  *a4 = self->_authContext;

  return v6;
}

- (int64_t)glassesRequirement
{
  if ([(BKUIFaceIDEnrollOperationsHandler *)self enrollmentConfiguration] == 4) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (id)handlersForEnrollmentConfiguration:(unint64_t)a3 inBuddy:(BOOL)a4 delegate:(id)a5 credential:(id)a6 externalizedAuthContext:(id)a7
{
  BOOL v9 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  id v15 = [[BKUIFaceIDEnrollOperationsHandler alloc] initWithBKPearlEnrollmentType:1];
  if ([(BKUIFaceIDEnrollOperationsHandler *)v15 supportsPeriocularEnrollment])
  {
    double v28 = v15;
    [v14 addObject:v15];
    switch(a3)
    {
      case 0uLL:
        id v16 = [BKUIFaceIDEnrollOperationsHandler alloc];
        uint64_t v17 = 2;
        goto LABEL_8;
      case 1uLL:
        goto LABEL_6;
      case 3uLL:
        [v14 removeAllObjects];
LABEL_6:
        uint64_t v19 = [[BKUIFaceIDEnrollOperationsHandler alloc] initWithBKPearlEnrollmentType:3];
        __int16 v20 = [(BKUIFaceIDEnrollOperationsHandler *)[BKUIFaceIDEnrollGlassesOperationsHandler alloc] initWithBKPearlEnrollmentType:3];
        [v14 addObject:v19];
        [v14 addObject:v20];

        goto LABEL_9;
      case 4uLL:
        [v14 removeAllObjects];
        id v16 = [BKUIFaceIDEnrollGlassesOperationsHandler alloc];
        uint64_t v17 = 3;
LABEL_8:
        uint64_t v19 = [(BKUIFaceIDEnrollOperationsHandler *)v16 initWithBKPearlEnrollmentType:v17];
        [v14 addObject:v19];
LABEL_9:

        break;
      default:
        break;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v29 = v14;
    id v21 = v14;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          [v26 setOperationsDelegate:v11];
          [v26 setInbuddy:v9];
          [v26 setEnrollmentConfiguration:a3];
          [v26 setCredential:v12];
          [v26 setExternalizedAuthContext:v13];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v23);
    }

    id v18 = v21;
    id v15 = v28;
    uint64_t v14 = v29;
  }
  else
  {
    id v18 = +[BKUILegacyOperationsHandler handlersForEnrollmentConfiguration:a3 inBuddy:v9 delegate:v11 credential:v12 externalizedAuthContext:v13];
  }

  return v18;
}

- (id)bkIdentities
{
  id v2 = [(BKUIFaceIDEnrollOperationsHandler *)self device];
  id v7 = 0;
  BOOL v3 = [v2 identitiesWithError:&v7];
  id v4 = v7;

  if (v4)
  {
    id v5 = _BKUILoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(BKUIFaceIDEnrollOperationsHandler *)v4 bkIdentities];
    }
  }

  return v3;
}

- (void)setOperationsDelegate:(id)a3
{
}

- (NSString)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (BOOL)isSuspended
{
  return self->_suspend;
}

- (BOOL)inbuddy
{
  return self->_inbuddy;
}

- (void)setInbuddy:(BOOL)a3
{
  self->_inbuddy = a3;
}

- (NSMutableArray)poseStatus
{
  return self->_poseStatus;
}

- (void)setPoseStatus:(id)a3
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

- (int64_t)enrollmentType
{
  return self->_enrollmentType;
}

- (void)setEnrollmentType:(int64_t)a3
{
  self->_enrollmentType = a3;
}

- (BKDevicePearl)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BKIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (NSData)externalizedAuthContext
{
  return self->_externalizedAuthContext;
}

- (void)setExternalizedAuthContext:(id)a3
{
}

- (double)bioKitCompletionPercentage
{
  return self->_bioKitCompletionPercentage;
}

- (void)setBioKitCompletionPercentage:(double)a3
{
  self->_double bioKitCompletionPercentage = a3;
}

- (BOOL)canStartEnrollmentOperation
{
  return self->_canStartEnrollmentOperation;
}

- (void)setCanStartEnrollmentOperation:(BOOL)a3
{
  self->_canStartEnrollmentOperation = a3;
}

- (BOOL)glassesFound
{
  return self->_glassesFound;
}

- (void)setGlassesFound:(BOOL)a3
{
  self->_glassesFound = a3;
}

- (BOOL)glassesEnforcementError
{
  return self->_glassesEnforcementError;
}

- (void)setGlassesEnforcementError:(BOOL)a3
{
  self->_glassesEnforcementError = a3;
}

- (BKEnrollPearlOperation)enrollOperation
{
  return self->_enrollOperation;
}

- (void)setEnrollOperation:(id)a3
{
}

- (BOOL)centerBinComplete
{
  return self->_centerBinComplete;
}

- (void)setCenterBinComplete:(BOOL)a3
{
  self->_centerBinComplete = a3;
}

- (BOOL)userSelectedUseAccessibilityEnrollment
{
  return self->_userSelectedUseAccessibilityEnrollment;
}

- (void)setUserSelectedUseAccessibilityEnrollment:(BOOL)a3
{
  self->_userSelectedUseAccessibilityEnrollment = a3;
}

- (BKUIMatchVerifyPearlOperation)matchOperation
{
  return self->_matchOperation;
}

- (void)setMatchOperation:(id)a3
{
}

- (id)matchUserThenDoSingleEnrollmentCompletion
{
  return self->_matchUserThenDoSingleEnrollmentCompletion;
}

- (void)setMatchUserThenDoSingleEnrollmentCompletion:(id)a3
{
}

- (BOOL)supportsPeriocularEnrollment
{
  return self->_supportsPeriocularEnrollment;
}

- (void)setSupportsPeriocularEnrollment:(BOOL)a3
{
  self->_supportsPeriocularEnrollment = a3;
}

- (BKUIAnalyticsManager)analyticsManager
{
  return (BKUIAnalyticsManager *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong(&self->_matchUserThenDoSingleEnrollmentCompletion, 0);
  objc_storeStrong((id *)&self->_matchOperation, 0);
  objc_storeStrong((id *)&self->_enrollOperation, 0);
  objc_storeStrong((id *)&self->_externalizedAuthContext, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_poseStatus, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_destroyWeak((id *)&self->_operationsDelegate);
  objc_storeStrong((id *)&self->_lastFaceFoundDate, 0);
  objc_storeStrong((id *)&self->_enrollStartStopQueue, 0);
  objc_storeStrong((id *)&self->_authContext, 0);

  objc_storeStrong((id *)&self->_sharingclient, 0);
}

void __114__BKUIFaceIDEnrollOperationsHandler_matchUserThenDoSingleEnrollmentWithExisitingEnrollmentConfigCompletionAction___block_invoke_4_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1E4B6C000, log, OS_LOG_TYPE_ERROR, "This device does not support periocular enrollment", v1, 2u);
}

- (void)matchUserForGlassesPhaseEnrollmentWithCompletionAction:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1E4B6C000, log, OS_LOG_TYPE_ERROR, "Mathc Operation preflight check failed:", v1, 2u);
}

- (void)_matchOperationPreflightCheck:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_ERROR, "Failed to get BK device, early exiting with failing the enrollment: %@", (uint8_t *)&v2, 0xCu);
}

- (void)enrollOperation:finishedWithEnrollResult:.cold.1()
{
  __assert_rtn("-[BKUIFaceIDEnrollOperationsHandler enrollOperation:finishedWithEnrollResult:]", "BKUIFaceIDEnrollOperationsHandler.m", 724, "enrolledIdentity != nil");
}

void __70__BKUIFaceIDEnrollOperationsHandler_enrollOperation_failedWithReason___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_ERROR, "PearlEnroll: Failed to enroll, error = %d", (uint8_t *)v3, 8u);
}

- (void)bkIdentities
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_ERROR, "unable to fetch number of identities error: %@", (uint8_t *)&v4, 0xCu);
}

@end