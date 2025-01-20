@interface GEOTripInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasHasVisitedFirstStop;
- (BOOL)hasVisitedFirstStop;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTripInfo)initWithDictionary:(id)a3;
- (GEOTripInfo)initWithJSON:(id)a3;
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
- (void)setHasHasVisitedFirstStop:(BOOL)a3;
- (void)setHasVisitedFirstStop:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTripInfo

- (BOOL)hasVisitedFirstStop
{
  return self->_hasVisitedFirstStop;
}

- (void)setHasVisitedFirstStop:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_hasVisitedFirstStop = a3;
}

- (void)setHasHasVisitedFirstStop:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasHasVisitedFirstStop
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTripInfo;
  v4 = [(GEOTripInfo *)&v8 description];
  v5 = [(GEOTripInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTripInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 20))
    {
      v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
      if (a2) {
        v6 = @"hasVisitedFirstStop";
      }
      else {
        v6 = @"has_visited_first_stop";
      }
      [v4 setObject:v5 forKey:v6];
    }
    v7 = *(void **)(a1 + 8);
    if (v7)
    {
      objc_super v8 = [v7 dictionaryRepresentation];
      v9 = v8;
      if (a2)
      {
        v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __41__GEOTripInfo__dictionaryRepresentation___block_invoke;
        v14[3] = &unk_1E53D8860;
        id v11 = v10;
        id v15 = v11;
        [v9 enumerateKeysAndObjectsUsingBlock:v14];
        id v12 = v11;

        v9 = v12;
      }
      [v4 setObject:v9 forKey:@"Unknown Fields"];
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
  return -[GEOTripInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOTripInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTripInfo)initWithDictionary:(id)a3
{
  return (GEOTripInfo *)-[GEOTripInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"hasVisitedFirstStop";
      }
      else {
        v6 = @"has_visited_first_stop";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHasVisitedFirstStop:", objc_msgSend(v7, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOTripInfo)initWithJSON:(id)a3
{
  return (GEOTripInfo *)-[GEOTripInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTripInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTripInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOTripInfo *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[16] = self->_hasVisitedFirstStop;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v4 + 16) = self->_hasVisitedFirstStop;
    *(unsigned char *)(v4 + 20) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_4;
  }
  [(GEOTripInfo *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (v4[20] & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[20] & 1) == 0)
    {
LABEL_4:
      BOOL v5 = 0;
      goto LABEL_5;
    }
    if (self->_hasVisitedFirstStop)
    {
      if (!v4[16]) {
        goto LABEL_4;
      }
    }
    else if (v4[16])
    {
      goto LABEL_4;
    }
    BOOL v5 = 1;
  }
LABEL_5:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    return 2654435761 * self->_hasVisitedFirstStop;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  [v4 readAll:0];
  if (v4[20])
  {
    self->_hasVisitedFirstStop = v4[16];
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
    [(GEOTripInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end