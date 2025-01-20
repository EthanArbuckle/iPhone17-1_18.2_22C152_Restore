@interface GEOPDMapsIdentifier
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasShardedId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidMapsIdentifier;
- (BOOL)isValidOfflineMapsIdentifier;
- (BOOL)readFrom:(id)a3;
- (GEOPDMapsIdentifier)initWithDictionary:(id)a3;
- (GEOPDMapsIdentifier)initWithJSON:(id)a3;
- (GEOPDShardedId)shardedId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setShardedId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDMapsIdentifier

- (GEOPDShardedId)shardedId
{
  return self->_shardedId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOPDShardedId *)self->_shardedId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (void)setShardedId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shardedId, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDMapsIdentifierReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_shardedId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)isValidMapsIdentifier
{
  if ([(GEOPDMapsIdentifier *)self hasShardedId])
  {
    id v4 = [(GEOPDMapsIdentifier *)self shardedId];
    int v5 = [v4 hasBasemapId];
    if (v5
      && ([(GEOPDMapsIdentifier *)self shardedId],
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 basemapId]))
    {
      BOOL v6 = 1;
    }
    else
    {
      v7 = [(GEOPDMapsIdentifier *)self shardedId];
      if ([v7 hasMuid])
      {
        v8 = [(GEOPDMapsIdentifier *)self shardedId];
        BOOL v6 = [v8 muid] != 0;

        if ((v5 & 1) == 0) {
          goto LABEL_11;
        }
      }
      else
      {

        BOOL v6 = 0;
        if (!v5)
        {
LABEL_11:

          return v6;
        }
      }
    }

    goto LABEL_11;
  }
  return 0;
}

- (BOOL)hasShardedId
{
  return self->_shardedId != 0;
}

- (unint64_t)hash
{
  [(GEOPDMapsIdentifier *)self readAll:1];
  shardedId = self->_shardedId;

  return [(GEOPDShardedId *)shardedId hash];
}

- (BOOL)isValidOfflineMapsIdentifier
{
  if (![(GEOPDMapsIdentifier *)self hasShardedId]) {
    return 0;
  }
  v3 = [(GEOPDMapsIdentifier *)self shardedId];
  if ([v3 hasMuid])
  {
    id v4 = [(GEOPDMapsIdentifier *)self shardedId];
    if ([v4 muid])
    {
      int v5 = [(GEOPDMapsIdentifier *)self shardedId];
      if ([v5 hasCenter])
      {
        BOOL v6 = [(GEOPDMapsIdentifier *)self shardedId];
        v7 = [v6 center];
        [v7 coordinate];
        BOOL v10 = v9 >= -180.0;
        if (v9 > 180.0) {
          BOOL v10 = 0;
        }
        if (v8 < -90.0) {
          BOOL v10 = 0;
        }
        BOOL v11 = v8 <= 90.0 && v10;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDMapsIdentifier;
  id v4 = [(GEOPDMapsIdentifier *)&v8 description];
  int v5 = [(GEOPDMapsIdentifier *)self dictionaryRepresentation];
  BOOL v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMapsIdentifier _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    int v5 = [a1 shardedId];
    BOOL v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"shardedId";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"sharded_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    double v9 = (void *)a1[1];
    if (v9)
    {
      BOOL v10 = [v9 dictionaryRepresentation];
      BOOL v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __49__GEOPDMapsIdentifier__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        BOOL v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
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
  return -[GEOPDMapsIdentifier _dictionaryRepresentation:](self, 1);
}

void __49__GEOPDMapsIdentifier__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    double v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDMapsIdentifier)initWithDictionary:(id)a3
{
  return (GEOPDMapsIdentifier *)-[GEOPDMapsIdentifier _initWithDictionary:isJSON:](self, a3, 0);
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
        BOOL v6 = @"shardedId";
      }
      else {
        BOOL v6 = @"sharded_id";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDShardedId alloc];
        if (a3) {
          uint64_t v9 = [(GEOPDShardedId *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOPDShardedId *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setShardedId:v9];
      }
    }
  }

  return a1;
}

- (GEOPDMapsIdentifier)initWithJSON:(id)a3
{
  return (GEOPDMapsIdentifier *)-[GEOPDMapsIdentifier _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDMapsIdentifierIsValid((char *)a3);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOPDShardedId *)self->_shardedId hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOPDMapsIdentifier *)self readAll:0];
  if (self->_shardedId) {
    objc_msgSend(v4, "setShardedId:");
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOPDMapsIdentifier *)self readAll:1];
    [v4 readAll:1];
    shardedId = self->_shardedId;
    if ((unint64_t)shardedId | v4[2]) {
      char v5 = -[GEOPDShardedId isEqual:](shardedId, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  shardedId = self->_shardedId;
  uint64_t v6 = v4[2];

  if (shardedId)
  {
    if (v6)
    {
      [(GEOPDShardedId *)shardedId mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEOPDMapsIdentifier *)self setShardedId:v6];
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
    [(GEOPDMapsIdentifier *)self readAll:0];
    shardedId = self->_shardedId;
    [(GEOPDShardedId *)shardedId clearUnknownFields:1];
  }
}

@end