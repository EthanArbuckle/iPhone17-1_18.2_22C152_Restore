@interface AVCapturePhotoOutputReadinessCoordinator
+ (BOOL)_isOverlappingCaptureSupportedForPhotoSettings:(id)a3 autoDeferredPhotoDeliveryEnabled:(BOOL)a4 responsiveCaptureEnabled:(BOOL)a5;
+ (int64_t)_captureReadinessFromReadinessState:(AVCapturePhotoOutputCaptureReadinessState *)a3;
- (AVCapturePhotoOutputCaptureReadiness)captureReadiness;
- (AVCapturePhotoOutputReadinessCoordinator)initWithPhotoOutput:(AVCapturePhotoOutput *)photoOutput;
- (id)_queue;
- (id)delegate;
- (void)_invokeDelegateCallbackWithBlock:(id)a3;
- (void)_photoOutputDidUpdateCaptureReadinessState:(AVCapturePhotoOutputCaptureReadinessState *)a3;
- (void)_setDelegate:(id)a3 queue:(id)a4;
- (void)_updateCaptureReadinessWithDelegate:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)delegate;
- (void)startTrackingCaptureRequestUsingPhotoSettings:(AVCapturePhotoSettings *)settings;
- (void)stopTrackingCaptureRequestUsingPhotoSettingsUniqueID:(int64_t)settingsUniqueID;
@end

@implementation AVCapturePhotoOutputReadinessCoordinator

+ (int64_t)_captureReadinessFromReadinessState:(AVCapturePhotoOutputCaptureReadinessState *)a3
{
  if (a3->sessionIsRunning)
  {
    int numberOfPhotoCapturesInflight = a3->numberOfPhotoCapturesInflight;
    uint64_t v4 = 1;
    if (numberOfPhotoCapturesInflight > 1) {
      uint64_t v4 = 2;
    }
    if (a3->inflightNonOverlappingCaptureUniqueID < 1 || numberOfPhotoCapturesInflight <= 0) {
      int64_t v6 = v4;
    }
    else {
      int64_t v6 = 2;
    }
  }
  else
  {
    int numberOfPhotoCapturesInflight = a3->numberOfPhotoCapturesInflight;
    int64_t v6 = 2 * (numberOfPhotoCapturesInflight > 0);
  }
  if (a3->inflightUniqueIDWaitingForCapture >= 1 && numberOfPhotoCapturesInflight > 0) {
    return 3;
  }
  if (numberOfPhotoCapturesInflight <= 0 || a3->inflightUniqueIDWaitingForProcessing <= 0) {
    return v6;
  }
  else {
    return 4;
  }
}

- (AVCapturePhotoOutputReadinessCoordinator)initWithPhotoOutput:(AVCapturePhotoOutput *)photoOutput
{
  if (photoOutput)
  {
    v6.receiver = self;
    v6.super_class = (Class)AVCapturePhotoOutputReadinessCoordinator;
    uint64_t v4 = [(AVCapturePhotoOutputReadinessCoordinator *)&v6 init];
    if (v4)
    {
      v4->_delegateStorage = (AVWeakReferencingDelegateStorage *)objc_alloc_init(MEMORY[0x1E4F47DF8]);
      v4->_trackedPhotoSettingsArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(AVCapturePhotoOutput *)photoOutput _addReadinessCoordinator:v4];
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCapturePhotoOutputReadinessCoordinator;
  [(AVCapturePhotoOutputReadinessCoordinator *)&v3 dealloc];
}

- (id)delegate
{
  return (id)[(AVWeakReferencingDelegateStorage *)self->_delegateStorage delegate];
}

- (void)setDelegate:(id)delegate
{
}

- (AVCapturePhotoOutputCaptureReadiness)captureReadiness
{
  return self->_captureReadiness;
}

- (void)startTrackingCaptureRequestUsingPhotoSettings:(AVCapturePhotoSettings *)settings
{
  v8 = 0;
  if (po_photoSettingsAreValid(settings, 0, 0, 0, &v8))
  {
    id v5 = (id)[(AVCapturePhotoSettings *)settings copy];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __90__AVCapturePhotoOutputReadinessCoordinator_startTrackingCaptureRequestUsingPhotoSettings___block_invoke;
    v7[3] = &unk_1E5A79FF0;
    v7[4] = self;
    v7[5] = v5;
    [(AVCapturePhotoOutputReadinessCoordinator *)self _invokeDelegateCallbackWithBlock:v7];
  }
  else
  {
    objc_super v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

uint64_t __90__AVCapturePhotoOutputReadinessCoordinator_startTrackingCaptureRequestUsingPhotoSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 _updateCaptureReadinessWithDelegate:a2];
}

- (void)stopTrackingCaptureRequestUsingPhotoSettingsUniqueID:(int64_t)settingsUniqueID
{
  if (settingsUniqueID <= 0)
  {
    objc_super v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __97__AVCapturePhotoOutputReadinessCoordinator_stopTrackingCaptureRequestUsingPhotoSettingsUniqueID___block_invoke;
    v4[3] = &unk_1E5A7A038;
    v4[4] = self;
    v4[5] = settingsUniqueID;
    [(AVCapturePhotoOutputReadinessCoordinator *)self _invokeDelegateCallbackWithBlock:v4];
  }
}

uint64_t __97__AVCapturePhotoOutputReadinessCoordinator_stopTrackingCaptureRequestUsingPhotoSettingsUniqueID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__AVCapturePhotoOutputReadinessCoordinator_stopTrackingCaptureRequestUsingPhotoSettingsUniqueID___block_invoke_2;
  v7[3] = &__block_descriptor_40_e39_B32__0__AVCapturePhotoSettings_8Q16_B24l;
  v7[4] = *(void *)(a1 + 40);
  id v5 = (void *)[v4 indexesOfObjectsPassingTest:v7];
  uint64_t result = [v5 count];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 64) removeObjectsAtIndexes:v5];
    return [*(id *)(a1 + 32) _updateCaptureReadinessWithDelegate:a2];
  }
  return result;
}

BOOL __97__AVCapturePhotoOutputReadinessCoordinator_stopTrackingCaptureRequestUsingPhotoSettingsUniqueID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uniqueID] == *(void *)(a1 + 32);
}

- (id)_queue
{
  return (id)[(AVWeakReferencingDelegateStorage *)self->_delegateStorage delegateQueue];
}

- (void)_setDelegate:(id)a3 queue:(id)a4
{
  delegateStorage = self->_delegateStorage;
  if (a3)
  {
    id v8 = (id)[(AVWeakReferencingDelegateStorage *)delegateStorage delegate];
    [(AVWeakReferencingDelegateStorage *)self->_delegateStorage setDelegate:a3 queue:a4];
    if (v8 != a3)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __63__AVCapturePhotoOutputReadinessCoordinator__setDelegate_queue___block_invoke;
      v9[3] = &unk_1E5A7A060;
      v9[4] = self;
      [(AVCapturePhotoOutputReadinessCoordinator *)self _invokeDelegateCallbackWithBlock:v9];
    }
  }
  else
  {
    -[AVWeakReferencingDelegateStorage setDelegate:queue:](delegateStorage, "setDelegate:queue:");
  }
}

uint64_t __63__AVCapturePhotoOutputReadinessCoordinator__setDelegate_queue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return objc_msgSend(a2, "readinessCoordinator:captureReadinessDidChange:");
  }
  return result;
}

- (void)_photoOutputDidUpdateCaptureReadinessState:(AVCapturePhotoOutputCaptureReadinessState *)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  long long v3 = *(_OWORD *)&a3->inflightNonOverlappingCaptureUniqueID;
  long long v5 = *(_OWORD *)&a3->sessionIsRunning;
  v4[2] = __87__AVCapturePhotoOutputReadinessCoordinator__photoOutputDidUpdateCaptureReadinessState___block_invoke;
  v4[3] = &unk_1E5A7A0A8;
  v4[4] = self;
  long long v6 = v3;
  int64_t inflightUniqueIDWaitingForProcessing = a3->inflightUniqueIDWaitingForProcessing;
  [(AVCapturePhotoOutputReadinessCoordinator *)self _invokeDelegateCallbackWithBlock:v4];
}

uint64_t __87__AVCapturePhotoOutputReadinessCoordinator__photoOutputDidUpdateCaptureReadinessState___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 56);
  *(void *)(v4 + 56) = *(void *)(a1 + 72);
  *(_OWORD *)(v4 + 40) = v6;
  *(_OWORD *)(v4 + 24) = v5;
  v7 = *(void **)(*(void *)(a1 + 32) + 64);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__AVCapturePhotoOutputReadinessCoordinator__photoOutputDidUpdateCaptureReadinessState___block_invoke_2;
  v11[3] = &__block_descriptor_72_e39_B32__0__AVCapturePhotoSettings_8Q16_B24l;
  long long v8 = *(_OWORD *)(a1 + 56);
  long long v12 = *(_OWORD *)(a1 + 40);
  long long v13 = v8;
  uint64_t v14 = *(void *)(a1 + 72);
  v9 = (void *)[v7 indexesOfObjectsPassingTest:v11];
  if ([v9 count]) {
    [*(id *)(*(void *)(a1 + 32) + 64) removeObjectsAtIndexes:v9];
  }
  return [*(id *)(a1 + 32) _updateCaptureReadinessWithDelegate:a2];
}

BOOL __87__AVCapturePhotoOutputReadinessCoordinator__photoOutputDidUpdateCaptureReadinessState___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uniqueID] <= *(void *)(a1 + 40);
}

+ (BOOL)_isOverlappingCaptureSupportedForPhotoSettings:(id)a3 autoDeferredPhotoDeliveryEnabled:(BOOL)a4 responsiveCaptureEnabled:(BOOL)a5
{
  if (!a3) {
    return 0;
  }
  if ([a3 digitalFlashMode] > 0 || objc_msgSend(a3, "flashMode") == 1) {
    return 0;
  }
  int v9 = [a3 maxPhotoDimensions];
  int v10 = ((unint64_t)[a3 maxPhotoDimensions] >> 32) * v9;
  BOOL result = v10 < 48000000;
  if (!a4 && !a5 && v10 <= 47999999) {
    return [a3 photoQualityPrioritization] != 3;
  }
  return result;
}

- (void)_invokeDelegateCallbackWithBlock:(id)a3
{
  if (pthread_main_np()) {
    uint64_t v5 = MEMORY[0x1E4F14428];
  }
  else {
    uint64_t v5 = 0;
  }
  delegateStorage = self->_delegateStorage;

  [(AVWeakReferencingDelegateStorage *)delegateStorage invokeDelegateCallbackWithBlock:a3 synchronouslyIfDelegateQueueIsQueue:v5];
}

- (void)_updateCaptureReadinessWithDelegate:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL autoDeferredPhotoDeliveryEnabled = self->_captureReadinessState.autoDeferredPhotoDeliveryEnabled;
  BOOL responsiveCaptureEnabled = self->_captureReadinessState.responsiveCaptureEnabled;
  char v19 = *(&self->_captureReadinessState.responsiveCaptureEnabled + 1);
  BOOL sessionIsRunning = self->_captureReadinessState.sessionIsRunning;
  int numberOfPhotoCapturesInflight = self->_captureReadinessState.numberOfPhotoCapturesInflight;
  int64_t latestCaptureUniqueID = self->_captureReadinessState.latestCaptureUniqueID;
  int64_t inflightNonOverlappingCaptureUniqueID = self->_captureReadinessState.inflightNonOverlappingCaptureUniqueID;
  long long v7 = *(_OWORD *)&self->_captureReadinessState.inflightUniqueIDWaitingForCapture;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = v7;
  trackedPhotoSettingsArray = self->_trackedPhotoSettingsArray;
  uint64_t v9 = [(NSMutableArray *)trackedPhotoSettingsArray countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      int v21 = numberOfPhotoCapturesInflight;
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(trackedPhotoSettingsArray);
        }
        long long v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (([(id)objc_opt_class() _isOverlappingCaptureSupportedForPhotoSettings:v13 autoDeferredPhotoDeliveryEnabled:autoDeferredPhotoDeliveryEnabled responsiveCaptureEnabled:responsiveCaptureEnabled] & 1) == 0)int64_t inflightNonOverlappingCaptureUniqueID = objc_msgSend(v13, "uniqueID"); {
      }
        }
      int numberOfPhotoCapturesInflight = v21 + v10;
      uint64_t v10 = [(NSMutableArray *)trackedPhotoSettingsArray countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }
  uint64_t v14 = objc_opt_class();
  v23[0] = sessionIsRunning;
  v23[1] = autoDeferredPhotoDeliveryEnabled;
  v23[2] = responsiveCaptureEnabled;
  v23[3] = v19;
  int v24 = numberOfPhotoCapturesInflight;
  int64_t v25 = latestCaptureUniqueID;
  int64_t v26 = inflightNonOverlappingCaptureUniqueID;
  long long v27 = v32;
  uint64_t v15 = [v14 _captureReadinessFromReadinessState:v23];
  if (v15 != self->_captureReadiness)
  {
    int64_t v16 = v15;
    [(AVCapturePhotoOutputReadinessCoordinator *)self willChangeValueForKey:@"captureReadiness"];
    self->_captureReadiness = v16;
    [(AVCapturePhotoOutputReadinessCoordinator *)self didChangeValueForKey:@"captureReadiness"];
    if (objc_opt_respondsToSelector()) {
      [a3 readinessCoordinator:self captureReadinessDidChange:v16];
    }
  }
}

@end