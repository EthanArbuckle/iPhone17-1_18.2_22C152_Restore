@interface GEORPPhotoMetadata
+ (BOOL)isValid:(id)a3;
- (BOOL)hasClientImageUuid;
- (BOOL)hasDeviceLensMake;
- (BOOL)hasDeviceLensModel;
- (BOOL)hasGeotag;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasImageDescription;
- (BOOL)hasMediaType;
- (BOOL)hasSize;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocation)geotag;
- (GEORPPhotoMetadata)init;
- (GEORPPhotoMetadata)initWithData:(id)a3;
- (GEORPPhotoMetadata)initWithDictionary:(id)a3;
- (GEORPPhotoMetadata)initWithJSON:(id)a3;
- (NSString)clientImageUuid;
- (NSString)deviceLensMake;
- (NSString)deviceLensModel;
- (NSString)imageDescription;
- (NSString)mediaType;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)sourceAsString:(int)a3;
- (int)StringAsSource:(id)a3;
- (int)source;
- (unint64_t)hash;
- (unint64_t)size;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readClientImageUuid;
- (void)_readDeviceLensMake;
- (void)_readDeviceLensModel;
- (void)_readGeotag;
- (void)_readImageDescription;
- (void)_readMediaType;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setClientImageUuid:(id)a3;
- (void)setDeviceLensMake:(id)a3;
- (void)setDeviceLensModel:(id)a3;
- (void)setGeotag:(id)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setImageDescription:(id)a3;
- (void)setMediaType:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPhotoMetadata

- (GEORPPhotoMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPPhotoMetadata;
  v2 = [(GEORPPhotoMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPhotoMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPPhotoMetadata;
  v3 = [(GEORPPhotoMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readClientImageUuid
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientImageUuid_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasClientImageUuid
{
  return self->_clientImageUuid != 0;
}

- (NSString)clientImageUuid
{
  -[GEORPPhotoMetadata _readClientImageUuid]((uint64_t)self);
  clientImageUuid = self->_clientImageUuid;

  return clientImageUuid;
}

- (void)setClientImageUuid:(id)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  objc_storeStrong((id *)&self->_clientImageUuid, a3);
}

- (void)_readImageDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasImageDescription
{
  return self->_imageDescription != 0;
}

- (NSString)imageDescription
{
  -[GEORPPhotoMetadata _readImageDescription]((uint64_t)self);
  imageDescription = self->_imageDescription;

  return imageDescription;
}

- (void)setImageDescription:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_imageDescription, a3);
}

- (void)_readGeotag
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGeotag_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasGeotag
{
  return self->_geotag != 0;
}

- (GEOLocation)geotag
{
  -[GEORPPhotoMetadata _readGeotag]((uint64_t)self);
  geotag = self->_geotag;

  return geotag;
}

- (void)setGeotag:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_geotag, a3);
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasSize
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readMediaType
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMediaType_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasMediaType
{
  return self->_mediaType != 0;
}

- (NSString)mediaType
{
  -[GEORPPhotoMetadata _readMediaType]((uint64_t)self);
  mediaType = self->_mediaType;

  return mediaType;
}

- (void)setMediaType:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_mediaType, a3);
}

- (int)source
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_source;
  }
  else {
    return 0;
  }
}

- (void)setSource:(int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 258;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasSource
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)sourceAsString:(int)a3
{
  if (a3 >= 3)
  {
    __int16 v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    __int16 v3 = (void *)*((void *)&off_1E53EC6E8 + a3);
  }

  return v3;
}

- (int)StringAsSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PHOTO_METADATA_SOURCE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PHOTO_METADATA_SOURCE_CAMERA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PHOTO_METADATA_SOURCE_PHOTO_LIBRARY"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readDeviceLensMake
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceLensMake_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDeviceLensMake
{
  return self->_deviceLensMake != 0;
}

- (NSString)deviceLensMake
{
  -[GEORPPhotoMetadata _readDeviceLensMake]((uint64_t)self);
  deviceLensMake = self->_deviceLensMake;

  return deviceLensMake;
}

- (void)setDeviceLensMake:(id)a3
{
  *(_WORD *)&self->_flags |= 0x108u;
  objc_storeStrong((id *)&self->_deviceLensMake, a3);
}

- (void)_readDeviceLensModel
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDeviceLensModel_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDeviceLensModel
{
  return self->_deviceLensModel != 0;
}

- (NSString)deviceLensModel
{
  -[GEORPPhotoMetadata _readDeviceLensModel]((uint64_t)self);
  deviceLensModel = self->_deviceLensModel;

  return deviceLensModel;
}

- (void)setDeviceLensModel:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_deviceLensModel, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPhotoMetadata;
  int v4 = [(GEORPPhotoMetadata *)&v8 description];
  v5 = [(GEORPPhotoMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPhotoMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 clientImageUuid];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"clientImageUuid";
      }
      else {
        objc_super v6 = @"client_image_uuid";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [(id)a1 imageDescription];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"imageDescription";
      }
      else {
        objc_super v8 = @"image_description";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [(id)a1 geotag];
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"geotag"];
    }
    if (*(_WORD *)(a1 + 88))
    {
      v12 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
      [v4 setObject:v12 forKey:@"size"];
    }
    v13 = [(id)a1 mediaType];
    if (v13)
    {
      if (a2) {
        v14 = @"mediaType";
      }
      else {
        v14 = @"media_type";
      }
      [v4 setObject:v13 forKey:v14];
    }

    if ((*(_WORD *)(a1 + 88) & 2) != 0)
    {
      uint64_t v15 = *(int *)(a1 + 84);
      if (v15 >= 3)
      {
        v16 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 84));
      }
      else
      {
        v16 = (void *)*((void *)&off_1E53EC6E8 + v15);
      }
      [v4 setObject:v16 forKey:@"source"];
    }
    v17 = [(id)a1 deviceLensMake];
    if (v17)
    {
      if (a2) {
        v18 = @"deviceLensMake";
      }
      else {
        v18 = @"device_lens_make";
      }
      [v4 setObject:v17 forKey:v18];
    }

    v19 = [(id)a1 deviceLensModel];
    if (v19)
    {
      if (a2) {
        v20 = @"deviceLensModel";
      }
      else {
        v20 = @"device_lens_model";
      }
      [v4 setObject:v19 forKey:v20];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPPhotoMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPPhotoMetadata)initWithDictionary:(id)a3
{
  return (GEORPPhotoMetadata *)-[GEORPPhotoMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_48;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_48;
  }
  if (a3) {
    objc_super v6 = @"clientImageUuid";
  }
  else {
    objc_super v6 = @"client_image_uuid";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setClientImageUuid:v8];
  }
  if (a3) {
    v9 = @"imageDescription";
  }
  else {
    v9 = @"image_description";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (void *)[v10 copy];
    [a1 setImageDescription:v11];
  }
  v12 = [v5 objectForKeyedSubscript:@"geotag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [GEOLocation alloc];
    if (a3) {
      uint64_t v14 = [(GEOLocation *)v13 initWithJSON:v12];
    }
    else {
      uint64_t v14 = [(GEOLocation *)v13 initWithDictionary:v12];
    }
    uint64_t v15 = (void *)v14;
    [a1 setGeotag:v14];
  }
  v16 = [v5 objectForKeyedSubscript:@"size"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSize:", objc_msgSend(v16, "unsignedLongLongValue"));
  }

  if (a3) {
    v17 = @"mediaType";
  }
  else {
    v17 = @"media_type";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19 = (void *)[v18 copy];
    [a1 setMediaType:v19];
  }
  v20 = [v5 objectForKeyedSubscript:@"source"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v20;
    if ([v21 isEqualToString:@"PHOTO_METADATA_SOURCE_UNKNOWN"])
    {
      uint64_t v22 = 0;
    }
    else if ([v21 isEqualToString:@"PHOTO_METADATA_SOURCE_CAMERA"])
    {
      uint64_t v22 = 1;
    }
    else if ([v21 isEqualToString:@"PHOTO_METADATA_SOURCE_PHOTO_LIBRARY"])
    {
      uint64_t v22 = 2;
    }
    else
    {
      uint64_t v22 = 0;
    }

    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v22 = [v20 intValue];
LABEL_36:
    [a1 setSource:v22];
  }

  if (a3) {
    v23 = @"deviceLensMake";
  }
  else {
    v23 = @"device_lens_make";
  }
  v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = (void *)[v24 copy];
    [a1 setDeviceLensMake:v25];
  }
  if (a3) {
    v26 = @"deviceLensModel";
  }
  else {
    v26 = @"device_lens_model";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v28 = (void *)[v27 copy];
    [a1 setDeviceLensModel:v28];
  }
LABEL_48:

  return a1;
}

- (GEORPPhotoMetadata)initWithJSON:(id)a3
{
  return (GEORPPhotoMetadata *)-[GEORPPhotoMetadata _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_311_1;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_312_1;
    }
    GEORPPhotoMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLocation *)self->_geotag readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPhotoMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPhotoMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPPhotoMetadataIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPPhotoMetadata *)self readAll:0];
    if (self->_clientImageUuid) {
      PBDataWriterWriteStringField();
    }
    if (self->_imageDescription) {
      PBDataWriterWriteStringField();
    }
    if (self->_geotag) {
      PBDataWriterWriteSubmessage();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_mediaType) {
      PBDataWriterWriteStringField();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_deviceLensMake) {
      PBDataWriterWriteStringField();
    }
    if (self->_deviceLensModel) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPPhotoMetadata _readGeotag]((uint64_t)self);
  geotag = self->_geotag;

  return [(GEOLocation *)geotag hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPPhotoMetadata *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 18) = self->_readerMarkPos;
  *((_DWORD *)v5 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_clientImageUuid) {
    objc_msgSend(v5, "setClientImageUuid:");
  }
  if (self->_imageDescription) {
    objc_msgSend(v5, "setImageDescription:");
  }
  int v4 = v5;
  if (self->_geotag)
  {
    objc_msgSend(v5, "setGeotag:");
    int v4 = v5;
  }
  if (*(_WORD *)&self->_flags)
  {
    v4[8] = self->_size;
    *((_WORD *)v4 + 44) |= 1u;
  }
  if (self->_mediaType)
  {
    objc_msgSend(v5, "setMediaType:");
    int v4 = v5;
  }
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_source;
    *((_WORD *)v4 + 44) |= 2u;
  }
  if (self->_deviceLensMake)
  {
    objc_msgSend(v5, "setDeviceLensMake:");
    int v4 = v5;
  }
  if (self->_deviceLensModel)
  {
    objc_msgSend(v5, "setDeviceLensModel:");
    int v4 = v5;
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
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPPhotoMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPPhotoMetadata *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_clientImageUuid copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  uint64_t v11 = [(NSString *)self->_imageDescription copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  id v13 = [(GEOLocation *)self->_geotag copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  if (*(_WORD *)&self->_flags)
  {
    *(void *)(v5 + 64) = self->_size;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  uint64_t v15 = [(NSString *)self->_mediaType copyWithZone:a3];
  v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_source;
    *(_WORD *)(v5 + 88) |= 2u;
  }
  uint64_t v17 = [(NSString *)self->_deviceLensMake copyWithZone:a3];
  v18 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v17;

  uint64_t v19 = [(NSString *)self->_deviceLensModel copyWithZone:a3];
  id v8 = *(id *)(v5 + 32);
  *(void *)(v5 + 32) = v19;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  [(GEORPPhotoMetadata *)self readAll:1];
  [v4 readAll:1];
  clientImageUuid = self->_clientImageUuid;
  if ((unint64_t)clientImageUuid | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientImageUuid, "isEqual:")) {
      goto LABEL_25;
    }
  }
  imageDescription = self->_imageDescription;
  if ((unint64_t)imageDescription | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](imageDescription, "isEqual:")) {
      goto LABEL_25;
    }
  }
  geotag = self->_geotag;
  if ((unint64_t)geotag | *((void *)v4 + 5))
  {
    if (!-[GEOLocation isEqual:](geotag, "isEqual:")) {
      goto LABEL_25;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 44);
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_size != *((void *)v4 + 8)) {
      goto LABEL_25;
    }
  }
  else if (v9)
  {
    goto LABEL_25;
  }
  mediaType = self->_mediaType;
  if ((unint64_t)mediaType | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](mediaType, "isEqual:"))
    {
LABEL_25:
      char v13 = 0;
      goto LABEL_26;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v9 = *((_WORD *)v4 + 44);
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_source != *((_DWORD *)v4 + 21)) {
      goto LABEL_25;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_25;
  }
  deviceLensMake = self->_deviceLensMake;
  if ((unint64_t)deviceLensMake | *((void *)v4 + 3)
    && !-[NSString isEqual:](deviceLensMake, "isEqual:"))
  {
    goto LABEL_25;
  }
  deviceLensModel = self->_deviceLensModel;
  if ((unint64_t)deviceLensModel | *((void *)v4 + 4)) {
    char v13 = -[NSString isEqual:](deviceLensModel, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_26:

  return v13;
}

- (unint64_t)hash
{
  [(GEORPPhotoMetadata *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_clientImageUuid hash];
  NSUInteger v4 = [(NSString *)self->_imageDescription hash];
  unint64_t v5 = [(GEOLocation *)self->_geotag hash];
  if (*(_WORD *)&self->_flags) {
    unint64_t v6 = 2654435761u * self->_size;
  }
  else {
    unint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_mediaType hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_source;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7;
  NSUInteger v10 = v8 ^ [(NSString *)self->_deviceLensMake hash];
  return v9 ^ v10 ^ [(NSString *)self->_deviceLensModel hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v7 = a3;
  [v7 readAll:0];
  NSUInteger v4 = v7;
  if (v7[2])
  {
    -[GEORPPhotoMetadata setClientImageUuid:](self, "setClientImageUuid:");
    NSUInteger v4 = v7;
  }
  if (v4[6])
  {
    -[GEORPPhotoMetadata setImageDescription:](self, "setImageDescription:");
    NSUInteger v4 = v7;
  }
  geotag = self->_geotag;
  uint64_t v6 = v4[5];
  if (geotag)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOLocation mergeFrom:](geotag, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEORPPhotoMetadata setGeotag:](self, "setGeotag:");
  }
  NSUInteger v4 = v7;
LABEL_11:
  if (v4[11])
  {
    self->_size = v4[8];
    *(_WORD *)&self->_flags |= 1u;
  }
  if (v4[7])
  {
    -[GEORPPhotoMetadata setMediaType:](self, "setMediaType:");
    NSUInteger v4 = v7;
  }
  if ((v4[11] & 2) != 0)
  {
    self->_source = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 2u;
  }
  if (v4[3])
  {
    -[GEORPPhotoMetadata setDeviceLensMake:](self, "setDeviceLensMake:");
    NSUInteger v4 = v7;
  }
  if (v4[4])
  {
    -[GEORPPhotoMetadata setDeviceLensModel:](self, "setDeviceLensModel:");
    NSUInteger v4 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_imageDescription, 0);
  objc_storeStrong((id *)&self->_geotag, 0);
  objc_storeStrong((id *)&self->_deviceLensModel, 0);
  objc_storeStrong((id *)&self->_deviceLensMake, 0);
  objc_storeStrong((id *)&self->_clientImageUuid, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end