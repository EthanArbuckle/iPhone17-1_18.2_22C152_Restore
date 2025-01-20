@interface GEOPDSearchQueryGeoNormalizerMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryGeoNormalizerMetadata)init;
- (GEOPDSearchQueryGeoNormalizerMetadata)initWithData:(id)a3;
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

@implementation GEOPDSearchQueryGeoNormalizerMetadata

- (GEOPDSearchQueryGeoNormalizerMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryGeoNormalizerMetadata;
  v2 = [(GEOPDSearchQueryGeoNormalizerMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryGeoNormalizerMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryGeoNormalizerMetadata;
  v3 = [(GEOPDSearchQueryGeoNormalizerMetadata *)&v7 initWithData:a3];
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
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchQueryGeoNormalizerMetadata;
  [(GEOPDSearchQueryGeoNormalizerMetadata *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQueryGeoNormalizerMetadata;
  v4 = [(GEOPDSearchQueryGeoNormalizerMetadata *)&v8 description];
  v5 = [(GEOPDSearchQueryGeoNormalizerMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryGeoNormalizerMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchQueryGeoNormalizerMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 0x10) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQueryGeoNormalizerMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUnitNumber_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v7 = *(id *)(a1 + 64);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"unitNumber";
      }
      else {
        objc_super v8 = @"unit_number";
      }
      [v4 setObject:v7 forKey:v8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 2) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDSearchQueryGeoNormalizerMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFloor_tags);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v11 = *(id *)(a1 + 40);
    if (v11) {
      [v4 setObject:v11 forKey:@"floor"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 8) == 0)
    {
      v12 = *(void **)(a1 + 8);
      if (v12)
      {
        id v13 = v12;
        objc_sync_enter(v13);
        GEOPDSearchQueryGeoNormalizerMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoPox_tags);
        objc_sync_exit(v13);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v14 = *(id *)(a1 + 56);
    if (v14)
    {
      if (a2) {
        v15 = @"poPox";
      }
      else {
        v15 = @"po_pox";
      }
      [v4 setObject:v14 forKey:v15];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 4) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        id v17 = v16;
        objc_sync_enter(v17);
        GEOPDSearchQueryGeoNormalizerMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMailStop_tags);
        objc_sync_exit(v17);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v18 = *(id *)(a1 + 48);
    if (v18)
    {
      if (a2) {
        v19 = @"mailStop";
      }
      else {
        v19 = @"mail_stop";
      }
      [v4 setObject:v18 forKey:v19];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 0x20) == 0)
    {
      v20 = *(void **)(a1 + 8);
      if (v20)
      {
        id v21 = v20;
        objc_sync_enter(v21);
        GEOPDSearchQueryGeoNormalizerMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUnitTypeId_tags);
        objc_sync_exit(v21);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v22 = *(id *)(a1 + 72);
    if (v22)
    {
      if (a2) {
        v23 = @"unitTypeId";
      }
      else {
        v23 = @"unit_type_id";
      }
      [v4 setObject:v22 forKey:v23];
    }

    if (*(void *)(a1 + 24))
    {
      v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v25 = (void *)(a1 + 16);
      if (*(void *)(a1 + 24))
      {
        unint64_t v26 = 0;
        do
        {
          uint64_t v27 = *(unsigned int *)(*v25 + 4 * v26);
          if ((v27 - 1) >= 5)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v27);
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v28 = off_1E53E2728[(int)v27 - 1];
          }
          [v24 addObject:v28];

          ++v26;
          v25 = (void *)(a1 + 16);
        }
        while (v26 < *(void *)(a1 + 24));
      }
      [v4 setObject:v24 forKey:@"normalizers"];
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
  return -[GEOPDSearchQueryGeoNormalizerMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_1443;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_1444;
      }
      GEOPDSearchQueryGeoNormalizerMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryGeoNormalizerMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7F) == 0))
  {
    objc_super v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
    id v5 = v10;
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryGeoNormalizerMetadata readAll:]((uint64_t)self, 0);
    if (self->_unitNumber) {
      PBDataWriterWriteStringField();
    }
    id v5 = v10;
    if (self->_floor)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    if (self->_poPox)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    if (self->_mailStop)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    if (self->_unitTypeId)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    p_normalizers = &self->_normalizers;
    if (p_normalizers->count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v10;
        ++v7;
      }
      while (v7 < p_normalizers->count);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  unint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryGeoNormalizerMetadata readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_unitNumber copyWithZone:a3];
    v9 = (void *)v5[8];
    v5[8] = v8;

    uint64_t v10 = [(NSString *)self->_floor copyWithZone:a3];
    id v11 = (void *)v5[5];
    v5[5] = v10;

    uint64_t v12 = [(NSString *)self->_poPox copyWithZone:a3];
    id v13 = (void *)v5[7];
    v5[7] = v12;

    uint64_t v14 = [(NSString *)self->_mailStop copyWithZone:a3];
    v15 = (void *)v5[6];
    v5[6] = v14;

    uint64_t v16 = [(NSString *)self->_unitTypeId copyWithZone:a3];
    id v17 = (void *)v5[9];
    v5[9] = v16;

    PBRepeatedInt32Copy();
    return v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSearchQueryGeoNormalizerMetadataReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSearchQueryGeoNormalizerMetadata readAll:]((uint64_t)self, 1),
         -[GEOPDSearchQueryGeoNormalizerMetadata readAll:]((uint64_t)v4, 1),
         unitNumber = self->_unitNumber,
         !((unint64_t)unitNumber | v4[8]))
     || -[NSString isEqual:](unitNumber, "isEqual:"))
    && ((floor = self->_floor, !((unint64_t)floor | v4[5]))
     || -[NSString isEqual:](floor, "isEqual:"))
    && ((poPox = self->_poPox, !((unint64_t)poPox | v4[7]))
     || -[NSString isEqual:](poPox, "isEqual:"))
    && ((mailStop = self->_mailStop, !((unint64_t)mailStop | v4[6]))
     || -[NSString isEqual:](mailStop, "isEqual:"))
    && ((unitTypeId = self->_unitTypeId, !((unint64_t)unitTypeId | v4[9]))
     || -[NSString isEqual:](unitTypeId, "isEqual:")))
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOPDSearchQueryGeoNormalizerMetadata readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_unitNumber hash];
  NSUInteger v4 = [(NSString *)self->_floor hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_poPox hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_mailStop hash];
  NSUInteger v7 = [(NSString *)self->_unitTypeId hash];
  return v6 ^ v7 ^ PBRepeatedInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTypeId, 0);
  objc_storeStrong((id *)&self->_unitNumber, 0);
  objc_storeStrong((id *)&self->_poPox, 0);
  objc_storeStrong((id *)&self->_mailStop, 0);
  objc_storeStrong((id *)&self->_floor, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end