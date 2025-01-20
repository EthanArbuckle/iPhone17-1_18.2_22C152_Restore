@interface HDCloudSyncOwnerIdentifier
+ (id)unitTest_ownerIdentifierWithDatabaseIdentifer:(id)a3 deviceIdentifier:(id)a4 ownerDifferentiator:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)cloudKitIdentifier;
- (NSString)string;
- (id)_initWithDatabaseIdentifer:(id)a3 deviceIdentifier:(id)a4 ownerDifferentiator:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation HDCloudSyncOwnerIdentifier

+ (id)unitTest_ownerIdentifierWithDatabaseIdentifer:(id)a3 deviceIdentifier:(id)a4 ownerDifferentiator:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[HDCloudSyncOwnerIdentifier alloc] _initWithDatabaseIdentifer:v9 deviceIdentifier:v8 ownerDifferentiator:v7];

  return v10;
}

- (id)_initWithDatabaseIdentifer:(id)a3 deviceIdentifier:(id)a4 ownerDifferentiator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDCloudSyncOwnerIdentifier;
  v12 = [(HDCloudSyncOwnerIdentifier *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseIdentifier, a3);
    uint64_t v14 = [v10 copy];
    deviceIdentifier = v13->_deviceIdentifier;
    v13->_deviceIdentifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    ownerDifferentiator = v13->_ownerDifferentiator;
    v13->_ownerDifferentiator = (NSString *)v16;
  }
  return v13;
}

- (NSString)string
{
  v12[2] = *MEMORY[0x1E4F143B8];
  ownerIdentifierString = self->_ownerIdentifierString;
  if (!ownerIdentifierString)
  {
    v4 = (void *)MEMORY[0x1E4F1CA48];
    databaseIdentifier = self->_databaseIdentifier;
    v12[0] = self->_deviceIdentifier;
    v6 = [(NSUUID *)databaseIdentifier UUIDString];
    v12[1] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    id v8 = [v4 arrayWithArray:v7];

    if (self->_ownerDifferentiator) {
      objc_msgSend(v8, "addObject:");
    }
    id v9 = [v8 componentsJoinedByString:@":"];
    id v10 = self->_ownerIdentifierString;
    self->_ownerIdentifierString = v9;

    ownerIdentifierString = self->_ownerIdentifierString;
  }

  return ownerIdentifierString;
}

- (NSString)cloudKitIdentifier
{
  return self->_deviceIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(HDCloudSyncOwnerIdentifier *)self string];
    v6 = [v4 string];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HDCloudSyncOwnerIdentifier *)self string];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[HDCloudSyncOwnerIdentifier allocWithZone:a3];
  deviceIdentifier = self->_deviceIdentifier;
  databaseIdentifier = self->_databaseIdentifier;
  ownerDifferentiator = self->_ownerDifferentiator;

  return [(HDCloudSyncOwnerIdentifier *)v4 _initWithDatabaseIdentifer:databaseIdentifier deviceIdentifier:deviceIdentifier ownerDifferentiator:ownerDifferentiator];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerIdentifierString, 0);
  objc_storeStrong((id *)&self->_ownerDifferentiator, 0);
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);

  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end