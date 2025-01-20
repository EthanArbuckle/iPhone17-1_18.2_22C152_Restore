@interface BMPBParsecSearchEngagementEvent
+ (Class)entitiesType;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasCompletedQuery;
- (BOOL)hasContentProtection;
- (BOOL)hasDomainId;
- (BOOL)hasPersonaId;
- (BOOL)hasResultId;
- (BOOL)hasUniqueId;
- (BOOL)hasUserInput;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)entities;
- (NSString)completedQuery;
- (NSString)contentProtection;
- (NSString)domainId;
- (NSString)personaId;
- (NSString)resultId;
- (NSString)uniqueId;
- (NSString)userInput;
- (double)absoluteTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entitiesAtIndex:(unint64_t)a3;
- (unint64_t)entitiesCount;
- (unint64_t)hash;
- (void)addEntities:(id)a3;
- (void)clearEntities;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setCompletedQuery:(id)a3;
- (void)setContentProtection:(id)a3;
- (void)setDomainId:(id)a3;
- (void)setEntities:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setPersonaId:(id)a3;
- (void)setResultId:(id)a3;
- (void)setUniqueId:(id)a3;
- (void)setUserInput:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBParsecSearchEngagementEvent

- (BOOL)hasResultId
{
  return self->_resultId != 0;
}

- (BOOL)hasDomainId
{
  return self->_domainId != 0;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasUserInput
{
  return self->_userInput != 0;
}

- (BOOL)hasCompletedQuery
{
  return self->_completedQuery != 0;
}

- (void)clearEntities
{
}

- (void)addEntities:(id)a3
{
  id v4 = a3;
  entities = self->_entities;
  id v8 = v4;
  if (!entities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_entities;
    self->_entities = v6;

    id v4 = v8;
    entities = self->_entities;
  }
  [(NSMutableArray *)entities addObject:v4];
}

- (unint64_t)entitiesCount
{
  return [(NSMutableArray *)self->_entities count];
}

- (id)entitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_entities objectAtIndex:a3];
}

+ (Class)entitiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (BOOL)hasContentProtection
{
  return self->_contentProtection != 0;
}

- (BOOL)hasPersonaId
{
  return self->_personaId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBParsecSearchEngagementEvent;
  id v4 = [(BMPBParsecSearchEngagementEvent *)&v8 description];
  v5 = [(BMPBParsecSearchEngagementEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  resultId = self->_resultId;
  if (resultId) {
    [v3 setObject:resultId forKey:@"resultId"];
  }
  domainId = self->_domainId;
  if (domainId) {
    [v4 setObject:domainId forKey:@"domainId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v4 setObject:v7 forKey:@"absoluteTimestamp"];
  }
  userInput = self->_userInput;
  if (userInput) {
    [v4 setObject:userInput forKey:@"userInput"];
  }
  completedQuery = self->_completedQuery;
  if (completedQuery) {
    [v4 setObject:completedQuery forKey:@"completedQuery"];
  }
  if ([(NSMutableArray *)self->_entities count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_entities, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v11 = self->_entities;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (void)v21);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"entities"];
  }
  uniqueId = self->_uniqueId;
  if (uniqueId) {
    [v4 setObject:uniqueId forKey:@"uniqueId"];
  }
  contentProtection = self->_contentProtection;
  if (contentProtection) {
    [v4 setObject:contentProtection forKey:@"contentProtection"];
  }
  personaId = self->_personaId;
  if (personaId) {
    [v4 setObject:personaId forKey:@"personaId"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBParsecSearchEngagementEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_resultId) {
    PBDataWriterWriteStringField();
  }
  if (self->_domainId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_userInput) {
    PBDataWriterWriteStringField();
  }
  if (self->_completedQuery) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_entities;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_uniqueId) {
    PBDataWriterWriteStringField();
  }
  if (self->_contentProtection) {
    PBDataWriterWriteStringField();
  }
  if (self->_personaId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_resultId)
  {
    objc_msgSend(v4, "setResultId:");
    id v4 = v10;
  }
  if (self->_domainId)
  {
    objc_msgSend(v10, "setDomainId:");
    id v4 = v10;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 80) |= 1u;
  }
  if (self->_userInput) {
    objc_msgSend(v10, "setUserInput:");
  }
  if (self->_completedQuery) {
    objc_msgSend(v10, "setCompletedQuery:");
  }
  if ([(BMPBParsecSearchEngagementEvent *)self entitiesCount])
  {
    [v10 clearEntities];
    unint64_t v5 = [(BMPBParsecSearchEngagementEvent *)self entitiesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BMPBParsecSearchEngagementEvent *)self entitiesAtIndex:i];
        [v10 addEntities:v8];
      }
    }
  }
  if (self->_uniqueId) {
    objc_msgSend(v10, "setUniqueId:");
  }
  uint64_t v9 = v10;
  if (self->_contentProtection)
  {
    objc_msgSend(v10, "setContentProtection:");
    uint64_t v9 = v10;
  }
  if (self->_personaId)
  {
    objc_msgSend(v10, "setPersonaId:");
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_resultId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_domainId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_userInput copyWithZone:a3];
  long long v11 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v10;

  uint64_t v12 = [(NSString *)self->_completedQuery copyWithZone:a3];
  long long v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v14 = self->_entities;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v18), "copyWithZone:", a3, (void)v27);
        [(id)v5 addEntities:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSString *)self->_uniqueId copyWithZone:a3];
  long long v21 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v20;

  uint64_t v22 = [(NSString *)self->_contentProtection copyWithZone:a3];
  long long v23 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v22;

  uint64_t v24 = [(NSString *)self->_personaId copyWithZone:a3];
  v25 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v24;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  resultId = self->_resultId;
  if ((unint64_t)resultId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](resultId, "isEqual:")) {
      goto LABEL_23;
    }
  }
  domainId = self->_domainId;
  if ((unint64_t)domainId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](domainId, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_23:
    char v13 = 0;
    goto LABEL_24;
  }
  userInput = self->_userInput;
  if ((unint64_t)userInput | *((void *)v4 + 9) && !-[NSString isEqual:](userInput, "isEqual:")) {
    goto LABEL_23;
  }
  completedQuery = self->_completedQuery;
  if ((unint64_t)completedQuery | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](completedQuery, "isEqual:")) {
      goto LABEL_23;
    }
  }
  entities = self->_entities;
  if ((unint64_t)entities | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](entities, "isEqual:")) {
      goto LABEL_23;
    }
  }
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:")) {
      goto LABEL_23;
    }
  }
  contentProtection = self->_contentProtection;
  if ((unint64_t)contentProtection | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](contentProtection, "isEqual:")) {
      goto LABEL_23;
    }
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((void *)v4 + 6)) {
    char v13 = -[NSString isEqual:](personaId, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_24:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_resultId hash];
  NSUInteger v4 = [(NSString *)self->_domainId hash];
  if (*(unsigned char *)&self->_has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v7 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v7 = self->_absoluteTimestamp;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  NSUInteger v10 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_userInput hash];
  NSUInteger v11 = [(NSString *)self->_completedQuery hash];
  uint64_t v12 = v11 ^ [(NSMutableArray *)self->_entities hash];
  NSUInteger v13 = v10 ^ v12 ^ [(NSString *)self->_uniqueId hash];
  NSUInteger v14 = [(NSString *)self->_contentProtection hash];
  return v13 ^ v14 ^ [(NSString *)self->_personaId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 7)) {
    -[BMPBParsecSearchEngagementEvent setResultId:](self, "setResultId:");
  }
  if (*((void *)v4 + 4)) {
    -[BMPBParsecSearchEngagementEvent setDomainId:](self, "setDomainId:");
  }
  if (*((unsigned char *)v4 + 80))
  {
    self->_double absoluteTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 9)) {
    -[BMPBParsecSearchEngagementEvent setUserInput:](self, "setUserInput:");
  }
  if (*((void *)v4 + 2)) {
    -[BMPBParsecSearchEngagementEvent setCompletedQuery:](self, "setCompletedQuery:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[BMPBParsecSearchEngagementEvent addEntities:](self, "addEntities:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 8)) {
    -[BMPBParsecSearchEngagementEvent setUniqueId:](self, "setUniqueId:");
  }
  if (*((void *)v4 + 3)) {
    -[BMPBParsecSearchEngagementEvent setContentProtection:](self, "setContentProtection:");
  }
  if (*((void *)v4 + 6)) {
    -[BMPBParsecSearchEngagementEvent setPersonaId:](self, "setPersonaId:");
  }
}

- (NSString)resultId
{
  return self->_resultId;
}

- (void)setResultId:(id)a3
{
}

- (NSString)domainId
{
  return self->_domainId;
}

- (void)setDomainId:(id)a3
{
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)userInput
{
  return self->_userInput;
}

- (void)setUserInput:(id)a3
{
}

- (NSString)completedQuery
{
  return self->_completedQuery;
}

- (void)setCompletedQuery:(id)a3
{
}

- (NSMutableArray)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void)setContentProtection:(id)a3
{
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void)setPersonaId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInput, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);

  objc_storeStrong((id *)&self->_completedQuery, 0);
}

@end