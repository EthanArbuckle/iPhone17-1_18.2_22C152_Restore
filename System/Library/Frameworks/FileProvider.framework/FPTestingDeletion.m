@interface FPTestingDeletion
+ (BOOL)supportsSecureCoding;
- (FPTestingDeletion)initWithCoder:(id)a3;
- (FPTestingDeletion)initWithOperationIdentifier:(id)a3 sourceItemIdentifier:(id)a4 targetItemIdentifier:(id)a5 targetItemBaseVersion:(id)a6 domainVersion:(id)a7;
- (NSFileProviderDomainVersion)domainVersion;
- (NSFileProviderItemVersion)targetItemBaseVersion;
- (NSString)sourceItemIdentifier;
- (NSString)targetItemIdentifier;
- (int64_t)type;
- (unint64_t)targetSide;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPTestingDeletion

- (FPTestingDeletion)initWithOperationIdentifier:(id)a3 sourceItemIdentifier:(id)a4 targetItemIdentifier:(id)a5 targetItemBaseVersion:(id)a6 domainVersion:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)FPTestingDeletion;
  v17 = [(FPTestingOperation *)&v20 initWithOperationIdentifier:a3];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sourceItemIdentifier, a4);
    objc_storeStrong((id *)&v18->_targetItemIdentifier, a5);
    objc_storeStrong((id *)&v18->_targetItemBaseVersion, a6);
    objc_storeStrong((id *)&v18->_domainVersion, a7);
  }

  return v18;
}

- (int64_t)type
{
  return 4;
}

- (unint64_t)targetSide
{
  return [(NSString *)self->_sourceItemIdentifier hasPrefix:@"__fp/fs/"];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FPTestingDeletion;
  id v4 = a3;
  [(FPTestingOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceItemIdentifier, @"_sourceItemIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_targetItemIdentifier forKey:@"_targetItemIdentifier"];
  [v4 encodeObject:self->_targetItemBaseVersion forKey:@"_targetItemBaseVersion"];
  [v4 encodeObject:self->_domainVersion forKey:@"_domainVersion"];
}

- (FPTestingDeletion)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPTestingDeletion;
  objc_super v5 = [(FPTestingOperation *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceItemIdentifier"];
    sourceItemIdentifier = v5->_sourceItemIdentifier;
    v5->_sourceItemIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_targetItemIdentifier"];
    targetItemIdentifier = v5->_targetItemIdentifier;
    v5->_targetItemIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_targetItemBaseVersion"];
    targetItemBaseVersion = v5->_targetItemBaseVersion;
    v5->_targetItemBaseVersion = (NSFileProviderItemVersion *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_domainVersion"];
    domainVersion = v5->_domainVersion;
    v5->_domainVersion = (NSFileProviderDomainVersion *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)sourceItemIdentifier
{
  return self->_sourceItemIdentifier;
}

- (NSString)targetItemIdentifier
{
  return self->_targetItemIdentifier;
}

- (NSFileProviderItemVersion)targetItemBaseVersion
{
  return self->_targetItemBaseVersion;
}

- (NSFileProviderDomainVersion)domainVersion
{
  return self->_domainVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainVersion, 0);
  objc_storeStrong((id *)&self->_targetItemBaseVersion, 0);
  objc_storeStrong((id *)&self->_targetItemIdentifier, 0);

  objc_storeStrong((id *)&self->_sourceItemIdentifier, 0);
}

@end