@interface CPLCloudKitResourceKeys
- (CPLCloudKitResourceKeys)initWithPrefix:(id)a3 resourceType:(unint64_t)a4;
- (id)_allKeys;
- (id)_allKeysWithoutExpungedState;
- (id)description;
@end

@implementation CPLCloudKitResourceKeys

- (CPLCloudKitResourceKeys)initWithPrefix:(id)a3 resourceType:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    v35.receiver = self;
    v35.super_class = (Class)CPLCloudKitResourceKeys;
    v7 = [(CPLCloudKitResourceKeys *)&v35 init];
    v8 = v7;
    if (v7)
    {
      v7->_resourceType = a4;
      v9 = (NSString *)[v6 copy];
      prefix = v8->_prefix;
      v8->_prefix = v9;

      uint64_t v11 = [v6 stringByAppendingString:@"FileSize"];
      fileSizeKey = v8->_fileSizeKey;
      v8->_fileSizeKey = (NSString *)v11;

      uint64_t v13 = [v6 stringByAppendingString:@"FileType"];
      fileUTIKey = v8->_fileUTIKey;
      v8->_fileUTIKey = (NSString *)v13;

      uint64_t v15 = [v6 stringByAppendingString:@"Width"];
      widthKey = v8->_widthKey;
      v8->_widthKey = (NSString *)v15;

      uint64_t v17 = [v6 stringByAppendingString:@"Height"];
      heightKey = v8->_heightKey;
      v8->_heightKey = (NSString *)v17;

      uint64_t v19 = [v6 stringByAppendingString:@"Fingerprint"];
      fingerprintKey = v8->_fingerprintKey;
      v8->_fingerprintKey = (NSString *)v19;

      uint64_t v21 = [v6 stringByAppendingString:@"HashEnc"];
      stableHashKey = v8->_stableHashKey;
      v8->_stableHashKey = (NSString *)v21;

      uint64_t v23 = [v6 stringByAppendingString:@"InfoEnc"];
      encryptedInfoKey = v8->_encryptedInfoKey;
      v8->_encryptedInfoKey = (NSString *)v23;

      uint64_t v25 = [v6 stringByAppendingString:@"ExpungedState"];
      expungedStateKey = v8->_expungedStateKey;
      v8->_expungedStateKey = (NSString *)v25;

      uint64_t v27 = [v6 stringByAppendingString:@"ExpungedDate"];
      expungedDateKey = v8->_expungedDateKey;
      v8->_expungedDateKey = (NSString *)v27;

      uint64_t v29 = [v6 stringByAppendingString:@"Res"];
      resourceKey = v8->_resourceKey;
      v8->_resourceKey = (NSString *)v29;

      uint64_t v31 = [v6 stringByAppendingString:@"Dynamic"];
      dynamicKey = v8->_dynamicKey;
      v8->_dynamicKey = (NSString *)v31;
    }
    self = v8;
    v33 = self;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v4 = +[CPLResource shortDescriptionForResourceType:self->_resourceType];
  id v5 = [v3 initWithFormat:@"<%@/%@>", v4, self->_prefix];

  return v5;
}

- (id)_allKeysWithoutExpungedState
{
  long long v5 = *(_OWORD *)&self->_fileSizeKey;
  widthKey = self->_widthKey;
  long long v7 = *(_OWORD *)&self->_heightKey;
  resourceKey = self->_resourceKey;
  encryptedInfoKey = self->_encryptedInfoKey;
  v9 = resourceKey;
  id v3 = +[NSArray arrayWithObjects:&v5 count:7];
  return v3;
}

- (id)_allKeys
{
  id v3 = [(CPLCloudKitResourceKeys *)self _allKeysWithoutExpungedState];
  expungedDateKey = self->_expungedDateKey;
  v8[0] = self->_expungedStateKey;
  v8[1] = expungedDateKey;
  long long v5 = +[NSArray arrayWithObjects:v8 count:2];
  id v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicKey, 0);
  objc_storeStrong((id *)&self->_resourceKey, 0);
  objc_storeStrong((id *)&self->_expungedDateKey, 0);
  objc_storeStrong((id *)&self->_expungedStateKey, 0);
  objc_storeStrong((id *)&self->_encryptedInfoKey, 0);
  objc_storeStrong((id *)&self->_stableHashKey, 0);
  objc_storeStrong((id *)&self->_fingerprintKey, 0);
  objc_storeStrong((id *)&self->_heightKey, 0);
  objc_storeStrong((id *)&self->_widthKey, 0);
  objc_storeStrong((id *)&self->_fileUTIKey, 0);
  objc_storeStrong((id *)&self->_fileSizeKey, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

@end