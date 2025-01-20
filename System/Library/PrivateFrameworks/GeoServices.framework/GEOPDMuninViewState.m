@interface GEOPDMuninViewState
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCameraFrame;
- (BOOL)hasLocationInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDCameraFrame)cameraFrame;
- (GEOPDLocationInfo)locationInfo;
- (GEOPDMuninViewState)init;
- (GEOPDMuninViewState)initWithData:(id)a3;
- (GEOPDMuninViewState)initWithDictionary:(id)a3;
- (GEOPDMuninViewState)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCameraFrame;
- (void)_readLocationInfo;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCameraFrame:(id)a3;
- (void)setLocationInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDMuninViewState

- (GEOPDMuninViewState)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDMuninViewState;
  v2 = [(GEOPDMuninViewState *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDMuninViewState)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDMuninViewState;
  v3 = [(GEOPDMuninViewState *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDMuninViewStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCameraFrame_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasCameraFrame
{
  return self->_cameraFrame != 0;
}

- (GEOPDCameraFrame)cameraFrame
{
  -[GEOPDMuninViewState _readCameraFrame]((uint64_t)self);
  cameraFrame = self->_cameraFrame;

  return cameraFrame;
}

- (void)setCameraFrame:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_cameraFrame, a3);
}

- (void)_readLocationInfo
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
        GEOPDMuninViewStateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasLocationInfo
{
  return self->_locationInfo != 0;
}

- (GEOPDLocationInfo)locationInfo
{
  -[GEOPDMuninViewState _readLocationInfo]((uint64_t)self);
  locationInfo = self->_locationInfo;

  return locationInfo;
}

- (void)setLocationInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_locationInfo, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDMuninViewState;
  v4 = [(GEOPDMuninViewState *)&v8 description];
  v5 = [(GEOPDMuninViewState *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMuninViewState _dictionaryRepresentation:](self, 0);
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
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMuninViewState _dictionaryRepresentation:](self, 1);
}

- (GEOPDMuninViewState)initWithDictionary:(id)a3
{
  return (GEOPDMuninViewState *)-[GEOPDMuninViewState _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v8 = [GEOPDCameraFrame alloc];
        if (a3) {
          uint64_t v9 = [(GEOPDCameraFrame *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOPDCameraFrame *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
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
        v13 = [GEOPDLocationInfo alloc];
        if (a3) {
          uint64_t v14 = [(GEOPDLocationInfo *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOPDLocationInfo *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setLocationInfo:v14];
      }
    }
  }

  return a1;
}

- (GEOPDMuninViewState)initWithJSON:(id)a3
{
  return (GEOPDMuninViewState *)-[GEOPDMuninViewState _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_362;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_363;
    }
    GEOPDMuninViewStateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPDCameraFrame *)self->_cameraFrame readAll:1];
    [(GEOPDLocationInfo *)self->_locationInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDMuninViewStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDMuninViewStateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDMuninViewStateIsDirty((uint64_t)self))
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
    [(GEOPDMuninViewState *)self readAll:0];
    if (self->_cameraFrame) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_locationInfo) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOPDMuninViewState *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
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
    [(GEOPDMuninViewState *)self readAll:0];
    id v8 = [(GEOPDCameraFrame *)self->_cameraFrame copyWithZone:a3];
    uint64_t v9 = (void *)v5[2];
    v5[2] = v8;

    id v10 = [(GEOPDLocationInfo *)self->_locationInfo copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDMuninViewStateReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPDMuninViewState *)self readAll:1],
         [v4 readAll:1],
         cameraFrame = self->_cameraFrame,
         !((unint64_t)cameraFrame | v4[2]))
     || -[GEOPDCameraFrame isEqual:](cameraFrame, "isEqual:")))
  {
    locationInfo = self->_locationInfo;
    if ((unint64_t)locationInfo | v4[3]) {
      char v7 = -[GEOPDLocationInfo isEqual:](locationInfo, "isEqual:");
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
  [(GEOPDMuninViewState *)self readAll:1];
  unint64_t v3 = [(GEOPDCameraFrame *)self->_cameraFrame hash];
  return [(GEOPDLocationInfo *)self->_locationInfo hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  cameraFrame = self->_cameraFrame;
  uint64_t v5 = v8[2];
  if (cameraFrame)
  {
    if (v5) {
      -[GEOPDCameraFrame mergeFrom:](cameraFrame, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOPDMuninViewState setCameraFrame:](self, "setCameraFrame:");
  }
  locationInfo = self->_locationInfo;
  uint64_t v7 = v8[3];
  if (locationInfo)
  {
    if (v7) {
      -[GEOPDLocationInfo mergeFrom:](locationInfo, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOPDMuninViewState setLocationInfo:](self, "setLocationInfo:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationInfo, 0);
  objc_storeStrong((id *)&self->_cameraFrame, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end