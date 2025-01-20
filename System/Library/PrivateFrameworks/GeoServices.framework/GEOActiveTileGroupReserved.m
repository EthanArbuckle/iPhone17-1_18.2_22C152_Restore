@interface GEOActiveTileGroupReserved
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAuthToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOActiveTileGroupReserved)initWithDictionary:(id)a3;
- (GEOActiveTileGroupReserved)initWithJSON:(id)a3;
- (NSString)authToken;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOActiveTileGroupReserved

- (BOOL)hasAuthToken
{
  return self->_authToken != 0;
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOActiveTileGroupReserved;
  v4 = [(GEOActiveTileGroupReserved *)&v8 description];
  v5 = [(GEOActiveTileGroupReserved *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOActiveTileGroupReserved _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 authToken];
    if (v5) {
      [v4 setObject:v5 forKey:@"authToken"];
    }

    v6 = (void *)a1[1];
    if (v6)
    {
      v7 = [v6 dictionaryRepresentation];
      objc_super v8 = v7;
      if (a2)
      {
        v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __56__GEOActiveTileGroupReserved__dictionaryRepresentation___block_invoke;
        v13[3] = &unk_1E53D8860;
        id v10 = v9;
        id v14 = v10;
        [v8 enumerateKeysAndObjectsUsingBlock:v13];
        id v11 = v10;

        objc_super v8 = v11;
      }
      [v4 setObject:v8 forKey:@"Unknown Fields"];
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
  return -[GEOActiveTileGroupReserved _dictionaryRepresentation:](self, 1);
}

void __56__GEOActiveTileGroupReserved__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOActiveTileGroupReserved)initWithDictionary:(id)a3
{
  return (GEOActiveTileGroupReserved *)-[GEOActiveTileGroupReserved _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"authToken"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = (void *)[v4 copy];
        [a1 setAuthToken:v5];
      }
    }
  }

  return a1;
}

- (GEOActiveTileGroupReserved)initWithJSON:(id)a3
{
  return (GEOActiveTileGroupReserved *)-[GEOActiveTileGroupReserved _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOActiveTileGroupReservedIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOActiveTileGroupReservedReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_authToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOActiveTileGroupReserved *)self readAll:0];
  if (self->_authToken) {
    objc_msgSend(v4, "setAuthToken:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_authToken copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOActiveTileGroupReserved *)self readAll:1];
    [v4 readAll:1];
    authToken = self->_authToken;
    if ((unint64_t)authToken | v4[2]) {
      char v5 = -[NSString isEqual:](authToken, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEOActiveTileGroupReserved *)self readAll:1];
  authToken = self->_authToken;

  return [(NSString *)authToken hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = v4[2];

  if (v5)
  {
    [(GEOActiveTileGroupReserved *)self setAuthToken:v5];
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
    [(GEOActiveTileGroupReserved *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authToken, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end