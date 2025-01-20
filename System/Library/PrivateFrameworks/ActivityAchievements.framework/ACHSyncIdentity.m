@interface ACHSyncIdentity
- (ACHSyncIdentity)initWithHardwareIdentifier:(id)a3 databaseIdentifier:(id)a4 instanceDiscriminator:(id)a5;
- (NSData)databaseIdentifier;
- (NSData)hardwareIdentifier;
- (NSString)instanceDiscriminator;
- (void)setDatabaseIdentifier:(id)a3;
- (void)setHardwareIdentifier:(id)a3;
- (void)setInstanceDiscriminator:(id)a3;
@end

@implementation ACHSyncIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceDiscriminator, 0);
  objc_storeStrong((id *)&self->_databaseIdentifier, 0);

  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
}

- (NSString)instanceDiscriminator
{
  return self->_instanceDiscriminator;
}

- (NSData)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (NSData)databaseIdentifier
{
  return self->_databaseIdentifier;
}

- (ACHSyncIdentity)initWithHardwareIdentifier:(id)a3 databaseIdentifier:(id)a4 instanceDiscriminator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ACHSyncIdentity;
  v12 = [(ACHSyncIdentity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_hardwareIdentifier, a3);
    objc_storeStrong((id *)&v13->_databaseIdentifier, a4);
    objc_storeStrong((id *)&v13->_instanceDiscriminator, a5);
  }

  return v13;
}

- (void)setHardwareIdentifier:(id)a3
{
}

- (void)setDatabaseIdentifier:(id)a3
{
}

- (void)setInstanceDiscriminator:(id)a3
{
}

@end