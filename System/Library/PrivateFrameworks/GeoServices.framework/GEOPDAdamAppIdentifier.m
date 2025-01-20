@interface GEOPDAdamAppIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)setAdamId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAdamAppIdentifier

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_adamId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    adamId = self->_adamId;
    if ((unint64_t)adamId | v4[2]) {
      char v6 = -[NSString isEqual:](adamId, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_adamId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = v4;
    if (*(void *)(a1 + 16)) {
      objc_msgSend(v4, "setObject:forKey:");
    }
    uint64_t v6 = *(void **)(a1 + 8);
    if (v6)
    {
      v7 = [v6 dictionaryRepresentation];
      v8 = v7;
      if (a2)
      {
        v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __52__GEOPDAdamAppIdentifier__dictionaryRepresentation___block_invoke;
        v13[3] = &unk_1E53D8860;
        id v10 = v9;
        id v14 = v10;
        [v8 enumerateKeysAndObjectsUsingBlock:v13];
        id v11 = v10;

        v8 = v11;
      }
      [v5 setObject:v8 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamId, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)setAdamId:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAdamAppIdentifier;
  id v4 = [(GEOPDAdamAppIdentifier *)&v8 description];
  uint64_t v5 = [(GEOPDAdamAppIdentifier *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAdamAppIdentifier _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDAdamAppIdentifier _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOPDAdamAppIdentifier__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      v7 = @"adamId";
    }
    else {
      v7 = @"adam_id";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      -[GEOPDAdamAppIdentifier setAdamId:](v6, v9);
    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAdamAppIdentifierReadAllFrom((uint64_t)self, a3);
}

- (unint64_t)hash
{
  return [(NSString *)self->_adamId hash];
}

@end