@interface CTNFHardwareManager
+ (id)sharedManager;
- (BOOL)fNFHWManagerReady;
- (NFAssertion)fSEBootedAssertionHandle;
- (NFAssertion)fSENoResetAssertionHandle;
- (void)didReceiveFatalCommunicationError;
- (void)hardwareStateDidChange;
- (void)setFNFHWManagerReady:(BOOL)a3;
- (void)setFSEBootedAssertionHandle:(id)a3;
- (void)setFSENoResetAssertionHandle:(id)a3;
@end

@implementation CTNFHardwareManager

+ (id)sharedManager
{
  if (qword_101B0CD48 != -1) {
    dispatch_once(&qword_101B0CD48, &stru_1019C1430);
  }
  v2 = (void *)qword_101B0CD40;

  return v2;
}

- (void)didReceiveFatalCommunicationError
{
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v3, kCtLoggingSystemName, "stockholm.helper");
  v2 = v4;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v3);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "NFC fatal comm error", v3, 2u);
  }
}

- (void)hardwareStateDidChange
{
  v3 = +[NFHardwareManager sharedHardwareManager];
  unsigned int v4 = [v3 getHwSupport];

  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v6, kCtLoggingSystemName, "stockholm.helper");
  v5 = v7;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "HW state change : %u", (uint8_t *)v6, 8u);
  }
  if (v4 == 1)
  {
    [(CTNFHardwareManager *)self setFNFHWManagerReady:0];
    [(CTNFHardwareManager *)self setFSEBootedAssertionHandle:0];
    [(CTNFHardwareManager *)self setFSENoResetAssertionHandle:0];
  }
}

- (BOOL)fNFHWManagerReady
{
  return self->_fNFHWManagerReady;
}

- (void)setFNFHWManagerReady:(BOOL)a3
{
  self->_fNFHWManagerReady = a3;
}

- (NFAssertion)fSEBootedAssertionHandle
{
  return self->_fSEBootedAssertionHandle;
}

- (void)setFSEBootedAssertionHandle:(id)a3
{
}

- (NFAssertion)fSENoResetAssertionHandle
{
  return self->_fSENoResetAssertionHandle;
}

- (void)setFSENoResetAssertionHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fSENoResetAssertionHandle, 0);

  objc_storeStrong((id *)&self->_fSEBootedAssertionHandle, 0);
}

@end