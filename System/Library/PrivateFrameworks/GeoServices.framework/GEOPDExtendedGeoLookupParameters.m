@interface GEOPDExtendedGeoLookupParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDExtendedGeoLookupParameters)init;
- (GEOPDExtendedGeoLookupParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_readIntersectingFeatureGeoIds;
- (void)_readPrimaryFeatureLocation;
- (void)addIntersectingFeatureGeoId:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setDataSourceId:(uint64_t)a1;
- (void)setInterpolationParameter:(uint64_t)a1;
- (void)setPreserveFields:(uint64_t)a1;
- (void)setPrimaryFeatureLocation:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDExtendedGeoLookupParameters

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
        v6 = (int *)&readAll__recursiveTag_2892;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_2893;
      }
      GEOPDExtendedGeoLookupParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 64) readAll:1];
      [*(id *)(a1 + 80) readAll:1];
      [*(id *)(a1 + 56) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (GEOPDExtendedGeoLookupParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDExtendedGeoLookupParameters;
  v2 = [(GEOPDExtendedGeoLookupParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDExtendedGeoLookupParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDExtendedGeoLookupParameters;
  v3 = [(GEOPDExtendedGeoLookupParameters *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEOPDExtendedGeoLookupParameters;
  [(GEOPDExtendedGeoLookupParameters *)&v3 dealloc];
}

- (void)setPreserveFields:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 112) |= 0x100u;
  *(_WORD *)(a1 + 112) |= 0x400u;
  objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)_readPrimaryFeatureLocation
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDExtendedGeoLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPrimaryFeatureLocation_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)setPrimaryFeatureLocation:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 112) |= 0x200u;
  *(_WORD *)(a1 + 112) |= 0x400u;
  objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)_readIntersectingFeatureGeoIds
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
  if ((*(_WORD *)(a1 + 112) & 0x20) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDExtendedGeoLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIntersectingFeatureGeoIds_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
}

- (void)addIntersectingFeatureGeoId:(uint64_t)a1
{
  *(_WORD *)(a1 + 112) |= 0x20u;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  *(_WORD *)(a1 + 112) |= 0x400u;
}

- (void)setDataSourceId:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 112) |= 0x40u;
  *(_WORD *)(a1 + 112) |= 0x400u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setInterpolationParameter:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 112) |= 0x80u;
  *(_WORD *)(a1 + 112) |= 0x400u;
  objc_storeStrong((id *)(a1 + 56), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDExtendedGeoLookupParameters;
  id v4 = [(GEOPDExtendedGeoLookupParameters *)&v8 description];
  id v5 = [(GEOPDExtendedGeoLookupParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDExtendedGeoLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDExtendedGeoLookupParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDExtendedGeoLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPreserveFields_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v7 = *(id *)(a1 + 64);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"preserveFields";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"preserve_fields";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if (*(_WORD *)(a1 + 112))
    {
      v11 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 72)];
      if (a2) {
        v12 = @"primaryFeatureGeoId";
      }
      else {
        v12 = @"primary_feature_geo_id";
      }
      [v4 setObject:v11 forKey:v12];
    }
    -[GEOPDExtendedGeoLookupParameters _readPrimaryFeatureLocation](a1);
    id v13 = *(id *)(a1 + 80);
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"primaryFeatureLocation";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"primary_feature_location";
      }
      [v4 setObject:v15 forKey:v16];
    }
    if (*(void *)(a1 + 32))
    {
      v17 = PBRepeatedUInt64NSArray();
      if (a2) {
        v18 = @"intersectingFeatureGeoId";
      }
      else {
        v18 = @"intersecting_feature_geo_id";
      }
      [v4 setObject:v17 forKey:v18];
    }
    __int16 v19 = *(_WORD *)(a1 + 112);
    if ((v19 & 8) != 0)
    {
      v20 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 109)];
      if (a2) {
        v21 = @"isLatlngRequest";
      }
      else {
        v21 = @"is_latlng_request";
      }
      [v4 setObject:v20 forKey:v21];

      __int16 v19 = *(_WORD *)(a1 + 112);
    }
    if ((v19 & 2) != 0)
    {
      v22 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 88)];
      if (a2) {
        v23 = @"streetSubPostalGeoId";
      }
      else {
        v23 = @"street_sub_postal_geo_id";
      }
      [v4 setObject:v22 forKey:v23];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
    {
      v24 = *(void **)(a1 + 8);
      if (v24)
      {
        id v25 = v24;
        objc_sync_enter(v25);
        GEOPDExtendedGeoLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDataSourceId_tags);
        objc_sync_exit(v25);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v26 = *(id *)(a1 + 48);
    if (v26)
    {
      if (a2) {
        v27 = @"dataSourceId";
      }
      else {
        v27 = @"data_source_id";
      }
      [v4 setObject:v26 forKey:v27];
    }

    if ((*(_WORD *)(a1 + 112) & 4) != 0)
    {
      v28 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 108)];
      if (a2) {
        v29 = @"dataSourceIdRequired";
      }
      else {
        v29 = @"data_source_id_required";
      }
      [v4 setObject:v28 forKey:v29];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
    {
      v30 = *(void **)(a1 + 8);
      if (v30)
      {
        id v31 = v30;
        objc_sync_enter(v31);
        GEOPDExtendedGeoLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInterpolationParameter_tags);
        objc_sync_exit(v31);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v32 = *(id *)(a1 + 56);
    v33 = v32;
    if (v32)
    {
      if (a2)
      {
        v34 = [v32 jsonRepresentation];
        v35 = @"interpolationParameter";
      }
      else
      {
        v34 = [v32 dictionaryRepresentation];
        v35 = @"interpolation_parameter";
      }
      [v4 setObject:v34 forKey:v35];
    }
    v36 = *(void **)(a1 + 16);
    if (v36)
    {
      v37 = [v36 dictionaryRepresentation];
      v38 = v37;
      if (a2)
      {
        v39 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __62__GEOPDExtendedGeoLookupParameters__dictionaryRepresentation___block_invoke;
        v43[3] = &unk_1E53D8860;
        id v40 = v39;
        id v44 = v40;
        [v38 enumerateKeysAndObjectsUsingBlock:v43];
        id v41 = v40;

        v38 = v41;
      }
      [v4 setObject:v38 forKey:@"Unknown Fields"];
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
  return -[GEOPDExtendedGeoLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __62__GEOPDExtendedGeoLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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
  return GEOPDExtendedGeoLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDExtendedGeoLookupParametersIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDExtendedGeoLookupParameters readAll:]((uint64_t)self, 0);
    if (self->_preserveFields) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v10;
    if (*(_WORD *)&self->_flags)
    {
      PBDataWriterWriteUint64Field();
      id v5 = v10;
    }
    if (self->_primaryFeatureLocation)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v10;
    }
    if (self->_intersectingFeatureGeoIds.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        id v5 = v10;
        ++v6;
      }
      while (v6 < self->_intersectingFeatureGeoIds.count);
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v10;
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      id v5 = v10;
    }
    if (self->_dataSourceId)
    {
      PBDataWriterWriteStringField();
      id v5 = v10;
    }
    if ((*(_WORD *)&self->_flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v10;
    }
    if (self->_interpolationParameter)
    {
      PBDataWriterWriteSubmessage();
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
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDExtendedGeoLookupParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDExtendedGeoLookupParameters readAll:]((uint64_t)self, 0);
  id v9 = [(GEOAddress *)self->_preserveFields copyWithZone:a3];
  id v10 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v9;

  if (*(_WORD *)&self->_flags)
  {
    *(void *)(v5 + 72) = self->_primaryFeatureGeoId;
    *(_WORD *)(v5 + 112) |= 1u;
  }
  id v11 = [(GEOLatLng *)self->_primaryFeatureLocation copyWithZone:a3];
  v12 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v11;

  PBRepeatedUInt64Copy();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(unsigned char *)(v5 + 109) = self->_isLatlngRequest;
    *(_WORD *)(v5 + 112) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(void *)(v5 + 88) = self->_streetSubPostalGeoId;
    *(_WORD *)(v5 + 112) |= 2u;
  }
  uint64_t v14 = [(NSString *)self->_dataSourceId copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 108) = self->_dataSourceIdRequired;
    *(_WORD *)(v5 + 112) |= 4u;
  }
  id v16 = [(GEOInterpolationParameters *)self->_interpolationParameter copyWithZone:a3];
  v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  v18 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v18;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  -[GEOPDExtendedGeoLookupParameters readAll:]((uint64_t)self, 1);
  -[GEOPDExtendedGeoLookupParameters readAll:]((uint64_t)v4, 1);
  preserveFields = self->_preserveFields;
  if ((unint64_t)preserveFields | *((void *)v4 + 8))
  {
    if (!-[GEOAddress isEqual:](preserveFields, "isEqual:")) {
      goto LABEL_32;
    }
  }
  __int16 v6 = *((_WORD *)v4 + 56);
  if (*(_WORD *)&self->_flags)
  {
    if ((v6 & 1) == 0 || self->_primaryFeatureGeoId != *((void *)v4 + 9)) {
      goto LABEL_32;
    }
  }
  else if (v6)
  {
    goto LABEL_32;
  }
  primaryFeatureLocation = self->_primaryFeatureLocation;
  if ((unint64_t)primaryFeatureLocation | *((void *)v4 + 10)
    && !-[GEOLatLng isEqual:](primaryFeatureLocation, "isEqual:")
    || !PBRepeatedUInt64IsEqual())
  {
    goto LABEL_32;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 56);
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0) {
      goto LABEL_32;
    }
    if (self->_isLatlngRequest)
    {
      if (!*((unsigned char *)v4 + 109)) {
        goto LABEL_32;
      }
    }
    else if (*((unsigned char *)v4 + 109))
    {
      goto LABEL_32;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_streetSubPostalGeoId != *((void *)v4 + 11)) {
      goto LABEL_32;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_32;
  }
  dataSourceId = self->_dataSourceId;
  if ((unint64_t)dataSourceId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](dataSourceId, "isEqual:")) {
      goto LABEL_32;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v9 = *((_WORD *)v4 + 56);
  }
  if ((flags & 4) == 0)
  {
    if ((v9 & 4) == 0) {
      goto LABEL_38;
    }
LABEL_32:
    char v11 = 0;
    goto LABEL_33;
  }
  if ((v9 & 4) == 0) {
    goto LABEL_32;
  }
  if (!self->_dataSourceIdRequired)
  {
    if (!*((unsigned char *)v4 + 108)) {
      goto LABEL_38;
    }
    goto LABEL_32;
  }
  if (!*((unsigned char *)v4 + 108)) {
    goto LABEL_32;
  }
LABEL_38:
  interpolationParameter = self->_interpolationParameter;
  if ((unint64_t)interpolationParameter | *((void *)v4 + 7)) {
    char v11 = -[GEOInterpolationParameters isEqual:](interpolationParameter, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_33:

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDExtendedGeoLookupParameters readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOAddress *)self->_preserveFields hash];
  if (*(_WORD *)&self->_flags) {
    unint64_t v4 = 2654435761u * self->_primaryFeatureGeoId;
  }
  else {
    unint64_t v4 = 0;
  }
  unint64_t v5 = [(GEOLatLng *)self->_primaryFeatureLocation hash];
  uint64_t v6 = PBRepeatedUInt64Hash();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v8 = 2654435761 * self->_isLatlngRequest;
    if ((flags & 2) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((flags & 2) != 0)
    {
LABEL_6:
      unint64_t v9 = 2654435761u * self->_streetSubPostalGeoId;
      goto LABEL_9;
    }
  }
  unint64_t v9 = 0;
LABEL_9:
  NSUInteger v10 = [(NSString *)self->_dataSourceId hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_dataSourceIdRequired;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(GEOInterpolationParameters *)self->_interpolationParameter hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryFeatureLocation, 0);
  objc_storeStrong((id *)&self->_preserveFields, 0);
  objc_storeStrong((id *)&self->_interpolationParameter, 0);
  objc_storeStrong((id *)&self->_dataSourceId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end