@interface GEOPDContextualPhotoMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)addContextualPhotoLabel:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDContextualPhotoMetadata

- (void)addContextualPhotoLabel:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDContextualPhotoMetadata;
  v4 = [(GEOPDContextualPhotoMetadata *)&v8 description];
  id v5 = [(GEOPDContextualPhotoMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDContextualPhotoMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v5 = 0;
    goto LABEL_17;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = v4;
  if (*(void *)(a1 + 16)) {
    objc_msgSend(v4, "setObject:forKey:");
  }
  char v6 = *(unsigned char *)(a1 + 36);
  if (v6)
  {
    v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v17 = @"maxNumContextualPhotos";
    }
    else {
      v17 = @"max_num_contextual_photos";
    }
    [v5 setObject:v16 forKey:v17];

    char v6 = *(unsigned char *)(a1 + 36);
    if ((v6 & 2) == 0)
    {
LABEL_6:
      if ((v6 & 0x10) == 0) {
        goto LABEL_7;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)(a1 + 36) & 2) == 0)
  {
    goto LABEL_6;
  }
  v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
  if (a2) {
    v19 = @"maxNumPhotos";
  }
  else {
    v19 = @"max_num_photos";
  }
  [v5 setObject:v18 forKey:v19];

  char v6 = *(unsigned char *)(a1 + 36);
  if ((v6 & 0x10) == 0)
  {
LABEL_7:
    if ((v6 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_28:
  v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 34)];
  if (a2) {
    v21 = @"shouldLimitToPoisWithVendorTopPhoto";
  }
  else {
    v21 = @"should_limit_to_pois_with_vendor_top_photo";
  }
  [v5 setObject:v20 forKey:v21];

  char v6 = *(unsigned char *)(a1 + 36);
  if ((v6 & 8) == 0)
  {
LABEL_8:
    if ((v6 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
LABEL_32:
  v22 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 33)];
  if (a2) {
    v23 = @"shouldApplyContextualizationSearch";
  }
  else {
    v23 = @"should_apply_contextualization_search";
  }
  [v5 setObject:v22 forKey:v23];

  if ((*(unsigned char *)(a1 + 36) & 4) != 0)
  {
LABEL_9:
    id v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
    if (a2) {
      objc_super v8 = @"shouldApplyContextualizationPlacecard";
    }
    else {
      objc_super v8 = @"should_apply_contextualization_placecard";
    }
    [v5 setObject:v7 forKey:v8];
  }
LABEL_13:
  v9 = *(void **)(a1 + 8);
  if (v9)
  {
    v10 = [v9 dictionaryRepresentation];
    v11 = v10;
    if (a2)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __58__GEOPDContextualPhotoMetadata__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E53D8860;
      id v13 = v12;
      id v25 = v13;
      [v11 enumerateKeysAndObjectsUsingBlock:v24];
      id v14 = v13;

      v11 = v14;
    }
    [v5 setObject:v11 forKey:@"Unknown Fields"];
  }
LABEL_17:

  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDContextualPhotoMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEOPDContextualPhotoMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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
  return GEOPDContextualPhotoMetadataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_contextualPhotoLabels;
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
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_10:
      if ((flags & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_11:
    if ((flags & 8) == 0) {
      goto LABEL_12;
    }
LABEL_18:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_18;
  }
LABEL_12:
  if ((flags & 4) != 0) {
LABEL_13:
  }
    PBDataWriterWriteBOOLField();
LABEL_14:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_contextualPhotoLabels;
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
        -[GEOPDContextualPhotoMetadata addContextualPhotoLabel:](v5, v11);
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_maxNumContextualPhotos;
    *(unsigned char *)(v5 + 36) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_10:
      if ((flags & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 28) = self->_maxNumPhotos;
  *(unsigned char *)(v5 + 36) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_11:
    if ((flags & 8) == 0) {
      goto LABEL_12;
    }
LABEL_18:
    *(unsigned char *)(v5 + 33) = self->_shouldApplyContextualizationSearch;
    *(unsigned char *)(v5 + 36) |= 8u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_17:
  *(unsigned char *)(v5 + 34) = self->_shouldLimitToPoisWithVendorTopPhoto;
  *(unsigned char *)(v5 + 36) |= 0x10u;
  char flags = (char)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_18;
  }
LABEL_12:
  if ((flags & 4) != 0)
  {
LABEL_13:
    *(unsigned char *)(v5 + 32) = self->_shouldApplyContextualizationPlacecard;
    *(unsigned char *)(v5 + 36) |= 4u;
  }
LABEL_14:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  contextualPhotoLabels = self->_contextualPhotoLabels;
  if ((unint64_t)contextualPhotoLabels | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](contextualPhotoLabels, "isEqual:")) {
      goto LABEL_32;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_maxNumContextualPhotos != *((_DWORD *)v4 + 6)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_maxNumPhotos != *((_DWORD *)v4 + 7)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0) {
      goto LABEL_32;
    }
    if (self->_shouldLimitToPoisWithVendorTopPhoto)
    {
      if (!*((unsigned char *)v4 + 34)) {
        goto LABEL_32;
      }
    }
    else if (*((unsigned char *)v4 + 34))
    {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0) {
      goto LABEL_32;
    }
    if (self->_shouldApplyContextualizationSearch)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_32;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_32;
  }
  BOOL v6 = (*((unsigned char *)v4 + 36) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) != 0)
    {
      if (self->_shouldApplyContextualizationPlacecard)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_32;
        }
      }
      else if (*((unsigned char *)v4 + 32))
      {
        goto LABEL_32;
      }
      BOOL v6 = 1;
      goto LABEL_33;
    }
LABEL_32:
    BOOL v6 = 0;
  }
LABEL_33:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_contextualPhotoLabels hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_maxNumContextualPhotos;
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_maxNumPhotos;
      if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_shouldLimitToPoisWithVendorTopPhoto;
    if ((*(unsigned char *)&self->_flags & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_9:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_shouldApplyContextualizationSearch;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_shouldApplyContextualizationPlacecard;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualPhotoLabels, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end