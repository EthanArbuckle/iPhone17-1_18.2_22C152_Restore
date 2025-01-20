@interface GEOPDTooltip
+ (id)tooltipFromPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTooltip)init;
- (GEOPDTooltip)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)actionLink;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)photo;
- (id)subtitle;
- (id)title;
- (uint64_t)toolTipType;
- (unint64_t)hash;
- (void)_readActionLink;
- (void)_readPhoto;
- (void)_readSubtitle;
- (void)_readTitle;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTooltip

+ (id)tooltipFromPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__GEOPDTooltip_PlaceDataExtras__tooltipFromPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:99 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __54__GEOPDTooltip_PlaceDataExtras__tooltipFromPlaceData___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t v5 = -[GEOPDComponentValue toolTip](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = 1;
}

- (GEOPDTooltip)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTooltip;
  v2 = [(GEOPDTooltip *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDTooltip)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTooltip;
  id v3 = [(GEOPDTooltip *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTooltipReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_9055);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)title
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTooltip _readTitle]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSubtitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTooltipReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubtitle_tags_9056);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)subtitle
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTooltip _readSubtitle]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readActionLink
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTooltipReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readActionLink_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)actionLink
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTooltip _readActionLink]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPhoto
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTooltipReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoto_tags_9057);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)photo
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTooltip _readPhoto]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)toolTipType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 72);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if (v2) {
      return *(unsigned int *)(v1 + 68);
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
  v8.super_class = (Class)GEOPDTooltip;
  id v4 = [(GEOPDTooltip *)&v8 description];
  uint64_t v5 = [(GEOPDTooltip *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTooltip _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDTooltip readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = -[GEOPDTooltip title]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"title"];
    }
    objc_super v8 = -[GEOPDTooltip subtitle]((id *)a1);
    uint64_t v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"subtitle"];
    }
    v11 = -[GEOPDTooltip actionLink]((id *)a1);
    id v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"actionLink";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"action_link";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = -[GEOPDTooltip photo]((id *)a1);
    v16 = v15;
    if (v15)
    {
      if (a2) {
        [v15 jsonRepresentation];
      }
      else {
      v17 = [v15 dictionaryRepresentation];
      }
      [v4 setObject:v17 forKey:@"photo"];
    }
    if (*(unsigned char *)(a1 + 72))
    {
      int v18 = *(_DWORD *)(a1 + 68);
      if (v18)
      {
        if (v18 == 1)
        {
          v19 = @"HIKE_SUGGESTION";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 68));
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v19 = @"DEFAULT";
      }
      if (a2) {
        v20 = @"toolTipType";
      }
      else {
        v20 = @"tool_tip_type";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = *(void **)(a1 + 16);
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __42__GEOPDTooltip__dictionaryRepresentation___block_invoke;
        v28[3] = &unk_1E53D8860;
        id v25 = v24;
        id v29 = v25;
        [v23 enumerateKeysAndObjectsUsingBlock:v28];
        id v26 = v25;

        v23 = v26;
      }
      [v4 setObject:v23 forKey:@"Unknown Fields"];
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
  return -[GEOPDTooltip _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_9064;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_9065;
      }
      GEOPDTooltipReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDTooltipCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __42__GEOPDTooltip__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTooltipReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_14;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x40) != 0) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    if (GEOLocalizedStringIsDirty((uint64_t)self->_title)) {
      goto LABEL_14;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 0x10) != 0)
  {
    if (GEOLocalizedStringIsDirty((uint64_t)self->_subtitle)) {
      goto LABEL_14;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    if (GEOLocalizedStringIsDirty((uint64_t)self->_actionLink)) {
      goto LABEL_14;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 8) == 0 || !GEOPDPhotoIsDirty((uint64_t)self->_photo))
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_25;
  }
LABEL_14:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTooltip readAll:]((uint64_t)self, 0);
  if (self->_title) {
    PBDataWriterWriteSubmessage();
  }
  id v6 = v9;
  if (self->_subtitle)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v9;
  }
  if (self->_actionLink)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v9;
  }
  if (self->_photo)
  {
    PBDataWriterWriteSubmessage();
    id v6 = v9;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v6 = v9;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_25:
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
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDTooltipReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTooltip readAll:]((uint64_t)self, 0);
  id v9 = [(GEOLocalizedString *)self->_title copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  id v11 = [(GEOLocalizedString *)self->_subtitle copyWithZone:a3];
  id v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  id v13 = [(GEOLocalizedString *)self->_actionLink copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  id v15 = [(GEOPDPhoto *)self->_photo copyWithZone:a3];
  v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_toolTipType;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  -[GEOPDTooltip readAll:]((uint64_t)self, 1);
  -[GEOPDTooltip readAll:]((uint64_t)v4, 1);
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 6))
  {
    if (!-[GEOLocalizedString isEqual:](title, "isEqual:")) {
      goto LABEL_14;
    }
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 5))
  {
    if (!-[GEOLocalizedString isEqual:](subtitle, "isEqual:")) {
      goto LABEL_14;
    }
  }
  actionLink = self->_actionLink;
  if ((unint64_t)actionLink | *((void *)v4 + 3))
  {
    if (!-[GEOLocalizedString isEqual:](actionLink, "isEqual:")) {
      goto LABEL_14;
    }
  }
  photo = self->_photo;
  if ((unint64_t)photo | *((void *)v4 + 4))
  {
    if (!-[GEOPDPhoto isEqual:](photo, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 72) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) != 0 && self->_toolTipType == *((_DWORD *)v4 + 17))
    {
      BOOL v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDTooltip readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOLocalizedString *)self->_title hash];
  unint64_t v4 = [(GEOLocalizedString *)self->_subtitle hash];
  unint64_t v5 = [(GEOLocalizedString *)self->_actionLink hash];
  unint64_t v6 = [(GEOPDPhoto *)self->_photo hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v7 = 2654435761 * self->_toolTipType;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_actionLink, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end