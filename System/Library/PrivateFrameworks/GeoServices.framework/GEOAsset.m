@interface GEOAsset
+ (BOOL)isValid:(id)a3;
- (BOOL)hasScaleFactor;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAsset)initWithDictionary:(id)a3;
- (GEOAsset)initWithJSON:(id)a3;
- (NSString)url;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)scaleFactorAsString:(int)a3;
- (int)StringAsScaleFactor:(id)a3;
- (int)scaleFactor;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasScaleFactor:(BOOL)a3;
- (void)setScaleFactor:(int)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAsset

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (int)scaleFactor
{
  if (*(unsigned char *)&self->_flags) {
    return self->_scaleFactor;
  }
  else {
    return 0;
  }
}

- (void)setScaleFactor:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_scaleFactor = a3;
}

- (void)setHasScaleFactor:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasScaleFactor
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)scaleFactorAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E6EF0[a3];
  }

  return v3;
}

- (int)StringAsScaleFactor:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ASSET_SCALE_FACTOR_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ASSET_SCALE_FACTOR_1X"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ASSET_SCALE_FACTOR_2X"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ASSET_SCALE_FACTOR_3X"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAsset;
  int v4 = [(GEOAsset *)&v8 description];
  v5 = [(GEOAsset *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAsset _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 url];
    if (v5) {
      [v4 setObject:v5 forKey:@"url"];
    }

    if (*(unsigned char *)(a1 + 28))
    {
      uint64_t v6 = *(int *)(a1 + 24);
      if (v6 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53E6EF0[v6];
      }
      if (a2) {
        objc_super v8 = @"scaleFactor";
      }
      else {
        objc_super v8 = @"scale_factor";
      }
      [v4 setObject:v7 forKey:v8];
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
        v16[2] = __38__GEOAsset__dictionaryRepresentation___block_invoke;
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
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAsset _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __38__GEOAsset__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAsset)initWithDictionary:(id)a3
{
  return (GEOAsset *)-[GEOAsset _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      uint64_t v6 = [v5 objectForKeyedSubscript:@"url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = (void *)[v6 copy];
        [a1 setUrl:v7];
      }
      if (a3) {
        objc_super v8 = @"scaleFactor";
      }
      else {
        objc_super v8 = @"scale_factor";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v9;
        if ([v10 isEqualToString:@"ASSET_SCALE_FACTOR_UNKNOWN"])
        {
          uint64_t v11 = 0;
        }
        else if ([v10 isEqualToString:@"ASSET_SCALE_FACTOR_1X"])
        {
          uint64_t v11 = 1;
        }
        else if ([v10 isEqualToString:@"ASSET_SCALE_FACTOR_2X"])
        {
          uint64_t v11 = 2;
        }
        else if ([v10 isEqualToString:@"ASSET_SCALE_FACTOR_3X"])
        {
          uint64_t v11 = 3;
        }
        else
        {
          uint64_t v11 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_22:

          goto LABEL_23;
        }
        uint64_t v11 = [v9 intValue];
      }
      [a1 setScaleFactor:v11];
      goto LABEL_22;
    }
  }
LABEL_23:

  return a1;
}

- (GEOAsset)initWithJSON:(id)a3
{
  return (GEOAsset *)-[GEOAsset _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAssetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAssetReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_url)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOAsset *)self readAll:0];
  if (self->_url) {
    objc_msgSend(v4, "setUrl:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 6) = self->_scaleFactor;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_url copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_scaleFactor;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOAsset *)self readAll:1];
  [v4 readAll:1];
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_scaleFactor == *((_DWORD *)v4 + 6))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEOAsset *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_url hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_scaleFactor;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  [v4 readAll:0];
  if (*((void *)v4 + 2)) {
    -[GEOAsset setUrl:](self, "setUrl:");
  }
  if (v4[7])
  {
    self->_scaleFactor = v4[6];
    *(unsigned char *)&self->_flags |= 1u;
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
    [(GEOAsset *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end