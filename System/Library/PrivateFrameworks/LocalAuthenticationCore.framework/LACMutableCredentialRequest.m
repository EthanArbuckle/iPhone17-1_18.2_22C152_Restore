@interface LACMutableCredentialRequest
- (BOOL)isEqual:(id)a3;
- (LACMutableCredentialRequest)init;
- (NSData)externalizedContext;
- (NSString)description;
- (NSUUID)contextID;
- (int64_t)credential;
- (unsigned)identifier;
- (unsigned)userID;
- (void)setContextID:(id)a3;
- (void)setCredential:(int64_t)a3;
- (void)setExternalizedContext:(id)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setUserID:(unsigned int)a3;
@end

@implementation LACMutableCredentialRequest

- (LACMutableCredentialRequest)init
{
  v4.receiver = self;
  v4.super_class = (Class)LACMutableCredentialRequest;
  result = [(LACMutableCredentialRequest *)&v4 init];
  if (result)
  {
    unsigned int v3 = identifierCounter_0++;
    result->_identifier = v3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 conformsToProtocol:&unk_27043F410])
  {
    char v15 = 0;
    goto LABEL_10;
  }
  id v5 = v4;
  unsigned int v6 = [(LACMutableCredentialRequest *)self identifier];
  if (v6 != [v5 identifier]) {
    goto LABEL_7;
  }
  int64_t v7 = [(LACMutableCredentialRequest *)self credential];
  if (v7 != [v5 credential]) {
    goto LABEL_7;
  }
  unsigned int v8 = [(LACMutableCredentialRequest *)self userID];
  if (v8 != [v5 userID]) {
    goto LABEL_7;
  }
  v9 = [(LACMutableCredentialRequest *)self externalizedContext];
  uint64_t v10 = [v5 externalizedContext];
  if (v9 == (void *)v10)
  {

    goto LABEL_12;
  }
  v11 = (void *)v10;
  v12 = [(LACMutableCredentialRequest *)self externalizedContext];
  v13 = [v5 externalizedContext];
  int v14 = [v12 isEqualToData:v13];

  if (v14)
  {
LABEL_12:
    v17 = [(LACMutableCredentialRequest *)self contextID];
    uint64_t v18 = [v5 contextID];
    if (v17 == (void *)v18)
    {
      char v15 = 1;
      v19 = v17;
    }
    else
    {
      v19 = (void *)v18;
      v20 = [(LACMutableCredentialRequest *)self contextID];
      v21 = [v5 contextID];
      char v15 = [v20 isEqual:v21];
    }
    goto LABEL_8;
  }
LABEL_7:
  char v15 = 0;
LABEL_8:

LABEL_10:
  return v15;
}

- (NSString)description
{
  v15[4] = *MEMORY[0x263EF8340];
  unsigned int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v14[0] = @"identifier";
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[LACMutableCredentialRequest identifier](self, "identifier"));
  v15[0] = v5;
  v14[1] = @"credential";
  unsigned int v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[LACMutableCredentialRequest credential](self, "credential"));
  v15[1] = v6;
  v14[2] = @"userID";
  int64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[LACMutableCredentialRequest userID](self, "userID"));
  v15[2] = v7;
  v14[3] = @"contextID";
  unsigned int v8 = NSString;
  v9 = [(LACMutableCredentialRequest *)self contextID];
  uint64_t v10 = [v8 stringWithFormat:@"%@", v9];
  v15[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
  v12 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v11];

  return (NSString *)v12;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_identifier = a3;
}

- (int64_t)credential
{
  return self->_credential;
}

- (void)setCredential:(int64_t)a3
{
  self->_credential = a3;
}

- (NSData)externalizedContext
{
  return self->_externalizedContext;
}

- (void)setExternalizedContext:(id)a3
{
}

- (unsigned)userID
{
  return self->_userID;
}

- (void)setUserID:(unsigned int)a3
{
  self->_userID = a3;
}

- (NSUUID)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_externalizedContext, 0);
}

@end