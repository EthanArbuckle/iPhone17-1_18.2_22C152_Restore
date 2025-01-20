@interface ATXPBAction
+ (Class)heuristicMetadataType;
+ (Class)predictableParameterCombinationsType;
- (ATXPBAVRouteInfo)routeInfo;
- (ATXPBActionCriteria)criteria;
- (BOOL)hasActionType;
- (BOOL)hasActivityString;
- (BOOL)hasBundleId;
- (BOOL)hasCachedHash;
- (BOOL)hasContentAttributeSet;
- (BOOL)hasCriteria;
- (BOOL)hasHeuristic;
- (BOOL)hasIntent;
- (BOOL)hasIsFutureMedia;
- (BOOL)hasItemIdentifier;
- (BOOL)hasLanguageCode;
- (BOOL)hasRouteInfo;
- (BOOL)hasSubtitle;
- (BOOL)hasTitle;
- (BOOL)hasUserActivityHash;
- (BOOL)hasUserActivityProxy;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFutureMedia;
- (BOOL)readFrom:(id)a3;
- (NSData)contentAttributeSet;
- (NSData)intent;
- (NSData)userActivityProxy;
- (NSMutableArray)heuristicMetadatas;
- (NSMutableArray)predictableParameterCombinations;
- (NSString)activityString;
- (NSString)bundleId;
- (NSString)heuristic;
- (NSString)itemIdentifier;
- (NSString)languageCode;
- (NSString)subtitle;
- (NSString)title;
- (NSString)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)heuristicMetadataAtIndex:(unint64_t)a3;
- (id)predictableParameterCombinationsAtIndex:(unint64_t)a3;
- (int64_t)actionType;
- (int64_t)userActivityHash;
- (unint64_t)cachedHash;
- (unint64_t)hash;
- (unint64_t)heuristicMetadatasCount;
- (unint64_t)predictableParameterCombinationsCount;
- (void)addHeuristicMetadata:(id)a3;
- (void)addPredictableParameterCombinations:(id)a3;
- (void)clearHeuristicMetadatas;
- (void)clearPredictableParameterCombinations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionType:(int64_t)a3;
- (void)setActivityString:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setCachedHash:(unint64_t)a3;
- (void)setContentAttributeSet:(id)a3;
- (void)setCriteria:(id)a3;
- (void)setHasActionType:(BOOL)a3;
- (void)setHasCachedHash:(BOOL)a3;
- (void)setHasIsFutureMedia:(BOOL)a3;
- (void)setHasUserActivityHash:(BOOL)a3;
- (void)setHeuristic:(id)a3;
- (void)setHeuristicMetadatas:(id)a3;
- (void)setIntent:(id)a3;
- (void)setIsFutureMedia:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setPredictableParameterCombinations:(id)a3;
- (void)setRouteInfo:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserActivityHash:(int64_t)a3;
- (void)setUserActivityProxy:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBAction

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setActionType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_actionType = a3;
}

- (void)setHasActionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasIntent
{
  return self->_intent != 0;
}

- (BOOL)hasHeuristic
{
  return self->_heuristic != 0;
}

- (void)setIsFutureMedia:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isFutureMedia = a3;
}

- (void)setHasIsFutureMedia:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsFutureMedia
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (void)setUserActivityHash:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_userActivityHash = a3;
}

- (void)setHasUserActivityHash:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUserActivityHash
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasActivityString
{
  return self->_activityString != 0;
}

- (BOOL)hasUserActivityProxy
{
  return self->_userActivityProxy != 0;
}

- (BOOL)hasItemIdentifier
{
  return self->_itemIdentifier != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (BOOL)hasContentAttributeSet
{
  return self->_contentAttributeSet != 0;
}

- (BOOL)hasCriteria
{
  return self->_criteria != 0;
}

- (BOOL)hasRouteInfo
{
  return self->_routeInfo != 0;
}

- (void)clearHeuristicMetadatas
{
}

- (void)addHeuristicMetadata:(id)a3
{
  id v4 = a3;
  heuristicMetadatas = self->_heuristicMetadatas;
  id v8 = v4;
  if (!heuristicMetadatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_heuristicMetadatas;
    self->_heuristicMetadatas = v6;

    id v4 = v8;
    heuristicMetadatas = self->_heuristicMetadatas;
  }
  [(NSMutableArray *)heuristicMetadatas addObject:v4];
}

- (unint64_t)heuristicMetadatasCount
{
  return [(NSMutableArray *)self->_heuristicMetadatas count];
}

- (id)heuristicMetadataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_heuristicMetadatas objectAtIndex:a3];
}

+ (Class)heuristicMetadataType
{
  return (Class)objc_opt_class();
}

- (void)setCachedHash:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cachedHash = a3;
}

- (void)setHasCachedHash:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCachedHash
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearPredictableParameterCombinations
{
}

- (void)addPredictableParameterCombinations:(id)a3
{
  id v4 = a3;
  predictableParameterCombinations = self->_predictableParameterCombinations;
  id v8 = v4;
  if (!predictableParameterCombinations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_predictableParameterCombinations;
    self->_predictableParameterCombinations = v6;

    id v4 = v8;
    predictableParameterCombinations = self->_predictableParameterCombinations;
  }
  [(NSMutableArray *)predictableParameterCombinations addObject:v4];
}

- (unint64_t)predictableParameterCombinationsCount
{
  return [(NSMutableArray *)self->_predictableParameterCombinations count];
}

- (id)predictableParameterCombinationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_predictableParameterCombinations objectAtIndex:a3];
}

+ (Class)predictableParameterCombinationsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBAction;
  id v4 = [(ATXPBAction *)&v8 description];
  v5 = [(ATXPBAction *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_actionType];
    [v4 setObject:v6 forKey:@"actionType"];
  }
  intent = self->_intent;
  if (intent) {
    [v4 setObject:intent forKey:@"intent"];
  }
  heuristic = self->_heuristic;
  if (heuristic) {
    [v4 setObject:heuristic forKey:@"heuristic"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_isFutureMedia];
    [v4 setObject:v9 forKey:@"isFutureMedia"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v4 setObject:subtitle forKey:@"subtitle"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v12 = [NSNumber numberWithLongLong:self->_userActivityHash];
    [v4 setObject:v12 forKey:@"userActivityHash"];
  }
  activityString = self->_activityString;
  if (activityString) {
    [v4 setObject:activityString forKey:@"activityString"];
  }
  userActivityProxy = self->_userActivityProxy;
  if (userActivityProxy) {
    [v4 setObject:userActivityProxy forKey:@"userActivityProxy"];
  }
  itemIdentifier = self->_itemIdentifier;
  if (itemIdentifier) {
    [v4 setObject:itemIdentifier forKey:@"itemIdentifier"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v4 setObject:uuid forKey:@"uuid"];
  }
  languageCode = self->_languageCode;
  if (languageCode) {
    [v4 setObject:languageCode forKey:@"languageCode"];
  }
  contentAttributeSet = self->_contentAttributeSet;
  if (contentAttributeSet) {
    [v4 setObject:contentAttributeSet forKey:@"contentAttributeSet"];
  }
  criteria = self->_criteria;
  if (criteria)
  {
    v20 = [(ATXPBActionCriteria *)criteria dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"criteria"];
  }
  routeInfo = self->_routeInfo;
  if (routeInfo)
  {
    v22 = [(ATXPBAVRouteInfo *)routeInfo dictionaryRepresentation];
    [v4 setObject:v22 forKey:@"routeInfo"];
  }
  if ([(NSMutableArray *)self->_heuristicMetadatas count])
  {
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_heuristicMetadatas, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v24 = self->_heuristicMetadatas;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v44 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [*(id *)(*((void *)&v43 + 1) + 8 * i) dictionaryRepresentation];
          [v23 addObject:v29];
        }
        uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v26);
    }

    [v4 setObject:v23 forKey:@"heuristicMetadata"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v30 = [NSNumber numberWithUnsignedLongLong:self->_cachedHash];
    [v4 setObject:v30 forKey:@"cachedHash"];
  }
  if ([(NSMutableArray *)self->_predictableParameterCombinations count])
  {
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_predictableParameterCombinations, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v32 = self->_predictableParameterCombinations;
    uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v40 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * j), "dictionaryRepresentation", (void)v39);
          [v31 addObject:v37];
        }
        uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v34);
    }

    [v4 setObject:v31 forKey:@"predictableParameterCombinations"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_bundleId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_intent) {
    PBDataWriterWriteDataField();
  }
  if (self->_heuristic) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_activityString) {
    PBDataWriterWriteStringField();
  }
  if (self->_userActivityProxy) {
    PBDataWriterWriteDataField();
  }
  if (self->_itemIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_languageCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentAttributeSet) {
    PBDataWriterWriteDataField();
  }
  if (self->_criteria) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_routeInfo) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_heuristicMetadatas;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteFixed64Field();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_predictableParameterCombinations;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    id v4 = v13;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_actionType;
    *((unsigned char *)v4 + 156) |= 1u;
  }
  if (self->_intent)
  {
    objc_msgSend(v13, "setIntent:");
    id v4 = v13;
  }
  if (self->_heuristic)
  {
    objc_msgSend(v13, "setHeuristic:");
    id v4 = v13;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v4 + 152) = self->_isFutureMedia;
    *((unsigned char *)v4 + 156) |= 8u;
  }
  if (self->_title)
  {
    objc_msgSend(v13, "setTitle:");
    id v4 = v13;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v13, "setSubtitle:");
    id v4 = v13;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_userActivityHash;
    *((unsigned char *)v4 + 156) |= 4u;
  }
  if (self->_activityString) {
    objc_msgSend(v13, "setActivityString:");
  }
  if (self->_userActivityProxy) {
    objc_msgSend(v13, "setUserActivityProxy:");
  }
  if (self->_itemIdentifier) {
    objc_msgSend(v13, "setItemIdentifier:");
  }
  if (self->_uuid) {
    objc_msgSend(v13, "setUuid:");
  }
  if (self->_languageCode) {
    objc_msgSend(v13, "setLanguageCode:");
  }
  if (self->_contentAttributeSet) {
    objc_msgSend(v13, "setContentAttributeSet:");
  }
  if (self->_criteria) {
    objc_msgSend(v13, "setCriteria:");
  }
  if (self->_routeInfo) {
    objc_msgSend(v13, "setRouteInfo:");
  }
  if ([(ATXPBAction *)self heuristicMetadatasCount])
  {
    [v13 clearHeuristicMetadatas];
    unint64_t v5 = [(ATXPBAction *)self heuristicMetadatasCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ATXPBAction *)self heuristicMetadataAtIndex:i];
        [v13 addHeuristicMetadata:v8];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v13 + 2) = self->_cachedHash;
    *((unsigned char *)v13 + 156) |= 2u;
  }
  if ([(ATXPBAction *)self predictableParameterCombinationsCount])
  {
    [v13 clearPredictableParameterCombinations];
    unint64_t v9 = [(ATXPBAction *)self predictableParameterCombinationsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(ATXPBAction *)self predictableParameterCombinationsAtIndex:j];
        [v13 addPredictableParameterCombinations:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_bundleId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_actionType;
    *(unsigned char *)(v5 + 156) |= 1u;
  }
  uint64_t v8 = [(NSData *)self->_intent copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v8;

  uint64_t v10 = [(NSString *)self->_heuristic copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v10;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v5 + 152) = self->_isFutureMedia;
    *(unsigned char *)(v5 + 156) |= 8u;
  }
  uint64_t v12 = [(NSString *)self->_title copyWithZone:a3];
  id v13 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v12;

  uint64_t v14 = [(NSString *)self->_subtitle copyWithZone:a3];
  long long v15 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v14;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_userActivityHash;
    *(unsigned char *)(v5 + 156) |= 4u;
  }
  uint64_t v16 = [(NSString *)self->_activityString copyWithZone:a3];
  long long v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  uint64_t v18 = [(NSData *)self->_userActivityProxy copyWithZone:a3];
  long long v19 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v18;

  uint64_t v20 = [(NSString *)self->_itemIdentifier copyWithZone:a3];
  long long v21 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v20;

  uint64_t v22 = [(NSString *)self->_uuid copyWithZone:a3];
  v23 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v22;

  uint64_t v24 = [(NSString *)self->_languageCode copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v24;

  uint64_t v26 = [(NSData *)self->_contentAttributeSet copyWithZone:a3];
  uint64_t v27 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v26;

  id v28 = [(ATXPBActionCriteria *)self->_criteria copyWithZone:a3];
  v29 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v28;

  id v30 = [(ATXPBAVRouteInfo *)self->_routeInfo copyWithZone:a3];
  v31 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v30;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v32 = self->_heuristicMetadatas;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v50;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v50 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * v36) copyWithZone:a3];
        [(id)v5 addHeuristicMetadata:v37];

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v34);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_cachedHash;
    *(unsigned char *)(v5 + 156) |= 2u;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v38 = self->_predictableParameterCombinations;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v46;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void *)v46 != v41) {
          objc_enumerationMutation(v38);
        }
        long long v43 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * v42), "copyWithZone:", a3, (void)v45);
        [(id)v5 addPredictableParameterCombinations:v43];

        ++v42;
      }
      while (v40 != v42);
      uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v40);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_55;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_55;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 156) & 1) == 0 || self->_actionType != *((void *)v4 + 1)) {
      goto LABEL_55;
    }
  }
  else if (*((unsigned char *)v4 + 156))
  {
    goto LABEL_55;
  }
  intent = self->_intent;
  if ((unint64_t)intent | *((void *)v4 + 10) && !-[NSData isEqual:](intent, "isEqual:")) {
    goto LABEL_55;
  }
  heuristic = self->_heuristic;
  if ((unint64_t)heuristic | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](heuristic, "isEqual:")) {
      goto LABEL_55;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 156) & 8) != 0)
    {
      if (self->_isFutureMedia)
      {
        if (!*((unsigned char *)v4 + 152)) {
          goto LABEL_55;
        }
        goto LABEL_21;
      }
      if (!*((unsigned char *)v4 + 152)) {
        goto LABEL_21;
      }
    }
LABEL_55:
    char v20 = 0;
    goto LABEL_56;
  }
  if ((*((unsigned char *)v4 + 156) & 8) != 0) {
    goto LABEL_55;
  }
LABEL_21:
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 16) && !-[NSString isEqual:](title, "isEqual:")) {
    goto LABEL_55;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:")) {
      goto LABEL_55;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 156) & 4) == 0 || self->_userActivityHash != *((void *)v4 + 3)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 156) & 4) != 0)
  {
    goto LABEL_55;
  }
  activityString = self->_activityString;
  if ((unint64_t)activityString | *((void *)v4 + 4)
    && !-[NSString isEqual:](activityString, "isEqual:"))
  {
    goto LABEL_55;
  }
  userActivityProxy = self->_userActivityProxy;
  if ((unint64_t)userActivityProxy | *((void *)v4 + 17))
  {
    if (!-[NSData isEqual:](userActivityProxy, "isEqual:")) {
      goto LABEL_55;
    }
  }
  itemIdentifier = self->_itemIdentifier;
  if ((unint64_t)itemIdentifier | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](itemIdentifier, "isEqual:")) {
      goto LABEL_55;
    }
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_55;
    }
  }
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](languageCode, "isEqual:")) {
      goto LABEL_55;
    }
  }
  contentAttributeSet = self->_contentAttributeSet;
  if ((unint64_t)contentAttributeSet | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](contentAttributeSet, "isEqual:")) {
      goto LABEL_55;
    }
  }
  criteria = self->_criteria;
  if ((unint64_t)criteria | *((void *)v4 + 7))
  {
    if (!-[ATXPBActionCriteria isEqual:](criteria, "isEqual:")) {
      goto LABEL_55;
    }
  }
  routeInfo = self->_routeInfo;
  if ((unint64_t)routeInfo | *((void *)v4 + 14))
  {
    if (!-[ATXPBAVRouteInfo isEqual:](routeInfo, "isEqual:")) {
      goto LABEL_55;
    }
  }
  heuristicMetadatas = self->_heuristicMetadatas;
  if ((unint64_t)heuristicMetadatas | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](heuristicMetadatas, "isEqual:")) {
      goto LABEL_55;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 156) & 2) == 0 || self->_cachedHash != *((void *)v4 + 2)) {
      goto LABEL_55;
    }
  }
  else if ((*((unsigned char *)v4 + 156) & 2) != 0)
  {
    goto LABEL_55;
  }
  predictableParameterCombinations = self->_predictableParameterCombinations;
  if ((unint64_t)predictableParameterCombinations | *((void *)v4 + 13)) {
    char v20 = -[NSMutableArray isEqual:](predictableParameterCombinations, "isEqual:");
  }
  else {
    char v20 = 1;
  }
LABEL_56:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v22 = [(NSString *)self->_bundleId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v21 = 2654435761 * self->_actionType;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v20 = [(NSData *)self->_intent hash];
  NSUInteger v19 = [(NSString *)self->_heuristic hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v18 = 2654435761 * self->_isFutureMedia;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_title hash];
  NSUInteger v16 = [(NSString *)self->_subtitle hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    NSUInteger v3 = [(NSString *)self->_activityString hash];
  }
  else {
    NSUInteger v3 = [(NSString *)self->_activityString hash];
  }
  NSUInteger v4 = v3;
  uint64_t v5 = [(NSData *)self->_userActivityProxy hash];
  NSUInteger v6 = [(NSString *)self->_itemIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_uuid hash];
  NSUInteger v8 = [(NSString *)self->_languageCode hash];
  uint64_t v9 = [(NSData *)self->_contentAttributeSet hash];
  unint64_t v10 = [(ATXPBActionCriteria *)self->_criteria hash];
  unint64_t v11 = [(ATXPBAVRouteInfo *)self->_routeInfo hash];
  uint64_t v12 = [(NSMutableArray *)self->_heuristicMetadatas hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v13 = 2654435761u * self->_cachedHash;
  }
  else {
    unint64_t v13 = 0;
  }
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(NSMutableArray *)self->_predictableParameterCombinations hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[ATXPBAction setBundleId:](self, "setBundleId:");
  }
  if (*((unsigned char *)v4 + 156))
  {
    self->_actionType = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 10)) {
    -[ATXPBAction setIntent:](self, "setIntent:");
  }
  if (*((void *)v4 + 8)) {
    -[ATXPBAction setHeuristic:](self, "setHeuristic:");
  }
  if ((*((unsigned char *)v4 + 156) & 8) != 0)
  {
    self->_isFutureMedia = *((unsigned char *)v4 + 152);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 16)) {
    -[ATXPBAction setTitle:](self, "setTitle:");
  }
  if (*((void *)v4 + 15)) {
    -[ATXPBAction setSubtitle:](self, "setSubtitle:");
  }
  if ((*((unsigned char *)v4 + 156) & 4) != 0)
  {
    self->_userActivityHash = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 4)) {
    -[ATXPBAction setActivityString:](self, "setActivityString:");
  }
  if (*((void *)v4 + 17)) {
    -[ATXPBAction setUserActivityProxy:](self, "setUserActivityProxy:");
  }
  if (*((void *)v4 + 11)) {
    -[ATXPBAction setItemIdentifier:](self, "setItemIdentifier:");
  }
  if (*((void *)v4 + 18)) {
    -[ATXPBAction setUuid:](self, "setUuid:");
  }
  if (*((void *)v4 + 12)) {
    -[ATXPBAction setLanguageCode:](self, "setLanguageCode:");
  }
  if (*((void *)v4 + 6)) {
    -[ATXPBAction setContentAttributeSet:](self, "setContentAttributeSet:");
  }
  criteria = self->_criteria;
  uint64_t v6 = *((void *)v4 + 7);
  if (criteria)
  {
    if (v6) {
      -[ATXPBActionCriteria mergeFrom:](criteria, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ATXPBAction setCriteria:](self, "setCriteria:");
  }
  routeInfo = self->_routeInfo;
  uint64_t v8 = *((void *)v4 + 14);
  if (routeInfo)
  {
    if (v8) {
      -[ATXPBAVRouteInfo mergeFrom:](routeInfo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    [(ATXPBAction *)self setRouteInfo:"setRouteInfo:"];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = *((id *)v4 + 9);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        [(ATXPBAction *)self addHeuristicMetadata:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }

  if ((*((unsigned char *)v4 + 156) & 2) != 0)
  {
    self->_cachedHash = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = *((id *)v4 + 13);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[ATXPBAction addPredictableParameterCombinations:](self, "addPredictableParameterCombinations:", *(void *)(*((void *)&v19 + 1) + 8 * j), (void)v19);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (NSData)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
}

- (NSString)heuristic
{
  return self->_heuristic;
}

- (void)setHeuristic:(id)a3
{
}

- (BOOL)isFutureMedia
{
  return self->_isFutureMedia;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (int64_t)userActivityHash
{
  return self->_userActivityHash;
}

- (NSString)activityString
{
  return self->_activityString;
}

- (void)setActivityString:(id)a3
{
}

- (NSData)userActivityProxy
{
  return self->_userActivityProxy;
}

- (void)setUserActivityProxy:(id)a3
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSData)contentAttributeSet
{
  return self->_contentAttributeSet;
}

- (void)setContentAttributeSet:(id)a3
{
}

- (ATXPBActionCriteria)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
}

- (ATXPBAVRouteInfo)routeInfo
{
  return self->_routeInfo;
}

- (void)setRouteInfo:(id)a3
{
}

- (NSMutableArray)heuristicMetadatas
{
  return self->_heuristicMetadatas;
}

- (void)setHeuristicMetadatas:(id)a3
{
}

- (unint64_t)cachedHash
{
  return self->_cachedHash;
}

- (NSMutableArray)predictableParameterCombinations
{
  return self->_predictableParameterCombinations;
}

- (void)setPredictableParameterCombinations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_userActivityProxy, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_routeInfo, 0);
  objc_storeStrong((id *)&self->_predictableParameterCombinations, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_heuristicMetadatas, 0);
  objc_storeStrong((id *)&self->_heuristic, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_contentAttributeSet, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);

  objc_storeStrong((id *)&self->_activityString, 0);
}

@end