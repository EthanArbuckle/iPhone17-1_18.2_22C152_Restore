@interface EMSecurityInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEncryptedDescendantPart;
- (BOOL)isEncrypted;
- (BOOL)isSigned;
- (EMSecurityInformation)initWithCoder:(id)a3;
- (EMSecurityInformation)initWithSigners:(id)a3 isEncrypted:(BOOL)a4 hasEncryptedDescendantPart:(BOOL)a5 smimeError:(id)a6;
- (NSArray)signers;
- (NSError)smimeError;
- (NSString)ef_publicDescription;
- (void)encodeWithCoder:(id)a3;
- (void)reevaluateTrustWithNetworkAccessAllowed;
@end

@implementation EMSecurityInformation

- (EMSecurityInformation)initWithSigners:(id)a3 isEncrypted:(BOOL)a4 hasEncryptedDescendantPart:(BOOL)a5 smimeError:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)EMSecurityInformation;
  v13 = [(EMSecurityInformation *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_signers, a3);
    v14->_isEncrypted = a4;
    v14->_hasEncryptedDescendantPart = a5;
    objc_storeStrong((id *)&v14->_smimeError, a6);
  }

  return v14;
}

- (BOOL)isSigned
{
  v2 = [(EMSecurityInformation *)self signers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)reevaluateTrustWithNetworkAccessAllowed
{
  v2 = [(EMSecurityInformation *)self signers];
  id v3 = [v2 firstObject];

  [v3 reevaluateTrustWithNetworkAccessAllowed];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMSecurityInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"EFPropertyKey_signers"];

  uint64_t v9 = [v4 decodeBoolForKey:@"EFPropertyKey_isEncrypted"];
  uint64_t v10 = [v4 decodeBoolForKey:@"EFPropertyKey_hasEncryptedDescendantPart"];
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_smimeError"];
  id v12 = [(EMSecurityInformation *)self initWithSigners:v8 isEncrypted:v9 hasEncryptedDescendantPart:v10 smimeError:v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(EMSecurityInformation *)self signers];
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_signers"];

  objc_msgSend(v6, "encodeBool:forKey:", -[EMSecurityInformation isEncrypted](self, "isEncrypted"), @"EFPropertyKey_isEncrypted");
  objc_msgSend(v6, "encodeBool:forKey:", -[EMSecurityInformation hasEncryptedDescendantPart](self, "hasEncryptedDescendantPart"), @"EFPropertyKey_hasEncryptedDescendantPart");
  v5 = [(EMSecurityInformation *)self smimeError];
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_smimeError"];
}

- (NSString)ef_publicDescription
{
  id v3 = NSString;
  [(EMSecurityInformation *)self isEncrypted];
  id v4 = NSStringFromBOOL();
  v5 = [(EMSecurityInformation *)self signers];
  uint64_t v6 = [v5 count];
  v7 = [(EMSecurityInformation *)self smimeError];
  v8 = NSStringFromBOOL();
  uint64_t v9 = [v3 stringWithFormat:@"Encrypted: %@, Signers %lu, hasSMIMEError: %@", v4, v6, v8];

  return (NSString *)v9;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (NSArray)signers
{
  return self->_signers;
}

- (BOOL)hasEncryptedDescendantPart
{
  return self->_hasEncryptedDescendantPart;
}

- (NSError)smimeError
{
  return self->_smimeError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smimeError, 0);
  objc_storeStrong((id *)&self->_signers, 0);
}

@end