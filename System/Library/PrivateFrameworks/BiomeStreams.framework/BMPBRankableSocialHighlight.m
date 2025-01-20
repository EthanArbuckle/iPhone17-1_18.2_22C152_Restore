@interface BMPBRankableSocialHighlight
+ (Class)applicationIdentifiersType;
+ (Class)calculatedFeaturesType;
- (BMPBSocialHighlightContact)sender;
- (BOOL)hasAttributionIdentifier;
- (BOOL)hasBatchIdentifier;
- (BOOL)hasClientIdentifier;
- (BOOL)hasClientVariant;
- (BOOL)hasContentCreationSecondsSinceReferenceDate;
- (BOOL)hasDisplayName;
- (BOOL)hasDomainIdentifier;
- (BOOL)hasGroupPhotoPathDigest;
- (BOOL)hasHighlightIdentifier;
- (BOOL)hasHighlightType;
- (BOOL)hasIsConversationAutoDonating;
- (BOOL)hasIsPrimary;
- (BOOL)hasOriginatingDeviceId;
- (BOOL)hasRank;
- (BOOL)hasRankingSecondsSinceReferenceDate;
- (BOOL)hasResolvedUrl;
- (BOOL)hasResourceUrl;
- (BOOL)hasScore;
- (BOOL)hasSender;
- (BOOL)hasSourceBundleId;
- (BOOL)hasSyndicationSecondsSinceReferenceDate;
- (BOOL)isConversationAutoDonating;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimary;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)applicationIdentifiers;
- (NSMutableArray)calculatedFeatures;
- (NSString)attributionIdentifier;
- (NSString)batchIdentifier;
- (NSString)clientIdentifier;
- (NSString)clientVariant;
- (NSString)displayName;
- (NSString)domainIdentifier;
- (NSString)groupPhotoPathDigest;
- (NSString)highlightIdentifier;
- (NSString)originatingDeviceId;
- (NSString)resolvedUrl;
- (NSString)resourceUrl;
- (NSString)sourceBundleId;
- (double)contentCreationSecondsSinceReferenceDate;
- (double)rankingSecondsSinceReferenceDate;
- (double)score;
- (double)syndicationSecondsSinceReferenceDate;
- (id)applicationIdentifiersAtIndex:(unint64_t)a3;
- (id)calculatedFeaturesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)highlightTypeAsString:(int)a3;
- (int)StringAsHighlightType:(id)a3;
- (int)highlightType;
- (unint64_t)applicationIdentifiersCount;
- (unint64_t)calculatedFeaturesCount;
- (unint64_t)hash;
- (unsigned)rank;
- (void)addApplicationIdentifiers:(id)a3;
- (void)addCalculatedFeatures:(id)a3;
- (void)clearApplicationIdentifiers;
- (void)clearCalculatedFeatures;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationIdentifiers:(id)a3;
- (void)setAttributionIdentifier:(id)a3;
- (void)setBatchIdentifier:(id)a3;
- (void)setCalculatedFeatures:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientVariant:(id)a3;
- (void)setContentCreationSecondsSinceReferenceDate:(double)a3;
- (void)setDisplayName:(id)a3;
- (void)setDomainIdentifier:(id)a3;
- (void)setGroupPhotoPathDigest:(id)a3;
- (void)setHasContentCreationSecondsSinceReferenceDate:(BOOL)a3;
- (void)setHasHighlightType:(BOOL)a3;
- (void)setHasIsConversationAutoDonating:(BOOL)a3;
- (void)setHasIsPrimary:(BOOL)a3;
- (void)setHasRank:(BOOL)a3;
- (void)setHasRankingSecondsSinceReferenceDate:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasSyndicationSecondsSinceReferenceDate:(BOOL)a3;
- (void)setHighlightIdentifier:(id)a3;
- (void)setHighlightType:(int)a3;
- (void)setIsConversationAutoDonating:(BOOL)a3;
- (void)setIsPrimary:(BOOL)a3;
- (void)setOriginatingDeviceId:(id)a3;
- (void)setRank:(unsigned int)a3;
- (void)setRankingSecondsSinceReferenceDate:(double)a3;
- (void)setResolvedUrl:(id)a3;
- (void)setResourceUrl:(id)a3;
- (void)setScore:(double)a3;
- (void)setSender:(id)a3;
- (void)setSourceBundleId:(id)a3;
- (void)setSyndicationSecondsSinceReferenceDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBRankableSocialHighlight

- (BOOL)hasHighlightIdentifier
{
  return self->_highlightIdentifier != 0;
}

- (int)highlightType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_highlightType;
  }
  else {
    return 0;
  }
}

- (void)setHighlightType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_highlightType = a3;
}

- (void)setHasHighlightType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHighlightType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)highlightTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D6928[a3];
  }

  return v3;
}

- (int)StringAsHighlightType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Automatic"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Starred"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSyndicationSecondsSinceReferenceDate:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_syndicationSecondsSinceReferenceDate = a3;
}

- (void)setHasSyndicationSecondsSinceReferenceDate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSyndicationSecondsSinceReferenceDate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasSourceBundleId
{
  return self->_sourceBundleId != 0;
}

- (void)clearApplicationIdentifiers
{
}

- (void)addApplicationIdentifiers:(id)a3
{
  id v4 = a3;
  applicationIdentifiers = self->_applicationIdentifiers;
  id v8 = v4;
  if (!applicationIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_applicationIdentifiers;
    self->_applicationIdentifiers = v6;

    id v4 = v8;
    applicationIdentifiers = self->_applicationIdentifiers;
  }
  [(NSMutableArray *)applicationIdentifiers addObject:v4];
}

- (unint64_t)applicationIdentifiersCount
{
  return [(NSMutableArray *)self->_applicationIdentifiers count];
}

- (id)applicationIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_applicationIdentifiers objectAtIndex:a3];
}

+ (Class)applicationIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasResourceUrl
{
  return self->_resourceUrl != 0;
}

- (BOOL)hasSender
{
  return self->_sender != 0;
}

- (BOOL)hasDomainIdentifier
{
  return self->_domainIdentifier != 0;
}

- (BOOL)hasBatchIdentifier
{
  return self->_batchIdentifier != 0;
}

- (void)clearCalculatedFeatures
{
}

- (void)addCalculatedFeatures:(id)a3
{
  id v4 = a3;
  calculatedFeatures = self->_calculatedFeatures;
  id v8 = v4;
  if (!calculatedFeatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_calculatedFeatures;
    self->_calculatedFeatures = v6;

    id v4 = v8;
    calculatedFeatures = self->_calculatedFeatures;
  }
  [(NSMutableArray *)calculatedFeatures addObject:v4];
}

- (unint64_t)calculatedFeaturesCount
{
  return [(NSMutableArray *)self->_calculatedFeatures count];
}

- (id)calculatedFeaturesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_calculatedFeatures objectAtIndex:a3];
}

+ (Class)calculatedFeaturesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

- (void)setContentCreationSecondsSinceReferenceDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_contentCreationSecondsSinceReferenceDate = a3;
}

- (void)setHasContentCreationSecondsSinceReferenceDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentCreationSecondsSinceReferenceDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasGroupPhotoPathDigest
{
  return self->_groupPhotoPathDigest != 0;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setIsPrimary:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_isPrimary = a3;
}

- (void)setHasIsPrimary:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasIsPrimary
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasAttributionIdentifier
{
  return self->_attributionIdentifier != 0;
}

- (void)setRank:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRank
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScore
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsConversationAutoDonating:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isConversationAutoDonating = a3;
}

- (void)setHasIsConversationAutoDonating:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsConversationAutoDonating
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasOriginatingDeviceId
{
  return self->_originatingDeviceId != 0;
}

- (void)setRankingSecondsSinceReferenceDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rankingSecondsSinceReferenceDate = a3;
}

- (void)setHasRankingSecondsSinceReferenceDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRankingSecondsSinceReferenceDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasResolvedUrl
{
  return self->_resolvedUrl != 0;
}

- (BOOL)hasClientVariant
{
  return self->_clientVariant != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBRankableSocialHighlight;
  id v4 = [(BMPBRankableSocialHighlight *)&v8 description];
  v5 = [(BMPBRankableSocialHighlight *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  highlightIdentifier = self->_highlightIdentifier;
  if (highlightIdentifier) {
    [v3 setObject:highlightIdentifier forKey:@"highlightIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t highlightType = self->_highlightType;
    if (highlightType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_highlightType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E55D6928[highlightType];
    }
    [v4 setObject:v8 forKey:@"highlightType"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v9 = [NSNumber numberWithDouble:self->_syndicationSecondsSinceReferenceDate];
    [v4 setObject:v9 forKey:@"syndicationSecondsSinceReferenceDate"];
  }
  sourceBundleId = self->_sourceBundleId;
  if (sourceBundleId) {
    [v4 setObject:sourceBundleId forKey:@"sourceBundleId"];
  }
  applicationIdentifiers = self->_applicationIdentifiers;
  if (applicationIdentifiers) {
    [v4 setObject:applicationIdentifiers forKey:@"applicationIdentifiers"];
  }
  resourceUrl = self->_resourceUrl;
  if (resourceUrl) {
    [v4 setObject:resourceUrl forKey:@"resourceUrl"];
  }
  sender = self->_sender;
  if (sender)
  {
    v14 = [(BMPBSocialHighlightContact *)sender dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"sender"];
  }
  domainIdentifier = self->_domainIdentifier;
  if (domainIdentifier) {
    [v4 setObject:domainIdentifier forKey:@"domainIdentifier"];
  }
  batchIdentifier = self->_batchIdentifier;
  if (batchIdentifier) {
    [v4 setObject:batchIdentifier forKey:@"batchIdentifier"];
  }
  if ([(NSMutableArray *)self->_calculatedFeatures count])
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_calculatedFeatures, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v18 = self->_calculatedFeatures;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
          [v17 addObject:v23];
        }
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v20);
    }

    [v4 setObject:v17 forKey:@"calculatedFeatures"];
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier) {
    [v4 setObject:clientIdentifier forKey:@"clientIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v25 = [NSNumber numberWithDouble:self->_contentCreationSecondsSinceReferenceDate];
    [v4 setObject:v25 forKey:@"contentCreationSecondsSinceReferenceDate"];
  }
  groupPhotoPathDigest = self->_groupPhotoPathDigest;
  if (groupPhotoPathDigest) {
    [v4 setObject:groupPhotoPathDigest forKey:@"groupPhotoPathDigest"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v4 setObject:displayName forKey:@"displayName"];
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v28 = [NSNumber numberWithBool:self->_isPrimary];
    [v4 setObject:v28 forKey:@"isPrimary"];
  }
  attributionIdentifier = self->_attributionIdentifier;
  if (attributionIdentifier) {
    [v4 setObject:attributionIdentifier forKey:@"attributionIdentifier"];
  }
  char v30 = (char)self->_has;
  if ((v30 & 0x20) != 0)
  {
    v37 = [NSNumber numberWithUnsignedInt:self->_rank];
    [v4 setObject:v37 forKey:@"rank"];

    char v30 = (char)self->_has;
    if ((v30 & 4) == 0)
    {
LABEL_45:
      if ((v30 & 0x40) == 0) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_45;
  }
  v38 = [NSNumber numberWithDouble:self->_score];
  [v4 setObject:v38 forKey:@"score"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_46:
    v31 = [NSNumber numberWithBool:self->_isConversationAutoDonating];
    [v4 setObject:v31 forKey:@"isConversationAutoDonating"];
  }
LABEL_47:
  originatingDeviceId = self->_originatingDeviceId;
  if (originatingDeviceId) {
    [v4 setObject:originatingDeviceId forKey:@"originatingDeviceId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v33 = [NSNumber numberWithDouble:self->_rankingSecondsSinceReferenceDate];
    [v4 setObject:v33 forKey:@"rankingSecondsSinceReferenceDate"];
  }
  resolvedUrl = self->_resolvedUrl;
  if (resolvedUrl) {
    [v4 setObject:resolvedUrl forKey:@"resolvedUrl"];
  }
  clientVariant = self->_clientVariant;
  if (clientVariant) {
    [v4 setObject:clientVariant forKey:@"clientVariant"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBRankableSocialHighlightReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_highlightIdentifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_sourceBundleId) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = self->_applicationIdentifiers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  if (self->_resourceUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_sender) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_domainIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_batchIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = self->_calculatedFeatures;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  if (self->_clientIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_groupPhotoPathDigest) {
    PBDataWriterWriteStringField();
  }
  if (self->_displayName) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_attributionIdentifier) {
    PBDataWriterWriteStringField();
  }
  char v16 = (char)self->_has;
  if ((v16 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v16 = (char)self->_has;
    if ((v16 & 4) == 0)
    {
LABEL_45:
      if ((v16 & 0x40) == 0) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_45;
  }
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_46:
  }
    PBDataWriterWriteBOOLField();
LABEL_47:
  if (self->_originatingDeviceId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_resolvedUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_clientVariant) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if (self->_highlightIdentifier)
  {
    objc_msgSend(v4, "setHighlightIdentifier:");
    id v4 = v16;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_highlightType;
    *((unsigned char *)v4 + 180) |= 0x10u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((void *)v4 + 4) = *(void *)&self->_syndicationSecondsSinceReferenceDate;
    *((unsigned char *)v4 + 180) |= 8u;
  }
  if (self->_sourceBundleId) {
    objc_msgSend(v16, "setSourceBundleId:");
  }
  if ([(BMPBRankableSocialHighlight *)self applicationIdentifiersCount])
  {
    [v16 clearApplicationIdentifiers];
    unint64_t v6 = [(BMPBRankableSocialHighlight *)self applicationIdentifiersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(BMPBRankableSocialHighlight *)self applicationIdentifiersAtIndex:i];
        [v16 addApplicationIdentifiers:v9];
      }
    }
  }
  if (self->_resourceUrl) {
    objc_msgSend(v16, "setResourceUrl:");
  }
  if (self->_sender) {
    objc_msgSend(v16, "setSender:");
  }
  if (self->_domainIdentifier) {
    objc_msgSend(v16, "setDomainIdentifier:");
  }
  if (self->_batchIdentifier) {
    objc_msgSend(v16, "setBatchIdentifier:");
  }
  if ([(BMPBRankableSocialHighlight *)self calculatedFeaturesCount])
  {
    [v16 clearCalculatedFeatures];
    unint64_t v10 = [(BMPBRankableSocialHighlight *)self calculatedFeaturesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(BMPBRankableSocialHighlight *)self calculatedFeaturesAtIndex:j];
        [v16 addCalculatedFeatures:v13];
      }
    }
  }
  if (self->_clientIdentifier) {
    objc_msgSend(v16, "setClientIdentifier:");
  }
  uint64_t v14 = v16;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v16 + 1) = *(void *)&self->_contentCreationSecondsSinceReferenceDate;
    *((unsigned char *)v16 + 180) |= 1u;
  }
  if (self->_groupPhotoPathDigest)
  {
    objc_msgSend(v16, "setGroupPhotoPathDigest:");
    uint64_t v14 = v16;
  }
  if (self->_displayName)
  {
    objc_msgSend(v16, "setDisplayName:");
    uint64_t v14 = v16;
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v14[177] = self->_isPrimary;
    v14[180] |= 0x80u;
  }
  if (self->_attributionIdentifier)
  {
    objc_msgSend(v16, "setAttributionIdentifier:");
    uint64_t v14 = v16;
  }
  char v15 = (char)self->_has;
  if ((v15 & 0x20) != 0)
  {
    *((_DWORD *)v14 + 34) = self->_rank;
    v14[180] |= 0x20u;
    char v15 = (char)self->_has;
    if ((v15 & 4) == 0)
    {
LABEL_39:
      if ((v15 & 0x40) == 0) {
        goto LABEL_41;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_39;
  }
  *((void *)v14 + 3) = *(void *)&self->_score;
  v14[180] |= 4u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_40:
    v14[176] = self->_isConversationAutoDonating;
    v14[180] |= 0x40u;
  }
LABEL_41:
  if (self->_originatingDeviceId)
  {
    objc_msgSend(v16, "setOriginatingDeviceId:");
    uint64_t v14 = v16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v14 + 2) = *(void *)&self->_rankingSecondsSinceReferenceDate;
    v14[180] |= 2u;
  }
  if (self->_resolvedUrl)
  {
    objc_msgSend(v16, "setResolvedUrl:");
    uint64_t v14 = v16;
  }
  if (self->_clientVariant)
  {
    objc_msgSend(v16, "setClientVariant:");
    uint64_t v14 = v16;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_highlightIdentifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v6;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_highlightType;
    *(unsigned char *)(v5 + 180) |= 0x10u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_syndicationSecondsSinceReferenceDate;
    *(unsigned char *)(v5 + 180) |= 8u;
  }
  uint64_t v9 = [(NSString *)self->_sourceBundleId copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v9;

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  unint64_t v11 = self->_applicationIdentifiers;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addApplicationIdentifiers:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [(NSString *)self->_resourceUrl copyWithZone:a3];
  long long v18 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v17;

  id v19 = [(BMPBSocialHighlightContact *)self->_sender copyWithZone:a3];
  long long v20 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v19;

  uint64_t v21 = [(NSString *)self->_domainIdentifier copyWithZone:a3];
  long long v22 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v21;

  uint64_t v23 = [(NSString *)self->_batchIdentifier copyWithZone:a3];
  long long v24 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v23;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v25 = self->_calculatedFeatures;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v48 != v28) {
          objc_enumerationMutation(v25);
        }
        char v30 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * j), "copyWithZone:", a3, (void)v47);
        [(id)v5 addCalculatedFeatures:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v27);
  }

  uint64_t v31 = [(NSString *)self->_clientIdentifier copyWithZone:a3];
  v32 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v31;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_contentCreationSecondsSinceReferenceDate;
    *(unsigned char *)(v5 + 180) |= 1u;
  }
  uint64_t v33 = -[NSString copyWithZone:](self->_groupPhotoPathDigest, "copyWithZone:", a3, (void)v47);
  v34 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v33;

  uint64_t v35 = [(NSString *)self->_displayName copyWithZone:a3];
  v36 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v35;

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *(unsigned char *)(v5 + 177) = self->_isPrimary;
    *(unsigned char *)(v5 + 180) |= 0x80u;
  }
  uint64_t v37 = [(NSString *)self->_attributionIdentifier copyWithZone:a3];
  v38 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v37;

  char v39 = (char)self->_has;
  if ((v39 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_rank;
    *(unsigned char *)(v5 + 180) |= 0x20u;
    char v39 = (char)self->_has;
    if ((v39 & 4) == 0)
    {
LABEL_25:
      if ((v39 & 0x40) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_25;
  }
  *(double *)(v5 + 24) = self->_score;
  *(unsigned char *)(v5 + 180) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_26:
    *(unsigned char *)(v5 + 176) = self->_isConversationAutoDonating;
    *(unsigned char *)(v5 + 180) |= 0x40u;
  }
LABEL_27:
  uint64_t v40 = [(NSString *)self->_originatingDeviceId copyWithZone:a3];
  long long v41 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v40;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_rankingSecondsSinceReferenceDate;
    *(unsigned char *)(v5 + 180) |= 2u;
  }
  uint64_t v42 = [(NSString *)self->_resolvedUrl copyWithZone:a3];
  v43 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v42;

  uint64_t v44 = [(NSString *)self->_clientVariant copyWithZone:a3];
  v45 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v44;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_81;
  }
  highlightIdentifier = self->_highlightIdentifier;
  if ((unint64_t)highlightIdentifier | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](highlightIdentifier, "isEqual:")) {
      goto LABEL_81;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[180] & 0x10) == 0 || self->_highlightType != *((_DWORD *)v4 + 30)) {
      goto LABEL_81;
    }
  }
  else if ((v4[180] & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[180] & 8) == 0 || self->_syndicationSecondsSinceReferenceDate != *((double *)v4 + 4)) {
      goto LABEL_81;
    }
  }
  else if ((v4[180] & 8) != 0)
  {
    goto LABEL_81;
  }
  sourceBundleId = self->_sourceBundleId;
  if ((unint64_t)sourceBundleId | *((void *)v4 + 21)
    && !-[NSString isEqual:](sourceBundleId, "isEqual:"))
  {
    goto LABEL_81;
  }
  applicationIdentifiers = self->_applicationIdentifiers;
  if ((unint64_t)applicationIdentifiers | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](applicationIdentifiers, "isEqual:")) {
      goto LABEL_81;
    }
  }
  resourceUrl = self->_resourceUrl;
  if ((unint64_t)resourceUrl | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](resourceUrl, "isEqual:")) {
      goto LABEL_81;
    }
  }
  sender = self->_sender;
  if ((unint64_t)sender | *((void *)v4 + 20))
  {
    if (!-[BMPBSocialHighlightContact isEqual:](sender, "isEqual:")) {
      goto LABEL_81;
    }
  }
  domainIdentifier = self->_domainIdentifier;
  if ((unint64_t)domainIdentifier | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](domainIdentifier, "isEqual:")) {
      goto LABEL_81;
    }
  }
  batchIdentifier = self->_batchIdentifier;
  if ((unint64_t)batchIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](batchIdentifier, "isEqual:")) {
      goto LABEL_81;
    }
  }
  calculatedFeatures = self->_calculatedFeatures;
  if ((unint64_t)calculatedFeatures | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](calculatedFeatures, "isEqual:")) {
      goto LABEL_81;
    }
  }
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](clientIdentifier, "isEqual:")) {
      goto LABEL_81;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[180] & 1) == 0 || self->_contentCreationSecondsSinceReferenceDate != *((double *)v4 + 1)) {
      goto LABEL_81;
    }
  }
  else if (v4[180])
  {
    goto LABEL_81;
  }
  groupPhotoPathDigest = self->_groupPhotoPathDigest;
  if ((unint64_t)groupPhotoPathDigest | *((void *)v4 + 13)
    && !-[NSString isEqual:](groupPhotoPathDigest, "isEqual:"))
  {
    goto LABEL_81;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_81;
    }
  }
  $AAE2D17D8970CA381A5BFA23BDD4BC33 has = self->_has;
  int v17 = v4[180];
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v17 & 0x80000000) == 0) {
      goto LABEL_81;
    }
    if (self->_isPrimary)
    {
      if (!v4[177]) {
        goto LABEL_81;
      }
    }
    else if (v4[177])
    {
      goto LABEL_81;
    }
  }
  else if (v17 < 0)
  {
    goto LABEL_81;
  }
  attributionIdentifier = self->_attributionIdentifier;
  if ((unint64_t)attributionIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](attributionIdentifier, "isEqual:")) {
      goto LABEL_81;
    }
    *(unsigned char *)&$AAE2D17D8970CA381A5BFA23BDD4BC33 has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v4[180] & 0x20) == 0 || self->_rank != *((_DWORD *)v4 + 34)) {
      goto LABEL_81;
    }
  }
  else if ((v4[180] & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v4[180] & 4) == 0 || self->_score != *((double *)v4 + 3)) {
      goto LABEL_81;
    }
  }
  else if ((v4[180] & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v4[180] & 0x40) == 0) {
      goto LABEL_81;
    }
    if (self->_isConversationAutoDonating)
    {
      if (!v4[176]) {
        goto LABEL_81;
      }
    }
    else if (v4[176])
    {
      goto LABEL_81;
    }
  }
  else if ((v4[180] & 0x40) != 0)
  {
    goto LABEL_81;
  }
  originatingDeviceId = self->_originatingDeviceId;
  if (!((unint64_t)originatingDeviceId | *((void *)v4 + 16))) {
    goto LABEL_72;
  }
  if (!-[NSString isEqual:](originatingDeviceId, "isEqual:"))
  {
LABEL_81:
    char v22 = 0;
    goto LABEL_82;
  }
  *(unsigned char *)&$AAE2D17D8970CA381A5BFA23BDD4BC33 has = self->_has;
LABEL_72:
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v4[180] & 2) == 0 || self->_rankingSecondsSinceReferenceDate != *((double *)v4 + 2)) {
      goto LABEL_81;
    }
  }
  else if ((v4[180] & 2) != 0)
  {
    goto LABEL_81;
  }
  resolvedUrl = self->_resolvedUrl;
  if ((unint64_t)resolvedUrl | *((void *)v4 + 18)
    && !-[NSString isEqual:](resolvedUrl, "isEqual:"))
  {
    goto LABEL_81;
  }
  clientVariant = self->_clientVariant;
  if ((unint64_t)clientVariant | *((void *)v4 + 10)) {
    char v22 = -[NSString isEqual:](clientVariant, "isEqual:");
  }
  else {
    char v22 = 1;
  }
LABEL_82:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v46 = [(NSString *)self->_highlightIdentifier hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v45 = 2654435761 * self->_highlightType;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_11:
    unint64_t v44 = 0;
    goto LABEL_12;
  }
  uint64_t v45 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_3:
  double syndicationSecondsSinceReferenceDate = self->_syndicationSecondsSinceReferenceDate;
  double v4 = -syndicationSecondsSinceReferenceDate;
  if (syndicationSecondsSinceReferenceDate >= 0.0) {
    double v4 = self->_syndicationSecondsSinceReferenceDate;
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
  unint64_t v44 = v10;
LABEL_12:
  NSUInteger v43 = [(NSString *)self->_sourceBundleId hash];
  uint64_t v42 = [(NSMutableArray *)self->_applicationIdentifiers hash];
  NSUInteger v41 = [(NSString *)self->_resourceUrl hash];
  unint64_t v40 = [(BMPBSocialHighlightContact *)self->_sender hash];
  NSUInteger v39 = [(NSString *)self->_domainIdentifier hash];
  NSUInteger v38 = [(NSString *)self->_batchIdentifier hash];
  uint64_t v37 = [(NSMutableArray *)self->_calculatedFeatures hash];
  NSUInteger v36 = [(NSString *)self->_clientIdentifier hash];
  if (*(unsigned char *)&self->_has)
  {
    double contentCreationSecondsSinceReferenceDate = self->_contentCreationSecondsSinceReferenceDate;
    double v13 = -contentCreationSecondsSinceReferenceDate;
    if (contentCreationSecondsSinceReferenceDate >= 0.0) {
      double v13 = self->_contentCreationSecondsSinceReferenceDate;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  NSUInteger v35 = [(NSString *)self->_groupPhotoPathDigest hash];
  NSUInteger v34 = [(NSString *)self->_displayName hash];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v16 = 2654435761 * self->_isPrimary;
  }
  else {
    uint64_t v16 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_attributionIdentifier hash];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t v19 = 2654435761 * self->_rank;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_25;
    }
LABEL_30:
    unint64_t v24 = 0;
    goto LABEL_33;
  }
  uint64_t v19 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_30;
  }
LABEL_25:
  double score = self->_score;
  double v21 = -score;
  if (score >= 0.0) {
    double v21 = self->_score;
  }
  long double v22 = floor(v21 + 0.5);
  double v23 = (v21 - v22) * 1.84467441e19;
  unint64_t v24 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0) {
      v24 += (unint64_t)v23;
    }
  }
  else
  {
    v24 -= (unint64_t)fabs(v23);
  }
LABEL_33:
  if ((has & 0x40) != 0) {
    uint64_t v25 = 2654435761 * self->_isConversationAutoDonating;
  }
  else {
    uint64_t v25 = 0;
  }
  NSUInteger v26 = [(NSString *)self->_originatingDeviceId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double rankingSecondsSinceReferenceDate = self->_rankingSecondsSinceReferenceDate;
    double v29 = -rankingSecondsSinceReferenceDate;
    if (rankingSecondsSinceReferenceDate >= 0.0) {
      double v29 = self->_rankingSecondsSinceReferenceDate;
    }
    long double v30 = floor(v29 + 0.5);
    double v31 = (v29 - v30) * 1.84467441e19;
    unint64_t v27 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0) {
        v27 += (unint64_t)v31;
      }
    }
    else
    {
      v27 -= (unint64_t)fabs(v31);
    }
  }
  else
  {
    unint64_t v27 = 0;
  }
  NSUInteger v32 = v19 ^ v24 ^ v25 ^ v26 ^ v27 ^ [(NSString *)self->_resolvedUrl hash];
  return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v11 ^ v35 ^ v34 ^ v16 ^ v17 ^ v32 ^ [(NSString *)self->_clientVariant hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v4 = (char *)a3;
  if (*((void *)v4 + 14)) {
    -[BMPBRankableSocialHighlight setHighlightIdentifier:](self, "setHighlightIdentifier:");
  }
  char v5 = v4[180];
  if ((v5 & 0x10) != 0)
  {
    self->_uint64_t highlightType = *((_DWORD *)v4 + 30);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = v4[180];
  }
  if ((v5 & 8) != 0)
  {
    self->_double syndicationSecondsSinceReferenceDate = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 21)) {
    -[BMPBRankableSocialHighlight setSourceBundleId:](self, "setSourceBundleId:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = *((id *)v4 + 5);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        [(BMPBRankableSocialHighlight *)self addApplicationIdentifiers:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  if (*((void *)v4 + 19)) {
    -[BMPBRankableSocialHighlight setResourceUrl:](self, "setResourceUrl:");
  }
  sender = self->_sender;
  uint64_t v12 = *((void *)v4 + 20);
  if (sender)
  {
    if (v12) {
      -[BMPBSocialHighlightContact mergeFrom:](sender, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[BMPBRankableSocialHighlight setSender:](self, "setSender:");
  }
  if (*((void *)v4 + 12)) {
    -[BMPBRankableSocialHighlight setDomainIdentifier:](self, "setDomainIdentifier:");
  }
  if (*((void *)v4 + 7)) {
    -[BMPBRankableSocialHighlight setBatchIdentifier:](self, "setBatchIdentifier:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = *((id *)v4 + 8);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        -[BMPBRankableSocialHighlight addCalculatedFeatures:](self, "addCalculatedFeatures:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }

  if (*((void *)v4 + 9)) {
    -[BMPBRankableSocialHighlight setClientIdentifier:](self, "setClientIdentifier:");
  }
  if (v4[180])
  {
    self->_double contentCreationSecondsSinceReferenceDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 13)) {
    -[BMPBRankableSocialHighlight setGroupPhotoPathDigest:](self, "setGroupPhotoPathDigest:");
  }
  if (*((void *)v4 + 11)) {
    -[BMPBRankableSocialHighlight setDisplayName:](self, "setDisplayName:");
  }
  if (v4[180] < 0)
  {
    self->_isPrimary = v4[177];
    *(unsigned char *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 6)) {
    -[BMPBRankableSocialHighlight setAttributionIdentifier:](self, "setAttributionIdentifier:");
  }
  char v18 = v4[180];
  if ((v18 & 0x20) != 0)
  {
    self->_rank = *((_DWORD *)v4 + 34);
    *(unsigned char *)&self->_has |= 0x20u;
    char v18 = v4[180];
    if ((v18 & 4) == 0)
    {
LABEL_48:
      if ((v18 & 0x40) == 0) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
  }
  else if ((v4[180] & 4) == 0)
  {
    goto LABEL_48;
  }
  self->_double score = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((v4[180] & 0x40) != 0)
  {
LABEL_49:
    self->_isConversationAutoDonating = v4[176];
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_50:
  if (*((void *)v4 + 16)) {
    -[BMPBRankableSocialHighlight setOriginatingDeviceId:](self, "setOriginatingDeviceId:");
  }
  if ((v4[180] & 2) != 0)
  {
    self->_double rankingSecondsSinceReferenceDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 18)) {
    -[BMPBRankableSocialHighlight setResolvedUrl:](self, "setResolvedUrl:");
  }
  if (*((void *)v4 + 10)) {
    -[BMPBRankableSocialHighlight setClientVariant:](self, "setClientVariant:");
  }
}

- (NSString)highlightIdentifier
{
  return self->_highlightIdentifier;
}

- (void)setHighlightIdentifier:(id)a3
{
}

- (double)syndicationSecondsSinceReferenceDate
{
  return self->_syndicationSecondsSinceReferenceDate;
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (void)setSourceBundleId:(id)a3
{
}

- (NSMutableArray)applicationIdentifiers
{
  return self->_applicationIdentifiers;
}

- (void)setApplicationIdentifiers:(id)a3
{
}

- (NSString)resourceUrl
{
  return self->_resourceUrl;
}

- (void)setResourceUrl:(id)a3
{
}

- (BMPBSocialHighlightContact)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
}

- (NSString)batchIdentifier
{
  return self->_batchIdentifier;
}

- (void)setBatchIdentifier:(id)a3
{
}

- (NSMutableArray)calculatedFeatures
{
  return self->_calculatedFeatures;
}

- (void)setCalculatedFeatures:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (double)contentCreationSecondsSinceReferenceDate
{
  return self->_contentCreationSecondsSinceReferenceDate;
}

- (NSString)groupPhotoPathDigest
{
  return self->_groupPhotoPathDigest;
}

- (void)setGroupPhotoPathDigest:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (NSString)attributionIdentifier
{
  return self->_attributionIdentifier;
}

- (void)setAttributionIdentifier:(id)a3
{
}

- (unsigned)rank
{
  return self->_rank;
}

- (double)score
{
  return self->_score;
}

- (BOOL)isConversationAutoDonating
{
  return self->_isConversationAutoDonating;
}

- (NSString)originatingDeviceId
{
  return self->_originatingDeviceId;
}

- (void)setOriginatingDeviceId:(id)a3
{
}

- (double)rankingSecondsSinceReferenceDate
{
  return self->_rankingSecondsSinceReferenceDate;
}

- (NSString)resolvedUrl
{
  return self->_resolvedUrl;
}

- (void)setResolvedUrl:(id)a3
{
}

- (NSString)clientVariant
{
  return self->_clientVariant;
}

- (void)setClientVariant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_resourceUrl, 0);
  objc_storeStrong((id *)&self->_resolvedUrl, 0);
  objc_storeStrong((id *)&self->_originatingDeviceId, 0);
  objc_storeStrong((id *)&self->_highlightIdentifier, 0);
  objc_storeStrong((id *)&self->_groupPhotoPathDigest, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_clientVariant, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_calculatedFeatures, 0);
  objc_storeStrong((id *)&self->_batchIdentifier, 0);
  objc_storeStrong((id *)&self->_attributionIdentifier, 0);

  objc_storeStrong((id *)&self->_applicationIdentifiers, 0);
}

@end