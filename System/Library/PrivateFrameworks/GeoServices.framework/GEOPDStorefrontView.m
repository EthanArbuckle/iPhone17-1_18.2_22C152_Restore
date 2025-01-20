@interface GEOPDStorefrontView
+ (BOOL)isValid:(id)a3;
- (BOOL)hasImdataId;
- (BOOL)hasLookAt;
- (BOOL)hasLookAtGeo;
- (BOOL)hasPhotoPosition;
- (BOOL)hasViewpointGeo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGeographicCoordinate)lookAtGeo;
- (GEOPDGeographicCoordinate)viewpointGeo;
- (GEOPDOrientedPosition)lookAt;
- (GEOPDPhotoPosition)photoPosition;
- (GEOPDStorefrontView)init;
- (GEOPDStorefrontView)initWithData:(id)a3;
- (GEOPDStorefrontView)initWithDictionary:(id)a3;
- (GEOPDStorefrontView)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)imdataId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLookAt;
- (void)_readLookAtGeo;
- (void)_readPhotoPosition;
- (void)_readViewpointGeo;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasImdataId:(BOOL)a3;
- (void)setImdataId:(unint64_t)a3;
- (void)setLookAt:(id)a3;
- (void)setLookAtGeo:(id)a3;
- (void)setPhotoPosition:(id)a3;
- (void)setViewpointGeo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDStorefrontView

- (GEOPDStorefrontView)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDStorefrontView;
  v2 = [(GEOPDStorefrontView *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDStorefrontView)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDStorefrontView;
  v3 = [(GEOPDStorefrontView *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPhotoPosition
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
        GEOPDStorefrontViewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoPosition_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPhotoPosition
{
  return self->_photoPosition != 0;
}

- (GEOPDPhotoPosition)photoPosition
{
  -[GEOPDStorefrontView _readPhotoPosition]((uint64_t)self);
  photoPosition = self->_photoPosition;

  return photoPosition;
}

- (void)setPhotoPosition:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_photoPosition, a3);
}

- (unint64_t)imdataId
{
  return self->_imdataId;
}

- (void)setImdataId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_imdataId = a3;
}

- (void)setHasImdataId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasImdataId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readLookAt
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
        GEOPDStorefrontViewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLookAt_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLookAt
{
  return self->_lookAt != 0;
}

- (GEOPDOrientedPosition)lookAt
{
  -[GEOPDStorefrontView _readLookAt]((uint64_t)self);
  lookAt = self->_lookAt;

  return lookAt;
}

- (void)setLookAt:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_lookAt, a3);
}

- (void)_readLookAtGeo
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
        GEOPDStorefrontViewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLookAtGeo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLookAtGeo
{
  return self->_lookAtGeo != 0;
}

- (GEOPDGeographicCoordinate)lookAtGeo
{
  -[GEOPDStorefrontView _readLookAtGeo]((uint64_t)self);
  lookAtGeo = self->_lookAtGeo;

  return lookAtGeo;
}

- (void)setLookAtGeo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_lookAtGeo, a3);
}

- (void)_readViewpointGeo
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
        GEOPDStorefrontViewReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewpointGeo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasViewpointGeo
{
  return self->_viewpointGeo != 0;
}

- (GEOPDGeographicCoordinate)viewpointGeo
{
  -[GEOPDStorefrontView _readViewpointGeo]((uint64_t)self);
  viewpointGeo = self->_viewpointGeo;

  return viewpointGeo;
}

- (void)setViewpointGeo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_viewpointGeo, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDStorefrontView;
  v4 = [(GEOPDStorefrontView *)&v8 description];
  v5 = [(GEOPDStorefrontView *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDStorefrontView _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 photoPosition];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"photoPosition";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"photo_position";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(unsigned char *)(a1 + 68))
    {
      v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      if (a2) {
        v10 = @"imdataId";
      }
      else {
        v10 = @"imdata_id";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = [(id)a1 lookAt];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"lookAt";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"look_at";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [(id)a1 lookAtGeo];
    v16 = v15;
    if (v15)
    {
      if (a2)
      {
        v17 = [v15 jsonRepresentation];
        v18 = @"lookAtGeo";
      }
      else
      {
        v17 = [v15 dictionaryRepresentation];
        v18 = @"look_at_geo";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = [(id)a1 viewpointGeo];
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"viewpointGeo";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"viewpoint_geo";
      }
      [v4 setObject:v21 forKey:v22];
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
  return -[GEOPDStorefrontView _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDStorefrontView)initWithDictionary:(id)a3
{
  return (GEOPDStorefrontView *)-[GEOPDStorefrontView _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"photoPosition";
      }
      else {
        objc_super v6 = @"photo_position";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDPhotoPosition alloc];
        if (a3) {
          uint64_t v9 = [(GEOPDPhotoPosition *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOPDPhotoPosition *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setPhotoPosition:v9];
      }
      if (a3) {
        v11 = @"imdataId";
      }
      else {
        v11 = @"imdata_id";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setImdataId:", objc_msgSend(v12, "unsignedLongLongValue"));
      }

      if (a3) {
        v13 = @"lookAt";
      }
      else {
        v13 = @"look_at";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [GEOPDOrientedPosition alloc];
        if (a3) {
          uint64_t v16 = [(GEOPDOrientedPosition *)v15 initWithJSON:v14];
        }
        else {
          uint64_t v16 = [(GEOPDOrientedPosition *)v15 initWithDictionary:v14];
        }
        v17 = (void *)v16;
        [a1 setLookAt:v16];
      }
      if (a3) {
        v18 = @"lookAtGeo";
      }
      else {
        v18 = @"look_at_geo";
      }
      v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [GEOPDGeographicCoordinate alloc];
        if (a3) {
          uint64_t v21 = [(GEOPDGeographicCoordinate *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEOPDGeographicCoordinate *)v20 initWithDictionary:v19];
        }
        v22 = (void *)v21;
        [a1 setLookAtGeo:v21];
      }
      if (a3) {
        v23 = @"viewpointGeo";
      }
      else {
        v23 = @"viewpoint_geo";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [GEOPDGeographicCoordinate alloc];
        if (a3) {
          uint64_t v26 = [(GEOPDGeographicCoordinate *)v25 initWithJSON:v24];
        }
        else {
          uint64_t v26 = [(GEOPDGeographicCoordinate *)v25 initWithDictionary:v24];
        }
        v27 = (void *)v26;
        [a1 setViewpointGeo:v26];
      }
    }
  }

  return a1;
}

- (GEOPDStorefrontView)initWithJSON:(id)a3
{
  return (GEOPDStorefrontView *)-[GEOPDStorefrontView _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_304;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_305;
    }
    GEOPDStorefrontViewReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDStorefrontViewCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDStorefrontViewIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDStorefrontViewReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDStorefrontViewIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOPDStorefrontView *)self readAll:0];
    if (self->_photoPosition) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_lookAt) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_lookAtGeo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_viewpointGeo) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOPDStorefrontView *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_photoPosition) {
    objc_msgSend(v5, "setPhotoPosition:");
  }
  v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    v5[2] = self->_imdataId;
    *((unsigned char *)v5 + 68) |= 1u;
  }
  if (self->_lookAt)
  {
    objc_msgSend(v5, "setLookAt:");
    v4 = v5;
  }
  if (self->_lookAtGeo)
  {
    objc_msgSend(v5, "setLookAtGeo:");
    v4 = v5;
  }
  if (self->_viewpointGeo)
  {
    objc_msgSend(v5, "setViewpointGeo:");
    v4 = v5;
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDStorefrontViewReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDStorefrontView *)self readAll:0];
  id v9 = [(GEOPDPhotoPosition *)self->_photoPosition copyWithZone:a3];
  v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 16) = self->_imdataId;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  id v11 = [(GEOPDOrientedPosition *)self->_lookAt copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  id v13 = [(GEOPDGeographicCoordinate *)self->_lookAtGeo copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  id v15 = [(GEOPDGeographicCoordinate *)self->_viewpointGeo copyWithZone:a3];
  id v8 = *(id *)(v5 + 48);
  *(void *)(v5 + 48) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEOPDStorefrontView *)self readAll:1];
  [v4 readAll:1];
  photoPosition = self->_photoPosition;
  if ((unint64_t)photoPosition | *((void *)v4 + 5))
  {
    if (!-[GEOPDPhotoPosition isEqual:](photoPosition, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_imdataId != *((void *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  lookAt = self->_lookAt;
  if ((unint64_t)lookAt | *((void *)v4 + 4) && !-[GEOPDOrientedPosition isEqual:](lookAt, "isEqual:")) {
    goto LABEL_15;
  }
  lookAtGeo = self->_lookAtGeo;
  if ((unint64_t)lookAtGeo | *((void *)v4 + 3))
  {
    if (!-[GEOPDGeographicCoordinate isEqual:](lookAtGeo, "isEqual:")) {
      goto LABEL_15;
    }
  }
  viewpointGeo = self->_viewpointGeo;
  if ((unint64_t)viewpointGeo | *((void *)v4 + 6)) {
    char v9 = -[GEOPDGeographicCoordinate isEqual:](viewpointGeo, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  [(GEOPDStorefrontView *)self readAll:1];
  unint64_t v3 = [(GEOPDPhotoPosition *)self->_photoPosition hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v4 = 2654435761u * self->_imdataId;
  }
  else {
    unint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(GEOPDOrientedPosition *)self->_lookAt hash];
  unint64_t v7 = v5 ^ v6 ^ [(GEOPDGeographicCoordinate *)self->_lookAtGeo hash];
  return v7 ^ [(GEOPDGeographicCoordinate *)self->_viewpointGeo hash];
}

- (void)mergeFrom:(id)a3
{
  id v13 = a3;
  [v13 readAll:0];
  unint64_t v4 = v13;
  photoPosition = self->_photoPosition;
  uint64_t v6 = v13[5];
  if (photoPosition)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOPDPhotoPosition mergeFrom:](photoPosition, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOPDStorefrontView setPhotoPosition:](self, "setPhotoPosition:");
  }
  unint64_t v4 = v13;
LABEL_7:
  if (*((unsigned char *)v4 + 68))
  {
    self->_imdataId = v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
  lookAt = self->_lookAt;
  uint64_t v8 = v4[4];
  if (lookAt)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPDOrientedPosition mergeFrom:](lookAt, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOPDStorefrontView setLookAt:](self, "setLookAt:");
  }
  unint64_t v4 = v13;
LABEL_15:
  lookAtGeo = self->_lookAtGeo;
  uint64_t v10 = v4[3];
  if (lookAtGeo)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOPDGeographicCoordinate mergeFrom:](lookAtGeo, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[GEOPDStorefrontView setLookAtGeo:](self, "setLookAtGeo:");
  }
  unint64_t v4 = v13;
LABEL_21:
  viewpointGeo = self->_viewpointGeo;
  uint64_t v12 = v4[6];
  if (viewpointGeo)
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEOPDGeographicCoordinate mergeFrom:](viewpointGeo, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[GEOPDStorefrontView setViewpointGeo:](self, "setViewpointGeo:");
  }
  unint64_t v4 = v13;
LABEL_27:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewpointGeo, 0);
  objc_storeStrong((id *)&self->_photoPosition, 0);
  objc_storeStrong((id *)&self->_lookAt, 0);
  objc_storeStrong((id *)&self->_lookAtGeo, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end