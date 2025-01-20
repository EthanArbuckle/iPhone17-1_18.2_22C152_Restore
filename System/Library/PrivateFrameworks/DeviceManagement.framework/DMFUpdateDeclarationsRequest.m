@interface DMFUpdateDeclarationsRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFUpdateDeclarationsRequest)initWithCoder:(id)a3;
- (NSArray)removeDeclarations;
- (NSArray)upsertDeclarations;
- (NSString)organizationIdentifier;
- (NSString)syncToken;
- (void)encodeWithCoder:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setRemoveDeclarations:(id)a3;
- (void)setSyncToken:(id)a3;
- (void)setUpsertDeclarations:(id)a3;
@end

@implementation DMFUpdateDeclarationsRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABD90;
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

- (DMFUpdateDeclarationsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)DMFUpdateDeclarationsRequest;
  v5 = [(CATTaskRequest *)&v41 initWithCoder:v4];
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

    v39 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v37 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v39, "setWithObjects:", v37, v35, v12, v13, v14, v15, v16, v17, v18, v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"upsertDeclarations"];
    upsertDeclarations = v5->_upsertDeclarations;
    v5->_upsertDeclarations = (NSArray *)v21;

    v40 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v38 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    v31 = objc_msgSend(v40, "setWithObjects:", v38, v36, v23, v24, v25, v26, v27, v28, v29, v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"removeDeclarations"];
    removeDeclarations = v5->_removeDeclarations;
    v5->_removeDeclarations = (NSArray *)v32;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DMFUpdateDeclarationsRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v9 encodeWithCoder:v4];
  v5 = [(DMFUpdateDeclarationsRequest *)self organizationIdentifier];
  [v4 encodeObject:v5 forKey:@"organizationIdentifier"];

  v6 = [(DMFUpdateDeclarationsRequest *)self syncToken];
  [v4 encodeObject:v6 forKey:@"syncToken"];

  uint64_t v7 = [(DMFUpdateDeclarationsRequest *)self upsertDeclarations];
  [v4 encodeObject:v7 forKey:@"upsertDeclarations"];

  v8 = [(DMFUpdateDeclarationsRequest *)self removeDeclarations];
  [v4 encodeObject:v8 forKey:@"removeDeclarations"];
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

- (NSArray)upsertDeclarations
{
  return self->_upsertDeclarations;
}

- (void)setUpsertDeclarations:(id)a3
{
}

- (NSArray)removeDeclarations
{
  return self->_removeDeclarations;
}

- (void)setRemoveDeclarations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeDeclarations, 0);
  objc_storeStrong((id *)&self->_upsertDeclarations, 0);
  objc_storeStrong((id *)&self->_syncToken, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end