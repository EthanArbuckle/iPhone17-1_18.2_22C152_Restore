@interface MSASAlbum
+ (BOOL)supportsSecureCoding;
+ (MSASAlbum)albumWithAlbum:(id)a3;
+ (id)album;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFamilySharedAlbum;
- (BOOL)ownerIsWhitelisted;
- (BOOL)useForeignCtag;
- (MSASAlbum)initWithCoder:(id)a3;
- (NSDate)subscriptionDate;
- (NSDictionary)metadata;
- (NSString)GUID;
- (NSString)URLString;
- (NSString)clientOrgKey;
- (NSString)ctag;
- (NSString)foreignCtag;
- (NSString)ownerEmail;
- (NSString)ownerFirstName;
- (NSString)ownerFullName;
- (NSString)ownerLastName;
- (NSString)ownerPersonID;
- (NSString)publicURLString;
- (id)context;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)metadataValueForKey:(id)a3;
- (int)relationshipState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setClientOrgKey:(id)a3;
- (void)setContext:(id)a3;
- (void)setCtag:(id)a3;
- (void)setForeignCtag:(id)a3;
- (void)setGUID:(id)a3;
- (void)setIsFamilySharedAlbum:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataValue:(id)a3 forKey:(id)a4;
- (void)setOwnerEmail:(id)a3;
- (void)setOwnerFirstName:(id)a3;
- (void)setOwnerFullName:(id)a3;
- (void)setOwnerIsWhitelisted:(BOOL)a3;
- (void)setOwnerLastName:(id)a3;
- (void)setOwnerPersonID:(id)a3;
- (void)setPublicURLString:(id)a3;
- (void)setRelationshipState:(int)a3;
- (void)setSubscriptionDate:(id)a3;
- (void)setURLString:(id)a3;
@end

@implementation MSASAlbum

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientOrgKey, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_publicURLString, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_foreignCtag, 0);
  objc_storeStrong((id *)&self->_ctag, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_subscriptionDate, 0);
  objc_storeStrong((id *)&self->_ownerLastName, 0);
  objc_storeStrong((id *)&self->_ownerFirstName, 0);
  objc_storeStrong((id *)&self->_ownerFullName, 0);
  objc_storeStrong((id *)&self->_ownerPersonID, 0);
  objc_storeStrong((id *)&self->_ownerEmail, 0);
}

- (void)setClientOrgKey:(id)a3
{
}

- (NSString)clientOrgKey
{
  return self->_clientOrgKey;
}

- (void)setIsFamilySharedAlbum:(BOOL)a3
{
  self->_isFamilySharedAlbum = a3;
}

- (BOOL)isFamilySharedAlbum
{
  return self->_isFamilySharedAlbum;
}

- (void)setContext:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setPublicURLString:(id)a3
{
}

- (NSString)publicURLString
{
  return self->_publicURLString;
}

- (void)setURLString:(id)a3
{
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setForeignCtag:(id)a3
{
}

- (NSString)foreignCtag
{
  return self->_foreignCtag;
}

- (void)setRelationshipState:(int)a3
{
  self->_relationshipState = a3;
}

- (int)relationshipState
{
  return self->_relationshipState;
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

- (void)setSubscriptionDate:(id)a3
{
}

- (NSDate)subscriptionDate
{
  return self->_subscriptionDate;
}

- (void)setOwnerIsWhitelisted:(BOOL)a3
{
  self->_ownerIsWhitelisted = a3;
}

- (BOOL)ownerIsWhitelisted
{
  return self->_ownerIsWhitelisted;
}

- (void)setOwnerLastName:(id)a3
{
}

- (void)setOwnerFirstName:(id)a3
{
}

- (void)setOwnerFullName:(id)a3
{
}

- (void)setOwnerPersonID:(id)a3
{
}

- (NSString)ownerPersonID
{
  return self->_ownerPersonID;
}

- (void)setOwnerEmail:(id)a3
{
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)MSASAlbum;
  v3 = [(MSASAlbum *)&v6 description];
  v4 = (void *)[v3 mutableCopy];

  if (self->_GUID) {
    [v4 appendFormat:@" GUID: %@", self->_GUID];
  }
  if (_thePlatform && [(id)_thePlatform shouldLogAtLevel:7])
  {
    if (self->_ownerFullName && (os_trace_get_mode() & 0x1000000) != 0) {
      [v4 appendFormat:@" owner: %@ (%@ %@)", self->_ownerFullName, self->_ownerEmail, self->_ownerPersonID];
    }
    objc_msgSend(v4, "appendFormat:", @" owner is whitelisted: %d", self->_ownerIsWhitelisted);
    if (self->_subscriptionDate) {
      [v4 appendFormat:@" subscription date: %@", self->_subscriptionDate];
    }
    if (self->_ctag) {
      [v4 appendFormat:@" ctag: %@", self->_ctag];
    }
    objc_msgSend(v4, "appendFormat:", @" Relationship: %d", self->_relationshipState);
    if (self->_foreignCtag) {
      [v4 appendFormat:@" foreign ctag: %@", self->_foreignCtag];
    }
    if (self->_URLString) {
      [v4 appendFormat:@" URL: %@", self->_URLString];
    }
    if ([(NSDictionary *)self->_metadata count] && (os_trace_get_mode() & 0x1000000) != 0) {
      [v4 appendFormat:@" metadata: %@", self->_metadata];
    }
    if (self->_publicURLString) {
      [v4 appendFormat:@" Public URL: %@", self->_publicURLString];
    }
    if (self->_isFamilySharedAlbum) {
      [v4 appendString:@" Family shared album"];
    }
    if (self->_clientOrgKey) {
      [v4 appendFormat:@" client org key: %@", self->_clientOrgKey];
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  ownerPersonID = self->_ownerPersonID;
  id v26 = v4;
  if (ownerPersonID) {
    [v4 encodeObject:ownerPersonID forKey:@"ownerPersonID"];
  }
  objc_super v6 = [(MSASAlbum *)self ownerFirstName];

  if (v6)
  {
    v7 = [(MSASAlbum *)self ownerFirstName];
    [v26 encodeObject:v7 forKey:@"ownerFirstName"];
  }
  v8 = [(MSASAlbum *)self ownerLastName];

  if (v8)
  {
    v9 = [(MSASAlbum *)self ownerLastName];
    [v26 encodeObject:v9 forKey:@"ownerLastName"];
  }
  v10 = [(MSASAlbum *)self ownerFullName];

  if (v10)
  {
    v11 = [(MSASAlbum *)self ownerFullName];
    [v26 encodeObject:v11 forKey:@"ownerFullName"];
  }
  v12 = [(MSASAlbum *)self ownerEmail];

  if (v12)
  {
    v13 = [(MSASAlbum *)self ownerEmail];
    [v26 encodeObject:v13 forKey:@"ownerEmail"];
  }
  v14 = [(MSASAlbum *)self subscriptionDate];

  v15 = v26;
  if (v14)
  {
    v16 = [(MSASAlbum *)self subscriptionDate];
    [v26 encodeObject:v16 forKey:@"subscriptionDate"];

    v15 = v26;
  }
  [v15 encodeBool:self->_ownerIsWhitelisted forKey:@"ownerIsWhitelisted"];
  GUID = self->_GUID;
  if (GUID) {
    [v26 encodeObject:GUID forKey:@"GUID"];
  }
  ctag = self->_ctag;
  if (ctag) {
    [v26 encodeObject:ctag forKey:@"ctag"];
  }
  [v26 encodeInt:self->_relationshipState forKey:@"relationshipState"];
  foreignCtag = self->_foreignCtag;
  if (foreignCtag) {
    [v26 encodeObject:foreignCtag forKey:@"foreignCtag"];
  }
  URLString = self->_URLString;
  if (URLString) {
    [v26 encodeObject:URLString forKey:@"urlString"];
  }
  metadata = self->_metadata;
  v22 = v26;
  if (metadata)
  {
    [v26 encodeObject:metadata forKey:@"metadata"];
    v22 = v26;
  }
  id context = self->_context;
  if (context)
  {
    [v26 encodeObject:context forKey:@"context"];
    v22 = v26;
  }
  publicURLString = self->_publicURLString;
  if (publicURLString)
  {
    [v26 encodeObject:publicURLString forKey:@"publicURLString"];
    v22 = v26;
  }
  [v22 encodeBool:self->_isFamilySharedAlbum forKey:@"familySharedAlbum"];
  clientOrgKey = self->_clientOrgKey;
  if (clientOrgKey) {
    [v26 encodeObject:clientOrgKey forKey:@"clientOrgKey"];
  }
}

- (MSASAlbum)initWithCoder:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)MSASAlbum;
  v5 = [(MSASAlbum *)&v46 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerEmail"];
    ownerEmail = v5->_ownerEmail;
    v5->_ownerEmail = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerPersonID"];
    ownerPersonID = v5->_ownerPersonID;
    v5->_ownerPersonID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerFullName"];
    ownerFullName = v5->_ownerFullName;
    v5->_ownerFullName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerFirstName"];
    ownerFirstName = v5->_ownerFirstName;
    v5->_ownerFirstName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerLastName"];
    ownerLastName = v5->_ownerLastName;
    v5->_ownerLastName = (NSString *)v14;

    v5->_ownerIsWhitelisted = [v4 decodeBoolForKey:@"ownerIsWhitelisted"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriptionDate"];
    subscriptionDate = v5->_subscriptionDate;
    v5->_subscriptionDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GUID"];
    GUID = v5->_GUID;
    v5->_GUID = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ctag"];
    ctag = v5->_ctag;
    v5->_ctag = (NSString *)v20;

    v5->_relationshipState = [v4 decodeIntForKey:@"relationshipState"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foreignCtag"];
    foreignCtag = v5->_foreignCtag;
    v5->_foreignCtag = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlString"];
    URLString = v5->_URLString;
    v5->_URLString = (NSString *)v24;

    id v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    v33 = objc_msgSend(v26, "setWithObjects:", v27, v28, v29, v30, v31, v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v34;

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"context"];
    id context = v5->_context;
    v5->_id context = (id)v39;

    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicURLString"];
    publicURLString = v5->_publicURLString;
    v5->_publicURLString = (NSString *)v41;

    v5->_isFamilySharedAlbum = [v4 decodeBoolForKey:@"familySharedAlbum"];
    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientOrgKey"];
    clientOrgKey = v5->_clientOrgKey;
    v5->_clientOrgKey = (NSString *)v43;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)metadataValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(MSASAlbum *)self metadata];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(MSASAlbum *)self metadata];
  if (v7)
  {
    uint64_t v8 = [(MSASAlbum *)self metadata];
    v9 = (void *)[v8 mutableCopy];
  }
  else
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
  }

  if (v10) {
    [v9 setObject:v10 forKey:v6];
  }
  else {
    [v9 removeObjectForKey:v6];
  }
  [(MSASAlbum *)self setMetadata:v9];
}

- (BOOL)useForeignCtag
{
  return [(MSASAlbum *)self relationshipState] != 0;
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
    v10.super_class = (Class)MSASAlbum;
    BOOL v9 = [(MSASAlbum *)&v10 isEqual:v4];

    return v9;
  }
}

- (NSString)ownerEmail
{
  p_ownerEmail = &self->_ownerEmail;
  ownerEmail = self->_ownerEmail;
  if (!ownerEmail)
  {
    v5 = +[MSASPersonInfoManager sharedManager];
    id v6 = v5;
    if (v5)
    {
      BOOL v7 = [v5 emailForPersonID:self->_ownerPersonID];
      if (v7) {
        objc_storeStrong((id *)p_ownerEmail, v7);
      }
    }
    ownerEmail = *p_ownerEmail;
  }
  return ownerEmail;
}

- (NSString)ownerLastName
{
  p_ownerLastName = &self->_ownerLastName;
  ownerLastName = self->_ownerLastName;
  if (!ownerLastName)
  {
    v5 = +[MSASPersonInfoManager sharedManager];
    id v6 = v5;
    if (v5)
    {
      BOOL v7 = [v5 lastNameForPersonID:self->_ownerPersonID];
      if (v7) {
        objc_storeStrong((id *)p_ownerLastName, v7);
      }
    }
    ownerLastName = *p_ownerLastName;
  }
  return ownerLastName;
}

- (NSString)ownerFirstName
{
  p_ownerFirstName = &self->_ownerFirstName;
  ownerFirstName = self->_ownerFirstName;
  if (!ownerFirstName)
  {
    v5 = +[MSASPersonInfoManager sharedManager];
    id v6 = v5;
    if (v5)
    {
      BOOL v7 = [v5 firstNameForPersonID:self->_ownerPersonID];
      if (v7) {
        objc_storeStrong((id *)p_ownerFirstName, v7);
      }
    }
    ownerFirstName = *p_ownerFirstName;
  }
  return ownerFirstName;
}

- (NSString)ownerFullName
{
  p_ownerFullName = &self->_ownerFullName;
  ownerFullName = self->_ownerFullName;
  if (!ownerFullName)
  {
    v5 = +[MSASPersonInfoManager sharedManager];
    id v6 = v5;
    if (v5)
    {
      BOOL v7 = [v5 fullNameForPersonID:self->_ownerPersonID];
      if (v7) {
        objc_storeStrong((id *)p_ownerFullName, v7);
      }
    }
    ownerFullName = *p_ownerFullName;
  }
  return ownerFullName;
}

+ (MSASAlbum)albumWithAlbum:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MSASAlbum);
  v5 = [v3 ownerEmail];
  [(MSASAlbum *)v4 setOwnerEmail:v5];

  id v6 = [v3 ownerPersonID];
  [(MSASAlbum *)v4 setOwnerPersonID:v6];

  BOOL v7 = [v3 ownerFullName];
  [(MSASAlbum *)v4 setOwnerFullName:v7];

  uint64_t v8 = [v3 ownerFirstName];
  [(MSASAlbum *)v4 setOwnerFirstName:v8];

  BOOL v9 = [v3 ownerLastName];
  [(MSASAlbum *)v4 setOwnerLastName:v9];

  -[MSASAlbum setOwnerIsWhitelisted:](v4, "setOwnerIsWhitelisted:", [v3 ownerIsWhitelisted]);
  objc_super v10 = [v3 subscriptionDate];
  [(MSASAlbum *)v4 setSubscriptionDate:v10];

  v11 = [v3 GUID];
  [(MSASAlbum *)v4 setGUID:v11];

  uint64_t v12 = [v3 ctag];
  [(MSASAlbum *)v4 setCtag:v12];

  -[MSASAlbum setRelationshipState:](v4, "setRelationshipState:", [v3 relationshipState]);
  v13 = [v3 foreignCtag];
  [(MSASAlbum *)v4 setForeignCtag:v13];

  uint64_t v14 = [v3 URLString];
  [(MSASAlbum *)v4 setURLString:v14];

  v15 = [v3 metadata];
  [(MSASAlbum *)v4 setMetadata:v15];

  uint64_t v16 = [v3 context];
  [(MSASAlbum *)v4 setContext:v16];

  -[MSASAlbum setIsFamilySharedAlbum:](v4, "setIsFamilySharedAlbum:", [v3 isFamilySharedAlbum]);
  v17 = [v3 clientOrgKey];

  [(MSASAlbum *)v4 setClientOrgKey:v17];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)album
{
  v2 = objc_alloc_init(MSASAlbum);
  return v2;
}

@end