@interface THThreadNetworkCredentialsActiveDataSetRecord
+ (BOOL)supportsSecureCoding;
- (NSDate)creationDate;
- (NSDate)lastModificationDate;
- (NSString)keychainAccessGroup;
- (NSUUID)uniqueIdentifier;
- (THThreadNetwork)network;
- (THThreadNetworkBorderAgent)borderAgent;
- (THThreadNetworkCredentials)credentials;
- (THThreadNetworkCredentialsActiveDataSetRecord)initWithBorderAgent:(id)a3 credentialsDataSet:(id)a4 network:(id)a5 credentials:(id)a6 uniqueIdentifier:(id)a7 keychainAccessGroup:(id)a8 creationDate:(id)a9 lastModificationDate:(id)a10;
- (THThreadNetworkCredentialsActiveDataSetRecord)initWithCoder:(id)a3;
- (THThreadNetworkCredentialsDataSet)credentialsDataSet;
- (void)encodeWithCoder:(id)a3;
- (void)setCredentials:(id)a3;
@end

@implementation THThreadNetworkCredentialsActiveDataSetRecord

- (THThreadNetworkCredentialsActiveDataSetRecord)initWithBorderAgent:(id)a3 credentialsDataSet:(id)a4 network:(id)a5 credentials:(id)a6 uniqueIdentifier:(id)a7 keychainAccessGroup:(id)a8 creationDate:(id)a9 lastModificationDate:(id)a10
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id obj = a8;
  id v23 = a8;
  id v17 = a9;
  id v18 = a10;
  v29.receiver = self;
  v29.super_class = (Class)THThreadNetworkCredentialsActiveDataSetRecord;
  v19 = [(THThreadNetworkCredentialsActiveDataSetRecord *)&v29 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_borderAgent, a3);
    objc_storeStrong((id *)&v20->_credentialsDataSet, a4);
    objc_storeStrong((id *)&v20->_network, a5);
    objc_storeStrong((id *)&v20->_credentials, a6);
    objc_storeStrong((id *)&v20->_uniqueIdentifier, a7);
    objc_storeStrong((id *)&v20->_creationDate, a9);
    objc_storeStrong((id *)&v20->_lastModificationDate, a10);
    objc_storeStrong((id *)&v20->_keychainAccessGroup, obj);
  }

  return v20;
}

- (THThreadNetworkCredentialsActiveDataSetRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  if (v5)
  {
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ba"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ds"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"net"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cred"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cr"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lm"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"grp"];
    v12 = (void *)v11;
    v13 = 0;
    v20 = v5;
    if (v7 && v8 && v11)
    {
      v14 = self;
      v15 = (void *)v19;
      v13 = [(THThreadNetworkCredentialsActiveDataSetRecord *)v14 initWithBorderAgent:v19 credentialsDataSet:v6 network:v7 credentials:v8 uniqueIdentifier:v5 keychainAccessGroup:v12 creationDate:v9 lastModificationDate:v10];
      v16 = v13;
    }
    else
    {
      v16 = self;
      v15 = (void *)v19;
    }

    self = v16;
    v5 = v20;
  }
  else
  {
    id v17 = THLogHandleForCategory(1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsActiveDataSetRecord initWithCoder:](v17);
    }
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self uniqueIdentifier];
  [v4 encodeObject:v5 forKey:@"uuid"];

  v6 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self borderAgent];
  [v4 encodeObject:v6 forKey:@"ba"];

  v7 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self credentialsDataSet];
  [v4 encodeObject:v7 forKey:@"ds"];

  v8 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self network];
  [v4 encodeObject:v8 forKey:@"net"];

  v9 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self credentials];
  [v4 encodeObject:v9 forKey:@"cred"];

  v10 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self creationDate];
  [v4 encodeObject:v10 forKey:@"cr"];

  uint64_t v11 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self lastModificationDate];
  [v4 encodeObject:v11 forKey:@"lm"];

  id v12 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self keychainAccessGroup];
  [v4 encodeObject:v12 forKey:@"grp"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THThreadNetworkBorderAgent)borderAgent
{
  return self->_borderAgent;
}

- (THThreadNetworkCredentialsDataSet)credentialsDataSet
{
  return self->_credentialsDataSet;
}

- (THThreadNetwork)network
{
  return self->_network;
}

- (THThreadNetworkCredentials)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(id)a3
{
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
  objc_storeStrong((id *)&self->_credentialsDataSet, 0);

  objc_storeStrong((id *)&self->_borderAgent, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  v2 = "-[THThreadNetworkCredentialsActiveDataSetRecord initWithCoder:]";
  __int16 v3 = 1024;
  int v4 = 57;
  _os_log_error_impl(&dword_1D49C1000, log, OS_LOG_TYPE_ERROR, "%s:%d: Could not decode uniqueIdentifier", (uint8_t *)&v1, 0x12u);
}

@end