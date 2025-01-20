@interface GEOPDSearchGeoIntent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchGeoIntent)init;
- (GEOPDSearchGeoIntent)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_readCenter;
- (void)_readDisplayMapRegion;
- (void)_readMapRegion;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchGeoIntent

- (GEOPDSearchGeoIntent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchGeoIntent;
  v2 = [(GEOPDSearchGeoIntent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchGeoIntent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchGeoIntent;
  v3 = [(GEOPDSearchGeoIntent *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchGeoIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_788);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (void)_readMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchGeoIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (void)_readDisplayMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchGeoIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayMapRegion_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchGeoIntent;
  v4 = [(GEOPDSearchGeoIntent *)&v8 description];
  v5 = [(GEOPDSearchGeoIntent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchGeoIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchGeoIntent readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchGeoIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_786);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v7 = *(id *)(a1 + 80);
    if (v7) {
      [v4 setObject:v7 forKey:@"name"];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchGeoIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenSet_tags_787);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v10 = *(id *)(a1 + 88);
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"tokenSet";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"token_set";
      }
      [v4 setObject:v12 forKey:v13];
    }
    __int16 v14 = *(_WORD *)(a1 + 112);
    if (v14)
    {
      v15 = [NSNumber numberWithLongLong:*(void *)(a1 + 64)];
      if (a2) {
        v16 = @"geoId";
      }
      else {
        v16 = @"geo_id";
      }
      [v4 setObject:v15 forKey:v16];

      __int16 v14 = *(_WORD *)(a1 + 112);
    }
    if ((v14 & 2) != 0)
    {
      v17 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 108)];
      if (a2) {
        v18 = @"geoTypeId";
      }
      else {
        v18 = @"geo_type_id";
      }
      [v4 setObject:v17 forKey:v18];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x10) == 0)
    {
      v19 = *(void **)(a1 + 8);
      if (v19)
      {
        id v20 = v19;
        objc_sync_enter(v20);
        GEOPDSearchGeoIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryCode_tags_0);
        objc_sync_exit(v20);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v21 = *(id *)(a1 + 32);
    if (v21)
    {
      if (a2) {
        v22 = @"countryCode";
      }
      else {
        v22 = @"country_code";
      }
      [v4 setObject:v21 forKey:v22];
    }

    -[GEOPDSearchGeoIntent _readCenter](a1);
    id v23 = *(id *)(a1 + 24);
    v24 = v23;
    if (v23)
    {
      if (a2) {
        [v23 jsonRepresentation];
      }
      else {
      v25 = [v23 dictionaryRepresentation];
      }
      [v4 setObject:v25 forKey:@"center"];
    }
    -[GEOPDSearchGeoIntent _readMapRegion](a1);
    id v26 = *(id *)(a1 + 72);
    v27 = v26;
    if (v26)
    {
      if (a2)
      {
        v28 = [v26 jsonRepresentation];
        v29 = @"mapRegion";
      }
      else
      {
        v28 = [v26 dictionaryRepresentation];
        v29 = @"map_region";
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
        GEOPDSearchGeoIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDoorNumber_tags);
        objc_sync_exit(v31);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v32 = *(id *)(a1 + 56);
    if (v32)
    {
      if (a2) {
        v33 = @"doorNumber";
      }
      else {
        v33 = @"door_number";
      }
      [v4 setObject:v32 forKey:v33];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
    {
      v34 = *(void **)(a1 + 8);
      if (v34)
      {
        id v35 = v34;
        objc_sync_enter(v35);
        GEOPDSearchGeoIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_1);
        objc_sync_exit(v35);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v36 = *(id *)(a1 + 48);
    if (v36)
    {
      if (a2) {
        v37 = @"displayName";
      }
      else {
        v37 = @"display_name";
      }
      [v4 setObject:v36 forKey:v37];
    }

    -[GEOPDSearchGeoIntent _readDisplayMapRegion](a1);
    id v38 = *(id *)(a1 + 40);
    v39 = v38;
    if (v38)
    {
      if (a2)
      {
        v40 = [v38 jsonRepresentation];
        v41 = @"displayMapRegion";
      }
      else
      {
        v40 = [v38 dictionaryRepresentation];
        v41 = @"display_map_region";
      }
      [v4 setObject:v40 forKey:v41];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 4) == 0)
    {
      v42 = *(void **)(a1 + 8);
      if (v42)
      {
        id v43 = v42;
        objc_sync_enter(v43);
        GEOPDSearchGeoIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddress_tags_3);
        objc_sync_exit(v43);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v44 = *(id *)(a1 + 16);
    v45 = v44;
    if (v44)
    {
      if (a2) {
        [v44 jsonRepresentation];
      }
      else {
      v46 = [v44 dictionaryRepresentation];
      }
      [v4 setObject:v46 forKey:@"address"];
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
  return -[GEOPDSearchGeoIntent _dictionaryRepresentation:]((uint64_t)self, 1);
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
        id v6 = (int *)&readAll__recursiveTag_824;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_825;
      }
      GEOPDSearchGeoIntentReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchGeoIntentCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchGeoIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchGeoIntentIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDSearchGeoIntent readAll:]((uint64_t)self, 0);
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    if (self->_tokenSet) {
      PBDataWriterWriteSubmessage();
    }
    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      PBDataWriterWriteInt64Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_countryCode) {
      PBDataWriterWriteStringField();
    }
    if (self->_center) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapRegion) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_doorNumber) {
      PBDataWriterWriteStringField();
    }
    if (self->_displayName) {
      PBDataWriterWriteStringField();
    }
    if (self->_displayMapRegion) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_address) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSearchGeoIntent _readCenter](result);
    if ([*(id *)(v3 + 24) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDSearchGeoIntent _readDisplayMapRegion](v3);
    if ([*(id *)(v3 + 40) hasGreenTeaWithValue:a2])
    {
      return 1;
    }
    else
    {
      -[GEOPDSearchGeoIntent _readMapRegion](v3);
      v4 = *(void **)(v3 + 72);
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
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
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchGeoIntentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchGeoIntent readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  id v10 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v9;

  id v11 = [(GEOPDSearchTokenSet *)self->_tokenSet copyWithZone:a3];
  v12 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v11;

  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 64) = self->_geoId;
    *(_WORD *)(v5 + 112) |= 1u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_geoTypeId;
    *(_WORD *)(v5 + 112) |= 2u;
  }
  uint64_t v14 = [(NSString *)self->_countryCode copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  id v16 = [(GEOLatLng *)self->_center copyWithZone:a3];
  v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  id v18 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  v19 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v18;

  uint64_t v20 = [(NSString *)self->_doorNumber copyWithZone:a3];
  id v21 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v20;

  uint64_t v22 = [(NSString *)self->_displayName copyWithZone:a3];
  id v23 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v22;

  id v24 = [(GEOMapRegion *)self->_displayMapRegion copyWithZone:a3];
  v25 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v24;

  id v26 = [(GEOStructuredAddress *)self->_address copyWithZone:a3];
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v26;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  -[GEOPDSearchGeoIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchGeoIntent readAll:]((uint64_t)v4, 1);
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_30;
    }
  }
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | *((void *)v4 + 11))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:")) {
      goto LABEL_30;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v8 = *((_WORD *)v4 + 56);
  if (flags)
  {
    if ((v8 & 1) == 0 || self->_geoId != *((void *)v4 + 8)) {
      goto LABEL_30;
    }
  }
  else if (v8)
  {
LABEL_30:
    char v16 = 0;
    goto LABEL_31;
  }
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_geoTypeId != *((_DWORD *)v4 + 27)) {
      goto LABEL_30;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_30;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 4)
    && !-[NSString isEqual:](countryCode, "isEqual:"))
  {
    goto LABEL_30;
  }
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_30;
    }
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 9))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_30;
    }
  }
  doorNumber = self->_doorNumber;
  if ((unint64_t)doorNumber | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](doorNumber, "isEqual:")) {
      goto LABEL_30;
    }
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_30;
    }
  }
  displayMapRegion = self->_displayMapRegion;
  if ((unint64_t)displayMapRegion | *((void *)v4 + 5))
  {
    if (!-[GEOMapRegion isEqual:](displayMapRegion, "isEqual:")) {
      goto LABEL_30;
    }
  }
  address = self->_address;
  if ((unint64_t)address | *((void *)v4 + 2)) {
    char v16 = -[GEOStructuredAddress isEqual:](address, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_31:

  return v16;
}

- (unint64_t)hash
{
  -[GEOPDSearchGeoIntent readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_name hash];
  unint64_t v4 = [(GEOPDSearchTokenSet *)self->_tokenSet hash];
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    uint64_t v6 = 2654435761 * self->_geoId;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  uint64_t v6 = 0;
  if ((flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_geoTypeId;
LABEL_6:
  NSUInteger v8 = v4 ^ v3 ^ v6 ^ v7 ^ [(NSString *)self->_countryCode hash];
  unint64_t v9 = [(GEOLatLng *)self->_center hash];
  unint64_t v10 = v9 ^ [(GEOMapRegion *)self->_mapRegion hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_doorNumber hash];
  NSUInteger v12 = v8 ^ v11 ^ [(NSString *)self->_displayName hash];
  unint64_t v13 = [(GEOMapRegion *)self->_displayMapRegion hash];
  return v12 ^ v13 ^ [(GEOStructuredAddress *)self->_address hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSet, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_doorNumber, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end