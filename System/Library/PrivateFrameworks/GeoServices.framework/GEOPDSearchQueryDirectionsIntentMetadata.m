@interface GEOPDSearchQueryDirectionsIntentMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryDirectionsIntentMetadata)init;
- (GEOPDSearchQueryDirectionsIntentMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryDirectionsIntentMetadata

- (GEOPDSearchQueryDirectionsIntentMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryDirectionsIntentMetadata;
  v2 = [(GEOPDSearchQueryDirectionsIntentMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryDirectionsIntentMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryDirectionsIntentMetadata;
  v3 = [(GEOPDSearchQueryDirectionsIntentMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQueryDirectionsIntentMetadata;
  v4 = [(GEOPDSearchQueryDirectionsIntentMetadata *)&v8 description];
  v5 = [(GEOPDSearchQueryDirectionsIntentMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryDirectionsIntentMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchQueryDirectionsIntentMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 68))
    {
      uint64_t v5 = *(int *)(a1 + 52);
      if (v5 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E2670[v5];
      }
      if (a2) {
        objc_super v7 = @"intentType";
      }
      else {
        objc_super v7 = @"intent_type";
      }
      [v4 setObject:v6 forKey:v7];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchQueryDirectionsIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionPhrase_tags);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v10 = *(id *)(a1 + 16);
    if (v10)
    {
      if (a2) {
        v11 = @"directionPhrase";
      }
      else {
        v11 = @"direction_phrase";
      }
      [v4 setObject:v10 forKey:v11];
    }

    char v12 = *(unsigned char *)(a1 + 68);
    if ((v12 & 8) != 0)
    {
      uint64_t v13 = *(int *)(a1 + 64);
      if (v13 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 64));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = off_1E53E26A0[v13];
      }
      [v4 setObject:v14 forKey:@"type"];

      char v12 = *(unsigned char *)(a1 + 68);
    }
    if ((v12 & 2) != 0)
    {
      uint64_t v15 = *(int *)(a1 + 56);
      if (v15 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 56));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = off_1E53E26D8[v15];
      }
      [v4 setObject:v16 forKey:@"preposition1"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 68) & 0x20) == 0)
    {
      v17 = *(void **)(a1 + 8);
      if (v17)
      {
        id v18 = v17;
        objc_sync_enter(v18);
        GEOPDSearchQueryDirectionsIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlace1_tags);
        objc_sync_exit(v18);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v19 = *(id *)(a1 + 24);
    if (v19) {
      [v4 setObject:v19 forKey:@"place1"];
    }

    if ((*(unsigned char *)(a1 + 68) & 4) != 0)
    {
      uint64_t v20 = *(int *)(a1 + 60);
      if (v20 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = off_1E53E26D8[v20];
      }
      [v4 setObject:v21 forKey:@"preposition2"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 68) & 0x40) == 0)
    {
      v22 = *(void **)(a1 + 8);
      if (v22)
      {
        id v23 = v22;
        objc_sync_enter(v23);
        GEOPDSearchQueryDirectionsIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlace2_tags);
        objc_sync_exit(v23);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v24 = *(id *)(a1 + 32);
    if (v24) {
      [v4 setObject:v24 forKey:@"place2"];
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
  return -[GEOPDSearchQueryDirectionsIntentMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_1289;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1290;
      }
      GEOPDSearchQueryDirectionsIntentMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryDirectionsIntentMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 0xFu))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryDirectionsIntentMetadata readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_directionPhrase) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_place1) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_place2) {
      PBDataWriterWriteStringField();
    }
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
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchQueryDirectionsIntentMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryDirectionsIntentMetadata readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_intentType;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_directionPhrase copyWithZone:a3];
  id v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_type;
    *(unsigned char *)(v5 + 68) |= 8u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_preposition1;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  uint64_t v12 = [(NSString *)self->_place1 copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_preposition2;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
  uint64_t v14 = [(NSString *)self->_place2 copyWithZone:a3];
  id v8 = *(id *)(v5 + 32);
  *(void *)(v5 + 32) = v14;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  -[GEOPDSearchQueryDirectionsIntentMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryDirectionsIntentMetadata readAll:]((uint64_t)v4, 1);
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 68);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_intentType != *((_DWORD *)v4 + 13)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_30;
  }
  directionPhrase = self->_directionPhrase;
  if ((unint64_t)directionPhrase | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](directionPhrase, "isEqual:")) {
      goto LABEL_30;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 68);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_type != *((_DWORD *)v4 + 16)) {
      goto LABEL_30;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_30;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_preposition1 != *((_DWORD *)v4 + 14)) {
      goto LABEL_30;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_30;
  }
  place1 = self->_place1;
  if ((unint64_t)place1 | *((void *)v4 + 3))
  {
    if (-[NSString isEqual:](place1, "isEqual:"))
    {
      char flags = (char)self->_flags;
      char v6 = *((unsigned char *)v4 + 68);
      goto LABEL_23;
    }
LABEL_30:
    char v10 = 0;
    goto LABEL_31;
  }
LABEL_23:
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_preposition2 != *((_DWORD *)v4 + 15)) {
      goto LABEL_30;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_30;
  }
  place2 = self->_place2;
  if ((unint64_t)place2 | *((void *)v4 + 4)) {
    char v10 = -[NSString isEqual:](place2, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_31:

  return v10;
}

- (unint64_t)hash
{
  -[GEOPDSearchQueryDirectionsIntentMetadata readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_intentType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_directionPhrase hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_preposition1;
      goto LABEL_9;
    }
  }
  uint64_t v6 = 0;
LABEL_9:
  NSUInteger v7 = [(NSString *)self->_place1 hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_preposition2;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_place2 hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_place2, 0);
  objc_storeStrong((id *)&self->_place1, 0);
  objc_storeStrong((id *)&self->_directionPhrase, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end