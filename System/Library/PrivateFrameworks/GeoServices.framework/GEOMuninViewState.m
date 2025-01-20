@interface GEOMuninViewState
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCameraFrame;
- (BOOL)hasLocationInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCameraFrame)cameraFrame;
- (GEOLocationInfo)locationInfo;
- (GEOMuninViewState)init;
- (GEOMuninViewState)initWithData:(id)a3;
- (GEOMuninViewState)initWithDictionary:(id)a3;
- (GEOMuninViewState)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCameraFrame;
- (void)_readLocationInfo;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCameraFrame:(id)a3;
- (void)setLocationInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMuninViewState

- (GEOMuninViewState)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMuninViewState;
  v2 = [(GEOMuninViewState *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMuninViewState)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMuninViewState;
  v3 = [(GEOMuninViewState *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCameraFrame
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMuninViewStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCameraFrame_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCameraFrame
{
  return self->_cameraFrame != 0;
}

- (GEOCameraFrame)cameraFrame
{
  -[GEOMuninViewState _readCameraFrame]((uint64_t)self);
  cameraFrame = self->_cameraFrame;

  return cameraFrame;
}

- (void)setCameraFrame:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_cameraFrame, a3);
}

- (void)_readLocationInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMuninViewStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLocationInfo
{
  return self->_locationInfo != 0;
}

- (GEOLocationInfo)locationInfo
{
  -[GEOMuninViewState _readLocationInfo]((uint64_t)self);
  locationInfo = self->_locationInfo;

  return locationInfo;
}

- (void)setLocationInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_locationInfo, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMuninViewState;
  v4 = [(GEOMuninViewState *)&v8 description];
  v5 = [(GEOMuninViewState *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMuninViewState _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 cameraFrame];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"cameraFrame";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"camera_frame";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 locationInfo];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"locationInfo";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"location_info";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = (void *)a1[2];
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __47__GEOMuninViewState__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEOMuninViewState _dictionaryRepresentation:](self, 1);
}

void __47__GEOMuninViewState__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOMuninViewState)initWithDictionary:(id)a3
{
  return (GEOMuninViewState *)-[GEOMuninViewState _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"cameraFrame";
      }
      else {
        objc_super v6 = @"camera_frame";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOCameraFrame alloc];
        if (a3) {
          uint64_t v9 = [(GEOCameraFrame *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOCameraFrame *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setCameraFrame:v9];
      }
      if (a3) {
        v11 = @"locationInfo";
      }
      else {
        v11 = @"location_info";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOLocationInfo alloc];
        if (a3) {
          uint64_t v14 = [(GEOLocationInfo *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOLocationInfo *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setLocationInfo:v14];
      }
    }
  }

  return a1;
}

- (GEOMuninViewState)initWithJSON:(id)a3
{
  return (GEOMuninViewState *)-[GEOMuninViewState _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_2775;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2776;
    }
    GEOMuninViewStateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOCameraFrame *)self->_cameraFrame readAll:1];
    [(GEOLocationInfo *)self->_locationInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMuninViewStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMuninViewStateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOMuninViewStateIsDirty((uint64_t)self))
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
    [(GEOMuninViewState *)self readAll:0];
    if (self->_cameraFrame) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_locationInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOMuninViewState *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_cameraFrame) {
    objc_msgSend(v4, "setCameraFrame:");
  }
  if (self->_locationInfo) {
    objc_msgSend(v4, "setLocationInfo:");
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
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOMuninViewState *)self readAll:0];
    id v8 = [(GEOCameraFrame *)self->_cameraFrame copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    id v10 = [(GEOLocationInfo *)self->_locationInfo copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOMuninViewStateReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOMuninViewState *)self readAll:1],
         [v4 readAll:1],
         cameraFrame = self->_cameraFrame,
         !((unint64_t)cameraFrame | v4[3]))
     || -[GEOCameraFrame isEqual:](cameraFrame, "isEqual:")))
  {
    locationInfo = self->_locationInfo;
    if ((unint64_t)locationInfo | v4[4]) {
      char v7 = -[GEOLocationInfo isEqual:](locationInfo, "isEqual:");
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
  [(GEOMuninViewState *)self readAll:1];
  unint64_t v3 = [(GEOCameraFrame *)self->_cameraFrame hash];
  return [(GEOLocationInfo *)self->_locationInfo hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  cameraFrame = self->_cameraFrame;
  uint64_t v5 = v8[3];
  if (cameraFrame)
  {
    if (v5) {
      -[GEOCameraFrame mergeFrom:](cameraFrame, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOMuninViewState setCameraFrame:](self, "setCameraFrame:");
  }
  locationInfo = self->_locationInfo;
  uint64_t v7 = v8[4];
  if (locationInfo)
  {
    if (v7) {
      -[GEOLocationInfo mergeFrom:](locationInfo, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOMuninViewState setLocationInfo:](self, "setLocationInfo:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOMuninViewStateReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2780);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOMuninViewState *)self readAll:0];
    [(GEOCameraFrame *)self->_cameraFrame clearUnknownFields:1];
    locationInfo = self->_locationInfo;
    [(GEOLocationInfo *)locationInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationInfo, 0);
  objc_storeStrong((id *)&self->_cameraFrame, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end