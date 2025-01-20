@interface FKMapsItem
- (BOOL)isEqual:(id)a3;
- (FKMapsItem)initWithMUID:(unint64_t)a3 resultProviderIdentifier:(int)a4 name:(id)a5 phoneNumber:(id)a6 url:(id)a7 heroImageURL:(id)a8 heroImageAttributionName:(id)a9 category:(unint64_t)a10 mapsCategoryIdentifier:(id)a11 encodedStylingInfo:(id)a12 businessChatURL:(id)a13 lastProcessedDate:(id)a14;
- (NSData)encodedStylingInfo;
- (NSDate)lastProcessedDate;
- (NSString)heroImageAttributionName;
- (NSString)mapsCategoryIdentifier;
- (NSString)name;
- (NSString)phoneNumber;
- (NSURL)businessChatURL;
- (NSURL)heroImageURL;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (int)resultProviderIdentifier;
- (unint64_t)category;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)setBusinessChatURL:(id)a3;
- (void)setCategory:(unint64_t)a3;
- (void)setEncodedStylingInfo:(id)a3;
- (void)setHeroImageAttributionName:(id)a3;
- (void)setHeroImageURL:(id)a3;
- (void)setLastProcessedDate:(id)a3;
- (void)setMapsCategoryIdentifier:(id)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setResultProviderIdentifier:(int)a3;
- (void)setURL:(id)a3;
@end

@implementation FKMapsItem

- (FKMapsItem)initWithMUID:(unint64_t)a3 resultProviderIdentifier:(int)a4 name:(id)a5 phoneNumber:(id)a6 url:(id)a7 heroImageURL:(id)a8 heroImageAttributionName:(id)a9 category:(unint64_t)a10 mapsCategoryIdentifier:(id)a11 encodedStylingInfo:(id)a12 businessChatURL:(id)a13 lastProcessedDate:(id)a14
{
  id v49 = a5;
  id v48 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  v50.receiver = self;
  v50.super_class = (Class)FKMapsItem;
  v26 = [(FKMapsItem *)&v50 init];
  v27 = v26;
  if (v26)
  {
    v26->_muid = a3;
    v26->_resultProviderIdentifier = a4;
    uint64_t v28 = [v49 copy];
    name = v27->_name;
    v27->_name = (NSString *)v28;

    uint64_t v30 = [v48 copy];
    phoneNumber = v27->_phoneNumber;
    v27->_phoneNumber = (NSString *)v30;

    uint64_t v32 = [v19 copy];
    url = v27->_url;
    v27->_url = (NSURL *)v32;

    uint64_t v34 = [v20 copy];
    heroImageURL = v27->_heroImageURL;
    v27->_heroImageURL = (NSURL *)v34;

    uint64_t v36 = [v21 copy];
    heroImageAttributionName = v27->_heroImageAttributionName;
    v27->_heroImageAttributionName = (NSString *)v36;

    v27->_category = a10;
    uint64_t v38 = [v22 copy];
    mapsCategoryIdentifier = v27->_mapsCategoryIdentifier;
    v27->_mapsCategoryIdentifier = (NSString *)v38;

    uint64_t v40 = [v23 copy];
    encodedStylingInfo = v27->_encodedStylingInfo;
    v27->_encodedStylingInfo = (NSData *)v40;

    uint64_t v42 = [v24 copy];
    businessChatURL = v27->_businessChatURL;
    v27->_businessChatURL = (NSURL *)v42;

    uint64_t v44 = [v25 copy];
    lastProcessedDate = v27->_lastProcessedDate;
    v27->_lastProcessedDate = (NSDate *)v44;
  }
  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  *(void *)(v5 + 16) = self->_muid;
  *(_DWORD *)(v5 + 8) = self->_resultProviderIdentifier;
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_phoneNumber copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSURL *)self->_url copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSURL *)self->_heroImageURL copyWithZone:a3];
  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v12;

  uint64_t v14 = [(NSString *)self->_heroImageAttributionName copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  *(void *)(v5 + 64) = self->_category;
  uint64_t v16 = [(NSString *)self->_mapsCategoryIdentifier copyWithZone:a3];
  v17 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v16;

  uint64_t v18 = [(NSData *)self->_encodedStylingInfo copyWithZone:a3];
  id v19 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v18;

  uint64_t v20 = [(NSURL *)self->_businessChatURL copyWithZone:a3];
  id v21 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v20;

  uint64_t v22 = [(NSDate *)self->_lastProcessedDate copyWithZone:a3];
  id v23 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v22;

  return (id)v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_name];
  [v3 safelyAddObject:self->_phoneNumber];
  [v3 safelyAddObject:self->_url];
  [v3 safelyAddObject:self->_heroImageURL];
  [v3 safelyAddObject:self->_heroImageAttributionName];
  [v3 safelyAddObject:self->_mapsCategoryIdentifier];
  [v3 safelyAddObject:self->_encodedStylingInfo];
  [v3 safelyAddObject:self->_businessChatURL];
  [v3 safelyAddObject:self->_lastProcessedDate];
  uint64_t v4 = FKCombinedHash(17, v3);
  uint64_t v5 = FKIntegerHash(v4, self->_muid);
  uint64_t v6 = FKIntegerHash(v5, self->_resultProviderIdentifier);
  unint64_t v7 = FKIntegerHash(v6, self->_category);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FKMapsItem *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    p_isa = (void **)&v6->super.isa;
    if (self->_muid == v6->_muid
      && self->_resultProviderIdentifier == v6->_resultProviderIdentifier
      && FKEqualObjects(self->_name, v6->_name)
      && FKEqualObjects(self->_phoneNumber, p_isa[4])
      && FKEqualObjects(self->_url, p_isa[5])
      && FKEqualObjects(self->_heroImageURL, p_isa[6])
      && FKEqualObjects(self->_heroImageAttributionName, p_isa[7])
      && (void *)self->_category == p_isa[8]
      && FKEqualObjects(self->_mapsCategoryIdentifier, p_isa[9])
      && FKEqualObjects(self->_encodedStylingInfo, p_isa[10])
      && FKEqualObjects(self->_businessChatURL, p_isa[11]))
    {
      char v8 = FKEqualObjects(self->_lastProcessedDate, p_isa[12]);
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (int)resultProviderIdentifier
{
  return self->_resultProviderIdentifier;
}

- (void)setResultProviderIdentifier:(int)a3
{
  self->_resultProviderIdentifier = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setURL:(id)a3
{
}

- (NSURL)heroImageURL
{
  return self->_heroImageURL;
}

- (void)setHeroImageURL:(id)a3
{
}

- (NSString)heroImageAttributionName
{
  return self->_heroImageAttributionName;
}

- (void)setHeroImageAttributionName:(id)a3
{
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (NSString)mapsCategoryIdentifier
{
  return self->_mapsCategoryIdentifier;
}

- (void)setMapsCategoryIdentifier:(id)a3
{
}

- (NSData)encodedStylingInfo
{
  return self->_encodedStylingInfo;
}

- (void)setEncodedStylingInfo:(id)a3
{
}

- (NSURL)businessChatURL
{
  return self->_businessChatURL;
}

- (void)setBusinessChatURL:(id)a3
{
}

- (NSDate)lastProcessedDate
{
  return self->_lastProcessedDate;
}

- (void)setLastProcessedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedDate, 0);
  objc_storeStrong((id *)&self->_businessChatURL, 0);
  objc_storeStrong((id *)&self->_encodedStylingInfo, 0);
  objc_storeStrong((id *)&self->_mapsCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_heroImageAttributionName, 0);
  objc_storeStrong((id *)&self->_heroImageURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end