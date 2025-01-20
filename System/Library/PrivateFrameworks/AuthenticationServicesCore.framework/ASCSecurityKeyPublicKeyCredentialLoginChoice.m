@interface ASCSecurityKeyPublicKeyCredentialLoginChoice
+ (BOOL)supportsSecureCoding;
- (ASCSecurityKeyPublicKeyCredentialLoginChoice)initWithCoder:(id)a3;
- (ASCSecurityKeyPublicKeyCredentialLoginChoice)initWithName:(id)a3 displayName:(id)a4 identifier:(id)a5 publicKeyCredentialOperationUUID:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSString)displayName;
- (NSString)name;
- (NSUUID)publicKeyCredentialOperationUUID;
- (WBSPublicKeyCredentialIdentifier)identifier;
- (id)_initWithKind:(int64_t)a3 name:(id)a4 displayName:(id)a5 identifier:(id)a6 publicKeyCredentialOperationUUID:(id)a7;
- (id)initAssertionPlaceholderChoice;
- (id)initRegistrationChoiceWithOptions:(id)a3;
- (int64_t)credentialKind;
- (unint64_t)loginChoiceKind;
- (void)encodeWithCoder:(id)a3;
- (void)setPublicKeyCredentialOperationUUID:(id)a3;
@end

@implementation ASCSecurityKeyPublicKeyCredentialLoginChoice

- (id)initRegistrationChoiceWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [v4 userName];
  v6 = [v4 userDisplayName];

  id v7 = [(ASCSecurityKeyPublicKeyCredentialLoginChoice *)self _initWithKind:0 name:v5 displayName:v6 identifier:0 publicKeyCredentialOperationUUID:0];
  return v7;
}

- (ASCSecurityKeyPublicKeyCredentialLoginChoice)initWithName:(id)a3 displayName:(id)a4 identifier:(id)a5 publicKeyCredentialOperationUUID:(id)a6
{
  return (ASCSecurityKeyPublicKeyCredentialLoginChoice *)[(ASCSecurityKeyPublicKeyCredentialLoginChoice *)self _initWithKind:1 name:a3 displayName:a4 identifier:a5 publicKeyCredentialOperationUUID:a6];
}

- (id)initAssertionPlaceholderChoice
{
  return [(ASCSecurityKeyPublicKeyCredentialLoginChoice *)self _initWithKind:2 name:0 displayName:0 identifier:0 publicKeyCredentialOperationUUID:0];
}

- (id)_initWithKind:(int64_t)a3 name:(id)a4 displayName:(id)a5 identifier:(id)a6 publicKeyCredentialOperationUUID:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)ASCSecurityKeyPublicKeyCredentialLoginChoice;
  v16 = [(ASCSecurityKeyPublicKeyCredentialLoginChoice *)&v26 init];
  v17 = v16;
  if (v16)
  {
    v16->_credentialKind = a3;
    uint64_t v18 = [v12 copy];
    name = v17->_name;
    v17->_name = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    identifier = v17->_identifier;
    v17->_identifier = (WBSPublicKeyCredentialIdentifier *)v22;

    objc_storeStrong((id *)&v17->_publicKeyCredentialOperationUUID, a7);
    v24 = v17;
  }

  return v17;
}

- (unint64_t)loginChoiceKind
{
  return 3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    v6 = v5;
    int64_t credentialKind = self->_credentialKind;
    if (credentialKind == v5[3])
    {
      if ((credentialKind | 2) == 2)
      {
        char v8 = 1;
LABEL_11:

        goto LABEL_12;
      }
      v9 = [v5 publicKeyCredentialOperationUUID];
      int v10 = WBSIsEqual();

      if (v10
        && [(NSString *)self->_name isEqualToString:v6[1]]
        && [(NSString *)self->_displayName isEqualToString:v6[2]])
      {
        v11 = [v6 identifier];
        char v8 = WBSIsEqual();

        goto LABEL_11;
      }
    }
    char v8 = 0;
    goto LABEL_11;
  }
  char v8 = 0;
LABEL_12:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v6 = a3;
  [v6 encodeObject:name forKey:@"name"];
  [v6 encodeObject:self->_displayName forKey:@"displayName"];
  [v6 encodeObject:self->_identifier forKey:@"identifier"];
  v5 = [NSNumber numberWithInteger:self->_credentialKind];
  [v6 encodeObject:v5 forKey:@"credentialKind"];

  [v6 encodeObject:self->_publicKeyCredentialOperationUUID forKey:@"publicKeyCredentialOperationUUID"];
}

- (ASCSecurityKeyPublicKeyCredentialLoginChoice)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  char v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialKind"];
  uint64_t v9 = [v8 integerValue];

  int v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyCredentialOperationUUID"];

  if (v9 == 2)
  {
    v11 = [(ASCSecurityKeyPublicKeyCredentialLoginChoice *)self initAssertionPlaceholderChoice];
  }
  else if (v9 == 1)
  {
    v11 = [(ASCSecurityKeyPublicKeyCredentialLoginChoice *)self initWithName:v5 displayName:v6 identifier:v7 publicKeyCredentialOperationUUID:v10];
  }
  else
  {
    if (v9)
    {
      id v12 = 0;
      goto LABEL_9;
    }
    v11 = [(ASCSecurityKeyPublicKeyCredentialLoginChoice *)self _initWithKind:0 name:v5 displayName:v6 identifier:0 publicKeyCredentialOperationUUID:0];
  }
  self = v11;
  id v12 = self;
LABEL_9:

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int64_t)credentialKind
{
  return self->_credentialKind;
}

- (WBSPublicKeyCredentialIdentifier)identifier
{
  return self->_identifier;
}

- (NSUUID)publicKeyCredentialOperationUUID
{
  return self->_publicKeyCredentialOperationUUID;
}

- (void)setPublicKeyCredentialOperationUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyCredentialOperationUUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end