@interface CNFRegChangeAccountPasswordController
- (BOOL)canSendURLRequest:(id)a3;
- (CNFRegChangeAccountPasswordController)initWithRegController:(id)a3 appleID:(id)a4;
- (CNFRegChangeAccountPasswordDelegate)delegate;
- (NSString)appleID;
- (id)bagKey;
- (id)logName;
- (id)overrideURLForURL:(id)a3;
- (void)cancelTapped;
- (void)completeHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6;
- (void)dealloc;
- (void)setAppleID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHeadersForRequest:(id)a3;
@end

@implementation CNFRegChangeAccountPasswordController

- (CNFRegChangeAccountPasswordController)initWithRegController:(id)a3 appleID:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CNFRegChangeAccountPasswordController;
  v7 = [(CNFRegAccountWebViewController *)&v10 initWithRegController:a3];
  v8 = v7;
  if (v7) {
    [(CNFRegChangeAccountPasswordController *)v7 setAppleID:v6];
  }

  return v8;
}

- (void)dealloc
{
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CNFRegChangeAccountPasswordController;
  [(CNFRegAccountWebViewController *)&v2 dealloc];
}

- (void)setHeadersForRequest:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNFRegChangeAccountPasswordController;
  [(CNFRegAuthorizedAccountWebViewController *)&v8 setHeadersForRequest:v4];
  v5 = [(CNFRegAccountWebViewController *)self pushTokenHeaderValue];
  id v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "__imHexString");
    [v4 addValue:v7 forHTTPHeaderField:@"x-push-token"];
  }
}

- (BOOL)canSendURLRequest:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNFRegChangeAccountPasswordController;
  if (![(CNFRegAuthorizedAccountWebViewController *)&v10 canSendURLRequest:v4])
  {
LABEL_10:
    BOOL v6 = 0;
    goto LABEL_11;
  }
  v5 = [v4 valueForHTTPHeaderField:@"x-push-token"];

  if (!v5)
  {
    if ([(CNFRegServerWebViewController *)self _shouldLog])
    {
      v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "No push token header for request, denying send", v9, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
    }
    goto LABEL_10;
  }
  BOOL v6 = 1;
LABEL_11:

  return v6;
}

- (id)bagKey
{
  objc_super v2 = [(CNFRegServerWebViewController *)self regController];
  uint64_t v3 = [v2 serviceType];

  if (v3 == 1) {
    return @"md-profile-password-change";
  }
  else {
    return @"vc-profile-password-change";
  }
}

- (id)logName
{
  return @"ChangePassword";
}

- (id)overrideURLForURL:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CNFRegChangeAccountPasswordController *)self appleID];
  BOOL v6 = v5;
  v7 = v4;
  if (v5)
  {
    v7 = v4;
    if ([v5 length])
    {
      if ([(CNFRegServerWebViewController *)self _shouldLog])
      {
        objc_super v8 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v13 = v6;
          _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Appending login {%@} to password change URL", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          v11 = v6;
          IMLogString();
        }
      }
      v9 = objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", v6, @"appleId", v11);
      v7 = [v4 URLByAppendingCNFQueryDictionary:v9];
    }
  }

  return v7;
}

- (void)cancelTapped
{
  id v3 = [(CNFRegChangeAccountPasswordController *)self delegate];
  [v3 changePasswordControllerDidCancel:self];
}

- (void)completeHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(CNFRegChangeAccountPasswordController *)self delegate];
  [v12 changePasswordControllerDidFinish:self withAppleID:v11 authID:v10 authToken:v9];
}

- (CNFRegChangeAccountPasswordDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNFRegChangeAccountPasswordDelegate *)a3;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end