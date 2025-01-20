@interface GEOPDPhotoConstraints
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)addMediaTypes:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPhotoConstraints

- (void)addMediaTypes:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDPhotoConstraints;
  v4 = [(GEOPDPhotoConstraints *)&v8 description];
  id v5 = [(GEOPDPhotoConstraints *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPhotoConstraints _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v6 = 0;
    goto LABEL_25;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = v4;
  if (*(void *)(a1 + 16)) {
    objc_msgSend(v4, "setObject:forKey:");
  }
  char v7 = *(unsigned char *)(a1 + 40);
  if ((v7 & 8) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 36)];
    if (a2) {
      v9 = @"maxNumberOfPhotos";
    }
    else {
      v9 = @"max_number_of_photos";
    }
    [v6 setObject:v8 forKey:v9];

    char v7 = *(unsigned char *)(a1 + 40);
    if ((v7 & 1) == 0)
    {
LABEL_6:
      if ((v7 & 2) == 0) {
        goto LABEL_7;
      }
LABEL_17:
      v12 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      if (a2) {
        v13 = @"minPixels";
      }
      else {
        v13 = @"min_pixels";
      }
      [v6 setObject:v12 forKey:v13];

      if ((*(unsigned char *)(a1 + 40) & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)(a1 + 40) & 1) == 0)
  {
    goto LABEL_6;
  }
  v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 8)];
  if (a2) {
    v11 = @"maxPixels";
  }
  else {
    v11 = @"max_pixels";
  }
  [v6 setObject:v10 forKey:v11];

  char v7 = *(unsigned char *)(a1 + 40);
  if ((v7 & 2) != 0) {
    goto LABEL_17;
  }
LABEL_7:
  if ((v7 & 4) != 0)
  {
LABEL_21:
    LODWORD(v5) = *(_DWORD *)(a1 + 32);
    v14 = [NSNumber numberWithFloat:v5];
    if (a2) {
      v15 = @"maxAspectRatio";
    }
    else {
      v15 = @"max_aspect_ratio";
    }
    [v6 setObject:v14 forKey:v15];
  }
LABEL_25:

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDPhotoConstraints _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPhotoConstraintsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = self->_mediaTypes;
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
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_10:
      if ((flags & 2) == 0) {
        goto LABEL_11;
      }
LABEL_16:
      PBDataWriterWriteUint64Field();
      if ((*(unsigned char *)&self->_flags & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint64Field();
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_16;
  }
LABEL_11:
  if ((flags & 4) != 0) {
LABEL_12:
  }
    PBDataWriterWriteFloatField();
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_mediaTypes;
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
        -[GEOPDPhotoConstraints addMediaTypes:](v5, v11);
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_maxNumberOfPhotos;
    *(unsigned char *)(v5 + 40) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_10:
      if ((flags & 2) == 0) {
        goto LABEL_11;
      }
LABEL_16:
      *(void *)(v5 + 24) = self->_minPixels;
      *(unsigned char *)(v5 + 40) |= 2u;
      if ((*(unsigned char *)&self->_flags & 4) == 0) {
        return (id)v5;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_10;
  }
  *(void *)(v5 + 8) = self->_maxPixels;
  *(unsigned char *)(v5 + 40) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_16;
  }
LABEL_11:
  if ((flags & 4) != 0)
  {
LABEL_12:
    *(float *)(v5 + 32) = self->_maxAspectRatio;
    *(unsigned char *)(v5 + 40) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  mediaTypes = self->_mediaTypes;
  if ((unint64_t)mediaTypes | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](mediaTypes, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_maxNumberOfPhotos != *((_DWORD *)v4 + 9)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
LABEL_23:
    BOOL v6 = 0;
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_maxPixels != *((void *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_minPixels != *((void *)v4 + 3)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_23;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_maxAspectRatio != *((float *)v4 + 8)) {
      goto LABEL_23;
    }
    BOOL v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_mediaTypes hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_maxNumberOfPhotos;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_maxPixels;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      unint64_t v6 = 0;
      if ((*(unsigned char *)&self->_flags & 4) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v11;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  unint64_t v6 = 2654435761u * self->_minPixels;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  float maxAspectRatio = self->_maxAspectRatio;
  double v8 = maxAspectRatio;
  if (maxAspectRatio < 0.0) {
    double v8 = -maxAspectRatio;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11;
}

- (void).cxx_destruct
{
}

@end