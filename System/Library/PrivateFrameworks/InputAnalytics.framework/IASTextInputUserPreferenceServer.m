@interface IASTextInputUserPreferenceServer
- (BOOL)readyToReportPreferenceToEventHandler;
- (IASTextInputUserPreferenceServer)init;
- (IASTextInputUserPreferenceServer)initWithEventHandler:(id)a3;
- (id)eventHandler;
- (int64_t)retrieveStandardBooleanPreference:(id)a3;
- (void)dispatchUserPreference:(int64_t)a3 withValue:(int64_t)a4;
- (void)reportStateForUserPreference:(int64_t)a3;
- (void)setEventHandler:(id)a3;
- (void)setReadyToReportPreferenceToEventHandler:(BOOL)a3;
@end

@implementation IASTextInputUserPreferenceServer

- (IASTextInputUserPreferenceServer)initWithEventHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IASTextInputUserPreferenceServer;
  v5 = [(IASTextInputUserPreferenceServer *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id eventHandler = v5->_eventHandler;
    v5->_id eventHandler = v6;

    v5->_readyToReportPreferenceToEventHandler = 0;
  }

  return v5;
}

- (IASTextInputUserPreferenceServer)init
{
  return (IASTextInputUserPreferenceServer *)objc_msgSend_initWithEventHandler_(self, a2, (uint64_t)&unk_2702E3908, v2);
}

- (void)dispatchUserPreference:(int64_t)a3 withValue:(int64_t)a4
{
  if (objc_msgSend_readyToReportPreferenceToEventHandler(self, a2, a3, a4))
  {
    v20 = objc_alloc_init(IASTextInputUserPreferenceStateEvent);
    v7 = sub_2529F5294(a3);
    objc_msgSend_setPreferenceName_(v20, v8, (uint64_t)v7, v9);

    objc_msgSend_setPreferenceValue_(v20, v10, a4, v11);
    v15 = objc_msgSend_eventHandler(self, v12, v13, v14);
    objc_msgSend_dispatchEvent_(v20, v16, (uint64_t)v15, v17);

    objc_msgSend_setReadyToReportPreferenceToEventHandler_(self, v18, 0, v19);
  }
}

- (void)reportStateForUserPreference:(int64_t)a3
{
  objc_msgSend_setReadyToReportPreferenceToEventHandler_(self, a2, 0, v3);
  v5 = sub_252A049DC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_252A11B5C(a3, v5);
  }
}

- (int64_t)retrieveStandardBooleanPreference:(id)a3
{
  return 0;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (BOOL)readyToReportPreferenceToEventHandler
{
  return self->_readyToReportPreferenceToEventHandler;
}

- (void)setReadyToReportPreferenceToEventHandler:(BOOL)a3
{
  self->_readyToReportPreferenceToEventHandler = a3;
}

- (void).cxx_destruct
{
}

@end