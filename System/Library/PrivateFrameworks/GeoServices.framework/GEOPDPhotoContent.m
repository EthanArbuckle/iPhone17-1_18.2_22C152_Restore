@interface GEOPDPhotoContent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)url;
- (unint64_t)_area;
- (unint64_t)hash;
- (void)setUrl:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPhotoContent

- (id)url
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)setUrl:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (unint64_t)_area
{
  if (self) {
    return (*(_DWORD *)(self + 24) * *(_DWORD *)(self + 32));
  }
  return self;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPhotoContent;
  id v4 = [(GEOPDPhotoContent *)&v8 description];
  v5 = [(GEOPDPhotoContent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPhotoContent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 36);
    if ((v5 & 4) != 0)
    {
      v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
      [v4 setObject:v6 forKey:@"width"];

      char v5 = *(unsigned char *)(a1 + 36);
    }
    if (v5)
    {
      v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      [v4 setObject:v7 forKey:@"height"];
    }
    uint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      [v4 setObject:v8 forKey:@"url"];
    }
    if ((*(unsigned char *)(a1 + 36) & 2) != 0)
    {
      int v9 = *(_DWORD *)(a1 + 28);
      if (v9)
      {
        if (v9 == 1)
        {
          v10 = @"URL_TYPE_AMP_TEMPLATE";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 28));
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v10 = @"URL_TYPE_REGULAR";
      }
      if (a2) {
        v11 = @"urlType";
      }
      else {
        v11 = @"url_type";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __47__GEOPDPhotoContent__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
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
  return -[GEOPDPhotoContent _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOPDPhotoContent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    int v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPhotoContentReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_url) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_width;
    *(unsigned char *)(v5 + 36) |= 4u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_height;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_url copyWithZone:a3];
  int v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_urlType;
    *(unsigned char *)(v6 + 36) |= 2u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 36);
  if ((flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_width != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_height != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_19;
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](url, "isEqual:"))
    {
LABEL_19:
      BOOL v8 = 0;
      goto LABEL_20;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 36);
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_urlType != *((_DWORD *)v4 + 7)) {
      goto LABEL_19;
    }
    BOOL v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_width;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_height;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_url hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_urlType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

@end