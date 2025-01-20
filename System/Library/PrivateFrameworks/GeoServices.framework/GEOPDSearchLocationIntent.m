@interface GEOPDSearchLocationIntent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchLocationIntent)init;
- (GEOPDSearchLocationIntent)initWithData:(id)a3;
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

@implementation GEOPDSearchLocationIntent

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSearchLocationIntent _readCenter](result);
    if ([*(id *)(v3 + 16) hasGreenTeaWithValue:a2]) {
      return 1;
    }
    -[GEOPDSearchLocationIntent _readDisplayMapRegion](v3);
    if ([*(id *)(v3 + 24) hasGreenTeaWithValue:a2])
    {
      return 1;
    }
    else
    {
      -[GEOPDSearchLocationIntent _readMapRegion](v3);
      v4 = *(void **)(v3 + 40);
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
}

- (GEOPDSearchLocationIntent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchLocationIntent;
  v2 = [(GEOPDSearchLocationIntent *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchLocationIntent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchLocationIntent;
  uint64_t v3 = [(GEOPDSearchLocationIntent *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchLocationIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_1065);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchLocationIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_1066);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_readDisplayMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchLocationIntentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayMapRegion_tags_1067);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchLocationIntent;
  v4 = [(GEOPDSearchLocationIntent *)&v8 description];
  v5 = [(GEOPDSearchLocationIntent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchLocationIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_47;
  }
  -[GEOPDSearchLocationIntent readAll:](a1, 1);
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  -[GEOPDSearchLocationIntent _readMapRegion](a1);
  id v5 = *(id *)(a1 + 40);
  objc_super v6 = v5;
  if (v5)
  {
    if (a2)
    {
      objc_super v7 = [v5 jsonRepresentation];
      objc_super v8 = @"mapRegion";
    }
    else
    {
      objc_super v7 = [v5 dictionaryRepresentation];
      objc_super v8 = @"map_region";
    }
    [v4 setObject:v7 forKey:v8];
  }
  -[GEOPDSearchLocationIntent _readCenter](a1);
  id v9 = *(id *)(a1 + 16);
  v10 = v9;
  if (v9)
  {
    if (a2) {
      [v9 jsonRepresentation];
    }
    else {
    v11 = [v9 dictionaryRepresentation];
    }
    [v4 setObject:v11 forKey:@"center"];
  }
  __int16 v12 = *(_WORD *)(a1 + 76);
  if ((v12 & 4) != 0)
  {
    uint64_t v13 = *(int *)(a1 + 68);
    if (v13 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E53E2650[v13];
    }
    if (a2) {
      v15 = @"locationType";
    }
    else {
      v15 = @"location_type";
    }
    [v4 setObject:v14 forKey:v15];

    __int16 v12 = *(_WORD *)(a1 + 76);
  }
  if (v12)
  {
    v22 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    if (a2) {
      v23 = @"distanceInKm";
    }
    else {
      v23 = @"distance_in_km";
    }
    [v4 setObject:v22 forKey:v23];

    __int16 v12 = *(_WORD *)(a1 + 76);
    if ((v12 & 8) == 0)
    {
LABEL_22:
      if ((v12 & 2) == 0) {
        goto LABEL_23;
      }
LABEL_39:
      v26 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
      if (a2) {
        v27 = @"venueId";
      }
      else {
        v27 = @"venue_id";
      }
      [v4 setObject:v26 forKey:v27];

      if ((*(_WORD *)(a1 + 76) & 0x10) == 0) {
        goto LABEL_28;
      }
      goto LABEL_24;
    }
  }
  else if ((v12 & 8) == 0)
  {
    goto LABEL_22;
  }
  v24 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
  if (a2) {
    v25 = @"isDerivedFromGeoIntent";
  }
  else {
    v25 = @"is_derived_from_geo_intent";
  }
  [v4 setObject:v24 forKey:v25];

  __int16 v12 = *(_WORD *)(a1 + 76);
  if ((v12 & 2) != 0) {
    goto LABEL_39;
  }
LABEL_23:
  if ((v12 & 0x10) != 0)
  {
LABEL_24:
    v16 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 73)];
    if (a2) {
      v17 = @"isDerivedFromPoiIntent";
    }
    else {
      v17 = @"is_derived_from_poi_intent";
    }
    [v4 setObject:v16 forKey:v17];
  }
LABEL_28:
  -[GEOPDSearchLocationIntent _readDisplayMapRegion](a1);
  id v18 = *(id *)(a1 + 24);
  v19 = v18;
  if (v18)
  {
    if (a2)
    {
      v20 = [v18 jsonRepresentation];
      v21 = @"displayMapRegion";
    }
    else
    {
      v20 = [v18 dictionaryRepresentation];
      v21 = @"display_map_region";
    }
    [v4 setObject:v20 forKey:v21];
  }
LABEL_47:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchLocationIntent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_1098;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1099;
      }
      GEOPDSearchLocationIntentReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 40) readAll:1];
      [*(id *)(a1 + 16) readAll:1];
      [*(id *)(a1 + 24) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchLocationIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x1E0) == 0)
    {
      objc_super v6 = self->_reader;
      objc_sync_enter(v6);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v8 writeData:v7];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v6);
      goto LABEL_21;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchLocationIntent readAll:]((uint64_t)self, 0);
  if (self->_mapRegion) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_center) {
    PBDataWriterWriteSubmessage();
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_9:
      if ((flags & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_10:
    if ((flags & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_11:
    if ((flags & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_flags & 0x10) != 0) {
LABEL_12:
  }
    PBDataWriterWriteBOOLField();
LABEL_13:
  if (self->_displayMapRegion) {
    PBDataWriterWriteSubmessage();
  }
LABEL_21:
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
    -[GEOPDSearchLocationIntent readAll:]((uint64_t)self, 0);
    id v9 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
    v10 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v9;

    id v11 = [(GEOLatLng *)self->_center copyWithZone:a3];
    __int16 v12 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v11;

    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_DWORD *)(v5 + 68) = self->_locationType;
      *(_WORD *)(v5 + 76) |= 4u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_7:
        if ((flags & 8) == 0) {
          goto LABEL_8;
        }
        goto LABEL_15;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_7;
    }
    *(double *)(v5 + 32) = self->_distanceInKm;
    *(_WORD *)(v5 + 76) |= 1u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_8:
      if ((flags & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_16;
    }
LABEL_15:
    *(unsigned char *)(v5 + 72) = self->_isDerivedFromGeoIntent;
    *(_WORD *)(v5 + 76) |= 8u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_9:
      if ((flags & 0x10) == 0)
      {
LABEL_11:
        id v14 = [(GEOMapRegion *)self->_displayMapRegion copyWithZone:a3];
        id v8 = *(id *)(v5 + 24);
        *(void *)(v5 + 24) = v14;
        goto LABEL_12;
      }
LABEL_10:
      *(unsigned char *)(v5 + 73) = self->_isDerivedFromPoiIntent;
      *(_WORD *)(v5 + 76) |= 0x10u;
      goto LABEL_11;
    }
LABEL_16:
    *(void *)(v5 + 48) = self->_venueId;
    *(_WORD *)(v5 + 76) |= 2u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0) {
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
  GEOPDSearchLocationIntentReadAllFrom(v5, self->_reader, 0);
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
    goto LABEL_33;
  }
  -[GEOPDSearchLocationIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchLocationIntent readAll:]((uint64_t)v4, 1);
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 5))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_33;
    }
  }
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_33;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v8 = *((_WORD *)v4 + 38);
  if ((flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_locationType != *((_DWORD *)v4 + 17)) {
      goto LABEL_33;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_33;
  }
  if (flags)
  {
    if ((v8 & 1) == 0 || self->_distanceInKm != *((double *)v4 + 4)) {
      goto LABEL_33;
    }
  }
  else if (v8)
  {
    goto LABEL_33;
  }
  if ((flags & 8) != 0)
  {
    if ((v8 & 8) == 0) {
      goto LABEL_33;
    }
    if (self->_isDerivedFromGeoIntent)
    {
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_33;
      }
    }
    else if (*((unsigned char *)v4 + 72))
    {
      goto LABEL_33;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_venueId != *((void *)v4 + 6)) {
      goto LABEL_33;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 0x10) == 0)
  {
    if ((v8 & 0x10) == 0) {
      goto LABEL_39;
    }
LABEL_33:
    char v9 = 0;
    goto LABEL_34;
  }
  if ((v8 & 0x10) == 0) {
    goto LABEL_33;
  }
  if (!self->_isDerivedFromPoiIntent)
  {
    if (!*((unsigned char *)v4 + 73)) {
      goto LABEL_39;
    }
    goto LABEL_33;
  }
  if (!*((unsigned char *)v4 + 73)) {
    goto LABEL_33;
  }
LABEL_39:
  displayMapRegion = self->_displayMapRegion;
  if ((unint64_t)displayMapRegion | *((void *)v4 + 3)) {
    char v9 = -[GEOMapRegion isEqual:](displayMapRegion, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_34:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDSearchLocationIntent readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOMapRegion *)self->_mapRegion hash];
  unint64_t v4 = [(GEOLatLng *)self->_center hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_locationType;
    if (flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v11 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = 0;
  if ((flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double distanceInKm = self->_distanceInKm;
  double v8 = -distanceInKm;
  if (distanceInKm >= 0.0) {
    double v8 = self->_distanceInKm;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_11:
  if ((flags & 8) == 0)
  {
    uint64_t v12 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_13;
    }
LABEL_16:
    unint64_t v13 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ [(GEOMapRegion *)self->_displayMapRegion hash];
  }
  uint64_t v12 = 2654435761 * self->_isDerivedFromGeoIntent;
  if ((flags & 2) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  unint64_t v13 = 2654435761u * self->_venueId;
  if ((flags & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v14 = 2654435761 * self->_isDerivedFromPoiIntent;
  return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ [(GEOMapRegion *)self->_displayMapRegion hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_center, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end