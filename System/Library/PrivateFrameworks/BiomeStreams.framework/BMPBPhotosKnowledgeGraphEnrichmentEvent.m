@interface BMPBPhotosKnowledgeGraphEnrichmentEvent
+ (Class)entitiesType;
+ (Class)locationsType;
+ (Class)topicsType;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasContentProtection;
- (BOOL)hasPersonaId;
- (BOOL)hasUniqueId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)entities;
- (NSMutableArray)locations;
- (NSMutableArray)topics;
- (NSString)contentProtection;
- (NSString)personaId;
- (NSString)uniqueId;
- (double)absoluteTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entitiesAtIndex:(unint64_t)a3;
- (id)locationsAtIndex:(unint64_t)a3;
- (id)topicsAtIndex:(unint64_t)a3;
- (unint64_t)entitiesCount;
- (unint64_t)hash;
- (unint64_t)locationsCount;
- (unint64_t)topicsCount;
- (void)addEntities:(id)a3;
- (void)addLocations:(id)a3;
- (void)addTopics:(id)a3;
- (void)clearEntities;
- (void)clearLocations;
- (void)clearTopics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setContentProtection:(id)a3;
- (void)setEntities:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setLocations:(id)a3;
- (void)setPersonaId:(id)a3;
- (void)setTopics:(id)a3;
- (void)setUniqueId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBPhotosKnowledgeGraphEnrichmentEvent

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

- (void)clearTopics
{
}

- (void)addTopics:(id)a3
{
  id v4 = a3;
  topics = self->_topics;
  id v8 = v4;
  if (!topics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_topics;
    self->_topics = v6;

    id v4 = v8;
    topics = self->_topics;
  }
  [(NSMutableArray *)topics addObject:v4];
}

- (unint64_t)topicsCount
{
  return [(NSMutableArray *)self->_topics count];
}

- (id)topicsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topics objectAtIndex:a3];
}

+ (Class)topicsType
{
  return (Class)objc_opt_class();
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

- (void)clearLocations
{
}

- (void)addLocations:(id)a3
{
  id v4 = a3;
  locations = self->_locations;
  id v8 = v4;
  if (!locations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_locations;
    self->_locations = v6;

    id v4 = v8;
    locations = self->_locations;
  }
  [(NSMutableArray *)locations addObject:v4];
}

- (unint64_t)locationsCount
{
  return [(NSMutableArray *)self->_locations count];
}

- (id)locationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_locations objectAtIndex:a3];
}

+ (Class)locationsType
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
  v8.super_class = (Class)BMPBPhotosKnowledgeGraphEnrichmentEvent;
  id v4 = [(BMPBPhotosKnowledgeGraphEnrichmentEvent *)&v8 description];
  v5 = [(BMPBPhotosKnowledgeGraphEnrichmentEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v3 setObject:v4 forKey:@"absoluteTimestamp"];
  }
  if ([(NSMutableArray *)self->_topics count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_topics, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v6 = self->_topics;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v39 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v38 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"topics"];
  }
  if ([(NSMutableArray *)self->_entities count])
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_entities, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v13 = self->_entities;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v34 + 1) + 8 * j) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"entities"];
  }
  if ([(NSMutableArray *)self->_locations count])
  {
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_locations, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v20 = self->_locations;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * k), "dictionaryRepresentation", (void)v30);
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKey:@"locations"];
  }
  uniqueId = self->_uniqueId;
  if (uniqueId) {
    [v3 setObject:uniqueId forKey:@"uniqueId"];
  }
  contentProtection = self->_contentProtection;
  if (contentProtection) {
    [v3 setObject:contentProtection forKey:@"contentProtection"];
  }
  personaId = self->_personaId;
  if (personaId) {
    [v3 setObject:personaId forKey:@"personaId"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBPhotosKnowledgeGraphEnrichmentEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = self->_topics;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = self->_entities;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_locations;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
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
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  id v18 = v4;
  if ([(BMPBPhotosKnowledgeGraphEnrichmentEvent *)self topicsCount])
  {
    [v18 clearTopics];
    unint64_t v5 = [(BMPBPhotosKnowledgeGraphEnrichmentEvent *)self topicsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BMPBPhotosKnowledgeGraphEnrichmentEvent *)self topicsAtIndex:i];
        [v18 addTopics:v8];
      }
    }
  }
  if ([(BMPBPhotosKnowledgeGraphEnrichmentEvent *)self entitiesCount])
  {
    [v18 clearEntities];
    unint64_t v9 = [(BMPBPhotosKnowledgeGraphEnrichmentEvent *)self entitiesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(BMPBPhotosKnowledgeGraphEnrichmentEvent *)self entitiesAtIndex:j];
        [v18 addEntities:v12];
      }
    }
  }
  if ([(BMPBPhotosKnowledgeGraphEnrichmentEvent *)self locationsCount])
  {
    [v18 clearLocations];
    unint64_t v13 = [(BMPBPhotosKnowledgeGraphEnrichmentEvent *)self locationsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(BMPBPhotosKnowledgeGraphEnrichmentEvent *)self locationsAtIndex:k];
        [v18 addLocations:v16];
      }
    }
  }
  if (self->_uniqueId) {
    objc_msgSend(v18, "setUniqueId:");
  }
  uint64_t v17 = v18;
  if (self->_contentProtection)
  {
    objc_msgSend(v18, "setContentProtection:");
    uint64_t v17 = v18;
  }
  if (self->_personaId)
  {
    objc_msgSend(v18, "setPersonaId:");
    uint64_t v17 = v18;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v7 = self->_topics;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addTopics:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v9);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  unint64_t v13 = self->_entities;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * v17) copyWithZone:a3];
        [v6 addEntities:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v15);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v19 = self->_locations;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v23), "copyWithZone:", a3, (void)v32);
        [v6 addLocations:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v21);
  }

  uint64_t v25 = [(NSString *)self->_uniqueId copyWithZone:a3];
  long long v26 = (void *)v6[7];
  v6[7] = v25;

  uint64_t v27 = [(NSString *)self->_contentProtection copyWithZone:a3];
  long long v28 = (void *)v6[2];
  v6[2] = v27;

  uint64_t v29 = [(NSString *)self->_personaId copyWithZone:a3];
  long long v30 = (void *)v6[5];
  v6[5] = v29;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  topics = self->_topics;
  if ((unint64_t)topics | *((void *)v4 + 6) && !-[NSMutableArray isEqual:](topics, "isEqual:")) {
    goto LABEL_19;
  }
  entities = self->_entities;
  if ((unint64_t)entities | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](entities, "isEqual:")) {
      goto LABEL_19;
    }
  }
  locations = self->_locations;
  if ((unint64_t)locations | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](locations, "isEqual:")) {
      goto LABEL_19;
    }
  }
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  contentProtection = self->_contentProtection;
  if ((unint64_t)contentProtection | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](contentProtection, "isEqual:")) {
      goto LABEL_19;
    }
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((void *)v4 + 5)) {
    char v11 = -[NSString isEqual:](personaId, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v5 = self->_absoluteTimestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  uint64_t v8 = [(NSMutableArray *)self->_topics hash] ^ v3;
  uint64_t v9 = [(NSMutableArray *)self->_entities hash];
  uint64_t v10 = v8 ^ v9 ^ [(NSMutableArray *)self->_locations hash];
  NSUInteger v11 = [(NSString *)self->_uniqueId hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_contentProtection hash];
  return v10 ^ v12 ^ [(NSString *)self->_personaId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = (id *)v4;
  if (*((unsigned char *)v4 + 64))
  {
    self->_double absoluteTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = *((id *)v4 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        [(BMPBPhotosKnowledgeGraphEnrichmentEvent *)self addTopics:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v5[3];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [(BMPBPhotosKnowledgeGraphEnrichmentEvent *)self addEntities:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = v5[4];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[BMPBPhotosKnowledgeGraphEnrichmentEvent addLocations:](self, "addLocations:", *(void *)(*((void *)&v21 + 1) + 8 * k), (void)v21);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }

  if (v5[7]) {
    -[BMPBPhotosKnowledgeGraphEnrichmentEvent setUniqueId:](self, "setUniqueId:");
  }
  if (v5[2]) {
    -[BMPBPhotosKnowledgeGraphEnrichmentEvent setContentProtection:](self, "setContentProtection:");
  }
  if (v5[5]) {
    -[BMPBPhotosKnowledgeGraphEnrichmentEvent setPersonaId:](self, "setPersonaId:");
  }
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSMutableArray)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
}

- (NSMutableArray)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
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
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_entities, 0);

  objc_storeStrong((id *)&self->_contentProtection, 0);
}

@end