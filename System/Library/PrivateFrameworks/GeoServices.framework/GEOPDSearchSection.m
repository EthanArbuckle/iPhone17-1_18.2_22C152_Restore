@interface GEOPDSearchSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchSection)init;
- (GEOPDSearchSection)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)name;
- (id)sectionGuide;
- (id)sectionPlace;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (uint64_t)sectionType;
- (unint64_t)hash;
- (void)_readName;
- (void)_readSectionGuide;
- (void)_readSectionPlace;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchSection

- (GEOPDSearchSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchSection;
  v2 = [(GEOPDSearchSection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchSection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchSection;
  v3 = [(GEOPDSearchSection *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_1412);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)name
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDSearchSection _readName]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)sectionType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    if ((v2 & 8) != 0) {
      return *(unsigned int *)(v1 + 72);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readSectionPlace
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x80) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSectionPlace_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)sectionPlace
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDSearchSection _readSectionPlace]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSectionGuide
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x40) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchSectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSectionGuide_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)sectionGuide
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDSearchSection _readSectionGuide]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchSection;
  v4 = [(GEOPDSearchSection *)&v8 description];
  v5 = [(GEOPDSearchSection *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_45;
  }
  -[GEOPDSearchSection readAll:](a1, 1);
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = -[GEOPDSearchSection name]((id *)a1);
  if (v5) {
    [v4 setObject:v5 forKey:@"name"];
  }

  if ((*(_WORD *)(a1 + 76) & 8) != 0)
  {
    uint64_t v6 = *(int *)(a1 + 72);
    if (v6 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 72));
      objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v7 = off_1E53E5DE8[v6];
    }
    if (a2) {
      objc_super v8 = @"sectionType";
    }
    else {
      objc_super v8 = @"section_type";
    }
    [v4 setObject:v7 forKey:v8];
  }
  v9 = -[GEOPDSearchSection sectionPlace]((id *)a1);
  v10 = v9;
  if (v9)
  {
    if (a2)
    {
      v11 = [v9 jsonRepresentation];
      v12 = @"sectionPlace";
    }
    else
    {
      v11 = [v9 dictionaryRepresentation];
      v12 = @"section_place";
    }
    [v4 setObject:v11 forKey:v12];
  }
  v13 = -[GEOPDSearchSection sectionGuide]((id *)a1);
  v14 = v13;
  if (v13)
  {
    if (a2)
    {
      v15 = [v13 jsonRepresentation];
      v16 = @"sectionGuide";
    }
    else
    {
      v15 = [v13 dictionaryRepresentation];
      v16 = @"section_guide";
    }
    [v4 setObject:v15 forKey:v16];
  }
  __int16 v17 = *(_WORD *)(a1 + 76);
  if ((v17 & 2) != 0)
  {
    v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
    if (a2) {
      v19 = @"sectionIdentifier";
    }
    else {
      v19 = @"section_identifier";
    }
    [v4 setObject:v18 forKey:v19];

    __int16 v17 = *(_WORD *)(a1 + 76);
    if ((v17 & 4) == 0)
    {
LABEL_24:
      if ((v17 & 1) == 0) {
        goto LABEL_41;
      }
      goto LABEL_34;
    }
  }
  else if ((v17 & 4) == 0)
  {
    goto LABEL_24;
  }
  v20 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
  if (a2) {
    v21 = @"sectionRank";
  }
  else {
    v21 = @"section_rank";
  }
  [v4 setObject:v20 forKey:v21];

  if (*(_WORD *)(a1 + 76))
  {
LABEL_34:
    uint64_t v22 = *(int *)(a1 + 60);
    if (v22 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E53E5E00[v22];
    }
    if (a2) {
      v24 = @"contentType";
    }
    else {
      v24 = @"content_type";
    }
    [v4 setObject:v23 forKey:v24];
  }
LABEL_41:
  v25 = *(void **)(a1 + 16);
  if (v25)
  {
    v26 = [v25 dictionaryRepresentation];
    v27 = v26;
    if (a2)
    {
      v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __48__GEOPDSearchSection__dictionaryRepresentation___block_invoke;
      v32[3] = &unk_1E53D8860;
      id v29 = v28;
      id v33 = v29;
      [v27 enumerateKeysAndObjectsUsingBlock:v32];
      id v30 = v29;

      v27 = v30;
    }
    [v4 setObject:v27 forKey:@"Unknown Fields"];
  }
LABEL_45:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchSection _dictionaryRepresentation:]((uint64_t)self, 1);
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
        uint64_t v6 = (int *)&readAll__recursiveTag_1439;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_1440;
      }
      GEOPDSearchSectionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __48__GEOPDSearchSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDSearchSectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader || (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1E0) != 0))
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchSection readAll:]((uint64_t)self, 0);
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    id v5 = v9;
    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
    }
    if (self->_sectionPlace)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_sectionGuide)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v9;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_13:
        if ((flags & 1) == 0)
        {
LABEL_15:
          [(PBUnknownFields *)self->_unknownFields writeTo:v5];
          goto LABEL_20;
        }
LABEL_14:
        PBDataWriterWriteInt32Field();
        id v5 = v9;
        goto LABEL_15;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_13;
    }
    PBDataWriterWriteUint32Field();
    id v5 = v9;
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  objc_super v7 = self->_reader;
  objc_sync_enter(v7);
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
  [v9 writeData:v8];
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v7);
LABEL_20:
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSearchSection _readSectionGuide](result);
    if (-[GEOPDSearchSectionGuide hasGreenTeaWithValue:](*(void *)(v3 + 32), a2))
    {
      return 1;
    }
    else
    {
      -[GEOPDSearchSection _readSectionPlace](v3);
      uint64_t v4 = *(void *)(v3 + 40);
      return -[GEOPDSearchSectionPlace hasGreenTeaWithValue:](v4, a2);
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchSection readAll:]((uint64_t)self, 0);
    uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
    id v10 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v9;

    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      *(_DWORD *)(v5 + 72) = self->_sectionType;
      *(_WORD *)(v5 + 76) |= 8u;
    }
    id v11 = [(GEOPDSearchSectionPlace *)self->_sectionPlace copyWithZone:a3];
    v12 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v11;

    id v13 = [(GEOPDSearchSectionGuide *)self->_sectionGuide copyWithZone:a3];
    v14 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v13;

    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 64) = self->_sectionIdentifier;
      *(_WORD *)(v5 + 76) |= 2u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_9:
        if ((flags & 1) == 0)
        {
LABEL_11:
          v16 = self->_unknownFields;
          id v8 = *(id *)(v5 + 16);
          *(void *)(v5 + 16) = v16;
          goto LABEL_12;
        }
LABEL_10:
        *(_DWORD *)(v5 + 60) = self->_contentType;
        *(_WORD *)(v5 + 76) |= 1u;
        goto LABEL_11;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_9;
    }
    *(_DWORD *)(v5 + 68) = self->_sectionRank;
    *(_WORD *)(v5 + 76) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSearchSectionReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_12:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  -[GEOPDSearchSection readAll:]((uint64_t)self, 1);
  -[GEOPDSearchSection readAll:]((uint64_t)v4, 1);
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_27;
    }
  }
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_sectionType != *((_DWORD *)v4 + 18)) {
      goto LABEL_27;
    }
  }
  else if ((v6 & 8) != 0)
  {
LABEL_27:
    BOOL v11 = 0;
    goto LABEL_28;
  }
  sectionPlace = self->_sectionPlace;
  if ((unint64_t)sectionPlace | *((void *)v4 + 5)
    && !-[GEOPDSearchSectionPlace isEqual:](sectionPlace, "isEqual:"))
  {
    goto LABEL_27;
  }
  sectionGuide = self->_sectionGuide;
  if ((unint64_t)sectionGuide | *((void *)v4 + 4))
  {
    if (!-[GEOPDSearchSectionGuide isEqual:](sectionGuide, "isEqual:")) {
      goto LABEL_27;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v10 = *((_WORD *)v4 + 38);
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_sectionIdentifier != *((_DWORD *)v4 + 16)) {
      goto LABEL_27;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_sectionRank != *((_DWORD *)v4 + 17)) {
      goto LABEL_27;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_27;
  }
  BOOL v11 = (v10 & 1) == 0;
  if (flags)
  {
    if ((v10 & 1) == 0 || self->_contentType != *((_DWORD *)v4 + 15)) {
      goto LABEL_27;
    }
    BOOL v11 = 1;
  }
LABEL_28:

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDSearchSection readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_name hash];
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v4 = 2654435761 * self->_sectionType;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(GEOPDSearchSectionPlace *)self->_sectionPlace hash];
  unint64_t v6 = [(GEOPDSearchSectionGuide *)self->_sectionGuide hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    uint64_t v8 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v9 = 0;
    if (flags) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10;
  }
  uint64_t v8 = 2654435761 * self->_sectionIdentifier;
  if ((flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v9 = 2654435761 * self->_sectionRank;
  if ((flags & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v10 = 2654435761 * self->_contentType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 76) |= 0x10u;
    *(_WORD *)(a1 + 76) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSearchSection readAll:](a1, 0);
      -[GEOPDSearchSectionPlace clearUnknownFields:](*(void *)(a1 + 40), 1);
      uint64_t v5 = *(void *)(a1 + 32);
      -[GEOPDSearchSectionGuide clearUnknownFields:](v5, 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionPlace, 0);
  objc_storeStrong((id *)&self->_sectionGuide, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end