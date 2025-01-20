@interface GEORPPhotoWithMetadata
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCreationDate;
- (BOOL)hasGeotagCoordinate;
- (BOOL)hasGeotagHorizontalAccuracy;
- (BOOL)hasGeotagTimestamp;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasImageData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)geotagCoordinate;
- (GEORPPhotoWithMetadata)init;
- (GEORPPhotoWithMetadata)initWithData:(id)a3;
- (GEORPPhotoWithMetadata)initWithDictionary:(id)a3;
- (GEORPPhotoWithMetadata)initWithJSON:(id)a3;
- (NSData)imageData;
- (double)creationDate;
- (double)geotagHorizontalAccuracy;
- (double)geotagTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readGeotagCoordinate;
- (void)_readImageData;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCreationDate:(double)a3;
- (void)setGeotagCoordinate:(id)a3;
- (void)setGeotagHorizontalAccuracy:(double)a3;
- (void)setGeotagTimestamp:(double)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasGeotagHorizontalAccuracy:(BOOL)a3;
- (void)setHasGeotagTimestamp:(BOOL)a3;
- (void)setImageData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPhotoWithMetadata

- (GEORPPhotoWithMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPPhotoWithMetadata;
  v2 = [(GEORPPhotoWithMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPhotoWithMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPPhotoWithMetadata;
  v3 = [(GEORPPhotoWithMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readImageData
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
        GEORPPhotoWithMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (NSData)imageData
{
  -[GEORPPhotoWithMetadata _readImageData]((uint64_t)self);
  imageData = self->_imageData;

  return imageData;
}

- (void)setImageData:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasCreationDate
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readGeotagCoordinate
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
        GEORPPhotoWithMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeotagCoordinate_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasGeotagCoordinate
{
  return self->_geotagCoordinate != 0;
}

- (GEOLatLng)geotagCoordinate
{
  -[GEORPPhotoWithMetadata _readGeotagCoordinate]((uint64_t)self);
  geotagCoordinate = self->_geotagCoordinate;

  return geotagCoordinate;
}

- (void)setGeotagCoordinate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_geotagCoordinate, a3);
}

- (double)geotagHorizontalAccuracy
{
  return self->_geotagHorizontalAccuracy;
}

- (void)setGeotagHorizontalAccuracy:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_geotagHorizontalAccuracy = a3;
}

- (void)setHasGeotagHorizontalAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasGeotagHorizontalAccuracy
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)geotagTimestamp
{
  return self->_geotagTimestamp;
}

- (void)setGeotagTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  self->_geotagTimestamp = a3;
}

- (void)setHasGeotagTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 36;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasGeotagTimestamp
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPhotoWithMetadata;
  v4 = [(GEORPPhotoWithMetadata *)&v8 description];
  v5 = [(GEORPPhotoWithMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPhotoWithMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 imageData];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"data"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"data"];
      }
    }

    if (*(unsigned char *)(a1 + 68))
    {
      objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
      if (a2) {
        v9 = @"creationDate";
      }
      else {
        v9 = @"creation_date";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = [(id)a1 geotagCoordinate];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"geotagCoordinate";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"geotag_coordinate";
      }
      [v4 setObject:v12 forKey:v13];
    }
    char v14 = *(unsigned char *)(a1 + 68);
    if ((v14 & 2) != 0)
    {
      v15 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
      if (a2) {
        v16 = @"geotagHorizontalAccuracy";
      }
      else {
        v16 = @"geotag_horizontal_accuracy";
      }
      [v4 setObject:v15 forKey:v16];

      char v14 = *(unsigned char *)(a1 + 68);
    }
    if ((v14 & 4) != 0)
    {
      v17 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      if (a2) {
        v18 = @"geotagTimestamp";
      }
      else {
        v18 = @"geotag_timestamp";
      }
      [v4 setObject:v17 forKey:v18];
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
  return -[GEORPPhotoWithMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPPhotoWithMetadata)initWithDictionary:(id)a3
{
  return (GEORPPhotoWithMetadata *)-[GEORPPhotoWithMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"data"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
        [a1 setImageData:v7];
      }
      if (a3) {
        objc_super v8 = @"creationDate";
      }
      else {
        objc_super v8 = @"creation_date";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        objc_msgSend(a1, "setCreationDate:");
      }

      if (a3) {
        v10 = @"geotagCoordinate";
      }
      else {
        v10 = @"geotag_coordinate";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v13 = [(GEOLatLng *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOLatLng *)v12 initWithDictionary:v11];
        }
        char v14 = (void *)v13;
        [a1 setGeotagCoordinate:v13];
      }
      if (a3) {
        v15 = @"geotagHorizontalAccuracy";
      }
      else {
        v15 = @"geotag_horizontal_accuracy";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v16 doubleValue];
        objc_msgSend(a1, "setGeotagHorizontalAccuracy:");
      }

      if (a3) {
        v17 = @"geotagTimestamp";
      }
      else {
        v17 = @"geotag_timestamp";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v18 doubleValue];
        objc_msgSend(a1, "setGeotagTimestamp:");
      }
    }
  }

  return a1;
}

- (GEORPPhotoWithMetadata)initWithJSON:(id)a3
{
  return (GEORPPhotoWithMetadata *)-[GEORPPhotoWithMetadata _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1861;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1862;
    }
    GEORPPhotoWithMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLatLng *)self->_geotagCoordinate readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPhotoWithMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPhotoWithMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
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
    [(GEORPPhotoWithMetadata *)self readAll:0];
    if (self->_imageData) {
      PBDataWriterWriteDataField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_geotagCoordinate) {
      PBDataWriterWriteSubmessage();
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteDoubleField();
      char flags = (char)self->_flags;
    }
    if ((flags & 4) != 0) {
      PBDataWriterWriteDoubleField();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPPhotoWithMetadata _readGeotagCoordinate]((uint64_t)self);
  geotagCoordinate = self->_geotagCoordinate;

  return [(GEOLatLng *)geotagCoordinate hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEORPPhotoWithMetadata *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_imageData) {
    objc_msgSend(v6, "setImageData:");
  }
  v4 = v6;
  if (*(unsigned char *)&self->_flags)
  {
    v6[2] = *(id *)&self->_creationDate;
    *((unsigned char *)v6 + 68) |= 1u;
  }
  if (self->_geotagCoordinate)
  {
    objc_msgSend(v6, "setGeotagCoordinate:");
    v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v4[5] = *(id *)&self->_geotagHorizontalAccuracy;
    *((unsigned char *)v4 + 68) |= 2u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    v4[6] = *(id *)&self->_geotagTimestamp;
    *((unsigned char *)v4 + 68) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPPhotoWithMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPPhotoWithMetadata *)self readAll:0];
  uint64_t v9 = [(NSData *)self->_imageData copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 16) = self->_creationDate;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  id v11 = [(GEOLatLng *)self->_geotagCoordinate copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(double *)(v5 + 40) = self->_geotagHorizontalAccuracy;
    *(unsigned char *)(v5 + 68) |= 2u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(double *)(v5 + 48) = self->_geotagTimestamp;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEORPPhotoWithMetadata *)self readAll:1];
  [v4 readAll:1];
  imageData = self->_imageData;
  if ((unint64_t)imageData | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](imageData, "isEqual:")) {
      goto LABEL_21;
    }
  }
  char flags = (char)self->_flags;
  char v7 = *((unsigned char *)v4 + 68);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_creationDate != *((double *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_21;
  }
  geotagCoordinate = self->_geotagCoordinate;
  if ((unint64_t)geotagCoordinate | *((void *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](geotagCoordinate, "isEqual:"))
    {
LABEL_21:
      BOOL v9 = 0;
      goto LABEL_22;
    }
    char flags = (char)self->_flags;
    char v7 = *((unsigned char *)v4 + 68);
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_geotagHorizontalAccuracy != *((double *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v9 = (v7 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_geotagTimestamp != *((double *)v4 + 6)) {
      goto LABEL_21;
    }
    BOOL v9 = 1;
  }
LABEL_22:

  return v9;
}

- (unint64_t)hash
{
  [(GEORPPhotoWithMetadata *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_imageData hash];
  if (*(unsigned char *)&self->_flags)
  {
    double creationDate = self->_creationDate;
    double v6 = -creationDate;
    if (creationDate >= 0.0) {
      double v6 = self->_creationDate;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unint64_t v9 = [(GEOLatLng *)self->_geotagCoordinate hash];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    double geotagHorizontalAccuracy = self->_geotagHorizontalAccuracy;
    double v13 = -geotagHorizontalAccuracy;
    if (geotagHorizontalAccuracy >= 0.0) {
      double v13 = self->_geotagHorizontalAccuracy;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((flags & 4) != 0)
  {
    double geotagTimestamp = self->_geotagTimestamp;
    double v18 = -geotagTimestamp;
    if (geotagTimestamp >= 0.0) {
      double v18 = self->_geotagTimestamp;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  return v4 ^ v3 ^ v9 ^ v11 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  double v8 = a3;
  [v8 readAll:0];
  unint64_t v4 = v8;
  if (v8[3])
  {
    -[GEORPPhotoWithMetadata setImageData:](self, "setImageData:");
    unint64_t v4 = v8;
  }
  if (*((unsigned char *)v4 + 68))
  {
    self->_double creationDate = (double)v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
  geotagCoordinate = self->_geotagCoordinate;
  uint64_t v6 = v4[4];
  if (geotagCoordinate)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOLatLng mergeFrom:](geotagCoordinate, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEORPPhotoWithMetadata setGeotagCoordinate:](self, "setGeotagCoordinate:");
  }
  unint64_t v4 = v8;
LABEL_11:
  char v7 = *((unsigned char *)v4 + 68);
  if ((v7 & 2) != 0)
  {
    self->_double geotagHorizontalAccuracy = (double)v4[5];
    *(unsigned char *)&self->_flags |= 2u;
    char v7 = *((unsigned char *)v4 + 68);
  }
  if ((v7 & 4) != 0)
  {
    self->_double geotagTimestamp = (double)v4[6];
    *(unsigned char *)&self->_flags |= 4u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geotagCoordinate, 0);
  objc_storeStrong((id *)&self->_imageData, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end