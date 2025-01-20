@interface GEORouteInformation
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORouteInformation)init;
- (GEORouteInformation)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)distance;
- (id)duration;
- (id)jsonRepresentation;
- (id)routeDescription;
- (id)separator;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)clearUnknownFields:(uint64_t)result;
- (unint64_t)hash;
- (void)_readDistance;
- (void)_readDuration;
- (void)_readRouteDescription;
- (void)_readSeparator;
- (void)mergeFrom:(void *)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDetail:(uint64_t)a1;
- (void)setDistance:(uint64_t)a1;
- (void)setDuration:(uint64_t)a1;
- (void)setRouteDescription:(uint64_t)a1;
- (void)setSeparator:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEORouteInformation

- (void)mergeFrom:(void *)a1
{
  id v12 = a2;
  -[GEORouteInformation readAll:]((uint64_t)v12, 0);
  v3 = (void *)a1[5];
  uint64_t v4 = *((void *)v12 + 5);
  if (v3)
  {
    if (v4) {
      objc_msgSend(v3, "mergeFrom:");
    }
  }
  else if (v4)
  {
    -[GEORouteInformation setDuration:]((uint64_t)a1, *((void **)v12 + 5));
  }
  v5 = (void *)a1[3];
  uint64_t v6 = *((void *)v12 + 3);
  if (v5)
  {
    if (v6) {
      objc_msgSend(v5, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORouteInformation setDetail:]((uint64_t)a1, *((void **)v12 + 3));
  }
  v7 = (void *)a1[4];
  uint64_t v8 = *((void *)v12 + 4);
  if (v7)
  {
    if (v8) {
      objc_msgSend(v7, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[GEORouteInformation setDistance:]((uint64_t)a1, *((void **)v12 + 4));
  }
  v9 = (void *)a1[6];
  uint64_t v10 = *((void *)v12 + 6);
  if (v9)
  {
    if (v10) {
      objc_msgSend(v9, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[GEORouteInformation setRouteDescription:]((uint64_t)a1, *((void **)v12 + 6));
  }
  v11 = (void *)*((void *)v12 + 7);
  if (v11) {
    -[GEORouteInformation setSeparator:]((uint64_t)a1, v11);
  }
}

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(v1 + 76) |= 1u;
    *(unsigned char *)(v1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 72));
    v2 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = 0;

    -[GEORouteInformation readAll:](v1, 0);
    [*(id *)(v1 + 40) clearUnknownFields:1];
    [*(id *)(v1 + 24) clearUnknownFields:1];
    [*(id *)(v1 + 32) clearUnknownFields:1];
    v3 = *(void **)(v1 + 48);
    return [v3 clearUnknownFields:1];
  }
  return result;
}

- (GEORouteInformation)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORouteInformation;
  v2 = [(GEORouteInformation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (GEORouteInformation)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORouteInformation;
  v3 = [(GEORouteInformation *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDuration
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDuration_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)duration
{
  if (a1)
  {
    v2 = a1;
    -[GEORouteInformation _readDuration]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDuration:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 8u;
  *(unsigned char *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setDetail:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 2u;
  *(unsigned char *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readDistance
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDistance_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)distance
{
  if (a1)
  {
    v2 = a1;
    -[GEORouteInformation _readDistance]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDistance:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 4u;
  *(unsigned char *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)_readRouteDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteDescription_tags_6403);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)routeDescription
{
  if (a1)
  {
    v2 = a1;
    -[GEORouteInformation _readRouteDescription]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setRouteDescription:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 0x10u;
  *(unsigned char *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)_readSeparator
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORouteInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSeparator_tags_6404);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)separator
{
  if (a1)
  {
    v2 = a1;
    -[GEORouteInformation _readSeparator]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSeparator:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 0x20u;
  *(unsigned char *)(a1 + 76) |= 0x40u;
  objc_storeStrong((id *)(a1 + 56), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORouteInformation;
  id v4 = [(GEORouteInformation *)&v8 description];
  v5 = [(GEORouteInformation *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORouteInformation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEORouteInformation readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEORouteInformation duration]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"duration"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      objc_super v8 = *(void **)(a1 + 8);
      if (v8)
      {
        id v9 = v8;
        objc_sync_enter(v9);
        GEORouteInformationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDetail_tags_6402);
        objc_sync_exit(v9);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v10 = *(id *)(a1 + 24);
    v11 = v10;
    if (v10)
    {
      if (a2) {
        [v10 jsonRepresentation];
      }
      else {
      id v12 = [v10 dictionaryRepresentation];
      }
      [v4 setObject:v12 forKey:@"detail"];
    }
    v13 = -[GEORouteInformation distance]((id *)a1);
    v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      v15 = [v13 dictionaryRepresentation];
      }
      [v4 setObject:v15 forKey:@"distance"];
    }
    v16 = -[GEORouteInformation routeDescription]((id *)a1);
    v17 = v16;
    if (v16)
    {
      if (a2)
      {
        v18 = [v16 jsonRepresentation];
        v19 = @"routeDescription";
      }
      else
      {
        v18 = [v16 dictionaryRepresentation];
        v19 = @"route_description";
      }
      [v4 setObject:v18 forKey:v19];
    }
    v20 = -[GEORouteInformation separator]((id *)a1);
    if (v20) {
      [v4 setObject:v20 forKey:@"separator"];
    }

    v21 = *(void **)(a1 + 16);
    if (v21)
    {
      v22 = [v21 dictionaryRepresentation];
      v23 = v22;
      if (a2)
      {
        v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __49__GEORouteInformation__dictionaryRepresentation___block_invoke;
        v28[3] = &unk_1E53D8860;
        id v25 = v24;
        id v29 = v25;
        [v23 enumerateKeysAndObjectsUsingBlock:v28];
        id v26 = v25;

        v23 = v26;
      }
      [v4 setObject:v23 forKey:@"Unknown Fields"];
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
  return -[GEORouteInformation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_6408;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_6409;
      }
      GEORouteInformationReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEORouteInformationCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __49__GEORouteInformation__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    objc_super v7 = [v5 objectForKeyedSubscript:@"duration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v8 = [GEOFormattedString alloc];
      if (a3) {
        id v9 = [(GEOFormattedString *)v8 initWithJSON:v7];
      }
      else {
        id v9 = [(GEOFormattedString *)v8 initWithDictionary:v7];
      }
      id v10 = v9;
      -[GEORouteInformation setDuration:](v6, v9);
    }
    v11 = [v5 objectForKeyedSubscript:@"detail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [GEOFormattedString alloc];
      if (a3) {
        v13 = [(GEOFormattedString *)v12 initWithJSON:v11];
      }
      else {
        v13 = [(GEOFormattedString *)v12 initWithDictionary:v11];
      }
      v14 = v13;
      -[GEORouteInformation setDetail:](v6, v13);
    }
    v15 = [v5 objectForKeyedSubscript:@"distance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [GEOFormattedString alloc];
      if (a3) {
        v17 = [(GEOFormattedString *)v16 initWithJSON:v15];
      }
      else {
        v17 = [(GEOFormattedString *)v16 initWithDictionary:v15];
      }
      v18 = v17;
      -[GEORouteInformation setDistance:](v6, v17);
    }
    if (a3) {
      v19 = @"routeDescription";
    }
    else {
      v19 = @"route_description";
    }
    v20 = [v5 objectForKeyedSubscript:v19];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [GEOFormattedString alloc];
      if (a3) {
        v22 = [(GEOFormattedString *)v21 initWithJSON:v20];
      }
      else {
        v22 = [(GEOFormattedString *)v21 initWithDictionary:v20];
      }
      v23 = v22;
      -[GEORouteInformation setRouteDescription:](v6, v22);
    }
    v24 = [v5 objectForKeyedSubscript:@"separator"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = (void *)[v24 copy];
      -[GEORouteInformation setSeparator:](v6, v25);
    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEORouteInformationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORouteInformationIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v6 = self->_reader;
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
    -[GEORouteInformation readAll:]((uint64_t)self, 0);
    if (self->_duration) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_detail)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_distance)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_routeDescription)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_separator)
    {
      PBDataWriterWriteStringField();
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
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORouteInformation readAll:]((uint64_t)self, 0);
    id v8 = [(GEOFormattedString *)self->_duration copyWithZone:a3];
    id v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    id v10 = [(GEOFormattedString *)self->_detail copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    id v12 = [(GEOFormattedString *)self->_distance copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    id v14 = [(GEOFormattedString *)self->_routeDescription copyWithZone:a3];
    v15 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v14;

    uint64_t v16 = [(NSString *)self->_separator copyWithZone:a3];
    v17 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v16;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORouteInformationReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEORouteInformation readAll:]((uint64_t)self, 1),
         -[GEORouteInformation readAll:]((uint64_t)v4, 1),
         duration = self->_duration,
         !((unint64_t)duration | v4[5]))
     || -[GEOFormattedString isEqual:](duration, "isEqual:"))
    && ((detail = self->_detail, !((unint64_t)detail | v4[3]))
     || -[GEOFormattedString isEqual:](detail, "isEqual:"))
    && ((distance = self->_distance, !((unint64_t)distance | v4[4]))
     || -[GEOFormattedString isEqual:](distance, "isEqual:"))
    && ((routeDescription = self->_routeDescription, !((unint64_t)routeDescription | v4[6]))
     || -[GEOFormattedString isEqual:](routeDescription, "isEqual:")))
  {
    separator = self->_separator;
    if ((unint64_t)separator | v4[7]) {
      char v10 = -[NSString isEqual:](separator, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  -[GEORouteInformation readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOFormattedString *)self->_duration hash];
  unint64_t v4 = [(GEOFormattedString *)self->_detail hash] ^ v3;
  unint64_t v5 = [(GEOFormattedString *)self->_distance hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOFormattedString *)self->_routeDescription hash];
  return v6 ^ [(NSString *)self->_separator hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_routeDescription, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end