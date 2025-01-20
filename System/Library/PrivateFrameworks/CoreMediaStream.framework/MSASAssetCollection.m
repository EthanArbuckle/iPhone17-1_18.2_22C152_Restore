@interface MSASAssetCollection
+ (BOOL)supportsSecureCoding;
+ (id)MSASPAssetCollectionFromProtocolDictionary:(id)a3;
+ (id)assetCollectionWithAssetCollection:(id)a3;
- (BOOL)hasComments;
- (BOOL)hasVideoAsset;
- (BOOL)isAutoloopVideo;
- (BOOL)isDeletable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMine;
- (BOOL)isPhotoIris;
- (BOOL)isVideo;
- (MSASAssetCollection)initWithCoder:(id)a3;
- (MSASAssetCollection)initWithFileName:(id)a3 path:(id)a4;
- (NSArray)assets;
- (NSDate)timestamp;
- (NSDictionary)metadata;
- (NSString)GUID;
- (NSString)albumGUID;
- (NSString)ctag;
- (NSString)email;
- (NSString)fileName;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)lastName;
- (NSString)path;
- (NSString)personID;
- (id)MSASPProtocolDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mediaAssetType;
- (id)userInfo;
- (int64_t)photoNumber;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlbumGUID:(id)a3;
- (void)setAssets:(id)a3;
- (void)setCtag:(id)a3;
- (void)setEmail:(id)a3;
- (void)setFileName:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFullName:(id)a3;
- (void)setGUID:(id)a3;
- (void)setHasComments:(BOOL)a3;
- (void)setIsDeletable:(BOOL)a3;
- (void)setIsMine:(BOOL)a3;
- (void)setLastName:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 forKey:(id)a4;
- (void)setPath:(id)a3;
- (void)setPersonID:(id)a3;
- (void)setPhotoNumber:(int64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation MSASAssetCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_ctag, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

- (void)setIsMine:(BOOL)a3
{
  self->_isMine = a3;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (void)setIsDeletable:(BOOL)a3
{
  self->_isDeletable = a3;
}

- (BOOL)isDeletable
{
  return self->_isDeletable;
}

- (void)setEmail:(id)a3
{
}

- (void)setLastName:(id)a3
{
}

- (void)setFirstName:(id)a3
{
}

- (void)setFullName:(id)a3
{
}

- (void)setPersonID:(id)a3
{
}

- (NSString)personID
{
  return self->_personID;
}

- (void)setHasComments:(BOOL)a3
{
  self->_hasComments = a3;
}

- (BOOL)hasComments
{
  return self->_hasComments;
}

- (void)setTimestamp:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setPhotoNumber:(int64_t)a3
{
  self->_photoNumber = a3;
}

- (int64_t)photoNumber
{
  return self->_photoNumber;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setUserInfo:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setPath:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setFileName:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAlbumGUID:(id)a3
{
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setCtag:(id)a3
{
}

- (NSString)ctag
{
  return self->_ctag;
}

- (void)setGUID:(id)a3
{
}

- (NSString)GUID
{
  return self->_GUID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)mediaAssetType
{
  if ([(MSASAssetCollection *)self isVideo]) {
    return @"video";
  }
  else {
    return @"unknown";
  }
}

- (BOOL)isAutoloopVideo
{
  v2 = [(NSDictionary *)self->_metadata objectForKey:@"playback-style-identifier"];
  char v3 = [v2 isEqualToString:@"autoloop"];

  return v3;
}

- (BOOL)isPhotoIris
{
  v2 = [(NSDictionary *)self->_metadata objectForKey:@"mediaGroupUUID"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isVideo
{
  if ([(MSASAssetCollection *)self isPhotoIris]) {
    return 0;
  }
  return [(MSASAssetCollection *)self hasVideoAsset];
}

- (BOOL)hasVideoAsset
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_assets;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isVideo", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setMetadata:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_metadata, a3);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = [(MSASAssetCollection *)self assets];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        uint64_t v12 = [v5 objectForKey:@"batchDateCreated"];
        [v11 setBatchCreationDate:v12];

        v13 = [v5 objectForKey:@"dateCreated"];
        [v11 setPhotoCreationDate:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  metadata = self->_metadata;
  if (metadata)
  {
    uint64_t v8 = (void *)[(NSDictionary *)metadata mutableCopy];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v9 = v8;
  if (v10) {
    [v8 setObject:v10 forKey:v6];
  }
  else {
    [v8 removeObjectForKey:v6];
  }
  [(MSASAssetCollection *)self setMetadata:v9];
}

- (unint64_t)hash
{
  return [(NSString *)self->_GUID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    GUID = self->_GUID;
    id v6 = [v4 GUID];

    BOOL v7 = [(NSString *)GUID isEqualToString:v6];
    return v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MSASAssetCollection;
    BOOL v9 = [(MSASAssetCollection *)&v10 isEqual:v4];

    return v9;
  }
}

- (MSASAssetCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MSASAssetCollection;
  id v5 = [(MSASAssetCollection *)&v26 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GUID"];
    [(MSASAssetCollection *)v5 setGUID:v6];

    BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ctag"];
    [(MSASAssetCollection *)v5 setCtag:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"albumGUID"];
    [(MSASAssetCollection *)v5 setAlbumGUID:v8];

    BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileName"];
    [(MSASAssetCollection *)v5 setFileName:v9];

    objc_super v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    [(MSASAssetCollection *)v5 setPath:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    [(MSASAssetCollection *)v5 setTimestamp:v11];

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personID"];
    [(MSASAssetCollection *)v5 setPersonID:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullName"];
    [(MSASAssetCollection *)v5 setFullName:v13];

    long long v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    [(MSASAssetCollection *)v5 setFirstName:v14];

    long long v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
    [(MSASAssetCollection *)v5 setLastName:v15];

    long long v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"email"];
    [(MSASAssetCollection *)v5 setEmail:v16];

    -[MSASAssetCollection setIsDeletable:](v5, "setIsDeletable:", [v4 decodeBoolForKey:@"isDeletable"]);
    -[MSASAssetCollection setIsMine:](v5, "setIsMine:", [v4 decodeBoolForKey:@"isMine"]);
    long long v17 = [v4 decodePropertyListForKey:@"userInfo"];
    [(MSASAssetCollection *)v5 setUserInfo:v17];

    v18 = [v4 decodePropertyListForKey:@"metadata"];
    [(MSASAssetCollection *)v5 setMetadata:v18];

    -[MSASAssetCollection setPhotoNumber:](v5, "setPhotoNumber:", [v4 decodeInt64ForKey:@"photoNumber"]);
    uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v22 = [v4 decodeObjectOfClasses:v21 forKey:@"assets"];
    v23 = [(MSASAssetCollection *)v5 GUID];
    v24 = _copyAssetsIntoAssetCollection(v22, v5, v23);
    [(MSASAssetCollection *)v5 setAssets:v24];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v32 = a3;
  id v4 = [(MSASAssetCollection *)self GUID];

  if (v4)
  {
    id v5 = [(MSASAssetCollection *)self GUID];
    [v32 encodeObject:v5 forKey:@"GUID"];
  }
  id v6 = [(MSASAssetCollection *)self ctag];

  if (v6)
  {
    BOOL v7 = [(MSASAssetCollection *)self ctag];
    [v32 encodeObject:v7 forKey:@"ctag"];
  }
  uint64_t v8 = [(MSASAssetCollection *)self albumGUID];

  if (v8)
  {
    BOOL v9 = [(MSASAssetCollection *)self albumGUID];
    [v32 encodeObject:v9 forKey:@"albumGUID"];
  }
  objc_super v10 = [(MSASAssetCollection *)self assets];

  if (v10)
  {
    v11 = [(MSASAssetCollection *)self assets];
    [v32 encodeObject:v11 forKey:@"assets"];
  }
  uint64_t v12 = [(MSASAssetCollection *)self fileName];

  if (v12)
  {
    v13 = [(MSASAssetCollection *)self fileName];
    [v32 encodeObject:v13 forKey:@"fileName"];
  }
  long long v14 = [(MSASAssetCollection *)self path];

  if (v14)
  {
    long long v15 = [(MSASAssetCollection *)self path];
    [v32 encodeObject:v15 forKey:@"path"];
  }
  long long v16 = [(MSASAssetCollection *)self timestamp];

  if (v16)
  {
    long long v17 = [(MSASAssetCollection *)self timestamp];
    [v32 encodeObject:v17 forKey:@"timestamp"];
  }
  v18 = [(MSASAssetCollection *)self personID];

  if (v18)
  {
    uint64_t v19 = [(MSASAssetCollection *)self personID];
    [v32 encodeObject:v19 forKey:@"personID"];
  }
  uint64_t v20 = [(MSASAssetCollection *)self fullName];

  if (v20)
  {
    v21 = [(MSASAssetCollection *)self fullName];
    [v32 encodeObject:v21 forKey:@"fullName"];
  }
  v22 = [(MSASAssetCollection *)self firstName];

  if (v22)
  {
    v23 = [(MSASAssetCollection *)self firstName];
    [v32 encodeObject:v23 forKey:@"firstName"];
  }
  v24 = [(MSASAssetCollection *)self lastName];

  if (v24)
  {
    v25 = [(MSASAssetCollection *)self lastName];
    [v32 encodeObject:v25 forKey:@"lastName"];
  }
  objc_super v26 = [(MSASAssetCollection *)self email];

  if (v26)
  {
    v27 = [(MSASAssetCollection *)self email];
    [v32 encodeObject:v27 forKey:@"email"];
  }
  objc_msgSend(v32, "encodeBool:forKey:", -[MSASAssetCollection isDeletable](self, "isDeletable"), @"isDeletable");
  objc_msgSend(v32, "encodeBool:forKey:", -[MSASAssetCollection isMine](self, "isMine"), @"isMine");
  v28 = [(MSASAssetCollection *)self userInfo];

  if (v28)
  {
    v29 = [(MSASAssetCollection *)self userInfo];
    [v32 encodeObject:v29 forKey:@"userInfo"];
  }
  v30 = [(MSASAssetCollection *)self metadata];

  if (v30)
  {
    v31 = [(MSASAssetCollection *)self metadata];
    [v32 encodeObject:v31 forKey:@"metadata"];
  }
  objc_msgSend(v32, "encodeInt64:forKey:", -[MSASAssetCollection photoNumber](self, "photoNumber"), @"photoNumber");
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)MSASAssetCollection;
  uint64_t v3 = [(MSASAssetCollection *)&v21 description];
  id v4 = (void *)[v3 mutableCopy];

  if (self->_GUID) {
    [v4 appendFormat:@" GUID: %@", self->_GUID];
  }
  if (self->_albumGUID) {
    [v4 appendFormat:@" album GUID: %@", self->_albumGUID];
  }
  if (self->_firstName)
  {
    lastName = self->_lastName;
    if (lastName) {
      [v4 appendFormat:@" first,last name: %@,%@", self->_firstName, lastName];
    }
  }
  if (self->_fullName) {
    [v4 appendFormat:@" full name = %@", self->_fullName];
  }
  if (self->_personID) {
    [v4 appendFormat:@" personID = %@", self->_personID];
  }
  if (self->_email) {
    [v4 appendFormat:@" email = %@", self->_email];
  }
  id v6 = @"YES";
  if (self->_isMine) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  if (!self->_isDeletable) {
    id v6 = @"NO";
  }
  [v4 appendFormat:@" isMine=%@ isDeletable=%@", v7, v6];
  objc_msgSend(v4, "appendFormat:", @" photo number: %lld", self->_photoNumber);
  if (self->_timestamp) {
    [v4 appendFormat:@" Time: %@", self->_timestamp];
  }
  uint64_t v8 = MSASPlatform();
  int v9 = [v8 shouldLogAtLevel:7];

  if (v9)
  {
    objc_msgSend(v4, "appendFormat:", @" Has comments: %d", -[MSASAssetCollection hasComments](self, "hasComments"));
    if ([(NSDictionary *)self->_metadata count]) {
      [v4 appendFormat:@" collection metadata: %@", self->_metadata];
    }
    if ([(NSArray *)self->_assets count])
    {
      [v4 appendFormat:@" Assets:\n"];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      objc_super v10 = self->_assets;
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) description];
            [v4 appendFormat:@"%@\n", v15];
          }
          uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v12);
      }
    }
  }
  return v4;
}

- (void)setAssets:(id)a3
{
  id v4 = a3;
  id v7 = [(MSASAssetCollection *)self GUID];
  _copyAssetsIntoAssetCollection(v4, self, v7);
  id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

  assets = self->_assets;
  self->_assets = v5;
}

- (MSASAssetCollection)initWithFileName:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSASAssetCollection;
  int v9 = [(MSASAssetCollection *)&v12 init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileName, a3);
    objc_storeStrong((id *)&v10->_path, a4);
    v10->_photoNumber = -1;
  }

  return v10;
}

- (NSString)email
{
  p_email = &self->_email;
  email = self->_email;
  if (!email)
  {
    id v5 = +[MSASPersonInfoManager sharedManager];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 emailForPersonID:self->_personID];
      if (v7) {
        objc_storeStrong((id *)p_email, v7);
      }
    }
    email = *p_email;
  }
  return email;
}

- (NSString)lastName
{
  p_lastName = &self->_lastName;
  lastName = self->_lastName;
  if (!lastName)
  {
    id v5 = +[MSASPersonInfoManager sharedManager];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 lastNameForPersonID:self->_personID];
      if (v7) {
        objc_storeStrong((id *)p_lastName, v7);
      }
    }
    lastName = *p_lastName;
  }
  return lastName;
}

- (NSString)firstName
{
  p_firstName = &self->_firstName;
  firstName = self->_firstName;
  if (!firstName)
  {
    id v5 = +[MSASPersonInfoManager sharedManager];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 firstNameForPersonID:self->_personID];
      if (v7) {
        objc_storeStrong((id *)p_firstName, v7);
      }
    }
    firstName = *p_firstName;
  }
  return firstName;
}

- (NSString)fullName
{
  p_fullName = &self->_fullName;
  fullName = self->_fullName;
  if (!fullName)
  {
    id v5 = +[MSASPersonInfoManager sharedManager];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 fullNameForPersonID:self->_personID];
      if (v7) {
        objc_storeStrong((id *)p_fullName, v7);
      }
    }
    fullName = *p_fullName;
  }
  return fullName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)assetCollectionWithAssetCollection:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MSASAssetCollection);
  id v5 = [v3 GUID];
  [(MSASAssetCollection *)v4 setGUID:v5];

  id v6 = [v3 albumGUID];
  [(MSASAssetCollection *)v4 setAlbumGUID:v6];

  id v7 = [v3 ctag];
  [(MSASAssetCollection *)v4 setCtag:v7];

  id v8 = [v3 fileName];
  [(MSASAssetCollection *)v4 setFileName:v8];

  int v9 = [v3 path];
  [(MSASAssetCollection *)v4 setPath:v9];

  objc_super v10 = [v3 timestamp];
  [(MSASAssetCollection *)v4 setTimestamp:v10];

  uint64_t v11 = [v3 personID];
  [(MSASAssetCollection *)v4 setPersonID:v11];

  objc_super v12 = [v3 fullName];
  [(MSASAssetCollection *)v4 setFullName:v12];

  uint64_t v13 = [v3 firstName];
  [(MSASAssetCollection *)v4 setFirstName:v13];

  long long v14 = [v3 lastName];
  [(MSASAssetCollection *)v4 setLastName:v14];

  long long v15 = [v3 email];
  [(MSASAssetCollection *)v4 setEmail:v15];

  -[MSASAssetCollection setIsDeletable:](v4, "setIsDeletable:", [v3 isDeletable]);
  -[MSASAssetCollection setIsMine:](v4, "setIsMine:", [v3 isMine]);
  long long v16 = [v3 userInfo];
  [(MSASAssetCollection *)v4 setUserInfo:v16];

  long long v17 = [v3 metadata];
  [(MSASAssetCollection *)v4 setMetadata:v17];

  long long v18 = [v3 assets];

  long long v19 = [(MSASAssetCollection *)v4 GUID];
  long long v20 = _copyAssetsIntoAssetCollection(v18, v4, v19);
  [(MSASAssetCollection *)v4 setAssets:v20];

  return v4;
}

- (id)MSASPProtocolDictionary
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(MSASAssetCollection *)self GUID];
  if (v4) {
    [v3 setObject:v4 forKey:@"assetguid"];
  }

  uint64_t v5 = [(MSASAssetCollection *)self fileName];
  if (v5)
  {
    id v6 = (void *)v5;
    if (![(MSASAssetCollection *)self isVideo]) {
      goto LABEL_7;
    }
    id v7 = [v6 pathExtension];
    char v8 = [v7 isEqualToString:@"mp4"];

    if ((v8 & 1) != 0
      || ([v6 stringByDeletingPathExtension],
          int v9 = objc_claimAutoreleasedReturnValue(),
          [v9 stringByAppendingPathExtension:@"mp4"],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          v6,
          v9,
          (id v6 = (void *)v10) != 0))
    {
LABEL_7:
      [v3 setObject:v6 forKey:@"filename"];
    }
  }
  uint64_t v11 = [(MSASAssetCollection *)self metadata];
  if (v11) {
    [v3 setObject:v11 forKey:@"collectionmetadata"];
  }

  objc_super v12 = [(MSASAssetCollection *)self mediaAssetType];
  char v13 = [v12 isEqualToString:@"unknown"];
  if (v12 && (v13 & 1) == 0) {
    [v3 setObject:v12 forKey:@"mediaAssetType"];
  }
  long long v14 = [(MSASAssetCollection *)self assets];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    long long v16 = (void *)MEMORY[0x1E4F1CA48];
    long long v17 = [(MSASAssetCollection *)self assets];
    long long v18 = objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v19 = [(MSASAssetCollection *)self assets];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v26 + 1) + 8 * i) MSASPProtocolDictionary];
          [v18 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v21);
    }

    if (v18) {
      [v3 setObject:v18 forKey:@"files"];
    }
  }
  return v3;
}

+ (id)MSASPAssetCollectionFromProtocolDictionary:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = objc_alloc_init(MSASAssetCollection);
  id v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [v4 objectForKey:@"derivatives"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v4 objectForKey:@"derivatives"];
  }
  else
  {
    uint64_t v8 = 0;
  }

  [v4 removeObjectForKey:@"derivatives"];
  int v9 = [v4 objectForKey:@"files"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v77 = [v4 objectForKey:@"files"];
  }
  else
  {
    v77 = 0;
  }

  [v4 removeObjectForKey:@"files"];
  uint64_t v10 = [v4 objectForKey:@"mediaAssetType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v4 objectForKey:@"mediaAssetType"];
  }
  else
  {
    uint64_t v11 = 0;
  }
  v76 = (void *)v8;

  [v4 removeObjectForKey:@"mediaAssetType"];
  if (v11) {
    int v12 = [v11 isEqualToString:@"video"];
  }
  else {
    int v12 = 0;
  }
  v75 = v11;
  char v13 = [v4 objectForKey:@"assetguid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v4 objectForKey:@"assetguid"];
  }
  else
  {
    uint64_t v14 = 0;
  }

  [v4 removeObjectForKey:@"assetguid"];
  if (v14) {
    [(MSASAssetCollection *)v5 setGUID:v14];
  }
  v74 = (void *)v14;
  uint64_t v15 = [v4 objectForKey:@"filename"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v4 objectForKey:@"filename"];
  }
  else
  {
    uint64_t v16 = 0;
  }

  [v4 removeObjectForKey:@"filename"];
  if (v16) {
    [(MSASAssetCollection *)v5 setFileName:v16];
  }
  v73 = (void *)v16;
  long long v17 = [v4 objectForKey:@"servertimestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v18 = [v4 objectForKey:@"servertimestamp"];
  }
  else
  {
    long long v18 = 0;
  }

  [v4 removeObjectForKey:@"servertimestamp"];
  if (v18)
  {
    long long v19 = (void *)MEMORY[0x1E4F1C9C8];
    [v18 doubleValue];
    uint64_t v20 = objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
    [(MSASAssetCollection *)v5 setTimestamp:v20];
  }
  uint64_t v21 = [v4 objectForKey:@"personid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v22 = [v4 objectForKey:@"personid"];
  }
  else
  {
    uint64_t v22 = 0;
  }

  [v4 removeObjectForKey:@"personid"];
  if (v22) {
    [(MSASAssetCollection *)v5 setPersonID:v22];
  }
  v71 = (void *)v22;
  uint64_t v23 = [v4 objectForKey:@"firstname"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v24 = [v4 objectForKey:@"firstname"];
  }
  else
  {
    uint64_t v24 = 0;
  }
  id v25 = v3;

  [v4 removeObjectForKey:@"firstname"];
  if (v24) {
    [(MSASAssetCollection *)v5 setFirstName:v24];
  }
  v70 = (void *)v24;
  long long v26 = [v4 objectForKey:@"lastname"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v27 = [v4 objectForKey:@"lastname"];
  }
  else
  {
    uint64_t v27 = 0;
  }

  [v4 removeObjectForKey:@"lastname"];
  if (v27) {
    [(MSASAssetCollection *)v5 setLastName:v27];
  }
  long long v28 = [v4 objectForKey:@"fullname"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v29 = [v4 objectForKey:@"fullname"];
  }
  else
  {
    long long v29 = 0;
  }

  [v4 removeObjectForKey:@"fullname"];
  if (v29) {
    [(MSASAssetCollection *)v5 setFullName:v29];
  }
  v30 = v25;
  uint64_t v31 = [v4 objectForKey:@"email"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v32 = [v4 objectForKey:@"email"];
  }
  else
  {
    uint64_t v32 = 0;
  }

  [v4 removeObjectForKey:@"email"];
  if (v32) {
    [(MSASAssetCollection *)v5 setEmail:v32];
  }
  v68 = (void *)v32;
  v72 = v18;
  v33 = v30;
  v34 = [v30 objectForKey:@"createdbyme"];
  objc_opt_class();
  v69 = (void *)v27;
  if (objc_opt_isKindOfClass())
  {
    v35 = [v30 objectForKey:@"createdbyme"];
    uint64_t v36 = [v35 isEqualToString:@"1"];
  }
  else
  {
    uint64_t v36 = [0 isEqualToString:@"1"];
  }

  [v4 removeObjectForKey:@"createdbyme"];
  [(MSASAssetCollection *)v5 setIsMine:v36];
  v37 = [v30 objectForKey:@"candelete"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v38 = [v30 objectForKey:@"candelete"];
    uint64_t v39 = [v38 isEqualToString:@"1"];
  }
  else
  {
    uint64_t v39 = [0 isEqualToString:@"1"];
  }
  v40 = v77;

  [v4 removeObjectForKey:@"candelete"];
  [(MSASAssetCollection *)v5 setIsDeletable:v39];
  v41 = [v4 objectForKey:@"collectionmetadata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v42 = [v4 objectForKey:@"collectionmetadata"];
  }
  else
  {
    uint64_t v42 = 0;
  }

  [v4 removeObjectForKey:@"collectionmetadata"];
  if (v42) {
    [(MSASAssetCollection *)v5 setMetadata:v42];
  }
  v43 = [v4 objectForKey:@"assetnumber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v44 = [v4 objectForKey:@"assetnumber"];
  }
  else
  {
    v44 = 0;
  }

  [v4 removeObjectForKey:@"assetnumber"];
  if (v44) {
    -[MSASAssetCollection setPhotoNumber:](v5, "setPhotoNumber:", [v44 longLongValue]);
  }
  v67 = (void *)v42;
  if (!v77)
  {
    v54 = v76;
    if (!v76) {
      goto LABEL_102;
    }
    v64 = v44;
    v65 = v5;
    v66 = v4;
    id v45 = +[MSAsset MSASPAssetFromProtocolDictionary:v4];
    if (v45) {
      [v6 addObject:v45];
    }
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v55 = v76;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v78 objects:v86 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v57; ++i)
        {
          if (*(void *)v79 != v58) {
            objc_enumerationMutation(v55);
          }
          uint64_t v60 = *(void *)(*((void *)&v78 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v61 = +[MSAsset MSASPAssetFromProtocolDictionary:v60];
            if (v61) {
              [v6 addObject:v61];
            }
          }
        }
        uint64_t v57 = [v55 countByEnumeratingWithState:&v78 objects:v86 count:16];
      }
      while (v57);
    }

    goto LABEL_100;
  }
  v66 = v4;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v45 = v77;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v82 objects:v91 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    v64 = v44;
    v65 = v5;
    v63 = v33;
    uint64_t v48 = *(void *)v83;
    v49 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v83 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v51 = *(void *)(*((void *)&v82 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v52 = +[MSAsset MSASPAssetFromProtocolDictionary:v51];
          if (v52) {
            [v6 addObject:v52];
          }
          if (v12 != objc_msgSend(v52, "isVideo", v63) && os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            int v53 = [v52 isVideo];
            *(_DWORD *)buf = 67109376;
            int v88 = v53;
            __int16 v89 = 1024;
            int v90 = v12;
            _os_log_error_impl(&dword_1DC434000, v49, OS_LOG_TYPE_ERROR, "Found inconsistency of media asset type between asset (%d) and asset collection (%d)", buf, 0xEu);
          }
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v82 objects:v91 count:16];
    }
    while (v47);
    v33 = v63;
LABEL_100:
    v44 = v64;
    uint64_t v5 = v65;
    v40 = v77;
  }

  id v4 = v66;
  v54 = v76;
LABEL_102:
  -[MSASAssetCollection setAssets:](v5, "setAssets:", v6, v63);

  return v5;
}

@end