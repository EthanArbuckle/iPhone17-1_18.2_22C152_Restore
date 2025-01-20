@interface NCContactsSyncDataAccessHelper
+ (id)os_log;
- (BOOL)isChinaSKUDevice;
- (BOOL)networkAccessEnabledForContacts;
- (__CTServerConnection)ctServerConnection;
- (void)dealloc;
- (void)setNetworkAccessEnabledForContacts:(BOOL)a3;
@end

@implementation NCContactsSyncDataAccessHelper

- (void)dealloc
{
  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection) {
    CFRelease(ctServerConnection);
  }
  v4.receiver = self;
  v4.super_class = (Class)NCContactsSyncDataAccessHelper;
  [(NCContactsSyncDataAccessHelper *)&v4 dealloc];
}

+ (id)os_log
{
  if (qword_23E48 != -1) {
    dispatch_once(&qword_23E48, &stru_1C640);
  }
  v2 = (void *)qword_23E50;

  return v2;
}

- (__CTServerConnection)ctServerConnection
{
  result = self->_ctServerConnection;
  if (!result)
  {
    result = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
    self->_ctServerConnection = result;
  }
  return result;
}

- (BOOL)isChinaSKUDevice
{
  if (qword_23E60 != -1) {
    dispatch_once(&qword_23E60, &stru_1C660);
  }
  return byte_23E58;
}

- (BOOL)networkAccessEnabledForContacts
{
  [(NCContactsSyncDataAccessHelper *)self ctServerConnection];
  _CTServerConnectionCopyCellularUsagePolicy();
  v2 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10330();
  }

  v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v6 = "-[NCContactsSyncDataAccessHelper networkAccessEnabledForContacts]";
    __int16 v7 = 1024;
    LODWORD(v8) = 1;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s - return networkAccessEnabledForContacts: %d", buf, 0x12u);
  }

  return 1;
}

- (void)setNetworkAccessEnabledForContacts:(BOOL)a3
{
  objc_super v4 = &kCTCellularDataUsagePolicyAlwaysAllow;
  if (!a3) {
    objc_super v4 = &kCTCellularDataUsagePolicyDeny;
  }
  v12[0] = *v4;
  v11[0] = kCTCellularDataUsagePolicy;
  v11[1] = kCTCellularUsagePolicyDataAllowed;
  v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:");
  v11[2] = kCTWiFiDataUsagePolicy;
  v12[1] = v5;
  v12[2] = v12[0];
  v6 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  [(NCContactsSyncDataAccessHelper *)self ctServerConnection];
  LODWORD(v5) = _CTServerConnectionSetCellularUsagePolicy();
  __int16 v7 = objc_msgSend((id)objc_opt_class(), "os_log");
  uint64_t v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_103A4();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446210;
    v10 = "-[NCContactsSyncDataAccessHelper setNetworkAccessEnabledForContacts:]";
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s - no error", (uint8_t *)&v9, 0xCu);
  }
}

@end