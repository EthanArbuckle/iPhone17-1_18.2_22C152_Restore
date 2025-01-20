@interface ThreadNetworkCredentialsPack
+ (BOOL)supportsSecureCoding;
- (THThreadNetworkCredentials)credentials;
- (THThreadNetworkCredentialsDataSet)credentialsDataSet;
- (ThreadNetworkCredentialsPack)initWithCoder:(id)a3;
- (id)initCreds:(id)a3 credentialsDataSet:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCredentials:(id)a3;
- (void)setCredentialsDataSet:(id)a3;
@end

@implementation ThreadNetworkCredentialsPack

- (id)initCreds:(id)a3 credentialsDataSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ThreadNetworkCredentialsPack;
  v9 = [(ThreadNetworkCredentialsPack *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_credentials, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (ThreadNetworkCredentialsPack)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creds"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dscreds"];

  id v7 = [(ThreadNetworkCredentialsPack *)self initCreds:v5 credentialsDataSet:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ThreadNetworkCredentialsPack *)self credentials];
  [v4 encodeObject:v5 forKey:@"creds"];

  id v6 = [(ThreadNetworkCredentialsPack *)self credentialsDataSet];
  [v4 encodeObject:v6 forKey:@"dscreds"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THThreadNetworkCredentials)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(id)a3
{
}

- (THThreadNetworkCredentialsDataSet)credentialsDataSet
{
  return self->_credentialsDataSet;
}

- (void)setCredentialsDataSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialsDataSet, 0);

  objc_storeStrong((id *)&self->_credentials, 0);
}

@end