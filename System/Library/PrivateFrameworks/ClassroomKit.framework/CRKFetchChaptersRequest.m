@interface CRKFetchChaptersRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (BOOL)isValidWithError:(id *)a3;
- (CRKFetchChaptersRequest)initWithCoder:(id)a3;
- (NSString)identifier;
- (NSString)identifierType;
- (NSString)path;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierType:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation CRKFetchChaptersRequest

- (BOOL)isValidWithError:(id *)a3
{
  v5 = [(CRKFetchChaptersRequest *)self path];
  uint64_t v6 = [v5 length];

  if (!v6)
  {
    if (!a3) {
      return 0;
    }
    v12 = &unk_26D81A078;
LABEL_11:
    CRKErrorWithCodeAndUserInfo(2, v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v13;
    return result;
  }
  v7 = [(CRKFetchChaptersRequest *)self identifierType];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    if (!a3) {
      return 0;
    }
    v12 = &unk_26D81A0A0;
    goto LABEL_11;
  }
  v9 = [(CRKFetchChaptersRequest *)self identifier];
  uint64_t v10 = [v9 length];

  if (v10) {
    return 1;
  }
  if (a3)
  {
    v12 = &unk_26D81A0C8;
    goto LABEL_11;
  }
  return 0;
}

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchChaptersRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRKFetchChaptersRequest;
  v5 = [(CATTaskRequest *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"path"];
    path = v5->_path;
    v5->_path = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"identifierType"];
    identifierType = v5->_identifierType;
    v5->_identifierType = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRKFetchChaptersRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v8 encodeWithCoder:v4];
  v5 = [(CRKFetchChaptersRequest *)self path];
  [v4 encodeObject:v5 forKey:@"path"];

  uint64_t v6 = [(CRKFetchChaptersRequest *)self identifierType];
  [v4 encodeObject:v6 forKey:@"identifierType"];

  uint64_t v7 = [(CRKFetchChaptersRequest *)self identifier];
  [v4 encodeObject:v7 forKey:@"identifier"];
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)identifierType
{
  return self->_identifierType;
}

- (void)setIdentifierType:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_identifierType, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end