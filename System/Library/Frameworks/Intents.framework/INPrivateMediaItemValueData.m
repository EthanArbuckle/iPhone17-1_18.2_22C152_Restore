@interface INPrivateMediaItemValueData
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INPrivateMediaItemValueData)initWithCoder:(id)a3;
- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 mediaSubItems:(id)a5;
- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 mediaSubItems:(id)a7;
- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 requiresSubscription:(id)a7 provider:(id)a8 isAvailable:(id)a9 isHardBan:(id)a10 bundleId:(id)a11 universalResourceLink:(id)a12 providerAppName:(id)a13 internalSignals:(id)a14 ampConfidenceScore:(id)a15 ampConfidenceLevel:(int64_t)a16 mediaSubItems:(id)a17;
- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 requiresSubscription:(id)a7 provider:(id)a8 isAvailable:(id)a9 isHardBan:(id)a10 bundleId:(id)a11 universalResourceLink:(id)a12 providerAppName:(id)a13 internalSignals:(id)a14 ampConfidenceScore:(id)a15 ampConfidenceLevel:(int64_t)a16 pegasusMetaData:(id)a17 mediaSubItems:(id)a18;
- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 requiresSubscription:(id)a7 provider:(id)a8 isAvailable:(id)a9 isHardBan:(id)a10 bundleId:(id)a11 universalResourceLink:(id)a12 providerAppName:(id)a13 internalSignals:(id)a14 mediaSubItems:(id)a15;
- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 requiresSubscription:(id)a7 provider:(id)a8 isAvailable:(id)a9 isHardBan:(id)a10 bundleId:(id)a11 universalResourceLink:(id)a12 providerAppName:(id)a13 mediaSubItems:(id)a14;
- (NSArray)internalSignals;
- (NSArray)mediaSubItems;
- (NSData)pegasusMetaData;
- (NSNumber)ampConfidenceScore;
- (NSNumber)isAvailable;
- (NSNumber)isHardBan;
- (NSNumber)requiresSubscription;
- (NSString)assetInfo;
- (NSString)bundleId;
- (NSString)description;
- (NSString)provider;
- (NSString)providerAppName;
- (NSString)punchoutURI;
- (NSString)recommendationId;
- (NSString)sharedUserIdFromPlayableMusicAccount;
- (NSString)universalResourceLink;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)ampConfidenceLevel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INPrivateMediaItemValueData

- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 requiresSubscription:(id)a7 provider:(id)a8 isAvailable:(id)a9 isHardBan:(id)a10 bundleId:(id)a11 universalResourceLink:(id)a12 providerAppName:(id)a13 internalSignals:(id)a14 mediaSubItems:(id)a15
{
  return [(INPrivateMediaItemValueData *)self initWithRecommendationId:a3 assetInfo:a4 sharedUserIdFromPlayableMusicAccount:a5 punchoutURI:a6 requiresSubscription:a7 provider:a8 isAvailable:a9 isHardBan:a10 bundleId:a11 universalResourceLink:a12 providerAppName:a13 internalSignals:a14 ampConfidenceScore:0 ampConfidenceLevel:0 mediaSubItems:a15];
}

- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 requiresSubscription:(id)a7 provider:(id)a8 isAvailable:(id)a9 isHardBan:(id)a10 bundleId:(id)a11 universalResourceLink:(id)a12 providerAppName:(id)a13 mediaSubItems:(id)a14
{
  return [(INPrivateMediaItemValueData *)self initWithRecommendationId:a3 assetInfo:a4 sharedUserIdFromPlayableMusicAccount:a5 punchoutURI:a6 requiresSubscription:a7 provider:a8 isAvailable:a9 isHardBan:a10 bundleId:a11 universalResourceLink:a12 providerAppName:a13 internalSignals:0 ampConfidenceScore:0 ampConfidenceLevel:0 mediaSubItems:a14];
}

- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 mediaSubItems:(id)a7
{
  return [(INPrivateMediaItemValueData *)self initWithRecommendationId:a3 assetInfo:a4 sharedUserIdFromPlayableMusicAccount:a5 punchoutURI:a6 requiresSubscription:0 provider:0 isAvailable:0 isHardBan:0 bundleId:0 universalResourceLink:0 providerAppName:0 internalSignals:0 ampConfidenceScore:0 ampConfidenceLevel:0 mediaSubItems:a7];
}

- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 mediaSubItems:(id)a5
{
  return [(INPrivateMediaItemValueData *)self initWithRecommendationId:a3 assetInfo:a4 sharedUserIdFromPlayableMusicAccount:0 punchoutURI:0 mediaSubItems:a5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSubItems, 0);
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
  objc_storeStrong((id *)&self->_ampConfidenceScore, 0);
  objc_storeStrong((id *)&self->_internalSignals, 0);
  objc_storeStrong((id *)&self->_providerAppName, 0);
  objc_storeStrong((id *)&self->_universalResourceLink, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_isHardBan, 0);
  objc_storeStrong((id *)&self->_isAvailable, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_requiresSubscription, 0);
  objc_storeStrong((id *)&self->_punchoutURI, 0);
  objc_storeStrong((id *)&self->_sharedUserIdFromPlayableMusicAccount, 0);
  objc_storeStrong((id *)&self->_assetInfo, 0);

  objc_storeStrong((id *)&self->_recommendationId, 0);
}

- (NSArray)mediaSubItems
{
  return self->_mediaSubItems;
}

- (NSData)pegasusMetaData
{
  return self->_pegasusMetaData;
}

- (int64_t)ampConfidenceLevel
{
  return self->_ampConfidenceLevel;
}

- (NSNumber)ampConfidenceScore
{
  return self->_ampConfidenceScore;
}

- (NSArray)internalSignals
{
  return self->_internalSignals;
}

- (NSString)providerAppName
{
  return self->_providerAppName;
}

- (NSString)universalResourceLink
{
  return self->_universalResourceLink;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSNumber)isHardBan
{
  return self->_isHardBan;
}

- (NSNumber)isAvailable
{
  return self->_isAvailable;
}

- (NSString)provider
{
  return self->_provider;
}

- (NSNumber)requiresSubscription
{
  return self->_requiresSubscription;
}

- (NSString)punchoutURI
{
  return self->_punchoutURI;
}

- (NSString)sharedUserIdFromPlayableMusicAccount
{
  return self->_sharedUserIdFromPlayableMusicAccount;
}

- (NSString)assetInfo
{
  return self->_assetInfo;
}

- (NSString)recommendationId
{
  return self->_recommendationId;
}

- (id)_dictionaryRepresentation
{
  v50[16] = *MEMORY[0x1E4F143B8];
  uint64_t recommendationId = (uint64_t)self->_recommendationId;
  uint64_t v48 = recommendationId;
  v49[0] = @"recommendationId";
  if (!recommendationId)
  {
    uint64_t recommendationId = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)recommendationId;
  v50[0] = recommendationId;
  v49[1] = @"assetInfo";
  uint64_t assetInfo = (uint64_t)self->_assetInfo;
  uint64_t v47 = assetInfo;
  if (!assetInfo)
  {
    uint64_t assetInfo = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)assetInfo;
  v50[1] = assetInfo;
  v49[2] = @"sharedUserIdFromPlayableMusicAccount";
  uint64_t sharedUserIdFromPlayableMusicAccount = (uint64_t)self->_sharedUserIdFromPlayableMusicAccount;
  uint64_t v46 = sharedUserIdFromPlayableMusicAccount;
  if (!sharedUserIdFromPlayableMusicAccount)
  {
    uint64_t sharedUserIdFromPlayableMusicAccount = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)sharedUserIdFromPlayableMusicAccount;
  v50[2] = sharedUserIdFromPlayableMusicAccount;
  v49[3] = @"punchoutURI";
  uint64_t punchoutURI = (uint64_t)self->_punchoutURI;
  uint64_t v45 = punchoutURI;
  if (!punchoutURI)
  {
    uint64_t punchoutURI = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)punchoutURI;
  v50[3] = punchoutURI;
  v49[4] = @"requiresSubscription";
  uint64_t requiresSubscription = (uint64_t)self->_requiresSubscription;
  uint64_t v44 = requiresSubscription;
  if (!requiresSubscription)
  {
    uint64_t requiresSubscription = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)requiresSubscription;
  v50[4] = requiresSubscription;
  v49[5] = @"provider";
  uint64_t provider = (uint64_t)self->_provider;
  uint64_t v43 = provider;
  if (!provider)
  {
    uint64_t provider = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)provider;
  v50[5] = provider;
  v49[6] = @"isAvailable";
  uint64_t isAvailable = (uint64_t)self->_isAvailable;
  uint64_t v42 = isAvailable;
  if (!isAvailable)
  {
    uint64_t isAvailable = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)isAvailable;
  v50[6] = isAvailable;
  v49[7] = @"isHardBan";
  uint64_t isHardBan = (uint64_t)self->_isHardBan;
  uint64_t v41 = isHardBan;
  if (!isHardBan)
  {
    uint64_t isHardBan = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)isHardBan;
  v50[7] = isHardBan;
  v49[8] = @"bundleId";
  uint64_t bundleId = (uint64_t)self->_bundleId;
  uint64_t v40 = bundleId;
  if (!bundleId)
  {
    uint64_t bundleId = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)bundleId;
  v50[8] = bundleId;
  v49[9] = @"universalResourceLink";
  universalResourceLink = self->_universalResourceLink;
  uint64_t v13 = (uint64_t)universalResourceLink;
  if (!universalResourceLink)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v13;
  v50[9] = v13;
  v49[10] = @"providerAppName";
  providerAppName = self->_providerAppName;
  uint64_t v15 = (uint64_t)providerAppName;
  if (!providerAppName)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v15;
  v50[10] = v15;
  v49[11] = @"internalSignals";
  internalSignals = self->_internalSignals;
  uint64_t v17 = (uint64_t)internalSignals;
  if (!internalSignals)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = v17;
  v50[11] = v17;
  v49[12] = @"ampConfidenceScore";
  ampConfidenceScore = self->_ampConfidenceScore;
  v19 = ampConfidenceScore;
  if (!ampConfidenceScore)
  {
    v19 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v17, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38);
  }
  v50[12] = v19;
  v49[13] = @"ampConfidenceLevel";
  v20 = objc_msgSend(NSNumber, "numberWithInteger:", self->_ampConfidenceLevel, v26);
  v50[13] = v20;
  v49[14] = @"pegasusMetaData";
  pegasusMetaData = self->_pegasusMetaData;
  v22 = pegasusMetaData;
  if (!pegasusMetaData)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v50[14] = v22;
  v49[15] = @"mediaSubItems";
  mediaSubItems = self->_mediaSubItems;
  v24 = mediaSubItems;
  if (!mediaSubItems)
  {
    v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v50[15] = v24;
  id v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:16];
  if (mediaSubItems)
  {
    if (pegasusMetaData) {
      goto LABEL_33;
    }
  }
  else
  {

    if (pegasusMetaData) {
      goto LABEL_33;
    }
  }

LABEL_33:
  if (ampConfidenceScore)
  {
    if (internalSignals) {
      goto LABEL_35;
    }
  }
  else
  {

    if (internalSignals)
    {
LABEL_35:
      if (providerAppName) {
        goto LABEL_36;
      }
LABEL_62:

      if (universalResourceLink) {
        goto LABEL_37;
      }
      goto LABEL_63;
    }
  }

  if (!providerAppName) {
    goto LABEL_62;
  }
LABEL_36:
  if (universalResourceLink) {
    goto LABEL_37;
  }
LABEL_63:

LABEL_37:
  if (!v40) {

  }
  if (!v41) {
  if (!v42)
  }

  if (!v43) {
  if (!v44)
  }

  if (!v45) {
  if (!v46)
  }

  if (!v47) {
  if (!v48)
  }

  return v39;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INPrivateMediaItemValueData;
  v6 = [(INPrivateMediaItemValueData *)&v11 description];
  v7 = [(INPrivateMediaItemValueData *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INPrivateMediaItemValueData *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_recommendationId];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"recommendationId");

  v9 = [v6 encodeObject:self->_assetInfo];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"assetInfo");

  v10 = [v6 encodeObject:self->_sharedUserIdFromPlayableMusicAccount];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"sharedUserIdFromPlayableMusicAccount");

  objc_super v11 = [v6 encodeObject:self->_punchoutURI];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"punchoutURI");

  v12 = [v6 encodeObject:self->_requiresSubscription];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"requiresSubscription");

  uint64_t v13 = [v6 encodeObject:self->_provider];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"provider");

  v14 = [v6 encodeObject:self->_isAvailable];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"isAvailable");

  uint64_t v15 = [v6 encodeObject:self->_isHardBan];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"isHardBan");

  v16 = [v6 encodeObject:self->_bundleId];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"bundleId");

  uint64_t v17 = [v6 encodeObject:self->_universalResourceLink];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, @"universalResourceLink");

  v18 = [v6 encodeObject:self->_providerAppName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v18, @"providerAppName");

  v19 = [v6 encodeObject:self->_internalSignals];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, @"internalSignals");

  v20 = [v6 encodeObject:self->_ampConfidenceScore];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v20, @"ampConfidenceScore");

  unint64_t v21 = self->_ampConfidenceLevel - 1;
  if (v21 > 2) {
    v22 = @"unknown";
  }
  else {
    v22 = off_1E5520598[v21];
  }
  v23 = v22;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, @"ampConfidenceLevel");

  v24 = [v6 encodeObject:self->_pegasusMetaData];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v24, @"pegasusMetaData");

  v25 = [v6 encodeObject:self->_mediaSubItems];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v25, @"mediaSubItems");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t recommendationId = self->_recommendationId;
  id v5 = a3;
  [v5 encodeObject:recommendationId forKey:@"recommendationId"];
  [v5 encodeObject:self->_assetInfo forKey:@"assetInfo"];
  [v5 encodeObject:self->_sharedUserIdFromPlayableMusicAccount forKey:@"sharedUserIdFromPlayableMusicAccount"];
  [v5 encodeObject:self->_punchoutURI forKey:@"punchoutURI"];
  [v5 encodeObject:self->_requiresSubscription forKey:@"requiresSubscription"];
  [v5 encodeObject:self->_provider forKey:@"provider"];
  [v5 encodeObject:self->_isAvailable forKey:@"isAvailable"];
  [v5 encodeObject:self->_isHardBan forKey:@"isHardBan"];
  [v5 encodeObject:self->_bundleId forKey:@"bundleId"];
  [v5 encodeObject:self->_universalResourceLink forKey:@"universalResourceLink"];
  [v5 encodeObject:self->_providerAppName forKey:@"providerAppName"];
  [v5 encodeObject:self->_internalSignals forKey:@"internalSignals"];
  [v5 encodeObject:self->_ampConfidenceScore forKey:@"ampConfidenceScore"];
  [v5 encodeInteger:self->_ampConfidenceLevel forKey:@"ampConfidenceLevel"];
  [v5 encodeObject:self->_pegasusMetaData forKey:@"pegasusMetaData"];
  [v5 encodeObject:self->_mediaSubItems forKey:@"mediaSubItems"];
}

- (INPrivateMediaItemValueData)initWithCoder:(id)a3
{
  v54[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v52 = [v4 decodeObjectOfClasses:v6 forKey:@"recommendationId"];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v51 = [v4 decodeObjectOfClasses:v9 forKey:@"assetInfo"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v50 = [v4 decodeObjectOfClasses:v12 forKey:@"sharedUserIdFromPlayableMusicAccount"];

  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v49 = [v4 decodeObjectOfClasses:v15 forKey:@"punchoutURI"];

  uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requiresSubscription"];
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  uint64_t v45 = [v4 decodeObjectOfClasses:v18 forKey:@"provider"];

  uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isAvailable"];
  uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isHardBan"];
  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  unint64_t v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  uint64_t v42 = [v4 decodeObjectOfClasses:v21 forKey:@"bundleId"];

  v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  uint64_t v41 = [v4 decodeObjectOfClasses:v24 forKey:@"universalResourceLink"];

  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  v28 = [v4 decodeObjectOfClasses:v27 forKey:@"providerAppName"];

  v29 = (void *)MEMORY[0x1E4F1CAD0];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  v54[2] = objc_opt_class();
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
  v31 = [v29 setWithArray:v30];
  uint64_t v40 = [v4 decodeObjectOfClasses:v31 forKey:@"internalSignals"];

  v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ampConfidenceScore"];
  uint64_t v33 = [v4 decodeIntegerForKey:@"ampConfidenceLevel"];
  v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pegasusMetaData"];
  v35 = (void *)MEMORY[0x1E4F1CAD0];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  v37 = [v35 setWithArray:v36];
  v38 = [v4 decodeObjectOfClasses:v37 forKey:@"mediaSubItems"];

  uint64_t v48 = -[INPrivateMediaItemValueData initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:pegasusMetaData:mediaSubItems:](self, "initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:pegasusMetaData:mediaSubItems:", v52, v51, v50, v49, v46, v45, v44, v43, v42, v41, v28, v40, v32, v33, v34,
          v38);

  return v48;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INPrivateMediaItemValueData *)a3;
  if (v4 == self)
  {
    BOOL v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t recommendationId = self->_recommendationId;
      if (recommendationId != v5->_recommendationId
        && !-[NSString isEqual:](recommendationId, "isEqual:"))
      {
        goto LABEL_37;
      }
      uint64_t assetInfo = self->_assetInfo;
      if (assetInfo != v5->_assetInfo && !-[NSString isEqual:](assetInfo, "isEqual:")) {
        goto LABEL_37;
      }
      uint64_t sharedUserIdFromPlayableMusicAccount = self->_sharedUserIdFromPlayableMusicAccount;
      if (sharedUserIdFromPlayableMusicAccount != v5->_sharedUserIdFromPlayableMusicAccount
        && !-[NSString isEqual:](sharedUserIdFromPlayableMusicAccount, "isEqual:"))
      {
        goto LABEL_37;
      }
      uint64_t punchoutURI = self->_punchoutURI;
      if (punchoutURI != v5->_punchoutURI && !-[NSString isEqual:](punchoutURI, "isEqual:")) {
        goto LABEL_37;
      }
      uint64_t requiresSubscription = self->_requiresSubscription;
      if (requiresSubscription != v5->_requiresSubscription
        && !-[NSNumber isEqual:](requiresSubscription, "isEqual:"))
      {
        goto LABEL_37;
      }
      uint64_t provider = self->_provider;
      if (provider != v5->_provider && !-[NSString isEqual:](provider, "isEqual:")) {
        goto LABEL_37;
      }
      uint64_t isAvailable = self->_isAvailable;
      if (isAvailable != v5->_isAvailable && !-[NSNumber isEqual:](isAvailable, "isEqual:")) {
        goto LABEL_37;
      }
      uint64_t isHardBan = self->_isHardBan;
      if (isHardBan != v5->_isHardBan && !-[NSNumber isEqual:](isHardBan, "isEqual:")) {
        goto LABEL_37;
      }
      if (((uint64_t bundleId = self->_bundleId, bundleId == v5->_bundleId)
         || -[NSString isEqual:](bundleId, "isEqual:"))
        && ((universalResourceLink = self->_universalResourceLink, universalResourceLink == v5->_universalResourceLink)
         || -[NSString isEqual:](universalResourceLink, "isEqual:"))
        && ((providerAppName = self->_providerAppName, providerAppName == v5->_providerAppName)
         || -[NSString isEqual:](providerAppName, "isEqual:"))
        && ((internalSignals = self->_internalSignals, internalSignals == v5->_internalSignals)
         || -[NSArray isEqual:](internalSignals, "isEqual:"))
        && ((ampConfidenceScore = self->_ampConfidenceScore, ampConfidenceScore == v5->_ampConfidenceScore)
         || -[NSNumber isEqual:](ampConfidenceScore, "isEqual:"))
        && self->_ampConfidenceLevel == v5->_ampConfidenceLevel
        && ((pegasusMetaData = self->_pegasusMetaData, pegasusMetaData == v5->_pegasusMetaData)
         || -[NSData isEqual:](pegasusMetaData, "isEqual:"))
        && ((mediaSubItems = self->_mediaSubItems, mediaSubItems == v5->_mediaSubItems)
         || -[NSArray isEqual:](mediaSubItems, "isEqual:")))
      {
        BOOL v21 = 1;
      }
      else
      {
LABEL_37:
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
  }

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_recommendationId hash];
  NSUInteger v4 = [(NSString *)self->_assetInfo hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_sharedUserIdFromPlayableMusicAccount hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_punchoutURI hash];
  uint64_t v7 = [(NSNumber *)self->_requiresSubscription hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_provider hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSNumber *)self->_isAvailable hash];
  uint64_t v10 = [(NSNumber *)self->_isHardBan hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_bundleId hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_universalResourceLink hash];
  NSUInteger v13 = v9 ^ v12 ^ [(NSString *)self->_providerAppName hash];
  uint64_t v14 = [(NSArray *)self->_internalSignals hash];
  uint64_t v15 = v14 ^ [(NSNumber *)self->_ampConfidenceScore hash];
  v16 = [NSNumber numberWithInteger:self->_ampConfidenceLevel];
  uint64_t v17 = v15 ^ [v16 hash];
  uint64_t v18 = v13 ^ v17 ^ [(NSData *)self->_pegasusMetaData hash];
  unint64_t v19 = v18 ^ [(NSArray *)self->_mediaSubItems hash];

  return v19;
}

- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 requiresSubscription:(id)a7 provider:(id)a8 isAvailable:(id)a9 isHardBan:(id)a10 bundleId:(id)a11 universalResourceLink:(id)a12 providerAppName:(id)a13 internalSignals:(id)a14 ampConfidenceScore:(id)a15 ampConfidenceLevel:(int64_t)a16 mediaSubItems:(id)a17
{
  return -[INPrivateMediaItemValueData initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:pegasusMetaData:mediaSubItems:](self, "initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:pegasusMetaData:mediaSubItems:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, 0,
           a17);
}

- (INPrivateMediaItemValueData)initWithRecommendationId:(id)a3 assetInfo:(id)a4 sharedUserIdFromPlayableMusicAccount:(id)a5 punchoutURI:(id)a6 requiresSubscription:(id)a7 provider:(id)a8 isAvailable:(id)a9 isHardBan:(id)a10 bundleId:(id)a11 universalResourceLink:(id)a12 providerAppName:(id)a13 internalSignals:(id)a14 ampConfidenceScore:(id)a15 ampConfidenceLevel:(int64_t)a16 pegasusMetaData:(id)a17 mediaSubItems:(id)a18
{
  id v23 = a3;
  id v24 = a4;
  id v25 = a5;
  id v26 = a6;
  id v73 = a7;
  id v72 = a8;
  v27 = v26;
  id v71 = a9;
  v28 = v25;
  id v70 = a10;
  v29 = v24;
  id v69 = a11;
  id v68 = a12;
  id v30 = a13;
  id v31 = a14;
  id v32 = a15;
  id v33 = a17;
  id v34 = a18;
  v74.receiver = self;
  v74.super_class = (Class)INPrivateMediaItemValueData;
  v35 = [(INPrivateMediaItemValueData *)&v74 init];
  if (v35)
  {
    uint64_t v36 = [v23 copy];
    uint64_t recommendationId = v35->_recommendationId;
    v35->_uint64_t recommendationId = (NSString *)v36;

    uint64_t v38 = [v29 copy];
    uint64_t assetInfo = v35->_assetInfo;
    v35->_uint64_t assetInfo = (NSString *)v38;

    uint64_t v40 = [v28 copy];
    uint64_t sharedUserIdFromPlayableMusicAccount = v35->_sharedUserIdFromPlayableMusicAccount;
    v35->_uint64_t sharedUserIdFromPlayableMusicAccount = (NSString *)v40;

    uint64_t v42 = [v27 copy];
    uint64_t punchoutURI = v35->_punchoutURI;
    v35->_uint64_t punchoutURI = (NSString *)v42;

    uint64_t v44 = [v73 copy];
    uint64_t requiresSubscription = v35->_requiresSubscription;
    v35->_uint64_t requiresSubscription = (NSNumber *)v44;

    uint64_t v46 = [v72 copy];
    uint64_t provider = v35->_provider;
    v35->_uint64_t provider = (NSString *)v46;

    uint64_t v48 = [v71 copy];
    uint64_t isAvailable = v35->_isAvailable;
    v35->_uint64_t isAvailable = (NSNumber *)v48;

    uint64_t v50 = [v70 copy];
    uint64_t isHardBan = v35->_isHardBan;
    v35->_uint64_t isHardBan = (NSNumber *)v50;

    uint64_t v52 = [v69 copy];
    uint64_t bundleId = v35->_bundleId;
    v35->_uint64_t bundleId = (NSString *)v52;

    uint64_t v54 = [v68 copy];
    universalResourceLink = v35->_universalResourceLink;
    v35->_universalResourceLink = (NSString *)v54;

    uint64_t v56 = [v30 copy];
    providerAppName = v35->_providerAppName;
    v35->_providerAppName = (NSString *)v56;

    uint64_t v58 = [v31 copy];
    internalSignals = v35->_internalSignals;
    v35->_internalSignals = (NSArray *)v58;

    uint64_t v60 = [v32 copy];
    ampConfidenceScore = v35->_ampConfidenceScore;
    v35->_ampConfidenceScore = (NSNumber *)v60;

    v35->_ampConfidenceLevel = a16;
    uint64_t v62 = [v33 copy];
    pegasusMetaData = v35->_pegasusMetaData;
    v35->_pegasusMetaData = (NSData *)v62;

    uint64_t v64 = [v34 copy];
    mediaSubItems = v35->_mediaSubItems;
    v35->_mediaSubItems = (NSArray *)v64;
  }
  return v35;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v31 = [v8 objectForKeyedSubscript:@"recommendationId"];
    v28 = [v8 objectForKeyedSubscript:@"assetInfo"];
    id v30 = [v8 objectForKeyedSubscript:@"sharedUserIdFromPlayableMusicAccount"];
    v29 = [v8 objectForKeyedSubscript:@"punchoutURI"];
    v27 = [v8 objectForKeyedSubscript:@"requiresSubscription"];
    id v25 = [v8 objectForKeyedSubscript:@"provider"];
    id v26 = [v8 objectForKeyedSubscript:@"isAvailable"];
    id v24 = [v8 objectForKeyedSubscript:@"isHardBan"];
    id v23 = [v8 objectForKeyedSubscript:@"bundleId"];
    v22 = [v8 objectForKeyedSubscript:@"universalResourceLink"];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"providerAppName"];
    uint64_t v10 = [v8 objectForKeyedSubscript:@"internalSignals"];
    NSUInteger v11 = [v8 objectForKeyedSubscript:@"ampConfidenceScore"];
    NSUInteger v12 = [v8 objectForKeyedSubscript:@"ampConfidenceLevel"];
    uint64_t v13 = INMediaConfidenceLevelWithString(v12);

    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v8 objectForKeyedSubscript:@"pegasusMetaData"];
    BOOL v21 = [v7 decodeObjectOfClass:v14 from:v15];

    uint64_t v16 = objc_opt_class();
    uint64_t v17 = [v8 objectForKeyedSubscript:@"mediaSubItems"];
    uint64_t v18 = [v7 decodeObjectsOfClass:v16 from:v17];

    unint64_t v19 = objc_msgSend(objc_alloc((Class)a1), "initWithRecommendationId:assetInfo:sharedUserIdFromPlayableMusicAccount:punchoutURI:requiresSubscription:provider:isAvailable:isHardBan:bundleId:universalResourceLink:providerAppName:internalSignals:ampConfidenceScore:ampConfidenceLevel:pegasusMetaData:mediaSubItems:", v31, v28, v30, v29, v27, v25, v26, v24, v23, v22, v9, v10, v11, v13, v21,
                    v18);
  }
  else
  {
    unint64_t v19 = 0;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end