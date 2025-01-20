@interface GEOCondition
+ (BOOL)isValid:(id)a3;
+ (Class)conditionType;
- (BOOL)hasExpirationTime;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCondition)initWithDictionary:(id)a3;
- (GEOCondition)initWithJSON:(id)a3;
- (NSDate)expirationDate;
- (NSMutableArray)conditions;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)conditionAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (int64_t)conditionType;
- (unint64_t)conditionsCount;
- (unint64_t)hash;
- (unsigned)expirationTime;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addCondition:(id)a3;
- (void)clearConditions;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConditions:(id)a3;
- (void)setExpirationTime:(unsigned int)a3;
- (void)setHasExpirationTime:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCondition

- (int)type
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53DFFC0[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AND"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NOT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EXPIRATION_TIME"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TOKEN_SUBSTITUTION_FAILURE_FALLBACK"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_expirationTime = a3;
}

- (void)setHasExpirationTime:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasExpirationTime
{
  return *(unsigned char *)&self->_flags & 1;
}

- (NSMutableArray)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
}

- (void)clearConditions
{
}

- (void)addCondition:(id)a3
{
  id v4 = a3;
  conditions = self->_conditions;
  id v8 = v4;
  if (!conditions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_conditions;
    self->_conditions = v6;

    id v4 = v8;
    conditions = self->_conditions;
  }
  [(NSMutableArray *)conditions addObject:v4];
}

- (unint64_t)conditionsCount
{
  return [(NSMutableArray *)self->_conditions count];
}

- (id)conditionAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_conditions objectAtIndex:a3];
}

+ (Class)conditionType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCondition;
  id v4 = [(GEOCondition *)&v8 description];
  v5 = [(GEOCondition *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCondition _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 32);
    if ((v5 & 2) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 28);
      if (v6 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 28));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53DFFC0[v6];
      }
      [v4 setObject:v7 forKey:@"type"];

      char v5 = *(unsigned char *)(a1 + 32);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v9 = @"expirationTime";
      }
      else {
        v9 = @"expiration_time";
      }
      [v4 setObject:v8 forKey:v9];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v11 = *(id *)(a1 + 16);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v28 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (a2) {
              [v16 jsonRepresentation];
            }
            else {
            v17 = [v16 dictionaryRepresentation];
            }
            [v10 addObject:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v13);
      }

      [v4 setObject:v10 forKey:@"condition"];
    }
    v18 = *(void **)(a1 + 8);
    if (v18)
    {
      v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __42__GEOCondition__dictionaryRepresentation___block_invoke;
        v25[3] = &unk_1E53D8860;
        id v22 = v21;
        id v26 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        id v23 = v22;

        v20 = v23;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCondition _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __42__GEOCondition__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOCondition)initWithDictionary:(id)a3
{
  return (GEOCondition *)-[GEOCondition _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_41;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_41;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"AND"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"OR"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"NOT"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"EXPIRATION_TIME"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"TOKEN_SUBSTITUTION_FAILURE_FALLBACK"])
    {
      uint64_t v8 = 5;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_20:
    [a1 setType:v8];
  }

  if (a3) {
    v9 = @"expirationTime";
  }
  else {
    v9 = @"expiration_time";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setExpirationTime:", objc_msgSend(v10, "unsignedIntValue"));
  }

  id v11 = [v5 objectForKeyedSubscript:@"condition"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v5;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v18 = [GEOCondition alloc];
            if (a3) {
              uint64_t v19 = [(GEOCondition *)v18 initWithJSON:v17];
            }
            else {
              uint64_t v19 = [(GEOCondition *)v18 initWithDictionary:v17];
            }
            v20 = (void *)v19;
            [a1 addCondition:v19];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    id v5 = v22;
  }

LABEL_41:
  return a1;
}

- (GEOCondition)initWithJSON:(id)a3
{
  return (GEOCondition *)-[GEOCondition _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOConditionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOConditionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteUint32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_conditions;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = a3;
  [(GEOCondition *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v9[7] = self->_type;
    *((unsigned char *)v9 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v9[6] = self->_expirationTime;
    *((unsigned char *)v9 + 32) |= 1u;
  }
  if ([(GEOCondition *)self conditionsCount])
  {
    [v9 clearConditions];
    unint64_t v5 = [(GEOCondition *)self conditionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOCondition *)self conditionAtIndex:i];
        [v9 addCondition:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (id *)v5;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_type;
    *(unsigned char *)(v5 + 32) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_expirationTime;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_conditions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [v6 addCondition:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  objc_storeStrong(v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOCondition *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_type != *((_DWORD *)v4 + 7)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_expirationTime != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_14;
  }
  conditions = self->_conditions;
  if ((unint64_t)conditions | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](conditions, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  [(GEOCondition *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3 ^ [(NSMutableArray *)self->_conditions hash];
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_expirationTime;
  return v4 ^ v3 ^ [(NSMutableArray *)self->_conditions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if (v5)
  {
    self->_expirationTime = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
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
        -[GEOCondition addCondition:](self, "addCondition:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOCondition *)self readAll:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_conditions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (int64_t)conditionType
{
  uint64_t v2 = [(GEOCondition *)self type] - 1;
  if (v2 < 5) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

- (NSDate)expirationDate
{
  if ([(GEOCondition *)self hasExpirationTime])
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)-[GEOCondition expirationTime](self, "expirationTime"));
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSDate *)v3;
}

@end