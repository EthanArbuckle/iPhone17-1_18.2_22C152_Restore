@interface DADeviceLocalPersistent
- (BOOL)bugSessionStarted;
- (BOOL)isLocal;
- (DADeviceDelegate)delegate;
- (DADeviceLocalPersistent)init;
- (DADeviceState)state;
- (DEDBugSession)session;
- (DEDDevice)dedSessionDevice;
- (NSTimer)clock;
- (id)notifierConfiguration;
- (void)advanceForStatus:(unint64_t)a3;
- (void)askForEnrollConsent;
- (void)askForUploadConsent;
- (void)beginCollection;
- (void)beginEnroll;
- (void)beginUnenroll;
- (void)beginUpload;
- (void)connectToDED:(id)a3;
- (void)dealloc;
- (void)end;
- (void)enhancedLoggingDidUpdateStatus:(id)a3;
- (void)heartbeat;
- (void)reconfigureWithCommit:(BOOL)a3;
- (void)retryBugSession;
- (void)setBugSessionStarted:(BOOL)a3;
- (void)setClock:(id)a3;
- (void)setDedSessionDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSession:(id)a3;
- (void)setState:(id)a3;
- (void)startBugSession;
- (void)startDEDSessionForDevice:(id)a3 withConfig:(id)a4 withNewSession:(BOOL)a5 completionHandler:(id)a6;
- (void)unpackQueueWithOngoingExtensions:(id)a3 retry:(BOOL)a4;
- (void)uploadFailed;
- (void)uploadFinished;
- (void)uploadProgress:(unint64_t)a3 total:(int64_t)a4 session:(id)a5;
@end

@implementation DADeviceLocalPersistent

- (DADeviceLocalPersistent)init
{
  v13.receiver = self;
  v13.super_class = (Class)DADeviceLocalPersistent;
  v2 = [(DADeviceLocalPersistent *)&v13 init];
  if (v2)
  {
    v3 = [DADeviceState alloc];
    v4 = +[ELSManager sharedManager];
    v5 = [v4 snapshot];
    v6 = [v5 dedSessionIdentifier];
    v7 = [(DADeviceState *)v3 initWithSerialNumber:v6 attributes:&__NSDictionary0__struct];
    state = v2->_state;
    v2->_state = v7;

    v2->_bugSessionStarted = 0;
    v9 = +[ELSManager sharedManager];
    v10 = [v9 snapshot];
    -[DADeviceLocalPersistent advanceForStatus:](v2, "advanceForStatus:", [v10 status]);

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"enhancedLoggingDidUpdateStatus:" name:ELSDidUpdateStatus object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:ELSDidUpdateStatus object:0];

  v4.receiver = self;
  v4.super_class = (Class)DADeviceLocalPersistent;
  [(DADeviceLocalPersistent *)&v4 dealloc];
}

- (BOOL)isLocal
{
  return 1;
}

- (void)end
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[DADeviceLocalPersistent end]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010F8C;
  block[3] = &unk_10014B0D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:ELSDidUpdateStatus object:0];

  v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Flushing defaults...", buf, 2u);
  }

  v6 = +[ELSManager sharedManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011004;
  v7[3] = &unk_10014B7C8;
  v7[4] = self;
  [v6 flushWithCompletion:v7];
}

- (void)enhancedLoggingDidUpdateStatus:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v6 = [v4 objectForKeyedSubscript:ELSUserInfoKey];

  v5 = v6;
  if (v6)
  {
    -[DADeviceLocalPersistent advanceForStatus:](self, "advanceForStatus:", [v6 status]);
    v5 = v6;
  }
}

- (void)advanceForStatus:(unint64_t)a3
{
  if (a3 >= 3)
  {
    [(DADeviceLocalPersistent *)self startBugSession];
    v5 = +[ELSManager sharedManager];
    id v6 = [v5 snapshot];
    v7 = [v6 startDate];

    v8 = +[ELSManager sharedManager];
    v9 = [v8 snapshot];
    v10 = [v9 endDate];

    if (v7 && !v10) {
      [(DADeviceLocalPersistent *)self retryBugSession];
    }
  }
  switch(a3)
  {
    case 0uLL:
      [(DADeviceLocalPersistent *)self end];
      break;
    case 1uLL:
      [(DADeviceLocalPersistent *)self beginEnroll];
      break;
    case 2uLL:
      [(DADeviceLocalPersistent *)self askForEnrollConsent];
      break;
    case 3uLL:
      [(DADeviceLocalPersistent *)self beginCollection];
      break;
    case 4uLL:
      [(DADeviceLocalPersistent *)self askForUploadConsent];
      break;
    case 5uLL:
      [(DADeviceLocalPersistent *)self beginUpload];
      break;
    case 6uLL:
      [(DADeviceLocalPersistent *)self beginUnenroll];
      break;
    case 7uLL:
      [(DADeviceLocalPersistent *)self uploadFinished];
      break;
    case 8uLL:
      [(DADeviceLocalPersistent *)self uploadFailed];
      break;
    default:
      return;
  }
}

- (void)beginEnroll
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[DADeviceLocalPersistent beginEnroll]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  objc_super v4 = [(DADeviceLocalPersistent *)self state];
  [v4 transactionWithBlock:&stru_10014B808];
}

- (void)askForEnrollConsent
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[DADeviceLocalPersistent askForEnrollConsent]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  objc_super v4 = [(DADeviceLocalPersistent *)self state];
  [v4 transactionWithBlock:&stru_10014B828];

  +[ELSEvent createLoggingEventWith:ELSEventTypeAskedForEnrollConsent];
}

- (void)beginCollection
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[DADeviceLocalPersistent beginCollection]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_super v4 = [(DADeviceLocalPersistent *)self state];
  [v4 transactionWithBlock:&stru_10014B848];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000117F0;
  block[3] = &unk_10014B0D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)heartbeat
{
  v3 = +[ELSManager sharedManager];
  objc_super v4 = [v3 snapshot];
  id v5 = [v4 status];

  if (v5 == (id)3)
  {
    id v6 = +[ELSManager sharedManager];
    v7 = [v6 snapshot];
    [v7 durationRemaining];
    uint64_t v9 = v8;

    v10 = [(DADeviceLocalPersistent *)self state];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000119BC;
    v12[3] = &unk_10014B868;
    v12[4] = v9;
    [v10 transactionWithBlock:v12];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000119C8;
    v11[3] = &unk_10014B0D8;
    v11[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
  }
}

- (void)askForUploadConsent
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[DADeviceLocalPersistent askForUploadConsent]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  objc_super v4 = [(DADeviceLocalPersistent *)self state];
  [v4 transactionWithBlock:&stru_10014B888];

  +[ELSEvent createLoggingEventWith:ELSEventTypeAskedForUploadConsent];
}

- (void)beginUpload
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    v10 = "-[DADeviceLocalPersistent beginUpload]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  objc_super v4 = +[ELSManager sharedManager];
  int v5 = [v4 snapshot];
  id v6 = [v5 consent];

  if (v6 == (id)3)
  {
    [(DADeviceLocalPersistent *)self reconfigureWithCommit:1];
  }
  else
  {
    v7 = [(DADeviceLocalPersistent *)self session];
    [v7 commit];
  }
  uint64_t v8 = [(DADeviceLocalPersistent *)self state];
  [v8 transactionWithBlock:&stru_10014B8A8];
}

- (void)beginUnenroll
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[DADeviceLocalPersistent beginUnenroll]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  objc_super v4 = [(DADeviceLocalPersistent *)self state];
  [v4 transactionWithBlock:&stru_10014B8C8];

  [(DADeviceLocalPersistent *)self end];
}

- (void)uploadFinished
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[DADeviceLocalPersistent uploadFinished]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_super v4 = +[ELSManager sharedManager];
  int v5 = [v4 snapshot];
  id v6 = [v5 status];

  if ((unint64_t)v6 <= 5)
  {
    v7 = +[ELSManager sharedManager];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100011F50;
    v8[3] = &unk_10014B7C8;
    v8[4] = self;
    [v7 finishWithCompletion:v8];
  }
}

- (void)uploadFailed
{
  v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[DADeviceLocalPersistent uploadFailed]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_super v4 = +[ELSManager sharedManager];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000120C0;
  v5[3] = &unk_10014B7C8;
  v5[4] = self;
  [v4 finishWithCompletion:v5];
}

- (void)startBugSession
{
  if (![(DADeviceLocalPersistent *)self bugSessionStarted])
  {
    v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v6 = "-[DADeviceLocalPersistent startBugSession]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    [(DADeviceLocalPersistent *)self setBugSessionStarted:1];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100012248;
    v4[3] = &unk_10014B978;
    v4[4] = self;
    [(DADeviceLocalPersistent *)self connectToDED:v4];
  }
}

- (void)unpackQueueWithOngoingExtensions:(id)a3 retry:(BOOL)a4
{
  BOOL v65 = a4;
  id v4 = a3;
  int v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v84 = "-[DADeviceLocalPersistent unpackQueueWithOngoingExtensions:retry:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = &lroundf_ptr;
  v7 = +[ELSManager sharedManager];
  uint64_t v8 = [v7 snapshot];
  int v9 = [v8 endDate];

  dispatch_group_t v10 = dispatch_group_create();
  v11 = dispatch_queue_create("com.apple.Diagnostics.finishLocalPersistentDeviceQueue", 0);
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_100013000;
  v79[3] = &unk_10014B9A0;
  v12 = v10;
  v80 = v12;
  v66 = objc_retainBlock(v79);
  v62 = v12;
  if (v4 && v9 && [v4 count])
  {
    objc_super v13 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Re-attaching to Ongoing Extensions...", buf, 2u);
    }

    if ([v4 count])
    {
      unint64_t v14 = 0;
      do
      {
        dispatch_group_enter(v12);
        ++v14;
      }
      while ((unint64_t)[v4 count] > v14);
    }
    dispatch_group_notify(v12, v11, &stru_10014B9C0);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v15 = v4;
    id v16 = [v15 countByEnumeratingWithState:&v75 objects:v82 count:16];
    if (v16)
    {
      id v17 = v16;
      v61 = v9;
      uint64_t v18 = *(void *)v76;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v76 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(char **)(*((void *)&v75 + 1) + 8 * i);
          v21 = DiagnosticLogHandleForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v84 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Extension = %@", buf, 0xCu);
          }

          v22 = [(DADeviceLocalPersistent *)self session];
          v23 = [v20 dedExtensionIdentifier];
          [v22 attachCompletionHandlerForDEDExtensionIdentifier:v23 handler:v66];
        }
        id v17 = [v15 countByEnumeratingWithState:&v75 objects:v82 count:16];
      }
      while (v17);
      id v6 = &lroundf_ptr;
      int v9 = v61;
    }
  }
  else
  {
    v24 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Starting diagnostics from Queue...", buf, 2u);
    }

    v25 = +[ELSManager sharedManager];
    v26 = [v25 snapshot];
    v27 = [v26 queue];

    v28 = +[ELSManager sharedManager];
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_100013250;
    v74[3] = &unk_10014B7C8;
    v74[4] = self;
    [v28 transactionWithBlock:v74];

    id v60 = v4;
    if (v65)
    {
      v29 = +[ELSManager sharedManager];
      v30 = [v29 snapshot];
      v31 = [v30 identifiersToRetry];
      v32 = (char *)[v31 count];
    }
    else
    {
      v32 = (char *)[v27 count];
    }
    for (; v32; --v32)
      dispatch_group_enter(v12);
    v59 = v11;
    dispatch_group_notify(v12, v11, &stru_10014B9C0);
    v63 = +[NSMutableArray array];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id obj = v27;
    id v33 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v71;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v71 != v35) {
            objc_enumerationMutation(obj);
          }
          v37 = *(void **)(*((void *)&v70 + 1) + 8 * (void)j);
          if (!v65 || [*(id *)(*((void *)&v70 + 1) + 8 * (void)j) retry])
          {
            v38 = DiagnosticLogHandleForCategory();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              v39 = [v37 description];
              *(_DWORD *)buf = 138412290;
              v84 = v39;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Entry = %@", buf, 0xCu);
            }
            [v37 executeAfterDuration];
            double v41 = v40;
            v42 = +[NSDate date];
            v43 = +[NSDate dateWithTimeInterval:v42 sinceDate:v41];

            v44 = [(DADeviceLocalPersistent *)self session];
            v45 = [v37 type];
            v46 = [v37 parameters];
            v47 = [v44 startDiagnosticExtensionWithIdentifier:v45 parameters:v46 deferRunUntil:v43 completion:v66];

            if ([v37 retry])
            {
              v48 = [v47 stringValue];
              [v63 addObject:v48];
            }
          }
        }
        id v34 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
      }
      while (v34);
    }
    id v15 = obj;

    id v6 = &lroundf_ptr;
    v49 = +[ELSManager sharedManager];
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_1000133BC;
    v68[3] = &unk_10014B7C8;
    id v69 = v63;
    id v50 = v63;
    [v49 transactionWithBlock:v68];

    id v4 = v60;
    v11 = v59;
  }

  v51 = [v6[419] sharedManager];
  v52 = [v51 snapshot];
  id v53 = [v52 consent];

  if (v53 == (id)3)
  {
    [(DADeviceLocalPersistent *)self reconfigureWithCommit:1];
    v54 = v62;
  }
  else
  {
    v54 = v62;
    if (v53 == (id)2)
    {
      v55 = [(DADeviceLocalPersistent *)self session];
      [v55 commit];
LABEL_49:

      goto LABEL_50;
    }
    v56 = [v6[419] sharedManager];
    v57 = [v56 snapshot];
    id v58 = [v57 consent];

    if (v58 == (id)1)
    {
      v55 = [(DADeviceLocalPersistent *)self session];
      [v55 scheduleNotification];
      goto LABEL_49;
    }
  }
LABEL_50:
}

- (void)retryBugSession
{
  v3 = [(DADeviceLocalPersistent *)self session];

  if (v3)
  {
    id v4 = [(DADeviceLocalPersistent *)self session];
    [v4 clearNotification];

    int v5 = [(DADeviceLocalPersistent *)self session];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000134B0;
    v7[3] = &unk_10014B9E8;
    v7[4] = self;
    [v5 synchronizeSessionStatusWithCompletion:v7];
  }
  else
  {
    id v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100101A80(v6);
    }
  }
}

- (void)reconfigureWithCommit:(BOOL)a3
{
  int v5 = [(DADeviceLocalPersistent *)self session];

  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000139E0;
    v7[3] = &unk_10014BA10;
    v7[4] = self;
    BOOL v8 = a3;
    [(DADeviceLocalPersistent *)self connectToDED:v7];
  }
  else
  {
    id v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100101AC4(v6);
    }
  }
}

- (id)notifierConfiguration
{
  v2 = +[ELSManager sharedManager];
  v3 = [v2 snapshot];
  id v4 = [v3 followUpOptions];

  id v5 = objc_alloc((Class)DEDNotifierConfiguration);
  id v6 = sub_100014FD4(@"ENHANCED_LOGGING_FOLLOWUP_TITLE");
  v7 = sub_100014FD4(@"ENHANCED_LOGGING_FOLLOWUP_ALERT_BODY");
  id v8 = [v5 initWithHostAppIdentifier:@"com.apple.Diagnostics" localizedNotificationTitle:v6 localizedNotificationBody:v7];

  [v8 setFollowupUniqueIdentifier:ELSDomain];
  uint64_t v9 = ELSFollowUpOptionFrequency;
  dispatch_group_t v10 = [v4 objectForKeyedSubscript:ELSFollowUpOptionFrequency];
  if (v10)
  {
    v11 = [v4 objectForKeyedSubscript:v9];
    [v11 doubleValue];
    [v8 setFollowupFrequency:];
  }
  else
  {
    [v8 setFollowupFrequency:3600.0];
  }

  uint64_t v12 = ELSFollowUpOptionUseSpringBoardNotification;
  objc_super v13 = [v4 objectForKeyedSubscript:ELSFollowUpOptionUseSpringBoardNotification];
  if (v13)
  {
    unint64_t v14 = [v4 objectForKeyedSubscript:v12];
    [v8 setFollowupUseSpringboardNotification:[v14 BOOLValue]];
  }
  else
  {
    [v8 setFollowupUseSpringboardNotification:1];
  }

  id v15 = sub_100014FD4(@"ENHANCED_LOGGING_FOLLOWUP_SETTINGS_TITLE");
  [v8 setFollowupLocalizedTitle:v15];

  id v16 = sub_100014FD4(@"ENHANCED_LOGGING_FOLLOWUP_SETTINGS_BODY");
  [v8 setFollowupLocalizedInformativeText:v16];

  id v17 = sub_100014FD4(@"ENHANCED_LOGGING_FOLLOWUP_ALERT_ACTION");
  [v8 setFollowupNotificationActionTitle:v17];

  uint64_t v18 = sub_100014FD4(@"ENHANCED_LOGGING_FOLLOWUP_ALERT_ACTION");
  [v8 setReviewActionLabel:v18];

  v19 = +[NSURL URLWithString:@"diags://?els-action=review"];
  [v8 setFollowupReviewActionURL:v19];

  v20 = +[NSURL URLWithString:@"diags://?els-action=review"];
  [v8 setFollowupNotificationActionURL:v20];

  return v8;
}

- (void)connectToDED:(id)a3
{
  id v4 = a3;
  id v5 = +[ELSManager sharedManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013E04;
  v7[3] = &unk_10014BA60;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getBugSessionActivityWithCompletion:v7];
}

- (void)startDEDSessionForDevice:(id)a3 withConfig:(id)a4 withNewSession:(BOOL)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = +[ELSManager sharedManager];
  objc_super v13 = +[DEDManager sharedInstance];
  unint64_t v14 = [v12 snapshot];
  id v15 = [v14 dedSessionIdentifier];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001493C;
  v18[3] = &unk_10014BAB0;
  id v19 = v12;
  id v20 = v9;
  BOOL v21 = a5;
  id v16 = v9;
  id v17 = v12;
  [v13 startBugSessionWithIdentifier:v15 configuration:v10 target:v11 completion:v18];
}

- (void)uploadProgress:(unint64_t)a3 total:(int64_t)a4 session:(id)a5
{
  if (a3 == a4)
  {
    [(DADeviceLocalPersistent *)self uploadFinished];
  }
  else
  {
    v10[10] = v5;
    v10[11] = v6;
    id v9 = [(DADeviceLocalPersistent *)self state];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100014D84;
    v10[3] = &unk_10014BAD0;
    v10[4] = a3;
    v10[5] = a4;
    [v9 transactionWithBlock:v10];
  }
}

- (DADeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (DADeviceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DEDDevice)dedSessionDevice
{
  return self->_dedSessionDevice;
}

- (void)setDedSessionDevice:(id)a3
{
}

- (DADeviceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (DEDBugSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BOOL)bugSessionStarted
{
  return self->_bugSessionStarted;
}

- (void)setBugSessionStarted:(BOOL)a3
{
  self->_bugSessionStarted = a3;
}

- (NSTimer)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clock, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_dedSessionDevice, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end