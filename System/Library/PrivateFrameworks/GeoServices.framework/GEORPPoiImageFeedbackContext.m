@interface GEORPPoiImageFeedbackContext
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasImageInfo;
- (BOOL)hasImageUrl;
- (BOOL)hasPlace;
- (BOOL)hasProviderImageId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlace)place;
- (GEORPFeedbackClientImageInfo)imageInfo;
- (GEORPPoiImageFeedbackContext)init;
- (GEORPPoiImageFeedbackContext)initWithData:(id)a3;
- (GEORPPoiImageFeedbackContext)initWithDictionary:(id)a3;
- (GEORPPoiImageFeedbackContext)initWithJSON:(id)a3;
- (NSString)imageUrl;
- (NSString)providerImageId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readImageInfo;
- (void)_readImageUrl;
- (void)_readPlace;
- (void)_readProviderImageId;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setImageInfo:(id)a3;
- (void)setImageUrl:(id)a3;
- (void)setPlace:(id)a3;
- (void)setProviderImageId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPoiImageFeedbackContext

- (GEORPPoiImageFeedbackContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPPoiImageFeedbackContext;
  v2 = [(GEORPPoiImageFeedbackContext *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPoiImageFeedbackContext)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPPoiImageFeedbackContext;
  v3 = [(GEORPPoiImageFeedbackContext *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPlace
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
        GEORPPoiImageFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlace_tags_3242);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlace
{
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPPoiImageFeedbackContext _readPlace]((uint64_t)self);
  place = self->_place;

  return place;
}

- (void)setPlace:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)_readProviderImageId
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
        GEORPPoiImageFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProviderImageId_tags_3243);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasProviderImageId
{
  return self->_providerImageId != 0;
}

- (NSString)providerImageId
{
  -[GEORPPoiImageFeedbackContext _readProviderImageId]((uint64_t)self);
  providerImageId = self->_providerImageId;

  return providerImageId;
}

- (void)setProviderImageId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_providerImageId, a3);
}

- (void)_readImageUrl
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
        GEORPPoiImageFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageUrl_tags_3244);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasImageUrl
{
  return self->_imageUrl != 0;
}

- (NSString)imageUrl
{
  -[GEORPPoiImageFeedbackContext _readImageUrl]((uint64_t)self);
  imageUrl = self->_imageUrl;

  return imageUrl;
}

- (void)setImageUrl:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_imageUrl, a3);
}

- (void)_readImageInfo
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
        GEORPPoiImageFeedbackContextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasImageInfo
{
  return self->_imageInfo != 0;
}

- (GEORPFeedbackClientImageInfo)imageInfo
{
  -[GEORPPoiImageFeedbackContext _readImageInfo]((uint64_t)self);
  imageInfo = self->_imageInfo;

  return imageInfo;
}

- (void)setImageInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_imageInfo, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPoiImageFeedbackContext;
  v4 = [(GEORPPoiImageFeedbackContext *)&v8 description];
  v5 = [(GEORPPoiImageFeedbackContext *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiImageFeedbackContext _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 place];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"place"];
    }
    objc_super v8 = [a1 providerImageId];
    if (v8)
    {
      if (a2) {
        v9 = @"providerImageId";
      }
      else {
        v9 = @"provider_image_id";
      }
      [v4 setObject:v8 forKey:v9];
    }

    v10 = [a1 imageUrl];
    if (v10)
    {
      if (a2) {
        v11 = @"imageUrl";
      }
      else {
        v11 = @"image_url";
      }
      [v4 setObject:v10 forKey:v11];
    }

    v12 = [a1 imageInfo];
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"imageInfo";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"image_info";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = (void *)a1[2];
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __58__GEORPPoiImageFeedbackContext__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
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
  return -[GEORPPoiImageFeedbackContext _dictionaryRepresentation:](self, 1);
}

void __58__GEORPPoiImageFeedbackContext__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPPoiImageFeedbackContext)initWithDictionary:(id)a3
{
  return (GEORPPoiImageFeedbackContext *)-[GEORPPoiImageFeedbackContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"place"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOPDPlace alloc];
        if (a3) {
          uint64_t v8 = [(GEOPDPlace *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOPDPlace *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setPlace:v8];
      }
      if (a3) {
        id v10 = @"providerImageId";
      }
      else {
        id v10 = @"provider_image_id";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[v11 copy];
        [a1 setProviderImageId:v12];
      }
      if (a3) {
        v13 = @"imageUrl";
      }
      else {
        v13 = @"image_url";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = (void *)[v14 copy];
        [a1 setImageUrl:v15];
      }
      if (a3) {
        v16 = @"imageInfo";
      }
      else {
        v16 = @"image_info";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEORPFeedbackClientImageInfo alloc];
        if (a3) {
          uint64_t v19 = [(GEORPFeedbackClientImageInfo *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEORPFeedbackClientImageInfo *)v18 initWithDictionary:v17];
        }
        id v20 = (void *)v19;
        [a1 setImageInfo:v19];
      }
    }
  }

  return a1;
}

- (GEORPPoiImageFeedbackContext)initWithJSON:(id)a3
{
  return (GEORPPoiImageFeedbackContext *)-[GEORPPoiImageFeedbackContext _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_3245;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_3246;
    }
    GEORPPoiImageFeedbackContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPDPlace *)self->_place readAll:1];
    [(GEORPFeedbackClientImageInfo *)self->_imageInfo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiImageFeedbackContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiImageFeedbackContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPPoiImageFeedbackContextIsDirty((uint64_t)self))
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
    [(GEORPPoiImageFeedbackContext *)self readAll:0];
    if (self->_place) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_providerImageId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_imageUrl)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_imageInfo)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPPoiImageFeedbackContext _readPlace]((uint64_t)self);
  place = self->_place;

  return [(GEOPDPlace *)place hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPPoiImageFeedbackContext *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_place) {
    objc_msgSend(v5, "setPlace:");
  }
  if (self->_providerImageId) {
    objc_msgSend(v5, "setProviderImageId:");
  }
  v4 = v5;
  if (self->_imageUrl)
  {
    objc_msgSend(v5, "setImageUrl:");
    v4 = v5;
  }
  if (self->_imageInfo)
  {
    objc_msgSend(v5, "setImageInfo:");
    v4 = v5;
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
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPPoiImageFeedbackContext *)self readAll:0];
    id v8 = [(GEOPDPlace *)self->_place copyWithZone:a3];
    v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    uint64_t v10 = [(NSString *)self->_providerImageId copyWithZone:a3];
    v11 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v10;

    uint64_t v12 = [(NSString *)self->_imageUrl copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    id v14 = [(GEORPFeedbackClientImageInfo *)self->_imageInfo copyWithZone:a3];
    v15 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPPoiImageFeedbackContextReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPPoiImageFeedbackContext *)self readAll:1],
         [v4 readAll:1],
         place = self->_place,
         !((unint64_t)place | v4[5]))
     || -[GEOPDPlace isEqual:](place, "isEqual:"))
    && ((providerImageId = self->_providerImageId, !((unint64_t)providerImageId | v4[6]))
     || -[NSString isEqual:](providerImageId, "isEqual:"))
    && ((imageUrl = self->_imageUrl, !((unint64_t)imageUrl | v4[4]))
     || -[NSString isEqual:](imageUrl, "isEqual:")))
  {
    imageInfo = self->_imageInfo;
    if ((unint64_t)imageInfo | v4[3]) {
      char v9 = -[GEORPFeedbackClientImageInfo isEqual:](imageInfo, "isEqual:");
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
  [(GEORPPoiImageFeedbackContext *)self readAll:1];
  unint64_t v3 = [(GEOPDPlace *)self->_place hash];
  NSUInteger v4 = [(NSString *)self->_providerImageId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_imageUrl hash];
  return v4 ^ v5 ^ [(GEORPFeedbackClientImageInfo *)self->_imageInfo hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  place = self->_place;
  uint64_t v5 = v8[5];
  if (place)
  {
    if (v5) {
      -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPPoiImageFeedbackContext setPlace:](self, "setPlace:");
  }
  if (v8[6]) {
    -[GEORPPoiImageFeedbackContext setProviderImageId:](self, "setProviderImageId:");
  }
  if (v8[4]) {
    -[GEORPPoiImageFeedbackContext setImageUrl:](self, "setImageUrl:");
  }
  imageInfo = self->_imageInfo;
  uint64_t v7 = v8[3];
  if (imageInfo)
  {
    if (v7) {
      -[GEORPFeedbackClientImageInfo mergeFrom:](imageInfo, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPPoiImageFeedbackContext setImageInfo:](self, "setImageInfo:");
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
      GEORPPoiImageFeedbackContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3250);
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
  *(unsigned char *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPPoiImageFeedbackContext *)self readAll:0];
    [(GEOPDPlace *)self->_place clearUnknownFields:1];
    imageInfo = self->_imageInfo;
    [(GEORPFeedbackClientImageInfo *)imageInfo clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerImageId, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_imageUrl, 0);
  objc_storeStrong((id *)&self->_imageInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end