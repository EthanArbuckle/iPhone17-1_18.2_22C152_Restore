@interface GEOPhotoInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasSize;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPhotoInfo)initWithDictionary:(id)a3;
- (GEOPhotoInfo)initWithJSON:(id)a3;
- (GEOPhotoInfo)initWithPlaceDataPhotoContent:(id)a3;
- (NSString)url;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)sizeAsString:(int)a3;
- (int)StringAsSize:(id)a3;
- (int)size;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setSize:(int)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPhotoInfo

- (GEOPhotoInfo)initWithPlaceDataPhotoContent:(id)a3
{
  v4 = (id *)a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOPhotoInfo;
  v5 = [(GEOPhotoInfo *)&v14 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      unsigned int v7 = *((_DWORD *)v4 + 8);
      unsigned int v8 = *((_DWORD *)v4 + 6);
    }
    else
    {
      unsigned int v7 = 0;
      unsigned int v8 = 0;
    }
    if (v7 > 0x14 || v8 >= 0x15)
    {
      if (v7 > 0x1E || v8 >= 0x1F)
      {
        if (v7 > 0x28 || v8 >= 0x29)
        {
          if (v7 > 0x3C || v8 >= 0x3D)
          {
            if (v7 > 0x64 || v8 >= 0x65)
            {
              if (v7 > 0x78 || v8 >= 0x79)
              {
                if (v7 > 0xF8 || v8 >= 0xBB)
                {
                  if (v7 > 0xFA || v8 >= 0xFB)
                  {
                    if (v8 >= 0x191 || v7 >= 0x259) {
                      uint64_t v9 = 7;
                    }
                    else {
                      uint64_t v9 = 8;
                    }
                  }
                  else
                  {
                    uint64_t v9 = 6;
                  }
                }
                else
                {
                  uint64_t v9 = 9;
                }
              }
              else
              {
                uint64_t v9 = 5;
              }
            }
            else
            {
              uint64_t v9 = 4;
            }
          }
          else
          {
            uint64_t v9 = 3;
          }
        }
        else
        {
          uint64_t v9 = 2;
        }
      }
      else
      {
        uint64_t v9 = 1;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    [(GEOPhotoInfo *)v5 setSize:v9];
    v11 = -[GEOPDPhotoContent url](v4);
    [(GEOPhotoInfo *)v6 setUrl:v11];

    v12 = v6;
  }

  return v6;
}

- (void)setUrl:(id)a3
{
}

- (void)setSize:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_size = a3;
}

- (int)size
{
  if (*(unsigned char *)&self->_flags) {
    return self->_size;
  }
  else {
    return 0;
  }
}

- (void)setHasSize:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasSize
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)sizeAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E7000[a3];
  }

  return v3;
}

- (int)StringAsSize:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PX20"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PX30"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PX40"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PX60"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"PX100"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PX120"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PX250"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PX1000"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"PX600_400"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PX248_186"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (NSString)url
{
  return self->_url;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPhotoInfo;
  int v4 = [(GEOPhotoInfo *)&v8 description];
  v5 = [(GEOPhotoInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPhotoInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 28))
    {
      uint64_t v5 = *(int *)(a1 + 24);
      if (v5 >= 0xA)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53E7000[v5];
      }
      [v4 setObject:v6 forKey:@"size"];
    }
    unsigned int v7 = [(id)a1 url];
    if (v7) {
      [v4 setObject:v7 forKey:@"url"];
    }

    objc_super v8 = *(void **)(a1 + 8);
    if (v8)
    {
      uint64_t v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __42__GEOPhotoInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEOPhotoInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __42__GEOPhotoInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unsigned int v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPhotoInfo)initWithDictionary:(id)a3
{
  return (GEOPhotoInfo *)-[GEOPhotoInfo _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_32;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_32;
  }
  int v4 = [v3 objectForKeyedSubscript:@"size"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"PX20"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"PX30"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"PX40"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"PX60"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"PX100"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"PX120"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"PX250"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"PX1000"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"PX600_400"])
    {
      uint64_t v6 = 8;
    }
    else if ([v5 isEqualToString:@"PX248_186"])
    {
      uint64_t v6 = 9;
    }
    else
    {
      uint64_t v6 = 0;
    }

    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 intValue];
LABEL_28:
    [a1 setSize:v6];
  }

  unsigned int v7 = [v3 objectForKeyedSubscript:@"url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setUrl:v8];
  }
LABEL_32:

  return a1;
}

- (GEOPhotoInfo)initWithJSON:(id)a3
{
  return (GEOPhotoInfo *)-[GEOPhotoInfo _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPhotoInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPhotoInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_url)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPhotoInfo *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 6) = self->_size;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  if (self->_url)
  {
    objc_msgSend(v5, "setUrl:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_size;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_url copyWithZone:a3];
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
  [(GEOPhotoInfo *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_size != *((_DWORD *)v4 + 6)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](url, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPhotoInfo *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_size;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSString *)self->_url hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  id v4 = v5;
  if (v5[7])
  {
    self->_size = v5[6];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 2))
  {
    -[GEOPhotoInfo setUrl:](self, "setUrl:");
    id v4 = v5;
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
    [(GEOPhotoInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end