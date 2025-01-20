@interface GEORPMerchantLookupFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)hasContext;
- (BOOL)hasCorrections;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPMerchantLookupContext)context;
- (GEORPMerchantLookupCorrections)corrections;
- (GEORPMerchantLookupFeedback)init;
- (GEORPMerchantLookupFeedback)initWithData:(id)a3;
- (GEORPMerchantLookupFeedback)initWithDictionary:(id)a3;
- (GEORPMerchantLookupFeedback)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readContext;
- (void)_readCorrections;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setCorrections:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPMerchantLookupFeedback

- (GEORPMerchantLookupFeedback)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPMerchantLookupFeedback;
  v2 = [(GEORPMerchantLookupFeedback *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPMerchantLookupFeedback)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPMerchantLookupFeedback;
  v3 = [(GEORPMerchantLookupFeedback *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readContext
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
        GEORPMerchantLookupFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContext_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (GEORPMerchantLookupContext)context
{
  -[GEORPMerchantLookupFeedback _readContext]((uint64_t)self);
  context = self->_context;

  return context;
}

- (void)setContext:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)_readCorrections
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
        GEORPMerchantLookupFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrections_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCorrections
{
  return self->_corrections != 0;
}

- (GEORPMerchantLookupCorrections)corrections
{
  -[GEORPMerchantLookupFeedback _readCorrections]((uint64_t)self);
  corrections = self->_corrections;

  return corrections;
}

- (void)setCorrections:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_corrections, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPMerchantLookupFeedback;
  v4 = [(GEORPMerchantLookupFeedback *)&v8 description];
  v5 = [(GEORPMerchantLookupFeedback *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPMerchantLookupFeedback _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 context];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"context"];
    }
    objc_super v8 = [a1 corrections];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"corrections"];
    }
    v11 = (void *)a1[2];
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __57__GEORPMerchantLookupFeedback__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEORPMerchantLookupFeedback _dictionaryRepresentation:](self, 1);
}

void __57__GEORPMerchantLookupFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPMerchantLookupFeedback)initWithDictionary:(id)a3
{
  return (GEORPMerchantLookupFeedback *)-[GEORPMerchantLookupFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"context"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEORPMerchantLookupContext alloc];
        if (a3) {
          uint64_t v8 = [(GEORPMerchantLookupContext *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEORPMerchantLookupContext *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setContext:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"corrections"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEORPMerchantLookupCorrections alloc];
        if (a3) {
          uint64_t v12 = [(GEORPMerchantLookupCorrections *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEORPMerchantLookupCorrections *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setCorrections:v12];
      }
    }
  }

  return a1;
}

- (GEORPMerchantLookupFeedback)initWithJSON:(id)a3
{
  return (GEORPMerchantLookupFeedback *)-[GEORPMerchantLookupFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_2773;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_2774;
    }
    GEORPMerchantLookupFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEORPMerchantLookupContext *)self->_context readAll:1];
    [(GEORPMerchantLookupCorrections *)self->_corrections readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPMerchantLookupFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPMerchantLookupFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPMerchantLookupFeedbackIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPMerchantLookupFeedback *)self readAll:0];
    if (self->_context) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_corrections)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPMerchantLookupFeedback _readContext]((uint64_t)self);
  context = self->_context;

  return [(GEORPMerchantLookupContext *)context hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEORPMerchantLookupFeedback *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_context) {
    objc_msgSend(v4, "setContext:");
  }
  if (self->_corrections) {
    objc_msgSend(v4, "setCorrections:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPMerchantLookupFeedback *)self readAll:0];
    id v8 = [(GEORPMerchantLookupContext *)self->_context copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    id v10 = [(GEORPMerchantLookupCorrections *)self->_corrections copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPMerchantLookupFeedbackReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPMerchantLookupFeedback *)self readAll:1],
         [v4 readAll:1],
         context = self->_context,
         !((unint64_t)context | v4[3]))
     || -[GEORPMerchantLookupContext isEqual:](context, "isEqual:")))
  {
    corrections = self->_corrections;
    if ((unint64_t)corrections | v4[4]) {
      char v7 = -[GEORPMerchantLookupCorrections isEqual:](corrections, "isEqual:");
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
  [(GEORPMerchantLookupFeedback *)self readAll:1];
  unint64_t v3 = [(GEORPMerchantLookupContext *)self->_context hash];
  return [(GEORPMerchantLookupCorrections *)self->_corrections hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  context = self->_context;
  uint64_t v5 = v8[3];
  if (context)
  {
    if (v5) {
      -[GEORPMerchantLookupContext mergeFrom:](context, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPMerchantLookupFeedback setContext:](self, "setContext:");
  }
  corrections = self->_corrections;
  uint64_t v7 = v8[4];
  if (corrections)
  {
    if (v7) {
      -[GEORPMerchantLookupCorrections mergeFrom:](corrections, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPMerchantLookupFeedback setCorrections:](self, "setCorrections:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPMerchantLookupFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2778);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPMerchantLookupFeedback *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_corrections, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end