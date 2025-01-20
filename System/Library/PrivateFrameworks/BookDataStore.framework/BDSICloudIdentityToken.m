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

+ (id)tokenForCurrentIdentityIfCloudKitEnabled
{
  if (objc_msgSend_isSignedIntoICloud(BDSSyncUserDefaults, a2, v2, v3, v4, v5, v6, v7)
    && objc_msgSend_isCloudKitSyncOptedIn(BDSSyncUserDefaults, v8, v9, v10, v11, v12, v13, v14))
  {
    v15 = [BDSICloudIdentityToken alloc];
    v23 = objc_msgSend_initWithCurrentIdentity(v15, v16, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    v23 = 0;
  }
  return v23;
}

+ (id)tokenForCurrentIdentityIfICloudDriveEnabled
{
  v8 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], a2, v2, v3, v4, v5, v6, v7);
  if (objc_msgSend_isUserSignedInToiCloud(v8, v9, v10, v11, v12, v13, v14, v15)
    && objc_msgSend_isICloudDriveSyncOptedIn(BDSSyncUserDefaults, v16, v17, v18, v19, v20, v21, v22))
  {
    int isGlobalICloudDriveSyncOptedIn = objc_msgSend_isGlobalICloudDriveSyncOptedIn(BDSSyncUserDefaults, v23, v24, v25, v26, v27, v28, v29);

    if (isGlobalICloudDriveSyncOptedIn)
    {
      v31 = [BDSICloudIdentityToken alloc];
      v39 = objc_msgSend_initWithCurrentIdentity(v31, v32, v33, v34, v35, v36, v37, v38);
      goto LABEL_7;
    }
  }
  else
  {
  }
  v39 = 0;
LABEL_7:
  return v39;
}

- (BDSICloudIdentityToken)initWithToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)BDSICloudIdentityToken;
    uint64_t v12 = [(BDSICloudIdentityToken *)&v17 init];
    if (v12)
    {
      uint64_t v13 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9, v10, v11);
      token = v12->_token;
      v12->_token = (NSString *)v13;
    }
    self = v12;
    uint64_t v15 = self;
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)initFromArchive:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = (BDSICloudIdentityToken *)objc_msgSend_initWithToken_(self, v5, (uint64_t)v4, v6, v7, v8, v9, v10);
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v11;

  return v12;
}

- (BDSICloudIdentityToken)initWithCurrentIdentity
{
  uint64_t v9 = objc_msgSend_sharedProvider(MEMORY[0x263F2BA38], a2, v2, v3, v4, v5, v6, v7);
  objc_super v17 = objc_msgSend_iCloudIdentity(v9, v10, v11, v12, v13, v14, v15, v16);

  uint64_t v24 = objc_msgSend__hashFor_(self, v18, (uint64_t)v17, v19, v20, v21, v22, v23);
  v31 = (BDSICloudIdentityToken *)objc_msgSend_initWithToken_(self, v25, (uint64_t)v24, v26, v27, v28, v29, v30);

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (BDSICloudIdentityToken *)a3;
  if (self == v4)
  {
    char isEqualToString = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = objc_msgSend_token(self, v5, v6, v7, v8, v9, v10, v11);
      uint64_t v20 = objc_msgSend_token(v4, v13, v14, v15, v16, v17, v18, v19);
      char isEqualToString = objc_msgSend_isEqualToString_(v12, v21, (uint64_t)v20, v22, v23, v24, v25, v26);
    }
    else
    {
      char isEqualToString = 0;
    }
  }

  return isEqualToString;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v12 = objc_msgSend_token(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v19 = objc_msgSend_initWithToken_(v4, v13, (uint64_t)v12, v14, v15, v16, v17, v18);

  return v19;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v12 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@=%p %@>", v7, v8, v9, v10, v11, v5, self, self->_token);

  return v12;
}

- (id)_hashFor:(id)a3
{
  uint64_t v8 = objc_msgSend_dataUsingEncoding_(a3, a2, 4, v3, v4, v5, v6, v7);
  uint64_t v16 = objc_msgSend_bu_md5UpperCase(v8, v9, v10, v11, v12, v13, v14, v15);

  return v16;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end