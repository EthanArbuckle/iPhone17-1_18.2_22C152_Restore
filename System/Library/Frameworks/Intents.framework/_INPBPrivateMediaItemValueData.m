@interface _INPBPrivateMediaItemValueData
+ (BOOL)supportsSecureCoding;
+ (Class)mediaSubItemsType;
- (BOOL)hasAmpConfidenceLevel;
- (BOOL)hasAmpConfidenceScore;
- (BOOL)hasAssetInfo;
- (BOOL)hasBundleId;
- (BOOL)hasIsAvailable;
- (BOOL)hasIsHardBan;
- (BOOL)hasPegasusMetaData;
- (BOOL)hasProvider;
- (BOOL)hasProviderAppName;
- (BOOL)hasPunchoutURI;
- (BOOL)hasRecommendationId;
- (BOOL)hasRequiresSubscription;
- (BOOL)hasSharedUserIdFromPlayableMusicAccount;
- (BOOL)hasUniversalResourceLink;
- (BOOL)isAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHardBan;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresSubscription;
- (NSArray)internalSignals;
- (NSArray)mediaSubItems;
- (NSData)pegasusMetaData;
- (NSString)assetInfo;
- (NSString)bundleId;
- (NSString)provider;
- (NSString)providerAppName;
- (NSString)punchoutURI;
- (NSString)recommendationId;
- (NSString)sharedUserIdFromPlayableMusicAccount;
- (NSString)universalResourceLink;
- (_INPBPrivateMediaItemValueData)initWithCoder:(id)a3;
- (float)ampConfidenceScore;
- (id)ampConfidenceLevelAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)internalSignalAtIndex:(unint64_t)a3;
- (id)mediaSubItemsAtIndex:(unint64_t)a3;
- (int)StringAsAmpConfidenceLevel:(id)a3;
- (int)ampConfidenceLevel;
- (unint64_t)hash;
- (unint64_t)internalSignalsCount;
- (unint64_t)mediaSubItemsCount;
- (void)addInternalSignal:(id)a3;
- (void)addMediaSubItems:(id)a3;
- (void)clearInternalSignals;
- (void)clearMediaSubItems;
- (void)encodeWithCoder:(id)a3;
- (void)setAmpConfidenceLevel:(int)a3;
- (void)setAmpConfidenceScore:(float)a3;
- (void)setAssetInfo:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setHasAmpConfidenceLevel:(BOOL)a3;
- (void)setHasAmpConfidenceScore:(BOOL)a3;
- (void)setHasIsAvailable:(BOOL)a3;
- (void)setHasIsHardBan:(BOOL)a3;
- (void)setHasRequiresSubscription:(BOOL)a3;
- (void)setInternalSignals:(id)a3;
- (void)setIsAvailable:(BOOL)a3;
- (void)setIsHardBan:(BOOL)a3;
- (void)setMediaSubItems:(id)a3;
- (void)setPegasusMetaData:(id)a3;
- (void)setProvider:(id)a3;
- (void)setProviderAppName:(id)a3;
- (void)setPunchoutURI:(id)a3;
- (void)setRecommendationId:(id)a3;
- (void)setRequiresSubscription:(BOOL)a3;
- (void)setSharedUserIdFromPlayableMusicAccount:(id)a3;
- (void)setUniversalResourceLink:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPrivateMediaItemValueData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_universalResourceLink, 0);
  objc_storeStrong((id *)&self->_sharedUserIdFromPlayableMusicAccount, 0);
  objc_storeStrong((id *)&self->_recommendationId, 0);
  objc_storeStrong((id *)&self->_punchoutURI, 0);
  objc_storeStrong((id *)&self->_providerAppName, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
  objc_storeStrong((id *)&self->_mediaSubItems, 0);
  objc_storeStrong((id *)&self->_internalSignals, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);

  objc_storeStrong((id *)&self->_assetInfo, 0);
}

- (NSString)universalResourceLink
{
  return self->_universalResourceLink;
}

- (NSString)sharedUserIdFromPlayableMusicAccount
{
  return self->_sharedUserIdFromPlayableMusicAccount;
}

- (BOOL)requiresSubscription
{
  return self->_requiresSubscription;
}

- (NSString)recommendationId
{
  return self->_recommendationId;
}

- (NSString)punchoutURI
{
  return self->_punchoutURI;
}

- (NSString)providerAppName
{
  return self->_providerAppName;
}

- (NSString)provider
{
  return self->_provider;
}

- (NSData)pegasusMetaData
{
  return self->_pegasusMetaData;
}

- (NSArray)mediaSubItems
{
  return self->_mediaSubItems;
}

- (BOOL)isHardBan
{
  return self->_isHardBan;
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (NSArray)internalSignals
{
  return self->_internalSignals;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)assetInfo
{
  return self->_assetInfo;
}

- (float)ampConfidenceScore
{
  return self->_ampConfidenceScore;
}

- (int)ampConfidenceLevel
{
  return self->_ampConfidenceLevel;
}

- (id)dictionaryRepresentation
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBPrivateMediaItemValueData *)self hasAmpConfidenceLevel])
  {
    uint64_t v4 = [(_INPBPrivateMediaItemValueData *)self ampConfidenceLevel];
    if ((int)v4 > 19)
    {
      if (v4 == 20)
      {
        v5 = @"MEDIUM";
        goto LABEL_12;
      }
      if (v4 == 30)
      {
        v5 = @"HIGH";
        goto LABEL_12;
      }
    }
    else
    {
      if (!v4)
      {
        v5 = @"UNKNOWN_CONFIDENCE_LEVEL";
        goto LABEL_12;
      }
      if (v4 == 10)
      {
        v5 = @"LOW";
LABEL_12:
        [v3 setObject:v5 forKeyedSubscript:@"ampConfidenceLevel"];

        goto LABEL_13;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_13:
  if ([(_INPBPrivateMediaItemValueData *)self hasAmpConfidenceScore])
  {
    v6 = NSNumber;
    [(_INPBPrivateMediaItemValueData *)self ampConfidenceScore];
    v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"ampConfidenceScore"];
  }
  if (self->_assetInfo)
  {
    v8 = [(_INPBPrivateMediaItemValueData *)self assetInfo];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"assetInfo"];
  }
  if (self->_bundleId)
  {
    v10 = [(_INPBPrivateMediaItemValueData *)self bundleId];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"bundleId"];
  }
  if (self->_internalSignals)
  {
    v12 = [(_INPBPrivateMediaItemValueData *)self internalSignals];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"internalSignal"];
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasIsAvailable])
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivateMediaItemValueData isAvailable](self, "isAvailable"));
    [v3 setObject:v14 forKeyedSubscript:@"isAvailable"];
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasIsHardBan])
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivateMediaItemValueData isHardBan](self, "isHardBan"));
    [v3 setObject:v15 forKeyedSubscript:@"isHardBan"];
  }
  if ([(NSArray *)self->_mediaSubItems count])
  {
    v16 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v17 = self->_mediaSubItems;
    uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKeyedSubscript:@"mediaSubItems"];
  }
  if (self->_pegasusMetaData)
  {
    v23 = [(_INPBPrivateMediaItemValueData *)self pegasusMetaData];
    v24 = (void *)[v23 copy];
    [v3 setObject:v24 forKeyedSubscript:@"pegasusMetaData"];
  }
  if (self->_provider)
  {
    v25 = [(_INPBPrivateMediaItemValueData *)self provider];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"provider"];
  }
  if (self->_providerAppName)
  {
    v27 = [(_INPBPrivateMediaItemValueData *)self providerAppName];
    v28 = (void *)[v27 copy];
    [v3 setObject:v28 forKeyedSubscript:@"providerAppName"];
  }
  if (self->_punchoutURI)
  {
    v29 = [(_INPBPrivateMediaItemValueData *)self punchoutURI];
    v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"punchoutURI"];
  }
  if (self->_recommendationId)
  {
    v31 = [(_INPBPrivateMediaItemValueData *)self recommendationId];
    v32 = (void *)[v31 copy];
    [v3 setObject:v32 forKeyedSubscript:@"recommendationId"];
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasRequiresSubscription])
  {
    v33 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivateMediaItemValueData requiresSubscription](self, "requiresSubscription"));
    [v3 setObject:v33 forKeyedSubscript:@"requiresSubscription"];
  }
  if (self->_sharedUserIdFromPlayableMusicAccount)
  {
    v34 = [(_INPBPrivateMediaItemValueData *)self sharedUserIdFromPlayableMusicAccount];
    v35 = (void *)[v34 copy];
    [v3 setObject:v35 forKeyedSubscript:@"sharedUserIdFromPlayableMusicAccount"];
  }
  if (self->_universalResourceLink)
  {
    v36 = [(_INPBPrivateMediaItemValueData *)self universalResourceLink];
    v37 = (void *)[v36 copy];
    [v3 setObject:v37 forKeyedSubscript:@"universalResourceLink"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBPrivateMediaItemValueData *)self hasAmpConfidenceLevel]) {
    uint64_t v27 = 2654435761 * self->_ampConfidenceLevel;
  }
  else {
    uint64_t v27 = 0;
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasAmpConfidenceScore])
  {
    float ampConfidenceScore = self->_ampConfidenceScore;
    double v4 = ampConfidenceScore;
    if (ampConfidenceScore < 0.0) {
      double v4 = -ampConfidenceScore;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    double v7 = fmod(v5, 1.84467441e19);
    unint64_t v8 = 2654435761u * (unint64_t)v7;
    unint64_t v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0) {
      unint64_t v9 = 2654435761u * (unint64_t)v7;
    }
    unint64_t v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0) {
      unint64_t v10 = v9;
    }
    unint64_t v26 = v10;
  }
  else
  {
    unint64_t v26 = 0;
  }
  NSUInteger v25 = [(NSString *)self->_assetInfo hash];
  NSUInteger v24 = [(NSString *)self->_bundleId hash];
  uint64_t v23 = [(NSArray *)self->_internalSignals hash];
  if ([(_INPBPrivateMediaItemValueData *)self hasIsAvailable]) {
    uint64_t v11 = 2654435761 * self->_isAvailable;
  }
  else {
    uint64_t v11 = 0;
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasIsHardBan]) {
    uint64_t v12 = 2654435761 * self->_isHardBan;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = [(NSArray *)self->_mediaSubItems hash];
  uint64_t v14 = [(NSData *)self->_pegasusMetaData hash];
  NSUInteger v15 = [(NSString *)self->_provider hash];
  NSUInteger v16 = [(NSString *)self->_providerAppName hash];
  NSUInteger v17 = [(NSString *)self->_punchoutURI hash];
  NSUInteger v18 = [(NSString *)self->_recommendationId hash];
  if ([(_INPBPrivateMediaItemValueData *)self hasRequiresSubscription]) {
    uint64_t v19 = 2654435761 * self->_requiresSubscription;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v20 = v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  NSUInteger v21 = v19 ^ [(NSString *)self->_sharedUserIdFromPlayableMusicAccount hash];
  return v20 ^ v21 ^ [(NSString *)self->_universalResourceLink hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_77;
  }
  int v5 = [(_INPBPrivateMediaItemValueData *)self hasAmpConfidenceLevel];
  if (v5 != [v4 hasAmpConfidenceLevel]) {
    goto LABEL_77;
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasAmpConfidenceLevel])
  {
    if ([v4 hasAmpConfidenceLevel])
    {
      int ampConfidenceLevel = self->_ampConfidenceLevel;
      if (ampConfidenceLevel != [v4 ampConfidenceLevel]) {
        goto LABEL_77;
      }
    }
  }
  int v7 = [(_INPBPrivateMediaItemValueData *)self hasAmpConfidenceScore];
  if (v7 != [v4 hasAmpConfidenceScore]) {
    goto LABEL_77;
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasAmpConfidenceScore])
  {
    if ([v4 hasAmpConfidenceScore])
    {
      float ampConfidenceScore = self->_ampConfidenceScore;
      [v4 ampConfidenceScore];
      if (ampConfidenceScore != v9) {
        goto LABEL_77;
      }
    }
  }
  unint64_t v10 = [(_INPBPrivateMediaItemValueData *)self assetInfo];
  uint64_t v11 = [v4 assetInfo];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_76;
  }
  uint64_t v12 = [(_INPBPrivateMediaItemValueData *)self assetInfo];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_INPBPrivateMediaItemValueData *)self assetInfo];
    NSUInteger v15 = [v4 assetInfo];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v10 = [(_INPBPrivateMediaItemValueData *)self bundleId];
  uint64_t v11 = [v4 bundleId];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_76;
  }
  uint64_t v17 = [(_INPBPrivateMediaItemValueData *)self bundleId];
  if (v17)
  {
    NSUInteger v18 = (void *)v17;
    uint64_t v19 = [(_INPBPrivateMediaItemValueData *)self bundleId];
    NSUInteger v20 = [v4 bundleId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v10 = [(_INPBPrivateMediaItemValueData *)self internalSignals];
  uint64_t v11 = [v4 internalSignals];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_76;
  }
  uint64_t v22 = [(_INPBPrivateMediaItemValueData *)self internalSignals];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    NSUInteger v24 = [(_INPBPrivateMediaItemValueData *)self internalSignals];
    NSUInteger v25 = [v4 internalSignals];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  int v27 = [(_INPBPrivateMediaItemValueData *)self hasIsAvailable];
  if (v27 != [v4 hasIsAvailable]) {
    goto LABEL_77;
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasIsAvailable])
  {
    if ([v4 hasIsAvailable])
    {
      int isAvailable = self->_isAvailable;
      if (isAvailable != [v4 isAvailable]) {
        goto LABEL_77;
      }
    }
  }
  int v29 = [(_INPBPrivateMediaItemValueData *)self hasIsHardBan];
  if (v29 != [v4 hasIsHardBan]) {
    goto LABEL_77;
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasIsHardBan])
  {
    if ([v4 hasIsHardBan])
    {
      int isHardBan = self->_isHardBan;
      if (isHardBan != [v4 isHardBan]) {
        goto LABEL_77;
      }
    }
  }
  unint64_t v10 = [(_INPBPrivateMediaItemValueData *)self mediaSubItems];
  uint64_t v11 = [v4 mediaSubItems];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_76;
  }
  uint64_t v31 = [(_INPBPrivateMediaItemValueData *)self mediaSubItems];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_INPBPrivateMediaItemValueData *)self mediaSubItems];
    v34 = [v4 mediaSubItems];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v10 = [(_INPBPrivateMediaItemValueData *)self pegasusMetaData];
  uint64_t v11 = [v4 pegasusMetaData];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_76;
  }
  uint64_t v36 = [(_INPBPrivateMediaItemValueData *)self pegasusMetaData];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(_INPBPrivateMediaItemValueData *)self pegasusMetaData];
    long long v39 = [v4 pegasusMetaData];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v10 = [(_INPBPrivateMediaItemValueData *)self provider];
  uint64_t v11 = [v4 provider];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_76;
  }
  uint64_t v41 = [(_INPBPrivateMediaItemValueData *)self provider];
  if (v41)
  {
    long long v42 = (void *)v41;
    v43 = [(_INPBPrivateMediaItemValueData *)self provider];
    uint64_t v44 = [v4 provider];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v10 = [(_INPBPrivateMediaItemValueData *)self providerAppName];
  uint64_t v11 = [v4 providerAppName];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_76;
  }
  uint64_t v46 = [(_INPBPrivateMediaItemValueData *)self providerAppName];
  if (v46)
  {
    v47 = (void *)v46;
    v48 = [(_INPBPrivateMediaItemValueData *)self providerAppName];
    v49 = [v4 providerAppName];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v10 = [(_INPBPrivateMediaItemValueData *)self punchoutURI];
  uint64_t v11 = [v4 punchoutURI];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_76;
  }
  uint64_t v51 = [(_INPBPrivateMediaItemValueData *)self punchoutURI];
  if (v51)
  {
    v52 = (void *)v51;
    v53 = [(_INPBPrivateMediaItemValueData *)self punchoutURI];
    v54 = [v4 punchoutURI];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v10 = [(_INPBPrivateMediaItemValueData *)self recommendationId];
  uint64_t v11 = [v4 recommendationId];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_76;
  }
  uint64_t v56 = [(_INPBPrivateMediaItemValueData *)self recommendationId];
  if (v56)
  {
    v57 = (void *)v56;
    v58 = [(_INPBPrivateMediaItemValueData *)self recommendationId];
    v59 = [v4 recommendationId];
    int v60 = [v58 isEqual:v59];

    if (!v60) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  int v61 = [(_INPBPrivateMediaItemValueData *)self hasRequiresSubscription];
  if (v61 != [v4 hasRequiresSubscription]) {
    goto LABEL_77;
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasRequiresSubscription])
  {
    if ([v4 hasRequiresSubscription])
    {
      int requiresSubscription = self->_requiresSubscription;
      if (requiresSubscription != [v4 requiresSubscription]) {
        goto LABEL_77;
      }
    }
  }
  unint64_t v10 = [(_INPBPrivateMediaItemValueData *)self sharedUserIdFromPlayableMusicAccount];
  uint64_t v11 = [v4 sharedUserIdFromPlayableMusicAccount];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_76;
  }
  uint64_t v63 = [(_INPBPrivateMediaItemValueData *)self sharedUserIdFromPlayableMusicAccount];
  if (v63)
  {
    v64 = (void *)v63;
    v65 = [(_INPBPrivateMediaItemValueData *)self sharedUserIdFromPlayableMusicAccount];
    v66 = [v4 sharedUserIdFromPlayableMusicAccount];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  unint64_t v10 = [(_INPBPrivateMediaItemValueData *)self universalResourceLink];
  uint64_t v11 = [v4 universalResourceLink];
  if ((v10 == 0) != (v11 != 0))
  {
    uint64_t v68 = [(_INPBPrivateMediaItemValueData *)self universalResourceLink];
    if (!v68)
    {

LABEL_80:
      BOOL v73 = 1;
      goto LABEL_78;
    }
    v69 = (void *)v68;
    v70 = [(_INPBPrivateMediaItemValueData *)self universalResourceLink];
    v71 = [v4 universalResourceLink];
    char v72 = [v70 isEqual:v71];

    if (v72) {
      goto LABEL_80;
    }
  }
  else
  {
LABEL_76:
  }
LABEL_77:
  BOOL v73 = 0;
LABEL_78:

  return v73;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBPrivateMediaItemValueData allocWithZone:](_INPBPrivateMediaItemValueData, "allocWithZone:") init];
  if ([(_INPBPrivateMediaItemValueData *)self hasAmpConfidenceLevel]) {
    [(_INPBPrivateMediaItemValueData *)v5 setAmpConfidenceLevel:[(_INPBPrivateMediaItemValueData *)self ampConfidenceLevel]];
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasAmpConfidenceScore])
  {
    [(_INPBPrivateMediaItemValueData *)self ampConfidenceScore];
    -[_INPBPrivateMediaItemValueData setAmpConfidenceScore:](v5, "setAmpConfidenceScore:");
  }
  double v6 = (void *)[(NSString *)self->_assetInfo copyWithZone:a3];
  [(_INPBPrivateMediaItemValueData *)v5 setAssetInfo:v6];

  int v7 = (void *)[(NSString *)self->_bundleId copyWithZone:a3];
  [(_INPBPrivateMediaItemValueData *)v5 setBundleId:v7];

  unint64_t v8 = (void *)[(NSArray *)self->_internalSignals copyWithZone:a3];
  [(_INPBPrivateMediaItemValueData *)v5 setInternalSignals:v8];

  if ([(_INPBPrivateMediaItemValueData *)self hasIsAvailable]) {
    [(_INPBPrivateMediaItemValueData *)v5 setIsAvailable:[(_INPBPrivateMediaItemValueData *)self isAvailable]];
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasIsHardBan]) {
    [(_INPBPrivateMediaItemValueData *)v5 setIsHardBan:[(_INPBPrivateMediaItemValueData *)self isHardBan]];
  }
  float v9 = (void *)[(NSArray *)self->_mediaSubItems copyWithZone:a3];
  [(_INPBPrivateMediaItemValueData *)v5 setMediaSubItems:v9];

  unint64_t v10 = (void *)[(NSData *)self->_pegasusMetaData copyWithZone:a3];
  [(_INPBPrivateMediaItemValueData *)v5 setPegasusMetaData:v10];

  uint64_t v11 = (void *)[(NSString *)self->_provider copyWithZone:a3];
  [(_INPBPrivateMediaItemValueData *)v5 setProvider:v11];

  uint64_t v12 = (void *)[(NSString *)self->_providerAppName copyWithZone:a3];
  [(_INPBPrivateMediaItemValueData *)v5 setProviderAppName:v12];

  uint64_t v13 = (void *)[(NSString *)self->_punchoutURI copyWithZone:a3];
  [(_INPBPrivateMediaItemValueData *)v5 setPunchoutURI:v13];

  uint64_t v14 = (void *)[(NSString *)self->_recommendationId copyWithZone:a3];
  [(_INPBPrivateMediaItemValueData *)v5 setRecommendationId:v14];

  if ([(_INPBPrivateMediaItemValueData *)self hasRequiresSubscription]) {
    [(_INPBPrivateMediaItemValueData *)v5 setRequiresSubscription:[(_INPBPrivateMediaItemValueData *)self requiresSubscription]];
  }
  NSUInteger v15 = (void *)[(NSString *)self->_sharedUserIdFromPlayableMusicAccount copyWithZone:a3];
  [(_INPBPrivateMediaItemValueData *)v5 setSharedUserIdFromPlayableMusicAccount:v15];

  int v16 = (void *)[(NSString *)self->_universalResourceLink copyWithZone:a3];
  [(_INPBPrivateMediaItemValueData *)v5 setUniversalResourceLink:v16];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPrivateMediaItemValueData *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPrivateMediaItemValueData)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPrivateMediaItemValueData *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPrivateMediaItemValueData *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPrivateMediaItemValueData *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBPrivateMediaItemValueData *)self hasAmpConfidenceLevel]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasAmpConfidenceScore]) {
    PBDataWriterWriteFloatField();
  }
  int v5 = [(_INPBPrivateMediaItemValueData *)self assetInfo];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  id v6 = [(_INPBPrivateMediaItemValueData *)self bundleId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = self->_internalSignals;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }

  if ([(_INPBPrivateMediaItemValueData *)self hasIsAvailable]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasIsHardBan]) {
    PBDataWriterWriteBOOLField();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = self->_mediaSubItems;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v14);
  }

  uint64_t v17 = [(_INPBPrivateMediaItemValueData *)self pegasusMetaData];

  if (v17) {
    PBDataWriterWriteDataField();
  }
  NSUInteger v18 = [(_INPBPrivateMediaItemValueData *)self provider];

  if (v18) {
    PBDataWriterWriteStringField();
  }
  uint64_t v19 = [(_INPBPrivateMediaItemValueData *)self providerAppName];

  if (v19) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v20 = [(_INPBPrivateMediaItemValueData *)self punchoutURI];

  if (v20) {
    PBDataWriterWriteStringField();
  }
  int v21 = [(_INPBPrivateMediaItemValueData *)self recommendationId];

  if (v21) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBPrivateMediaItemValueData *)self hasRequiresSubscription]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v22 = [(_INPBPrivateMediaItemValueData *)self sharedUserIdFromPlayableMusicAccount];

  if (v22) {
    PBDataWriterWriteStringField();
  }
  uint64_t v23 = [(_INPBPrivateMediaItemValueData *)self universalResourceLink];

  if (v23) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPrivateMediaItemValueDataReadFrom(self, (uint64_t)a3, v3);
}

- (BOOL)hasUniversalResourceLink
{
  return self->_universalResourceLink != 0;
}

- (void)setUniversalResourceLink:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  universalResourceLink = self->_universalResourceLink;
  self->_universalResourceLink = v4;

  MEMORY[0x1F41817F8](v4, universalResourceLink);
}

- (BOOL)hasSharedUserIdFromPlayableMusicAccount
{
  return self->_sharedUserIdFromPlayableMusicAccount != 0;
}

- (void)setSharedUserIdFromPlayableMusicAccount:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  sharedUserIdFromPlayableMusicAccount = self->_sharedUserIdFromPlayableMusicAccount;
  self->_sharedUserIdFromPlayableMusicAccount = v4;

  MEMORY[0x1F41817F8](v4, sharedUserIdFromPlayableMusicAccount);
}

- (void)setHasRequiresSubscription:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRequiresSubscription
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setRequiresSubscription:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int requiresSubscription = a3;
}

- (BOOL)hasRecommendationId
{
  return self->_recommendationId != 0;
}

- (void)setRecommendationId:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  recommendationId = self->_recommendationId;
  self->_recommendationId = v4;

  MEMORY[0x1F41817F8](v4, recommendationId);
}

- (BOOL)hasPunchoutURI
{
  return self->_punchoutURI != 0;
}

- (void)setPunchoutURI:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  punchoutURI = self->_punchoutURI;
  self->_punchoutURI = v4;

  MEMORY[0x1F41817F8](v4, punchoutURI);
}

- (BOOL)hasProviderAppName
{
  return self->_providerAppName != 0;
}

- (void)setProviderAppName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  providerAppName = self->_providerAppName;
  self->_providerAppName = v4;

  MEMORY[0x1F41817F8](v4, providerAppName);
}

- (BOOL)hasProvider
{
  return self->_provider != 0;
}

- (void)setProvider:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  provider = self->_provider;
  self->_provider = v4;

  MEMORY[0x1F41817F8](v4, provider);
}

- (BOOL)hasPegasusMetaData
{
  return self->_pegasusMetaData != 0;
}

- (void)setPegasusMetaData:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  pegasusMetaData = self->_pegasusMetaData;
  self->_pegasusMetaData = v4;

  MEMORY[0x1F41817F8](v4, pegasusMetaData);
}

- (id)mediaSubItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_mediaSubItems objectAtIndexedSubscript:a3];
}

- (unint64_t)mediaSubItemsCount
{
  return [(NSArray *)self->_mediaSubItems count];
}

- (void)addMediaSubItems:(id)a3
{
  id v4 = a3;
  mediaSubItems = self->_mediaSubItems;
  id v8 = v4;
  if (!mediaSubItems)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_mediaSubItems;
    self->_mediaSubItems = v6;

    id v4 = v8;
    mediaSubItems = self->_mediaSubItems;
  }
  [(NSArray *)mediaSubItems addObject:v4];
}

- (void)clearMediaSubItems
{
}

- (void)setMediaSubItems:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  mediaSubItems = self->_mediaSubItems;
  self->_mediaSubItems = v4;

  MEMORY[0x1F41817F8](v4, mediaSubItems);
}

- (void)setHasIsHardBan:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsHardBan
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsHardBan:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isHardBan = a3;
}

- (void)setHasIsAvailable:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsAvailable
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsAvailable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isAvailable = a3;
}

- (id)internalSignalAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_internalSignals objectAtIndexedSubscript:a3];
}

- (unint64_t)internalSignalsCount
{
  return [(NSArray *)self->_internalSignals count];
}

- (void)addInternalSignal:(id)a3
{
  id v4 = a3;
  internalSignals = self->_internalSignals;
  id v8 = v4;
  if (!internalSignals)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_internalSignals;
    self->_internalSignals = v6;

    id v4 = v8;
    internalSignals = self->_internalSignals;
  }
  [(NSArray *)internalSignals addObject:v4];
}

- (void)clearInternalSignals
{
}

- (void)setInternalSignals:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  internalSignals = self->_internalSignals;
  self->_internalSignals = v4;

  MEMORY[0x1F41817F8](v4, internalSignals);
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setBundleId:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  bundleId = self->_bundleId;
  self->_bundleId = v4;

  MEMORY[0x1F41817F8](v4, bundleId);
}

- (BOOL)hasAssetInfo
{
  return self->_assetInfo != 0;
}

- (void)setAssetInfo:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  assetInfo = self->_assetInfo;
  self->_assetInfo = v4;

  MEMORY[0x1F41817F8](v4, assetInfo);
}

- (void)setHasAmpConfidenceScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAmpConfidenceScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAmpConfidenceScore:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float ampConfidenceScore = a3;
}

- (int)StringAsAmpConfidenceLevel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CONFIDENCE_LEVEL"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOW"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MEDIUM"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"HIGH"])
  {
    int v4 = 30;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)ampConfidenceLevelAsString:(int)a3
{
  if (a3 > 19)
  {
    if (a3 == 20)
    {
      int v4 = @"MEDIUM";
    }
    else
    {
      if (a3 != 30)
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      int v4 = @"HIGH";
    }
  }
  else
  {
    if (a3)
    {
      if (a3 == 10)
      {
        int v4 = @"LOW";
        return v4;
      }
      goto LABEL_12;
    }
    int v4 = @"UNKNOWN_CONFIDENCE_LEVEL";
  }
  return v4;
}

- (void)setHasAmpConfidenceLevel:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAmpConfidenceLevel
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAmpConfidenceLevel:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int ampConfidenceLevel = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)mediaSubItemsType
{
  return (Class)objc_opt_class();
}

@end