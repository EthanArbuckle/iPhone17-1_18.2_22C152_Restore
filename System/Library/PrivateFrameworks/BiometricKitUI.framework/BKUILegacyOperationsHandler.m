@interface BKUILegacyOperationsHandler
+ (id)handlersForEnrollmentConfiguration:(unint64_t)a3 inBuddy:(BOOL)a4 delegate:(id)a5 credential:(id)a6 externalizedAuthContext:(id)a7;
- (void)advanceEnrollmentState;
- (void)enrollOperation:(id)a3 finishedWithEnrollResult:(id)a4;
- (void)startEnroll;
@end

@implementation BKUILegacyOperationsHandler

- (void)advanceEnrollmentState
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v3 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  v4 = NSString;
  [(BKUIFaceIDEnrollOperationsHandler *)self bioKitCompletionPercentage];
  uint64_t v6 = (int)(v5 * 100.0);
  v7 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  [v7 percentOfPillsCompleted];
  v9 = [v4 stringWithFormat:@"BioKit: %d%%, rings: %d%%", v6, (int)(v8 * 100.0)];
  [v3 setProgressString:v9];

  v10 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  [v10 _updateDebugLabel];

  v11 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  [v11 percentOfPillsCompleted];
  double v13 = v12;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v14 = [(BKUIFaceIDEnrollOperationsHandler *)self poseStatus];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v49;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v48 + 1) + 8 * v18++) integerValue];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v16);
  }

  v19 = _BKUILoggingFacility();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
    int v21 = [v20 state];
    [(BKUIFaceIDEnrollOperationsHandler *)self bioKitCompletionPercentage];
    int v23 = (int)(v22 * 100.0);
    v24 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
    [v24 percentOfPillsCompleted];
    *(_DWORD *)buf = 134218752;
    v53 = *(__CFString **)&v13;
    __int16 v54 = 1024;
    *(_DWORD *)v55 = v21;
    *(_WORD *)&v55[4] = 1024;
    *(_DWORD *)&v55[6] = v23;
    LOWORD(v56[0]) = 1024;
    *(_DWORD *)((char *)v56 + 2) = (int)(v25 * 100.0);
    _os_log_impl(&dword_1E4B6C000, v19, OS_LOG_TYPE_DEFAULT, "advanceEnrollmentState evaluate next state for advancement... percentPillsCompleted:%f state:%i BioKit: %d%%, rings: %d%%", buf, 0x1Eu);
  }
  v26 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  int v27 = [v26 state];

  if (v27 == 5 && v13 >= 1.0)
  {
    v28 = _BKUILoggingFacility();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4B6C000, v28, OS_LOG_TYPE_DEFAULT, "Finishing 1st phase and continuing moving to 1st scan complete...", buf, 2u);
    }

    id v29 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
    [v29 setState:6 animated:1 afterDelay:1.0];
    goto LABEL_33;
  }
  id v29 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  if ([v29 state] != 7 || v13 < 1.0)
  {
LABEL_33:

    return;
  }
  [(BKUIFaceIDEnrollOperationsHandler *)self bioKitCompletionPercentage];
  double v31 = v30;

  if (v31 >= 1.0)
  {
    v32 = _BKUILoggingFacility();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      [(BKUIFaceIDEnrollOperationsHandler *)self bioKitCompletionPercentage];
      uint64_t v34 = v33;
      v35 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
      int v36 = [v35 state];
      *(_DWORD *)buf = 138412802;
      v53 = @"Legacy";
      __int16 v54 = 2048;
      *(void *)v55 = v34;
      *(_WORD *)&v55[8] = 1024;
      v56[0] = v36 == 7;
      _os_log_impl(&dword_1E4B6C000, v32, OS_LOG_TYPE_DEFAULT, "Finishing %@ enroll operation... %f %i", buf, 0x1Cu);
    }
    v37 = [(BKUIFaceIDEnrollOperationsHandler *)self enrollOperation];
    uint64_t v38 = [v37 state];

    if (v38 != 4)
    {
      id v47 = 0;
      BOOL v39 = [(BKUIFaceIDEnrollOperationsHandler *)self _completeOperationWithError:&v47];
      id v29 = v47;
      v40 = _BKUILoggingFacility();
      BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
      if (v39)
      {
        if (v41)
        {
          *(_DWORD *)buf = 138412290;
          v53 = @"Legacy";
          _os_log_impl(&dword_1E4B6C000, v40, OS_LOG_TYPE_DEFAULT, "%@ enroll operation marked as completed!", buf, 0xCu);
        }

        unint64_t v42 = [(BKUIFaceIDEnrollOperationsHandler *)self enrollmentConfiguration];
        v43 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
        v44 = v43;
        if (!v42
          || (int v45 = [v43 state],
              v44,
              [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate],
              v44 = objc_claimAutoreleasedReturnValue(),
              v45 == 7))
        {
          [v44 setState:8 animated:1 afterDelay:0.5];
LABEL_32:

          goto LABEL_33;
        }
        v46 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
        objc_msgSend(v44, "setState:animated:afterDelay:", objc_msgSend(v46, "state") + 1, 1, 0.5);
      }
      else
      {
        if (v41)
        {
          *(_DWORD *)buf = 138412546;
          v53 = @"Legacy";
          __int16 v54 = 2112;
          *(void *)v55 = v29;
          _os_log_impl(&dword_1E4B6C000, v40, OS_LOG_TYPE_DEFAULT, "Failed to complete %@ enroll operation: %@", buf, 0x16u);
        }

        v44 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
        v46 = [NSString stringWithFormat:@"Failed to complete %@ enroll: %@", @"Legacy", v29];
        [v44 setStatus:v46];
      }

      goto LABEL_32;
    }
  }
}

- (void)enrollOperation:(id)a3 finishedWithEnrollResult:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 enrolledIdentity];
  if (!v7) {
    -[BKUILegacyOperationsHandler enrollOperation:finishedWithEnrollResult:]();
  }
  double v8 = (void *)v7;
  v9 = [(BKUIFaceIDEnrollOperationsHandler *)self operationsDelegate];
  [v9 enrollOperation:v10 finishedWithIdentity:v8 animateImmediately:0];

  [(BKUIFaceIDEnrollOperationsHandler *)self cleanupEnroll];
}

- (void)startEnroll
{
  [(BKUIFaceIDEnrollOperationsHandler *)self setUserSelectedUseAccessibilityEnrollment:0];

  [(BKUIFaceIDEnrollOperationsHandler *)self startEnrollForEnrollmentType:1 glassesRequirement:0 identity:0 operationStartedActionBlock:0];
}

+ (id)handlersForEnrollmentConfiguration:(unint64_t)a3 inBuddy:(BOOL)a4 delegate:(id)a5 credential:(id)a6 externalizedAuthContext:(id)a7
{
  BOOL v9 = a4;
  id v10 = (void *)MEMORY[0x1E4F1CA48];
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  v14 = [v10 array];
  uint64_t v15 = objc_alloc_init(BKUILegacyOperationsHandler);
  [v14 addObject:v15];
  [(BKUIFaceIDEnrollOperationsHandler *)v15 setEnrollmentType:1];
  [(BKUIFaceIDEnrollOperationsHandler *)v15 setOperationsDelegate:v13];

  [(BKUIFaceIDEnrollOperationsHandler *)v15 setInbuddy:v9];
  [(BKUIFaceIDEnrollOperationsHandler *)v15 setEnrollmentConfiguration:0];
  [(BKUIFaceIDEnrollOperationsHandler *)v15 setCredential:v12];

  [(BKUIFaceIDEnrollOperationsHandler *)v15 setExternalizedAuthContext:v11];

  return v14;
}

- (void)enrollOperation:finishedWithEnrollResult:.cold.1()
{
  __assert_rtn("-[BKUILegacyOperationsHandler enrollOperation:finishedWithEnrollResult:]", "BKUILegacyOperationsHandler.m", 61, "enrolledIdentity != nil");
}

@end