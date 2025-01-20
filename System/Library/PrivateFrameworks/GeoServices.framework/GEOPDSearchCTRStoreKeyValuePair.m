@interface GEOPDSearchCTRStoreKeyValuePair
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchCTRStoreKeyValuePair)init;
- (GEOPDSearchCTRStoreKeyValuePair)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchCTRStoreKeyValuePair

- (GEOPDSearchCTRStoreKeyValuePair)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchCTRStoreKeyValuePair;
  v2 = [(GEOPDSearchCTRStoreKeyValuePair *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchCTRStoreKeyValuePair)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchCTRStoreKeyValuePair;
  v3 = [(GEOPDSearchCTRStoreKeyValuePair *)&v7 initWithData:a3];
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
  v8.super_class = (Class)GEOPDSearchCTRStoreKeyValuePair;
  v4 = [(GEOPDSearchCTRStoreKeyValuePair *)&v8 description];
  v5 = [(GEOPDSearchCTRStoreKeyValuePair *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchCTRStoreKeyValuePair _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_42;
  }
  -[GEOPDSearchCTRStoreKeyValuePair readAll:](a1, 1);
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 68);
  if ((v5 & 0x10) != 0)
  {
    v16 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
    if (a2) {
      v17 = @"numTaps";
    }
    else {
      v17 = @"num_taps";
    }
    [v4 setObject:v16 forKey:v17];

    char v5 = *(unsigned char *)(a1 + 68);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)(a1 + 68) & 4) == 0)
  {
    goto LABEL_4;
  }
  v18 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  if (a2) {
    v19 = @"numImpressions";
  }
  else {
    v19 = @"num_impressions";
  }
  [v4 setObject:v18 forKey:v19];

  char v5 = *(unsigned char *)(a1 + 68);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
LABEL_35:
    v22 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
    if (a2) {
      v23 = @"forwardSctr";
    }
    else {
      v23 = @"forward_sctr";
    }
    [v4 setObject:v22 forKey:v23];

    if ((*(unsigned char *)(a1 + 68) & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
LABEL_31:
  v20 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  if (a2) {
    v21 = @"numQueryTaps";
  }
  else {
    v21 = @"num_query_taps";
  }
  [v4 setObject:v20 forKey:v21];

  char v5 = *(unsigned char *)(a1 + 68);
  if ((v5 & 2) != 0) {
    goto LABEL_35;
  }
LABEL_6:
  if (v5)
  {
LABEL_7:
    objc_super v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
    if (a2) {
      objc_super v7 = @"backwardSctr";
    }
    else {
      objc_super v7 = @"backward_sctr";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_11:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  if ((*(unsigned char *)(a1 + 68) & 0x40) == 0)
  {
    objc_super v8 = *(void **)(a1 + 8);
    if (v8)
    {
      id v9 = v8;
      objc_sync_enter(v9);
      GEOPDSearchCTRStoreKeyValuePairReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuery_tags_1);
      objc_sync_exit(v9);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  id v10 = *(id *)(a1 + 24);
  if (v10) {
    [v4 setObject:v10 forKey:@"query"];
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  if ((*(unsigned char *)(a1 + 68) & 0x20) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      id v12 = v11;
      objc_sync_enter(v12);
      GEOPDSearchCTRStoreKeyValuePairReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeoHash_tags);
      objc_sync_exit(v12);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  id v13 = *(id *)(a1 + 16);
  if (v13) {
    [v4 setObject:v13 forKey:@"geoHash"];
  }

  unsigned int v14 = *(_DWORD *)(a1 + 64) - 1;
  if (v14 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 64));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E53E25B0[v14];
  }
  [v4 setObject:v15 forKey:@"type"];

LABEL_42:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchCTRStoreKeyValuePair _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_366_0;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_367_0;
      }
      GEOPDSearchCTRStoreKeyValuePairReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchCTRStoreKeyValuePairReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if (*(unsigned char *)&self->_flags <= 0x1Fu)
    {
      objc_super v6 = self->_reader;
      objc_sync_enter(v6);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v8 writeData:v7];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v6);
      goto LABEL_18;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchCTRStoreKeyValuePair readAll:]((uint64_t)self, 0);
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_7:
      if ((flags & 2) == 0) {
        goto LABEL_8;
      }
LABEL_15:
      PBDataWriterWriteInt32Field();
      if ((*(unsigned char *)&self->_flags & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_15;
  }
LABEL_8:
  if (flags) {
LABEL_9:
  }
    PBDataWriterWriteInt32Field();
LABEL_10:
  PBDataWriterWriteStringField();
  if (self->_geoHash) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteInt32Field();
LABEL_18:
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
    -[GEOPDSearchCTRStoreKeyValuePair readAll:]((uint64_t)self, 0);
    char flags = (char)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(_DWORD *)(v5 + 60) = self->_numTaps;
      *(unsigned char *)(v5 + 68) |= 0x10u;
      char flags = (char)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 8) == 0) {
          goto LABEL_8;
        }
        goto LABEL_15;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 52) = self->_numImpressions;
    *(unsigned char *)(v5 + 68) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_8:
      if ((flags & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_16;
    }
LABEL_15:
    *(_DWORD *)(v5 + 56) = self->_numQueryTaps;
    *(unsigned char *)(v5 + 68) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_9:
      if ((flags & 1) == 0)
      {
LABEL_11:
        uint64_t v10 = [(NSString *)self->_query copyWithZone:a3];
        v11 = *(void **)(v5 + 24);
        *(void *)(v5 + 24) = v10;

        uint64_t v12 = [(NSString *)self->_geoHash copyWithZone:a3];
        id v13 = *(void **)(v5 + 16);
        *(void *)(v5 + 16) = v12;

        *(_DWORD *)(v5 + 64) = self->_type;
        return (id)v5;
      }
LABEL_10:
      *(_DWORD *)(v5 + 44) = self->_backwardSctr;
      *(unsigned char *)(v5 + 68) |= 1u;
      goto LABEL_11;
    }
LABEL_16:
    *(_DWORD *)(v5 + 48) = self->_forwardSctr;
    *(unsigned char *)(v5 + 68) |= 2u;
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSearchCTRStoreKeyValuePairReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  -[GEOPDSearchCTRStoreKeyValuePair readAll:]((uint64_t)self, 1);
  -[GEOPDSearchCTRStoreKeyValuePair readAll:]((uint64_t)v4, 1);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x10) == 0 || self->_numTaps != *((_DWORD *)v4 + 15)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x10) != 0)
  {
LABEL_32:
    BOOL v7 = 0;
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_numImpressions != *((_DWORD *)v4 + 13)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 8) == 0 || self->_numQueryTaps != *((_DWORD *)v4 + 14)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_forwardSctr != *((_DWORD *)v4 + 12)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_32;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_backwardSctr != *((_DWORD *)v4 + 11)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_32;
  }
  query = self->_query;
  if ((unint64_t)query | *((void *)v4 + 3) && !-[NSString isEqual:](query, "isEqual:")) {
    goto LABEL_32;
  }
  geoHash = self->_geoHash;
  if ((unint64_t)geoHash | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](geoHash, "isEqual:")) {
      goto LABEL_32;
    }
  }
  BOOL v7 = self->_type == *((_DWORD *)v4 + 16);
LABEL_33:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSearchCTRStoreKeyValuePair readAll:]((uint64_t)self, 1);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    uint64_t v3 = 2654435761 * self->_numTaps;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_numImpressions;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_numQueryTaps;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v7 = 0;
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_forwardSctr;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_backwardSctr;
LABEL_12:
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_query hash];
  return v8 ^ [(NSString *)self->_geoHash hash] ^ (2654435761 * self->_type);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_geoHash, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end