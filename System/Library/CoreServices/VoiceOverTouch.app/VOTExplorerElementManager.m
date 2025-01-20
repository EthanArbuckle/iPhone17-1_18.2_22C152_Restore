@interface VOTExplorerElementManager
- (BOOL)elementsDidChangeOnLastUpdate;
- (BOOL)startedReadingCurrentElements;
- (NSArray)explorerElements;
- (SCRCTargetSelectorTimer)readAllExplorerElementsTimer;
- (SCRCThread)targetThread;
- (VOTElement)currentExplorerElement;
- (VOTElement)focusedElement;
- (VOTExplorerElementManager)initWithTargetThread:(id)a3;
- (VOTExplorerElementManagerContext)currentReadAllContext;
- (VOTExplorerElementManagerDelegate)delegate;
- (VOTOutputRequest)lastExplorerOutputRequest;
- (VOTTVSpeechRequestManager)tvSpeechRequestManager;
- (id)_nextExplorerElementInDirection:(unint64_t)a3 fromElement:(id)a4 didWrap:(BOOL *)a5;
- (void)__outputRequestFinished:(id)a3;
- (void)_finalizeReadAllOperation:(BOOL)a3;
- (void)_finalizeReadAllOperation:(BOOL)a3 interruptSpeechIfNeeded:(BOOL)a4;
- (void)_readElementInDirection:(unint64_t)a3 assignNativeFocus:(BOOL)a4;
- (void)_sendExplorerOutputRequest:(id)a3 forceReread:(BOOL)a4 interruptCurrentSpeech:(BOOL)a5;
- (void)_updateCurrentElementByMovingInDirection:(unint64_t)a3 fromElement:(id)a4 context:(id)a5;
- (void)cancelCurrentReadAll;
- (void)cancelPendingReadAll;
- (void)dealloc;
- (void)outputRequestFinished:(id)a3;
- (void)readAll:(id)a3;
- (void)readAllAfterDelay:(double)a3 context:(id)a4;
- (void)readNextElementAndAssignNativeFocus:(BOOL)a3;
- (void)readPreviousElementAndAssignNativeFocus:(BOOL)a3;
- (void)setCurrentExplorerElement:(id)a3;
- (void)setCurrentReadAllContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElementsDidChangeOnLastUpdate:(BOOL)a3;
- (void)setExplorerElements:(id)a3;
- (void)setFocusedElement:(id)a3;
- (void)setLastExplorerOutputRequest:(id)a3;
- (void)setReadAllExplorerElementsTimer:(id)a3;
- (void)setStartedReadingCurrentElements:(BOOL)a3;
- (void)setTargetThread:(id)a3;
- (void)setTvSpeechRequestManager:(id)a3;
- (void)updateWithExplorerElements:(id)a3 focusedElement:(id)a4;
@end

@implementation VOTExplorerElementManager

- (VOTExplorerElementManager)initWithTargetThread:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VOTExplorerElementManager;
  v5 = [(VOTExplorerElementManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    [(VOTExplorerElementManager *)v5 setTargetThread:v4];
    v7 = objc_alloc_init(VOTTVSpeechRequestManager);
    [(VOTExplorerElementManager *)v6 setTvSpeechRequestManager:v7];
    id v8 = objc_allocWithZone((Class)SCRCTargetSelectorTimer);
    v9 = [(VOTExplorerElementManager *)v6 targetThread];
    id v10 = [v8 initWithTarget:v6 selector:"_handleReadAllExplorerElementsTimerDidFire:" thread:v9];

    [(VOTExplorerElementManager *)v6 setReadAllExplorerElementsTimer:v10];
  }

  return v6;
}

- (void)dealloc
{
  [(VOTExplorerElementManager *)self setDelegate:0];
  [(VOTExplorerElementManager *)self setFocusedElement:0];
  v3 = [(VOTExplorerElementManager *)self readAllExplorerElementsTimer];
  [v3 invalidate];

  [(VOTExplorerElementManager *)self setReadAllExplorerElementsTimer:0];
  [(VOTExplorerElementManager *)self setTargetThread:0];
  [(VOTExplorerElementManager *)self setExplorerElements:0];
  [(VOTExplorerElementManager *)self setCurrentExplorerElement:0];
  [(VOTExplorerElementManager *)self setLastExplorerOutputRequest:0];
  [(VOTExplorerElementManager *)self setTvSpeechRequestManager:0];
  [(VOTExplorerElementManager *)self setCurrentReadAllContext:0];
  v4.receiver = self;
  v4.super_class = (Class)VOTExplorerElementManager;
  [(VOTExplorerElementManager *)&v4 dealloc];
}

- (void)updateWithExplorerElements:(id)a3 focusedElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v9 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v9 & 1) == 0) {
    _AXAssert();
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10010B3AC;
  v26[3] = &unk_1001B70E8;
  v26[4] = &v27;
  id v10 = [v6 axFilterObjectsUsingBlock:v26];
  v11 = v10;
  if (*((unsigned char *)v28 + 24))
  {
    id v12 = v10;

    id v6 = v12;
  }
  v13 = [(VOTExplorerElementManager *)self explorerElements];
  unsigned int v14 = [v6 axIsEqualToOrderedArray:v13 withPredicate:&stru_1001B7128];

  v15 = VOTLogTVExplorer();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = +[NSNumber numberWithBool:v14 ^ 1];
    v17 = +[NSThread callStackSymbols];
    *(_DWORD *)buf = 138543618;
    id v32 = v16;
    __int16 v33 = 2114;
    id v34 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Explorer elements did change? %{public}@\n%{public}@", buf, 0x16u);
  }
  [(VOTExplorerElementManager *)self setFocusedElement:v7];
  [(VOTExplorerElementManager *)self setElementsDidChangeOnLastUpdate:v14 ^ 1];
  if ((v14 & 1) == 0)
  {
    v18 = [(VOTExplorerElementManager *)self tvSpeechRequestManager];
    [v18 reset];

    [(VOTExplorerElementManager *)self _finalizeReadAllOperation:0];
    [(VOTExplorerElementManager *)self setExplorerElements:v6];
    [(VOTExplorerElementManager *)self setStartedReadingCurrentElements:0];
    v19 = VOTLogTVExplorer();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v32 = v6;
      __int16 v33 = 2114;
      id v34 = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "New Explorer Elements: %{public}@\nFocus Element: %{public}@", buf, 0x16u);
    }
  }
  v20 = [(VOTExplorerElementManager *)self currentExplorerElement];
  if (v20)
  {
    v21 = [(VOTExplorerElementManager *)self explorerElements];
    v22 = [(VOTExplorerElementManager *)self currentExplorerElement];
    if ([v21 containsObject:v22])
    {
    }
    else
    {
      v23 = [(VOTExplorerElementManager *)self currentExplorerElement];
      v24 = [(VOTExplorerElementManager *)self focusedElement];
      unsigned __int8 v25 = [v23 isEqual:v24];

      if ((v25 & 1) == 0) {
        [(VOTExplorerElementManager *)self setCurrentExplorerElement:0];
      }
    }
  }

  _Block_object_dispose(&v27, 8);
}

- (void)cancelCurrentReadAll
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v4 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v4 & 1) == 0) {
    _AXAssert();
  }
  v5 = VOTLogTVExplorer();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Explicitily canceling explorer ReadAll", v6, 2u);
  }

  [(VOTExplorerElementManager *)self _finalizeReadAllOperation:0];
}

- (void)readAllAfterDelay:(double)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = [(VOTExplorerElementManager *)self readAllExplorerElementsTimer];
  [v7 dispatchAfterDelay:v6 withObject:a3];
}

- (void)cancelPendingReadAll
{
  id v2 = [(VOTExplorerElementManager *)self readAllExplorerElementsTimer];
  [v2 cancel];
}

- (void)readAll:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v6 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v6 & 1) == 0) {
    _AXAssert();
  }
  id v7 = VOTLogTVExplorer();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Checking readAll preconditions...", buf, 2u);
  }

  if ([v4 userInitiated])
  {
    id v8 = [(VOTExplorerElementManager *)self tvSpeechRequestManager];
    [v8 reset];
  }
  [(VOTExplorerElementManager *)self cancelPendingReadAll];
  if (([v4 userInitiated] & 1) == 0
    && ![(VOTExplorerElementManager *)self elementsDidChangeOnLastUpdate]
    && [(VOTExplorerElementManager *)self startedReadingCurrentElements])
  {
    unsigned __int8 v9 = VOTLogTVExplorer();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Bailing on readAll: Not user initiated and elements didn't change since last time", v20, 2u);
    }
    goto LABEL_25;
  }
  id v10 = [(VOTExplorerElementManager *)self explorerElements];
  if ([v10 count])
  {

LABEL_15:
    id v12 = [(VOTExplorerElementManager *)self delegate];
    [v12 willBeginReadAll:self];

    +[NSDate timeIntervalSinceReferenceDate];
    objc_msgSend(v4, "setBeginTimestamp:");
    [(VOTExplorerElementManager *)self setCurrentReadAllContext:v4];
    [(VOTExplorerElementManager *)self setStartedReadingCurrentElements:1];
    v13 = VOTLogTVExplorer();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "About to perform readAll", v18, 2u);
    }

    if ([v4 readFromCurrentExplorerElement])
    {
      unsigned int v14 = self;
      uint64_t v15 = 0;
    }
    else
    {
      unsigned int v14 = self;
      uint64_t v15 = 2;
    }
    [(VOTExplorerElementManager *)v14 _updateCurrentElementByMovingInDirection:v15 fromElement:0 context:v4];
    goto LABEL_26;
  }
  v11 = [(VOTExplorerElementManager *)self focusedElement];

  if (v11) {
    goto LABEL_15;
  }
  v16 = VOTLogTVExplorer();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Bailing on readAll: No explorer elements", v19, 2u);
  }

  if ([v4 userInitiated])
  {
    unsigned __int8 v9 = +[VOTOutputManager outputManager];
    v17 = +[VOSOutputEvent BoundaryEncountered];
    [v9 sendEvent:v17];

LABEL_25:
  }
LABEL_26:
}

- (void)readPreviousElementAndAssignNativeFocus:(BOOL)a3
{
}

- (void)readNextElementAndAssignNativeFocus:(BOOL)a3
{
}

- (void)_readElementInDirection:(unint64_t)a3 assignNativeFocus:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v8 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v8 & 1) == 0) {
    _AXAssert();
  }
  [(VOTExplorerElementManager *)self cancelPendingReadAll];
  [(VOTExplorerElementManager *)self _finalizeReadAllOperation:0];
  unsigned __int8 v9 = [(VOTExplorerElementManager *)self explorerElements];
  id v10 = [v9 count];

  if (v10)
  {
    [(VOTExplorerElementManager *)self setStartedReadingCurrentElements:1];
    id v13 = +[VOTExplorerElementManagerContext context];
    [v13 setAttemptToSetNativeFocus:v4];
    [v13 setUserInitiated:1];
    [v13 setInterruptsCurrentSpeech:1];
    v11 = [(VOTExplorerElementManager *)self tvSpeechRequestManager];
    [v11 resetElements];

    [(VOTExplorerElementManager *)self _updateCurrentElementByMovingInDirection:a3 fromElement:0 context:v13];
  }
  else
  {
    id v13 = +[VOTOutputManager outputManager];
    id v12 = +[VOSOutputEvent BoundaryEncountered];
    [v13 sendEvent:v12];
  }
}

- (void)_updateCurrentElementByMovingInDirection:(unint64_t)a3 fromElement:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v11 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v11 & 1) == 0) {
    _AXAssert();
  }
  unsigned int v12 = [v9 attemptToSetNativeFocus];
  char v31 = 0;
  if (!v8)
  {
    id v8 = [(VOTExplorerElementManager *)self currentExplorerElement];
  }
  id v13 = [(VOTExplorerElementManager *)self _nextExplorerElementInDirection:a3 fromElement:v8 didWrap:&v31];
  unsigned int v14 = [(VOTExplorerElementManager *)self currentReadAllContext];

  if (v14)
  {
    if (v31)
    {
      [(VOTExplorerElementManager *)self _finalizeReadAllOperation:1];
      goto LABEL_19;
    }
    uint64_t v15 = [(VOTExplorerElementManager *)self currentReadAllContext];
    unsigned __int8 v16 = [v15 userInitiated];

    if ((v16 & 1) == 0)
    {
      v17 = [(VOTExplorerElementManager *)self focusedElement];

      if (v13 == v17 || [v13 isMapItem])
      {
        [(VOTExplorerElementManager *)self _updateCurrentElementByMovingInDirection:0 fromElement:v13 context:v9];
        goto LABEL_19;
      }
    }
  }
  if (v13)
  {
    [(VOTExplorerElementManager *)self setCurrentExplorerElement:v13];
    v18 = [(VOTExplorerElementManager *)self delegate];
    [v18 explorerElementManager:self didSetExplorerElementFocus:v13];

    if ([v9 userInitiated])
    {
      v19 = [(VOTExplorerElementManager *)self currentExplorerElement];
      v20 = [(VOTExplorerElementManager *)self focusedElement];
      unsigned int v21 = [v19 isEqual:v20];

      if (v21)
      {
        v22 = +[VOTOutputManager outputManager];
        v23 = +[VOSOutputEvent DidSyncWithSystemFocus];
        [v22 sendEvent:v23];
      }
    }
    if (!v12
      || ([(VOTExplorerElementManager *)self currentExplorerElement],
          v24 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v25 = [v24 setNativeFocus],
          v24,
          (v25 & 1) == 0))
    {
      v26 = [(VOTExplorerElementManager *)self delegate];
      uint64_t v27 = [(VOTExplorerElementManager *)self currentExplorerElement];
      [v26 explorerElementManager:self willReadElement:v27];

      v28 = [(VOTExplorerElementManager *)self tvSpeechRequestManager];
      [v28 updateHeadersAndElementsWithTarget:v13 ignoreLastUpdate:0];

      uint64_t v29 = [(VOTExplorerElementManager *)self tvSpeechRequestManager];
      char v30 = [v29 generateOutputRequest:0];

      -[VOTExplorerElementManager _sendExplorerOutputRequest:forceReread:interruptCurrentSpeech:](self, "_sendExplorerOutputRequest:forceReread:interruptCurrentSpeech:", v30, [v9 userInitiated], objc_msgSend(v9, "interruptsCurrentSpeech"));
    }
  }
LABEL_19:
}

- (id)_nextExplorerElementInDirection:(unint64_t)a3 fromElement:(id)a4 didWrap:(BOOL *)a5
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v10 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v10 & 1) == 0) {
    _AXAssert();
  }
  unsigned __int8 v11 = [(VOTExplorerElementManager *)self explorerElements];
  if ([v11 count])
  {

    if (v8) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  unsigned int v12 = [(VOTExplorerElementManager *)self focusedElement];

  if (v12)
  {
    if (v8) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  _AXAssert();
  if (!v8)
  {
LABEL_8:
    id v8 = [(VOTExplorerElementManager *)self currentExplorerElement];
  }
LABEL_9:
  id v13 = +[NSMutableArray array];
  unsigned int v14 = [(VOTExplorerElementManager *)self explorerElements];
  id v15 = [v14 count];

  if (v15)
  {
    unsigned __int8 v16 = [(VOTExplorerElementManager *)self explorerElements];
    [v13 addObjectsFromArray:v16];
  }
  uint64_t v17 = [(VOTExplorerElementManager *)self focusedElement];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(VOTExplorerElementManager *)self explorerElements];
    v20 = [(VOTExplorerElementManager *)self focusedElement];
    unsigned __int8 v21 = [v19 containsObject:v20];

    if ((v21 & 1) == 0)
    {
      v22 = [(VOTExplorerElementManager *)self focusedElement];
      [v13 addObject:v22];
    }
  }
  if (a3 == 2)
  {
    if (a5) {
      *a5 = 0;
    }
    uint64_t v23 = [v13 firstObject];
LABEL_35:
    unsigned __int8 v25 = (void *)v23;
    goto LABEL_36;
  }
  if (!v8)
  {
    id v8 = [v13 firstObject];
  }
  v24 = (char *)[v13 indexOfObject:v8];
  if (v24 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v26 = v24;
    uint64_t v27 = (char *)[v13 count];
    v28 = v27 - 1;
    if (v26) {
      uint64_t v29 = v26 - 1;
    }
    else {
      uint64_t v29 = v27 - 1;
    }
    BOOL v30 = v26 == v28;
    if (v26 == v28) {
      char v31 = 0;
    }
    else {
      char v31 = v26 + 1;
    }
    if (a3)
    {
      BOOL v30 = v26 == 0;
      id v32 = v29;
    }
    else
    {
      id v32 = v31;
    }
    if (a5) {
      *a5 = v30;
    }
    uint64_t v23 = [v13 objectAtIndex:v32];
    goto LABEL_35;
  }
  unsigned __int8 v25 = 0;
  if (a5) {
    *a5 = 0;
  }
LABEL_36:

  return v25;
}

- (void)_sendExplorerOutputRequest:(id)a3 forceReread:(BOOL)a4 interruptCurrentSpeech:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v11 = v7;
  if (v5)
  {
    id v8 = +[VOTOutputManager outputManager];
    [v8 stopSpeakingAtBoundary:0 allRequests:1 sessionDeactivationDelay:0];

    id v7 = v11;
  }
  [v7 setCompletionDelegate:self];
  [v11 setDoesNotInterrupt:1];
  [v11 setGeneratesBraille:1];
  [v11 send];
  [(VOTExplorerElementManager *)self setLastExplorerOutputRequest:v11];
  id v9 = [v11 outputActions];
  id v10 = [v9 count];

  if (!v10)
  {
    [v11 setFinishedSuccessfully:1];
    [(VOTExplorerElementManager *)self outputRequestFinished:v11];
  }
}

- (void)_finalizeReadAllOperation:(BOOL)a3
{
}

- (void)_finalizeReadAllOperation:(BOOL)a3 interruptSpeechIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v8 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v8 & 1) == 0) {
    _AXAssert();
  }
  id v9 = [(VOTExplorerElementManager *)self currentReadAllContext];

  if (v9)
  {
    if (v4)
    {
      id v10 = VOTLogTVExplorer();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_100124854(v10);
      }

      id v11 = +[VOTOutputManager outputManager];
      [v11 stopSpeakingAtBoundary:0 allRequests:1 sessionDeactivationDelay:0];
    }
    [(VOTExplorerElementManager *)self setCurrentReadAllContext:0];
    unsigned int v12 = VOTLogTVExplorer();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1001247B4(v12);
    }

    id v13 = [(VOTExplorerElementManager *)self delegate];
    [v13 explorerElementManager:self didFinishReadAll:v5];
  }
}

- (void)outputRequestFinished:(id)a3
{
  id v4 = a3;
  id v5 = [(VOTExplorerElementManager *)self targetThread];
  [v5 performSelector:"__outputRequestFinished:" onTarget:self count:1 objects:v4];
}

- (void)__outputRequestFinished:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);
  unsigned __int8 v6 = objc_msgSend(WeakRetained, "_debug_currentlyRunningOnThisThread");

  if ((v6 & 1) == 0) {
    _AXAssert();
  }
  if (([v4 finishedSuccessfully] & 1) != 0
    || ([v4 sendTimestamp],
        double v8 = v7,
        [(VOTExplorerElementManager *)self currentReadAllContext],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v9 beginTimestamp],
        double v11 = v10,
        v9,
        v8 <= v11))
  {
    id v13 = [(VOTExplorerElementManager *)self currentReadAllContext];

    if (v13)
    {
      unsigned int v14 = [(VOTExplorerElementManager *)self currentReadAllContext];
      [(VOTExplorerElementManager *)self _updateCurrentElementByMovingInDirection:0 fromElement:0 context:v14];
    }
  }
  else
  {
    unsigned int v12 = VOTLogTVExplorer();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138477827;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Explorer request did not finish sucessfully: %{private}@", (uint8_t *)&v15, 0xCu);
    }

    [(VOTExplorerElementManager *)self _finalizeReadAllOperation:0 interruptSpeechIfNeeded:0];
  }
}

- (VOTExplorerElementManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTExplorerElementManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VOTElement)focusedElement
{
  return self->_focusedElement;
}

- (void)setFocusedElement:(id)a3
{
}

- (VOTElement)currentExplorerElement
{
  return self->_currentExplorerElement;
}

- (void)setCurrentExplorerElement:(id)a3
{
}

- (NSArray)explorerElements
{
  return self->_explorerElements;
}

- (void)setExplorerElements:(id)a3
{
}

- (VOTTVSpeechRequestManager)tvSpeechRequestManager
{
  return self->_tvSpeechRequestManager;
}

- (void)setTvSpeechRequestManager:(id)a3
{
}

- (SCRCThread)targetThread
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetThread);

  return (SCRCThread *)WeakRetained;
}

- (void)setTargetThread:(id)a3
{
}

- (VOTOutputRequest)lastExplorerOutputRequest
{
  return self->_lastExplorerOutputRequest;
}

- (void)setLastExplorerOutputRequest:(id)a3
{
}

- (SCRCTargetSelectorTimer)readAllExplorerElementsTimer
{
  return self->_readAllExplorerElementsTimer;
}

- (void)setReadAllExplorerElementsTimer:(id)a3
{
}

- (VOTExplorerElementManagerContext)currentReadAllContext
{
  return self->_currentReadAllContext;
}

- (void)setCurrentReadAllContext:(id)a3
{
}

- (BOOL)elementsDidChangeOnLastUpdate
{
  return self->_elementsDidChangeOnLastUpdate;
}

- (void)setElementsDidChangeOnLastUpdate:(BOOL)a3
{
  self->_elementsDidChangeOnLastUpdate = a3;
}

- (BOOL)startedReadingCurrentElements
{
  return self->_startedReadingCurrentElements;
}

- (void)setStartedReadingCurrentElements:(BOOL)a3
{
  self->_startedReadingCurrentElements = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentReadAllContext, 0);
  objc_storeStrong((id *)&self->_readAllExplorerElementsTimer, 0);
  objc_storeStrong((id *)&self->_lastExplorerOutputRequest, 0);
  objc_destroyWeak((id *)&self->_targetThread);
  objc_storeStrong((id *)&self->_tvSpeechRequestManager, 0);
  objc_storeStrong((id *)&self->_explorerElements, 0);
  objc_storeStrong((id *)&self->_currentExplorerElement, 0);
  objc_storeStrong((id *)&self->_focusedElement, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end