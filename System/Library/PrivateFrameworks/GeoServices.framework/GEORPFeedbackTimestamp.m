@interface GEORPFeedbackTimestamp
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEdited;
- (BOOL)hasOriginal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackTimestamp)init;
- (GEORPFeedbackTimestamp)initWithData:(id)a3;
- (GEORPFeedbackTimestamp)initWithDictionary:(id)a3;
- (GEORPFeedbackTimestamp)initWithJSON:(id)a3;
- (GEORPTimestamp)edited;
- (GEORPTimestamp)original;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readEdited;
- (void)_readOriginal;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEdited:(id)a3;
- (void)setOriginal:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackTimestamp

- (GEORPFeedbackTimestamp)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackTimestamp;
  v2 = [(GEORPFeedbackTimestamp *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackTimestamp)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackTimestamp;
  v3 = [(GEORPFeedbackTimestamp *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginal
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
        GEORPFeedbackTimestampReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginal_tags_1032);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasOriginal
{
  return self->_original != 0;
}

- (GEORPTimestamp)original
{
  -[GEORPFeedbackTimestamp _readOriginal]((uint64_t)self);
  original = self->_original;

  return original;
}

- (void)setOriginal:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_original, a3);
}

- (void)_readEdited
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
        GEORPFeedbackTimestampReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEdited_tags_1033);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasEdited
{
  return self->_edited != 0;
}

- (GEORPTimestamp)edited
{
  -[GEORPFeedbackTimestamp _readEdited]((uint64_t)self);
  edited = self->_edited;

  return edited;
}

- (void)setEdited:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_edited, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackTimestamp;
  v4 = [(GEORPFeedbackTimestamp *)&v8 description];
  v5 = [(GEORPFeedbackTimestamp *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackTimestamp _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 original];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"original"];
    }
    objc_super v8 = [a1 edited];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"edited"];
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
  return -[GEORPFeedbackTimestamp _dictionaryRepresentation:](self, 1);
}

- (GEORPFeedbackTimestamp)initWithDictionary:(id)a3
{
  return (GEORPFeedbackTimestamp *)-[GEORPFeedbackTimestamp _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"original"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEORPTimestamp alloc];
        if (a3) {
          uint64_t v8 = [(GEORPTimestamp *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEORPTimestamp *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setOriginal:v8];
      }
      v10 = [v5 objectForKeyedSubscript:@"edited"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEORPTimestamp alloc];
        if (a3) {
          uint64_t v12 = [(GEORPTimestamp *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEORPTimestamp *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setEdited:v12];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackTimestamp)initWithJSON:(id)a3
{
  return (GEORPFeedbackTimestamp *)-[GEORPFeedbackTimestamp _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_1035;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_1036;
    }
    GEORPFeedbackTimestampReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPTimestamp *)self->_original readAll:1];
    [(GEORPTimestamp *)self->_edited readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackTimestampIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackTimestampReadAllFrom((uint64_t)self, a3, 0);
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
    [(GEORPFeedbackTimestamp *)self readAll:0];
    if (self->_original) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_edited) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPFeedbackTimestamp *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_original) {
    objc_msgSend(v4, "setOriginal:");
  }
  if (self->_edited) {
    objc_msgSend(v4, "setEdited:");
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
    [(GEORPFeedbackTimestamp *)self readAll:0];
    id v8 = [(GEORPTimestamp *)self->_original copyWithZone:a3];
    v9 = (void *)v5[3];
    v5[3] = v8;

    id v10 = [(GEORPTimestamp *)self->_edited copyWithZone:a3];
    id v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackTimestampReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackTimestamp *)self readAll:1],
         [v4 readAll:1],
         original = self->_original,
         !((unint64_t)original | v4[3]))
     || -[GEORPTimestamp isEqual:](original, "isEqual:")))
  {
    edited = self->_edited;
    if ((unint64_t)edited | v4[2]) {
      char v7 = -[GEORPTimestamp isEqual:](edited, "isEqual:");
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
  [(GEORPFeedbackTimestamp *)self readAll:1];
  unint64_t v3 = [(GEORPTimestamp *)self->_original hash];
  return [(GEORPTimestamp *)self->_edited hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  original = self->_original;
  uint64_t v5 = v8[3];
  if (original)
  {
    if (v5) {
      -[GEORPTimestamp mergeFrom:](original, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPFeedbackTimestamp setOriginal:](self, "setOriginal:");
  }
  edited = self->_edited;
  uint64_t v7 = v8[2];
  if (edited)
  {
    if (v7) {
      -[GEORPTimestamp mergeFrom:](edited, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPFeedbackTimestamp setEdited:](self, "setEdited:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_original, 0);
  objc_storeStrong((id *)&self->_edited, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end