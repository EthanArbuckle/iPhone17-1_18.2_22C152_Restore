@interface GEOPDPaginationParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)mergeFrom:(uint64_t)a1;
- (void)setPageToken:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPaginationParameters

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 28))
    {
      v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
      if (a2) {
        v6 = @"enablePagination";
      }
      else {
        v6 = @"enable_pagination";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 16)) {
      objc_msgSend(v4, "setObject:forKey:");
    }
    v7 = *(void **)(a1 + 8);
    if (v7)
    {
      v8 = [v7 dictionaryRepresentation];
      v9 = v8;
      if (a2)
      {
        v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __55__GEOPDPaginationParameters__dictionaryRepresentation___block_invoke;
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      v7 = @"enablePagination";
    }
    else {
      v7 = @"enable_pagination";
    }
    v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v9 = [v8 BOOLValue];
      *(unsigned char *)(v6 + 28) |= 1u;
      *(unsigned char *)(v6 + 24) = v9;
    }

    if (a3) {
      v10 = @"pageToken";
    }
    else {
      v10 = @"page_token";
    }
    id v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = (void *)[v11 copy];
      -[GEOPDPaginationParameters setPageToken:](v6, v12);
    }
  }

  return v6;
}

- (void)mergeFrom:(uint64_t)a1
{
  v3 = a2;
  if (v3[28])
  {
    *(unsigned char *)(a1 + 24) = v3[24];
    *(unsigned char *)(a1 + 28) |= 1u;
  }
  v4 = (void *)*((void *)v3 + 2);
  if (v4)
  {
    id v5 = v3;
    -[GEOPDPaginationParameters setPageToken:](a1, v4);
    v3 = v5;
  }
}

- (void)setPageToken:(uint64_t)a1
{
  id v4 = a2;
  objc_storeStrong((id *)(a1 + 16), a2);
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPaginationParameters;
  id v4 = [(GEOPDPaginationParameters *)&v8 description];
  id v5 = [(GEOPDPaginationParameters *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPaginationParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDPaginationParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOPDPaginationParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    char v9 = [v10 description];
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
  return GEOPDPaginationParametersReadAllFrom((uint64_t)self, a3);
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
  if (self->_pageToken)
  {
    PBDataWriterWriteStringField();
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
    *(unsigned char *)(v5 + 24) = self->_enablePagination;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_pageToken copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_enablePagination)
      {
        if (*((unsigned char *)v4 + 24)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 24))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    char v5 = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_6;
  }
LABEL_12:
  pageToken = self->_pageToken;
  if ((unint64_t)pageToken | *((void *)v4 + 2)) {
    char v5 = -[NSString isEqual:](pageToken, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    uint64_t v2 = 2654435761 * self->_enablePagination;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_pageToken hash] ^ v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageToken, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end