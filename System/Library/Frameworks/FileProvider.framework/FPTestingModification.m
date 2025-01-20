@interface FPTestingModification
+ (BOOL)supportsSecureCoding;
- (FPTestingModification)initWithCoder:(id)a3;
- (FPTestingModification)initWithOperationIdentifier:(id)a3 sourceItem:(id)a4 targetItemIdentifier:(id)a5 targetItemBaseVersion:(id)a6 changedFields:(unint64_t)a7 domainVersion:(id)a8 rawFields:(int64_t)a9 snapshotVersion:(int64_t)a10;
- (NSFileProviderDomainVersion)domainVersion;
- (NSFileProviderItem)sourceItem;
- (NSFileProviderItemVersion)targetItemBaseVersion;
- (NSString)targetItemIdentifier;
- (int64_t)rawFields;
- (int64_t)snapshotVersion;
- (int64_t)type;
- (unint64_t)changedFields;
- (unint64_t)targetSide;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPTestingModification

- (FPTestingModification)initWithOperationIdentifier:(id)a3 sourceItem:(id)a4 targetItemIdentifier:(id)a5 targetItemBaseVersion:(id)a6 changedFields:(unint64_t)a7 domainVersion:(id)a8 rawFields:(int64_t)a9 snapshotVersion:(int64_t)a10
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v23 = a8;
  v24.receiver = self;
  v24.super_class = (Class)FPTestingModification;
  v20 = [(FPTestingOperation *)&v24 initWithOperationIdentifier:a3];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_sourceItem, a4);
    objc_storeStrong((id *)&v21->_targetItemIdentifier, a5);
    objc_storeStrong((id *)&v21->_targetItemBaseVersion, a6);
    v21->_changedFields = a7;
    v21->_rawFields = a9;
    v21->_snapshotVersion = a10;
    objc_storeStrong((id *)&v21->_domainVersion, a8);
  }

  return v21;
}

- (int64_t)type
{
  return 3;
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
  v5.super_class = (Class)FPTestingModification;
  id v4 = a3;
  [(FPTestingOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceItem, @"_sourceItem", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_targetItemIdentifier forKey:@"_targetItemIdentifier"];
  [v4 encodeObject:self->_targetItemBaseVersion forKey:@"_targetItemBaseVersion"];
  [v4 encodeInteger:self->_changedFields forKey:@"_changedFields"];
  [v4 encodeInteger:self->_rawFields forKey:@"_rawFields"];
  [v4 encodeInteger:self->_snapshotVersion forKey:@"_snapshotVersion"];
  [v4 encodeObject:self->_domainVersion forKey:@"_domainVersion"];
}

- (FPTestingModification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPTestingModification;
  objc_super v5 = [(FPTestingOperation *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceItem"];
    sourceItem = v5->_sourceItem;
    v5->_sourceItem = (NSFileProviderItem *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_targetItemIdentifier"];
    targetItemIdentifier = v5->_targetItemIdentifier;
    v5->_targetItemIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_targetItemBaseVersion"];
    targetItemBaseVersion = v5->_targetItemBaseVersion;
    v5->_targetItemBaseVersion = (NSFileProviderItemVersion *)v10;

    v5->_changedFields = [v4 decodeIntegerForKey:@"_changedFields"];
    v5->_rawFields = [v4 decodeIntegerForKey:@"_rawFields"];
    v5->_snapshotVersion = [v4 decodeIntegerForKey:@"_snapshotVersion"];
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

- (NSFileProviderItem)sourceItem
{
  return self->_sourceItem;
}

- (NSString)targetItemIdentifier
{
  return self->_targetItemIdentifier;
}

- (NSFileProviderItemVersion)targetItemBaseVersion
{
  return self->_targetItemBaseVersion;
}

- (unint64_t)changedFields
{
  return self->_changedFields;
}

- (NSFileProviderDomainVersion)domainVersion
{
  return self->_domainVersion;
}

- (int64_t)rawFields
{
  return self->_rawFields;
}

- (int64_t)snapshotVersion
{
  return self->_snapshotVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainVersion, 0);
  objc_storeStrong((id *)&self->_targetItemBaseVersion, 0);
  objc_storeStrong((id *)&self->_targetItemIdentifier, 0);

  objc_storeStrong((id *)&self->_sourceItem, 0);
}

@end