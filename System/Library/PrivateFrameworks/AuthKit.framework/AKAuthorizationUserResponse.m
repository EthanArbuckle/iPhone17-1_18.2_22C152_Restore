@interface AKAuthorizationUserResponse
+ (BOOL)supportsSecureCoding;
- (AKAuthorizationLoginChoice)loginChoice;
- (AKAuthorizationScopesUserSelection)userSelection;
- (AKAuthorizationUserResponse)initWithCoder:(id)a3;
- (AKCredentialRequestProtocol)selectedRequest;
- (BOOL)hasSelectedSharedAccountForLogin;
- (BOOL)requestParentalPermission;
- (NSNumber)loginChoiceIndex;
- (NSString)rawAccountPassword;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLoginChoice:(id)a3;
- (void)setLoginChoiceIndex:(id)a3;
- (void)setRawAccountPassword:(id)a3;
- (void)setRequestParentalPermission:(BOOL)a3;
- (void)setSelectedRequest:(id)a3;
- (void)setUserSelection:(id)a3;
@end

@implementation AKAuthorizationUserResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationUserResponse)initWithCoder:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AKAuthorizationUserResponse;
  v5 = [(AKAuthorizationUserResponse *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userSelection"];
    userSelection = v5->_userSelection;
    v5->_userSelection = (AKAuthorizationScopesUserSelection *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_loginChoiceIndex"];
    loginChoiceIndex = v5->_loginChoiceIndex;
    v5->_loginChoiceIndex = (NSNumber *)v8;

    v10 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
    [v12 addObjectsFromArray:v13];

    uint64_t v14 = [v4 decodeObjectOfClasses:v12 forKey:@"_loginChoice"];
    loginChoice = v5->_loginChoice;
    v5->_loginChoice = (AKAuthorizationLoginChoice *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_selectedRequest"];
    selectedRequest = v5->_selectedRequest;
    v5->_selectedRequest = (AKCredentialRequestProtocol *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_rawAccountPassword"];
    rawAccountPassword = v5->_rawAccountPassword;
    v5->_rawAccountPassword = (NSString *)v18;

    v5->_requestParentalPermission = [v4 decodeBoolForKey:@"_requestParentalPermission"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  userSelection = self->_userSelection;
  id v5 = a3;
  [v5 encodeObject:userSelection forKey:@"_userSelection"];
  [v5 encodeObject:self->_loginChoiceIndex forKey:@"_loginChoiceIndex"];
  [v5 encodeObject:self->_loginChoice forKey:@"_loginChoice"];
  [v5 encodeObject:self->_selectedRequest forKey:@"_selectedRequest"];
  [v5 encodeObject:self->_rawAccountPassword forKey:@"_rawAccountPassword"];
  [v5 encodeBool:self->_requestParentalPermission forKey:@"_requestParentalPermission"];
}

- (BOOL)hasSelectedSharedAccountForLogin
{
  v2 = [(AKAuthorizationUserResponse *)self loginChoice];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  selectedRequest = self->_selectedRequest;
  userSelection = self->_userSelection;
  loginChoiceIndex = self->_loginChoiceIndex;
  rawAccountPassword = self->_rawAccountPassword;
  if (rawAccountPassword)
  {
    if ([(NSString *)rawAccountPassword length]) {
      v10 = @"(******)";
    }
    else {
      v10 = @"(empty)";
    }
  }
  else
  {
    v10 = @"(null)";
  }
  if (loginChoiceIndex) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if ([(AKAuthorizationUserResponse *)self requestParentalPermission]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  v13 = [v3 stringWithFormat:@"<%@: %p {\n\tselectedRequest: %@,\n\tuserSelection: %@,\n\tloginChoiceindex: %@,\n\trawPassword: %@,\n\trequestParentalPermission: %@,\n}>", v5, self, selectedRequest, userSelection, v11, v10, v12];

  return v13;
}

- (AKCredentialRequestProtocol)selectedRequest
{
  return self->_selectedRequest;
}

- (void)setSelectedRequest:(id)a3
{
}

- (AKAuthorizationScopesUserSelection)userSelection
{
  return self->_userSelection;
}

- (void)setUserSelection:(id)a3
{
}

- (NSNumber)loginChoiceIndex
{
  return self->_loginChoiceIndex;
}

- (void)setLoginChoiceIndex:(id)a3
{
}

- (AKAuthorizationLoginChoice)loginChoice
{
  return self->_loginChoice;
}

- (void)setLoginChoice:(id)a3
{
}

- (NSString)rawAccountPassword
{
  return self->_rawAccountPassword;
}

- (void)setRawAccountPassword:(id)a3
{
}

- (BOOL)requestParentalPermission
{
  return self->_requestParentalPermission;
}

- (void)setRequestParentalPermission:(BOOL)a3
{
  self->_requestParentalPermission = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAccountPassword, 0);
  objc_storeStrong((id *)&self->_loginChoice, 0);
  objc_storeStrong((id *)&self->_loginChoiceIndex, 0);
  objc_storeStrong((id *)&self->_userSelection, 0);

  objc_storeStrong((id *)&self->_selectedRequest, 0);
}

@end