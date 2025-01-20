@interface GEOAddressCorrectionAddress
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAddressID;
- (BOOL)hasAddressLocation;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasRadiusInMeters;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAddressCorrectionAddress)init;
- (GEOAddressCorrectionAddress)initWithData:(id)a3;
- (GEOAddressCorrectionAddress)initWithDictionary:(id)a3;
- (GEOAddressCorrectionAddress)initWithJSON:(id)a3;
- (GEOLocation)addressLocation;
- (NSString)addressID;
- (double)radiusInMeters;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readAddressID;
- (void)_readAddressLocation;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAddressID:(id)a3;
- (void)setAddressLocation:(id)a3;
- (void)setHasRadiusInMeters:(BOOL)a3;
- (void)setRadiusInMeters:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAddressCorrectionAddress

- (GEOAddressCorrectionAddress)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAddressCorrectionAddress;
  v2 = [(GEOAddressCorrectionAddress *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAddressCorrectionAddress)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAddressCorrectionAddress;
  v3 = [(GEOAddressCorrectionAddress *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAddressLocation
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
        GEOAddressCorrectionAddressReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAddressLocation
{
  return self->_addressLocation != 0;
}

- (GEOLocation)addressLocation
{
  -[GEOAddressCorrectionAddress _readAddressLocation]((uint64_t)self);
  addressLocation = self->_addressLocation;

  return addressLocation;
}

- (void)setAddressLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_addressLocation, a3);
}

- (void)_readAddressID
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
        GEOAddressCorrectionAddressReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAddressID
{
  return self->_addressID != 0;
}

- (NSString)addressID
{
  -[GEOAddressCorrectionAddress _readAddressID]((uint64_t)self);
  addressID = self->_addressID;

  return addressID;
}

- (void)setAddressID:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_addressID, a3);
}

- (double)radiusInMeters
{
  return self->_radiusInMeters;
}

- (void)setRadiusInMeters:(double)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_radiusInMeters = a3;
}

- (void)setHasRadiusInMeters:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasRadiusInMeters
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAddressCorrectionAddress;
  v4 = [(GEOAddressCorrectionAddress *)&v8 description];
  v5 = [(GEOAddressCorrectionAddress *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAddressCorrectionAddress _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 addressLocation];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"addressLocation"];
    }
    objc_super v8 = [(id)a1 addressID];
    if (v8) {
      [v4 setObject:v8 forKey:@"addressID"];
    }

    if (*(unsigned char *)(a1 + 52))
    {
      v9 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
      [v4 setObject:v9 forKey:@"radiusInMeters"];
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
  return -[GEOAddressCorrectionAddress _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOAddressCorrectionAddress)initWithDictionary:(id)a3
{
  return (GEOAddressCorrectionAddress *)-[GEOAddressCorrectionAddress _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"addressLocation"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOLocation alloc];
        if (a3) {
          uint64_t v8 = [(GEOLocation *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOLocation *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setAddressLocation:v8];
      }
      v10 = [v5 objectForKeyedSubscript:@"addressID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setAddressID:v11];
      }
      v12 = [v5 objectForKeyedSubscript:@"radiusInMeters"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 doubleValue];
        objc_msgSend(a1, "setRadiusInMeters:");
      }
    }
  }

  return a1;
}

- (GEOAddressCorrectionAddress)initWithJSON:(id)a3
{
  return (GEOAddressCorrectionAddress *)-[GEOAddressCorrectionAddress _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_19;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_19;
    }
    GEOAddressCorrectionAddressReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLocation *)self->_addressLocation readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAddressCorrectionAddressIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAddressCorrectionAddressReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAddressCorrectionAddressIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOAddressCorrectionAddress *)self readAll:0];
    if (self->_addressLocation) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_addressID) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOAddressCorrectionAddress _readAddressLocation]((uint64_t)self);
  addressLocation = self->_addressLocation;

  return [(GEOLocation *)addressLocation hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOAddressCorrectionAddress *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_addressLocation) {
    objc_msgSend(v4, "setAddressLocation:");
  }
  if (self->_addressID) {
    objc_msgSend(v4, "setAddressID:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    v4[4] = *(id *)&self->_radiusInMeters;
    *((unsigned char *)v4 + 52) |= 1u;
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
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOAddressCorrectionAddressReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOAddressCorrectionAddress *)self readAll:0];
  id v9 = [(GEOLocation *)self->_addressLocation copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_addressID copyWithZone:a3];
  v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 32) = self->_radiusInMeters;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  [(GEOAddressCorrectionAddress *)self readAll:1];
  [v4 readAll:1];
  addressLocation = self->_addressLocation;
  if ((unint64_t)addressLocation | *((void *)v4 + 3))
  {
    if (!-[GEOLocation isEqual:](addressLocation, "isEqual:")) {
      goto LABEL_10;
    }
  }
  addressID = self->_addressID;
  if ((unint64_t)addressID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](addressID, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) != 0 && self->_radiusInMeters == *((double *)v4 + 4))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  [(GEOAddressCorrectionAddress *)self readAll:1];
  unint64_t v3 = [(GEOLocation *)self->_addressLocation hash];
  NSUInteger v4 = [(NSString *)self->_addressID hash];
  if (*(unsigned char *)&self->_flags)
  {
    double radiusInMeters = self->_radiusInMeters;
    double v7 = -radiusInMeters;
    if (radiusInMeters >= 0.0) {
      double v7 = self->_radiusInMeters;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  double v7 = a3;
  [v7 readAll:0];
  addressLocation = self->_addressLocation;
  uint64_t v5 = v7[3];
  if (addressLocation)
  {
    if (v5) {
      -[GEOLocation mergeFrom:](addressLocation, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOAddressCorrectionAddress setAddressLocation:](self, "setAddressLocation:");
  }
  objc_super v6 = v7;
  if (v7[2])
  {
    -[GEOAddressCorrectionAddress setAddressID:](self, "setAddressID:");
    objc_super v6 = v7;
  }
  if (*((unsigned char *)v6 + 52))
  {
    self->_double radiusInMeters = (double)v6[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressLocation, 0);
  objc_storeStrong((id *)&self->_addressID, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end