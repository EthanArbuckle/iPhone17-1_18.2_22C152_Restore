@interface GEOLogMsgEventMapLaunch
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLaunchUri;
- (BOOL)hasSourceAppId;
- (BOOL)hasTimeToLeave;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventMapLaunch)init;
- (GEOLogMsgEventMapLaunch)initWithData:(id)a3;
- (GEOLogMsgEventMapLaunch)initWithDictionary:(id)a3;
- (GEOLogMsgEventMapLaunch)initWithJSON:(id)a3;
- (GEOTimeToLeaveMapLaunch)timeToLeave;
- (NSString)launchUri;
- (NSString)sourceAppId;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLaunchUri;
- (void)_readSourceAppId;
- (void)_readTimeToLeave;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setLaunchUri:(id)a3;
- (void)setSourceAppId:(id)a3;
- (void)setTimeToLeave:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventMapLaunch

- (GEOLogMsgEventMapLaunch)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventMapLaunch;
  v2 = [(GEOLogMsgEventMapLaunch *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventMapLaunch)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventMapLaunch;
  v3 = [(GEOLogMsgEventMapLaunch *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSourceAppId
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
        GEOLogMsgEventMapLaunchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceAppId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasSourceAppId
{
  return self->_sourceAppId != 0;
}

- (NSString)sourceAppId
{
  -[GEOLogMsgEventMapLaunch _readSourceAppId]((uint64_t)self);
  sourceAppId = self->_sourceAppId;

  return sourceAppId;
}

- (void)setSourceAppId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_sourceAppId, a3);
}

- (void)_readLaunchUri
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
        GEOLogMsgEventMapLaunchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLaunchUri_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLaunchUri
{
  return self->_launchUri != 0;
}

- (NSString)launchUri
{
  -[GEOLogMsgEventMapLaunch _readLaunchUri]((uint64_t)self);
  launchUri = self->_launchUri;

  return launchUri;
}

- (void)setLaunchUri:(id)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_launchUri, a3);
}

- (void)_readTimeToLeave
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
        GEOLogMsgEventMapLaunchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimeToLeave_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTimeToLeave
{
  return self->_timeToLeave != 0;
}

- (GEOTimeToLeaveMapLaunch)timeToLeave
{
  -[GEOLogMsgEventMapLaunch _readTimeToLeave]((uint64_t)self);
  timeToLeave = self->_timeToLeave;

  return timeToLeave;
}

- (void)setTimeToLeave:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_timeToLeave, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventMapLaunch;
  v4 = [(GEOLogMsgEventMapLaunch *)&v8 description];
  v5 = [(GEOLogMsgEventMapLaunch *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventMapLaunch _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 sourceAppId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"sourceAppId";
      }
      else {
        objc_super v6 = @"source_app_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 launchUri];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"launchUri";
      }
      else {
        objc_super v8 = @"launch_uri";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [a1 timeToLeave];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"timeToLeave";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"time_to_leave";
      }
      [v4 setObject:v11 forKey:v12];
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
  return -[GEOLogMsgEventMapLaunch _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventMapLaunch)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventMapLaunch *)-[GEOLogMsgEventMapLaunch _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"sourceAppId";
      }
      else {
        objc_super v6 = @"source_app_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setSourceAppId:v8];
      }
      if (a3) {
        v9 = @"launchUri";
      }
      else {
        v9 = @"launch_uri";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setLaunchUri:v11];
      }
      if (a3) {
        v12 = @"timeToLeave";
      }
      else {
        v12 = @"time_to_leave";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = [GEOTimeToLeaveMapLaunch alloc];
        if (a3) {
          uint64_t v15 = [(GEOTimeToLeaveMapLaunch *)v14 initWithJSON:v13];
        }
        else {
          uint64_t v15 = [(GEOTimeToLeaveMapLaunch *)v14 initWithDictionary:v13];
        }
        v16 = (void *)v15;
        [a1 setTimeToLeave:v15];
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventMapLaunch)initWithJSON:(id)a3
{
  return (GEOLogMsgEventMapLaunch *)-[GEOLogMsgEventMapLaunch _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3405_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3406_0;
    }
    GEOLogMsgEventMapLaunchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOTimeToLeaveMapLaunch *)self->_timeToLeave readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventMapLaunchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventMapLaunchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xF) == 0))
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
    [(GEOLogMsgEventMapLaunch *)self readAll:0];
    if (self->_sourceAppId) {
      PBDataWriterWriteStringField();
    }
    if (self->_launchUri) {
      PBDataWriterWriteStringField();
    }
    if (self->_timeToLeave) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOLogMsgEventMapLaunch *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_sourceAppId) {
    objc_msgSend(v5, "setSourceAppId:");
  }
  if (self->_launchUri) {
    objc_msgSend(v5, "setLaunchUri:");
  }
  v4 = v5;
  if (self->_timeToLeave)
  {
    objc_msgSend(v5, "setTimeToLeave:");
    v4 = v5;
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
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventMapLaunch *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_sourceAppId copyWithZone:a3];
    v9 = (void *)v5[3];
    v5[3] = v8;

    uint64_t v10 = [(NSString *)self->_launchUri copyWithZone:a3];
    v11 = (void *)v5[2];
    v5[2] = v10;

    id v12 = [(GEOTimeToLeaveMapLaunch *)self->_timeToLeave copyWithZone:a3];
    id v7 = (PBDataReader *)v5[4];
    v5[4] = v12;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgEventMapLaunchReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLogMsgEventMapLaunch *)self readAll:1],
         [v4 readAll:1],
         sourceAppId = self->_sourceAppId,
         !((unint64_t)sourceAppId | v4[3]))
     || -[NSString isEqual:](sourceAppId, "isEqual:"))
    && ((launchUri = self->_launchUri, !((unint64_t)launchUri | v4[2]))
     || -[NSString isEqual:](launchUri, "isEqual:")))
  {
    timeToLeave = self->_timeToLeave;
    if ((unint64_t)timeToLeave | v4[4]) {
      char v8 = -[GEOTimeToLeaveMapLaunch isEqual:](timeToLeave, "isEqual:");
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
  [(GEOLogMsgEventMapLaunch *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_sourceAppId hash];
  NSUInteger v4 = [(NSString *)self->_launchUri hash] ^ v3;
  return v4 ^ [(GEOTimeToLeaveMapLaunch *)self->_timeToLeave hash];
}

- (void)mergeFrom:(id)a3
{
  objc_super v6 = a3;
  [v6 readAll:0];
  if (v6[3]) {
    -[GEOLogMsgEventMapLaunch setSourceAppId:](self, "setSourceAppId:");
  }
  if (v6[2]) {
    -[GEOLogMsgEventMapLaunch setLaunchUri:](self, "setLaunchUri:");
  }
  timeToLeave = self->_timeToLeave;
  uint64_t v5 = v6[4];
  if (timeToLeave)
  {
    if (v5) {
      -[GEOTimeToLeaveMapLaunch mergeFrom:](timeToLeave, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOLogMsgEventMapLaunch setTimeToLeave:](self, "setTimeToLeave:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToLeave, 0);
  objc_storeStrong((id *)&self->_sourceAppId, 0);
  objc_storeStrong((id *)&self->_launchUri, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end