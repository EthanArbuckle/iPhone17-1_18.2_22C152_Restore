@interface GEORPFeedbackTransitLine
+ (BOOL)isValid:(id)a3;
- (BOOL)hasTransitLineMuid;
- (BOOL)hasTransitLineName;
- (BOOL)hasTransitSystemName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackTransitLine)init;
- (GEORPFeedbackTransitLine)initWithData:(id)a3;
- (GEORPFeedbackTransitLine)initWithDictionary:(id)a3;
- (GEORPFeedbackTransitLine)initWithJSON:(id)a3;
- (NSString)transitLineMuid;
- (NSString)transitLineName;
- (NSString)transitSystemName;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readTransitLineMuid;
- (void)_readTransitLineName;
- (void)_readTransitSystemName;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setTransitLineMuid:(id)a3;
- (void)setTransitLineName:(id)a3;
- (void)setTransitSystemName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackTransitLine

- (GEORPFeedbackTransitLine)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackTransitLine;
  v2 = [(GEORPFeedbackTransitLine *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackTransitLine)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackTransitLine;
  v3 = [(GEORPFeedbackTransitLine *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTransitLineMuid
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
        GEORPFeedbackTransitLineReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitLineMuid_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitLineMuid
{
  return self->_transitLineMuid != 0;
}

- (NSString)transitLineMuid
{
  -[GEORPFeedbackTransitLine _readTransitLineMuid]((uint64_t)self);
  transitLineMuid = self->_transitLineMuid;

  return transitLineMuid;
}

- (void)setTransitLineMuid:(id)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_transitLineMuid, a3);
}

- (void)_readTransitLineName
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
        GEORPFeedbackTransitLineReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitLineName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitLineName
{
  return self->_transitLineName != 0;
}

- (NSString)transitLineName
{
  -[GEORPFeedbackTransitLine _readTransitLineName]((uint64_t)self);
  transitLineName = self->_transitLineName;

  return transitLineName;
}

- (void)setTransitLineName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_transitLineName, a3);
}

- (void)_readTransitSystemName
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
        GEORPFeedbackTransitLineReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitSystemName_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTransitSystemName
{
  return self->_transitSystemName != 0;
}

- (NSString)transitSystemName
{
  -[GEORPFeedbackTransitLine _readTransitSystemName]((uint64_t)self);
  transitSystemName = self->_transitSystemName;

  return transitSystemName;
}

- (void)setTransitSystemName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_transitSystemName, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackTransitLine;
  v4 = [(GEORPFeedbackTransitLine *)&v8 description];
  v5 = [(GEORPFeedbackTransitLine *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackTransitLine _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 transitLineMuid];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"transitLineMuid";
      }
      else {
        objc_super v6 = @"transit_line_muid";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 transitLineName];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"transitLineName";
      }
      else {
        objc_super v8 = @"transit_line_name";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [a1 transitSystemName];
    if (v9)
    {
      if (a2) {
        v10 = @"transitSystemName";
      }
      else {
        v10 = @"transit_system_name";
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
  return -[GEORPFeedbackTransitLine _dictionaryRepresentation:](self, 1);
}

- (GEORPFeedbackTransitLine)initWithDictionary:(id)a3
{
  return (GEORPFeedbackTransitLine *)-[GEORPFeedbackTransitLine _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"transitLineMuid";
      }
      else {
        objc_super v6 = @"transit_line_muid";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setTransitLineMuid:v8];
      }
      if (a3) {
        v9 = @"transitLineName";
      }
      else {
        v9 = @"transit_line_name";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setTransitLineName:v11];
      }
      if (a3) {
        v12 = @"transitSystemName";
      }
      else {
        v12 = @"transit_system_name";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setTransitSystemName:v14];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackTransitLine)initWithJSON:(id)a3
{
  return (GEORPFeedbackTransitLine *)-[GEORPFeedbackTransitLine _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1066;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1067;
    }
    GEORPFeedbackTransitLineReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackTransitLineIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackTransitLineReadAllFrom((uint64_t)self, a3, 0);
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
    [(GEORPFeedbackTransitLine *)self readAll:0];
    if (self->_transitLineMuid) {
      PBDataWriterWriteStringField();
    }
    if (self->_transitLineName) {
      PBDataWriterWriteStringField();
    }
    if (self->_transitSystemName) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPFeedbackTransitLine *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_transitLineMuid) {
    objc_msgSend(v5, "setTransitLineMuid:");
  }
  if (self->_transitLineName) {
    objc_msgSend(v5, "setTransitLineName:");
  }
  v4 = v5;
  if (self->_transitSystemName)
  {
    objc_msgSend(v5, "setTransitSystemName:");
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
    [(GEORPFeedbackTransitLine *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_transitLineMuid copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [(NSString *)self->_transitLineName copyWithZone:a3];
    v11 = (void *)v5[3];
    v5[3] = v10;

    uint64_t v12 = [(NSString *)self->_transitSystemName copyWithZone:a3];
    id v7 = (PBDataReader *)v5[4];
    v5[4] = v12;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackTransitLineReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackTransitLine *)self readAll:1],
         [v4 readAll:1],
         transitLineMuid = self->_transitLineMuid,
         !((unint64_t)transitLineMuid | v4[2]))
     || -[NSString isEqual:](transitLineMuid, "isEqual:"))
    && ((transitLineName = self->_transitLineName, !((unint64_t)transitLineName | v4[3]))
     || -[NSString isEqual:](transitLineName, "isEqual:")))
  {
    transitSystemName = self->_transitSystemName;
    if ((unint64_t)transitSystemName | v4[4]) {
      char v8 = -[NSString isEqual:](transitSystemName, "isEqual:");
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
  [(GEORPFeedbackTransitLine *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_transitLineMuid hash];
  NSUInteger v4 = [(NSString *)self->_transitLineName hash] ^ v3;
  return v4 ^ [(NSString *)self->_transitSystemName hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEORPFeedbackTransitLine setTransitLineMuid:](self, "setTransitLineMuid:");
  }
  if (v4[3]) {
    -[GEORPFeedbackTransitLine setTransitLineName:](self, "setTransitLineName:");
  }
  if (v4[4]) {
    -[GEORPFeedbackTransitLine setTransitSystemName:](self, "setTransitSystemName:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitSystemName, 0);
  objc_storeStrong((id *)&self->_transitLineName, 0);
  objc_storeStrong((id *)&self->_transitLineMuid, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end