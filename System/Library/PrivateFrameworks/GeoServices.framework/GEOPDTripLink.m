@interface GEOPDTripLink
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)linkGeometry;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTripLink

- (id)linkGeometry
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTripLink;
  v4 = [(GEOPDTripLink *)&v8 description];
  v5 = [(GEOPDTripLink *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTripLink _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 32))
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      if (a2) {
        v6 = @"linkId";
      }
      else {
        v6 = @"link_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    id v7 = *(id *)(a1 + 16);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 base64EncodedStringWithOptions:0];
        [v4 setObject:v9 forKey:@"linkGeometry"];
      }
      else
      {
        [v4 setObject:v7 forKey:@"link_geometry"];
      }
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
        v17[2] = __43__GEOPDTripLink__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDTripLink _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOPDTripLink__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTripLinkReadAllFrom((uint64_t)self, a3);
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
  if (self->_linkGeometry)
  {
    PBDataWriterWriteDataField();
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
    *(void *)(v5 + 24) = self->_linkId;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_linkGeometry copyWithZone:a3];
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
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_linkId != *((void *)v4 + 3)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  linkGeometry = self->_linkGeometry;
  if ((unint64_t)linkGeometry | *((void *)v4 + 2)) {
    char v6 = -[NSData isEqual:](linkGeometry, "isEqual:");
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
    unint64_t v2 = 2654435761u * self->_linkId;
  }
  else {
    unint64_t v2 = 0;
  }
  return [(NSData *)self->_linkGeometry hash] ^ v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkGeometry, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end