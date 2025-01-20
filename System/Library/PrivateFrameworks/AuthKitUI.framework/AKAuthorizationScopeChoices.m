@interface AKAuthorizationScopeChoices
+ (NSString)localizedFamilyNameLabel;
+ (NSString)localizedGivenNameLabel;
+ (id)_dotsWithLength:(unint64_t)a3;
+ (id)obfuscatedEmail:(id)a3;
- (AKAuthorizationLoginChoice)loginChoice;
- (AKAuthorizationScopeChoices)initWithScopes:(id)a3 userInformation:(id)a4;
- (AKAuthorizationUserResponse)userResponse;
- (AKCredentialRequestProtocol)selectedRequest;
- (AKUserInformation)userInformation;
- (BOOL)wantsPrivateEmail;
- (NSArray)scopes;
- (NSString)chosenEmail;
- (NSString)forwardingEmail;
- (NSString)localizedChosenEmail;
- (NSString)localizedName;
- (id)_personNameComponents;
- (id)_userSelection;
- (id)description;
- (id)emailAtIndex:(unint64_t)a3;
- (unint64_t)emailCount;
- (unint64_t)indexOfChosenEmail;
- (unint64_t)indexOfChosenLogin;
- (unint64_t)personNameComponentsOrder;
- (void)setGivenName:(id)a3 familyName:(id)a4;
- (void)setIndexOfChosenEmail:(unint64_t)a3;
- (void)setIndexOfChosenLogin:(unint64_t)a3;
- (void)setLoginChoice:(id)a3;
- (void)setScopes:(id)a3;
- (void)setSelectedRequest:(id)a3;
- (void)setUserInformation:(id)a3;
- (void)setWantsPrivateEmail:(BOOL)a3;
@end

@implementation AKAuthorizationScopeChoices

- (AKAuthorizationScopeChoices)initWithScopes:(id)a3 userInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AKAuthorizationScopeChoices;
  v8 = [(AKAuthorizationScopeChoices *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    v10 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v9;

    uint64_t v11 = [v7 copy];
    v12 = (void *)*((void *)v8 + 3);
    *((void *)v8 + 3) = v11;

    *(int64x2_t *)(v8 + 40) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v13 = [*((id *)v8 + 3) reachableEmails];
    *((void *)v8 + 8) = [v13 count];
  }
  return (AKAuthorizationScopeChoices *)v8;
}

- (void)setGivenName:(id)a3 familyName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(AKAuthorizationScopeChoices *)self userInformation];
  [v8 setGivenName:v7];

  id v9 = [(AKAuthorizationScopeChoices *)self userInformation];
  [v9 setFamilyName:v6];
}

- (NSString)chosenEmail
{
  v3 = [(AKAuthorizationScopeChoices *)self userInformation];
  int v4 = [v3 isManagedAppleID];

  if (v4)
  {
    v5 = [(AKAuthorizationScopeChoices *)self userInformation];
    uint64_t v6 = [v5 sharedEmailForManagedAppleID];

    if (v6) {
      id v7 = (__CFString *)v6;
    }
    else {
      id v7 = &stru_1F1EE8138;
    }
  }
  else if ([(AKAuthorizationScopeChoices *)self indexOfChosenEmail] == 0x7FFFFFFFFFFFFFFFLL {
         || (unint64_t v8 = [(AKAuthorizationScopeChoices *)self indexOfChosenEmail],
  }
             v8 >= [(AKAuthorizationScopeChoices *)self emailCount]))
  {
    id v7 = &stru_1F1EE8138;
  }
  else
  {
    id v7 = [(AKAuthorizationScopeChoices *)self emailAtIndex:[(AKAuthorizationScopeChoices *)self indexOfChosenEmail]];
  }

  return (NSString *)v7;
}

- (NSString)forwardingEmail
{
  return (NSString *)[(AKUserInformation *)self->_userInformation forwardingEmail];
}

- (AKAuthorizationUserResponse)userResponse
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4EFC0]);
  int v4 = [(AKAuthorizationScopeChoices *)self loginChoice];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [v3 setUserSelection:0];
  }
  else
  {
    uint64_t v6 = [(AKAuthorizationScopeChoices *)self _userSelection];
    [v3 setUserSelection:v6];
  }
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AKAuthorizationScopeChoices indexOfChosenLogin](self, "indexOfChosenLogin"));
  [v3 setLoginChoiceIndex:v7];

  unint64_t v8 = [(AKAuthorizationScopeChoices *)self loginChoice];
  [v3 setLoginChoice:v8];

  id v9 = [(AKAuthorizationScopeChoices *)self selectedRequest];
  [v3 setSelectedRequest:v9];

  return (AKAuthorizationUserResponse *)v3;
}

- (id)_userSelection
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4EFB0]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F4F0D8]);
  v5 = [(AKAuthorizationScopeChoices *)self selectedRequest];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(AKAuthorizationScopeChoices *)self selectedRequest];
    unint64_t v8 = [v7 requestedScopes];
    int v9 = [v8 containsObject:*MEMORY[0x1E4F4EE18]];

    if (v9)
    {
      v10 = _AKLogSiwa();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C38C1000, v10, OS_LOG_TYPE_DEFAULT, "Selected request contains email scope.", buf, 2u);
      }

      if ([(AKAuthorizationScopeChoices *)self wantsPrivateEmail]) {
        [(AKAuthorizationScopeChoices *)self forwardingEmail];
      }
      else {
      uint64_t v11 = [(AKAuthorizationScopeChoices *)self chosenEmail];
      }
      [v4 setSelectedEmail:v11];

      objc_msgSend(v3, "setMakePrivateEmail:", -[AKAuthorizationScopeChoices wantsPrivateEmail](self, "wantsPrivateEmail"));
    }
    v12 = [v7 requestedScopes];
    int v13 = [v12 containsObject:*MEMORY[0x1E4F4EE20]];

    if (v13)
    {
      v14 = _AKLogSiwa();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1C38C1000, v14, OS_LOG_TYPE_DEFAULT, "Selected request contains name scope.", v20, 2u);
      }

      objc_super v15 = [(AKAuthorizationScopeChoices *)self userInformation];
      v16 = [v15 givenName];
      [v4 setGivenName:v16];

      v17 = [(AKAuthorizationScopeChoices *)self userInformation];
      v18 = [v17 familyName];
      [v4 setFamilyName:v18];
    }
    [v3 setUserInformation:v4];
  }

  return v3;
}

- (id)emailAtIndex:(unint64_t)a3
{
  if ([(AKAuthorizationScopeChoices *)self emailCount] <= a3)
  {
    id v7 = _AKLogSiwa();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(AKAuthorizationScopeChoices *)a3 emailAtIndex:v7];
    }

    uint64_t v6 = &stru_1F1EE8138;
  }
  else
  {
    v5 = [(AKUserInformation *)self->_userInformation reachableEmails];
    uint64_t v6 = [v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

- (unint64_t)personNameComponentsOrder
{
  v2 = (void *)MEMORY[0x1E4F28F38];
  id v3 = [(AKAuthorizationScopeChoices *)self _personNameComponents];
  uint64_t v4 = [v2 _nameOrderWithOverridesForComponents:v3 options:0];

  return v4 == 2;
}

- (NSString)localizedName
{
  v2 = (void *)MEMORY[0x1E4F28F38];
  id v3 = [(AKAuthorizationScopeChoices *)self _personNameComponents];
  uint64_t v4 = [v2 localizedStringFromPersonNameComponents:v3 style:2 options:0];

  return (NSString *)v4;
}

- (NSString)localizedChosenEmail
{
  if ([(AKAuthorizationScopeChoices *)self wantsPrivateEmail])
  {
    id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = [v3 localizedStringForKey:@"AUTHORIZE_PRIVATE_EMAIL_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
  }
  else
  {
    uint64_t v4 = [(AKAuthorizationScopeChoices *)self chosenEmail];
  }

  return (NSString *)v4;
}

- (id)_personNameComponents
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  uint64_t v4 = [(AKUserInformation *)self->_userInformation givenName];
  [v3 setGivenName:v4];

  v5 = [(AKUserInformation *)self->_userInformation familyName];
  [v3 setFamilyName:v5];

  return v3;
}

+ (NSString)localizedGivenNameLabel
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"AUTHORIZE_GIVEN_NAME" value:&stru_1F1EE8138 table:@"Localizable"];

  return (NSString *)v3;
}

+ (NSString)localizedFamilyNameLabel
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"AUTHORIZE_FAMILY_NAME" value:&stru_1F1EE8138 table:@"Localizable"];

  return (NSString *)v3;
}

+ (id)obfuscatedEmail:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 rangeOfString:@"@"];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v5 == 0)
  {
    id v7 = v4;
  }
  else
  {
    if (v5 <= 2) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v5 - 2;
    }
    unint64_t v9 = v5 - v8;
    v10 = [a1 _dotsWithLength:v8];
    objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", v9, v8, v10);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)_dotsWithLength:(unint64_t)a3
{
  return (id)[&stru_1F1EE8138 stringByPaddingToLength:a3 withString:@"•" startingAtIndex:0];
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(AKAuthorizationScopeChoices *)self scopes];
  unint64_t v5 = [(AKAuthorizationScopeChoices *)self userInformation];
  unint64_t v6 = [(AKAuthorizationScopeChoices *)self indexOfChosenEmail];
  unint64_t v7 = [(AKAuthorizationScopeChoices *)self indexOfChosenLogin];
  if ([(AKAuthorizationScopeChoices *)self wantsPrivateEmail]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  unint64_t v9 = [(AKAuthorizationScopeChoices *)self emailCount];
  v10 = [(AKAuthorizationScopeChoices *)self chosenEmail];
  uint64_t v11 = [(AKAuthorizationScopeChoices *)self forwardingEmail];
  v12 = [(AKAuthorizationScopeChoices *)self userResponse];
  int v13 = [v3 stringWithFormat:@"Scope Choices:\n    scopes: %@\n    userinformation: %@\n    indexOfChosenEmail: %lu\n    indexOfChosenLogin: %lu\n    wantsPrivateEmail: %@\n    emailCount: %lu\n    chosenEmail: %@\n    forwardingEmail: %@\n    userResponse: %@", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (NSArray)scopes
{
  return self->_scopes;
}

- (void)setScopes:(id)a3
{
}

- (AKUserInformation)userInformation
{
  return self->_userInformation;
}

- (void)setUserInformation:(id)a3
{
}

- (AKCredentialRequestProtocol)selectedRequest
{
  return self->_selectedRequest;
}

- (void)setSelectedRequest:(id)a3
{
}

- (unint64_t)indexOfChosenEmail
{
  return self->_indexOfChosenEmail;
}

- (void)setIndexOfChosenEmail:(unint64_t)a3
{
  self->_indexOfChosenEmail = a3;
}

- (unint64_t)indexOfChosenLogin
{
  return self->_indexOfChosenLogin;
}

- (void)setIndexOfChosenLogin:(unint64_t)a3
{
  self->_indexOfChosenLogin = a3;
}

- (AKAuthorizationLoginChoice)loginChoice
{
  return self->_loginChoice;
}

- (void)setLoginChoice:(id)a3
{
}

- (BOOL)wantsPrivateEmail
{
  return self->_wantsPrivateEmail;
}

- (void)setWantsPrivateEmail:(BOOL)a3
{
  self->_wantsPrivateEmail = a3;
}

- (unint64_t)emailCount
{
  return self->_emailCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginChoice, 0);
  objc_storeStrong((id *)&self->_selectedRequest, 0);
  objc_storeStrong((id *)&self->_userInformation, 0);

  objc_storeStrong((id *)&self->_scopes, 0);
}

- (void)emailAtIndex:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [NSNumber numberWithUnsignedInteger:a1];
  unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "emailCount"));
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1C38C1000, a3, OS_LOG_TYPE_ERROR, "index %@ beyond email address count %@", (uint8_t *)&v7, 0x16u);
}

@end