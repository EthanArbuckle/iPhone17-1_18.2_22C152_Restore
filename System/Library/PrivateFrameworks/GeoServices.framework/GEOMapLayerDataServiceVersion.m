@interface GEOMapLayerDataServiceVersion
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

@implementation GEOMapLayerDataServiceVersion

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapLayerDataServiceVersion;
  v4 = [(GEOMapLayerDataServiceVersion *)&v8 description];
  v5 = [(GEOMapLayerDataServiceVersion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapLayerDataServiceVersion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_18;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 20) & 2) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 12)];
    if (a2) {
      v9 = @"formatVersion";
    }
    else {
      v9 = @"format_version";
    }
    [v4 setObject:v8 forKey:v9];

    if ((*(unsigned char *)(a1 + 20) & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 8)];
  if (a2) {
    v7 = @"dataVersion";
  }
  else {
    v7 = @"data_version";
  }
  [v4 setObject:v6 forKey:v7];

  char v5 = *(unsigned char *)(a1 + 20);
  if ((v5 & 2) != 0) {
    goto LABEL_10;
  }
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_14:
    v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
    if (a2) {
      v11 = @"patchVersion";
    }
    else {
      v11 = @"patch_version";
    }
    [v4 setObject:v10 forKey:v11];
  }
LABEL_18:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapLayerDataServiceVersion _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapLayerDataServiceVersionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)result + 2) = self->_dataVersion;
    *((unsigned char *)result + 20) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_formatVersion;
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 4) = self->_patchVersion;
  *((unsigned char *)result + 20) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_dataVersion != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_formatVersion != *((_DWORD *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0 || self->_patchVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_dataVersion;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_formatVersion;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_patchVersion;
  return v3 ^ v2 ^ v4;
}

@end