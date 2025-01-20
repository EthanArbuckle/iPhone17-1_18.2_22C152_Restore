@interface AKSignInWithAppleRequestContext
+ (BOOL)supportsSecureCoding;
- (AKSignInWithAppleAccount)signInWithAppleAccount;
- (AKSignInWithAppleRequestContext)initWithAltDSID:(id)a3;
- (AKSignInWithAppleRequestContext)initWithCoder:(id)a3;
- (BOOL)_isMoveAccountRequest;
- (BOOL)_simulateAccountSharingResponse;
- (NSSet)_groups;
- (NSString)altDSID;
- (NSString)currentGroupID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentGroupID:(id)a3;
- (void)setSignInWithAppleAccount:(id)a3;
- (void)set_groups:(id)a3;
- (void)set_isMoveAccountRequest:(BOOL)a3;
- (void)set_simulateAccountSharingResponse:(BOOL)a3;
@end

@implementation AKSignInWithAppleRequestContext

- (AKSignInWithAppleRequestContext)initWithAltDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKSignInWithAppleRequestContext;
  v6 = [(AKSignInWithAppleRequestContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_altDSID, a3);
  }

  return v7;
}

- (AKSignInWithAppleRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AKSignInWithAppleRequestContext;
  id v5 = [(AKSignInWithAppleRequestContext *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signInWithAppleAccount"];
    signInWithAppleAccount = v5->_signInWithAppleAccount;
    v5->_signInWithAppleAccount = (AKSignInWithAppleAccount *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentGroupID"];
    currentGroupID = v5->_currentGroupID;
    v5->_currentGroupID = (NSString *)v10;

    v5->__simulateAccountSharingResponse = [v4 decodeBoolForKey:@"_simulateAccountSharingResponse"];
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"_groups"];
    groups = v5->__groups;
    v5->__groups = (NSSet *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  altDSID = self->_altDSID;
  id v5 = a3;
  [v5 encodeObject:altDSID forKey:@"altDSID"];
  [v5 encodeObject:self->_signInWithAppleAccount forKey:@"signInWithAppleAccount"];
  [v5 encodeObject:self->_currentGroupID forKey:@"currentGroupID"];
  [v5 encodeBool:self->__simulateAccountSharingResponse forKey:@"_simulateAccountSharingResponse"];
  [v5 encodeObject:self->__groups forKey:@"_groups"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_altDSID copy];
  uint64_t v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(AKSignInWithAppleAccount *)self->_signInWithAppleAccount copy];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_currentGroupID copy];
  uint64_t v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  *(unsigned char *)(v4 + 8) = self->__simulateAccountSharingResponse;
  uint64_t v11 = [(NSSet *)self->__groups copy];
  v12 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v11;

  return (id)v4;
}

- (BOOL)_isMoveAccountRequest
{
  return self->_currentGroupID != 0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p {\n\taltDSID: %@, \n\tsignInWithAppleAccount: %@, \n\tcurrentGroupID: %@, \n}>", v5, self, self->_altDSID, self->_signInWithAppleAccount, self->_currentGroupID];

  return v6;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (AKSignInWithAppleAccount)signInWithAppleAccount
{
  return self->_signInWithAppleAccount;
}

- (void)setSignInWithAppleAccount:(id)a3
{
}

- (NSString)currentGroupID
{
  return self->_currentGroupID;
}

- (void)setCurrentGroupID:(id)a3
{
}

- (BOOL)_simulateAccountSharingResponse
{
  return self->__simulateAccountSharingResponse;
}

- (void)set_simulateAccountSharingResponse:(BOOL)a3
{
  self->__simulateAccountSharingResponse = a3;
}

- (void)set_isMoveAccountRequest:(BOOL)a3
{
  self->__isMoveAccountRequest = a3;
}

- (NSSet)_groups
{
  return self->__groups;
}

- (void)set_groups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__groups, 0);
  objc_storeStrong((id *)&self->_currentGroupID, 0);
  objc_storeStrong((id *)&self->_signInWithAppleAccount, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end