@interface MechanismPassphrase
- (MechanismPassphrase)initWithAcmContextRecord:(id)a3 request:(id)a4;
- (MechanismPassphrase)initWithParams:(id)a3 request:(id)a4;
- (id)additionalControllerInternalInfoForPolicy:(int64_t)a3;
- (unsigned)purpose;
- (void)enterPassphrase:(id)a3 reply:(id)a4;
- (void)setCredential:(id)a3 credentialType:(int64_t)a4 reply:(id)a5;
@end

@implementation MechanismPassphrase

- (MechanismPassphrase)initWithParams:(id)a3 request:(id)a4
{
  id v6 = a4;
  v7 = [a3 objectForKeyedSubscript:@"AcmContextRecord"];
  v8 = [(MechanismPassphrase *)self initWithAcmContextRecord:v7 request:v6];

  return v8;
}

- (MechanismPassphrase)initWithAcmContextRecord:(id)a3 request:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MechanismPassphrase;
  v7 = [(MechanismPassphrase *)&v9 initWithEventIdentifier:3 remoteViewController:3 acmContextRecord:v6 request:a4];
  if (v7) {
    v7->_purpose = [v6 passphrasePurpose];
  }

  return v7;
}

- (void)enterPassphrase:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, id))a4;
  if (qword_20AA0 != -1) {
    dispatch_once(&qword_20AA0, &stru_1C3F0);
  }
  v8 = qword_20AA8;
  if (os_log_type_enabled((os_log_t)qword_20AA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[MechanismPassphrase enterPassphrase:reply:]";
    __int16 v30 = 2112;
    v31 = self;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }
  id v9 = objc_msgSend(objc_alloc((Class)LAACMHelper), "initWithACMContext:", -[MechanismPassphrase acmContext](self, "acmContext"));
  id v23 = 0;
  unsigned __int8 v10 = [v9 performContextBlock:&stru_1C3D0 error:&v23];
  id v11 = v23;
  if (v10)
  {
    v12 = [(MechanismPassphrase *)self policyOptions];
    v13 = [v12 objectForKey:&off_1C800];
    [v13 doubleValue];
    double v15 = v14;

    if (v15 == 0.0) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 2;
    }
    uint64_t purpose = self->_purpose;
    id v22 = v11;
    id v18 = [v9 replacePassphraseCredentialWithPurpose:purpose passphrase:v6 scope:v16 error:&v22];
    id v19 = v22;

    v7[2](v7, v18, v19);
    if (v18)
    {
      CFStringRef v26 = @"Result";
      v24 = &off_1C818;
      v25 = &__kCFBooleanTrue;
      v20 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      v27 = v20;
      v21 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      [(MechanismPassphrase *)self finishRunWithResult:v21 error:v19];
    }
    else
    {
      [(MechanismPassphrase *)self finishRunWithResult:0 error:v19];
    }
    id v11 = v19;
  }
  else
  {
    v7[2](v7, 0, v11);
  }
}

- (id)additionalControllerInternalInfoForPolicy:(int64_t)a3
{
  CFStringRef v6 = @"PassphrasePurpose";
  v3 = +[NSNumber numberWithUnsignedInt:self->_purpose];
  v7 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  return v4;
}

- (void)setCredential:(id)a3 credentialType:(int64_t)a4 reply:(id)a5
{
  if (a4 == -2)
  {
    id v8 = a3;
    id v9 = a5;
    id v10 = v8;
    id v11 = [v10 bytes];
    id v12 = [v10 length];

    id v16 = +[LACSecureData secureDataWithBytes:v11 length:v12];
    [(MechanismPassphrase *)self enterPassphrase:v16 reply:v9];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)MechanismPassphrase;
    id v14 = a5;
    id v15 = a3;
    [(MechanismPassphrase *)&v17 setCredential:v15 credentialType:a4 reply:v14];
  }
}

- (unsigned)purpose
{
  return self->_purpose;
}

@end