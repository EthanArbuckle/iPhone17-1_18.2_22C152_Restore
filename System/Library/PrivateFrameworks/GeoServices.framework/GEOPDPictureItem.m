@interface GEOPDPictureItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPictureItem)init;
- (GEOPDPictureItem)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)photo;
- (id)primaryText;
- (id)secondaryText;
- (uint64_t)photoItemType;
- (unint64_t)hash;
- (void)_readPhoto;
- (void)_readPrimaryText;
- (void)_readSecondaryText;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPictureItem

- (GEOPDPictureItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPictureItem;
  v2 = [(GEOPDPictureItem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPictureItem)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPictureItem;
  v3 = [(GEOPDPictureItem *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPhoto
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPictureItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoto_tags_6916);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)photo
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPictureItem _readPhoto]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPrimaryText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPictureItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrimaryText_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)primaryText
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPictureItem _readPrimaryText]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSecondaryText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPictureItemReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSecondaryText_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)secondaryText
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDPictureItem _readSecondaryText]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)photoItemType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 64);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    if (v2) {
      return *(unsigned int *)(v1 + 60);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPictureItem;
  v4 = [(GEOPDPictureItem *)&v8 description];
  v5 = [(GEOPDPictureItem *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPictureItem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDPictureItem readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDPictureItem photo]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"photo"];
    }
    objc_super v8 = -[GEOPDPictureItem primaryText]((id *)a1);
    if (v8)
    {
      if (a2) {
        v9 = @"primaryText";
      }
      else {
        v9 = @"primary_text";
      }
      [v4 setObject:v8 forKey:v9];
    }

    v10 = -[GEOPDPictureItem secondaryText]((id *)a1);
    if (v10)
    {
      if (a2) {
        v11 = @"secondaryText";
      }
      else {
        v11 = @"secondary_text";
      }
      [v4 setObject:v10 forKey:v11];
    }

    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v12 = *(int *)(a1 + 60);
      if (v12 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E53E3E78[v12];
      }
      if (a2) {
        v14 = @"photoItemType";
      }
      else {
        v14 = @"photo_item_type";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = *(void **)(a1 + 16);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __46__GEOPDPictureItem__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPictureItem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_6935;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_6936;
      }
      GEOPDPictureItemReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDPhoto readAll:](*(void *)(a1 + 24), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __46__GEOPDPictureItem__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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
  return GEOPDPictureItemReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_7;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x20) != 0) {
    goto LABEL_7;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if (GEOPDPhotoIsDirty((uint64_t)self->_photo)) {
      goto LABEL_7;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 0x18) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_16;
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPictureItem readAll:]((uint64_t)self, 0);
  if (self->_photo) {
    PBDataWriterWriteSubmessage();
  }
  id v6 = v9;
  if (self->_primaryText)
  {
    PBDataWriterWriteStringField();
    id v6 = v9;
  }
  if (self->_secondaryText)
  {
    PBDataWriterWriteStringField();
    id v6 = v9;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v6 = v9;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_16:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPictureItemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPictureItem readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDPhoto *)self->_photo copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_primaryText copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  uint64_t v13 = [(NSString *)self->_secondaryText copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_photoItemType;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  v15 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  -[GEOPDPictureItem readAll:]((uint64_t)self, 1);
  -[GEOPDPictureItem readAll:]((uint64_t)v4, 1);
  photo = self->_photo;
  if ((unint64_t)photo | *((void *)v4 + 3))
  {
    if (!-[GEOPDPhoto isEqual:](photo, "isEqual:")) {
      goto LABEL_12;
    }
  }
  primaryText = self->_primaryText;
  if ((unint64_t)primaryText | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](primaryText, "isEqual:")) {
      goto LABEL_12;
    }
  }
  secondaryText = self->_secondaryText;
  if ((unint64_t)secondaryText | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](secondaryText, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 64) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) != 0 && self->_photoItemType == *((_DWORD *)v4 + 15))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDPictureItem readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDPhoto *)self->_photo hash];
  NSUInteger v4 = [(NSString *)self->_primaryText hash];
  NSUInteger v5 = [(NSString *)self->_secondaryText hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_photoItemType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end