@interface GEORPManifestURL
+ (BOOL)isValid:(id)a3;
- (BOOL)hasUrlName;
- (BOOL)hasUrlValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPManifestURL)init;
- (GEORPManifestURL)initWithData:(id)a3;
- (GEORPManifestURL)initWithDictionary:(id)a3;
- (GEORPManifestURL)initWithJSON:(id)a3;
- (NSString)urlName;
- (NSString)urlValue;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readUrlName;
- (void)_readUrlValue;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setUrlName:(id)a3;
- (void)setUrlValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPManifestURL

- (GEORPManifestURL)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPManifestURL;
  v2 = [(GEORPManifestURL *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPManifestURL)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPManifestURL;
  v3 = [(GEORPManifestURL *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUrlName
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
        GEORPManifestURLReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrlName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasUrlName
{
  return self->_urlName != 0;
}

- (NSString)urlName
{
  -[GEORPManifestURL _readUrlName]((uint64_t)self);
  urlName = self->_urlName;

  return urlName;
}

- (void)setUrlName:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_urlName, a3);
}

- (void)_readUrlValue
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
        GEORPManifestURLReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrlValue_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasUrlValue
{
  return self->_urlValue != 0;
}

- (NSString)urlValue
{
  -[GEORPManifestURL _readUrlValue]((uint64_t)self);
  urlValue = self->_urlValue;

  return urlValue;
}

- (void)setUrlValue:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_urlValue, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPManifestURL;
  v4 = [(GEORPManifestURL *)&v8 description];
  v5 = [(GEORPManifestURL *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPManifestURL _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 urlName];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"urlName";
      }
      else {
        objc_super v6 = @"url_name";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 urlValue];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"urlValue";
      }
      else {
        objc_super v8 = @"url_value";
      }
      [v4 setObject:v7 forKey:v8];
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
  return -[GEORPManifestURL _dictionaryRepresentation:](self, 1);
}

- (GEORPManifestURL)initWithDictionary:(id)a3
{
  return (GEORPManifestURL *)-[GEORPManifestURL _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"urlName";
      }
      else {
        objc_super v6 = @"url_name";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setUrlName:v8];
      }
      if (a3) {
        v9 = @"urlValue";
      }
      else {
        v9 = @"url_value";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setUrlValue:v11];
      }
    }
  }

  return a1;
}

- (GEORPManifestURL)initWithJSON:(id)a3
{
  return (GEORPManifestURL *)-[GEORPManifestURL _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1289_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1290_0;
    }
    GEORPManifestURLReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPManifestURLIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPManifestURLReadAllFrom((uint64_t)self, a3, 0);
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
    [(GEORPManifestURL *)self readAll:0];
    if (self->_urlName) {
      PBDataWriterWriteStringField();
    }
    if (self->_urlValue) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPManifestURL *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_urlName) {
    objc_msgSend(v4, "setUrlName:");
  }
  if (self->_urlValue) {
    objc_msgSend(v4, "setUrlValue:");
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
    [(GEORPManifestURL *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_urlName copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [(NSString *)self->_urlValue copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPManifestURLReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPManifestURL *)self readAll:1],
         [v4 readAll:1],
         urlName = self->_urlName,
         !((unint64_t)urlName | v4[2]))
     || -[NSString isEqual:](urlName, "isEqual:")))
  {
    urlValue = self->_urlValue;
    if ((unint64_t)urlValue | v4[3]) {
      char v7 = -[NSString isEqual:](urlValue, "isEqual:");
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
  [(GEORPManifestURL *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_urlName hash];
  return [(NSString *)self->_urlValue hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEORPManifestURL setUrlName:](self, "setUrlName:");
  }
  if (v4[3]) {
    -[GEORPManifestURL setUrlValue:](self, "setUrlValue:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlValue, 0);
  objc_storeStrong((id *)&self->_urlName, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end