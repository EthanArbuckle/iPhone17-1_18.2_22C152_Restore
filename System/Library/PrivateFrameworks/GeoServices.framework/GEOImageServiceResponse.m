@interface GEOImageServiceResponse
+ (BOOL)isValid:(id)a3;
+ (Class)imagesType;
- (BOOL)hasHeight;
- (BOOL)hasStatus;
- (BOOL)hasWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOImageServiceResponse)initWithDictionary:(id)a3;
- (GEOImageServiceResponse)initWithJSON:(id)a3;
- (NSMutableArray)images;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)imagesAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (unint64_t)imagesCount;
- (unsigned)height;
- (unsigned)width;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)addImages:(id)a3;
- (void)clearImages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHeight:(unsigned int)a3;
- (void)setImages:(id)a3;
- (void)setStatus:(int)a3;
- (void)setWidth:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOImageServiceResponse

- (int)status
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 <= 29)
  {
    v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        v4 = @"STATUS_FAILED";
        break;
      case 2:
        v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_INCOMPLETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALID_REQUEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAILED_NO_RESULT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"NEEDS_REFINEMENT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"STATUS_DEDUPED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"VERSION_MISMATCH"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
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

- (void)addImages:(id)a3
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

- (id)imagesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_images objectAtIndex:a3];
}

+ (Class)imagesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOImageServiceResponse;
  id v4 = [(GEOImageServiceResponse *)&v8 description];
  v5 = [(GEOImageServiceResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOImageServiceResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_37;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 2) != 0)
  {
    int v6 = *(_DWORD *)(a1 + 20);
    if (v6 <= 29)
    {
      v7 = @"STATUS_SUCCESS";
      switch(v6)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v7 = @"STATUS_FAILED";
          break;
        case 2:
          v7 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v7 = @"INVALID_REQUEST";
          break;
        default:
          if (v6 != 20) {
            goto LABEL_15;
          }
          v7 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v6 > 49)
    {
      if (v6 == 50)
      {
        v7 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v6 == 60)
      {
        v7 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v6 == 30)
      {
        v7 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v6 == 40)
      {
        v7 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        [v4 setObject:v7 forKey:@"status"];

        char v5 = *(unsigned char *)(a1 + 28);
        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 20));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if ((v5 & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    [v4 setObject:v8 forKey:@"width"];

    char v5 = *(unsigned char *)(a1 + 28);
  }
  if (v5)
  {
    v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    [v4 setObject:v9 forKey:@"height"];
  }
  if ([*(id *)(a1 + 8) count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = *(id *)(a1 + 8);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (a2) {
            [v16 jsonRepresentation];
          }
          else {
          v17 = [v16 dictionaryRepresentation];
          }
          [v10 addObject:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"images"];
  }
LABEL_37:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOImageServiceResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOImageServiceResponse)initWithDictionary:(id)a3
{
  return (GEOImageServiceResponse *)-[GEOImageServiceResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_46;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_46;
  }
  int v6 = [v5 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v8 = 20;
    }
    else if ([v7 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v8 = 30;
    }
    else if ([v7 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v8 = 40;
    }
    else if ([v7 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v8 = 50;
    }
    else if ([v7 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v8 = 60;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_26:
    [a1 setStatus:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"width"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWidth:", objc_msgSend(v9, "unsignedIntValue"));
  }

  v10 = [v5 objectForKeyedSubscript:@"height"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setHeight:", objc_msgSend(v10, "unsignedIntValue"));
  }

  id v11 = [v5 objectForKeyedSubscript:@"images"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v5;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v18 = [GEOImageServiceImage alloc];
            if (a3) {
              uint64_t v19 = [(GEOImageServiceImage *)v18 initWithJSON:v17];
            }
            else {
              uint64_t v19 = [(GEOImageServiceImage *)v18 initWithDictionary:v17];
            }
            long long v20 = (void *)v19;
            [a1 addImages:v19];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    id v5 = v22;
  }

LABEL_46:
  return a1;
}

- (GEOImageServiceResponse)initWithJSON:(id)a3
{
  return (GEOImageServiceResponse *)-[GEOImageServiceResponse _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOImageServiceResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOImageServiceResponseReadAllFrom(self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_flags) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v6 = self->_images;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = a3;
  [(GEOImageServiceResponse *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_3;
    }
LABEL_13:
    v9[6] = self->_width;
    *((unsigned char *)v9 + 28) |= 4u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v9[5] = self->_status;
  *((unsigned char *)v9 + 28) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_13;
  }
LABEL_3:
  if (flags)
  {
LABEL_4:
    v9[4] = self->_height;
    *((unsigned char *)v9 + 28) |= 1u;
  }
LABEL_5:
  if ([(GEOImageServiceResponse *)self imagesCount])
  {
    [v9 clearImages];
    unint64_t v5 = [(GEOImageServiceResponse *)self imagesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOImageServiceResponse *)self imagesAtIndex:i];
        [v9 addImages:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_status;
    *(unsigned char *)(v5 + 28) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_width;
  *(unsigned char *)(v5 + 28) |= 4u;
  if (*(unsigned char *)&self->_flags)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_height;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
LABEL_5:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_images;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [v6 addImages:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEOImageServiceResponse *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_status != *((_DWORD *)v4 + 5)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_width != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_height != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_19;
  }
  images = self->_images;
  if ((unint64_t)images | *((void *)v4 + 1)) {
    char v6 = -[NSMutableArray isEqual:](images, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  [(GEOImageServiceResponse *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_images hash];
  }
  uint64_t v3 = 2654435761 * self->_status;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_width;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_height;
  return v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_images hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_width = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_flags |= 4u;
  if (*((unsigned char *)v4 + 28))
  {
LABEL_4:
    self->_height = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
LABEL_5:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOImageServiceResponse addImages:](self, "addImages:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
}

@end