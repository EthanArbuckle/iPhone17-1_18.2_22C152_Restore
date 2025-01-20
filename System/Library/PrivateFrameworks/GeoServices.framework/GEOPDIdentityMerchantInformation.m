@interface GEOPDIdentityMerchantInformation
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)setRpIdentifier:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDIdentityMerchantInformation

- (void)setRpIdentifier:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDIdentityMerchantInformation;
  id v4 = [(GEOPDIdentityMerchantInformation *)&v8 description];
  v5 = [(GEOPDIdentityMerchantInformation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDIdentityMerchantInformation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = v4;
    if (*(void *)(a1 + 16)) {
      objc_msgSend(v4, "setObject:forKey:");
    }
    v6 = *(void **)(a1 + 8);
    if (v6)
    {
      v7 = [v6 dictionaryRepresentation];
      objc_super v8 = v7;
      if (a2)
      {
        v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __62__GEOPDIdentityMerchantInformation__dictionaryRepresentation___block_invoke;
        v13[3] = &unk_1E53D8860;
        id v10 = v9;
        id v14 = v10;
        [v8 enumerateKeysAndObjectsUsingBlock:v13];
        id v11 = v10;

        objc_super v8 = v11;
      }
      [v5 setObject:v8 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDIdentityMerchantInformation _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __62__GEOPDIdentityMerchantInformation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
      v7 = @"rpIdentifier";
    }
    else {
      v7 = @"rp_identifier";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      -[GEOPDIdentityMerchantInformation setRpIdentifier:](v6, v9);
    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDIdentityMerchantInformationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_rpIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_rpIdentifier copyWithZone:a3];
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
    rpIdentifier = self->_rpIdentifier;
    if ((unint64_t)rpIdentifier | v4[2]) {
      char v6 = -[NSString isEqual:](rpIdentifier, "isEqual:");
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
  return [(NSString *)self->_rpIdentifier hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rpIdentifier, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end