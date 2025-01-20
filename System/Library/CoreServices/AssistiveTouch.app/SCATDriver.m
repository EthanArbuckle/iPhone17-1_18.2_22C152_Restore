@interface SCATDriver
- (AXDispatchTimer)idleTimer;
- (BOOL)_canAutomaticallyPauseScanner;
- (BOOL)_canTransitionToPhase:(int)a3;
- (BOOL)_fireSelectActionWithCount:(unint64_t)a3 preferrsMenuOnFirstPress:(BOOL)a4;
- (BOOL)_handleActivateAction;
- (BOOL)_handleRunAction;
- (BOOL)_handleSelectAction;
- (BOOL)_handleSelectAndResumeAutoscanningAction;
- (BOOL)_handleStepNextAction;
- (BOOL)_handleStepPreviousAction;
- (BOOL)_handleStopAction;
- (BOOL)_shouldFocusToEscapeParentGroup:(id)a3 elementManager:(id)a4;
- (BOOL)actionHandler:(id)a3 shouldActImmediatelyOnActionCount:(unint64_t)a4;
- (BOOL)handleInputAction:(id)a3;
- (BOOL)hasIdleTimeExpired;
- (BOOL)isActive;
- (BOOL)isActiveScannerDriver;
- (BOOL)isGroupingEnabled;
- (BOOL)isInactive;
- (BOOL)isPaused;
- (BOOL)isSpeakingFocusContext;
- (BOOL)pauseScanningForPointPickerNumberOfCycles:(unint64_t)a3;
- (SCATDriver)init;
- (SCATDriver)initWithDelegate:(id)a3;
- (SCATDriverDelegate)delegate;
- (SCATElementManager)activeElementManager;
- (SCATFocusContext)currentSpeechFocusContext;
- (SCATFocusContext)focusContext;
- (id)_drillOutFocusContextForParentGroupOfFocusContext:(id)a3;
- (id)_focusContextAdjacentToSource:(int)a3 direction:(int64_t)a4 fromContext:(id)a5 checkedSources:(unint64_t)a6;
- (id)_focusContextForSource:(int)a3 inDirection:(int64_t)a4 currentContext:(id)a5;
- (id)_focusContextFromPrimaryContext:(id)a3 inDirection:(int64_t)a4 didWrap:(BOOL *)a5;
- (id)description;
- (id)firstFocusContext;
- (id)nextFocusContextFromContext:(id)a3 inDirection:(int64_t)a4 didWrap:(BOOL *)a5;
- (id)scannerManager;
- (id)selectActionHandler;
- (id)selectAndResumeAutoscanningActionHandler;
- (int)_nextFocusSourceFromSource:(int)a3 inDirection:(int64_t)a4;
- (int)_preferredBehaviorForSelectCount:(unint64_t)a3 focusContext:(id)a4;
- (int)_sourceForFocusContext:(id)a3;
- (int)phase;
- (int64_t)lastWrapDirection;
- (void)_cancelIdleTimer;
- (void)_didTransitionToPhase:(int)a3;
- (void)_didWrapInDirection:(int64_t)a3;
- (void)_resetIdleTimer;
- (void)_stepToNextFocusContextInDirection:(int64_t)a3;
- (void)actionHandlerDidFireAction:(id)a3;
- (void)beginScanningWithFocusContext:(id)a3;
- (void)continueScanningWithFocusContext:(id)a3;
- (void)endScanning;
- (void)handleDrillInOnGroup:(id)a3 elementManager:(id)a4;
- (void)handleDrillOutOnGroup:(id)a3 elementManager:(id)a4;
- (void)outputManager:(id)a3 didSpeakFocusContext:(id)a4;
- (void)outputManager:(id)a3 willSpeakFocusContext:(id)a4;
- (void)pauseScanning;
- (void)resumeScanning;
- (void)setCurrentSpeechFocusContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusContext:(id)a3;
- (void)setHasIdleTimeExpired:(BOOL)a3;
- (void)setIdleTimer:(id)a3;
- (void)setLastWrapDirection:(int64_t)a3;
- (void)setPhase:(int)a3;
@end

@implementation SCATDriver

- (SCATDriver)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCATDriver;
  v5 = [(SCATDriver *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_phase = 0;
    v7 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    idleTimer = v6->_idleTimer;
    v6->_idleTimer = v7;

    [(AXDispatchTimer *)v6->_idleTimer setLabel:@"Idle"];
    [(AXDispatchTimer *)v6->_idleTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
  }

  return v6;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSNumber numberWithBool:[(SCATDriver *)self hasIdleTimeExpired]];
  v6 = [(SCATDriver *)self activeElementManager];
  v7 = +[NSNumber numberWithBool:[(SCATDriver *)self isActiveScannerDriver]];
  v8 = [(SCATDriver *)self focusContext];
  v9 = +[NSString stringWithFormat:@"%@<%p>. idleTimeExpired:%@ ActiveManager:(%@) isActiveDriver:%@ FocusContext:(%@)", v4, self, v5, v6, v7, v8];

  return v9;
}

- (SCATFocusContext)focusContext
{
  return self->_focusContext;
}

- (void)setFocusContext:(id)a3
{
  v5 = (SCATFocusContext *)a3;
  p_focusContext = &self->_focusContext;
  if (self->_focusContext != v5)
  {
    v27 = v5;
    v7 = [(SCATDriver *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(SCATDriver *)self delegate];
      [v9 driver:self willFocusOnContext:v27];
    }
    objc_super v10 = [(SCATFocusContext *)v27 elementManager];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12 = [(SCATFocusContext *)v27 elementManager];
      [v12 driver:self willFocusOnContext:v27];
    }
    v13 = [(SCATDriver *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v15 = [(SCATDriver *)self delegate];
      [v15 driver:self willUnfocusFromContext:self->_focusContext];
    }
    v16 = [(SCATFocusContext *)*p_focusContext elementManager];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      v18 = [(SCATFocusContext *)self->_focusContext elementManager];
      [v18 driver:self willUnfocusFromContext:self->_focusContext];
    }
    v19 = [(SCATFocusContext *)*p_focusContext element];
    if [v19 scatIndicatesOwnFocus] && (objc_opt_respondsToSelector()) {
      [v19 scatDidBecomeFocused:0];
    }
    v20 = [(SCATDriver *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      v22 = [(SCATDriver *)self delegate];
      [v22 driver:self didFocusOnContext:v27 oldContext:self->_focusContext];
    }
    v23 = [(SCATFocusContext *)v27 elementManager];
    char v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      v25 = [(SCATFocusContext *)v27 elementManager];
      [v25 driver:self didFocusOnContext:v27 oldContext:self->_focusContext];
    }
    objc_storeStrong((id *)&self->_focusContext, a3);
    v26 = [(SCATFocusContext *)v27 element];
    if [v26 scatIndicatesOwnFocus] && (objc_opt_respondsToSelector()) {
      [v26 scatDidBecomeFocused:1];
    }

    v5 = v27;
  }
}

- (id)scannerManager
{
  return +[SCATScannerManager sharedManager];
}

- (SCATElementManager)activeElementManager
{
  v3 = [(SCATDriver *)self delegate];
  id v4 = [v3 activeElementManagerForDriver:self];

  return (SCATElementManager *)v4;
}

- (BOOL)isGroupingEnabled
{
  v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 assistiveTouchGroupElementsEnabled];

  return v3;
}

- (id)selectActionHandler
{
  v2 = +[SCATScannerManager sharedManager];
  unsigned __int8 v3 = [v2 selectActionHandler];

  return v3;
}

- (id)selectAndResumeAutoscanningActionHandler
{
  v2 = +[SCATScannerManager sharedManager];
  unsigned __int8 v3 = [v2 selectAndResumeAutoscanningActionHandler];

  return v3;
}

- (BOOL)isActive
{
  return self->_phase == 1;
}

- (BOOL)isInactive
{
  return self->_phase == 0;
}

- (BOOL)isPaused
{
  return self->_phase == 2;
}

- (BOOL)isActiveScannerDriver
{
  v2 = self;
  unsigned __int8 v3 = [(SCATDriver *)self delegate];
  id v4 = [v3 activeScannerDriver];
  LOBYTE(v2) = [(SCATDriver *)v2 isEqual:v4];

  return (char)v2;
}

- (void)beginScanningWithFocusContext:(id)a3
{
  id v5 = a3;
  if ([(SCATDriver *)self _canTransitionToPhase:1])
  {
    [(SCATDriver *)self _willTransitionToPhase:1];
    id v4 = v5;
    if (!v5)
    {
      id v4 = [(SCATDriver *)self firstFocusContext];
    }
    id v5 = v4;
    [v4 setFirstInSequence:1];
    [(SCATDriver *)self setFocusContext:v5];
    [(SCATDriver *)self _didTransitionToPhase:1];
  }
}

- (void)continueScanningWithFocusContext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_phase != 1)
  {
    _AXAssert();
    id v4 = v5;
  }
  if (!v4)
  {
    _AXAssert();
    id v4 = v5;
  }
  if (self->_phase == 1)
  {
    [v4 suppressAudioOutput];
    [(SCATDriver *)self setFocusContext:v5];
  }
  else
  {
    [(SCATDriver *)self beginScanningWithFocusContext:v5];
  }
}

- (void)endScanning
{
  if ([(SCATDriver *)self _canTransitionToPhase:0])
  {
    [(SCATDriver *)self _willTransitionToPhase:0];
    [(SCATDriver *)self setFocusContext:0];
    [(SCATDriver *)self _didTransitionToPhase:0];
  }
}

- (void)pauseScanning
{
  if ([(SCATDriver *)self _canTransitionToPhase:2])
  {
    [(SCATDriver *)self _willTransitionToPhase:2];
    [(SCATDriver *)self _didTransitionToPhase:2];
  }
}

- (void)resumeScanning
{
  if ([(SCATDriver *)self _canTransitionToPhase:1])
  {
    [(SCATDriver *)self _willTransitionToPhase:1];
    [(SCATDriver *)self _didTransitionToPhase:1];
  }
}

- (BOOL)pauseScanningForPointPickerNumberOfCycles:(unint64_t)a3
{
  BOOL v5 = [(SCATDriver *)self _canAutomaticallyPauseScanner];
  if (v5)
  {
    BOOL v5 = [(SCATDriver *)self hasIdleTimeExpired];
    if (v5)
    {
      v6 = [(SCATDriver *)self delegate];
      id v7 = [v6 minimumPointPickerNumberOfCyclesForDriver:self];

      if ((unint64_t)v7 <= a3)
      {
        [(SCATDriver *)self pauseScanning];
        LOBYTE(v5) = 1;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (int)_preferredBehaviorForSelectCount:(unint64_t)a3 focusContext:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 != 2)
  {
    if (a3 != 1)
    {
      int v10 = 0;
      goto LABEL_9;
    }
    id v7 = [v5 element];
    unsigned __int8 v8 = [v7 scatSupportsAction:2010];

    if (v8)
    {
      int v9 = 1;
      goto LABEL_12;
    }
    if ([v6 isGroup])
    {
      int v9 = 3;
      goto LABEL_12;
    }
  }
  int v10 = 2;
LABEL_9:
  char v11 = +[AXSettings sharedInstance];
  unsigned int v12 = [v11 switchControlHasEmptyTopLevelMenu];

  if (v12) {
    int v9 = 1;
  }
  else {
    int v9 = v10;
  }
LABEL_12:

  return v9;
}

- (int)_sourceForFocusContext:(id)a3
{
  return [a3 selectBehavior] == 4;
}

- (int)_nextFocusSourceFromSource:(int)a3 inDirection:(int64_t)a4
{
  return a3 != 1;
}

- (id)_focusContextForSource:(int)a3 inDirection:(int64_t)a4 currentContext:(id)a5
{
  id v8 = a5;
  unsigned int v15 = 0;
  if (a3)
  {
    int v9 = [(SCATDriver *)self _drillOutFocusContextForParentGroupOfFocusContext:v8];
    goto LABEL_15;
  }
  int v10 = [(SCATDriver *)self activeElementManager];
  if ([v8 selectBehavior] != 4)
  {
    if (a4 == 1) {
      [v10 lastElementWithOptions:&v15];
    }
    else {
    v13 = [v10 firstElementWithOptions:&v15];
    }
    if (v13) {
      goto LABEL_10;
    }
LABEL_13:
    int v9 = 0;
    goto LABEL_14;
  }
  char v11 = [v8 element];
  unsigned int v12 = v11;
  if (a4 == 1) {
    [v11 lastChild];
  }
  else {
  v13 = [v11 firstChild];
  }

  if (!v13) {
    goto LABEL_13;
  }
LABEL_10:
  int v9 = +[SCATFocusContext focusContextWithElement:v13 elementManager:v10 selectBehavior:0 options:v15];
LABEL_14:

LABEL_15:

  return v9;
}

- (id)_focusContextAdjacentToSource:(int)a3 direction:(int64_t)a4 fromContext:(id)a5 checkedSources:(unint64_t)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  uint64_t v11 = [(SCATDriver *)self _nextFocusSourceFromSource:v8 inDirection:a4];
  uint64_t v12 = [(SCATDriver *)self _focusContextForSource:v11 inDirection:a4 currentContext:v10];
  v13 = (void *)v12;
  if (a6 <= 1 && !v12)
  {
    v13 = [(SCATDriver *)self _focusContextAdjacentToSource:v11 direction:a4 fromContext:v10 checkedSources:a6 + 1];
  }

  return v13;
}

- (id)_drillOutFocusContextForParentGroupOfFocusContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 element];
  v6 = [v5 parentGroup];

  id v7 = [v4 elementManager];
  LODWORD(self) = [(SCATDriver *)self _shouldFocusToEscapeParentGroup:v6 elementManager:v7];

  if (self)
  {
    uint64_t v8 = [v4 elementManager];
    int v9 = +[SCATFocusContext focusContextWithElement:v6 elementManager:v8 selectBehavior:4 options:0];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (id)_focusContextFromPrimaryContext:(id)a3 inDirection:(int64_t)a4 didWrap:(BOOL *)a5
{
  unsigned int v18 = 0;
  BOOL v17 = 0;
  id v7 = a3;
  uint64_t v8 = [v7 elementManager];
  int v9 = [v7 element];
  id v10 = [v8 siblingOfElement:v9 inDirection:a4 didWrap:&v17 options:&v18];

  uint64_t v11 = [v7 elementManager];

  if (v10)
  {
    uint64_t v12 = +[SCATFocusContext focusContextWithElement:v10 elementManager:v11 selectBehavior:0 options:v18];
    v13 = +[SCATScannerManager sharedManager];
    char v14 = [v13 menu];

    if ([v14 isVisible])
    {
      unsigned int v15 = [v14 element];
      [v12 setMenuElement:v15];
    }
    if (a5) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (a5) {
LABEL_5:
    }
      *a5 = v17;
  }

  return v12;
}

- (id)nextFocusContextFromContext:(id)a3 inDirection:(int64_t)a4 didWrap:(BOOL *)a5
{
  id v8 = a3;
  int v9 = +[AXSubsystemSCElementNav sharedInstance];
  unsigned __int8 v10 = [v9 ignoreLogging];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = +[AXSubsystemSCElementNav identifier];
    uint64_t v12 = AXLoggerForFacility();

    os_log_type_t v13 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v12, v13))
    {
      char v14 = AXColorizeFormatLog();
      v59 = [v8 elemLog];
      unsigned int v15 = _AXStringForArgs();

      if (os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138543362;
        v69 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "%{public}@", buf, 0xCu);
      }
    }
  }
  v16 = -[SCATDriver _focusedElementManagerForContext:](self, "_focusedElementManagerForContext:", v8, v59);
  if (v16)
  {
    uint64_t v17 = [(SCATDriver *)self _sourceForFocusContext:v8];
    char v67 = 0;
    int64_t v66 = a4;
    if (v17)
    {
      unsigned int v18 = a5;
      v19 = 0;
    }
    else
    {
      v19 = [(SCATDriver *)self _focusContextFromPrimaryContext:v8 inDirection:a4 didWrap:&v67];
      v29 = +[AXSubsystemSCElementNav sharedInstance];
      unsigned __int8 v30 = [v29 ignoreLogging];

      if (v30)
      {
        unsigned int v18 = a5;
      }
      else
      {
        v31 = +[AXSubsystemSCElementNav identifier];
        v32 = AXLoggerForFacility();

        os_log_type_t v33 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = AXColorizeFormatLog();
          v60 = [v19 elemLog];
          v35 = (void *)v34;
          v36 = _AXStringForArgs();

          if (os_log_type_enabled(v32, v33))
          {
            *(_DWORD *)buf = 138543362;
            v69 = v36;
            _os_log_impl((void *)&_mh_execute_header, v32, v33, "%{public}@", buf, 0xCu);
          }
        }
        unsigned int v18 = a5;
      }
    }
    v37 = objc_msgSend(v8, "element", v60);
    v38 = [v19 menuElement];

    if (v37 == v38)
    {
      v39 = +[AXSubsystemSCElementNav sharedInstance];
      unsigned __int8 v40 = [v39 ignoreLogging];

      if ((v40 & 1) == 0)
      {
        v41 = +[AXSubsystemSCElementNav identifier];
        v42 = AXLoggerForFacility();

        os_log_type_t v43 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v42, v43))
        {
          v64 = AXColorizeFormatLog();
          v65 = _AXStringForArgs();
          if (os_log_type_enabled(v42, v43))
          {
            *(_DWORD *)buf = 138543362;
            v69 = v65;
            _os_log_impl((void *)&_mh_execute_header, v42, v43, "%{public}@", buf, 0xCu);
          }
        }
      }
    }
    a5 = v18;
    if (v19 && (!v67 || v37 == v38))
    {
      v27 = v19;
    }
    else
    {
      v27 = [(SCATDriver *)self _focusContextAdjacentToSource:v17 direction:v66 fromContext:v8 checkedSources:0];

      v44 = +[AXSubsystemSCElementNav sharedInstance];
      unsigned __int8 v45 = [v44 ignoreLogging];

      if ((v45 & 1) == 0)
      {
        v46 = +[AXSubsystemSCElementNav identifier];
        v47 = AXLoggerForFacility();

        os_log_type_t v48 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v47, v48))
        {
          v49 = AXColorizeFormatLog();
          v61 = [v27 elemLog];
          v50 = _AXStringForArgs();

          if (os_log_type_enabled(v47, v48))
          {
            *(_DWORD *)buf = 138543362;
            v69 = v50;
            _os_log_impl((void *)&_mh_execute_header, v47, v48, "%{public}@", buf, 0xCu);
          }
        }
      }
    }
    BOOL v28 = v67 != 0;
    if (!v27)
    {
LABEL_43:
      v51 = +[AXSubsystemSCElementNav sharedInstance];
      unsigned __int8 v52 = [v51 ignoreLogging];

      if ((v52 & 1) == 0)
      {
        v53 = +[AXSubsystemSCElementNav identifier];
        v54 = AXLoggerForFacility();

        os_log_type_t v55 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v54, v55))
        {
          v56 = AXColorizeFormatLog();
          id v62 = v8;
          v57 = _AXStringForArgs();
          if (os_log_type_enabled(v54, v55))
          {
            *(_DWORD *)buf = 138543362;
            v69 = v57;
            _os_log_impl((void *)&_mh_execute_header, v54, v55, "%{public}@", buf, 0xCu);
          }
        }
      }
      v27 = [(SCATDriver *)self firstFocusContext];
    }
  }
  else
  {
    v20 = +[AXSubsystemSCElementNav sharedInstance];
    unsigned __int8 v21 = [v20 ignoreLogging];

    if ((v21 & 1) == 0)
    {
      v22 = +[AXSubsystemSCElementNav identifier];
      v23 = AXLoggerForFacility();

      os_log_type_t v24 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = AXColorizeFormatLog();
        v60 = [v8 elementManager];
        uint64_t v63 = 0;
        v26 = _AXStringForArgs();

        if (os_log_type_enabled(v23, v24))
        {
          *(_DWORD *)buf = 138543362;
          v69 = v26;
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "%{public}@", buf, 0xCu);
        }
      }
    }
    v27 = [(SCATDriver *)self firstFocusContext];
    BOOL v28 = 0;
    if (!v27) {
      goto LABEL_43;
    }
  }
  if (a5) {
    *a5 = v28;
  }

  return v27;
}

- (id)firstFocusContext
{
  v2 = [(SCATDriver *)self activeElementManager];
  unsigned int v6 = 0;
  unsigned __int8 v3 = [v2 firstElementWithOptions:&v6];
  if (v3)
  {
    id v4 = +[SCATFocusContext focusContextWithElement:v3 elementManager:v2 selectBehavior:0 options:v6];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_stepToNextFocusContextInDirection:(int64_t)a3
{
  id v5 = [(SCATDriver *)self focusContext];
  unsigned int v6 = [(SCATDriver *)self _focusedElementManagerForContext:v5];

  id v7 = [(SCATDriver *)self focusContext];
  id v8 = [v7 elementManager];

  if ([v6 isEqual:v8])
  {
    char v17 = 0;
    int v9 = [(SCATDriver *)self focusContext];
    unsigned __int8 v10 = [(SCATDriver *)self nextFocusContextFromContext:v9 inDirection:a3 didWrap:&v17];

    if (v17) {
      [(SCATDriver *)self _didWrapInDirection:a3];
    }
  }
  else
  {
    unsigned __int8 v10 = [(SCATDriver *)self firstFocusContext];
  }
  uint64_t v11 = +[SCATScannerManager sharedManager];
  uint64_t v12 = [v11 menu];
  unsigned int v13 = [v12 isVisible];

  if (v13)
  {
    char v14 = +[SCATScannerManager sharedManager];
    unsigned int v15 = [v14 menu];
    v16 = [v15 element];
    [v10 setMenuElement:v16];
  }
  [(SCATDriver *)self _willStepToNextFocusContext:v10 inDirection:a3];
  if (v10) {
    [(SCATDriver *)self setFocusContext:v10];
  }
}

- (void)handleDrillInOnGroup:(id)a3 elementManager:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v7 = [(SCATDriver *)self focusContext];
    id v6 = [v7 elementManager];
  }
  id v8 = [v10 firstChild];
  int v9 = +[SCATFocusContext focusContextWithElement:v8 elementManager:v6 selectBehavior:0 options:0];
  [v9 setFirstInSequence:1];
  [(SCATDriver *)self willDrillIntoGroup];
  [(SCATDriver *)self setFocusContext:v9];
}

- (void)handleDrillOutOnGroup:(id)a3 elementManager:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v7 = [(SCATDriver *)self focusContext];
    id v6 = [v7 elementManager];
  }
  id v8 = [v6 focusContextAfterDrillOutOnGroup:v9];
  [v8 setFirstInSequence:1];
  [(SCATDriver *)self willDrillOutOfGroup];
  [(SCATDriver *)self setFocusContext:v8];
}

- (BOOL)handleInputAction:(id)a3
{
  id v4 = a3;
  if ([v4 action] != (id)103 && objc_msgSend(v4, "action") != (id)109)
  {
    id v5 = [(SCATDriver *)self selectActionHandler];
    [v5 cancelPendingAction];
  }
  id v6 = [(SCATDriver *)self focusContext];
  id v7 = [v6 element];

  id v8 = [(SCATDriver *)self activeElementManager];
  unsigned int v9 = [v8 handleInputAction:v4 withElement:v7];

  if (v9)
  {
    [(SCATDriver *)self _resetIdleTimer];
LABEL_6:
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
    switch((unint64_t)[v4 action])
    {
      case 'd':
        if ([(SCATDriver *)self _handleActivateAction]) {
          goto LABEL_6;
        }
        goto LABEL_9;
      case 'f':
        unsigned __int8 v11 = [(SCATDriver *)self _handleRunAction];
        goto LABEL_15;
      case 'g':
LABEL_9:
        unsigned __int8 v11 = [(SCATDriver *)self _handleSelectAction];
        goto LABEL_15;
      case 'h':
        unsigned __int8 v11 = [(SCATDriver *)self _handleStepNextAction];
        goto LABEL_15;
      case 'i':
        unsigned __int8 v11 = [(SCATDriver *)self _handleStepPreviousAction];
        goto LABEL_15;
      case 'j':
        unsigned __int8 v11 = [(SCATDriver *)self _handleStopAction];
        goto LABEL_15;
      case 'm':
        unsigned __int8 v11 = [(SCATDriver *)self _handleSelectAndResumeAutoscanningAction];
LABEL_15:
        BOOL v10 = v11;
        break;
      default:
        break;
    }
  }

  return v10;
}

- (BOOL)_handleActivateAction
{
  unsigned __int8 v3 = [(SCATDriver *)self focusContext];
  id v4 = [v3 element];

  if (!v4) {
    goto LABEL_10;
  }
  if ([v4 isGroup])
  {
    id v5 = [(SCATDriver *)self focusContext];
    unsigned int v6 = [v5 selectBehavior];

    if (v6 == 4)
    {
      [(SCATDriver *)self handleDrillOutOnGroup:v4 elementManager:0];
      goto LABEL_8;
    }
    if (v6 == 3)
    {
      [(SCATDriver *)self handleDrillInOnGroup:v4 elementManager:0];
LABEL_8:
      unsigned __int8 v8 = 1;
      goto LABEL_11;
    }
    BOOL v10 = [(SCATDriver *)self focusContext];
    _AXLogWithFacility();

LABEL_10:
    unsigned __int8 v8 = 0;
    goto LABEL_11;
  }
  id v7 = +[SCATScannerManager sharedManager];
  unsigned __int8 v8 = [v7 activateElement:v4];

LABEL_11:
  return v8;
}

- (BOOL)_fireSelectActionWithCount:(unint64_t)a3 preferrsMenuOnFirstPress:(BOOL)a4
{
  id v7 = [(SCATDriver *)self focusContext];
  unsigned __int8 v8 = +[SCATScannerManager sharedManager];
  unsigned int v9 = [v7 element];
  BOOL v10 = [v8 menu];
  unsigned __int8 v11 = [v10 element];
  if (v9 == v11)
  {
    uint64_t v12 = [v8 menu];
    unsigned int v13 = [v12 isVisible];

    if (v13)
    {
      char v14 = [v8 menu];
      [v14 hideWithCompletion:0];

      unsigned int v15 = +[HNDAccessibilityManager sharedManager];
      [v15 refreshElements];
LABEL_5:

LABEL_43:
      BOOL v21 = 1;
      goto LABEL_44;
    }
  }
  else
  {
  }
  unsigned int v16 = [(SCATDriver *)self _preferredBehaviorForSelectCount:a3 focusContext:v7];
  unsigned int v17 = [v7 selectBehavior];
  if (v7)
  {
    if (v17 == 3 && v16 == 2) {
      int v19 = 2;
    }
    else {
      int v19 = v17;
    }
    if (((v16 == 1) & ~a4 & (v17 == 2)) != 0) {
      int v20 = 1;
    }
    else {
      int v20 = v19;
    }
    switch(v20)
    {
      case 1:
        if ([(SCATDriver *)self _handleActivateAction]) {
          goto LABEL_43;
        }
        BOOL v21 = [(SCATDriver *)self _handleSelectAction];
        goto LABEL_44;
      case 2:
        unsigned int v15 = [v7 element];
        v22 = +[SCATScannerManager sharedManager];
        v23 = [v22 menu];
        [v23 presentWithElement:v15];

        if ([v15 scatIsAXElement])
        {
          [v15 setNativeFocus];
          UIAccessibilityPostNotification(0x41Du, 0);
        }
        goto LABEL_5;
      case 3:
        os_log_type_t v24 = [v7 element];
        if (([v24 isGroup] & 1) == 0) {
          _AXAssert();
        }
        if ([v24 isGroup])
        {
          [(SCATDriver *)self handleDrillInOnGroup:v24 elementManager:0];
          goto LABEL_42;
        }
        v25 = +[AXSubsystemSCElementNav sharedInstance];
        unsigned __int8 v26 = [v25 ignoreLogging];

        if (v26) {
          goto LABEL_42;
        }
        v27 = +[AXSubsystemSCElementNav identifier];
        BOOL v28 = AXLoggerForFacility();

        os_log_type_t v29 = AXOSLogLevelFromAXLogLevel();
        if (!os_log_type_enabled(v28, v29)) {
          goto LABEL_41;
        }
        unsigned __int8 v30 = AXColorizeFormatLog();
        v31 = _AXStringForArgs();
        if (!os_log_type_enabled(v28, v29)) {
          goto LABEL_40;
        }
        *(_DWORD *)buf = 138543362;
        v37 = v31;
        goto LABEL_39;
      case 4:
        os_log_type_t v24 = [v7 element];
        if (([v24 isGroup] & 1) == 0) {
          _AXAssert();
        }
        if ([v24 isGroup])
        {
          [(SCATDriver *)self handleDrillOutOnGroup:v24 elementManager:0];
        }
        else
        {
          v32 = +[AXSubsystemSCElementNav sharedInstance];
          unsigned __int8 v33 = [v32 ignoreLogging];

          if ((v33 & 1) == 0)
          {
            uint64_t v34 = +[AXSubsystemSCElementNav identifier];
            BOOL v28 = AXLoggerForFacility();

            os_log_type_t v29 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v28, v29))
            {
              unsigned __int8 v30 = AXColorizeFormatLog();
              v31 = _AXStringForArgs();
              if (os_log_type_enabled(v28, v29))
              {
                *(_DWORD *)buf = 138543362;
                v37 = v31;
LABEL_39:
                _os_log_impl((void *)&_mh_execute_header, v28, v29, "%{public}@", buf, 0xCu);
              }
LABEL_40:
            }
LABEL_41:
          }
        }
LABEL_42:

        break;
      default:
        _AXAssert();
        goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_18:
  BOOL v21 = 0;
LABEL_44:

  return v21;
}

- (BOOL)_handleSelectAction
{
  unsigned __int8 v3 = [(SCATDriver *)self selectActionHandler];
  [v3 notifyDidReceiveAction:self];

  return 1;
}

- (BOOL)_handleSelectAndResumeAutoscanningAction
{
  unsigned __int8 v3 = [(SCATDriver *)self selectAndResumeAutoscanningActionHandler];
  [v3 notifyDidReceiveAction:self];

  return 1;
}

- (BOOL)_handleRunAction
{
  return 0;
}

- (BOOL)_handleStopAction
{
  return 0;
}

- (BOOL)_handleStepNextAction
{
  return 0;
}

- (BOOL)_handleStepPreviousAction
{
  return 0;
}

- (BOOL)isSpeakingFocusContext
{
  v2 = [(SCATDriver *)self currentSpeechFocusContext];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)outputManager:(id)a3 willSpeakFocusContext:(id)a4
{
  [(SCATDriver *)self setCurrentSpeechFocusContext:a4];

  [(SCATDriver *)self _cancelIdleTimer];
}

- (void)outputManager:(id)a3 didSpeakFocusContext:(id)a4
{
  id v5 = a4;
  id v6 = [(SCATDriver *)self currentSpeechFocusContext];

  if (v6 == v5)
  {
    [(SCATDriver *)self setCurrentSpeechFocusContext:0];
    [(SCATDriver *)self _resetIdleTimer];
  }
}

- (void)_cancelIdleTimer
{
  id v2 = [(SCATDriver *)self idleTimer];
  [v2 cancel];
}

- (void)_resetIdleTimer
{
  self->_hasIdleTimeExpired = 0;
  BOOL v3 = [(SCATDriver *)self idleTimer];
  [v3 cancel];

  id v4 = +[AXSettings sharedInstance];
  unsigned int v5 = [v4 assistiveTouchScanTimeoutEnabled];

  if (v5)
  {
    id v6 = +[AXSettings sharedInstance];
    [v6 assistiveTouchScanTimeout];
    double v8 = v7;

    unsigned int v9 = [(SCATDriver *)self idleTimer];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002238C;
    v10[3] = &unk_1001AAA90;
    v10[4] = self;
    [v9 afterDelay:v10 processBlock:v8];
  }
}

- (void)_didWrapInDirection:(int64_t)a3
{
}

- (BOOL)_canAutomaticallyPauseScanner
{
  id v2 = [(SCATDriver *)self activeElementManager];
  char v3 = [v2 shouldKeepScannerAwake] ^ 1;

  return v3;
}

- (BOOL)_shouldFocusToEscapeParentGroup:(id)a3 elementManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [(SCATDriver *)self isGroupingEnabled]) {
    unsigned int v8 = [v6 isRootGroup] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_canTransitionToPhase:(int)a3
{
  return a3 != 2 || self->_phase == 1;
}

- (void)_didTransitionToPhase:(int)a3
{
  int phase = self->_phase;
  self->_int phase = a3;
  if (a3)
  {
    if (a3 == 1)
    {
      [(SCATDriver *)self _resetIdleTimer];
      unsigned int v9 = [(SCATDriver *)self delegate];
      char v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0) {
        return;
      }
      id v11 = [(SCATDriver *)self delegate];
      [v11 driverDidBecomeActive:self didChange:phase != 1];
    }
    else
    {
      if (a3 != 2) {
        return;
      }
      [(SCATDriver *)self _cancelIdleTimer];
      unsigned int v5 = [(SCATDriver *)self delegate];
      char v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) == 0) {
        return;
      }
      id v11 = [(SCATDriver *)self delegate];
      [v11 driverDidPause:self];
    }
  }
  else
  {
    [(SCATDriver *)self _cancelIdleTimer];
    id v7 = [(SCATDriver *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      return;
    }
    id v11 = [(SCATDriver *)self delegate];
    [v11 driverDidBecomeInactive:self];
  }
}

- (BOOL)actionHandler:(id)a3 shouldActImmediatelyOnActionCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SCATDriver *)self selectActionHandler];
  unsigned int v8 = [v6 isEqual:v7];

  if (!v8) {
    return 1;
  }
  unsigned int v9 = [(SCATDriver *)self focusContext];
  unsigned int v10 = [v9 selectBehavior];

  id v11 = [(SCATDriver *)self focusContext];
  unsigned __int8 v12 = [v11 waitsForSelectAction];

  if (a4 != 1 || (v12 & 1) == 0)
  {
    if (v10 == 2)
    {
      char v14 = +[SCATScannerManager sharedManager];
      BOOL v13 = [v14 immediateSelectActionCount] == (id)a4;

      return v13;
    }
    return 1;
  }
  return 0;
}

- (void)actionHandlerDidFireAction:(id)a3
{
  id v7 = a3;
  id v4 = [(SCATDriver *)self selectActionHandler];
  if ([v7 isEqual:v4])
  {
  }
  else
  {
    unsigned int v5 = [(SCATDriver *)self selectAndResumeAutoscanningActionHandler];
    unsigned int v6 = [v7 isEqual:v5];

    if (!v6) {
      goto LABEL_5;
    }
  }
  -[SCATDriver _fireSelectActionWithCount:preferrsMenuOnFirstPress:](self, "_fireSelectActionWithCount:preferrsMenuOnFirstPress:", [v7 actionCount], objc_msgSend(v7, "shouldShowMenuOnFirstSelectAction"));
LABEL_5:
}

- (SCATDriverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCATDriverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)phase
{
  return self->_phase;
}

- (void)setPhase:(int)a3
{
  self->_int phase = a3;
}

- (AXDispatchTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
}

- (BOOL)hasIdleTimeExpired
{
  return self->_hasIdleTimeExpired;
}

- (void)setHasIdleTimeExpired:(BOOL)a3
{
  self->_hasIdleTimeExpired = a3;
}

- (int64_t)lastWrapDirection
{
  return self->_lastWrapDirection;
}

- (void)setLastWrapDirection:(int64_t)a3
{
  self->_lastWrapDirection = a3;
}

- (SCATFocusContext)currentSpeechFocusContext
{
  return self->_currentSpeechFocusContext;
}

- (void)setCurrentSpeechFocusContext:(id)a3
{
  self->_currentSpeechFocusContext = (SCATFocusContext *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_focusContext, 0);
}

- (SCATDriver)init
{
  return 0;
}

@end