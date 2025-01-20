@interface GAXVerifier
- (BOOL)_appWithIdentifierIsInstalledOnDevice:(id)a3;
- (BOOL)_shouldForceAppRelaunchWithVerifyEvent:(unint64_t)a3;
- (BOOL)isVerifyingIntegrity;
- (GAXVerificationEventObject)currentVerificationEvent;
- (GAXVerifier)init;
- (GAXVerifierDelegate)delegate;
- (NSMutableArray)verifyQueue;
- (id)displayStringForOutcome:(unint64_t)a3;
- (int64_t)sessionAppCheckinAttempts;
- (unint64_t)mostRecentOutcome;
- (void)_beginProcessingEventsIfNeeded;
- (void)_didFinishVerifyingCurrentEventWithOutcome:(unint64_t)a3 error:(id)a4;
- (void)_didFinishVerifyingCurrentEventWithOutcomePhase2:(unint64_t)a3 outcomeIsIndeterminate:(BOOL)a4 error:(id)a5;
- (void)_processNextEventInQueue;
- (void)_shouldAttemptLaunchOfSessionAppWithEvent:(unint64_t)a3 gaxState:(id *)a4 completion:(id)a5;
- (void)_verifyWithEventObject:(id)a3 completion:(id)a4;
- (void)didFinishAppLaunchAttemptWithConfiguration:(unsigned int)a3 errorMessage:(id)a4;
- (void)outcome:(unint64_t)a3 isError:(BOOL *)a4 isIndeterminate:(BOOL *)a5;
- (void)pause;
- (void)resume;
- (void)setCurrentVerificationEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMostRecentOutcome:(unint64_t)a3;
- (void)setSessionAppCheckinAttempts:(int64_t)a3;
- (void)setVerifyQueue:(id)a3;
- (void)springBoardDidRelaunch;
- (void)verifyIntegrityWithEvent:(unint64_t)a3;
- (void)verifyIntegrityWithEvent:(unint64_t)a3 afterDelay:(double)a4;
- (void)verifyIntegrityWithEvent:(unint64_t)a3 afterDelay:(double)a4 completion:(id)a5;
@end

@implementation GAXVerifier

- (GAXVerifier)init
{
  v5.receiver = self;
  v5.super_class = (Class)GAXVerifier;
  v2 = [(GAXVerifier *)&v5 init];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    [(GAXVerifier *)v2 setVerifyQueue:v3];
  }
  return v2;
}

- (BOOL)isVerifyingIntegrity
{
  return self->_isProcessingEventQueue;
}

- (void)verifyIntegrityWithEvent:(unint64_t)a3
{
}

- (void)verifyIntegrityWithEvent:(unint64_t)a3 afterDelay:(double)a4
{
}

- (void)verifyIntegrityWithEvent:(unint64_t)a3 afterDelay:(double)a4 completion:(id)a5
{
  id v8 = a5;
  v10 = objc_alloc_init(GAXVerificationEventObject);
  [(GAXVerificationEventObject *)v10 setEvent:a3];
  [(GAXVerificationEventObject *)v10 setDelay:a4];
  [(GAXVerificationEventObject *)v10 setCompletion:v8];

  v9 = [(GAXVerifier *)self verifyQueue];
  [v9 addObject:v10];

  [(GAXVerifier *)self _beginProcessingEventsIfNeeded];
}

- (void)pause
{
  v3 = GAXLogIntegrity();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Pausing verification.", v4, 2u);
  }

  self->_paused = 1;
}

- (void)resume
{
  v3 = GAXLogIntegrity();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Resuming verification.", v6, 2u);
  }

  self->_paused = 0;
  v4 = [(GAXVerifier *)self verifyQueue];
  id v5 = [v4 count];

  if (v5) {
    [(GAXVerifier *)self _beginProcessingEventsIfNeeded];
  }
}

- (void)didFinishAppLaunchAttemptWithConfiguration:(unsigned int)a3 errorMessage:(id)a4
{
  if (a4)
  {
    v4 = +[NSError ax_errorWithDomain:@"GAXAppLaunching", @"%@", a4 description];
  }
  else
  {
    v4 = 0;
  }
  v6 = v4;
  id v5 = v4;
  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)springBoardDidRelaunch
{
}

- (void)outcome:(unint64_t)a3 isError:(BOOL *)a4 isIndeterminate:(BOOL *)a5
{
  if (a3 - 6 < 0x11) {
    goto LABEL_2;
  }
  if (a3 - 23 < 5)
  {
    BOOL v8 = 0;
    BOOL v7 = 1;
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (!a3)
  {
    v9 = GAXLogIntegrity();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_29E48(v9);
    }

LABEL_2:
    BOOL v7 = 0;
    BOOL v8 = 1;
    if (!a4) {
      goto LABEL_7;
    }
LABEL_6:
    *a4 = v8;
    goto LABEL_7;
  }
  BOOL v7 = 0;
  BOOL v8 = 0;
  if (a4) {
    goto LABEL_6;
  }
LABEL_7:
  if (a5) {
    *a5 = v7;
  }
}

- (id)displayStringForOutcome:(unint64_t)a3
{
  if (a3 > 0x1B) {
    return @"Success - GAX is Dormant";
  }
  else {
    return *(&off_49150 + a3);
  }
}

- (void)_beginProcessingEventsIfNeeded
{
  if (!self->_isProcessingEventQueue) {
    [(GAXVerifier *)self _processNextEventInQueue];
  }
}

- (void)_processNextEventInQueue
{
  if (self->_paused)
  {
    v3 = GAXLogIntegrity();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "GAX verification is paused. Waiting for resumption.", buf, 2u);
    }

    self->_isProcessingEventQueue = 0;
  }
  else
  {
    v4 = [(GAXVerifier *)self verifyQueue];
    id v5 = [v4 count];

    if (v5)
    {
      if (self->_isProcessingEventQueue)
      {
        v6 = GAXLogIntegrity();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Wanting to process next event in queue, but we're already busy processing another event", buf, 2u);
        }
      }
      else
      {
        self->_isProcessingEventQueue = 1;
        v10 = GAXLogIntegrity();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Will begin verifying integrity", buf, 2u);
        }

        v6 = [(GAXVerifier *)self delegate];
        [v6 willBeginVerificationWithIntegrityVerifier:self];
      }

      v11 = [(GAXVerifier *)self verifyQueue];
      v9 = [v11 firstObject];

      v12 = [(GAXVerifier *)self verifyQueue];
      [v12 removeObjectAtIndex:0];

      v13 = GAXLogIntegrity();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [v9 eventName];
        v15 = [(GAXVerifier *)self verifyQueue];
        id v16 = [v15 count];
        *(_DWORD *)buf = 138543618;
        v40 = v14;
        __int16 v41 = 2050;
        id v42 = v16;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Verifying next integrity event <%{public}@>. %{public}ld reamin in queue", buf, 0x16u);
      }
      v17 = [(GAXVerifier *)self verifyQueue];
      id v18 = [v17 count];

      if (v18)
      {
        v19 = +[NSMutableString stringWithString:@"Remaining Events:\n"];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v20 = [(GAXVerifier *)self verifyQueue];
        id v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v35;
          do
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v35 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = [*(id *)(*((void *)&v34 + 1) + 8 * i) eventName];
              [v19 appendFormat:@"  %@\n", v25];
            }
            id v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v22);
        }

        v26 = GAXLogIntegrity();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v40 = v19;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }
      [(GAXVerifier *)self setCurrentVerificationEvent:v9];
      [v9 delay];
      if (v27 <= 0.0)
      {
        v28 = GAXLogIntegrity();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = [v9 eventName];
          *(_DWORD *)buf = 138543362;
          v40 = v29;
          _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Verifying event: <%{public}@>", buf, 0xCu);
        }
        v30 = [(GAXVerifier *)self currentVerificationEvent];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_8248;
        v31[3] = &unk_48FF0;
        v31[4] = self;
        [(GAXVerifier *)self _verifyWithEventObject:v30 completion:v31];
      }
      else
      {
        [(GAXVerifier *)self _didFinishVerifyingCurrentEventWithOutcome:24 error:0];
        [v9 delay];
        v31[5] = _NSConcreteStackBlock;
        v31[6] = 3221225472;
        v31[7] = sub_8118;
        v31[8] = &unk_49018;
        id v32 = v9;
        v33 = self;
        AXPerformBlockOnMainThreadAfterDelay();
      }
    }
    else
    {
      self->_isProcessingEventQueue = 0;
      currentVerificationEvent = self->_currentVerificationEvent;
      self->_currentVerificationEvent = 0;

      BOOL v8 = GAXLogIntegrity();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Did finish verifying integrity for items in queue", buf, 2u);
      }

      v9 = [(GAXVerifier *)self delegate];
      [v9 didFinishVerificationWithIntegrityVerifier:self];
    }
  }
}

- (void)_verifyWithEventObject:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(GAXVerifier *)self delegate];
  unsigned int v9 = [v8 shouldProceedWithVerificationForIntegrityVerifier:self];

  if (!v9) {
    goto LABEL_26;
  }
  v10 = [(GAXVerifier *)self delegate];
  unsigned int v11 = [v10 frontmostAppIsAcceptableForSessionAppWithIntegrityVerifier:self];

  v12 = [(GAXVerifier *)self delegate];
  unsigned int v13 = [v12 willStartSessionWhenFrontmostAppChangesForIntegrityVerifier:self];

  v14 = [(GAXVerifier *)self delegate];
  unsigned int v15 = [v14 appLayoutIsMultiAppForIntegrityVerifier:self];

  id v16 = GAXLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v13;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&buf[16] = v15;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "frontmost app acceptable: %d start session on frontmost change: %d app layout multi-app: %d", buf, 0x14u);
  }

  v17 = (char *)[v6 event];
  if (v17 == (unsigned char *)&dword_0 + 3) {
    goto LABEL_26;
  }
  id v18 = v17;
  v19 = [(GAXVerifier *)self delegate];
  unsigned __int8 v20 = [v19 deviceIsInLostModeForIntegrityVerifier:self];

  if (v20) {
    goto LABEL_26;
  }
  if ((((v11 | v13) ^ 1 | v15) & 1) == 0)
  {
    uint64_t v23 = [(GAXVerifier *)self delegate];
    unsigned int v24 = [v23 hasMultipleSessionAppsForIntegrityVerifier:self];

    if (v24)
    {
      p_sessionAppCheckinAttempts = &self->_sessionAppCheckinAttempts;
    }
    else
    {
      v26 = [(GAXVerifier *)self delegate];
      int v27 = [v26 sessionAppGAXClientDidCheckInForIntegrityVerifier:self];

      p_sessionAppCheckinAttempts = &self->_sessionAppCheckinAttempts;
      if ((v27 & 1) == 0)
      {
        ++*p_sessionAppCheckinAttempts;
        id v32 = GAXLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = [(GAXVerifier *)self delegate];
          long long v34 = [v33 expectedSessionAppIdentifierForIntegrityVerifier:self];
          long long v35 = +[NSNumber numberWithInteger:20 - self->_sessionAppCheckinAttempts];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v34;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v35;
          _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Session app gax client (%{public}@) did not check in yet. Attempts remaining: %{public}@", buf, 0x16u);
        }
        if (*p_sessionAppCheckinAttempts < 21) {
          goto LABEL_26;
        }
        long long v36 = GAXLogCommon();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_29EEC();
        }
      }
    }
    int64_t *p_sessionAppCheckinAttempts = 0;
LABEL_26:
    id v37 = v7;
    id v30 = v7;
    AXPerformBlockAsynchronouslyOnMainThread();
    v31 = v37;
    goto LABEL_27;
  }
  memset(buf, 0, 28);
  id v21 = [(GAXVerifier *)self delegate];
  id v22 = v21;
  if (v21) {
    [v21 gaxStateForIntegrityVerifier:self];
  }
  else {
    memset(buf, 0, 28);
  }

  v28 = GAXLogCommon();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = [v6 eventName];
    *(_DWORD *)v40 = 138412290;
    *(void *)&v40[4] = v29;
    _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Checking whether to launch session app with event: %@", v40, 0xCu);
  }
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_8710;
  v38[3] = &unk_49040;
  v38[4] = self;
  id v39 = v7;
  *(_OWORD *)v40 = *(_OWORD *)buf;
  *(_OWORD *)&v40[12] = *(_OWORD *)&buf[12];
  id v30 = v7;
  [(GAXVerifier *)self _shouldAttemptLaunchOfSessionAppWithEvent:v18 gaxState:v40 completion:v38];
  v31 = v39;
LABEL_27:
}

- (void)_shouldAttemptLaunchOfSessionAppWithEvent:(unint64_t)a3 gaxState:(id *)a4 completion:(id)a5
{
  id v8 = a5;
  unsigned __int8 v9 = [(GAXVerifier *)self _shouldForceAppRelaunchWithVerifyEvent:a3];
  v10 = [(GAXVerifier *)self delegate];
  unsigned int v11 = [v10 expectedSessionAppIdentifierForIntegrityVerifier:self];

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_8B34;
  v34[3] = &unk_49040;
  v34[4] = self;
  id v12 = v8;
  id v35 = v12;
  unsigned int v13 = objc_retainBlock(v34);
  v14 = (void (**)(void, void))v13;
  if (a3 == 8) {
    goto LABEL_10;
  }
  if (a3 == 3)
  {
    unsigned int v15 = GAXLogIntegrity();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      sub_29F54();
    }

    v14[2](v14, 26);
    goto LABEL_12;
  }
  if (!v11)
  {
    ((void (*)(void *, uint64_t))v13[2])(v13, 9);
    goto LABEL_12;
  }
  id v16 = [(GAXVerifier *)self delegate];
  unsigned __int8 v17 = [v16 sessionAppWithIdentifier:v11 isRelaunchableForIntegrityVerifier:self];

  if ((v17 & 1) == 0)
  {
LABEL_10:
    v14[2](v14, 18);
    goto LABEL_12;
  }
  id v18 = [(GAXVerifier *)self delegate];
  unsigned int v19 = [v18 sessionAppIsPreferencesForIntegrityVerifier:self];

  if (v19)
  {
    v14[2](v14, 8);
  }
  else
  {
    unsigned __int8 v20 = [(GAXVerifier *)self delegate];
    unsigned int v21 = [v20 isSystemAppAccessDisabledForIntegrityVerifier:self];

    if (v21)
    {
      v14[2](v14, 14);
    }
    else
    {
      id v22 = [(GAXVerifier *)self delegate];
      unsigned int v23 = [v22 isPreBoardRunningForIntegrityVerifier:self];

      if (v23)
      {
        v14[2](v14, 15);
      }
      else
      {
        unsigned int v24 = [(GAXVerifier *)self delegate];
        unsigned int v25 = [v24 isCheckerBoardRunningForIntegrityVerifier:self];

        if (v25)
        {
          v14[2](v14, 16);
        }
        else
        {
          v26 = +[AXSpringBoardServer server];

          if (v26)
          {
            int v27 = +[AXSpringBoardServer server];
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_8D14;
            v29[3] = &unk_490E0;
            v29[4] = self;
            id v30 = v11;
            *(_OWORD *)id v32 = *(_OWORD *)&a4->var0;
            *(_OWORD *)&v32[12] = *(_OWORD *)&a4->var3;
            unsigned __int8 v33 = v9;
            id v31 = v12;
            [v27 systemAppInfoWithQuery:704 completion:v29];
          }
          else
          {
            v28 = GAXLogIntegrity();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              sub_29F20();
            }

            v14[2](v14, 22);
          }
        }
      }
    }
  }
LABEL_12:
}

- (BOOL)_shouldForceAppRelaunchWithVerifyEvent:(unint64_t)a3
{
  BOOL result = 1;
  if (a3 <= 0x12)
  {
    if (((1 << a3) & 0x69FC8) != 0)
    {
      return 0;
    }
    else if (!a3)
    {
      _AXAssert();
      return 0;
    }
  }
  return result;
}

- (void)_didFinishVerifyingCurrentEventWithOutcome:(unint64_t)a3 error:(id)a4
{
  id v6 = a4;
  self->_mostRecentOutcome = a3;
  id v7 = [(GAXVerifier *)self currentVerificationEvent];
  id v8 = [v7 eventName];
  unsigned __int8 v9 = [(GAXVerifier *)self displayStringForOutcome:a3];
  v10 = +[NSMutableString stringWithFormat:@"Did verify event: [%@]. Outcome: [%@].", v8, v9];

  if (v6)
  {
    [v10 appendFormat:@" Error: [%@]. ", v6];
    unsigned int v11 = GAXLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_29F94((uint64_t)v10, v11);
    }
  }
  else
  {
    unsigned int v11 = GAXLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&buf, 0xCu);
    }
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  v26[0] = 0;
  uint64_t v20 = 0;
  unsigned int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  v23[0] = 0;
  [(GAXVerifier *)self outcome:a3 isError:v23 isIndeterminate:v26];
  if (*((unsigned char *)v21 + 24))
  {
    id v12 = [(GAXVerifier *)self delegate];
    unsigned int v13 = [(GAXVerifier *)self delegate];
    v14 = [v13 expectedSessionAppIdentifier];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_9200;
    v15[3] = &unk_49130;
    v15[4] = self;
    unsigned __int8 v17 = &v20;
    p_long long buf = &buf;
    unint64_t v19 = a3;
    id v16 = v6;
    [v12 sessionAppIsBeingInstalledForIntegrityVerifier:self sessionIdentifier:v14 completion:v15];
  }
  else
  {
    [(GAXVerifier *)self _didFinishVerifyingCurrentEventWithOutcomePhase2:a3 outcomeIsIndeterminate:*(unsigned __int8 *)(*((void *)&buf + 1) + 24) error:v6];
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)_didFinishVerifyingCurrentEventWithOutcomePhase2:(unint64_t)a3 outcomeIsIndeterminate:(BOOL)a4 error:(id)a5
{
  id v8 = [(GAXVerifier *)self delegate];
  unsigned __int8 v9 = [(GAXVerifier *)self currentVerificationEvent];
  objc_msgSend(v8, "didVerifyEvent:withOutcome:withIntegrityVerifier:", objc_msgSend(v9, "event"), a3, self);

  if (!a4)
  {
    v10 = [(GAXVerifier *)self currentVerificationEvent];
    unsigned int v11 = [v10 completion];

    if (v11)
    {
      id v12 = [(GAXVerifier *)self currentVerificationEvent];
      unsigned int v13 = [v12 completion];
      v13[2]();
    }
    [(GAXVerifier *)self _processNextEventInQueue];
  }
  if ((a3 | 2) == 0x1B)
  {
    v14 = GAXLogIntegrity();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = [(GAXVerifier *)self displayStringForOutcome:a3];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v20 = v15;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Replaying verification for outcome %{public}@", buf, 0xCu);
    }
    id v16 = [(GAXVerifier *)self currentVerificationEvent];
    if (v16)
    {
      unsigned __int8 v17 = [(GAXVerifier *)self verifyQueue];
      [v17 insertObject:v16 atIndex:0];

      AXPerformBlockOnMainThreadAfterDelay();
    }
    else
    {
      id v18 = GAXLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_2A00C();
      }
    }
  }
}

- (BOOL)_appWithIdentifierIsInstalledOnDevice:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    +[LSApplicationRecord enumeratorWithOptions:0];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          unsigned __int8 v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "bundleIdentifier", (void)v16);
          if ([v3 isEqualToString:v10])
          {

LABEL_15:
            BOOL v14 = 1;
            goto LABEL_16;
          }
          unsigned int v11 = [v9 iTunesMetadata];
          id v12 = [v11 itemName];
          unsigned __int8 v13 = [v3 isEqualToString:v12];

          if (v13) {
            goto LABEL_15;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        BOOL v14 = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
LABEL_16:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (GAXVerifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GAXVerifierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)mostRecentOutcome
{
  return self->_mostRecentOutcome;
}

- (void)setMostRecentOutcome:(unint64_t)a3
{
  self->_mostRecentOutcome = a3;
}

- (NSMutableArray)verifyQueue
{
  return self->_verifyQueue;
}

- (void)setVerifyQueue:(id)a3
{
}

- (GAXVerificationEventObject)currentVerificationEvent
{
  return self->_currentVerificationEvent;
}

- (void)setCurrentVerificationEvent:(id)a3
{
}

- (int64_t)sessionAppCheckinAttempts
{
  return self->_sessionAppCheckinAttempts;
}

- (void)setSessionAppCheckinAttempts:(int64_t)a3
{
  self->_sessionAppCheckinAttempts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentVerificationEvent, 0);
  objc_storeStrong((id *)&self->_verifyQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end