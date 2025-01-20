@interface THThreadNetworkCredentials
+ (BOOL)supportsSecureCoding;
- (BOOL)isActiveDevice;
- (NSData)PANID;
- (NSData)PSKc;
- (NSData)masterKey;
- (NSString)passPhrase;
- (NSString)userInfo;
- (THThreadNetworkCredentials)init;
- (THThreadNetworkCredentials)initWithCoder:(id)a3;
- (THThreadNetworkCredentials)initWithMasterKey:(id)a3 passPhrase:(id)a4 PSKc:(id)a5 channel:(unsigned __int8)a6 PANID:(id)a7 userInfo:(id)a8;
- (THThreadNetworkCredentials)initWithMasterKey:(id)a3 passPhrase:(id)a4 PSKc:(id)a5 channel:(unsigned __int8)a6 PANID:(id)a7 userInfo:(id)a8 credentialDataSet:(id)a9 isActiveDevice:(BOOL)a10;
- (THThreadNetworkCredentialsDataSet)credentialsDataSet;
- (unsigned)channel;
- (void)encodeWithCoder:(id)a3;
- (void)setChannel:(unsigned __int8)a3;
- (void)setCredentialsDataSet:(id)a3;
- (void)setIsActiveDevice:(BOOL)a3;
- (void)setMasterKey:(id)a3;
- (void)setPANID:(id)a3;
- (void)setPSKc:(id)a3;
- (void)setPassPhrase:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation THThreadNetworkCredentials

- (THThreadNetworkCredentials)init
{
  LOBYTE(v3) = 0;
  return [(THThreadNetworkCredentials *)self initWithMasterKey:0 passPhrase:0 PSKc:0 channel:255 PANID:0 userInfo:0 credentialDataSet:0 isActiveDevice:v3];
}

- (THThreadNetworkCredentials)initWithMasterKey:(id)a3 passPhrase:(id)a4 PSKc:(id)a5 channel:(unsigned __int8)a6 PANID:(id)a7 userInfo:(id)a8
{
  LOBYTE(v9) = 0;
  return [(THThreadNetworkCredentials *)self initWithMasterKey:a3 passPhrase:a4 PSKc:a5 channel:a6 PANID:a7 userInfo:a8 credentialDataSet:0 isActiveDevice:v9];
}

- (THThreadNetworkCredentials)initWithMasterKey:(id)a3 passPhrase:(id)a4 PSKc:(id)a5 channel:(unsigned __int8)a6 PANID:(id)a7 userInfo:(id)a8 credentialDataSet:(id)a9 isActiveDevice:(BOOL)a10
{
  id v16 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a7;
  id v17 = a8;
  id v18 = a9;
  v26.receiver = self;
  v26.super_class = (Class)THThreadNetworkCredentials;
  v19 = [(THThreadNetworkCredentials *)&v26 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_masterKey, a3);
    objc_storeStrong((id *)&v20->_passPhrase, a4);
    objc_storeStrong((id *)&v20->_PSKc, a5);
    v20->_channel = a6;
    objc_storeStrong((id *)&v20->_PANID, a7);
    objc_storeStrong((id *)&v20->_userInfo, a8);
    objc_storeStrong((id *)&v20->_credentialsDataSet, a9);
    v20->_isActiveDevice = a10;
  }

  return v20;
}

- (THThreadNetworkCredentials)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mk"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"psk"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pp"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ch"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"panid"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"info"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dscreds"];
  char v12 = [v4 decodeBoolForKey:@"active"];

  if (v8) {
    unsigned __int8 v13 = [v8 charValue];
  }
  else {
    unsigned __int8 v13 = -1;
  }
  LOBYTE(v16) = v12;
  v14 = [(THThreadNetworkCredentials *)self initWithMasterKey:v5 passPhrase:v7 PSKc:v6 channel:v13 PANID:v9 userInfo:v10 credentialDataSet:v11 isActiveDevice:v16];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(THThreadNetworkCredentials *)self masterKey];
  [v11 encodeObject:v4 forKey:@"mk"];

  v5 = [(THThreadNetworkCredentials *)self PSKc];
  [v11 encodeObject:v5 forKey:@"psk"];

  v6 = [(THThreadNetworkCredentials *)self passPhrase];
  [v11 encodeObject:v6 forKey:@"pp"];

  if ([(THThreadNetworkCredentials *)self channel] == 255)
  {
    [v11 encodeObject:0 forKey:@"ch"];
  }
  else
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[THThreadNetworkCredentials channel](self, "channel"));
    [v11 encodeObject:v7 forKey:@"ch"];
  }
  v8 = [(THThreadNetworkCredentials *)self PANID];
  [v11 encodeObject:v8 forKey:@"panid"];

  uint64_t v9 = [(THThreadNetworkCredentials *)self userInfo];
  [v11 encodeObject:v9 forKey:@"info"];

  v10 = [(THThreadNetworkCredentials *)self credentialsDataSet];
  [v11 encodeObject:v10 forKey:@"dscreds"];

  objc_msgSend(v11, "encodeBool:forKey:", -[THThreadNetworkCredentials isActiveDevice](self, "isActiveDevice"), @"active");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)masterKey
{
  return self->_masterKey;
}

- (void)setMasterKey:(id)a3
{
}

- (NSString)passPhrase
{
  return self->_passPhrase;
}

- (void)setPassPhrase:(id)a3
{
}

- (NSData)PSKc
{
  return self->_PSKc;
}

- (void)setPSKc:(id)a3
{
}

- (unsigned)channel
{
  return self->_channel;
}

- (void)setChannel:(unsigned __int8)a3
{
  self->_channel = a3;
}

- (NSData)PANID
{
  return self->_PANID;
}

- (void)setPANID:(id)a3
{
}

- (NSString)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (THThreadNetworkCredentialsDataSet)credentialsDataSet
{
  return self->_credentialsDataSet;
}

- (void)setCredentialsDataSet:(id)a3
{
}

- (BOOL)isActiveDevice
{
  return self->_isActiveDevice;
}

- (void)setIsActiveDevice:(BOOL)a3
{
  self->_isActiveDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialsDataSet, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_PANID, 0);
  objc_storeStrong((id *)&self->_PSKc, 0);
  objc_storeStrong((id *)&self->_passPhrase, 0);

  objc_storeStrong((id *)&self->_masterKey, 0);
}

@end