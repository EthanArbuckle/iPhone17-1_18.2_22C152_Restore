@interface GEORPImageUpdate
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAction;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasImageId;
- (BOOL)hasPhotoMetadata;
- (BOOL)hasUploadResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPImageUpdate)init;
- (GEORPImageUpdate)initWithData:(id)a3;
- (GEORPImageUpdate)initWithDictionary:(id)a3;
- (GEORPImageUpdate)initWithJSON:(id)a3;
- (GEORPPhotoMetadata)photoMetadata;
- (NSData)uploadResponse;
- (NSString)imageId;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)actionAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsAction:(id)a3;
- (int)action;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readImageId;
- (void)_readPhotoMetadata;
- (void)_readUploadResponse;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAction:(int)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setImageId:(id)a3;
- (void)setPhotoMetadata:(id)a3;
- (void)setUploadResponse:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPImageUpdate

- (GEORPImageUpdate)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPImageUpdate;
  v2 = [(GEORPImageUpdate *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPImageUpdate)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPImageUpdate;
  v3 = [(GEORPImageUpdate *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readImageId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPImageUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageId_tags_101);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasImageId
{
  return self->_imageId != 0;
}

- (NSString)imageId
{
  -[GEORPImageUpdate _readImageId]((uint64_t)self);
  imageId = self->_imageId;

  return imageId;
}

- (void)setImageId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_imageId, a3);
}

- (void)_readUploadResponse
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPImageUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUploadResponse_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasUploadResponse
{
  return self->_uploadResponse != 0;
}

- (NSData)uploadResponse
{
  -[GEORPImageUpdate _readUploadResponse]((uint64_t)self);
  uploadResponse = self->_uploadResponse;

  return uploadResponse;
}

- (void)setUploadResponse:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_uploadResponse, a3);
}

- (int)action
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasAction
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)actionAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53DF1B8[a3];
  }

  return v3;
}

- (int)StringAsAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_ADD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_REMOVE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_UNMODIFIED"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readPhotoMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPImageUpdateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPhotoMetadata
{
  return self->_photoMetadata != 0;
}

- (GEORPPhotoMetadata)photoMetadata
{
  -[GEORPImageUpdate _readPhotoMetadata]((uint64_t)self);
  photoMetadata = self->_photoMetadata;

  return photoMetadata;
}

- (void)setPhotoMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_photoMetadata, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPImageUpdate;
  int v4 = [(GEORPImageUpdate *)&v8 description];
  v5 = [(GEORPImageUpdate *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPImageUpdate _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 imageId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"imageId";
      }
      else {
        objc_super v6 = @"image_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [(id)a1 uploadResponse];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 base64EncodedStringWithOptions:0];
        [v4 setObject:v9 forKey:@"uploadResponse"];
      }
      else
      {
        [v4 setObject:v7 forKey:@"upload_response"];
      }
    }

    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v10 = *(int *)(a1 + 52);
      if (v10 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E53DF1B8[v10];
      }
      [v4 setObject:v11 forKey:@"action"];
    }
    v12 = [(id)a1 photoMetadata];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"photoMetadata";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"photo_metadata";
      }
      [v4 setObject:v14 forKey:v15];
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
  return -[GEORPImageUpdate _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPImageUpdate)initWithDictionary:(id)a3
{
  return (GEORPImageUpdate *)-[GEORPImageUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_36;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_36;
  }
  if (a3) {
    objc_super v6 = @"imageId";
  }
  else {
    objc_super v6 = @"image_id";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setImageId:v8];
  }
  if (a3) {
    v9 = @"uploadResponse";
  }
  else {
    v9 = @"upload_response";
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v10 options:0];
    [a1 setUploadResponse:v11];
  }
  v12 = [v5 objectForKeyedSubscript:@"action"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;
    if ([v13 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_UNKNOWN"])
    {
      uint64_t v14 = 0;
    }
    else if ([v13 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_ADD"])
    {
      uint64_t v14 = 1;
    }
    else if ([v13 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_REMOVE"])
    {
      uint64_t v14 = 2;
    }
    else if ([v13 isEqualToString:@"POI_ENRICHMENT_UPDATE_ACTION_UNMODIFIED"])
    {
      uint64_t v14 = 3;
    }
    else
    {
      uint64_t v14 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v12 intValue];
LABEL_26:
    [a1 setAction:v14];
  }

  if (a3) {
    v15 = @"photoMetadata";
  }
  else {
    v15 = @"photo_metadata";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [GEORPPhotoMetadata alloc];
    if (a3) {
      uint64_t v18 = [(GEORPPhotoMetadata *)v17 initWithJSON:v16];
    }
    else {
      uint64_t v18 = [(GEORPPhotoMetadata *)v17 initWithDictionary:v16];
    }
    v19 = (void *)v18;
    [a1 setPhotoMetadata:v18];
  }
LABEL_36:

  return a1;
}

- (GEORPImageUpdate)initWithJSON:(id)a3
{
  return (GEORPImageUpdate *)-[GEORPImageUpdate _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_120;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_121;
    }
    GEORPImageUpdateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEORPPhotoMetadata *)self->_photoMetadata readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPImageUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPImageUpdateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPImageUpdateIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPImageUpdate *)self readAll:0];
    if (self->_imageId) {
      PBDataWriterWriteStringField();
    }
    if (self->_uploadResponse) {
      PBDataWriterWriteDataField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_photoMetadata) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPImageUpdate _readPhotoMetadata]((uint64_t)self);
  photoMetadata = self->_photoMetadata;

  return [(GEORPPhotoMetadata *)photoMetadata hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPImageUpdate *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_imageId) {
    objc_msgSend(v5, "setImageId:");
  }
  if (self->_uploadResponse) {
    objc_msgSend(v5, "setUploadResponse:");
  }
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 13) = self->_action;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  if (self->_photoMetadata)
  {
    objc_msgSend(v5, "setPhotoMetadata:");
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
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPImageUpdateReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPImageUpdate *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_imageId copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  uint64_t v11 = [(NSData *)self->_uploadResponse copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_action;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v13 = [(GEORPPhotoMetadata *)self->_photoMetadata copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  [(GEORPImageUpdate *)self readAll:1];
  [v4 readAll:1];
  imageId = self->_imageId;
  if ((unint64_t)imageId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](imageId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  uploadResponse = self->_uploadResponse;
  if ((unint64_t)uploadResponse | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](uploadResponse, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_action != *((_DWORD *)v4 + 13)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  photoMetadata = self->_photoMetadata;
  if ((unint64_t)photoMetadata | *((void *)v4 + 3)) {
    char v8 = -[GEORPPhotoMetadata isEqual:](photoMetadata, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  [(GEORPImageUpdate *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_imageId hash];
  uint64_t v4 = [(NSData *)self->_uploadResponse hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_action;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(GEORPPhotoMetadata *)self->_photoMetadata hash];
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  [v7 readAll:0];
  uint64_t v4 = v7;
  if (v7[2])
  {
    -[GEORPImageUpdate setImageId:](self, "setImageId:");
    uint64_t v4 = v7;
  }
  if (v4[4])
  {
    -[GEORPImageUpdate setUploadResponse:](self, "setUploadResponse:");
    uint64_t v4 = v7;
  }
  if (v4[7])
  {
    self->_action = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
  }
  photoMetadata = self->_photoMetadata;
  uint64_t v6 = v4[3];
  if (photoMetadata)
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[GEORPPhotoMetadata mergeFrom:](photoMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[GEORPImageUpdate setPhotoMetadata:](self, "setPhotoMetadata:");
  }
  uint64_t v4 = v7;
LABEL_13:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadResponse, 0);
  objc_storeStrong((id *)&self->_photoMetadata, 0);
  objc_storeStrong((id *)&self->_imageId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end