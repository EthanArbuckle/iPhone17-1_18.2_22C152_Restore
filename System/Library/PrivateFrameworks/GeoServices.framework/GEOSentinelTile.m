@interface GEOSentinelTile
+ (BOOL)isValid:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSentinelTile)initWithDictionary:(id)a3;
- (GEOSentinelTile)initWithJSON:(id)a3;
- (NSString)resourceName;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setResourceName:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSentinelTile

- (int)type
{
  if (self->_type <= 1u) {
    return 1;
  }
  else {
    return self->_type;
  }
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (id)typeAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"WATER";
  }
  else if (a3 == 2)
  {
    v4 = @"NO_TILE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"WATER"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"NO_TILE"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (void)setResourceName:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSentinelTile;
  int v4 = [(GEOSentinelTile *)&v8 description];
  v5 = [(GEOSentinelTile *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSentinelTile _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    int v5 = *(_DWORD *)(a1 + 24);
    if (v5 == 1)
    {
      v6 = @"WATER";
    }
    else if (v5 == 2)
    {
      v6 = @"NO_TILE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 24));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v4 setObject:v6 forKey:@"type"];

    v7 = [(id)a1 resourceName];
    if (v7) {
      [v4 setObject:v7 forKey:@"resourceName"];
    }

    objc_super v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __45__GEOSentinelTile__dictionaryRepresentation___block_invoke;
        v15[3] = &unk_1E53D8860;
        id v12 = v11;
        id v16 = v12;
        [v10 enumerateKeysAndObjectsUsingBlock:v15];
        id v13 = v12;

        v10 = v13;
      }
      [v4 setObject:v10 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSentinelTile _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOSentinelTile__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSentinelTile)initWithDictionary:(id)a3
{
  return (GEOSentinelTile *)-[GEOSentinelTile _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_15;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_15;
  }
  int v4 = [v3 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = 1;
    if (([v5 isEqualToString:@"WATER"] & 1) == 0)
    {
      if ([v5 isEqualToString:@"NO_TILE"]) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 1;
      }
    }

    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 intValue];
LABEL_11:
    [a1 setType:v6];
  }

  v7 = [v3 objectForKeyedSubscript:@"resourceName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setResourceName:v8];
  }
LABEL_15:

  return a1;
}

- (GEOSentinelTile)initWithJSON:(id)a3
{
  return (GEOSentinelTile *)-[GEOSentinelTile _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSentinelTileIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSentinelTileReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteStringField();
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOSentinelTile *)self readAll:0];
  v4[6] = self->_type;
  [v4 setResourceName:self->_resourceName];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_type;
  uint64_t v6 = [(NSString *)self->_resourceName copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOSentinelTile *)self readAll:1],
        [v4 readAll:1],
        self->_type == *((_DWORD *)v4 + 6)))
  {
    resourceName = self->_resourceName;
    if ((unint64_t)resourceName | v4[2]) {
      char v6 = -[NSString isEqual:](resourceName, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  [(GEOSentinelTile *)self readAll:1];
  uint64_t v3 = 2654435761 * self->_type;
  return [(NSString *)self->_resourceName hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int *)a3;
  [v4 readAll:0];
  self->_type = v4[6];
  if (*((void *)v4 + 2)) {
    -[GEOSentinelTile setResourceName:](self, "setResourceName:");
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
    [(GEOSentinelTile *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceName, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end