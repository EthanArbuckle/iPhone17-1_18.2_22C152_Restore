@interface CAMProminentObjectManager
- (BCSAction)currentMachineReadableCodeAction;
- (BOOL)_isMetadataObject:(id)a3 semanticallyEqualToMetadataObject:(id)a4;
- (BOOL)_isPoint:(CGPoint)a3 equalToPoint:(CGPoint)a4 tolerance:(double)a5;
- (BOOL)isCurrentObjectExpiring;
- (BOOL)isCurrentObjectLikelyEqualToObject:(id)a3;
- (CAMMetadataObjectResult)currentObject;
- (CAMProminentObjectManager)init;
- (CAMProminentObjectManagerDelegate)delegate;
- (CGRect)_referenceBoundsForAspectRatio:(int64_t)a3;
- (double)_expirationTimeForObjectType:(unint64_t)a3;
- (double)_selectionDelayForNewObject:(id)a3;
- (id)_candidateObjectMatchingCurrentObject:(id)a3;
- (id)_mostSignificantObjectFromObjects:(id)a3 preferredObject:(id)a4 pointOfInterest:(CGPoint)a5;
- (int64_t)viewportAspectRatio;
- (unint64_t)currentObjectType;
- (unint64_t)typeForMetadataObject:(id)a3;
- (void)_beginExpiringCurrentObjectIfNeeded;
- (void)_handleExpiredObject:(id)a3;
- (void)_setCurrentMachineReadableCodeAction:(id)a3;
- (void)_setCurrentMachineReadableCodeAction:(id)a3 updatePreviousAction:(BOOL)a4;
- (void)_setCurrentObject:(id)a3 forPointOfInterest:(CGPoint)a4;
- (void)_updateCurrentMRCActionWhenReady;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setViewportAspectRatio:(int64_t)a3;
- (void)updateWithCandidateObjects:(id)a3;
@end

@implementation CAMProminentObjectManager

- (CAMProminentObjectManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CAMProminentObjectManager;
  result = [(CAMProminentObjectManager *)&v3 init];
  if (result) {
    result->_viewportAspectRatio = 0;
  }
  return result;
}

- (void)_setCurrentObject:(id)a3 forPointOfInterest:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v8 = (CAMMetadataObjectResult *)a3;
  v9 = v8;
  currentObject = self->_currentObject;
  if (currentObject != v8)
  {
    v13 = v8;
    BOOL v11 = [(CAMProminentObjectManager *)self _isMetadataObject:currentObject semanticallyEqualToMetadataObject:v8];
    objc_storeStrong((id *)&self->_currentObject, a3);
    v9 = v13;
    if (!v11)
    {
      self->_currentObjectPointOfInterest.CGFloat x = x;
      self->_currentObjectPointOfInterest.CGFloat y = y;
      v12 = [(CAMProminentObjectManager *)self delegate];
      [v12 prominentObjectManager:self didChangeCurrentObject:v13];

      v8 = (CAMMetadataObjectResult *)[(CAMProminentObjectManager *)self _updateCurrentMRCActionWhenReady];
      v9 = v13;
    }
  }
  MEMORY[0x270F9A758](v8, v9);
}

- (void)_setCurrentMachineReadableCodeAction:(id)a3
{
}

- (void)_setCurrentMachineReadableCodeAction:(id)a3 updatePreviousAction:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (BCSAction *)a3;
  currentAction = self->_currentAction;
  if (currentAction != v7)
  {
    BOOL v11 = v7;
    if (currentAction) {
      BOOL v9 = !v4;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9) {
      objc_storeStrong((id *)&self->_previousAction, currentAction);
    }
    objc_storeStrong((id *)&self->_currentAction, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained prominentObjectManager:self didChangeCurrentMachineReadableCodeAction:v11];

    v7 = v11;
  }
}

- (CAMMetadataObjectResult)currentObject
{
  return self->_currentObject;
}

- (BOOL)isCurrentObjectExpiring
{
  currentObject = self->_currentObject;
  return currentObject && currentObject == self->_expiringObject;
}

- (BOOL)isCurrentObjectLikelyEqualToObject:(id)a3
{
  return [(CAMProminentObjectManager *)self _isMetadataObject:a3 semanticallyEqualToMetadataObject:self->_currentObject];
}

- (BCSAction)currentMachineReadableCodeAction
{
  if ([(CAMProminentObjectManager *)self currentObjectType] == 2) {
    objc_super v3 = self->_currentAction;
  }
  else {
    objc_super v3 = 0;
  }
  return v3;
}

- (unint64_t)currentObjectType
{
  return [(CAMProminentObjectManager *)self typeForMetadataObject:self->_currentObject];
}

- (unint64_t)typeForMetadataObject:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if ([v3 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v4 = 1;
    }
    else if ([v3 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v4 = 2;
    }
    else
    {
      unint64_t v4 = 0;
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)reset
{
  BOOL v3 = [(CAMProminentObjectManager *)self isCurrentObjectExpiring];
  currentlyParsingCode = self->_currentlyParsingCode;
  self->_currentlyParsingCode = 0;

  previousAction = self->_previousAction;
  self->_previousAction = 0;

  expiringObject = self->_expiringObject;
  self->_expiringObject = 0;

  [(CAMProminentObjectManager *)self _setCurrentMachineReadableCodeAction:0 updatePreviousAction:0];
  -[CAMProminentObjectManager _setCurrentObject:forPointOfInterest:](self, "_setCurrentObject:forPointOfInterest:", 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  if (v3 != [(CAMProminentObjectManager *)self isCurrentObjectExpiring])
  {
    id v7 = [(CAMProminentObjectManager *)self delegate];
    [v7 prominentObjectManagerDidChangeIsCurrentObjectExpiring:self];
  }
}

- (void)updateWithCandidateObjects:(id)a3
{
  id v16 = a3;
  unint64_t v4 = [(CAMProminentObjectManager *)self _candidateObjectMatchingCurrentObject:v16];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained prominentObjectManagerPointOfInterestInNormalizedDeviceSpace:self];
  double v7 = v6;
  double v9 = v8;

  BOOL v10 = [(CAMProminentObjectManager *)self isCurrentObjectExpiring];
  if (![v16 count])
  {
    [(CAMProminentObjectManager *)self _beginExpiringCurrentObjectIfNeeded];
LABEL_7:
    v12 = 0;
    expiringObject = self->_expiringObject;
    goto LABEL_8;
  }
  uint64_t v11 = -[CAMProminentObjectManager _mostSignificantObjectFromObjects:preferredObject:pointOfInterest:](self, "_mostSignificantObjectFromObjects:preferredObject:pointOfInterest:", v16, v4, v7, v9);
  v12 = (CAMMetadataObjectResult *)v11;
  if (v11 && (CAMMetadataObjectResult *)v11 == v4)
  {
    v12 = v4;
    expiringObject = v4;
    goto LABEL_8;
  }
  [(CAMProminentObjectManager *)self _beginExpiringCurrentObjectIfNeeded];
  expiringObject = v12;
  if (!v12) {
    goto LABEL_7;
  }
LABEL_8:
  v14 = expiringObject;

  -[CAMProminentObjectManager _setCurrentObject:forPointOfInterest:](self, "_setCurrentObject:forPointOfInterest:", v14, v7, v9);
  if (v10 != [(CAMProminentObjectManager *)self isCurrentObjectExpiring])
  {
    v15 = [(CAMProminentObjectManager *)self delegate];
    [v15 prominentObjectManagerDidChangeIsCurrentObjectExpiring:self];
  }
}

- (void)_beginExpiringCurrentObjectIfNeeded
{
  [(CAMProminentObjectManager *)self _expirationTimeForObjectType:[(CAMProminentObjectManager *)self typeForMetadataObject:self->_currentObject]];
  double v4 = v3;
  [(CAMProminentObjectManager *)self _expirationTimeForObjectType:[(CAMProminentObjectManager *)self typeForMetadataObject:self->_expiringObject]];
  if (v4 > 0.0 && v4 >= v5)
  {
    currentObject = self->_currentObject;
    if (currentObject != self->_expiringObject)
    {
      objc_storeStrong((id *)&self->_expiringObject, currentObject);
      double v8 = self->_expiringObject;
      objc_initWeak(&location, self);
      dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __64__CAMProminentObjectManager__beginExpiringCurrentObjectIfNeeded__block_invoke;
      block[3] = &unk_263FA0868;
      objc_copyWeak(&v13, &location);
      v12 = v8;
      BOOL v10 = v8;
      dispatch_after(v9, MEMORY[0x263EF83A0], block);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __64__CAMProminentObjectManager__beginExpiringCurrentObjectIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleExpiredObject:*(void *)(a1 + 32)];
}

- (void)_handleExpiredObject:(id)a3
{
  double v4 = (CAMMetadataObjectResult *)a3;
  if (self->_expiringObject == v4)
  {
    self->_expiringObject = 0;
    double v6 = v4;

    if (self->_currentObject == v6) {
      -[CAMProminentObjectManager _setCurrentObject:forPointOfInterest:](self, "_setCurrentObject:forPointOfInterest:", 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    }
    double v5 = [(CAMProminentObjectManager *)self delegate];
    [v5 prominentObjectManagerDidChangeIsCurrentObjectExpiring:self];

    double v4 = v6;
  }
}

- (double)_expirationTimeForObjectType:(unint64_t)a3
{
  double result = 0.45;
  if (a3 != 1) {
    double result = 0.0;
  }
  if (a3 == 2) {
    return 4.0;
  }
  return result;
}

- (BOOL)_isMetadataObject:(id)a3 semanticallyEqualToMetadataObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v6)
  {
    if ([v7 isMemberOfClass:objc_opt_class()])
    {
      unint64_t v9 = [(CAMProminentObjectManager *)self typeForMetadataObject:v6];
      if (v9)
      {
        if (v9 == 2)
        {
          id v15 = v6;
          id BCSDetectedCodeClass = getBCSDetectedCodeClass();
          v17 = [v15 underlyingMachineReadableCodeObject];

          BOOL v10 = [BCSDetectedCodeClass detectedCodeWithMachineReadableObject:v17];

          id v18 = v8;
          id v19 = getBCSDetectedCodeClass();
          v20 = [v18 underlyingMachineReadableCodeObject];

          uint64_t v11 = [v19 detectedCodeWithMachineReadableObject:v20];

          char v12 = [v10 isLikelyEqualToCode:v11];
          goto LABEL_13;
        }
        if (v9 == 1)
        {
          BOOL v10 = [v6 uniqueIdentifier];
          uint64_t v11 = [v8 uniqueIdentifier];
          char v12 = [v11 isEqualToString:v10];
LABEL_13:
          BOOL v13 = v12;

          goto LABEL_14;
        }
      }
      else
      {
        v14 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[CAMProminentObjectManager _isMetadataObject:semanticallyEqualToMetadataObject:]((uint64_t)v6, v14);
        }
      }
    }
    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = v7 == 0;
  }
LABEL_14:

  return v13;
}

- (BOOL)_isPoint:(CGPoint)a3 equalToPoint:(CGPoint)a4 tolerance:(double)a5
{
  BOOL v5 = vabdd_f64(a3.x, a4.x) <= a5;
  return vabdd_f64(a3.y, a4.y) <= a5 && v5;
}

- (id)_candidateObjectMatchingCurrentObject:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_currentObject)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (-[CAMProminentObjectManager _isMetadataObject:semanticallyEqualToMetadataObject:](self, "_isMetadataObject:semanticallyEqualToMetadataObject:", self->_currentObject, v11, (void)v14))
          {
            id v12 = v11;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v12 = 0;
LABEL_12:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_mostSignificantObjectFromObjects:(id)a3 preferredObject:(id)a4 pointOfInterest:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 count];
  if (!v10 && !v11)
  {
    id v12 = 0;
    goto LABEL_32;
  }
  [(CAMProminentObjectManager *)self _referenceBoundsForAspectRatio:[(CAMProminentObjectManager *)self viewportAspectRatio]];
  CEKExpandNormalizedPoint();
  point[0] = v13;
  double v15 = v14;
  if (self->_currentObject) {
    int v16 = !-[CAMProminentObjectManager _isPoint:equalToPoint:tolerance:](self, "_isPoint:equalToPoint:tolerance:", self->_currentObjectPointOfInterest.x, self->_currentObjectPointOfInterest.y, x, y, 0.001);
  }
  else {
    LOBYTE(v16) = 0;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  *(_OWORD *)&point[1] = 0u;
  long long v53 = 0u;
  id v17 = v9;
  uint64_t v18 = [v17 countByEnumeratingWithState:&point[1] objects:v56 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    char v50 = v16;
    v51 = self;
    v20 = 0;
    uint64_t v21 = *(void *)v53;
    double v22 = 1.79769313e308;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v53 != v21) {
          objc_enumerationMutation(v17);
        }
        id v24 = *(id *)(*(void *)&point[2] + 8 * i);
        v25 = [v24 underlyingMetadataObject];
        [v25 bounds];

        CEKExpandNormalizedRect();
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;
        CGFloat v33 = v32;
        UIRectGetCenter();
        double v35 = v34;
        double v37 = v36;
        int v38 = [v24 isMemberOfClass:objc_opt_class()];
        if (v38)
        {
          v60.origin.double x = v27;
          v60.origin.double y = v29;
          v60.size.width = v31;
          v60.size.height = v33;
          v59.double x = point[0];
          v59.double y = v15;
          if (CGRectContainsPoint(v60, v59))
          {
            id v41 = v24;

            LOBYTE(v16) = 1;
            v20 = v41;
            self = v51;
            goto LABEL_26;
          }
        }
        if (v24 == v10) {
          double v39 = ((v15 - v37) * (v15 - v37) + (point[0] - v35) * (point[0] - v35)) * 0.5625;
        }
        else {
          double v39 = (v15 - v37) * (v15 - v37) + (point[0] - v35) * (point[0] - v35);
        }
        if (v39 < v22)
        {
          if (((v39 > 0.0625) & ~v38) != 0)
          {
            double v22 = v39;
          }
          else
          {
            id v40 = v24;

            double v22 = v39;
            v20 = v40;
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&point[1] objects:v56 count:16];
      if (v19) {
        continue;
      }
      break;
    }
    self = v51;
    LOBYTE(v16) = v50;
  }
  else
  {
    v20 = 0;
  }
LABEL_26:

  id v12 = v10;
  BOOL v42 = [(CAMProminentObjectManager *)self _isMetadataObject:v20 semanticallyEqualToMetadataObject:self->_currentObject];
  if (v20 && !v42)
  {
    p_candidateObject = &self->_candidateObject;
    BOOL v44 = [(CAMProminentObjectManager *)self _isMetadataObject:v20 semanticallyEqualToMetadataObject:self->_candidateObject];
    if ((v16 & 1) == 0)
    {
      BOOL v45 = v44;
      [(CAMProminentObjectManager *)self _selectionDelayForNewObject:v20];
      if (v46 != 0.0)
      {
        if (!v45)
        {
          objc_storeStrong((id *)&self->_candidateObject, v20);
          self->_candidateTimestamp = CFAbsoluteTimeGetCurrent();
          goto LABEL_31;
        }
        if (CFAbsoluteTimeGetCurrent() - self->_candidateTimestamp <= v46) {
          goto LABEL_31;
        }
      }
    }
    id v47 = v20;

    v48 = *p_candidateObject;
    *p_candidateObject = 0;

    id v12 = v47;
  }
LABEL_31:

LABEL_32:
  return v12;
}

- (double)_selectionDelayForNewObject:(id)a3
{
  id v4 = a3;
  if (_selectionDelayForNewObject__onceToken != -1) {
    dispatch_once(&_selectionDelayForNewObject__onceToken, &__block_literal_global_2);
  }
  currentObject = self->_currentObject;
  if (!currentObject || (double v6 = 0.75, currentObject == self->_expiringObject))
  {
    unint64_t v7 = [(CAMProminentObjectManager *)self typeForMetadataObject:v4];
    if (!v7 || v7 == 2)
    {
      double v6 = 0.25;
    }
    else
    {
      double v6 = 0.0;
      if (v7 == 1) {
        double v6 = *(double *)&_selectionDelayForNewObject__textSelectionDelay;
      }
    }
  }

  return v6;
}

CFIndex __57__CAMProminentObjectManager__selectionDelayForNewObject___block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex result = CFPreferencesGetAppIntegerValue(@"CAMTextSelectionDelayMilliseconds", @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    double v1 = fmax((double)result / 1000.0, 0.0);
  }
  else {
    double v1 = 0.25;
  }
  _selectionDelayForNewObject__textSelectionDeladouble y = *(void *)&v1;
  return result;
}

- (CGRect)_referenceBoundsForAspectRatio:(int64_t)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  switch(a3)
  {
    case 0:
      double v5 = 1.33333333;
      break;
    case 1:
      double v5 = 1.77777778;
      break;
    case 2:
      double v5 = 1.5;
      break;
    case 3:
      double v5 = 1.0;
      break;
    case 4:
      double v6 = [MEMORY[0x263F82B60] mainScreen];
      [v6 _referenceBounds];
      double v8 = v7;
      double v10 = v9;

      double v5 = v10 / v8;
      break;
    default:
      double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
      break;
  }
  double v11 = 1.0;
  double v12 = v3;
  double v13 = v4;
  result.size.height = v11;
  result.size.width = v5;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)_updateCurrentMRCActionWhenReady
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(CAMProminentObjectManager *)self currentObjectType];
  currentlyParsingCode = self->_currentlyParsingCode;
  if (v3 == 2)
  {
    if (!currentlyParsingCode)
    {
      double v5 = self->_currentObject;
      id BCSDetectedCodeClass = getBCSDetectedCodeClass();
      double v7 = [(CAMMetadataObjectResult *)v5 underlyingMachineReadableCodeObject];
      double v8 = [BCSDetectedCodeClass detectedCodeWithMachineReadableObject:v7];

      double v9 = [(BCSAction *)self->_currentAction detectedCode];
      char v10 = [v8 isLikelyEqualToCode:v9];

      if ((v10 & 1) == 0)
      {
        double v11 = [(BCSAction *)self->_previousAction detectedCode];
        int v12 = [v8 isLikelyEqualToCode:v11];

        if (v12)
        {
          [(CAMProminentObjectManager *)self _setCurrentMachineReadableCodeAction:self->_previousAction];
        }
        else
        {
          double v13 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v18 = v8;
            _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "Parsing machine readable code (%{public}@)", buf, 0xCu);
          }

          objc_storeStrong((id *)&self->_currentlyParsingCode, v8);
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 3221225472;
          v14[2] = __61__CAMProminentObjectManager__updateCurrentMRCActionWhenReady__block_invoke;
          v14[3] = &unk_263FA0A88;
          id v15 = v8;
          int v16 = self;
          [v15 parseCodeWithCompletion:v14];
        }
      }
    }
  }
  else
  {
    self->_currentlyParsingCode = 0;

    [(CAMProminentObjectManager *)self _setCurrentMachineReadableCodeAction:0];
  }
}

void __61__CAMProminentObjectManager__updateCurrentMRCActionWhenReady__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__CAMProminentObjectManager__updateCurrentMRCActionWhenReady__block_invoke_2;
  v11[3] = &unk_263FA0A60;
  id v12 = v6;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v13 = v7;
  uint64_t v14 = v8;
  id v15 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __61__CAMProminentObjectManager__updateCurrentMRCActionWhenReady__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v3 = *(void **)(a1 + 40);
      double v4 = [*(id *)(a1 + 32) description];
      int v16 = 138543618;
      id v17 = v3;
      __int16 v18 = 2114;
      uint64_t v19 = v4;
      _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "Failed to parse machine readable code (%{public}@): %{public}@", (uint8_t *)&v16, 0x16u);
    }
    id v5 = *(void **)(a1 + 48);
    uint64_t v6 = 0;
LABEL_5:
    [v5 _setCurrentMachineReadableCodeAction:v6];
    return;
  }
  id v7 = [*(id *)(a1 + 56) detectedCode];
  uint64_t v8 = *(void **)(*(void *)(a1 + 48) + 56);

  id v9 = os_log_create("com.apple.camera", "Camera");
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7 == v8)
  {
    if (v10)
    {
      id v12 = [*(id *)(a1 + 56) dataTypeDisplayString];
      id v13 = *(void **)(a1 + 40);
      int v16 = 138543618;
      id v17 = v12;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Received action of type %{public}@ for machine readable code (%{public}@)", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = *(void **)(v14 + 56);
    *(void *)(v14 + 56) = 0;

    id v5 = *(void **)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    goto LABEL_5;
  }
  if (v10)
  {
    double v11 = *(void **)(a1 + 40);
    int v16 = 138543362;
    id v17 = v11;
    _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Ignored action for machine readable code (%{public}@) because parsing was cancelled", (uint8_t *)&v16, 0xCu);
  }
}

- (CAMProminentObjectManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMProminentObjectManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)viewportAspectRatio
{
  return self->_viewportAspectRatio;
}

- (void)setViewportAspectRatio:(int64_t)a3
{
  self->_viewportAspectRatio = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentAction, 0);
  objc_storeStrong((id *)&self->_previousAction, 0);
  objc_storeStrong((id *)&self->_currentlyParsingCode, 0);
  objc_storeStrong((id *)&self->_candidateObject, 0);
  objc_storeStrong((id *)&self->_expiringObject, 0);
  objc_storeStrong((id *)&self->_currentObject, 0);
}

- (void)_isMetadataObject:(uint64_t)a1 semanticallyEqualToMetadataObject:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "CAMMetadataObjectResult is not nil, but its type (%{public}@) is not recognized by the prominent object manager.", (uint8_t *)&v5, 0xCu);
}

@end