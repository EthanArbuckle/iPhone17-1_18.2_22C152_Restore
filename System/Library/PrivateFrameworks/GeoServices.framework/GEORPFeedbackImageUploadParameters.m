@interface GEORPFeedbackImageUploadParameters
+ (BOOL)isValid:(id)a3;
+ (Class)imageType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsEnrichment;
- (BOOL)isEnrichment;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackImageUploadParameters)initWithDictionary:(id)a3;
- (GEORPFeedbackImageUploadParameters)initWithJSON:(id)a3;
- (NSMutableArray)images;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)imageAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)imagesCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addImage:(id)a3;
- (void)clearImages;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsEnrichment:(BOOL)a3;
- (void)setImages:(id)a3;
- (void)setIsEnrichment:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackImageUploadParameters

- (NSMutableArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
}

- (void)clearImages
{
}

- (void)addImage:(id)a3
{
  id v4 = a3;
  images = self->_images;
  id v8 = v4;
  if (!images)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_images;
    self->_images = v6;

    id v4 = v8;
    images = self->_images;
  }
  [(NSMutableArray *)images addObject:v4];
}

- (unint64_t)imagesCount
{
  return [(NSMutableArray *)self->_images count];
}

- (id)imageAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_images objectAtIndex:a3];
}

+ (Class)imageType
{
  return (Class)objc_opt_class();
}

- (BOOL)isEnrichment
{
  return self->_isEnrichment;
}

- (void)setIsEnrichment:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_isEnrichment = a3;
}

- (void)setHasIsEnrichment:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIsEnrichment
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackImageUploadParameters;
  id v4 = [(GEORPFeedbackImageUploadParameters *)&v8 description];
  v5 = [(GEORPFeedbackImageUploadParameters *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackImageUploadParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 16) count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v6 = *(id *)(a1 + 16);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v25 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"image"];
    }
    if (*(unsigned char *)(a1 + 28))
    {
      v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
      if (a2) {
        v14 = @"isEnrichment";
      }
      else {
        v14 = @"is_enrichment";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __64__GEORPFeedbackImageUploadParameters__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEORPFeedbackImageUploadParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __64__GEORPFeedbackImageUploadParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPFeedbackImageUploadParameters)initWithDictionary:(id)a3
{
  return (GEORPFeedbackImageUploadParameters *)-[GEORPFeedbackImageUploadParameters _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"image"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v19 = v6;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = [GEORPPhotoMetadata alloc];
                if (a3) {
                  uint64_t v14 = [(GEORPPhotoMetadata *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEORPPhotoMetadata *)v13 initWithDictionary:v12];
                }
                v15 = (void *)v14;
                [a1 addImage:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v9);
        }

        id v6 = v19;
      }

      if (a3) {
        v16 = @"isEnrichment";
      }
      else {
        v16 = @"is_enrichment";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsEnrichment:", objc_msgSend(v17, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORPFeedbackImageUploadParameters)initWithJSON:(id)a3
{
  return (GEORPFeedbackImageUploadParameters *)-[GEORPFeedbackImageUploadParameters _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackImageUploadParametersIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackImageUploadParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_images;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteBOOLField();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_images;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  [(GEORPFeedbackImageUploadParameters *)self readAll:0];
  if ([(GEORPFeedbackImageUploadParameters *)self imagesCount])
  {
    [v8 clearImages];
    unint64_t v4 = [(GEORPFeedbackImageUploadParameters *)self imagesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackImageUploadParameters *)self imageAtIndex:i];
        [v8 addImage:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    v8[24] = self->_isEnrichment;
    v8[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_images;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [(id)v5 addImage:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 24) = self->_isEnrichment;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEORPFeedbackImageUploadParameters *)self readAll:1];
  [v4 readAll:1];
  images = self->_images;
  if ((unint64_t)images | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](images, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_isEnrichment)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPFeedbackImageUploadParameters *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_images hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_isEnrichment;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEORPFeedbackImageUploadParameters addImage:](self, "addImage:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 28))
  {
    self->_isEnrichment = *((unsigned char *)v4 + 24);
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
    [(GEORPFeedbackImageUploadParameters *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end