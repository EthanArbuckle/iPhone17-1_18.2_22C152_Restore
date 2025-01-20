@interface GEORPFeedbackImageUploadInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasClientImageUuid;
- (BOOL)hasImageId;
- (BOOL)hasImageUploadHttpMethod;
- (BOOL)hasImageUploadUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackImageUploadInfo)init;
- (GEORPFeedbackImageUploadInfo)initWithData:(id)a3;
- (GEORPFeedbackImageUploadInfo)initWithDictionary:(id)a3;
- (GEORPFeedbackImageUploadInfo)initWithJSON:(id)a3;
- (NSString)clientImageUuid;
- (NSString)imageId;
- (NSString)imageUploadHttpMethod;
- (NSString)imageUploadUrl;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readClientImageUuid;
- (void)_readImageId;
- (void)_readImageUploadHttpMethod;
- (void)_readImageUploadUrl;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setClientImageUuid:(id)a3;
- (void)setImageId:(id)a3;
- (void)setImageUploadHttpMethod:(id)a3;
- (void)setImageUploadUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackImageUploadInfo

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3E) == 0))
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPFeedbackImageUploadInfo *)self readAll:0];
    if (self->_imageId) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_clientImageUuid)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_imageUploadUrl)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_imageUploadHttpMethod)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (GEORPFeedbackImageUploadInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackImageUploadInfo;
  v2 = [(GEORPFeedbackImageUploadInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackImageUploadInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackImageUploadInfo;
  v3 = [(GEORPFeedbackImageUploadInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readImageId
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
        GEORPFeedbackImageUploadInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageId_tags_1590);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasImageId
{
  return self->_imageId != 0;
}

- (NSString)imageId
{
  -[GEORPFeedbackImageUploadInfo _readImageId]((uint64_t)self);
  imageId = self->_imageId;

  return imageId;
}

- (void)setImageId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_imageId, a3);
}

- (void)_readClientImageUuid
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
        GEORPFeedbackImageUploadInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientImageUuid_tags_1591);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasClientImageUuid
{
  return self->_clientImageUuid != 0;
}

- (NSString)clientImageUuid
{
  -[GEORPFeedbackImageUploadInfo _readClientImageUuid]((uint64_t)self);
  clientImageUuid = self->_clientImageUuid;

  return clientImageUuid;
}

- (void)setClientImageUuid:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_clientImageUuid, a3);
}

- (void)_readImageUploadUrl
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
        GEORPFeedbackImageUploadInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageUploadUrl_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasImageUploadUrl
{
  return self->_imageUploadUrl != 0;
}

- (NSString)imageUploadUrl
{
  -[GEORPFeedbackImageUploadInfo _readImageUploadUrl]((uint64_t)self);
  imageUploadUrl = self->_imageUploadUrl;

  return imageUploadUrl;
}

- (void)setImageUploadUrl:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_imageUploadUrl, a3);
}

- (void)_readImageUploadHttpMethod
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
        GEORPFeedbackImageUploadInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageUploadHttpMethod_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasImageUploadHttpMethod
{
  return self->_imageUploadHttpMethod != 0;
}

- (NSString)imageUploadHttpMethod
{
  -[GEORPFeedbackImageUploadInfo _readImageUploadHttpMethod]((uint64_t)self);
  if (self->_imageUploadHttpMethod) {
    imageUploadHttpMethod = (__CFString *)self->_imageUploadHttpMethod;
  }
  else {
    imageUploadHttpMethod = @"PUT";
  }

  return (NSString *)imageUploadHttpMethod;
}

- (void)setImageUploadHttpMethod:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_imageUploadHttpMethod, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackImageUploadInfo;
  v4 = [(GEORPFeedbackImageUploadInfo *)&v8 description];
  id v5 = [(GEORPFeedbackImageUploadInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackImageUploadInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 imageId];
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

    objc_super v7 = [a1 clientImageUuid];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"clientImageUuid";
      }
      else {
        objc_super v8 = @"client_image_uuid";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [a1 imageUploadUrl];
    if (v9)
    {
      if (a2) {
        v10 = @"imageUploadUrl";
      }
      else {
        v10 = @"image_upload_url";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = [a1 imageUploadHttpMethod];
    if (v11)
    {
      if (a2) {
        v12 = @"imageUploadHttpMethod";
      }
      else {
        v12 = @"image_upload_http_method";
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
        v20[2] = __58__GEORPFeedbackImageUploadInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEORPFeedbackImageUploadInfo _dictionaryRepresentation:](self, 1);
}

void __58__GEORPFeedbackImageUploadInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackImageUploadInfo)initWithDictionary:(id)a3
{
  return (GEORPFeedbackImageUploadInfo *)-[GEORPFeedbackImageUploadInfo _initWithDictionary:isJSON:](self, a3, 0);
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
        v9 = @"clientImageUuid";
      }
      else {
        v9 = @"client_image_uuid";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setClientImageUuid:v11];
      }
      if (a3) {
        v12 = @"imageUploadUrl";
      }
      else {
        v12 = @"image_upload_url";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setImageUploadUrl:v14];
      }
      if (a3) {
        v15 = @"imageUploadHttpMethod";
      }
      else {
        v15 = @"image_upload_http_method";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = (void *)[v16 copy];
        [a1 setImageUploadHttpMethod:v17];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackImageUploadInfo)initWithJSON:(id)a3
{
  return (GEORPFeedbackImageUploadInfo *)-[GEORPFeedbackImageUploadInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1607;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1608;
    }
    GEORPFeedbackImageUploadInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackImageUploadInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackImageUploadInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPFeedbackImageUploadInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_imageId) {
    objc_msgSend(v5, "setImageId:");
  }
  if (self->_clientImageUuid) {
    objc_msgSend(v5, "setClientImageUuid:");
  }
  v4 = v5;
  if (self->_imageUploadUrl)
  {
    objc_msgSend(v5, "setImageUploadUrl:");
    v4 = v5;
  }
  if (self->_imageUploadHttpMethod)
  {
    objc_msgSend(v5, "setImageUploadHttpMethod:");
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
    [(GEORPFeedbackImageUploadInfo *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_imageId copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    uint64_t v10 = [(NSString *)self->_clientImageUuid copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    uint64_t v12 = [(NSString *)self->_imageUploadUrl copyWithZone:a3];
    v13 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v12;

    uint64_t v14 = [(NSString *)self->_imageUploadHttpMethod copyWithZone:a3];
    v15 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackImageUploadInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackImageUploadInfo *)self readAll:1],
         [v4 readAll:1],
         imageId = self->_imageId,
         !((unint64_t)imageId | v4[4]))
     || -[NSString isEqual:](imageId, "isEqual:"))
    && ((clientImageUuid = self->_clientImageUuid, !((unint64_t)clientImageUuid | v4[3]))
     || -[NSString isEqual:](clientImageUuid, "isEqual:"))
    && ((imageUploadUrl = self->_imageUploadUrl, !((unint64_t)imageUploadUrl | v4[6]))
     || -[NSString isEqual:](imageUploadUrl, "isEqual:")))
  {
    imageUploadHttpMethod = self->_imageUploadHttpMethod;
    if ((unint64_t)imageUploadHttpMethod | v4[5]) {
      char v9 = -[NSString isEqual:](imageUploadHttpMethod, "isEqual:");
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
  [(GEORPFeedbackImageUploadInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_imageId hash];
  NSUInteger v4 = [(NSString *)self->_clientImageUuid hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_imageUploadUrl hash];
  return v4 ^ v5 ^ [(NSString *)self->_imageUploadHttpMethod hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  [v4 readAll:0];
  if (v4[4]) {
    -[GEORPFeedbackImageUploadInfo setImageId:](self, "setImageId:");
  }
  if (v4[3]) {
    -[GEORPFeedbackImageUploadInfo setClientImageUuid:](self, "setClientImageUuid:");
  }
  if (v4[6]) {
    -[GEORPFeedbackImageUploadInfo setImageUploadUrl:](self, "setImageUploadUrl:");
  }
  if (v4[5]) {
    -[GEORPFeedbackImageUploadInfo setImageUploadHttpMethod:](self, "setImageUploadHttpMethod:");
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
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackImageUploadInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1612);
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
    [(GEORPFeedbackImageUploadInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageUploadUrl, 0);
  objc_storeStrong((id *)&self->_imageUploadHttpMethod, 0);
  objc_storeStrong((id *)&self->_imageId, 0);
  objc_storeStrong((id *)&self->_clientImageUuid, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end