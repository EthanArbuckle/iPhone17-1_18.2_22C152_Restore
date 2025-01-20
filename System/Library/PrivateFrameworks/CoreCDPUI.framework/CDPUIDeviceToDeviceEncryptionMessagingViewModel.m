@interface CDPUIDeviceToDeviceEncryptionMessagingViewModel
- (BOOL)hasLocalSecret;
- (BOOL)is2FA;
- (CDPUIDeviceToDeviceEncryptionFlowContext)context;
- (CDPUIDeviceToDeviceEncryptionMessagingViewModel)initWithContext:(id)a3 is2FA:(BOOL)a4 hasLocalSecret:(BOOL)a5;
- (id)cancelTitle;
- (id)continueTitle;
- (id)message;
- (id)title;
@end

@implementation CDPUIDeviceToDeviceEncryptionMessagingViewModel

- (CDPUIDeviceToDeviceEncryptionMessagingViewModel)initWithContext:(id)a3 is2FA:(BOOL)a4 hasLocalSecret:(BOOL)a5
{
  id v9 = a3;
  v10 = [(CDPUIDeviceToDeviceEncryptionMessagingViewModel *)self init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_context, a3);
    v11->_is2FA = a4;
    v11->_hasLocalSecret = a5;
  }

  return v11;
}

- (id)title
{
  return &stru_26C9EBCA0;
}

- (id)message
{
  return &stru_26C9EBCA0;
}

- (id)continueTitle
{
  return &stru_26C9EBCA0;
}

- (id)cancelTitle
{
  return &stru_26C9EBCA0;
}

- (BOOL)is2FA
{
  return self->_is2FA;
}

- (BOOL)hasLocalSecret
{
  return self->_hasLocalSecret;
}

- (CDPUIDeviceToDeviceEncryptionFlowContext)context
{
  return (CDPUIDeviceToDeviceEncryptionFlowContext *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end