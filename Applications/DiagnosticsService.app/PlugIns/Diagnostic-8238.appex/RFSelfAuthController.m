@interface RFSelfAuthController
- (RFSelfAuthInputs)inputs;
- (void)setInputs:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation RFSelfAuthController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  -[RFSelfAuthController setInputs:](self, "setInputs:", a3, a4);

  [(RFSelfAuthController *)self setFinished:0];
}

- (void)start
{
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "== RF Self Test [Auth] started ==", (uint8_t *)&v22, 2u);
  }
  [(RFSelfAuthController *)self setFinished:0];
  v4 = objc_alloc_init(RFSelfAuthExtensionHelper);
  fDiagHelper = self->fDiagHelper;
  self->fDiagHelper = v4;

  if ([(RFSelfAuthExtensionHelper *)self->fDiagHelper loadTestConfigFromUserDefaults])
  {
    uint64_t v6 = ([(RFSelfAuthExtensionHelper *)self->fDiagHelper testConfiguration] >> 8) & 1;
    v7 = [(RFSelfAuthController *)self inputs];
    [v7 setAddAPTagToTicket:v6];

    v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "[RFSelfTest] Test parameters overrided", (uint8_t *)&v22, 2u);
    }
  }
  [(RFSelfAuthExtensionHelper *)self->fDiagHelper clearRFSelfTestTicket];
  int64_t v9 = [(RFSelfAuthExtensionHelper *)self->fDiagHelper getPersonalizationInfo];
  if (v9)
  {
    int v10 = v9;
    v11 = +[NSNumber numberWithInteger:v9];
    v12 = [(RFSelfAuthController *)self result];
    [v12 setStatusCode:v11];

    v13 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LODWORD(v22) = 67109120;
    HIDWORD(v22) = v10;
    v14 = "[RFSelfTest] Abort test with error: Failed to get Personalized info, statusCode=%d";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v22, 8u);
    goto LABEL_14;
  }
  v15 = self->fDiagHelper;
  v16 = [(RFSelfAuthController *)self inputs];
  id v17 = -[RFSelfAuthExtensionHelper getSignedTicketAndStore:](v15, "getSignedTicketAndStore:", [v16 addAPTagToTicket]);

  if (v17)
  {
    v18 = +[NSNumber numberWithInteger:v17];
    v19 = [(RFSelfAuthController *)self result];
    [v19 setStatusCode:v18];

    v13 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LODWORD(v22) = 67109120;
    HIDWORD(v22) = v17;
    v14 = "[RFSelfTest] Abort test with error: Failed to get Signed ticket, statusCode=%d";
    goto LABEL_12;
  }
  v20 = [(RFSelfAuthController *)self result];
  [v20 setStatusCode:&off_1000041F8];

LABEL_14:
  -[RFSelfAuthController setFinished:](self, "setFinished:", 1, v22);
  v21 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_DEFAULT, "== RF Self Test [Auth] finished ==", (uint8_t *)&v22, 2u);
  }
  [(RFSelfAuthExtensionHelper *)self->fDiagHelper resetAll];
}

- (RFSelfAuthInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputs, 0);

  objc_storeStrong((id *)&self->fDiagHelper, 0);
}

@end