@interface SRDismissalClassificationController
- (BOOL)_supportsMitigationOnSource:(int64_t)a3;
- (BOOL)canPresentSurveyForContext:(id)a3;
- (BOOL)classifyRequestAsUnintendedWithContext:(id)a3;
- (BOOL)isDismissalReasonEligibleForSurvey:(int64_t)a3;
- (BOOL)shouldMitigateBasedOnActivationHistory:(id)a3;
- (id)duetSharedQueue;
- (void)presentSurveyNotificationWithContext:(id)a3 activationHistory:(id)a4 withCompletion:(id)a5;
- (void)queryStreamForCountOfEventsWithCompletion:(id)a3;
- (void)recordDismissalEventWithContext:(id)a3 markAsUnintended:(BOOL)a4;
- (void)recordDismissalMetricWithContext:(id)a3 inputType:(int64_t)a4 previousLongPressBehavior:(int64_t)a5 longPressBehavior:(int64_t)a6;
- (void)recordMitigationEndMetricWithContext:(id)a3 activationHistory:(id)a4 numberOfDaysSinceLastChange:(int64_t)a5;
- (void)recordMitigationStartMetricWithContext:(id)a3 activationHistory:(id)a4 numberOfDaysSinceLastChange:(int64_t)a5;
- (void)requestMitigationStatusBasedOnRequestClassification:(BOOL)a3 withRequestSource:(int64_t)a4 withCompletion:(id)a5;
@end

@implementation SRDismissalClassificationController

- (BOOL)_supportsMitigationOnSource:(int64_t)a3
{
  return ((unint64_t)a3 < 0x38) & (6uLL >> a3);
}

- (void)requestMitigationStatusBasedOnRequestClassification:(BOOL)a3 withRequestSource:(int64_t)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  BOOL v9 = [(SRDismissalClassificationController *)self _supportsMitigationOnSource:a4];
  BOOL v10 = v9;
  if (v6 && v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006A9B8;
    v12[3] = &unk_100144850;
    v12[4] = self;
    id v13 = v8;
    char v14 = 1;
    [(SRDismissalClassificationController *)self queryStreamForCountOfEventsWithCompletion:v12];
  }
  else if (v8)
  {
    v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[SRDismissalClassificationController requestMitigationStatusBasedOnRequestClassification:withRequestSource:"
            "withCompletion:]";
      __int16 v17 = 1024;
      BOOL v18 = v6;
      __int16 v19 = 1024;
      BOOL v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #HWButtonMitigation Mitigation not needed (unintended: %d, sourceSupportsMitigation: %d)", buf, 0x18u);
    }
    (*((void (**)(id, void, BOOL, void, void))v8 + 2))(v8, 0, v10, 0, 0);
  }
}

- (BOOL)shouldMitigateBasedOnActivationHistory:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [v3 countOfIntendedActivations];
    id v5 = [v3 countOfUnintendedActivations];

    if (v4) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = (unint64_t)v5 > 9;
    }
    BOOL v7 = v6;
    id v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      v11 = "-[SRDismissalClassificationController shouldMitigateBasedOnActivationHistory:]";
      __int16 v12 = 1024;
      BOOL v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #HWButtonMitigation ShouldMitigate: %d", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)presentSurveyNotificationWithContext:(id)a3 activationHistory:(id)a4 withCompletion:(id)a5
{
  id v13 = a5;
  id v7 = a4;
  id v8 = a3;
  if ([v8 isDeviceUnlocked]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  id v10 = [v8 requestSource];
  id v11 = [v8 dismissalReason];

  +[SRUIDSurveyNotificationUtility postSiriInternalUIDSurveyNotification:v9 activationHistory:v7 requestSource:v10 dismissalReason:v11];
  __int16 v12 = v13;
  if (v13)
  {
    (*((void (**)(id))v13 + 2))(v13);
    __int16 v12 = v13;
  }
}

- (BOOL)canPresentSurveyForContext:(id)a3
{
  unsigned int v3 = +[SRUIDSurveyEnablementUtility meetsThresholdForPresenting];
  unsigned int v4 = +[SRUIDSurveyEnablementUtility isSurveyEnabled];
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315906;
    id v8 = "-[SRDismissalClassificationController canPresentSurveyForContext:]";
    __int16 v9 = 1024;
    int v10 = v3 & v4;
    __int16 v11 = 1024;
    unsigned int v12 = v4;
    __int16 v13 = 1024;
    unsigned int v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #survey: %{BOOL}d (surveyEnabled: %{BOOL}d meetsThreshold: %{BOOL}d)", (uint8_t *)&v7, 0x1Eu);
  }
  return v3 & v4;
}

- (id)duetSharedQueue
{
  if (qword_100171E70 != -1) {
    dispatch_once(&qword_100171E70, &stru_100144870);
  }
  v2 = (void *)qword_100171E68;

  return v2;
}

- (void)recordDismissalEventWithContext:(id)a3 markAsUnintended:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v25[0] = @"requestSource";
  int v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 requestSource]);
  v26[0] = v7;
  v25[1] = @"dismissalReason";
  id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 dismissalReason]);
  v26[1] = v8;
  v25[2] = @"unintended";
  __int16 v9 = +[NSNumber numberWithBool:v4];
  v26[2] = v9;
  int v10 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];

  __int16 v11 = +[_DKSystemEventStreams siriServiceStream];
  unsigned int v12 = [v11 name];

  __int16 v13 = [(SRDismissalClassificationController *)self duetSharedQueue];
  AFRecordCoreDuetEventWithStream();

  unsigned int v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136316162;
    v16 = "-[SRDismissalClassificationController recordDismissalEventWithContext:markAsUnintended:]";
    __int16 v17 = 2112;
    CFStringRef v18 = @"com.apple.siri.ui.dismissal.duet";
    __int16 v19 = 2112;
    BOOL v20 = v12;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #survey Sending event %@ to stream %@ with context: %@, metadata: %@", (uint8_t *)&v15, 0x34u);
  }
}

- (void)queryStreamForCountOfEventsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)_DKEventQuery);
  id v6 = +[_DKSystemEventStreams siriServiceStream];
  v29 = v6;
  int v7 = +[NSArray arrayWithObjects:&v29 count:1];
  [v5 setEventStreams:v7];

  id v8 = +[_DKQuery startDateSortDescriptorAscending:1];
  v28 = v8;
  __int16 v9 = +[NSArray arrayWithObjects:&v28 count:1];
  [v5 setSortDescriptors:v9];

  int v10 = +[_DKQuery predicateForEventsWithStringValue:@"com.apple.siri.ui.dismissal.duet"];
  [v5 setPredicate:v10];

  __int16 v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SRDismissalClassificationController queryStreamForCountOfEventsWithCompletion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #survey Starting query with query: %@", buf, 0x16u);
  }
  unsigned int v12 = +[NSMutableArray array];
  __int16 v13 = +[NSMutableArray array];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v27 = 0;
  knowledgeStore = self->_knowledgeStore;
  if (!knowledgeStore)
  {
    uint64_t v15 = +[_DKKnowledgeStore knowledgeStoreWithDirectReadOnlyAccess];
    __int16 v17 = self->_knowledgeStore;
    p_knowledgeStore = &self->_knowledgeStore;
    *p_knowledgeStore = (_DKKnowledgeQuerying *)v15;

    knowledgeStore = *p_knowledgeStore;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10006B41C;
  v21[3] = &unk_100144898;
  id v18 = v12;
  id v22 = v18;
  id v19 = v13;
  id v23 = v19;
  v25 = buf;
  id v20 = v4;
  id v24 = v20;
  [(_DKKnowledgeQuerying *)knowledgeStore executeQuery:v5 responseQueue:0 withCompletion:v21];

  _Block_object_dispose(buf, 8);
}

- (void)recordDismissalMetricWithContext:(id)a3 inputType:(int64_t)a4 previousLongPressBehavior:(int64_t)a5 longPressBehavior:(int64_t)a6
{
  id v7 = a3;
  id v6 = v7;
  AnalyticsSendEventLazy();
}

- (void)recordMitigationStartMetricWithContext:(id)a3 activationHistory:(id)a4 numberOfDaysSinceLastChange:(int64_t)a5
{
  id v6 = a3;
  id v9 = a4;
  id v7 = v6;
  id v8 = v9;
  AnalyticsSendEventLazy();
}

- (void)recordMitigationEndMetricWithContext:(id)a3 activationHistory:(id)a4 numberOfDaysSinceLastChange:(int64_t)a5
{
  id v6 = a3;
  id v9 = a4;
  id v7 = v6;
  id v8 = v9;
  AnalyticsSendEventLazy();
}

- (BOOL)classifyRequestAsUnintendedWithContext:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[SRDismissalClassificationController isDismissalReasonEligibleForSurvey:](self, "isDismissalReasonEligibleForSurvey:", [v4 dismissalReason]);
  BOOL v6 = [v4 contentPresentationState] != (id)2
    && ([v4 siriState] != (id)2 || objc_msgSend(v4, "dismissalReason") == (id)32)
    || [v4 dismissalReason] == (id)53;
  id v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    [v4 dismissalReason];
    id v9 = SASDismissalReasonGetName();
    int v11 = 136316162;
    unsigned int v12 = "-[SRDismissalClassificationController classifyRequestAsUnintendedWithContext:]";
    __int16 v13 = 1024;
    unsigned int v14 = v5;
    __int16 v15 = 2112;
    v16 = v9;
    __int16 v17 = 1024;
    BOOL v18 = v6;
    __int16 v19 = 2048;
    id v20 = [v4 siriState];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s isDismissalReasonEligible: %d (%@), isEligibleBasedOnContentState: %d (%ld)", (uint8_t *)&v11, 0x2Cu);
  }
  return v6 & v5;
}

- (BOOL)isDismissalReasonEligibleForSurvey:(int64_t)a3
{
  return ((unint64_t)a3 > 0x1D) | (0x1FFCF8E7u >> a3) & 1;
}

- (void).cxx_destruct
{
}

@end