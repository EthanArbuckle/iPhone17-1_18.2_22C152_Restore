@interface BDSICloudIdentityToken
+ (id)tokenForCurrentIdentityIfCloudKitEnabled;
+ (id)tokenForCurrentIdentityIfICloudDriveEnabled;
- (BDSICloudIdentityToken)initWithCurrentIdentity;
- (BDSICloudIdentityToken)initWithToken:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)token;
- (id)_hashFor:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromArchive:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation BDSICloudIdentityToken

- (id)initFromArchive:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(BDSICloudIdentityToken *)self initWithToken:v4];
    v5 = self;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (BDSICloudIdentityToken)initWithCurrentIdentity
{
  v3 = +[BUAccountsProvider sharedProvider];
  id v4 = [v3 iCloudIdentity];

  v5 = [(BDSICloudIdentityToken *)self _hashFor:v4];
  v6 = [(BDSICloudIdentityToken *)self initWithToken:v5];

  return v6;
}

- (BDSICloudIdentityToken)initWithToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)BDSICloudIdentityToken;
    v5 = [(BDSICloudIdentityToken *)&v10 init];
    if (v5)
    {
      v6 = (NSString *)[v4 copy];
      token = v5->_token;
      v5->_token = v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_hashFor:(id)a3
{
  v3 = [a3 dataUsingEncoding:4];
  id v4 = objc_msgSend(v3, "bu_md5UpperCase");

  return v4;
}

- (void).cxx_destruct
{
}

+ (id)tokenForCurrentIdentityIfCloudKitEnabled
{
  if (+[BDSSyncUserDefaults isSignedIntoICloud]
    && +[BDSSyncUserDefaults isCloudKitSyncOptedIn])
  {
    v2 = [[BDSICloudIdentityToken alloc] initWithCurrentIdentity];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)tokenForCurrentIdentityIfICloudDriveEnabled
{
  v2 = +[BUAccountsProvider sharedProvider];
  if ([v2 isUserSignedInToiCloud]
    && +[BDSSyncUserDefaults isICloudDriveSyncOptedIn])
  {
    unsigned int v3 = +[BDSSyncUserDefaults isGlobalICloudDriveSyncOptedIn];

    if (v3)
    {
      id v4 = [[BDSICloudIdentityToken alloc] initWithCurrentIdentity];
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v4 = 0;
LABEL_7:
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BDSICloudIdentityToken *)a3;
  if (self == v4)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(BDSICloudIdentityToken *)self token];
      v6 = [(BDSICloudIdentityToken *)v4 token];
      unsigned __int8 v7 = [v5 isEqualToString:v6];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(BDSICloudIdentityToken *)self token];
  id v6 = [v4 initWithToken:v5];

  return v6;
}

- (id)description
{
  unsigned int v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@=%p %@>", v4, self, self->_token];

  return v5;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

@end