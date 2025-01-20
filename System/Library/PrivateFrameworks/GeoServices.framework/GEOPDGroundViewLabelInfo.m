@interface GEOPDGroundViewLabelInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGroundViewLabelInfo)init;
- (GEOPDGroundViewLabelInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)localityName;
- (id)locationName;
- (id)secondaryLocationName;
- (unint64_t)hash;
- (void)_readLocalityName;
- (void)_readLocationName;
- (void)_readSecondaryLocationName;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGroundViewLabelInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLocationName, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_localityName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x78) == 0))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDGroundViewLabelInfo readAll:]((uint64_t)self, 0);
    if (self->_locationName) {
      PBDataWriterWriteStringField();
    }
    id v5 = v9;
    if (self->_secondaryLocationName)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    if (self->_localityName)
    {
      PBDataWriterWriteStringField();
      id v5 = v9;
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteDoubleField();
      id v5 = v9;
      char flags = (char)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteDoubleField();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDGroundViewLabelInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGroundViewLabelInfo readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_locationName copyWithZone:a3];
  v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_secondaryLocationName copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  uint64_t v13 = [(NSString *)self->_localityName copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(double *)(v5 + 56) = self->_startHeading;
    *(unsigned char *)(v5 + 76) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(double *)(v5 + 24) = self->_endHeading;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_10:

  return (id)v5;
}

- (GEOPDGroundViewLabelInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDGroundViewLabelInfo;
  v2 = [(GEOPDGroundViewLabelInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGroundViewLabelInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDGroundViewLabelInfo;
  v3 = [(GEOPDGroundViewLabelInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readLocationName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundViewLabelInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)locationName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDGroundViewLabelInfo _readLocationName]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSecondaryLocationName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundViewLabelInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSecondaryLocationName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)secondaryLocationName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDGroundViewLabelInfo _readSecondaryLocationName]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readLocalityName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGroundViewLabelInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalityName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)localityName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDGroundViewLabelInfo _readLocalityName]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGroundViewLabelInfo;
  v4 = [(GEOPDGroundViewLabelInfo *)&v8 description];
  uint64_t v5 = [(GEOPDGroundViewLabelInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGroundViewLabelInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDGroundViewLabelInfo readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = -[GEOPDGroundViewLabelInfo locationName]((id *)a1);
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

    objc_super v7 = -[GEOPDGroundViewLabelInfo secondaryLocationName]((id *)a1);
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

    uint64_t v9 = -[GEOPDGroundViewLabelInfo localityName]((id *)a1);
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

    char v11 = *(unsigned char *)(a1 + 76);
    if ((v11 & 2) != 0)
    {
      v12 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
      if (a2) {
        uint64_t v13 = @"startHeading";
      }
      else {
        uint64_t v13 = @"start_heading";
      }
      [v4 setObject:v12 forKey:v13];

      char v11 = *(unsigned char *)(a1 + 76);
    }
    if (v11)
    {
      v14 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      if (a2) {
        v15 = @"endHeading";
      }
      else {
        v15 = @"end_heading";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = *(void **)(a1 + 16);
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __54__GEOPDGroundViewLabelInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDGroundViewLabelInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_5363;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_5364;
      }
      GEOPDGroundViewLabelInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __54__GEOPDGroundViewLabelInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDGroundViewLabelInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  -[GEOPDGroundViewLabelInfo readAll:]((uint64_t)self, 1);
  -[GEOPDGroundViewLabelInfo readAll:]((uint64_t)v4, 1);
  locationName = self->_locationName;
  if ((unint64_t)locationName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](locationName, "isEqual:")) {
      goto LABEL_17;
    }
  }
  secondaryLocationName = self->_secondaryLocationName;
  if ((unint64_t)secondaryLocationName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](secondaryLocationName, "isEqual:")) {
      goto LABEL_17;
    }
  }
  localityName = self->_localityName;
  if ((unint64_t)localityName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](localityName, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_startHeading != *((double *)v4 + 7)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  BOOL v8 = (*((unsigned char *)v4 + 76) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_endHeading != *((double *)v4 + 3)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDGroundViewLabelInfo readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_locationName hash];
  NSUInteger v4 = [(NSString *)self->_secondaryLocationName hash];
  NSUInteger v5 = [(NSString *)self->_localityName hash];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    double startHeading = self->_startHeading;
    double v9 = -startHeading;
    if (startHeading >= 0.0) {
      double v9 = self->_startHeading;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if (flags)
  {
    double endHeading = self->_endHeading;
    double v14 = -endHeading;
    if (endHeading >= 0.0) {
      double v14 = self->_endHeading;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v12;
}

@end