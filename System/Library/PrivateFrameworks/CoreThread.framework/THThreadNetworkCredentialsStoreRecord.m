@interface THThreadNetworkCredentialsStoreRecord
+ (BOOL)supportsSecureCoding;
- (NSDate)creationDate;
- (NSDate)lastModificationDate;
- (NSString)keychainAccessGroup;
- (NSUUID)uniqueIdentifier;
- (THThreadNetwork)network;
- (THThreadNetworkCredentials)credentials;
- (THThreadNetworkCredentialsStoreRecord)initWithCoder:(id)a3;
- (THThreadNetworkCredentialsStoreRecord)initWithNetwork:(id)a3 credentials:(id)a4 uniqueIdentifier:(id)a5 keychainAccessGroup:(id)a6 creationDate:(id)a7 lastModificationDate:(id)a8;
- (void)encodeWithCoder:(id)a3;
@end

@implementation THThreadNetworkCredentialsStoreRecord

- (THThreadNetworkCredentialsStoreRecord)initWithNetwork:(id)a3 credentials:(id)a4 uniqueIdentifier:(id)a5 keychainAccessGroup:(id)a6 creationDate:(id)a7 lastModificationDate:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)THThreadNetworkCredentialsStoreRecord;
  v18 = [(THThreadNetworkCredentialsStoreRecord *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_network, a3);
    objc_storeStrong((id *)&v19->_credentials, a4);
    objc_storeStrong((id *)&v19->_uniqueIdentifier, a5);
    objc_storeStrong((id *)&v19->_creationDate, a7);
    objc_storeStrong((id *)&v19->_lastModificationDate, a8);
    objc_storeStrong((id *)&v19->_keychainAccessGroup, a6);
  }

  return v19;
}

- (THThreadNetworkCredentialsStoreRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"net"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cred"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cr"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lm"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"grp"];
    v11 = (void *)v10;
    v12 = 0;
    if (v6 && v7 && v10)
    {
      self = [(THThreadNetworkCredentialsStoreRecord *)self initWithNetwork:v6 credentials:v7 uniqueIdentifier:v5 keychainAccessGroup:v10 creationDate:v8 lastModificationDate:v9];
      v12 = self;
    }
  }
  else
  {
    v13 = THLogHandleForCategory(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsStoreRecord initWithCoder:](v13);
    }

    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsStoreRecord *)self uniqueIdentifier];
  [v4 encodeObject:v5 forKey:@"uuid"];

  v6 = [(THThreadNetworkCredentialsStoreRecord *)self network];
  [v4 encodeObject:v6 forKey:@"net"];

  v7 = [(THThreadNetworkCredentialsStoreRecord *)self credentials];
  [v4 encodeObject:v7 forKey:@"cred"];

  v8 = [(THThreadNetworkCredentialsStoreRecord *)self creationDate];
  [v4 encodeObject:v8 forKey:@"cr"];

  v9 = [(THThreadNetworkCredentialsStoreRecord *)self lastModificationDate];
  [v4 encodeObject:v9 forKey:@"lm"];

  id v10 = [(THThreadNetworkCredentialsStoreRecord *)self keychainAccessGroup];
  [v4 encodeObject:v10 forKey:@"grp"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THThreadNetwork)network
{
  return self->_network;
}

- (THThreadNetworkCredentials)credentials
{
  return self->_credentials;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)keychainAccessGroup
{
  return self->_keychainAccessGroup;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_keychainAccessGroup, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_network, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  v2 = "-[THThreadNetworkCredentialsStoreRecord initWithCoder:]";
  __int16 v3 = 1024;
  int v4 = 52;
  _os_log_error_impl(&dword_220FDD000, log, OS_LOG_TYPE_ERROR, "%s:%d: Could not decode uniqueIdentifier", (uint8_t *)&v1, 0x12u);
}

@end