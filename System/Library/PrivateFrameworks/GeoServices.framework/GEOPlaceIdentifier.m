@interface GEOPlaceIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(char)a3 isJSON:;
- (unint64_t)hash;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPlaceIdentifier

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPlaceIdentifier;
  v4 = [(GEOPlaceIdentifier *)&v8 description];
  v5 = [(GEOPlaceIdentifier *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlaceIdentifier _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 32))
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      [v4 setObject:v5 forKey:@"muid"];
    }
    id v6 = *(id *)(a1 + 16);
    v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      objc_super v8 = [v6 dictionaryRepresentation];
      }
      [v4 setObject:v8 forKey:@"center"];
    }
    v9 = *(void **)(a1 + 8);
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __48__GEOPlaceIdentifier__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
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
  return -[GEOPlaceIdentifier _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOPlaceIdentifier__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"muid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v6 unsignedLongLongValue];
        *(unsigned char *)(a1 + 32) |= 1u;
        *(void *)(a1 + 24) = v7;
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"center"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [GEOLatLng alloc];
        if (a3) {
          id v10 = [(GEOLatLng *)v9 initWithJSON:v8];
        }
        else {
          id v10 = [(GEOLatLng *)v9 initWithDictionary:v8];
        }
        v11 = v10;
        v12 = v10;
        objc_storeStrong((id *)(a1 + 16), v11);
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceIdentifierReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_center)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 24) = self->_muid;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v7 = [(GEOLatLng *)self->_center copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_muid != *((void *)v4 + 3)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 2)) {
    char v6 = -[GEOLatLng isEqual:](center, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    unint64_t v2 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v2 = 0;
  }
  return [(GEOLatLng *)self->_center hash] ^ v2;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    id v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    if (a2)
    {
      uint64_t v5 = *(void **)(a1 + 16);
      [v5 clearUnknownFields:1];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_center, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end