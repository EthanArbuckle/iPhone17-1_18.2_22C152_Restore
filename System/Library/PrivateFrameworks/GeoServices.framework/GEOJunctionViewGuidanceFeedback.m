@interface GEOJunctionViewGuidanceFeedback
+ (BOOL)isValid:(id)a3;
+ (Class)imageIDType;
- (BOOL)hasImageDisplayed;
- (BOOL)imageDisplayed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOJunctionViewGuidanceFeedback)initWithDictionary:(id)a3;
- (GEOJunctionViewGuidanceFeedback)initWithJSON:(id)a3;
- (NSMutableArray)imageIDs;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)imageIDAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)imageIDsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addImageID:(id)a3;
- (void)clearImageIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasImageDisplayed:(BOOL)a3;
- (void)setImageDisplayed:(BOOL)a3;
- (void)setImageIDs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOJunctionViewGuidanceFeedback

- (BOOL)imageDisplayed
{
  return (*(unsigned char *)&self->_flags & 1) != 0 && self->_imageDisplayed;
}

- (void)setImageDisplayed:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_imageDisplayed = a3;
}

- (void)setHasImageDisplayed:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasImageDisplayed
{
  return *(unsigned char *)&self->_flags & 1;
}

- (NSMutableArray)imageIDs
{
  return self->_imageIDs;
}

- (void)setImageIDs:(id)a3
{
}

- (void)clearImageIDs
{
}

- (void)addImageID:(id)a3
{
  id v4 = a3;
  imageIDs = self->_imageIDs;
  id v8 = v4;
  if (!imageIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imageIDs;
    self->_imageIDs = v6;

    id v4 = v8;
    imageIDs = self->_imageIDs;
  }
  [(NSMutableArray *)imageIDs addObject:v4];
}

- (unint64_t)imageIDsCount
{
  return [(NSMutableArray *)self->_imageIDs count];
}

- (id)imageIDAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imageIDs objectAtIndex:a3];
}

+ (Class)imageIDType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOJunctionViewGuidanceFeedback;
  id v4 = [(GEOJunctionViewGuidanceFeedback *)&v8 description];
  v5 = [(GEOJunctionViewGuidanceFeedback *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOJunctionViewGuidanceFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 20))
    {
      v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 16)];
      if (a2) {
        v6 = @"imageDisplayed";
      }
      else {
        v6 = @"image_displayed";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 8))
    {
      if (a2)
      {
        v7 = (void *)MEMORY[0x1E4F1CA48];
        objc_super v8 = [(id)a1 imageIDs];
        v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        v10 = objc_msgSend((id)a1, "imageIDs", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) base64EncodedStringWithOptions:0];
              [v9 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v12);
        }
      }
      else
      {
        v9 = [(id)a1 imageIDs];
      }
      [v4 setObject:v9 forKey:@"imageID"];
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
  return -[GEOJunctionViewGuidanceFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOJunctionViewGuidanceFeedback)initWithDictionary:(id)a3
{
  return (GEOJunctionViewGuidanceFeedback *)-[GEOJunctionViewGuidanceFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"imageDisplayed";
      }
      else {
        v6 = @"image_displayed";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setImageDisplayed:", objc_msgSend(v7, "BOOLValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"imageID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v19;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v19 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v15 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                v16 = objc_msgSend(v15, "initWithBase64EncodedString:options:", v14, 0, (void)v18);
                [a1 addImageID:v16];
              }
              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v11);
        }
      }
    }
  }

  return a1;
}

- (GEOJunctionViewGuidanceFeedback)initWithJSON:(id)a3
{
  return (GEOJunctionViewGuidanceFeedback *)-[GEOJunctionViewGuidanceFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOJunctionViewGuidanceFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOJunctionViewGuidanceFeedbackReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteBOOLField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_imageIDs;
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
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  [(GEOJunctionViewGuidanceFeedback *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v8[16] = self->_imageDisplayed;
    v8[20] |= 1u;
  }
  if ([(GEOJunctionViewGuidanceFeedback *)self imageIDsCount])
  {
    [v8 clearImageIDs];
    unint64_t v4 = [(GEOJunctionViewGuidanceFeedback *)self imageIDsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOJunctionViewGuidanceFeedback *)self imageIDAtIndex:i];
        [v8 addImageID:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 16) = self->_imageDisplayed;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_imageIDs;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [v6 addImageID:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEOJunctionViewGuidanceFeedback *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_imageDisplayed)
      {
        if (*((unsigned char *)v4 + 16)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    char v5 = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 20)) {
    goto LABEL_6;
  }
LABEL_12:
  imageIDs = self->_imageIDs;
  if ((unint64_t)imageIDs | *((void *)v4 + 1)) {
    char v5 = -[NSMutableArray isEqual:](imageIDs, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  [(GEOJunctionViewGuidanceFeedback *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_imageDisplayed;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSMutableArray *)self->_imageIDs hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 20))
  {
    self->_imageDisplayed = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[GEOJunctionViewGuidanceFeedback addImageID:](self, "addImageID:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end