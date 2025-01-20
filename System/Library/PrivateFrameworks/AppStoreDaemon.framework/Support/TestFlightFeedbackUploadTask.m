@interface TestFlightFeedbackUploadTask
- (void)main;
@end

@implementation TestFlightFeedbackUploadTask

- (void)main
{
  v3 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      entity = self->_entity;
    }
    else {
      entity = 0;
    }
    v5 = entity;
    v6 = sub_100233614(v5);
    if (self) {
      v7 = self->_entity;
    }
    else {
      v7 = 0;
    }
    v8 = v7;
    v9 = sub_100233690(v8);
    v10 = [v9 appVersion];
    int v11 = 138412546;
    v12 = v6;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%@]: Starting feedback upload for %{public}@", (uint8_t *)&v11, 0x16u);
  }
  sub_1002C4FF4((uint64_t)self, self->_entity);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseStore, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end