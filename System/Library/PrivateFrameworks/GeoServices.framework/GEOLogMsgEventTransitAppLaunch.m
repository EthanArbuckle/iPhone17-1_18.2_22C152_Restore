@interface GEOLogMsgEventTransitAppLaunch
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBundleIdentifier;
- (BOOL)hasDestination;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasSource;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)destination;
- (GEOLatLng)source;
- (GEOLogMsgEventTransitAppLaunch)init;
- (GEOLogMsgEventTransitAppLaunch)initWithData:(id)a3;
- (GEOLogMsgEventTransitAppLaunch)initWithDictionary:(id)a3;
- (GEOLogMsgEventTransitAppLaunch)initWithJSON:(id)a3;
- (NSString)bundleIdentifier;
- (double)timestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readBundleIdentifier;
- (void)_readDestination;
- (void)_readSource;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDestination:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventTransitAppLaunch

- (GEOLogMsgEventTransitAppLaunch)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventTransitAppLaunch;
  v2 = [(GEOLogMsgEventTransitAppLaunch *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventTransitAppLaunch)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventTransitAppLaunch;
  v3 = [(GEOLogMsgEventTransitAppLaunch *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBundleIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTransitAppLaunchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBundleIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (NSString)bundleIdentifier
{
  -[GEOLogMsgEventTransitAppLaunch _readBundleIdentifier]((uint64_t)self);
  bundleIdentifier = self->_bundleIdentifier;

  return bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void)_readSource
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTransitAppLaunchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSource_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (GEOLatLng)source
{
  -[GEOLogMsgEventTransitAppLaunch _readSource]((uint64_t)self);
  source = self->_source;

  return source;
}

- (void)setSource:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_source, a3);
}

- (void)_readDestination
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTransitAppLaunchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDestination_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDestination
{
  return self->_destination != 0;
}

- (GEOLatLng)destination
{
  -[GEOLogMsgEventTransitAppLaunch _readDestination]((uint64_t)self);
  destination = self->_destination;

  return destination;
}

- (void)setDestination:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_destination, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventTransitAppLaunch;
  v4 = [(GEOLogMsgEventTransitAppLaunch *)&v8 description];
  v5 = [(GEOLogMsgEventTransitAppLaunch *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventTransitAppLaunch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 bundleIdentifier];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"bundleIdentifier";
      }
      else {
        objc_super v6 = @"bundle_identifier";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [(id)a1 source];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"source"];
    }
    v10 = [(id)a1 destination];
    v11 = v10;
    if (v10)
    {
      if (a2) {
        [v10 jsonRepresentation];
      }
      else {
      v12 = [v10 dictionaryRepresentation];
      }
      [v4 setObject:v12 forKey:@"destination"];
    }
    if (*(unsigned char *)(a1 + 60))
    {
      v13 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
      [v4 setObject:v13 forKey:@"timestamp"];
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
  return -[GEOLogMsgEventTransitAppLaunch _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventTransitAppLaunch)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventTransitAppLaunch *)-[GEOLogMsgEventTransitAppLaunch _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"bundleIdentifier";
      }
      else {
        objc_super v6 = @"bundle_identifier";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setBundleIdentifier:v8];
      }
      v9 = [v5 objectForKeyedSubscript:@"source"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v11 = [(GEOLatLng *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOLatLng *)v10 initWithDictionary:v9];
        }
        v12 = (void *)v11;
        [a1 setSource:v11];
      }
      v13 = [v5 objectForKeyedSubscript:@"destination"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v15 = [(GEOLatLng *)v14 initWithJSON:v13];
        }
        else {
          uint64_t v15 = [(GEOLatLng *)v14 initWithDictionary:v13];
        }
        v16 = (void *)v15;
        [a1 setDestination:v15];
      }
      v17 = [v5 objectForKeyedSubscript:@"timestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v17 doubleValue];
        objc_msgSend(a1, "setTimestamp:");
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventTransitAppLaunch)initWithJSON:(id)a3
{
  return (GEOLogMsgEventTransitAppLaunch *)-[GEOLogMsgEventTransitAppLaunch _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_5298;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_5299;
    }
    GEOLogMsgEventTransitAppLaunchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLatLng *)self->_source readAll:1];
    [(GEOLatLng *)self->_destination readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventTransitAppLaunchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventTransitAppLaunchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
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
    [(GEOLogMsgEventTransitAppLaunch *)self readAll:0];
    if (self->_bundleIdentifier) {
      PBDataWriterWriteStringField();
    }
    if (self->_source) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_destination) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOLogMsgEventTransitAppLaunch _readDestination]((uint64_t)self);
  if ([(GEOLatLng *)self->_destination hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEOLogMsgEventTransitAppLaunch _readSource]((uint64_t)self);
  source = self->_source;

  return [(GEOLatLng *)source hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOLogMsgEventTransitAppLaunch *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_bundleIdentifier) {
    objc_msgSend(v5, "setBundleIdentifier:");
  }
  if (self->_source) {
    objc_msgSend(v5, "setSource:");
  }
  v4 = v5;
  if (self->_destination)
  {
    objc_msgSend(v5, "setDestination:");
    v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    v4[5] = *(id *)&self->_timestamp;
    *((unsigned char *)v4 + 60) |= 1u;
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
      GEOLogMsgEventTransitAppLaunchReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventTransitAppLaunch *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  id v11 = [(GEOLatLng *)self->_source copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  id v13 = [(GEOLatLng *)self->_destination copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 40) = self->_timestamp;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  [(GEOLogMsgEventTransitAppLaunch *)self readAll:1];
  [v4 readAll:1];
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleIdentifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](source, "isEqual:")) {
      goto LABEL_12;
    }
  }
  destination = self->_destination;
  if ((unint64_t)destination | *((void *)v4 + 3))
  {
    if (!-[GEOLatLng isEqual:](destination, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) != 0 && self->_timestamp == *((double *)v4 + 5))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventTransitAppLaunch *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_bundleIdentifier hash];
  unint64_t v4 = [(GEOLatLng *)self->_source hash];
  unint64_t v5 = [(GEOLatLng *)self->_destination hash];
  if (*(unsigned char *)&self->_flags)
  {
    double timestamp = self->_timestamp;
    double v8 = -timestamp;
    if (timestamp >= 0.0) {
      double v8 = self->_timestamp;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  long double v9 = a3;
  [v9 readAll:0];
  unint64_t v4 = v9;
  if (v9[2])
  {
    -[GEOLogMsgEventTransitAppLaunch setBundleIdentifier:](self, "setBundleIdentifier:");
    unint64_t v4 = v9;
  }
  source = self->_source;
  uint64_t v6 = v4[4];
  if (source)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOLatLng mergeFrom:](source, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOLogMsgEventTransitAppLaunch setSource:](self, "setSource:");
  }
  unint64_t v4 = v9;
LABEL_9:
  destination = self->_destination;
  uint64_t v8 = v4[3];
  if (destination)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOLatLng mergeFrom:](destination, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[GEOLogMsgEventTransitAppLaunch setDestination:](self, "setDestination:");
  }
  unint64_t v4 = v9;
LABEL_15:
  if (*((unsigned char *)v4 + 60))
  {
    self->_double timestamp = (double)v4[5];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end