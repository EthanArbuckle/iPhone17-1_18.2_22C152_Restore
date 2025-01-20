@interface GEORPMapLocation
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCoordinate;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasImage;
- (BOOL)hasMapScreenshotId;
- (BOOL)hasViewportInfo;
- (BOOL)hasZoomLevel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)coordinate;
- (GEOPDViewportInfo)viewportInfo;
- (GEORPMapLocation)init;
- (GEORPMapLocation)initWithData:(id)a3;
- (GEORPMapLocation)initWithDictionary:(id)a3;
- (GEORPMapLocation)initWithJSON:(id)a3;
- (NSData)image;
- (NSString)mapScreenshotId;
- (float)zoomLevel;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCoordinate;
- (void)_readImage;
- (void)_readMapScreenshotId;
- (void)_readViewportInfo;
- (void)_setMapMode:(int)a3 region:(id)a4;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCoordinate:(id)a3;
- (void)setHasZoomLevel:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setMapScreenshotId:(id)a3;
- (void)setViewportInfo:(id)a3;
- (void)setZoomLevel:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPMapLocation

- (GEORPMapLocation)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPMapLocation;
  v2 = [(GEORPMapLocation *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPMapLocation)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPMapLocation;
  v3 = [(GEORPMapLocation *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readImage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMapLocationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImage_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (NSData)image
{
  -[GEORPMapLocation _readImage]((uint64_t)self);
  image = self->_image;

  return image;
}

- (void)setImage:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)_readCoordinate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMapLocationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoordinate_tags_1313);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (GEOLatLng)coordinate
{
  -[GEORPMapLocation _readCoordinate]((uint64_t)self);
  coordinate = self->_coordinate;

  return coordinate;
}

- (void)setCoordinate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (float)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(float)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_zoomLevel = a3;
}

- (void)setHasZoomLevel:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasZoomLevel
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readViewportInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMapLocationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readViewportInfo_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasViewportInfo
{
  return self->_viewportInfo != 0;
}

- (GEOPDViewportInfo)viewportInfo
{
  -[GEORPMapLocation _readViewportInfo]((uint64_t)self);
  viewportInfo = self->_viewportInfo;

  return viewportInfo;
}

- (void)setViewportInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_viewportInfo, a3);
}

- (void)_readMapScreenshotId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPMapLocationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapScreenshotId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasMapScreenshotId
{
  return self->_mapScreenshotId != 0;
}

- (NSString)mapScreenshotId
{
  -[GEORPMapLocation _readMapScreenshotId]((uint64_t)self);
  mapScreenshotId = self->_mapScreenshotId;

  return mapScreenshotId;
}

- (void)setMapScreenshotId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_mapScreenshotId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPMapLocation;
  v4 = [(GEORPMapLocation *)&v8 description];
  v5 = [(GEORPMapLocation *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPMapLocation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 image];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"image"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"image"];
      }
    }

    objc_super v8 = [(id)a1 coordinate];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"coordinate"];
    }
    if (*(unsigned char *)(a1 + 64))
    {
      LODWORD(v11) = *(_DWORD *)(a1 + 60);
      v12 = [NSNumber numberWithFloat:v11];
      if (a2) {
        v13 = @"zoomLevel";
      }
      else {
        v13 = @"zoom_level";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = [(id)a1 viewportInfo];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"viewportInfo";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"viewport_info";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = [(id)a1 mapScreenshotId];
    if (v18)
    {
      if (a2) {
        v19 = @"mapScreenshotId";
      }
      else {
        v19 = @"map_screenshot_id";
      }
      [v4 setObject:v18 forKey:v19];
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
  return -[GEORPMapLocation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPMapLocation)initWithDictionary:(id)a3
{
  return (GEORPMapLocation *)-[GEORPMapLocation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"image"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
        [a1 setImage:v7];
      }
      objc_super v8 = [v5 objectForKeyedSubscript:@"coordinate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v10 = [(GEOLatLng *)v9 initWithJSON:v8];
        }
        else {
          uint64_t v10 = [(GEOLatLng *)v9 initWithDictionary:v8];
        }
        double v11 = (void *)v10;
        [a1 setCoordinate:v10];
      }
      if (a3) {
        v12 = @"zoomLevel";
      }
      else {
        v12 = @"zoom_level";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 floatValue];
        objc_msgSend(a1, "setZoomLevel:");
      }

      if (a3) {
        v14 = @"viewportInfo";
      }
      else {
        v14 = @"viewport_info";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [GEOPDViewportInfo alloc];
        if (a3) {
          uint64_t v17 = [(GEOPDViewportInfo *)v16 initWithJSON:v15];
        }
        else {
          uint64_t v17 = [(GEOPDViewportInfo *)v16 initWithDictionary:v15];
        }
        v18 = (void *)v17;
        [a1 setViewportInfo:v17];
      }
      if (a3) {
        v19 = @"mapScreenshotId";
      }
      else {
        v19 = @"map_screenshot_id";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = (void *)[v20 copy];
        [a1 setMapScreenshotId:v21];
      }
    }
  }

  return a1;
}

- (GEORPMapLocation)initWithJSON:(id)a3
{
  return (GEORPMapLocation *)-[GEORPMapLocation _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1336;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1337;
    }
    GEORPMapLocationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLatLng *)self->_coordinate readAll:1];
    [(GEOPDViewportInfo *)self->_viewportInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPMapLocationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPMapLocationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3E) == 0))
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
    [(GEORPMapLocation *)self readAll:0];
    if (self->_image) {
      PBDataWriterWriteDataField();
    }
    if (self->_coordinate) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteFloatField();
    }
    if (self->_viewportInfo) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_mapScreenshotId) {
      PBDataWriterWriteStringField();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPMapLocation _readCoordinate]((uint64_t)self);
  if ([(GEOLatLng *)self->_coordinate hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPMapLocation _readViewportInfo]((uint64_t)self);
  viewportInfo = self->_viewportInfo;

  return [(GEOPDViewportInfo *)viewportInfo hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPMapLocation *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_image) {
    objc_msgSend(v5, "setImage:");
  }
  if (self->_coordinate) {
    objc_msgSend(v5, "setCoordinate:");
  }
  v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 15) = LODWORD(self->_zoomLevel);
    *((unsigned char *)v5 + 64) |= 1u;
  }
  if (self->_viewportInfo)
  {
    objc_msgSend(v5, "setViewportInfo:");
    v4 = v5;
  }
  if (self->_mapScreenshotId)
  {
    objc_msgSend(v5, "setMapScreenshotId:");
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
      GEORPMapLocationReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPMapLocation *)self readAll:0];
  uint64_t v9 = [(NSData *)self->_image copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOLatLng *)self->_coordinate copyWithZone:a3];
  v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(float *)(v5 + 60) = self->_zoomLevel;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v13 = [(GEOPDViewportInfo *)self->_viewportInfo copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  uint64_t v15 = [(NSString *)self->_mapScreenshotId copyWithZone:a3];
  id v8 = *(id *)(v5 + 32);
  *(void *)(v5 + 32) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEORPMapLocation *)self readAll:1];
  [v4 readAll:1];
  image = self->_image;
  if ((unint64_t)image | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](image, "isEqual:")) {
      goto LABEL_15;
    }
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](coordinate, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_zoomLevel != *((float *)v4 + 15)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((void *)v4 + 5) && !-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:")) {
    goto LABEL_15;
  }
  mapScreenshotId = self->_mapScreenshotId;
  if ((unint64_t)mapScreenshotId | *((void *)v4 + 4)) {
    char v9 = -[NSString isEqual:](mapScreenshotId, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  [(GEORPMapLocation *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_image hash];
  unint64_t v4 = [(GEOLatLng *)self->_coordinate hash];
  if (*(unsigned char *)&self->_flags)
  {
    float zoomLevel = self->_zoomLevel;
    double v7 = zoomLevel;
    if (zoomLevel < 0.0) {
      double v7 = -zoomLevel;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  unint64_t v10 = v4 ^ v3 ^ v5 ^ [(GEOPDViewportInfo *)self->_viewportInfo hash];
  return v10 ^ [(NSString *)self->_mapScreenshotId hash];
}

- (void)mergeFrom:(id)a3
{
  double v9 = a3;
  [v9 readAll:0];
  unint64_t v4 = (float *)v9;
  if (v9[3])
  {
    -[GEORPMapLocation setImage:](self, "setImage:");
    unint64_t v4 = (float *)v9;
  }
  coordinate = self->_coordinate;
  uint64_t v6 = *((void *)v4 + 2);
  if (coordinate)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOLatLng mergeFrom:](coordinate, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORPMapLocation setCoordinate:](self, "setCoordinate:");
  }
  unint64_t v4 = (float *)v9;
LABEL_9:
  if ((_BYTE)v4[16])
  {
    self->_float zoomLevel = v4[15];
    *(unsigned char *)&self->_flags |= 1u;
  }
  viewportInfo = self->_viewportInfo;
  uint64_t v8 = *((void *)v4 + 5);
  if (viewportInfo)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEOPDViewportInfo mergeFrom:](viewportInfo, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[GEORPMapLocation setViewportInfo:](self, "setViewportInfo:");
  }
  unint64_t v4 = (float *)v9;
LABEL_17:
  if (*((void *)v4 + 4))
  {
    -[GEORPMapLocation setMapScreenshotId:](self, "setMapScreenshotId:");
    unint64_t v4 = (float *)v9;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_mapScreenshotId, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)_setMapMode:(int)a3 region:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  uint64_t v6 = objc_alloc_init(GEOPDViewportInfo);
  double v7 = v6;
  if (v4 <= 4) {
    [(GEOPDViewportInfo *)v6 setMapType:v4];
  }
  [(GEOPDViewportInfo *)v7 setMapRegion:v8];
  [(GEORPMapLocation *)self setViewportInfo:v7];
}

@end