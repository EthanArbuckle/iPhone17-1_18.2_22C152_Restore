@interface GEONavigabilityInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIsBlocked;
- (BOOL)hasIsEvFeasible;
- (BOOL)isBlocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEvFeasible;
- (BOOL)readFrom:(id)a3;
- (GEONavigabilityInfo)initWithDictionary:(id)a3;
- (GEONavigabilityInfo)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsBlocked:(BOOL)a3;
- (void)setHasIsEvFeasible:(BOOL)a3;
- (void)setIsBlocked:(BOOL)a3;
- (void)setIsEvFeasible:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONavigabilityInfo

- (BOOL)isEvFeasible
{
  return self->_isEvFeasible;
}

- (void)setIsEvFeasible:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_isEvFeasible = a3;
}

- (void)setHasIsEvFeasible:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsEvFeasible
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_isBlocked = a3;
}

- (void)setHasIsBlocked:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIsBlocked
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONavigabilityInfo;
  v4 = [(GEONavigabilityInfo *)&v8 description];
  v5 = [(GEONavigabilityInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONavigabilityInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 20);
    if ((v5 & 2) != 0)
    {
      v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 17)];
      if (a2) {
        v7 = @"isEvFeasible";
      }
      else {
        v7 = @"is_ev_feasible";
      }
      [v4 setObject:v6 forKey:v7];

      char v5 = *(unsigned char *)(a1 + 20);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
      if (a2) {
        v9 = @"isBlocked";
      }
      else {
        v9 = @"is_blocked";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = [v10 dictionaryRepresentation];
      v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __49__GEONavigabilityInfo__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONavigabilityInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEONavigabilityInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEONavigabilityInfo)initWithDictionary:(id)a3
{
  return (GEONavigabilityInfo *)-[GEONavigabilityInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"isEvFeasible";
      }
      else {
        v6 = @"is_ev_feasible";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsEvFeasible:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"isBlocked";
      }
      else {
        objc_super v8 = @"is_blocked";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsBlocked:", objc_msgSend(v9, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEONavigabilityInfo)initWithJSON:(id)a3
{
  return (GEONavigabilityInfo *)-[GEONavigabilityInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavigabilityInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavigabilityInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteBOOLField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEONavigabilityInfo *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[17] = self->_isEvFeasible;
    v5[20] |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    v5[16] = self->_isBlocked;
    v5[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v4 + 17) = self->_isEvFeasible;
    *(unsigned char *)(v4 + 20) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(unsigned char *)(v4 + 16) = self->_isBlocked;
    *(unsigned char *)(v4 + 20) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  [(GEONavigabilityInfo *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[20] & 2) == 0) {
      goto LABEL_12;
    }
    if (self->_isEvFeasible)
    {
      if (!v4[17]) {
        goto LABEL_12;
      }
    }
    else if (v4[17])
    {
      goto LABEL_12;
    }
  }
  else if ((v4[20] & 2) != 0)
  {
    goto LABEL_12;
  }
  BOOL v5 = (v4[20] & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if (v4[20])
    {
      if (self->_isBlocked)
      {
        if (!v4[16]) {
          goto LABEL_12;
        }
      }
      else if (v4[16])
      {
        goto LABEL_12;
      }
      BOOL v5 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v5 = 0;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  [(GEONavigabilityInfo *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_isEvFeasible;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_isBlocked;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (BOOL *)a3;
  [v5 readAll:0];
  BOOL v4 = v5[20];
  if ((v4 & 2) != 0)
  {
    self->_isEvFeasible = v5[17];
    *(unsigned char *)&self->_flags |= 2u;
    BOOL v4 = v5[20];
  }
  if (v4)
  {
    self->_isBlocked = v5[16];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEONavigabilityInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end