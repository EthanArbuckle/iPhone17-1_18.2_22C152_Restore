@interface GEOPDVenueBuilding
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDVenueBuilding)init;
- (GEOPDVenueBuilding)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDVenueBuilding

- (GEOPDVenueBuilding)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDVenueBuilding;
  v2 = [(GEOPDVenueBuilding *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDVenueBuilding)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDVenueBuilding;
  v3 = [(GEOPDVenueBuilding *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDVenueBuilding;
  [(GEOPDVenueBuilding *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDVenueBuilding;
  v4 = [(GEOPDVenueBuilding *)&v8 description];
  v5 = [(GEOPDVenueBuilding *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVenueBuilding _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDVenueBuilding readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 108))
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 72)];
      if (a2) {
        objc_super v6 = @"buildingId";
      }
      else {
        objc_super v6 = @"building_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 56))
    {
      objc_super v7 = PBRepeatedUInt64NSArray();
      if (a2) {
        objc_super v8 = @"levelId";
      }
      else {
        objc_super v8 = @"level_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 108) & 0x20) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDVenueBuildingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabel_tags_161);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v11 = *(id *)(a1 + 80);
    v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      v13 = [v11 dictionaryRepresentation];
      }
      [v4 setObject:v13 forKey:@"label"];
    }
    if ((*(unsigned char *)(a1 + 108) & 2) != 0)
    {
      v14 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 88)];
      [v4 setObject:v14 forKey:@"muid"];
    }
    if (*(void *)(a1 + 32))
    {
      v15 = PBRepeatedUInt64NSArray();
      if (a2) {
        v16 = @"directoryGroupingId";
      }
      else {
        v16 = @"directory_grouping_id";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = *(void **)(a1 + 16);
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __48__GEOPDVenueBuilding__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEOPDVenueBuilding _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_180;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_181;
      }
      GEOPDVenueBuildingReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDVenueLabel readAll:](*(void *)(a1 + 80), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

void __48__GEOPDVenueBuilding__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDVenueBuildingReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDVenueBuildingIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDVenueBuilding readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    id v5 = v10;
    if (self->_levelIds.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        id v5 = v10;
        ++v6;
      }
      while (v6 < self->_levelIds.count);
    }
    if (self->_label)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      id v5 = v10;
    }
    if (self->_directoryGroupingIds.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        id v5 = v10;
        ++v7;
      }
      while (v7 < self->_directoryGroupingIds.count);
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDVenueBuildingReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVenueBuilding readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 72) = self->_buildingId;
    *(unsigned char *)(v5 + 108) |= 1u;
  }
  PBRepeatedUInt64Copy();
  id v9 = [(GEOPDVenueLabel *)self->_label copyWithZone:a3];
  id v10 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v9;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(void *)(v5 + 88) = self->_muid;
    *(unsigned char *)(v5 + 108) |= 2u;
  }
  PBRepeatedUInt64Copy();
  id v11 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v11;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  -[GEOPDVenueBuilding readAll:]((uint64_t)self, 1);
  -[GEOPDVenueBuilding readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 108) & 1) == 0 || self->_buildingId != *((void *)v4 + 9)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 108))
  {
LABEL_16:
    char IsEqual = 0;
    goto LABEL_17;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_16;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 10))
  {
    if (!-[GEOPDVenueLabel isEqual:](label, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 108) & 2) == 0 || self->_muid != *((void *)v4 + 11)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 108) & 2) != 0)
  {
    goto LABEL_16;
  }
  char IsEqual = PBRepeatedUInt64IsEqual();
LABEL_17:

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOPDVenueBuilding readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_buildingId;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedUInt64Hash();
  unint64_t v5 = [(GEOPDVenueLabel *)self->_label hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    unint64_t v6 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ PBRepeatedUInt64Hash() ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end