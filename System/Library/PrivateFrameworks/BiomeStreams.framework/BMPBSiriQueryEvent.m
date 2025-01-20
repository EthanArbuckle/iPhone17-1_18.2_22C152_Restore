@interface BMPBSiriQueryEvent
+ (Class)resultsType;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasContentProtection;
- (BOOL)hasPersonaId;
- (BOOL)hasQuery;
- (BOOL)hasUniqueId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)results;
- (NSString)contentProtection;
- (NSString)personaId;
- (NSString)query;
- (NSString)uniqueId;
- (double)absoluteTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)resultsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)resultsCount;
- (void)addResults:(id)a3;
- (void)clearResults;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setContentProtection:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setPersonaId:(id)a3;
- (void)setQuery:(id)a3;
- (void)setResults:(id)a3;
- (void)setUniqueId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSiriQueryEvent

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

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (void)clearResults
{
}

- (void)addResults:(id)a3
{
  id v4 = a3;
  results = self->_results;
  id v8 = v4;
  if (!results)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_results;
    self->_results = v6;

    id v4 = v8;
    results = self->_results;
  }
  [(NSMutableArray *)results addObject:v4];
}

- (unint64_t)resultsCount
{
  return [(NSMutableArray *)self->_results count];
}

- (id)resultsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_results objectAtIndex:a3];
}

+ (Class)resultsType
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
  v8.super_class = (Class)BMPBSiriQueryEvent;
  id v4 = [(BMPBSiriQueryEvent *)&v8 description];
  v5 = [(BMPBSiriQueryEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v3 setObject:v4 forKey:@"absoluteTimestamp"];
  }
  query = self->_query;
  if (query) {
    [v3 setObject:query forKey:@"query"];
  }
  if ([(NSMutableArray *)self->_results count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_results, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = self->_results;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"results"];
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
  return BMPBSiriQueryEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_query) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_results;
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
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  id v10 = v4;
  if (self->_query) {
    objc_msgSend(v4, "setQuery:");
  }
  if ([(BMPBSiriQueryEvent *)self resultsCount])
  {
    [v10 clearResults];
    unint64_t v5 = [(BMPBSiriQueryEvent *)self resultsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BMPBSiriQueryEvent *)self resultsAtIndex:i];
        [v10 addResults:v8];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_query copyWithZone:a3];
  uint64_t v8 = (void *)v6[4];
  v6[4] = v7;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = self->_results;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v13), "copyWithZone:", a3, (void)v22);
        [v6 addResults:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(NSString *)self->_uniqueId copyWithZone:a3];
  v16 = (void *)v6[6];
  v6[6] = v15;

  uint64_t v17 = [(NSString *)self->_contentProtection copyWithZone:a3];
  long long v18 = (void *)v6[2];
  v6[2] = v17;

  uint64_t v19 = [(NSString *)self->_personaId copyWithZone:a3];
  long long v20 = (void *)v6[3];
  v6[3] = v19;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  query = self->_query;
  if ((unint64_t)query | *((void *)v4 + 4) && !-[NSString isEqual:](query, "isEqual:")) {
    goto LABEL_17;
  }
  results = self->_results;
  if ((unint64_t)results | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](results, "isEqual:")) {
      goto LABEL_17;
    }
  }
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  contentProtection = self->_contentProtection;
  if ((unint64_t)contentProtection | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](contentProtection, "isEqual:")) {
      goto LABEL_17;
    }
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((void *)v4 + 3)) {
    char v10 = -[NSString isEqual:](personaId, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
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
  NSUInteger v8 = [(NSString *)self->_query hash] ^ v3;
  uint64_t v9 = [(NSMutableArray *)self->_results hash];
  NSUInteger v10 = v8 ^ v9 ^ [(NSString *)self->_uniqueId hash];
  NSUInteger v11 = [(NSString *)self->_contentProtection hash];
  return v10 ^ v11 ^ [(NSString *)self->_personaId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (double *)a3;
  double v5 = (id *)v4;
  if ((_BYTE)v4[7])
  {
    self->_double absoluteTimestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4)) {
    -[BMPBSiriQueryEvent setQuery:](self, "setQuery:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[BMPBSiriQueryEvent addResults:](self, "addResults:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (v5[6]) {
    -[BMPBSiriQueryEvent setUniqueId:](self, "setUniqueId:");
  }
  if (v5[2]) {
    -[BMPBSiriQueryEvent setContentProtection:](self, "setContentProtection:");
  }
  if (v5[3]) {
    -[BMPBSiriQueryEvent setPersonaId:](self, "setPersonaId:");
  }
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
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
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_personaId, 0);

  objc_storeStrong((id *)&self->_contentProtection, 0);
}

@end