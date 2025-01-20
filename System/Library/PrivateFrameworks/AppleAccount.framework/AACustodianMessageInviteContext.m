@interface AACustodianMessageInviteContext
- (AACustodianMessageInviteContext)initWithLocalContact:(id)a3 custodianID:(id)a4;
- (AACustodianMessageInviteContext)initWithLocalContact:(id)a3 custodianID:(id)a4 upsell:(BOOL)a5;
- (BOOL)upsell;
- (NSURL)messageURL;
- (id)_messageURLForCustodianID:(id)a3;
- (id)_urlForCustodianID:(id)a3;
- (void)setMessageURL:(id)a3;
@end

@implementation AACustodianMessageInviteContext

- (AACustodianMessageInviteContext)initWithLocalContact:(id)a3 custodianID:(id)a4
{
  return [(AACustodianMessageInviteContext *)self initWithLocalContact:a3 custodianID:a4 upsell:0];
}

- (AACustodianMessageInviteContext)initWithLocalContact:(id)a3 custodianID:(id)a4 upsell:(BOOL)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"AACustodianMessageInviteContext.m", 23, @"Invalid parameter not satisfying: %@", @"custodianID" object file lineNumber description];
  }
  v11 = [(AACustodianMessageInviteContext *)self init];
  if (v11)
  {
    v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v13 = [v12 localizedStringForKey:@"CUSTODIAN_MESSAGES_BUBBLE_TITLE" value:0 table:@"Localizable"];
    [(AAMessagesInviteContext *)v11 setTitle:v13];

    v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v15 = [v14 localizedStringForKey:@"APPLE" value:0 table:@"Localizable"];
    [(AAMessagesInviteContext *)v11 setSubtitle:v15];

    v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v17 = [v16 localizedStringForKey:@"CUSTODIAN_MESSAGES_BUBBLE_ACTION_LABEL" value:0 table:@"Localizable"];
    [(AAMessagesInviteContext *)v11 setAction:v17];

    v18 = [v9 handle];
    v26[0] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    [(AAMessagesInviteContext *)v11 setRecipients:v19];

    v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v21 = [v20 localizedStringForKey:@"CUSTODIAN_MESSAGES_BUBBLE_INVITE_BODY" value:0 table:@"Localizable"];
    [(AAMessagesInviteContext *)v11 setMessageBody:v21];

    v22 = [(AACustodianMessageInviteContext *)v11 _urlForCustodianID:v10];
    [(AAMessagesInviteContext *)v11 setInviteURL:v22];

    v23 = [(AACustodianMessageInviteContext *)v11 _messageURLForCustodianID:v10];
    [(AACustodianMessageInviteContext *)v11 setMessageURL:v23];

    v11->_upsell = a5;
  }

  return v11;
}

- (id)_urlForCustodianID:(id)a3
{
  v3 = +[AAUniversalLinkHelper stringForCustodianMessagesURLWithUUID:a3];
  v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];

  return v4;
}

- (id)_messageURLForCustodianID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F29088];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc(MEMORY[0x1E4F290C8]);
  v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  id v9 = [v8 localizedStringForKey:@"CUSTODIAN_MESSAGES_UPSELL_MESSAGE_TITLE" value:0 table:@"Localizable"];
  id v10 = (void *)[v7 initWithName:@"messageTitle" value:v9];
  [v6 addObject:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F290C8]);
  v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v13 = [v12 localizedStringForKey:@"CUSTODIAN_MESSAGES_UPSELL_MESSAGE_SUBTITLE" value:0 table:@"Localizable"];
  v14 = (void *)[v11 initWithName:@"messageSubTitle" value:v13];
  [v6 addObject:v14];

  id v15 = objc_alloc(MEMORY[0x1E4F290C8]);
  v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v17 = [v16 localizedStringForKey:@"CUSTODIAN_MESSAGES_UPSELL_MESSAGE_ACCEPT_BUTTON_LABEL" value:0 table:@"Localizable"];
  v18 = (void *)[v15 initWithName:@"acceptButtonLabel" value:v17];
  [v6 addObject:v18];

  id v19 = objc_alloc(MEMORY[0x1E4F290C8]);
  v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v21 = [v20 localizedStringForKey:@"CUSTODIAN_MESSAGES_UPSELL_MESSAGE_DECLINE_BUTTON_LABEL" value:0 table:@"Localizable"];
  v22 = (void *)[v19 initWithName:@"declineButtonLabel" value:v21];
  [v6 addObject:v22];

  id v23 = objc_alloc(MEMORY[0x1E4F290C8]);
  v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v25 = [v24 localizedStringForKey:@"CUSTODIAN_MESSAGES_UPSELL_MESSAGE_ACCEPT_URL" value:0 table:@"Localizable"];
  v26 = (void *)[v23 initWithName:@"acceptInviteUrl" value:v25];
  [v6 addObject:v26];

  id v27 = objc_alloc(MEMORY[0x1E4F290C8]);
  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v29 = [v28 localizedStringForKey:@"CUSTODIAN_MESSAGES_UPSELL_MESSAGE_DECLINE_URL" value:0 table:@"Localizable"];
  v30 = (void *)[v27 initWithName:@"declineInviteUrl" value:v29];
  [v6 addObject:v30];

  id v31 = objc_alloc(MEMORY[0x1E4F290C8]);
  v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v33 = [v32 localizedStringForKey:@"CUSTODIAN_MESSAGES_UPSELL_MESSAGE_ACCEPTED_BUTTON_LABEL" value:0 table:@"Localizable"];
  v34 = (void *)[v31 initWithName:@"acceptedButtonLabel" value:v33];
  [v6 addObject:v34];

  id v35 = objc_alloc(MEMORY[0x1E4F290C8]);
  v36 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v37 = [v36 localizedStringForKey:@"CUSTODIAN_MESSAGES_UPSELL_MESSAGE_DECLINED_BUTTON_LABEL" value:0 table:@"Localizable"];
  v38 = (void *)[v35 initWithName:@"declinedButtonLabel" value:v37];
  [v6 addObject:v38];

  id v39 = objc_alloc(MEMORY[0x1E4F290C8]);
  v40 = [v4 UUIDString];

  v41 = (void *)[v39 initWithName:@"custodianID" value:v40];
  [v6 addObject:v41];

  id v42 = objc_alloc(MEMORY[0x1E4F290C8]);
  v43 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v44 = [v43 localizedStringForKey:@"CUSTODIAN_MESSAGES_UPSELL_MESSAGE_SENT_BUTTON_LABEL" value:0 table:@"Localizable"];
  v45 = (void *)[v42 initWithName:@"requestSent" value:v44];
  [v6 addObject:v45];

  id v46 = objc_alloc(MEMORY[0x1E4F290C8]);
  v47 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v48 = [v47 localizedStringForKey:@"CUSTODIAN_MESSAGES_UPSELL_MESSAGE_RECIPIENT_ACCEPTED_SUBTITLE" value:0 table:@"Localizable"];
  v49 = (void *)[v46 initWithName:@"recipientAccepted" value:v48];
  [v6 addObject:v49];

  id v50 = objc_alloc(MEMORY[0x1E4F290C8]);
  v51 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v52 = [v51 localizedStringForKey:@"CUSTODIAN_MESSAGES_UPSELL_MESSAGE_RECIPIENT_DECLINED_SUBTITLE" value:0 table:@"Localizable"];
  v53 = (void *)[v50 initWithName:@"recipientDeclined" value:v52];
  [v6 addObject:v53];

  id v54 = objc_alloc(MEMORY[0x1E4F290C8]);
  v55 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v56 = [v55 localizedStringForKey:@"CUSTODIAN_MESSAGES_UPSELL_MESSAGE_SENDER_ACCEPTED_SUBTITLE" value:0 table:@"Localizable"];
  v57 = (void *)[v54 initWithName:@"senderAccepted" value:v56];
  [v6 addObject:v57];

  id v58 = objc_alloc(MEMORY[0x1E4F290C8]);
  v59 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  v60 = [v59 localizedStringForKey:@"CUSTODIAN_MESSAGES_UPSELL_MESSAGE_SENDER_DECLINED_SUBTITLE" value:0 table:@"Localizable"];
  v61 = (void *)[v58 initWithName:@"senderDeclined" value:v60];
  [v6 addObject:v61];

  v62 = (void *)[v6 copy];
  [v5 setQueryItems:v62];

  v63 = _AALogSystem();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
    -[AACustodianMessageInviteContext _messageURLForCustodianID:](v5, v63);
  }

  v64 = [v5 URL];

  return v64;
}

- (BOOL)upsell
{
  return self->_upsell;
}

- (NSURL)messageURL
{
  return self->_messageURL;
}

- (void)setMessageURL:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_messageURLForCustodianID:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 URL];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "message bubble url %@", (uint8_t *)&v4, 0xCu);
}

@end