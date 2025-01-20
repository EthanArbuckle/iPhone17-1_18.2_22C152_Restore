@interface GEOPDDotPlace
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDDotPlace)init;
- (GEOPDDotPlace)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)latLng;
- (id)mapsId;
- (id)name;
- (id)styleAttributes;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_readLatLng;
- (void)_readMapsId;
- (void)_readName;
- (void)_readStyleAttributes;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDDotPlace

- (GEOPDDotPlace)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDDotPlace;
  v2 = [(GEOPDDotPlace *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDDotPlace)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDDotPlace;
  v3 = [(GEOPDDotPlace *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapsId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDotPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsId_tags_4065);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)mapsId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDDotPlace _readMapsId]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readLatLng
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDotPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLatLng_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)latLng
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDDotPlace _readLatLng]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readStyleAttributes
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDotPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributes_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)styleAttributes
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDDotPlace _readStyleAttributes]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDDotPlaceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_4066);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)name
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDDotPlace _readName]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDDotPlace;
  v4 = [(GEOPDDotPlace *)&v8 description];
  v5 = [(GEOPDDotPlace *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDotPlace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDDotPlace readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDDotPlace mapsId]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"mapsId";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"maps_id";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = -[GEOPDDotPlace latLng]((id *)a1);
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"latLng";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"lat_lng";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = -[GEOPDDotPlace styleAttributes]((id *)a1);
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"styleAttributes";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"style_attributes";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = -[GEOPDDotPlace name]((id *)a1);
    if (v17) {
      [v4 setObject:v17 forKey:@"name"];
    }

    v18 = *(void **)(a1 + 16);
    if (v18)
    {
      v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __43__GEOPDDotPlace__dictionaryRepresentation___block_invoke;
        v25[3] = &unk_1E53D8860;
        id v22 = v21;
        id v26 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        id v23 = v22;

        v20 = v23;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
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
  return -[GEOPDDotPlace _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_4074;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_4075;
      }
      GEOPDDotPlaceReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 32) readAll:1];
      [*(id *)(a1 + 24) readAll:1];
      [*(id *)(a1 + 48) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __43__GEOPDDotPlace__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"mapsId";
      }
      else {
        objc_super v6 = @"maps_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDMapsIdentifier alloc];
        if (a3) {
          v9 = [(GEOPDMapsIdentifier *)v8 initWithJSON:v7];
        }
        else {
          v9 = [(GEOPDMapsIdentifier *)v8 initWithDictionary:v7];
        }
        id v10 = v9;
        v11 = v9;
        *(unsigned char *)(a1 + 68) |= 4u;
        *(unsigned char *)(a1 + 68) |= 0x20u;
        objc_storeStrong((id *)(a1 + 32), v10);
      }
      if (a3) {
        v12 = @"latLng";
      }
      else {
        v12 = @"lat_lng";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = [GEOLatLng alloc];
        if (a3) {
          v15 = [(GEOLatLng *)v14 initWithJSON:v13];
        }
        else {
          v15 = [(GEOLatLng *)v14 initWithDictionary:v13];
        }
        v16 = v15;
        v17 = v15;
        *(unsigned char *)(a1 + 68) |= 2u;
        *(unsigned char *)(a1 + 68) |= 0x20u;
        objc_storeStrong((id *)(a1 + 24), v16);
      }
      if (a3) {
        v18 = @"styleAttributes";
      }
      else {
        v18 = @"style_attributes";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [GEOStyleAttributes alloc];
        if (a3) {
          v21 = [(GEOStyleAttributes *)v20 initWithJSON:v19];
        }
        else {
          v21 = [(GEOStyleAttributes *)v20 initWithDictionary:v19];
        }
        id v22 = v21;
        id v23 = v21;
        *(unsigned char *)(a1 + 68) |= 0x10u;
        *(unsigned char *)(a1 + 68) |= 0x20u;
        objc_storeStrong((id *)(a1 + 48), v22);
      }
      v24 = [v5 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = (void *)[v24 copy];
        id v26 = v25;
        *(unsigned char *)(a1 + 68) |= 8u;
        *(unsigned char *)(a1 + 68) |= 0x20u;
        objc_storeStrong((id *)(a1 + 40), v25);
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDotPlaceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3E) == 0))
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
    -[GEOPDDotPlace readAll:]((uint64_t)self, 0);
    if (self->_mapsId) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_latLng)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_styleAttributes)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_name)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDDotPlace _readLatLng](result);
    if ([*(id *)(v3 + 24) hasGreenTeaWithValue:a2])
    {
      return 1;
    }
    else
    {
      -[GEOPDDotPlace _readMapsId](v3);
      v4 = *(void **)(v3 + 32);
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
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDDotPlace readAll:]((uint64_t)self, 0);
    id v8 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEOLatLng *)self->_latLng copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    id v12 = [(GEOStyleAttributes *)self->_styleAttributes copyWithZone:a3];
    v13 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v12;

    uint64_t v14 = [(NSString *)self->_name copyWithZone:a3];
    v15 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDDotPlaceReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDDotPlace readAll:]((uint64_t)self, 1),
         -[GEOPDDotPlace readAll:]((uint64_t)v4, 1),
         mapsId = self->_mapsId,
         !((unint64_t)mapsId | v4[4]))
     || -[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:"))
    && ((latLng = self->_latLng, !((unint64_t)latLng | v4[3])) || -[GEOLatLng isEqual:](latLng, "isEqual:"))
    && ((styleAttributes = self->_styleAttributes, !((unint64_t)styleAttributes | v4[6]))
     || -[GEOStyleAttributes isEqual:](styleAttributes, "isEqual:")))
  {
    name = self->_name;
    if ((unint64_t)name | v4[5]) {
      char v9 = -[NSString isEqual:](name, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDDotPlace readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDMapsIdentifier *)self->_mapsId hash];
  unint64_t v4 = [(GEOLatLng *)self->_latLng hash] ^ v3;
  unint64_t v5 = [(GEOStyleAttributes *)self->_styleAttributes hash];
  return v4 ^ v5 ^ [(NSString *)self->_name hash];
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 1u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    unint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDDotPlace readAll:](a1, 0);
      [*(id *)(a1 + 32) clearUnknownFields:1];
      [*(id *)(a1 + 24) clearUnknownFields:1];
      unint64_t v5 = *(void **)(a1 + 48);
      [v5 clearUnknownFields:1];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_latLng, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end