@interface GEOPDVenueContainer
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDVenueContainer)init;
- (GEOPDVenueContainer)initWithData:(id)a3;
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

@implementation GEOPDVenueContainer

- (GEOPDVenueContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDVenueContainer;
  v2 = [(GEOPDVenueContainer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDVenueContainer)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDVenueContainer;
  v3 = [(GEOPDVenueContainer *)&v7 initWithData:a3];
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
  v3.receiver = self;
  v3.super_class = (Class)GEOPDVenueContainer;
  [(GEOPDVenueContainer *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDVenueContainer;
  v4 = [(GEOPDVenueContainer *)&v8 description];
  v5 = [(GEOPDVenueContainer *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVenueContainer _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDVenueContainer readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 88) & 2) != 0)
    {
      v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
      if (a2) {
        objc_super v6 = @"venueId";
      }
      else {
        objc_super v6 = @"venue_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 32))
    {
      objc_super v7 = PBRepeatedUInt64NSArray();
      if (a2) {
        objc_super v8 = @"buildingId";
      }
      else {
        objc_super v8 = @"building_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 88) & 0x20) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDVenueContainerReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabel_tags_197);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v11 = *(id *)(a1 + 48);
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
    char v14 = *(unsigned char *)(a1 + 88);
    if ((v14 & 4) != 0)
    {
      uint64_t v15 = *(int *)(a1 + 84);
      if (v15 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E53DB820[v15];
      }
      if (a2) {
        v17 = @"browseType";
      }
      else {
        v17 = @"browse_type";
      }
      [v4 setObject:v16 forKey:v17];

      char v14 = *(unsigned char *)(a1 + 88);
    }
    if (v14)
    {
      v18 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
      [v4 setObject:v18 forKey:@"muid"];
    }
    v19 = *(void **)(a1 + 16);
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __49__GEOPDVenueContainer__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
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
  return -[GEOPDVenueContainer _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_210;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_211;
      }
      GEOPDVenueContainerReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDVenueLabel readAll:](*(void *)(a1 + 48), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __49__GEOPDVenueContainer__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDVenueContainerReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDVenueContainerIsDirty((uint64_t)self))
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
    -[GEOPDVenueContainer readAll:]((uint64_t)self, 0);
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint64Field();
    }
    id v5 = v10;
    if (self->_buildingIds.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        id v5 = v10;
        ++v6;
      }
      while (v6 < self->_buildingIds.count);
    }
    if (self->_label)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    char flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v10;
      char flags = (char)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteUint64Field();
      id v5 = v10;
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
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDVenueContainerReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVenueContainer readAll:]((uint64_t)self, 0);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(void *)(v5 + 64) = self->_venueId;
    *(unsigned char *)(v5 + 88) |= 2u;
  }
  PBRepeatedUInt64Copy();
  id v9 = [(GEOPDVenueLabel *)self->_label copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_browseType;
    *(unsigned char *)(v5 + 88) |= 4u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 56) = self->_muid;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
  v12 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v12;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  -[GEOPDVenueContainer readAll:]((uint64_t)self, 1);
  -[GEOPDVenueContainer readAll:]((uint64_t)v4, 1);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_venueId != *((void *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
LABEL_19:
    BOOL v6 = 0;
    goto LABEL_20;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_19;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 6))
  {
    if (!-[GEOPDVenueLabel isEqual:](label, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 4) == 0 || self->_browseType != *((_DWORD *)v4 + 21)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 4) != 0)
  {
    goto LABEL_19;
  }
  BOOL v6 = (*((unsigned char *)v4 + 88) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_muid != *((void *)v4 + 7)) {
      goto LABEL_19;
    }
    BOOL v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  -[GEOPDVenueContainer readAll:]((uint64_t)self, 1);
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_venueId;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedUInt64Hash();
  unint64_t v5 = [(GEOPDVenueLabel *)self->_label hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_browseType;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v7 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v5;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v7 = 2654435761u * self->_muid;
  return v4 ^ v3 ^ v6 ^ v7 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end