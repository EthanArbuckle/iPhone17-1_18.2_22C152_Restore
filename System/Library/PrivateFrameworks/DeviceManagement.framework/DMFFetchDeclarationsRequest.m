@interface DMFFetchDeclarationsRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
+ (id)permittedPlatforms;
- (BOOL)includeInternalState;
- (BOOL)includePayloadContents;
- (DMFFetchDeclarationsRequest)initWithCoder:(id)a3;
- (NSArray)payloadIdentifiers;
- (NSString)organizationIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setIncludeInternalState:(BOOL)a3;
- (void)setIncludePayloadContents:(BOOL)a3;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setPayloadIdentifiers:(id)a3;
@end

@implementation DMFFetchDeclarationsRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1F18AB748;
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

- (DMFFetchDeclarationsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DMFFetchDeclarationsRequest;
  v5 = [(CATTaskRequest *)&v17 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"organizationIdentifier"];
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"payloadIdentifiers"];
    payloadIdentifiers = v5->_payloadIdentifiers;
    v5->_payloadIdentifiers = (NSArray *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"includePayloadContents"];
    v5->_includePayloadContents = [v14 BOOLValue];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"includeInternalState"];
    v5->_includeInternalState = [v15 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchDeclarationsRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v9 encodeWithCoder:v4];
  v5 = [(DMFFetchDeclarationsRequest *)self organizationIdentifier];
  [v4 encodeObject:v5 forKey:@"organizationIdentifier"];

  v6 = [(DMFFetchDeclarationsRequest *)self payloadIdentifiers];
  [v4 encodeObject:v6 forKey:@"payloadIdentifiers"];

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFFetchDeclarationsRequest includePayloadContents](self, "includePayloadContents"));
  [v4 encodeObject:v7 forKey:@"includePayloadContents"];

  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFFetchDeclarationsRequest includeInternalState](self, "includeInternalState"));
  [v4 encodeObject:v8 forKey:@"includeInternalState"];
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSArray)payloadIdentifiers
{
  return self->_payloadIdentifiers;
}

- (void)setPayloadIdentifiers:(id)a3
{
}

- (BOOL)includeInternalState
{
  return self->_includeInternalState;
}

- (void)setIncludeInternalState:(BOOL)a3
{
  self->_includeInternalState = a3;
}

- (BOOL)includePayloadContents
{
  return self->_includePayloadContents;
}

- (void)setIncludePayloadContents:(BOOL)a3
{
  self->_includePayloadContents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadIdentifiers, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end