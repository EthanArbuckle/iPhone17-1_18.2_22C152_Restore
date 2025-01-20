@interface GEORPFeedbackTextField
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEdited;
- (BOOL)hasOriginal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackTextField)init;
- (GEORPFeedbackTextField)initWithData:(id)a3;
- (GEORPFeedbackTextField)initWithDictionary:(id)a3;
- (GEORPFeedbackTextField)initWithJSON:(id)a3;
- (NSString)edited;
- (NSString)original;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readEdited;
- (void)_readOriginal;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEdited:(id)a3;
- (void)setOriginal:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackTextField

- (GEORPFeedbackTextField)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackTextField;
  v2 = [(GEORPFeedbackTextField *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackTextField)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackTextField;
  v3 = [(GEORPFeedbackTextField *)&v7 initWithData:a3];
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
        GEORPFeedbackTextFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginal_tags_933);
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

- (NSString)original
{
  -[GEORPFeedbackTextField _readOriginal]((uint64_t)self);
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
        GEORPFeedbackTextFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEdited_tags_934);
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

- (NSString)edited
{
  -[GEORPFeedbackTextField _readEdited]((uint64_t)self);
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
  v8.super_class = (Class)GEORPFeedbackTextField;
  v4 = [(GEORPFeedbackTextField *)&v8 description];
  v5 = [(GEORPFeedbackTextField *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    id v3 = [a1 original];
    if (v3) {
      [v2 setObject:v3 forKey:@"original"];
    }

    v4 = [a1 edited];
    if (v4) {
      [v2 setObject:v4 forKey:@"edited"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEORPFeedbackTextField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackTextField *)-[GEORPFeedbackTextField _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"original"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = (void *)[v4 copy];
        [a1 setOriginal:v5];
      }
      objc_super v6 = [v3 objectForKeyedSubscript:@"edited"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setEdited:v7];
      }
    }
  }

  return a1;
}

- (GEORPFeedbackTextField)initWithJSON:(id)a3
{
  return (GEORPFeedbackTextField *)-[GEORPFeedbackTextField _initWithDictionary:isJSON:](self, a3);
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
      objc_super v8 = (int *)&readAll__recursiveTag_935;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_936;
    }
    GEORPFeedbackTextFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackTextFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackTextFieldReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
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
    [(GEORPFeedbackTextField *)self readAll:0];
    if (self->_original) {
      PBDataWriterWriteStringField();
    }
    if (self->_edited) {
      PBDataWriterWriteStringField();
    }
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPFeedbackTextField *)self readAll:0];
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
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
    [(GEORPFeedbackTextField *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_original copyWithZone:a3];
    v9 = (void *)v5[3];
    v5[3] = v8;

    uint64_t v10 = [(NSString *)self->_edited copyWithZone:a3];
    id v7 = (PBDataReader *)v5[2];
    v5[2] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPFeedbackTextFieldReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPFeedbackTextField *)self readAll:1],
         [v4 readAll:1],
         original = self->_original,
         !((unint64_t)original | v4[3]))
     || -[NSString isEqual:](original, "isEqual:")))
  {
    edited = self->_edited;
    if ((unint64_t)edited | v4[2]) {
      char v7 = -[NSString isEqual:](edited, "isEqual:");
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
  [(GEORPFeedbackTextField *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_original hash];
  return [(NSString *)self->_edited hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  [v4 readAll:0];
  if (v4[3]) {
    -[GEORPFeedbackTextField setOriginal:](self, "setOriginal:");
  }
  if (v4[2]) {
    -[GEORPFeedbackTextField setEdited:](self, "setEdited:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_original, 0);
  objc_storeStrong((id *)&self->_edited, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end