@interface GEORPGroundViewImageResource
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCameraNumber;
- (BOOL)hasLoadStatus;
- (BOOL)hasLod;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPGroundViewImageResource)initWithDictionary:(id)a3;
- (GEORPGroundViewImageResource)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)loadStatusAsString:(int)a3;
- (int)StringAsLoadStatus:(id)a3;
- (int)loadStatus;
- (unint64_t)hash;
- (unsigned)cameraNumber;
- (unsigned)lod;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCameraNumber:(unsigned int)a3;
- (void)setHasCameraNumber:(BOOL)a3;
- (void)setHasLoadStatus:(BOOL)a3;
- (void)setHasLod:(BOOL)a3;
- (void)setLoadStatus:(int)a3;
- (void)setLod:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPGroundViewImageResource

- (unsigned)cameraNumber
{
  return self->_cameraNumber;
}

- (void)setCameraNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_cameraNumber = a3;
}

- (void)setHasCameraNumber:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCameraNumber
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)lod
{
  return self->_lod;
}

- (void)setLod:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_lod = a3;
}

- (void)setHasLod:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLod
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)loadStatus
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_loadStatus;
  }
  else {
    return 0;
  }
}

- (void)setLoadStatus:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_loadStatus = a3;
}

- (void)setHasLoadStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLoadStatus
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)loadStatusAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53DBC88[a3];
  }

  return v3;
}

- (int)StringAsLoadStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"IMAGE_LOAD_STATUS_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IMAGE_LOAD_STATUS_SUCCESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IMAGE_LOAD_STATUS_FAILED"])
  {
    int v4 = 2;
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
  v8.super_class = (Class)GEORPGroundViewImageResource;
  int v4 = [(GEORPGroundViewImageResource *)&v8 description];
  v5 = [(GEORPGroundViewImageResource *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPGroundViewImageResource _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_22;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if (v5)
  {
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    if (a2) {
      v7 = @"cameraNumber";
    }
    else {
      v7 = @"camera_number";
    }
    [v4 setObject:v6 forKey:v7];

    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)(a1 + 28) & 4) == 0)
  {
    goto LABEL_4;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
  [v4 setObject:v8 forKey:@"lod"];

  if ((*(unsigned char *)(a1 + 28) & 2) == 0) {
    goto LABEL_18;
  }
LABEL_11:
  uint64_t v9 = *(int *)(a1 + 20);
  if (v9 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E53DBC88[v9];
  }
  if (a2) {
    v11 = @"loadStatus";
  }
  else {
    v11 = @"load_status";
  }
  [v4 setObject:v10 forKey:v11];

LABEL_18:
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
      v19[2] = __58__GEORPGroundViewImageResource__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E53D8860;
      id v16 = v15;
      id v20 = v16;
      [v14 enumerateKeysAndObjectsUsingBlock:v19];
      id v17 = v16;

      v14 = v17;
    }
    [v4 setObject:v14 forKey:@"Unknown Fields"];
  }
LABEL_22:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPGroundViewImageResource _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEORPGroundViewImageResource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEORPGroundViewImageResource)initWithDictionary:(id)a3
{
  return (GEORPGroundViewImageResource *)-[GEORPGroundViewImageResource _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"cameraNumber";
      }
      else {
        v6 = @"camera_number";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCameraNumber:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"lod"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLod:", objc_msgSend(v8, "unsignedIntValue"));
      }

      if (a3) {
        uint64_t v9 = @"loadStatus";
      }
      else {
        uint64_t v9 = @"load_status";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        if ([v11 isEqualToString:@"IMAGE_LOAD_STATUS_UNKNOWN"])
        {
          uint64_t v12 = 0;
        }
        else if ([v11 isEqualToString:@"IMAGE_LOAD_STATUS_SUCCESS"])
        {
          uint64_t v12 = 1;
        }
        else if ([v11 isEqualToString:@"IMAGE_LOAD_STATUS_FAILED"])
        {
          uint64_t v12 = 2;
        }
        else
        {
          uint64_t v12 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_25:

          goto LABEL_26;
        }
        uint64_t v12 = [v10 intValue];
      }
      [a1 setLoadStatus:v12];
      goto LABEL_25;
    }
  }
LABEL_26:

  return a1;
}

- (GEORPGroundViewImageResource)initWithJSON:(id)a3
{
  return (GEORPGroundViewImageResource *)-[GEORPGroundViewImageResource _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPGroundViewImageResourceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPGroundViewImageResourceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
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
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORPGroundViewImageResource *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[4] = self->_cameraNumber;
    *((unsigned char *)v5 + 28) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[6] = self->_lod;
  *((unsigned char *)v5 + 28) |= 4u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    v5[5] = self->_loadStatus;
    *((unsigned char *)v5 + 28) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v4 + 24) = self->_lod;
    *(unsigned char *)(v4 + 28) |= 4u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 16) = self->_cameraNumber;
  *(unsigned char *)(v4 + 28) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v4 + 20) = self->_loadStatus;
    *(unsigned char *)(v4 + 28) |= 2u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEORPGroundViewImageResource *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_cameraNumber != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_lod != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_loadStatus != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEORPGroundViewImageResource *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_cameraNumber;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_lod;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_loadStatus;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if (v4)
  {
    self->_cameraNumber = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v5 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_lod = *((_DWORD *)v5 + 6);
  *(unsigned char *)&self->_flags |= 4u;
  if ((*((unsigned char *)v5 + 28) & 2) != 0)
  {
LABEL_4:
    self->_loadStatus = *((_DWORD *)v5 + 5);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_5:
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
    [(GEORPGroundViewImageResource *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end