@interface GEOPDSImplicitQuerySearchAroundPOI
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSImplicitQuerySearchAroundPOI)init;
- (GEOPDSImplicitQuerySearchAroundPOI)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_readReferenceLocation;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setCategoryIdOfPoi:(uint64_t)a1;
- (void)setReferenceLocation:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSImplicitQuerySearchAroundPOI

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 2u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSImplicitQuerySearchAroundPOI readAll:](a1, 0);
      v5 = *(void **)(a1 + 40);
      [v5 clearUnknownFields:1];
    }
  }
}

- (GEOPDSImplicitQuerySearchAroundPOI)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSImplicitQuerySearchAroundPOI;
  v2 = [(GEOPDSImplicitQuerySearchAroundPOI *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSImplicitQuerySearchAroundPOI)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSImplicitQuerySearchAroundPOI;
  v3 = [(GEOPDSImplicitQuerySearchAroundPOI *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setCategoryIdOfPoi:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 60) |= 4u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_readReferenceLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSImplicitQuerySearchAroundPOIReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReferenceLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)setReferenceLocation:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 60) |= 8u;
    *(unsigned char *)(a1 + 60) |= 0x10u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSImplicitQuerySearchAroundPOI;
  id v4 = [(GEOPDSImplicitQuerySearchAroundPOI *)&v8 description];
  v5 = [(GEOPDSImplicitQuerySearchAroundPOI *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSImplicitQuerySearchAroundPOI _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSImplicitQuerySearchAroundPOI readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSImplicitQuerySearchAroundPOIReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryIdOfPoi_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v7 = *(id *)(a1 + 24);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"categoryIdOfPoi";
      }
      else {
        objc_super v8 = @"category_id_of_poi";
      }
      [v4 setObject:v7 forKey:v8];
    }

    -[GEOPDSImplicitQuerySearchAroundPOI _readReferenceLocation](a1);
    id v9 = *(id *)(a1 + 40);
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"referenceLocation";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"reference_location";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if (*(unsigned char *)(a1 + 60))
    {
      v13 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      if (a2) {
        v14 = @"encryptedMuidOfPoi";
      }
      else {
        v14 = @"encrypted_muid_of_poi";
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
        v22[2] = __64__GEOPDSImplicitQuerySearchAroundPOI__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSImplicitQuerySearchAroundPOI _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_189;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_190;
      }
      GEOPDSImplicitQuerySearchAroundPOIReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 40) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __64__GEOPDSImplicitQuerySearchAroundPOI__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
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
  return GEOPDSImplicitQuerySearchAroundPOIReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    id v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSImplicitQuerySearchAroundPOI readAll:]((uint64_t)self, 0);
    if (self->_categoryIdOfPoi) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_referenceLocation)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteUint64Field();
      id v5 = v8;
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
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSImplicitQuerySearchAroundPOIReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSImplicitQuerySearchAroundPOI readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_categoryIdOfPoi copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOLatLng *)self->_referenceLocation copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 32) = self->_encryptedMuidOfPoi;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  -[GEOPDSImplicitQuerySearchAroundPOI readAll:]((uint64_t)self, 1);
  -[GEOPDSImplicitQuerySearchAroundPOI readAll:]((uint64_t)v4, 1);
  categoryIdOfPoi = self->_categoryIdOfPoi;
  if ((unint64_t)categoryIdOfPoi | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](categoryIdOfPoi, "isEqual:")) {
      goto LABEL_10;
    }
  }
  referenceLocation = self->_referenceLocation;
  if ((unint64_t)referenceLocation | *((void *)v4 + 5))
  {
    if (!-[GEOLatLng isEqual:](referenceLocation, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) != 0 && self->_encryptedMuidOfPoi == *((void *)v4 + 4))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSImplicitQuerySearchAroundPOI readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_categoryIdOfPoi hash];
  unint64_t v4 = [(GEOLatLng *)self->_referenceLocation hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v5 = 2654435761u * self->_encryptedMuidOfPoi;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceLocation, 0);
  objc_storeStrong((id *)&self->_categoryIdOfPoi, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end