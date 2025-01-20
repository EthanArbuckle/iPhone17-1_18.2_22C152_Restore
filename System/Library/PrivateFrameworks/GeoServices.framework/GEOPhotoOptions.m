@interface GEOPhotoOptions
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPhotoType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPhotoOptions)initWithDictionary:(id)a3;
- (GEOPhotoOptions)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)photoSizesAsString:(int)a3;
- (id)photoTypeAsString:(int)a3;
- (int)StringAsPhotoSizes:(id)a3;
- (int)StringAsPhotoType:(id)a3;
- (int)maxPhotos;
- (int)photoSizeAtIndex:(unint64_t)a3;
- (int)photoSizes;
- (int)photoType;
- (unint64_t)hash;
- (unint64_t)photoSizesCount;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)addPhotoSize:(int)a3;
- (void)clearPhotoSizes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasPhotoType:(BOOL)a3;
- (void)setMaxPhotos:(int)a3;
- (void)setPhotoSizes:(int *)a3 count:(unint64_t)a4;
- (void)setPhotoType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPhotoOptions

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPhotoOptions;
  [(GEOPhotoOptions *)&v3 dealloc];
}

- (int)maxPhotos
{
  return self->_maxPhotos;
}

- (void)setMaxPhotos:(int)a3
{
  self->_maxPhotos = a3;
}

- (int)photoType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_photoType;
  }
  else {
    return 0;
  }
}

- (void)setPhotoType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_photoType = a3;
}

- (void)setHasPhotoType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasPhotoType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)photoTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    objc_super v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v3 = off_1E53E6FD8[a3];
  }

  return v3;
}

- (int)StringAsPhotoType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STOREFRONT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TOP_RATED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"USER"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PRIMARY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"STANDARD"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)photoSizesCount
{
  return self->_photoSizes.count;
}

- (int)photoSizes
{
  return self->_photoSizes.list;
}

- (void)clearPhotoSizes
{
}

- (void)addPhotoSize:(int)a3
{
}

- (int)photoSizeAtIndex:(unint64_t)a3
{
  p_photoSizes = &self->_photoSizes;
  unint64_t count = self->_photoSizes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_photoSizes->list[a3];
}

- (void)setPhotoSizes:(int *)a3 count:(unint64_t)a4
{
}

- (id)photoSizesAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53E7000[a3];
  }

  return v3;
}

- (int)StringAsPhotoSizes:(id)a3
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPhotoOptions;
  int v4 = [(GEOPhotoOptions *)&v8 description];
  v5 = [(GEOPhotoOptions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPhotoOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    [v4 setObject:v5 forKey:@"maxPhotos"];

    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v6 = *(int *)(a1 + 44);
      if (v6 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v7 = off_1E53E6FD8[v6];
      }
      [v4 setObject:v7 forKey:@"photoType"];
    }
    if (*(void *)(a1 + 24))
    {
      objc_super v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v9 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v10 = 0;
        do
        {
          uint64_t v11 = *(int *)(*v9 + 4 * v10);
          if (v11 >= 0xA)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = off_1E53E7000[v11];
          }
          [v8 addObject:v12];

          ++v10;
          v9 = (void *)(a1 + 16);
        }
        while (v10 < *(void *)(a1 + 24));
      }
      [v4 setObject:v8 forKey:@"photoSize"];
    }
    v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __45__GEOPhotoOptions__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEOPhotoOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOPhotoOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (GEOPhotoOptions)initWithDictionary:(id)a3
{
  return (GEOPhotoOptions *)-[GEOPhotoOptions _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_57;
  }
  int v4 = (void *)[a1 init];
  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"maxPhotos"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v4, "setMaxPhotos:", objc_msgSend(v5, "intValue"));
    }

    uint64_t v6 = [v3 objectForKeyedSubscript:@"photoType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      if ([v7 isEqualToString:@"STOREFRONT"])
      {
        uint64_t v8 = 0;
      }
      else if ([v7 isEqualToString:@"TOP_RATED"])
      {
        uint64_t v8 = 1;
      }
      else if ([v7 isEqualToString:@"USER"])
      {
        uint64_t v8 = 2;
      }
      else if ([v7 isEqualToString:@"PRIMARY"])
      {
        uint64_t v8 = 3;
      }
      else if ([v7 isEqualToString:@"STANDARD"])
      {
        uint64_t v8 = 4;
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_21:

        v9 = [v3 objectForKeyedSubscript:@"photoSize"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_56;
        }
        v19 = v9;
        id v20 = v3;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (!v11) {
          goto LABEL_55;
        }
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v22;
        while (1)
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v16 = v15;
              if ([v16 isEqualToString:@"PX20"])
              {
                uint64_t v17 = 0;
              }
              else if ([v16 isEqualToString:@"PX30"])
              {
                uint64_t v17 = 1;
              }
              else if ([v16 isEqualToString:@"PX40"])
              {
                uint64_t v17 = 2;
              }
              else if ([v16 isEqualToString:@"PX60"])
              {
                uint64_t v17 = 3;
              }
              else if ([v16 isEqualToString:@"PX100"])
              {
                uint64_t v17 = 4;
              }
              else if ([v16 isEqualToString:@"PX120"])
              {
                uint64_t v17 = 5;
              }
              else if ([v16 isEqualToString:@"PX250"])
              {
                uint64_t v17 = 6;
              }
              else if ([v16 isEqualToString:@"PX1000"])
              {
                uint64_t v17 = 7;
              }
              else if ([v16 isEqualToString:@"PX600_400"])
              {
                uint64_t v17 = 8;
              }
              else if ([v16 isEqualToString:@"PX248_186"])
              {
                uint64_t v17 = 9;
              }
              else
              {
                uint64_t v17 = 0;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_53;
              }
              uint64_t v17 = [v15 intValue];
            }
            objc_msgSend(v4, "addPhotoSize:", v17, v19, v20, (void)v21);
LABEL_53:
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (!v12)
          {
LABEL_55:

            v9 = v19;
            id v3 = v20;
LABEL_56:

            goto LABEL_57;
          }
        }
      }
      uint64_t v8 = [v6 intValue];
    }
    [v4 setPhotoType:v8];
    goto LABEL_21;
  }
LABEL_57:

  return v4;
}

- (GEOPhotoOptions)initWithJSON:(id)a3
{
  return (GEOPhotoOptions *)-[GEOPhotoOptions _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPhotoOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPhotoOptionsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = v6;
  if (self->_photoSizes.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_photoSizes.count);
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  [(GEOPhotoOptions *)self readAll:0];
  v7[10] = self->_maxPhotos;
  if (*(unsigned char *)&self->_flags)
  {
    v7[11] = self->_photoType;
    *((unsigned char *)v7 + 48) |= 1u;
  }
  if ([(GEOPhotoOptions *)self photoSizesCount])
  {
    [v7 clearPhotoSizes];
    unint64_t v4 = [(GEOPhotoOptions *)self photoSizesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addPhotoSize:", -[GEOPhotoOptions photoSizeAtIndex:](self, "photoSizeAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = (id *)v4;
  *(_DWORD *)(v4 + 40) = self->_maxPhotos;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v4 + 44) = self->_photoType;
    *(unsigned char *)(v4 + 48) |= 1u;
  }
  PBRepeatedInt32Copy();
  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOPhotoOptions *)self readAll:1];
  [v4 readAll:1];
  if (self->_maxPhotos != *((_DWORD *)v4 + 10)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_photoType != *((_DWORD *)v4 + 11)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_9:
    char IsEqual = 0;
    goto LABEL_10;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_10:

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOPhotoOptions *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_photoType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = 2654435761 * self->_maxPhotos;
  return v3 ^ PBRepeatedInt32Hash() ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (int *)a3;
  [v7 readAll:0];
  self->_maxPhotos = v7[10];
  if (v7[12])
  {
    self->_photoType = v7[11];
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v4 = [v7 photoSizesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[GEOPhotoOptions addPhotoSize:](self, "addPhotoSize:", [v7 photoSizeAtIndex:i]);
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
    [(GEOPhotoOptions *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end