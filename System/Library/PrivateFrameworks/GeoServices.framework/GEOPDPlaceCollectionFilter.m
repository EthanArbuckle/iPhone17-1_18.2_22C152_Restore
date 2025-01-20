@interface GEOPDPlaceCollectionFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceCollectionFilter

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v2 = 2654435761 * self->_expectedResultCount;
    if ((*(unsigned char *)&self->_flags & 0x40) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_partiallyClientize;
      if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_flags & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_isCollectionView;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_enableCollectionItemDescription;
    if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_overrideSuppress;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_enableMediaLink;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_includePlaceCollectionItemPhotos;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_7:
    if ((flags & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceCollectionFilter;
  uint64_t v4 = [(GEOPDPlaceCollectionFilter *)&v8 description];
  id v5 = [(GEOPDPlaceCollectionFilter *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceCollectionFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    uint64_t v4 = 0;
    goto LABEL_17;
  }
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if (v5)
  {
    v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    if (a2) {
      v16 = @"expectedResultCount";
    }
    else {
      v16 = @"expected_result_count";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 0x40) == 0)
    {
LABEL_4:
      if ((v5 & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)(a1 + 28) & 0x40) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 25)];
  if (a2) {
    v18 = @"partiallyClientize";
  }
  else {
    v18 = @"partially_clientize";
  }
  [v4 setObject:v17 forKey:v18];

  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_28:
  v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 23)];
  if (a2) {
    v20 = @"isCollectionView";
  }
  else {
    v20 = @"is_collection_view";
  }
  [v4 setObject:v19 forKey:v20];

  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_32:
  v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
  if (a2) {
    v22 = @"enableCollectionItemDescription";
  }
  else {
    v22 = @"enable_collection_item_description";
  }
  [v4 setObject:v21 forKey:v22];

  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_36:
  v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 24)];
  if (a2) {
    v24 = @"overrideSuppress";
  }
  else {
    v24 = @"override_suppress";
  }
  [v4 setObject:v23 forKey:v24];

  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
LABEL_40:
  v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 21)];
  if (a2) {
    v26 = @"enableMediaLink";
  }
  else {
    v26 = @"enable_media_link";
  }
  [v4 setObject:v25 forKey:v26];

  if ((*(unsigned char *)(a1 + 28) & 8) != 0)
  {
LABEL_9:
    uint64_t v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 22)];
    if (a2) {
      uint64_t v7 = @"includePlaceCollectionItemPhotos";
    }
    else {
      uint64_t v7 = @"include_place_collection_item_photos";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_13:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __56__GEOPDPlaceCollectionFilter__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E53D8860;
      id v12 = v11;
      id v28 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v27];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_17:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceCollectionFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPDPlaceCollectionFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceCollectionFilterReadAllFrom((uint64_t)self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v4 + 16) = self->_expectedResultCount;
    *(unsigned char *)(v4 + 28) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v4 + 25) = self->_partiallyClientize;
  *(unsigned char *)(v4 + 28) |= 0x40u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *(unsigned char *)(v4 + 23) = self->_isCollectionView;
  *(unsigned char *)(v4 + 28) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(unsigned char *)(v4 + 20) = self->_enableCollectionItemDescription;
  *(unsigned char *)(v4 + 28) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    *(unsigned char *)(v4 + 21) = self->_enableMediaLink;
    *(unsigned char *)(v4 + 28) |= 4u;
    if ((*(unsigned char *)&self->_flags & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_14:
  *(unsigned char *)(v4 + 24) = self->_overrideSuppress;
  *(unsigned char *)(v4 + 28) |= 0x20u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((flags & 8) != 0)
  {
LABEL_8:
    *(unsigned char *)(v4 + 22) = self->_includePlaceCollectionItemPhotos;
    *(unsigned char *)(v4 + 28) |= 8u;
  }
LABEL_9:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_expectedResultCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_49;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 0x40) == 0) {
      goto LABEL_49;
    }
    if (self->_partiallyClientize)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 0x40) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 0x10) == 0) {
      goto LABEL_49;
    }
    if (self->_isCollectionView)
    {
      if (!*((unsigned char *)v4 + 23)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 23))
    {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0) {
      goto LABEL_49;
    }
    if (self->_enableCollectionItemDescription)
    {
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 20))
    {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 0x20) == 0) {
      goto LABEL_49;
    }
    if (self->_overrideSuppress)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0) {
      goto LABEL_49;
    }
    if (self->_enableMediaLink)
    {
      if (!*((unsigned char *)v4 + 21)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 21))
    {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_49;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 8) == 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 8) != 0)
    {
      if (self->_includePlaceCollectionItemPhotos)
      {
        if (!*((unsigned char *)v4 + 22)) {
          goto LABEL_49;
        }
      }
      else if (*((unsigned char *)v4 + 22))
      {
        goto LABEL_49;
      }
      BOOL v5 = 1;
      goto LABEL_50;
    }
LABEL_49:
    BOOL v5 = 0;
  }
LABEL_50:

  return v5;
}

@end