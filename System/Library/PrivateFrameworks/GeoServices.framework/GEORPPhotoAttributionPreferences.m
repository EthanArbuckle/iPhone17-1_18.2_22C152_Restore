@interface GEORPPhotoAttributionPreferences
+ (BOOL)isValid:(id)a3;
- (BOOL)attributePhotos;
- (BOOL)hasAttributePhotos;
- (BOOL)hasAttributionName;
- (BOOL)hasVersion;
- (BOOL)hasWasCleared;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasCleared;
- (GEORPPhotoAttributionPreferences)init;
- (GEORPPhotoAttributionPreferences)initWithData:(id)a3;
- (GEORPPhotoAttributionPreferences)initWithDictionary:(id)a3;
- (GEORPPhotoAttributionPreferences)initWithJSON:(id)a3;
- (NSString)attributionName;
- (NSString)version;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAttributionName;
- (void)_readVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAttributePhotos:(BOOL)a3;
- (void)setAttributionName:(id)a3;
- (void)setHasAttributePhotos:(BOOL)a3;
- (void)setHasWasCleared:(BOOL)a3;
- (void)setVersion:(id)a3;
- (void)setWasCleared:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPhotoAttributionPreferences

- (GEORPPhotoAttributionPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPPhotoAttributionPreferences;
  v2 = [(GEORPPhotoAttributionPreferences *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPhotoAttributionPreferences)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPPhotoAttributionPreferences;
  v3 = [(GEORPPhotoAttributionPreferences *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVersion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoAttributionPreferencesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVersion_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (NSString)version
{
  -[GEORPPhotoAttributionPreferences _readVersion]((uint64_t)self);
  version = self->_version;

  return version;
}

- (void)setVersion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_version, a3);
}

- (BOOL)attributePhotos
{
  return self->_attributePhotos;
}

- (void)setAttributePhotos:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_attributePhotos = a3;
}

- (void)setHasAttributePhotos:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasAttributePhotos
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readAttributionName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoAttributionPreferencesReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributionName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasAttributionName
{
  return self->_attributionName != 0;
}

- (NSString)attributionName
{
  -[GEORPPhotoAttributionPreferences _readAttributionName]((uint64_t)self);
  attributionName = self->_attributionName;

  return attributionName;
}

- (void)setAttributionName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_attributionName, a3);
}

- (BOOL)wasCleared
{
  return self->_wasCleared;
}

- (void)setWasCleared:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  self->_wasCleared = a3;
}

- (void)setHasWasCleared:(BOOL)a3
{
  if (a3) {
    char v3 = 18;
  }
  else {
    char v3 = 16;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasWasCleared
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPhotoAttributionPreferences;
  v4 = [(GEORPPhotoAttributionPreferences *)&v8 description];
  v5 = [(GEORPPhotoAttributionPreferences *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPhotoAttributionPreferences _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 version];
    if (v5) {
      [v4 setObject:v5 forKey:@"version"];
    }

    if (a1[48])
    {
      objc_super v6 = [NSNumber numberWithBool:a1[44]];
      if (a2) {
        objc_super v7 = @"attributePhotos";
      }
      else {
        objc_super v7 = @"attribute_photos";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [a1 attributionName];
    if (v8)
    {
      if (a2) {
        v9 = @"attributionName";
      }
      else {
        v9 = @"attribution_name";
      }
      [v4 setObject:v8 forKey:v9];
    }

    if ((a1[48] & 2) != 0)
    {
      v10 = [NSNumber numberWithBool:a1[45]];
      if (a2) {
        v11 = @"wasCleared";
      }
      else {
        v11 = @"was_cleared";
      }
      [v4 setObject:v10 forKey:v11];
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
  return -[GEORPPhotoAttributionPreferences _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEORPPhotoAttributionPreferences)initWithDictionary:(id)a3
{
  return (GEORPPhotoAttributionPreferences *)-[GEORPPhotoAttributionPreferences _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"version"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setVersion:v7];
      }
      if (a3) {
        objc_super v8 = @"attributePhotos";
      }
      else {
        objc_super v8 = @"attribute_photos";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAttributePhotos:", objc_msgSend(v9, "BOOLValue"));
      }

      if (a3) {
        v10 = @"attributionName";
      }
      else {
        v10 = @"attribution_name";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[v11 copy];
        [a1 setAttributionName:v12];
      }
      if (a3) {
        v13 = @"wasCleared";
      }
      else {
        v13 = @"was_cleared";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setWasCleared:", objc_msgSend(v14, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORPPhotoAttributionPreferences)initWithJSON:(id)a3
{
  return (GEORPPhotoAttributionPreferences *)-[GEORPPhotoAttributionPreferences _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_57;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_57;
    }
    GEORPPhotoAttributionPreferencesReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPhotoAttributionPreferencesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPhotoAttributionPreferencesReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
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
    [(GEORPPhotoAttributionPreferences *)self readAll:0];
    if (self->_version) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_attributionName) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPPhotoAttributionPreferences *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 8) = self->_readerMarkPos;
  *((_DWORD *)v5 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_version) {
    objc_msgSend(v5, "setVersion:");
  }
  v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v5 + 44) = self->_attributePhotos;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  if (self->_attributionName)
  {
    objc_msgSend(v5, "setAttributionName:");
    v4 = v5;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v4 + 45) = self->_wasCleared;
    *((unsigned char *)v4 + 48) |= 2u;
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
      GEORPPhotoAttributionPreferencesReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPPhotoAttributionPreferences *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_version copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 44) = self->_attributePhotos;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_attributionName copyWithZone:a3];
  v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 45) = self->_wasCleared;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  [(GEORPPhotoAttributionPreferences *)self readAll:1];
  [v4 readAll:1];
  version = self->_version;
  if ((unint64_t)version | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](version, "isEqual:")) {
      goto LABEL_17;
    }
  }
  char flags = (char)self->_flags;
  char v7 = *((unsigned char *)v4 + 48);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0) {
      goto LABEL_17;
    }
    if (self->_attributePhotos)
    {
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 44))
    {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_17;
  }
  attributionName = self->_attributionName;
  if ((unint64_t)attributionName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](attributionName, "isEqual:")) {
      goto LABEL_17;
    }
    char flags = (char)self->_flags;
    char v7 = *((unsigned char *)v4 + 48);
  }
  BOOL v9 = (v7 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) != 0)
    {
      if (self->_wasCleared)
      {
        if (!*((unsigned char *)v4 + 45)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)v4 + 45))
      {
        goto LABEL_17;
      }
      BOOL v9 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v9 = 0;
  }
LABEL_18:

  return v9;
}

- (unint64_t)hash
{
  [(GEORPPhotoAttributionPreferences *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_version hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_attributePhotos;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_attributionName hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_wasCleared;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v5 = a3;
  [v5 readAll:0];
  uint64_t v4 = v5;
  if (v5[3])
  {
    -[GEORPPhotoAttributionPreferences setVersion:](self, "setVersion:");
    uint64_t v4 = v5;
  }
  if (v4[6])
  {
    self->_attributePhotos = *((unsigned char *)v4 + 44);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (v4[2])
  {
    -[GEORPPhotoAttributionPreferences setAttributionName:](self, "setAttributionName:");
    uint64_t v4 = v5;
  }
  if ((v4[6] & 2) != 0)
  {
    self->_wasCleared = *((unsigned char *)v4 + 45);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_attributionName, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end