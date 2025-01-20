@interface AMSUIWebVerifyCredentialsAction
+ (id)_authenticationTypeFromStringedType:(id)a3;
+ (int64_t)_serviceTypeFromType:(int64_t)a3;
- (ACAccount)account;
- (AMSUIWebVerifyCredentialsAction)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)ephemeral;
- (BOOL)usernameEditable;
- (NSString)authenticationType;
- (NSString)buttonText;
- (NSString)serviceIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (id)runAction;
- (int64_t)serviceType;
- (void)setAccount:(id)a3;
- (void)setAuthenticationType:(id)a3;
- (void)setButtonText:(id)a3;
- (void)setEphemeral:(BOOL)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setServiceType:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUsernameEditable:(BOOL)a3;
@end

@implementation AMSUIWebVerifyCredentialsAction

- (AMSUIWebVerifyCredentialsAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v55.receiver = self;
  v55.super_class = (Class)AMSUIWebVerifyCredentialsAction;
  v8 = [(AMSUIWebAction *)&v55 initWithJSObject:v6 context:v7];
  if (!v8) {
    goto LABEL_44;
  }
  v9 = [v6 objectForKeyedSubscript:@"account"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  uint64_t v11 = [v7 iTunesAccountFromJSAccount:v10];
  account = v8->_account;
  v8->_account = (ACAccount *)v11;

  v13 = v8->_account;
  if (!v13 || [(ACAccount *)v13 ams_isLocalAccount])
  {
    v14 = (void *)MEMORY[0x263EFB210];
    v15 = [(AMSUIWebAction *)v8 context];
    v16 = [v15 clientInfo];
    v17 = [v16 accountMediaType];
    v18 = objc_msgSend(v14, "ams_sharedAccountStoreForMediaType:", v17);

    v54 = [v18 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFB000]];
    uint64_t v19 = [objc_alloc(MEMORY[0x263EFB1F8]) initWithAccountType:v54];
    v20 = v8->_account;
    v8->_account = (ACAccount *)v19;

    v21 = [v10 objectForKeyedSubscript:@"username"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v22 = v21;
    }
    else {
      id v22 = 0;
    }

    [(ACAccount *)v8->_account setUsername:v22];
    v23 = [v10 objectForKeyedSubscript:@"DSID"];
    v24 = v18;
    id v25 = v7;
    if (objc_opt_respondsToSelector())
    {
      v26 = v10;
      v27 = [v10 objectForKeyedSubscript:@"DSID"];
      uint64_t v28 = [v27 longLongValue];

      if (v28)
      {
        v29 = [NSNumber numberWithLongLong:v28];
        [(ACAccount *)v8->_account ams_setDSID:v29];

LABEL_15:
        id v10 = v26;
        v30 = [v26 objectForKeyedSubscript:@"altDSID"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v31 = v30;
        }
        else {
          id v31 = 0;
        }
        id v7 = v25;

        [(ACAccount *)v8->_account ams_setAltDSID:v31];
        goto LABEL_19;
      }
    }
    else
    {
      v26 = v10;
    }
    [(ACAccount *)v8->_account ams_setDSID:0];
    goto LABEL_15;
  }
LABEL_19:
  v32 = [v6 objectForKeyedSubscript:@"authenticationType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v33 = v32;
  }
  else {
    v33 = 0;
  }

  authenticationType = v8->_authenticationType;
  v8->_authenticationType = v33;

  v35 = [v6 objectForKeyedSubscript:@"buttonText"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v36 = v35;
  }
  else {
    v36 = 0;
  }

  buttonText = v8->_buttonText;
  v8->_buttonText = v36;

  v38 = [v6 objectForKeyedSubscript:@"ephemeral"];
  if (objc_opt_respondsToSelector())
  {
    v39 = [v6 objectForKeyedSubscript:@"ephemeral"];
    v8->_ephemeral = [v39 BOOLValue];
  }
  else
  {
    v8->_ephemeral = 0;
  }

  v40 = [v6 objectForKeyedSubscript:@"serviceIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v41 = v40;
  }
  else {
    v41 = 0;
  }

  serviceIdentifier = v8->_serviceIdentifier;
  v8->_serviceIdentifier = v41;

  v43 = [v6 objectForKeyedSubscript:@"serviceType"];
  if (objc_opt_respondsToSelector())
  {
    v44 = [v6 objectForKeyedSubscript:@"serviceType"];
    v8->_serviceType = [v44 longLongValue];
  }
  else
  {
    v8->_serviceType = 0;
  }

  v45 = [v6 objectForKeyedSubscript:@"subtitle"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v46 = v45;
  }
  else {
    v46 = 0;
  }

  subtitle = v8->_subtitle;
  v8->_subtitle = v46;

  v48 = [v6 objectForKeyedSubscript:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v49 = v48;
  }
  else {
    v49 = 0;
  }

  title = v8->_title;
  v8->_title = v49;

  v51 = [v6 objectForKeyedSubscript:@"usernameEditable"];
  if (objc_opt_respondsToSelector())
  {
    v52 = [v6 objectForKeyedSubscript:@"usernameEditable"];
    v8->_usernameEditable = [v52 BOOLValue];
  }
  else
  {
    v8->_usernameEditable = 0;
  }

LABEL_44:
  return v8;
}

- (id)runAction
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)AMSUIWebVerifyCredentialsAction;
  id v3 = [(AMSUIWebAction *)&v29 runAction];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    v8 = [(AMSUIWebVerifyCredentialsAction *)self account];
    v9 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v31 = v6;
    __int16 v32 = 2114;
    v33 = v7;
    __int16 v34 = 2114;
    v35 = v9;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running AuthKit action for account: %{public}@", buf, 0x20u);
  }
  id v10 = objc_alloc_init(MEMORY[0x263F27B00]);
  uint64_t v11 = [(AMSUIWebVerifyCredentialsAction *)self buttonText];
  [v10 setDefaultButtonString:v11];

  objc_msgSend(v10, "setEphemeral:", -[AMSUIWebVerifyCredentialsAction ephemeral](self, "ephemeral"));
  v12 = [(AMSUIWebVerifyCredentialsAction *)self title];
  [v10 setPromptTitle:v12];

  v13 = [(AMSUIWebVerifyCredentialsAction *)self subtitle];
  [v10 setReason:v13];

  objc_msgSend(v10, "setServiceType:", objc_msgSend((id)objc_opt_class(), "_serviceTypeFromType:", -[AMSUIWebVerifyCredentialsAction serviceType](self, "serviceType")));
  v14 = [(AMSUIWebVerifyCredentialsAction *)self serviceIdentifier];
  [v10 setServiceIdentifier:v14];

  v15 = objc_opt_class();
  v16 = [(AMSUIWebVerifyCredentialsAction *)self authenticationType];
  v17 = [v15 _authenticationTypeFromStringedType:v16];

  v18 = [(AMSUIWebVerifyCredentialsAction *)self authenticationType];

  if (v18) {
    uint64_t v19 = [v17 unsignedIntegerValue];
  }
  else {
    uint64_t v19 = 0;
  }
  [v10 setAuthenticationType:v19];
  v20 = [(AMSUIWebAction *)self context];
  v21 = [v20 flowController];
  id v22 = [v21 currentContainer];

  v23 = [AMSUIAuthKitUpdateTask alloc];
  v24 = [(AMSUIWebVerifyCredentialsAction *)self account];
  id v25 = [(AMSUIAuthKitUpdateTask *)v23 initWithAccount:v24 presentingViewController:v22 options:v10];

  v26 = [(AMSAuthKitUpdateTask *)v25 performAuthKitUpdate];
  v27 = [v26 thenWithBlock:&__block_literal_global_32];

  return v27;
}

id __44__AMSUIWebVerifyCredentialsAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 authenticationResults];
  id v3 = (void *)[v2 mutableCopy];

  [v3 setObject:0 forKeyedSubscript:*MEMORY[0x263F28FF8]];
  v4 = [MEMORY[0x263F27E10] promiseWithResult:v3];

  return v4;
}

+ (int64_t)_serviceTypeFromType:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a3 == 1) {
      return 1;
    }
    v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v5)
    {
      v5 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    uint64_t v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      v8 = AMSLogKey();
      int v9 = 138543874;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      v12 = v8;
      __int16 v13 = 2048;
      int64_t v14 = a3;
      _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Defaulting to STORE service type. (%ld)", (uint8_t *)&v9, 0x20u);
    }
  }
  return 2;
}

+ (id)_authenticationTypeFromStringedType:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend(&unk_26CC73A88, "objectForKeyedSubscript:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(id)a3
{
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (void)setButtonText:(id)a3
{
}

- (BOOL)ephemeral
{
  return self->_ephemeral;
}

- (void)setEphemeral:(BOOL)a3
{
  self->_ephemeral = a3;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)usernameEditable
{
  return self->_usernameEditable;
}

- (void)setUsernameEditable:(BOOL)a3
{
  self->_usernameEditable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_authenticationType, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end