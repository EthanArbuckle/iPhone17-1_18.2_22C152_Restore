@interface GEOImageServiceRequest
+ (BOOL)isValid:(id)a3;
+ (Class)imageIdType;
- (BOOL)hasHeight;
- (BOOL)hasWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (GEOImageServiceRequest)initWithDictionary:(id)a3;
- (GEOImageServiceRequest)initWithJSON:(id)a3;
- (NSMutableArray)imageIds;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)imageIdAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)imageIdsCount;
- (unsigned)height;
- (unsigned)requestTypeCode;
- (unsigned)width;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addImageId:(id)a3;
- (void)clearImageIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHeight:(unsigned int)a3;
- (void)setImageIds:(id)a3;
- (void)setWidth:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOImageServiceRequest

- (NSMutableArray)imageIds
{
  return self->_imageIds;
}

- (void)setImageIds:(id)a3
{
}

- (void)clearImageIds
{
}

- (void)addImageId:(id)a3
{
  id v4 = a3;
  imageIds = self->_imageIds;
  id v8 = v4;
  if (!imageIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_imageIds;
    self->_imageIds = v6;

    id v4 = v8;
    imageIds = self->_imageIds;
  }
  [(NSMutableArray *)imageIds addObject:v4];
}

- (unint64_t)imageIdsCount
{
  return [(NSMutableArray *)self->_imageIds count];
}

- (id)imageIdAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_imageIds objectAtIndex:a3];
}

+ (Class)imageIdType
{
  return (Class)objc_opt_class();
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHeight:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasHeight
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOImageServiceRequest;
  id v4 = [(GEOImageServiceRequest *)&v8 description];
  v5 = [(GEOImageServiceRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOImageServiceRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 8))
    {
      if (a2)
      {
        v5 = (void *)MEMORY[0x1E4F1CA48];
        v6 = [(id)a1 imageIds];
        v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        objc_super v8 = objc_msgSend((id)a1, "imageIds", 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = [*(id *)(*((void *)&v19 + 1) + 8 * i) base64EncodedStringWithOptions:0];
              [v7 addObject:v13];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v10);
        }

        v14 = @"imageId";
      }
      else
      {
        v7 = [(id)a1 imageIds];
        v14 = @"image_id";
      }
      [v4 setObject:v7 forKey:v14];
    }
    char v15 = *(unsigned char *)(a1 + 24);
    if ((v15 & 2) != 0)
    {
      v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
      [v4 setObject:v16 forKey:@"width"];

      char v15 = *(unsigned char *)(a1 + 24);
    }
    if (v15)
    {
      v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      [v4 setObject:v17 forKey:@"height"];
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
  return -[GEOImageServiceRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOImageServiceRequest)initWithDictionary:(id)a3
{
  return (GEOImageServiceRequest *)-[GEOImageServiceRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"imageId";
      }
      else {
        v6 = @"image_id";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v14 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                char v15 = objc_msgSend(v14, "initWithBase64EncodedString:options:", v13, 0, (void)v19);
                [a1 addImageId:v15];
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v10);
        }
      }
      v16 = [v5 objectForKeyedSubscript:@"width"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setWidth:", objc_msgSend(v16, "unsignedIntValue"));
      }

      v17 = [v5 objectForKeyedSubscript:@"height"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setHeight:", objc_msgSend(v17, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOImageServiceRequest)initWithJSON:(id)a3
{
  return (GEOImageServiceRequest *)-[GEOImageServiceRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOImageServiceRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOImageServiceRequestReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_imageIds;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
  }
  if (flags) {
    PBDataWriterWriteUint32Field();
  }
}

- (unsigned)requestTypeCode
{
  return 1024;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  [(GEOImageServiceRequest *)self readAll:0];
  if ([(GEOImageServiceRequest *)self imageIdsCount])
  {
    [v9 clearImageIds];
    unint64_t v4 = [(GEOImageServiceRequest *)self imageIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOImageServiceRequest *)self imageIdAtIndex:i];
        [v9 addImageId:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v9 + 5) = self->_width;
    *((unsigned char *)v9 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v9 + 4) = self->_height;
    *((unsigned char *)v9 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_imageIds;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (void)v14);
        [(id)v5 addImageId:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_width;
    *(unsigned char *)(v5 + 24) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 16) = self->_height;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEOImageServiceRequest *)self readAll:1];
  [v4 readAll:1];
  imageIds = self->_imageIds;
  if ((unint64_t)imageIds | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](imageIds, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_width != *((_DWORD *)v4 + 5)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_height != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  [(GEOImageServiceRequest *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_imageIds hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_width;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_height;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOImageServiceRequest addImageId:](self, "addImageId:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 24);
  if ((v10 & 2) != 0)
  {
    self->_width = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_flags |= 2u;
    char v10 = *((unsigned char *)v4 + 24);
  }
  if (v10)
  {
    self->_height = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end