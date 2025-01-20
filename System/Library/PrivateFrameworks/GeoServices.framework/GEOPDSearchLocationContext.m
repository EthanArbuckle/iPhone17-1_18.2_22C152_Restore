@interface GEOPDSearchLocationContext
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchLocationContext)init;
- (GEOPDSearchLocationContext)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDeviceLocation;
- (void)_readViewportInfo;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDeviceLocation:(uint64_t)a1;
- (void)setViewportInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchLocationContext

- (GEOPDSearchLocationContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchLocationContext;
  v2 = [(GEOPDSearchLocationContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchLocationContext)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchLocationContext;
  v3 = [(GEOPDSearchLocationContext *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDeviceLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchLocationContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceLocation_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (void)setDeviceLocation:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 44) |= 1u;
    *(unsigned char *)(a1 + 44) |= 4u;
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)_readViewportInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchLocationContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (void)setViewportInfo:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 44) |= 2u;
    *(unsigned char *)(a1 + 44) |= 4u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchLocationContext;
  id v4 = [(GEOPDSearchLocationContext *)&v8 description];
  v5 = [(GEOPDSearchLocationContext *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchLocationContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchLocationContext readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    -[GEOPDSearchLocationContext _readDeviceLocation](a1);
    id v5 = *(id *)(a1 + 16);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"deviceLocation";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"device_location";
      }
      [v4 setObject:v7 forKey:v8];
    }
    -[GEOPDSearchLocationContext _readViewportInfo](a1);
    id v9 = *(id *)(a1 + 24);
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"viewportInfo";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"viewport_info";
      }
      [v4 setObject:v11 forKey:v12];
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
  return -[GEOPDSearchLocationContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_90;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_91;
      }
      GEOPDSearchLocationContextReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 16) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"deviceLocation";
      }
      else {
        objc_super v6 = @"device_location";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOLatLng alloc];
        if (a3) {
          id v9 = [(GEOLatLng *)v8 initWithJSON:v7];
        }
        else {
          id v9 = [(GEOLatLng *)v8 initWithDictionary:v7];
        }
        v10 = v9;
        -[GEOPDSearchLocationContext setDeviceLocation:]((uint64_t)a1, v9);
      }
      if (a3) {
        v11 = @"viewportInfo";
      }
      else {
        v11 = @"viewport_info";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_52;
      }
      v13 = [GEOPDSearchViewportInfo alloc];
      if (!v13)
      {
LABEL_51:
        -[GEOPDSearchLocationContext setViewportInfo:]((uint64_t)a1, v13);

LABEL_52:
        goto LABEL_53;
      }
      id v14 = v12;
      v13 = [(GEOPDSearchViewportInfo *)v13 init];
      if (!v13)
      {
LABEL_50:

        goto LABEL_51;
      }
      if (a3) {
        v15 = @"mapRegion";
      }
      else {
        v15 = @"map_region";
      }
      v16 = [v14 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [GEOMapRegion alloc];
        if (a3) {
          v18 = [(GEOMapRegion *)v17 initWithJSON:v16];
        }
        else {
          v18 = [(GEOMapRegion *)v17 initWithDictionary:v16];
        }
        v19 = v18;
        -[GEOPDSearchViewportInfo setMapRegion:]((uint64_t)v13, v18);
      }
      if (a3) {
        v20 = @"timeSinceMapViewportChanged";
      }
      else {
        v20 = @"time_since_map_viewport_changed";
      }
      v21 = [v14 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v22 = [v21 unsignedIntValue];
        *(unsigned char *)&v13->_flags |= 2u;
        v13->_timeSinceMapViewportChanged = v22;
      }

      if (a3) {
        v23 = @"mapType";
      }
      else {
        v23 = @"map_type";
      }
      v24 = [v14 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v24;
        if ([v25 isEqualToString:@"MAP_TYPE_NONE"])
        {
          int v26 = 0;
        }
        else if ([v25 isEqualToString:@"MAP_TYPE_STANDARD"])
        {
          int v26 = 1;
        }
        else if ([v25 isEqualToString:@"MAP_TYPE_SATELLITE"])
        {
          int v26 = 2;
        }
        else if ([v25 isEqualToString:@"MAP_TYPE_HYBRID"])
        {
          int v26 = 3;
        }
        else if ([v25 isEqualToString:@"MAP_TYPE_TRANSIT"])
        {
          int v26 = 4;
        }
        else
        {
          int v26 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_49:

          goto LABEL_50;
        }
        int v26 = [v24 intValue];
      }
      *(unsigned char *)&v13->_flags |= 1u;
      v13->_mapType = v26;
      goto LABEL_49;
    }
  }
LABEL_53:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchLocationContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchLocationContext readAll:]((uint64_t)self, 0);
    if (self->_deviceLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_viewportInfo) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSearchLocationContext _readDeviceLocation](result);
    result = 1;
    if (([*(id *)(v3 + 16) hasGreenTeaWithValue:a2] & 1) == 0)
    {
      -[GEOPDSearchLocationContext _readViewportInfo](v3);
      uint64_t v4 = *(void *)(v3 + 24);
      if (!v4 || ([*(id *)(v4 + 8) hasGreenTeaWithValue:a2] & 1) == 0) {
        return 0;
      }
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchLocationContext readAll:]((uint64_t)self, 0);
    id v8 = [(GEOLatLng *)self->_deviceLocation copyWithZone:a3];
    id v9 = (void *)v5[2];
    v5[2] = v8;

    id v10 = [(GEOPDSearchViewportInfo *)self->_viewportInfo copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDSearchLocationContextReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDSearchLocationContext readAll:]((uint64_t)self, 1),
         -[GEOPDSearchLocationContext readAll:]((uint64_t)v4, 1),
         deviceLocation = self->_deviceLocation,
         !((unint64_t)deviceLocation | v4[2]))
     || -[GEOLatLng isEqual:](deviceLocation, "isEqual:")))
  {
    viewportInfo = self->_viewportInfo;
    if ((unint64_t)viewportInfo | v4[3]) {
      char v7 = -[GEOPDSearchViewportInfo isEqual:](viewportInfo, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSearchLocationContext readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOLatLng *)self->_deviceLocation hash];
  return [(GEOPDSearchViewportInfo *)self->_viewportInfo hash] ^ v3;
}

- (void)mergeFrom:(uint64_t)a1
{
  id v7 = a2;
  if (a1)
  {
    -[GEOPDSearchLocationContext readAll:]((uint64_t)v7, 0);
    unint64_t v3 = *(void **)(a1 + 16);
    uint64_t v4 = *((void *)v7 + 2);
    if (v3)
    {
      if (v4) {
        objc_msgSend(v3, "mergeFrom:");
      }
    }
    else if (v4)
    {
      -[GEOPDSearchLocationContext setDeviceLocation:](a1, *((void **)v7 + 2));
    }
    uint64_t v5 = *(void *)(a1 + 24);
    objc_super v6 = (void *)*((void *)v7 + 3);
    if (v5)
    {
      if (v6) {
        -[GEOPDSearchViewportInfo mergeFrom:](v5, v6);
      }
    }
    else if (v6)
    {
      -[GEOPDSearchLocationContext setViewportInfo:](a1, v6);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_deviceLocation, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end