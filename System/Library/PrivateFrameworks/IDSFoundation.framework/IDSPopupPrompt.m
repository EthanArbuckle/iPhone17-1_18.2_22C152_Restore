@interface IDSPopupPrompt
- (IDSPopupPrompt)initWithTitle:(id)a3 promptMessage:(id)a4;
- (NSString)message;
- (NSString)title;
- (void)launchPromptWithButton:(id)a3 defaultUrl:(id)a4 alternateButton:(id)a5 alternateUrl:(id)a6;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation IDSPopupPrompt

- (IDSPopupPrompt)initWithTitle:(id)a3 promptMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IDSPopupPrompt;
  v8 = [(IDSPopupPrompt *)&v15 init];
  v11 = v8;
  if (v8)
  {
    objc_msgSend_setTitle_(v8, v9, (uint64_t)v6, v10);
    objc_msgSend_setMessage_(v11, v12, (uint64_t)v7, v13);
  }

  return v11;
}

- (void)launchPromptWithButton:(id)a3 defaultUrl:(id)a4 alternateButton:(id)a5 alternateUrl:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (qword_1E944F408 != -1) {
    dispatch_once(&qword_1E944F408, &unk_1EEFCD4B8);
  }
  title = (__CFString *)self->_title;
  if (!title) {
    title = @"Internal IDS Error Detected";
  }
  objc_super v15 = title;
  message = (__CFString *)self->_message;
  if (!message) {
    message = @"An internal IDS error has been detected";
  }
  v17 = message;
  v18 = (void *)MEMORY[0x1E4F6C410];
  v22 = objc_msgSend_stringGUID(NSString, v19, v20, v21);
  v25 = objc_msgSend_userNotificationWithIdentifier_title_message_defaultButton_alternateButton_otherButton_(v18, v23, (uint64_t)v22, v24, v15, v17, v10, v12, @"Dismiss");

  if (v25)
  {
    v29 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C418], v26, v27, v28);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_19D9F2CF0;
    v32[3] = &unk_1E5970A08;
    id v33 = v11;
    id v34 = v13;
    objc_msgSend_addUserNotification_listener_completionHandler_(v29, v30, (uint64_t)v25, v31, 0, v32);
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end