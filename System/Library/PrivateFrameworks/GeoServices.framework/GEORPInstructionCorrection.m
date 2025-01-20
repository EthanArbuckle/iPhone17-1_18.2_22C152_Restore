@interface GEORPInstructionCorrection
+ (BOOL)isValid:(id)a3;
- (BOOL)hasComments;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPhoto;
- (BOOL)hasPhotoId;
- (BOOL)hasRouteStepIndex;
- (BOOL)hasRouteStepScreenshotImageData;
- (BOOL)hasRouteStepScreenshotImageId;
- (BOOL)hasRouteStepSubstepIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPInstructionCorrection)init;
- (GEORPInstructionCorrection)initWithData:(id)a3;
- (GEORPInstructionCorrection)initWithDictionary:(id)a3;
- (GEORPInstructionCorrection)initWithJSON:(id)a3;
- (GEORPPhotoWithMetadata)photo;
- (NSData)routeStepScreenshotImageData;
- (NSString)comments;
- (NSString)photoId;
- (NSString)routeStepScreenshotImageId;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)routeStepIndex;
- (unsigned)routeStepSubstepIndex;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readComments;
- (void)_readPhoto;
- (void)_readPhotoId;
- (void)_readRouteStepScreenshotImageData;
- (void)_readRouteStepScreenshotImageId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setComments:(id)a3;
- (void)setHasRouteStepIndex:(BOOL)a3;
- (void)setHasRouteStepSubstepIndex:(BOOL)a3;
- (void)setPhoto:(id)a3;
- (void)setPhotoId:(id)a3;
- (void)setRouteStepIndex:(unsigned int)a3;
- (void)setRouteStepScreenshotImageData:(id)a3;
- (void)setRouteStepScreenshotImageId:(id)a3;
- (void)setRouteStepSubstepIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPInstructionCorrection

- (GEORPInstructionCorrection)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPInstructionCorrection;
  v2 = [(GEORPInstructionCorrection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPInstructionCorrection)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPInstructionCorrection;
  v3 = [(GEORPInstructionCorrection *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)routeStepIndex
{
  return self->_routeStepIndex;
}

- (void)setRouteStepIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_routeStepIndex = a3;
}

- (void)setHasRouteStepIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasRouteStepIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readComments
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPInstructionCorrectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readComments_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasComments
{
  return self->_comments != 0;
}

- (NSString)comments
{
  -[GEORPInstructionCorrection _readComments]((uint64_t)self);
  comments = self->_comments;

  return comments;
}

- (void)setComments:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_comments, a3);
}

- (void)_readPhoto
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPInstructionCorrectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoto_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPhoto
{
  return self->_photo != 0;
}

- (GEORPPhotoWithMetadata)photo
{
  -[GEORPInstructionCorrection _readPhoto]((uint64_t)self);
  photo = self->_photo;

  return photo;
}

- (void)setPhoto:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_photo, a3);
}

- (unsigned)routeStepSubstepIndex
{
  return self->_routeStepSubstepIndex;
}

- (void)setRouteStepSubstepIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_routeStepSubstepIndex = a3;
}

- (void)setHasRouteStepSubstepIndex:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasRouteStepSubstepIndex
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readRouteStepScreenshotImageData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPInstructionCorrectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteStepScreenshotImageData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRouteStepScreenshotImageData
{
  return self->_routeStepScreenshotImageData != 0;
}

- (NSData)routeStepScreenshotImageData
{
  -[GEORPInstructionCorrection _readRouteStepScreenshotImageData]((uint64_t)self);
  routeStepScreenshotImageData = self->_routeStepScreenshotImageData;

  return routeStepScreenshotImageData;
}

- (void)setRouteStepScreenshotImageData:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_routeStepScreenshotImageData, a3);
}

- (void)_readPhotoId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPInstructionCorrectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoId_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPhotoId
{
  return self->_photoId != 0;
}

- (NSString)photoId
{
  -[GEORPInstructionCorrection _readPhotoId]((uint64_t)self);
  photoId = self->_photoId;

  return photoId;
}

- (void)setPhotoId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_photoId, a3);
}

- (void)_readRouteStepScreenshotImageId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPInstructionCorrectionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteStepScreenshotImageId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRouteStepScreenshotImageId
{
  return self->_routeStepScreenshotImageId != 0;
}

- (NSString)routeStepScreenshotImageId
{
  -[GEORPInstructionCorrection _readRouteStepScreenshotImageId]((uint64_t)self);
  routeStepScreenshotImageId = self->_routeStepScreenshotImageId;

  return routeStepScreenshotImageId;
}

- (void)setRouteStepScreenshotImageId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_routeStepScreenshotImageId, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPInstructionCorrection;
  v4 = [(GEORPInstructionCorrection *)&v8 description];
  v5 = [(GEORPInstructionCorrection *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPInstructionCorrection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 76))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
      if (a2) {
        objc_super v6 = @"routeStepIndex";
      }
      else {
        objc_super v6 = @"route_step_index";
      }
      [v4 setObject:v5 forKey:v6];
    }
    objc_super v7 = [(id)a1 comments];
    if (v7) {
      [v4 setObject:v7 forKey:@"comments"];
    }

    objc_super v8 = [(id)a1 photo];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"photo"];
    }
    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
      if (a2) {
        v12 = @"routeStepSubstepIndex";
      }
      else {
        v12 = @"route_step_substep_index";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 routeStepScreenshotImageData];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 base64EncodedStringWithOptions:0];
        [v4 setObject:v15 forKey:@"routeStepScreenshotImageData"];
      }
      else
      {
        [v4 setObject:v13 forKey:@"route_step_screenshot_image_data"];
      }
    }

    v16 = [(id)a1 photoId];
    if (v16)
    {
      if (a2) {
        v17 = @"photoId";
      }
      else {
        v17 = @"photo_id";
      }
      [v4 setObject:v16 forKey:v17];
    }

    v18 = [(id)a1 routeStepScreenshotImageId];
    if (v18)
    {
      if (a2) {
        v19 = @"routeStepScreenshotImageId";
      }
      else {
        v19 = @"route_step_screenshot_image_id";
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
  return -[GEORPInstructionCorrection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPInstructionCorrection)initWithDictionary:(id)a3
{
  return (GEORPInstructionCorrection *)-[GEORPInstructionCorrection _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"routeStepIndex";
      }
      else {
        objc_super v6 = @"route_step_index";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRouteStepIndex:", objc_msgSend(v7, "unsignedIntValue"));
      }

      objc_super v8 = [v5 objectForKeyedSubscript:@"comments"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (void *)[v8 copy];
        [a1 setComments:v9];
      }
      v10 = [v5 objectForKeyedSubscript:@"photo"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEORPPhotoWithMetadata alloc];
        if (a3) {
          uint64_t v12 = [(GEORPPhotoWithMetadata *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEORPPhotoWithMetadata *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setPhoto:v12];
      }
      if (a3) {
        v14 = @"routeStepSubstepIndex";
      }
      else {
        v14 = @"route_step_substep_index";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRouteStepSubstepIndex:", objc_msgSend(v15, "unsignedIntValue"));
      }

      if (a3) {
        v16 = @"routeStepScreenshotImageData";
      }
      else {
        v16 = @"route_step_screenshot_image_data";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v17 options:0];
        [a1 setRouteStepScreenshotImageData:v18];
      }
      if (a3) {
        v19 = @"photoId";
      }
      else {
        v19 = @"photo_id";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = (void *)[v20 copy];
        [a1 setPhotoId:v21];
      }
      if (a3) {
        v22 = @"routeStepScreenshotImageId";
      }
      else {
        v22 = @"route_step_screenshot_image_id";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = (void *)[v23 copy];
        [a1 setRouteStepScreenshotImageId:v24];
      }
    }
  }

  return a1;
}

- (GEORPInstructionCorrection)initWithJSON:(id)a3
{
  return (GEORPInstructionCorrection *)-[GEORPInstructionCorrection _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1219_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1220_0;
    }
    GEORPInstructionCorrectionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEORPPhotoWithMetadata *)self->_photo readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPInstructionCorrectionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPInstructionCorrectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPInstructionCorrectionIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPInstructionCorrection *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_comments) {
      PBDataWriterWriteStringField();
    }
    if (self->_photo) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_routeStepScreenshotImageData) {
      PBDataWriterWriteDataField();
    }
    if (self->_photoId) {
      PBDataWriterWriteStringField();
    }
    if (self->_routeStepScreenshotImageId) {
      PBDataWriterWriteStringField();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPInstructionCorrection _readPhoto]((uint64_t)self);
  photo = self->_photo;

  return [(GEORPPhotoWithMetadata *)photo hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPInstructionCorrection *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 17) = self->_routeStepIndex;
    *((unsigned char *)v5 + 76) |= 1u;
  }
  if (self->_comments)
  {
    objc_msgSend(v5, "setComments:");
    v4 = v5;
  }
  if (self->_photo)
  {
    objc_msgSend(v5, "setPhoto:");
    v4 = v5;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_routeStepSubstepIndex;
    *((unsigned char *)v4 + 76) |= 2u;
  }
  if (self->_routeStepScreenshotImageData)
  {
    objc_msgSend(v5, "setRouteStepScreenshotImageData:");
    v4 = v5;
  }
  if (self->_photoId)
  {
    objc_msgSend(v5, "setPhotoId:");
    v4 = v5;
  }
  if (self->_routeStepScreenshotImageId)
  {
    objc_msgSend(v5, "setRouteStepScreenshotImageId:");
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
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPInstructionCorrectionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPInstructionCorrection *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_routeStepIndex;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_comments copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  id v11 = [(GEORPPhotoWithMetadata *)self->_photo copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_routeStepSubstepIndex;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  uint64_t v13 = [(NSData *)self->_routeStepScreenshotImageData copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  uint64_t v15 = [(NSString *)self->_photoId copyWithZone:a3];
  v16 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v15;

  uint64_t v17 = [(NSString *)self->_routeStepScreenshotImageId copyWithZone:a3];
  id v8 = *(id *)(v5 + 48);
  *(void *)(v5 + 48) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  [(GEORPInstructionCorrection *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_routeStepIndex != *((_DWORD *)v4 + 17)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
LABEL_22:
    char v10 = 0;
    goto LABEL_23;
  }
  comments = self->_comments;
  if ((unint64_t)comments | *((void *)v4 + 2) && !-[NSString isEqual:](comments, "isEqual:")) {
    goto LABEL_22;
  }
  photo = self->_photo;
  if ((unint64_t)photo | *((void *)v4 + 4))
  {
    if (!-[GEORPPhotoWithMetadata isEqual:](photo, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_routeStepSubstepIndex != *((_DWORD *)v4 + 18)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_22;
  }
  routeStepScreenshotImageData = self->_routeStepScreenshotImageData;
  if ((unint64_t)routeStepScreenshotImageData | *((void *)v4 + 5)
    && !-[NSData isEqual:](routeStepScreenshotImageData, "isEqual:"))
  {
    goto LABEL_22;
  }
  photoId = self->_photoId;
  if ((unint64_t)photoId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](photoId, "isEqual:")) {
      goto LABEL_22;
    }
  }
  routeStepScreenshotImageId = self->_routeStepScreenshotImageId;
  if ((unint64_t)routeStepScreenshotImageId | *((void *)v4 + 6)) {
    char v10 = -[NSString isEqual:](routeStepScreenshotImageId, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  [(GEORPInstructionCorrection *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_routeStepIndex;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_comments hash];
  unint64_t v5 = [(GEORPPhotoWithMetadata *)self->_photo hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_routeStepSubstepIndex;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v8 = [(NSData *)self->_routeStepScreenshotImageData hash];
  NSUInteger v9 = v7 ^ v8 ^ [(NSString *)self->_photoId hash];
  return v9 ^ [(NSString *)self->_routeStepScreenshotImageId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v7 = (unsigned int *)a3;
  [v7 readAll:0];
  NSUInteger v4 = v7;
  if (v7[19])
  {
    self->_routeStepIndex = v7[17];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v7 + 2))
  {
    -[GEORPInstructionCorrection setComments:](self, "setComments:");
    NSUInteger v4 = v7;
  }
  photo = self->_photo;
  uint64_t v6 = *((void *)v4 + 4);
  if (photo)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEORPPhotoWithMetadata mergeFrom:](photo, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEORPInstructionCorrection setPhoto:](self, "setPhoto:");
  }
  NSUInteger v4 = v7;
LABEL_11:
  if ((v4[19] & 2) != 0)
  {
    self->_routeStepSubstepIndex = v4[18];
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v4 + 5))
  {
    [(GEORPInstructionCorrection *)self setRouteStepScreenshotImageData:"setRouteStepScreenshotImageData:"];
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 3))
  {
    -[GEORPInstructionCorrection setPhotoId:](self, "setPhotoId:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    [(GEORPInstructionCorrection *)self setRouteStepScreenshotImageId:"setRouteStepScreenshotImageId:"];
    NSUInteger v4 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeStepScreenshotImageId, 0);
  objc_storeStrong((id *)&self->_routeStepScreenshotImageData, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_photoId, 0);
  objc_storeStrong((id *)&self->_comments, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end