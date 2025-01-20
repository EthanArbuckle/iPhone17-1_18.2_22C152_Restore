@interface GEOPDGuideLocationImage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)image;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGuideLocationImage

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    uint64_t v3 = *(void *)(a1 + 16);
    -[GEOPDCaptionedPhoto clearUnknownFields:](v3);
  }
}

- (id)image
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
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGuideLocationImage;
  v4 = [(GEOPDGuideLocationImage *)&v8 description];
  v5 = [(GEOPDGuideLocationImage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuideLocationImage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 28))
    {
      uint64_t v5 = *(int *)(a1 + 24);
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53E3A70[v5];
      }
      if (a2) {
        v7 = @"imageType";
      }
      else {
        v7 = @"image_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    id v8 = *(id *)(a1 + 16);
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"image"];
    }
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __53__GEOPDGuideLocationImage__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOPDGuideLocationImage _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOPDGuideLocationImage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_22;
  }
  if (a3) {
    v7 = @"imageType";
  }
  else {
    v7 = @"image_type";
  }
  id v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"IMAGE_TYPE_UNKNOWN"])
    {
      int v10 = 0;
    }
    else if ([v9 isEqualToString:@"IMAGE_TYPE_LANDSCAPE"])
    {
      int v10 = 1;
    }
    else if ([v9 isEqualToString:@"IMAGE_TYPE_PORTRAIT"])
    {
      int v10 = 2;
    }
    else
    {
      int v10 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v10 = [v8 intValue];
LABEL_16:
    *(unsigned char *)(v6 + 28) |= 1u;
    *(_DWORD *)(v6 + 24) = v10;
  }

  v11 = [v5 objectForKeyedSubscript:@"image"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEOPDCaptionedPhoto alloc];
    if (v12) {
      v13 = (void *)-[GEOPDCaptionedPhoto _initWithDictionary:isJSON:](v12, v11, a3);
    }
    else {
      v13 = 0;
    }
    id v14 = v13;
    objc_storeStrong((id *)(v6 + 16), v13);
  }
LABEL_22:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGuideLocationImageReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_image)
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
    *(_DWORD *)(v5 + 24) = self->_imageType;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v7 = [(GEOPDCaptionedPhoto *)self->_image copyWithZone:a3];
  id v8 = *(void **)(v6 + 16);
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
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_imageType != *((_DWORD *)v4 + 6)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  image = self->_image;
  if ((unint64_t)image | *((void *)v4 + 2)) {
    char v6 = -[GEOPDCaptionedPhoto isEqual:](image, "isEqual:");
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
    uint64_t v2 = 2654435761 * self->_imageType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(GEOPDCaptionedPhoto *)self->_image hash] ^ v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end