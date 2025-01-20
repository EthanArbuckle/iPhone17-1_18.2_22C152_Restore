@interface GEOTerritoryDataTerritoryInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTerritoryDataTerritoryInfo)init;
- (GEOTerritoryDataTerritoryInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)polygon;
- (uint64_t)interestedPartyAtIndex:(uint64_t)result;
- (uint64_t)territoryTypeAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)_readInterestedPartys;
- (void)_readPolygon;
- (void)_readTerritoryTypes;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOTerritoryDataTerritoryInfo

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTerritoryDataTerritoryInfo;
  [(GEOTerritoryDataTerritoryInfo *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_polygon, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_interestedPartyCountryCode, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)polygon
{
  if (a1)
  {
    v2 = a1;
    -[GEOTerritoryDataTerritoryInfo _readPolygon]((uint64_t)a1);
    a1 = (id *)v2[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPolygon
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 112) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTerritoryDataTerritoryInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPolygon_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (void)_readTerritoryTypes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 112) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTerritoryDataTerritoryInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTerritoryTypes_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (uint64_t)territoryTypeAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOTerritoryDataTerritoryInfo _readTerritoryTypes](result);
    unint64_t v4 = *(void *)(v3 + 48);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 40) + 4 * a2);
  }
  return result;
}

- (GEOTerritoryDataTerritoryInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTerritoryDataTerritoryInfo;
  v2 = [(GEOTerritoryDataTerritoryInfo *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    unint64_t v4 = v2;
  }

  return v3;
}

- (GEOTerritoryDataTerritoryInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTerritoryDataTerritoryInfo;
  uint64_t v3 = [(GEOTerritoryDataTerritoryInfo *)&v7 initWithData:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readInterestedPartys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 112) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTerritoryDataTerritoryInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInterestedPartys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (uint64_t)interestedPartyAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOTerritoryDataTerritoryInfo _readInterestedPartys](result);
    unint64_t v4 = *(void *)(v3 + 24);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(unsigned int *)(*(void *)(v3 + 16) + 4 * a2);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTerritoryDataTerritoryInfo;
  unint64_t v4 = [(GEOTerritoryDataTerritoryInfo *)&v8 description];
  v5 = [(GEOTerritoryDataTerritoryInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTerritoryDataTerritoryInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOTerritoryDataTerritoryInfo readAll:](a1, 1);
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 48))
    {
      v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      uint64_t v6 = (void *)(a1 + 40);
      if (*(void *)(a1 + 48))
      {
        unint64_t v7 = 0;
        do
        {
          uint64_t v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E53E4E20[v8];
          }
          [v5 addObject:v9];

          ++v7;
          uint64_t v6 = (void *)(a1 + 40);
        }
        while (v7 < *(void *)(a1 + 48));
      }
      if (a2) {
        v10 = @"territoryType";
      }
      else {
        v10 = @"territory_type";
      }
      [v4 setObject:v5 forKey:v10];
    }
    if ((*(unsigned char *)(a1 + 112) & 2) != 0)
    {
      v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 108)];
      if (a2) {
        v12 = @"nameId";
      }
      else {
        v12 = @"name_id";
      }
      [v4 setObject:v11 forKey:v12];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 112) & 0x20) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        id v14 = v13;
        objc_sync_enter(v14);
        GEOTerritoryDataTerritoryInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_10);
        objc_sync_exit(v14);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v15 = *(id *)(a1 + 80);
    if (v15) {
      [v4 setObject:v15 forKey:@"name"];
    }

    if (*(unsigned char *)(a1 + 112))
    {
      v16 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
      if (a2) {
        v17 = @"featureId";
      }
      else {
        v17 = @"feature_id";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = -[GEOTerritoryDataTerritoryInfo polygon]((id *)a1);
    v19 = v18;
    if (v18)
    {
      if (a2) {
        [v18 jsonRepresentation];
      }
      else {
      v20 = [v18 dictionaryRepresentation];
      }
      [v4 setObject:v20 forKey:@"polygon"];
    }
    if (*(void *)(a1 + 24))
    {
      v21 = PBRepeatedUInt32NSArray();
      if (a2) {
        v22 = @"interestedParty";
      }
      else {
        v22 = @"interested_party";
      }
      [v4 setObject:v21 forKey:v22];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(unsigned char *)(a1 + 112) & 0x10) == 0)
    {
      v23 = *(void **)(a1 + 8);
      if (v23)
      {
        id v24 = v23;
        objc_sync_enter(v24);
        GEOTerritoryDataTerritoryInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInterestedPartyCountryCode_tags);
        objc_sync_exit(v24);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v25 = *(id *)(a1 + 72);
    if (v25)
    {
      if (a2) {
        v26 = @"interestedPartyCountryCode";
      }
      else {
        v26 = @"interested_party_country_code";
      }
      [v4 setObject:v25 forKey:v26];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTerritoryDataTerritoryInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_102_0;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_103_0;
      }
      GEOTerritoryDataTerritoryInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOTerritoryDataPolygon readAll:](*(void *)(a1 + 88), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOTerritoryDataTerritoryInfoReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_8;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0xA8) != 0) {
    goto LABEL_8;
  }
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    polygon = self->_polygon;
    if (polygon)
    {
      os_unfair_lock_lock_with_options();
      os_unfair_lock_assert_owner(&polygon->_readerLock);
      int v8 = *(unsigned char *)&polygon->_flags & 7;
      os_unfair_lock_unlock(&polygon->_readerLock);
      if (v8) {
        goto LABEL_8;
      }
      char flags = (char)self->_flags;
    }
  }
  if ((flags & 0x14) == 0)
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
    goto LABEL_26;
  }
LABEL_8:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTerritoryDataTerritoryInfo readAll:]((uint64_t)self, 0);
  if (self->_territoryTypes.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_territoryTypes.count);
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_polygon) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_interestedPartys.count)
  {
    PBDataWriterPlaceMark();
    if (self->_interestedPartys.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v10;
      }
      while (v10 < self->_interestedPartys.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_interestedPartyCountryCode) {
    PBDataWriterWriteStringField();
  }
LABEL_26:
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
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTerritoryDataTerritoryInfoReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTerritoryDataTerritoryInfo readAll:]((uint64_t)self, 0);
  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_nameId;
    *(unsigned char *)(v5 + 112) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 64) = self->_featureId;
    *(unsigned char *)(v5 + 112) |= 1u;
  }
  id v11 = [(GEOTerritoryDataPolygon *)self->_polygon copyWithZone:a3];
  v12 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v11;

  PBRepeatedUInt32Copy();
  uint64_t v13 = [(NSString *)self->_interestedPartyCountryCode copyWithZone:a3];
  id v8 = *(id *)(v5 + 72);
  *(void *)(v5 + 72) = v13;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  -[GEOTerritoryDataTerritoryInfo readAll:]((uint64_t)self, 1);
  -[GEOTerritoryDataTerritoryInfo readAll:]((uint64_t)v4, 1);
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_21;
  }
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 112);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 112) & 2) == 0 || self->_nameId != *((_DWORD *)v4 + 27)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 112) & 2) != 0)
  {
    goto LABEL_21;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
    {
LABEL_21:
      char v10 = 0;
      goto LABEL_22;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 112);
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_featureId != *((void *)v4 + 8)) {
      goto LABEL_21;
    }
  }
  else if (v6)
  {
    goto LABEL_21;
  }
  polygon = self->_polygon;
  if ((unint64_t)polygon | *((void *)v4 + 11) && !-[GEOTerritoryDataPolygon isEqual:](polygon, "isEqual:")
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_21;
  }
  interestedPartyCountryCode = self->_interestedPartyCountryCode;
  if ((unint64_t)interestedPartyCountryCode | *((void *)v4 + 9)) {
    char v10 = -[NSString isEqual:](interestedPartyCountryCode, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  -[GEOTerritoryDataTerritoryInfo readAll:]((uint64_t)self, 1);
  uint64_t v3 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_nameId;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v6 = 2654435761u * self->_featureId;
  }
  else {
    unint64_t v6 = 0;
  }
  unint64_t v7 = v4 ^ v3 ^ v6 ^ v5;
  unint64_t v8 = [(GEOTerritoryDataPolygon *)self->_polygon hash];
  uint64_t v9 = v7 ^ v8 ^ PBRepeatedUInt32Hash();
  return v9 ^ [(NSString *)self->_interestedPartyCountryCode hash];
}

@end