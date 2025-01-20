@interface GEOImageServiceImage
+ (BOOL)isValid:(id)a3;
- (BOOL)hasImage;
- (BOOL)hasImageId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOImageServiceImage)init;
- (GEOImageServiceImage)initWithData:(id)a3;
- (GEOImageServiceImage)initWithDictionary:(id)a3;
- (GEOImageServiceImage)initWithJSON:(id)a3;
- (NSData)image;
- (NSData)imageId;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readImage;
- (void)_readImageId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOImageServiceImage

- (GEOImageServiceImage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOImageServiceImage;
  v2 = [(GEOImageServiceImage *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOImageServiceImage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOImageServiceImage;
  v3 = [(GEOImageServiceImage *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOImageServiceImageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImageId_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasImageId
{
  return self->_imageId != 0;
}

- (NSData)imageId
{
  -[GEOImageServiceImage _readImageId]((uint64_t)self);
  imageId = self->_imageId;

  return imageId;
}

- (void)setImageId:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_imageId, a3);
}

- (void)_readImage
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
        GEOImageServiceImageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImage_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (NSData)image
{
  -[GEOImageServiceImage _readImage]((uint64_t)self);
  image = self->_image;

  return image;
}

- (void)setImage:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_image, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOImageServiceImage;
  v4 = [(GEOImageServiceImage *)&v8 description];
  v5 = [(GEOImageServiceImage *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOImageServiceImage _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 imageId];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"imageId"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"image_id"];
      }
    }

    objc_super v8 = [a1 image];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 base64EncodedStringWithOptions:0];
        [v4 setObject:v10 forKey:@"image"];
      }
      else
      {
        [v4 setObject:v8 forKey:@"image"];
      }
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
  return -[GEOImageServiceImage _dictionaryRepresentation:](self, 1);
}

- (GEOImageServiceImage)initWithDictionary:(id)a3
{
  return (GEOImageServiceImage *)-[GEOImageServiceImage _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
        [a1 setImageId:v8];
      }
      v9 = [v5 objectForKeyedSubscript:@"image"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v9 options:0];
        [a1 setImage:v10];
      }
    }
  }

  return a1;
}

- (GEOImageServiceImage)initWithJSON:(id)a3
{
  return (GEOImageServiceImage *)-[GEOImageServiceImage _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_82;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_82;
    }
    GEOImageServiceImageReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOImageServiceImageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOImageServiceImageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
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
    [(GEOImageServiceImage *)self readAll:0];
    if (self->_imageId) {
      PBDataWriterWriteDataField();
    }
    if (self->_image) {
      PBDataWriterWriteDataField();
    }
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOImageServiceImage *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_imageId) {
    objc_msgSend(v4, "setImageId:");
  }
  if (self->_image) {
    objc_msgSend(v4, "setImage:");
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
    [(GEOImageServiceImage *)self readAll:0];
    uint64_t v8 = [(NSData *)self->_imageId copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [(NSData *)self->_image copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOImageServiceImageReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOImageServiceImage *)self readAll:1],
         [v4 readAll:1],
         imageId = self->_imageId,
         !((unint64_t)imageId | v4[2]))
     || -[NSData isEqual:](imageId, "isEqual:")))
  {
    image = self->_image;
    if ((unint64_t)image | v4[3]) {
      char v7 = -[NSData isEqual:](image, "isEqual:");
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
  [(GEOImageServiceImage *)self readAll:1];
  uint64_t v3 = [(NSData *)self->_imageId hash];
  return [(NSData *)self->_image hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEOImageServiceImage setImageId:](self, "setImageId:");
  }
  if (v4[3]) {
    -[GEOImageServiceImage setImage:](self, "setImage:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end