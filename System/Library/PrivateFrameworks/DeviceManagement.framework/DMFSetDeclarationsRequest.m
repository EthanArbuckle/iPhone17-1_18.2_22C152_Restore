@interface DMFSetDeclarationsRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFSetDeclarationsRequest)initWithCoder:(id)a3;
- (NSArray)declarations;
- (NSString)organizationIdentifier;
- (NSString)syncToken;
- (void)encodeWithCoder:(id)a3;
- (void)setDeclarations:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setSyncToken:(id)a3;
@end

@implementation DMFSetDeclarationsRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABC58;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFSetDeclarationsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DMFSetDeclarationsRequest;
  v5 = [(CATTaskRequest *)&v27 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"organizationIdentifier"];
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"syncToken"];
    syncToken = v5->_syncToken;
    v5->_syncToken = (NSString *)v10;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v26, "setWithObjects:", v25, v24, v12, v13, v14, v15, v16, v17, v18, v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"declarations"];
    declarations = v5->_declarations;
    v5->_declarations = (NSArray *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DMFSetDeclarationsRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v8 encodeWithCoder:v4];
  v5 = [(DMFSetDeclarationsRequest *)self organizationIdentifier];
  [v4 encodeObject:v5 forKey:@"organizationIdentifier"];

  v6 = [(DMFSetDeclarationsRequest *)self syncToken];
  [v4 encodeObject:v6 forKey:@"syncToken"];

  uint64_t v7 = [(DMFSetDeclarationsRequest *)self declarations];
  [v4 encodeObject:v7 forKey:@"declarations"];
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSString)syncToken
{
  return self->_syncToken;
}

- (void)setSyncToken:(id)a3
{
}

- (NSArray)declarations
{
  return self->_declarations;
}

- (void)setDeclarations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarations, 0);
  objc_storeStrong((id *)&self->_syncToken, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end