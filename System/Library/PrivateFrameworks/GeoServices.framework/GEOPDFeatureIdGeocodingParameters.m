@interface GEOPDFeatureIdGeocodingParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDFeatureIdGeocodingParameters)init;
- (GEOPDFeatureIdGeocodingParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_readEncryptedFeatureIds;
- (void)_readLocation;
- (void)addEncryptedFeatureId:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setLocation:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDFeatureIdGeocodingParameters

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_3004;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_3005;
      }
      GEOPDFeatureIdGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 56) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (GEOPDFeatureIdGeocodingParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDFeatureIdGeocodingParameters;
  v2 = [(GEOPDFeatureIdGeocodingParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDFeatureIdGeocodingParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDFeatureIdGeocodingParameters;
  v3 = [(GEOPDFeatureIdGeocodingParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDFeatureIdGeocodingParameters;
  [(GEOPDFeatureIdGeocodingParameters *)&v3 dealloc];
}

- (void)_readEncryptedFeatureIds
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 80) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDFeatureIdGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEncryptedFeatureIds_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)addEncryptedFeatureId:(uint64_t)a1
{
  *(unsigned char *)(a1 + 80) |= 8u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  *(unsigned char *)(a1 + 80) |= 0x20u;
}

- (void)_readLocation
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDFeatureIdGeocodingParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_0);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
}

- (void)setLocation:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 80) |= 0x10u;
    *(unsigned char *)(a1 + 80) |= 0x20u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDFeatureIdGeocodingParameters;
  id v4 = [(GEOPDFeatureIdGeocodingParameters *)&v8 description];
  id v5 = [(GEOPDFeatureIdGeocodingParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDFeatureIdGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDFeatureIdGeocodingParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 80))
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
      if (a2) {
        objc_super v6 = @"featureId";
      }
      else {
        objc_super v6 = @"feature_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if (*(void *)(a1 + 32))
    {
      objc_super v7 = PBRepeatedUInt64NSArray();
      if (a2) {
        objc_super v8 = @"encryptedFeatureId";
      }
      else {
        objc_super v8 = @"encrypted_feature_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    -[GEOPDFeatureIdGeocodingParameters _readLocation](a1);
    id v9 = *(id *)(a1 + 56);
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"location"];
    }
    if ((*(unsigned char *)(a1 + 80) & 2) != 0)
    {
      uint64_t v12 = *(int *)(a1 + 76);
      if (v12 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E53DCAC8[v12];
      }
      if (a2) {
        v14 = @"formattedAddressType";
      }
      else {
        v14 = @"formatted_address_type";
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
        v22[2] = __63__GEOPDFeatureIdGeocodingParameters__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDFeatureIdGeocodingParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __63__GEOPDFeatureIdGeocodingParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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
  return GEOPDFeatureIdGeocodingParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDFeatureIdGeocodingParameters readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    id v5 = v9;
    if (self->_encryptedFeatureIds.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        id v5 = v9;
        ++v6;
      }
      while (v6 < self->_encryptedFeatureIds.count);
    }
    if (self->_location)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDFeatureIdGeocodingParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDFeatureIdGeocodingParameters readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 48) = self->_featureId;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  PBRepeatedUInt64Copy();
  id v9 = [(GEOLatLng *)self->_location copyWithZone:a3];
  id v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_formattedAddressType;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
  v11 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v11;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  -[GEOPDFeatureIdGeocodingParameters readAll:]((uint64_t)self, 1);
  -[GEOPDFeatureIdGeocodingParameters readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_featureId != *((void *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_14:
    BOOL v6 = 0;
    goto LABEL_15;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    goto LABEL_14;
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 80) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_formattedAddressType != *((_DWORD *)v4 + 19)) {
      goto LABEL_14;
    }
    BOOL v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  -[GEOPDFeatureIdGeocodingParameters readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_featureId;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedUInt64Hash();
  unint64_t v5 = [(GEOLatLng *)self->_location hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_formattedAddressType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end