@interface GEOPDLocationInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLocalityName;
- (BOOL)hasLocationName;
- (BOOL)hasSecondaryLocationName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDLocationInfo)init;
- (GEOPDLocationInfo)initWithData:(id)a3;
- (GEOPDLocationInfo)initWithDictionary:(id)a3;
- (GEOPDLocationInfo)initWithJSON:(id)a3;
- (NSString)localityName;
- (NSString)locationName;
- (NSString)secondaryLocationName;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_readLocalityName;
- (void)_readLocationName;
- (void)_readSecondaryLocationName;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setLocalityName:(id)a3;
- (void)setLocationName:(id)a3;
- (void)setSecondaryLocationName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDLocationInfo

- (GEOPDLocationInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDLocationInfo;
  v2 = [(GEOPDLocationInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDLocationInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDLocationInfo;
  v3 = [(GEOPDLocationInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocationName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLocationInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationName_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLocationName
{
  return self->_locationName != 0;
}

- (NSString)locationName
{
  -[GEOPDLocationInfo _readLocationName]((uint64_t)self);
  locationName = self->_locationName;

  return locationName;
}

- (void)setLocationName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_locationName, a3);
}

- (void)_readSecondaryLocationName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLocationInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSecondaryLocationName_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasSecondaryLocationName
{
  return self->_secondaryLocationName != 0;
}

- (NSString)secondaryLocationName
{
  -[GEOPDLocationInfo _readSecondaryLocationName]((uint64_t)self);
  secondaryLocationName = self->_secondaryLocationName;

  return secondaryLocationName;
}

- (void)setSecondaryLocationName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_secondaryLocationName, a3);
}

- (void)_readLocalityName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDLocationInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalityName_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLocalityName
{
  return self->_localityName != 0;
}

- (NSString)localityName
{
  -[GEOPDLocationInfo _readLocalityName]((uint64_t)self);
  localityName = self->_localityName;

  return localityName;
}

- (void)setLocalityName:(id)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_localityName, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDLocationInfo;
  v4 = [(GEOPDLocationInfo *)&v8 description];
  v5 = [(GEOPDLocationInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDLocationInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 locationName];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"locationName";
      }
      else {
        objc_super v6 = @"location_name";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 secondaryLocationName];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"secondaryLocationName";
      }
      else {
        objc_super v8 = @"secondary_location_name";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [a1 localityName];
    if (v9)
    {
      if (a2) {
        v10 = @"localityName";
      }
      else {
        v10 = @"locality_name";
      }
      [v4 setObject:v9 forKey:v10];
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
  return -[GEOPDLocationInfo _dictionaryRepresentation:](self, 1);
}

- (GEOPDLocationInfo)initWithDictionary:(id)a3
{
  return (GEOPDLocationInfo *)-[GEOLocationInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOPDLocationInfo)initWithJSON:(id)a3
{
  return (GEOPDLocationInfo *)-[GEOLocationInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_315_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_316_0;
    }
    GEOPDLocationInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDLocationInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDLocationInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xF) == 0))
  {
    v5 = self->_reader;
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
    [(GEOPDLocationInfo *)self readAll:0];
    if (self->_locationName) {
      PBDataWriterWriteStringField();
    }
    if (self->_secondaryLocationName) {
      PBDataWriterWriteStringField();
    }
    if (self->_localityName) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  v5 = (id *)a3;
  [(GEOPDLocationInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_locationName) {
    objc_msgSend(v5, "setLocationName:");
  }
  if (self->_secondaryLocationName) {
    objc_msgSend(v5, "setSecondaryLocationName:");
  }
  v4 = v5;
  if (self->_localityName)
  {
    objc_msgSend(v5, "setLocalityName:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDLocationInfo *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_locationName copyWithZone:a3];
    v9 = (void *)v5[3];
    v5[3] = v8;

    uint64_t v10 = [(NSString *)self->_secondaryLocationName copyWithZone:a3];
    v11 = (void *)v5[4];
    v5[4] = v10;

    uint64_t v12 = [(NSString *)self->_localityName copyWithZone:a3];
    id v7 = (PBDataReader *)v5[2];
    v5[2] = v12;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDLocationInfoReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPDLocationInfo *)self readAll:1],
         [v4 readAll:1],
         locationName = self->_locationName,
         !((unint64_t)locationName | v4[3]))
     || -[NSString isEqual:](locationName, "isEqual:"))
    && ((secondaryLocationName = self->_secondaryLocationName, !((unint64_t)secondaryLocationName | v4[4]))
     || -[NSString isEqual:](secondaryLocationName, "isEqual:")))
  {
    localityName = self->_localityName;
    if ((unint64_t)localityName | v4[2]) {
      char v8 = -[NSString isEqual:](localityName, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(GEOPDLocationInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_locationName hash];
  NSUInteger v4 = [(NSString *)self->_secondaryLocationName hash] ^ v3;
  return v4 ^ [(NSString *)self->_localityName hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  [v4 readAll:0];
  if (v4[3]) {
    -[GEOPDLocationInfo setLocationName:](self, "setLocationName:");
  }
  if (v4[4]) {
    -[GEOPDLocationInfo setSecondaryLocationName:](self, "setSecondaryLocationName:");
  }
  if (v4[2]) {
    -[GEOPDLocationInfo setLocalityName:](self, "setLocalityName:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLocationName, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_localityName, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end