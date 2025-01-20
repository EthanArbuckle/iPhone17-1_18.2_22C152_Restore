@interface FPTestingCreation
+ (BOOL)supportsSecureCoding;
- (FPTestingCreation)initWithCoder:(id)a3;
- (FPTestingCreation)initWithOperationIdentifier:(id)a3 sourceItem:(id)a4 domainVersion:(id)a5 snapshotVersion:(int64_t)a6;
- (NSFileProviderDomainVersion)domainVersion;
- (NSFileProviderItem)sourceItem;
- (int64_t)snapshotVersion;
- (int64_t)type;
- (unint64_t)targetSide;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPTestingCreation

- (FPTestingCreation)initWithOperationIdentifier:(id)a3 sourceItem:(id)a4 domainVersion:(id)a5 snapshotVersion:(int64_t)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)FPTestingCreation;
  v13 = [(FPTestingOperation *)&v16 initWithOperationIdentifier:a3];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sourceItem, a4);
    v14->_snapshotVersion = a6;
    objc_storeStrong((id *)&v14->_domainVersion, a5);
  }

  return v14;
}

- (int64_t)type
{
  return 2;
}

- (unint64_t)targetSide
{
  v2 = [(NSFileProviderItem *)self->_sourceItem itemIdentifier];
  unsigned int v3 = [v2 hasPrefix:@"__fp/fs/"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FPTestingCreation;
  id v4 = a3;
  [(FPTestingOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceItem, @"_sourceItem", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_snapshotVersion forKey:@"_snapshotVersion"];
  [v4 encodeObject:self->_domainVersion forKey:@"_domainVersion"];
}

- (FPTestingCreation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPTestingCreation;
  objc_super v5 = [(FPTestingOperation *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceItem"];
    sourceItem = v5->_sourceItem;
    v5->_sourceItem = (NSFileProviderItem *)v6;

    v5->_snapshotVersion = [v4 decodeIntegerForKey:@"_snapshotVersion"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_domainVersion"];
    domainVersion = v5->_domainVersion;
    v5->_domainVersion = (NSFileProviderDomainVersion *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderItem)sourceItem
{
  return self->_sourceItem;
}

- (NSFileProviderDomainVersion)domainVersion
{
  return self->_domainVersion;
}

- (int64_t)snapshotVersion
{
  return self->_snapshotVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainVersion, 0);

  objc_storeStrong((id *)&self->_sourceItem, 0);
}

@end