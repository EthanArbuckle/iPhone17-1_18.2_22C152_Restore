@interface CKAssistantSMSUpdate
- (id)_updateSMS;
- (id)_validateUpdate;
- (void)performWithCompletion:(id)a3;
@end

@implementation CKAssistantSMSUpdate

- (id)_updateSMS
{
  v3 = [(CKAssistantSMSUpdate *)self identifier];
  v4 = [v3 identifier];
  v5 = CKAssistantGetDraftForIdentifier();

  if (v5)
  {
    v6 = [(CKAssistantSMSUpdate *)self setFields];
    v7 = [(CKAssistantSMSUpdate *)self addFields];
    v8 = [(CKAssistantSMSUpdate *)self removeFields];
    [v5 updateUsingSet:v6 add:v7 remove:v8];

    CKAssistantUpdateStoreDraftWithSMS();
    id v9 = objc_alloc_init((Class)SADomainObjectUpdateCompleted);
    v10 = [v5 identifier];
    [v9 setIdentifier:v10];
  }
  else
  {
    id v9 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Could not create SMS object to update from current draft"];
  }

  return v9;
}

- (id)_validateUpdate
{
  v3 = [(CKAssistantSMSUpdate *)self identifier];

  if (!v3)
  {
    id v17 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Expected identifier to be set"];
    goto LABEL_19;
  }
  v4 = [(CKAssistantSMSUpdate *)self identifier];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CFStringRef v18 = @"Expected SASmsSms for identifier";
LABEL_17:
    id v17 = [objc_alloc((Class)SACommandFailed) initWithReason:v18];
    goto LABEL_18;
  }
  v5 = [v4 identifier];
  v6 = [v5 absoluteString];
  id v7 = [v6 length];

  if (!v7)
  {
    CFStringRef v18 = @"Invalid sms identifier";
    goto LABEL_17;
  }
  v8 = [(CKAssistantSMSUpdate *)self setFields];

  if (v8)
  {
    id v9 = [(CKAssistantSMSUpdate *)self setFields];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      CFStringRef v18 = @"Expected SASmsSms for setFields";
      goto LABEL_17;
    }
  }
  v11 = [(CKAssistantSMSUpdate *)self addFields];

  if (v11)
  {
    v12 = [(CKAssistantSMSUpdate *)self addFields];
    objc_opt_class();
    char v13 = objc_opt_isKindOfClass();

    if ((v13 & 1) == 0)
    {
      CFStringRef v18 = @"Expected SASmsSms for addFields";
      goto LABEL_17;
    }
  }
  v14 = [(CKAssistantSMSUpdate *)self removeFields];

  if (v14)
  {
    v15 = [(CKAssistantSMSUpdate *)self removeFields];
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) == 0)
    {
      CFStringRef v18 = @"Expected SASmsSms for removeFields";
      goto LABEL_17;
    }
  }
  id v17 = 0;
LABEL_18:

LABEL_19:

  return v17;
}

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "SMSUpdate performWithCompletion", v8, 2u);
    }
  }
  v6 = [(CKAssistantSMSUpdate *)self _validateUpdate];
  if (!v6)
  {
    v6 = [(CKAssistantSMSUpdate *)self _updateSMS];
  }
  id v7 = [v6 dictionary];
  v4[2](v4, v7);
}

@end