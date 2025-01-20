@interface StoreKitMessageInfo
- (BOOL)allowDeveloperControl;
- (NSNumber)status;
- (NSNumber)userID;
- (NSString)bundleID;
- (StoreKitMessageInfo)initWithUserID:(id)a3 bundleID:(id)a4 status:(id)a5 allowDeveloperControl:(BOOL)a6 messageType:(int64_t)a7;
- (int64_t)type;
@end

@implementation StoreKitMessageInfo

- (StoreKitMessageInfo)initWithUserID:(id)a3 bundleID:(id)a4 status:(id)a5 allowDeveloperControl:(BOOL)a6 messageType:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (!v13)
  {
    if (qword_1003A0848 != -1) {
      dispatch_once(&qword_1003A0848, &stru_10035A908);
    }
    v19 = qword_1003A0800;
    if (os_log_type_enabled((os_log_t)qword_1003A0800, OS_LOG_TYPE_ERROR)) {
      sub_1002CB288(v19);
    }
    goto LABEL_14;
  }
  if (!v14)
  {
    if (qword_1003A0848 != -1) {
      dispatch_once(&qword_1003A0848, &stru_10035A908);
    }
    v20 = qword_1003A0800;
    if (os_log_type_enabled((os_log_t)qword_1003A0800, OS_LOG_TYPE_ERROR)) {
      sub_1002CB2CC(v20);
    }
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  v22.receiver = self;
  v22.super_class = (Class)StoreKitMessageInfo;
  v16 = [(StoreKitMessageInfo *)&v22 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_userID, a3);
    objc_storeStrong((id *)&v17->_bundleID, a4);
    objc_storeStrong((id *)&v17->_status, a5);
    v17->_allowDeveloperControl = a6;
    v17->_type = a7;
  }
  self = v17;
  v18 = self;
LABEL_15:

  return v18;
}

- (NSNumber)userID
{
  return self->_userID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSNumber)status
{
  return self->_status;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)allowDeveloperControl
{
  return self->_allowDeveloperControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_userID, 0);
}

@end