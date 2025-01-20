@interface ODRApplication
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation ODRApplication

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = sub_1003B9478(+[ODRApplication allocWithZone:](ODRApplication, "allocWithZone:"), self->_bundleID);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003BB468;
  block[3] = &unk_100525408;
  block[4] = self;
  v7 = v5;
  id v12 = v7;
  v13 = a3;
  dispatch_sync(dispatchQueue, block);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = sub_1003B9478(+[ODRMutableApplication allocWithZone:](ODRMutableApplication, "allocWithZone:"), self->_bundleID);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003BB65C;
  block[3] = &unk_100525408;
  block[4] = self;
  v7 = v5;
  id v12 = v7;
  v13 = a3;
  dispatch_sync(dispatchQueue, block);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)description
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1000183D8;
  v10 = sub_100017DA8;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003BB75C;
  v5[3] = &unk_100524F38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unint64_t)hash
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003BB8C4;
  v5[3] = &unk_100521988;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ODRApplication *)a3;
  if (self == v4)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = v5;
      if (self)
      {
        uint64_t v12 = 0;
        v13 = &v12;
        uint64_t v14 = 0x2020000000;
        char v15 = 0;
        dispatchQueue = self->_dispatchQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1003BA0C8;
        block[3] = &unk_100521288;
        id v11 = &v12;
        block[4] = self;
        v10 = v5;
        dispatch_sync(dispatchQueue, block);
        LOBYTE(self) = *((unsigned char *)v13 + 24) != 0;

        _Block_object_dispose(&v12, 8);
      }
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcesDirectoryURL, 0);
  objc_storeStrong((id *)&self->_bundleTagManifestURL, 0);
  objc_storeStrong((id *)&self->_assetPackManifestURL, 0);
  objc_storeStrong((id *)&self->_versionToken, 0);
  objc_storeStrong((id *)&self->_variantID, 0);
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end