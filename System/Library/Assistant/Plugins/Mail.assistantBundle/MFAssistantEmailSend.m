@interface MFAssistantEmailSend
- (BOOL)anyRecipientIsInvalid:(id)a3;
- (id)_sendEmail:(id)a3;
- (id)_validateEmail:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation MFAssistantEmailSend

- (BOOL)anyRecipientIsInvalid:(id)a3
{
  return objc_msgSend(a3, "ef_any:", &stru_C3F0);
}

- (id)_validateEmail:(id)a3
{
  id v4 = a3;
  if ((MSCanSendMail() & 1) == 0)
  {
    id v11 = objc_alloc((Class)SACommandFailed);
    id v12 = [v11 initWithErrorCode:SAEmailNoAccountErrorCode];
LABEL_12:
    v13 = v12;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = objc_alloc((Class)SACommandFailed);
    CFStringRef v10 = @"Did not get an email to send.";
    goto LABEL_11;
  }
  v5 = [v4 recipientsTo];
  if ([v5 count]) {
    goto LABEL_6;
  }
  v6 = [v4 recipientsCc];
  if ([v6 count])
  {

LABEL_6:
    goto LABEL_7;
  }
  v19 = [v4 recipientsBcc];
  id v20 = [v19 count];

  if (!v20)
  {
    id v9 = objc_alloc((Class)SACommandFailed);
    CFStringRef v10 = @"Missing any recipients.";
    goto LABEL_11;
  }
LABEL_7:
  v7 = [v4 recipientsTo];
  unsigned int v8 = [(MFAssistantEmailSend *)self anyRecipientIsInvalid:v7];

  if (v8)
  {
    id v9 = objc_alloc((Class)SACommandFailed);
    CFStringRef v10 = @"Invalid to recipients.";
LABEL_11:
    id v12 = [v9 initWithReason:v10];
    goto LABEL_12;
  }
  v15 = [v4 recipientsCc];
  unsigned int v16 = [(MFAssistantEmailSend *)self anyRecipientIsInvalid:v15];

  if (v16)
  {
    id v9 = objc_alloc((Class)SACommandFailed);
    CFStringRef v10 = @"Invalid cc recipients.";
    goto LABEL_11;
  }
  v17 = [v4 recipientsBcc];
  unsigned int v18 = [(MFAssistantEmailSend *)self anyRecipientIsInvalid:v17];

  if (v18)
  {
    id v9 = objc_alloc((Class)SACommandFailed);
    CFStringRef v10 = @"Invalid bcc recipients.";
    goto LABEL_11;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (id)_sendEmail:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)MSEmailModel) initWithSAEmail:v3];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_7F44;
  v23 = sub_7F54;
  id v24 = 0;
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_7F5C;
  unsigned int v16 = &unk_C418;
  unsigned int v18 = &v19;
  v5 = dispatch_semaphore_create(0);
  v17 = v5;
  v6 = +[MSSendEmail sendEmail:v4 playSound:1 completionBlock:&v13];
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v7))
  {
    objc_msgSend(v6, "cancel", v13, v14, v15, v16);
    id v8 = objc_alloc((Class)SACommandFailed);
    CFStringRef v9 = @"Send timed out.";
LABEL_3:
    id v10 = objc_msgSend(v8, "initWithReason:", v9, v13, v14, v15, v16);
    goto LABEL_6;
  }
  if (!v20[5])
  {
    id v8 = objc_alloc((Class)SACommandFailed);
    CFStringRef v9 = @"Send failed.";
    goto LABEL_3;
  }
  id v10 = objc_alloc_init((Class)SADomainObjectCommitCompleted);
  id v11 = objc_msgSend(v3, "identifier", v13, v14, v15, v16);
  [v10 setIdentifier:v11];

LABEL_6:
  _Block_object_dispose(&v19, 8);

  return v10;
}

- (void)performWithCompletion:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  id v4 = [(MFAssistantEmailSend *)self identifier];
  v5 = [(MFAssistantEmailSend *)self _validateEmail:v4];

  if (!v5)
  {
    v6 = [(MFAssistantEmailSend *)self identifier];
    v5 = [(MFAssistantEmailSend *)self _sendEmail:v6];
  }
  dispatch_time_t v7 = [v5 dictionary];
  v8[2](v8, v7);
}

@end