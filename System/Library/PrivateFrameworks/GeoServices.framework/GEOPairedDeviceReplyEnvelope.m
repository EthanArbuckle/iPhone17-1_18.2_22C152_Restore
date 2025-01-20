@interface GEOPairedDeviceReplyEnvelope
+ (BOOL)isValid:(id)a3;
- (BOOL)hasMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPairedDeviceReply)success;
- (GEOPairedDeviceReplyEnvelope)init;
- (GEOPairedDeviceReplyEnvelope)initWithData:(id)a3;
- (GEOPairedDeviceReplyEnvelope)initWithDictionary:(id)a3;
- (GEOPairedDeviceReplyEnvelope)initWithJSON:(id)a3;
- (GEOPairedDeviceReplyError)error;
- (GEOPairedDeviceReplyMetadata)metadata;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)whichResult;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readMetadata;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)resetResult;
- (void)setError:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setSuccess:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPairedDeviceReplyEnvelope

- (GEOPairedDeviceReplyEnvelope)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPairedDeviceReplyEnvelope;
  v2 = [(GEOPairedDeviceReplyEnvelope *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPairedDeviceReplyEnvelope)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPairedDeviceReplyEnvelope;
  v3 = [(GEOPairedDeviceReplyEnvelope *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)resetResult
{
  success = self->_success;
  self->_success = 0;

  error = self->_error;
  self->_error = 0;

  self->_whichResult = 0;
}

- (void)_readMetadata
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
        GEOPairedDeviceReplyEnvelopeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetadata_tags_422);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (GEOPairedDeviceReplyMetadata)metadata
{
  -[GEOPairedDeviceReplyEnvelope _readMetadata]((uint64_t)self);
  metadata = self->_metadata;

  return metadata;
}

- (void)setMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (GEOPairedDeviceReply)success
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceReplyEnvelopeReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readSuccess_tags);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichResult == 1) {
    v5 = self->_success;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setSuccess:(id)a3
{
  v4 = (GEOPairedDeviceReply *)a3;
  *(unsigned char *)&self->_flags |= 0x18u;
  [(GEOPairedDeviceReplyEnvelope *)self resetResult];
  success = self->_success;
  self->_success = v4;

  if (v4) {
    self->_whichResult = 1;
  }
}

- (GEOPairedDeviceReplyError)error
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOPairedDeviceReplyEnvelopeReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readError_tags_0);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  if (self->_whichResult == 2) {
    v5 = self->_error;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)setError:(id)a3
{
  v4 = (GEOPairedDeviceReplyError *)a3;
  *(unsigned char *)&self->_flags |= 0x12u;
  [(GEOPairedDeviceReplyEnvelope *)self resetResult];
  error = self->_error;
  self->_error = v4;

  if (v4) {
    self->_whichResult = 2;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPairedDeviceReplyEnvelope;
  v4 = [(GEOPairedDeviceReplyEnvelope *)&v8 description];
  v5 = [(GEOPairedDeviceReplyEnvelope *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPairedDeviceReplyEnvelope _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_25;
  }
  [a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = a1[8];
  if (v5 == 2)
  {
    objc_super v8 = [a1 error];
    objc_super v7 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v9 = [v8 dictionaryRepresentation];
      }
      v10 = @"error";
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  if (v5 == 1)
  {
    objc_super v6 = [a1 success];
    objc_super v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      v9 = [v6 dictionaryRepresentation];
      }
      v10 = @"success";
LABEL_14:
      [v4 setObject:v9 forKey:v10];

      goto LABEL_15;
    }
    goto LABEL_15;
  }
LABEL_16:
  v11 = [a1 metadata];
  v12 = v11;
  if (v11)
  {
    if (a2) {
      [v11 jsonRepresentation];
    }
    else {
    v13 = [v11 dictionaryRepresentation];
    }
    [v4 setObject:v13 forKey:@"metadata"];
  }
  v14 = (void *)a1[2];
  if (v14)
  {
    v15 = [v14 dictionaryRepresentation];
    v16 = v15;
    if (a2)
    {
      v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __58__GEOPairedDeviceReplyEnvelope__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E53D8860;
      id v18 = v17;
      id v22 = v18;
      [v16 enumerateKeysAndObjectsUsingBlock:v21];
      id v19 = v18;

      v16 = v19;
    }
    [v4 setObject:v16 forKey:@"Unknown Fields"];
  }
LABEL_25:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPairedDeviceReplyEnvelope _dictionaryRepresentation:](self, 1);
}

void __58__GEOPairedDeviceReplyEnvelope__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPairedDeviceReplyEnvelope)initWithDictionary:(id)a3
{
  return (GEOPairedDeviceReplyEnvelope *)-[GEOPairedDeviceReplyEnvelope _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"metadata"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOPairedDeviceReplyMetadata alloc];
        if (a3) {
          uint64_t v8 = [(GEOPairedDeviceReplyMetadata *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOPairedDeviceReplyMetadata *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setMetadata:v8];
      }
    }
  }

  return a1;
}

- (GEOPairedDeviceReplyEnvelope)initWithJSON:(id)a3
{
  return (GEOPairedDeviceReplyEnvelope *)-[GEOPairedDeviceReplyEnvelope _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_430_0;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_431_0;
    }
    GEOPairedDeviceReplyEnvelopeReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOPairedDeviceReplyMetadata *)self->_metadata readAll:1];
    [(GEOPairedDeviceReply *)self->_success readAll:1];
    [(GEOPairedDeviceReplyError *)self->_error readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPairedDeviceReplyEnvelopeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPairedDeviceReplyEnvelopeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPairedDeviceReplyEnvelopeIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPairedDeviceReplyEnvelope *)self readAll:0];
    if (self->_metadata) {
      PBDataWriterWriteSubmessage();
    }
    unint64_t whichResult = self->_whichResult;
    id v6 = v9;
    if (whichResult == 1)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
      unint64_t whichResult = self->_whichResult;
    }
    if (whichResult == 2)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (void)copyTo:(id)a3
{
  id v10 = (id *)a3;
  [(GEOPairedDeviceReplyEnvelope *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 12) = self->_readerMarkPos;
  *((_DWORD *)v10 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPairedDeviceReplyEnvelope *)self resetResult];
  unint64_t whichResult = self->_whichResult;
  if (whichResult == 1)
  {
    id v5 = &OBJC_IVAR___GEOPairedDeviceReplyEnvelope__success;
  }
  else
  {
    if (whichResult != 2) {
      goto LABEL_6;
    }
    id v5 = &OBJC_IVAR___GEOPairedDeviceReplyEnvelope__error;
  }
  uint64_t v6 = *v5;
  id v7 = *(id *)((char *)&self->super.super.isa + v6);
  uint64_t v8 = *(id *)((char *)v10 + v6);
  *(id *)((char *)v10 + v6) = v7;

  unint64_t whichResult = self->_whichResult;
LABEL_6:
  id v9 = v10;
  v10[8] = (id)whichResult;
  if (self->_metadata)
  {
    objc_msgSend(v10, "setMetadata:");
    id v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPairedDeviceReplyEnvelope *)self readAll:0];
    unint64_t whichResult = self->_whichResult;
    if (whichResult == 2)
    {
      uint64_t v9 = 24;
    }
    else
    {
      if (whichResult != 1)
      {
LABEL_10:
        *(void *)(v5 + 64) = whichResult;
        id v12 = [(GEOPairedDeviceReplyMetadata *)self->_metadata copyWithZone:a3];
        v13 = *(void **)(v5 + 32);
        *(void *)(v5 + 32) = v12;

        objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
        return (id)v5;
      }
      uint64_t v9 = 40;
    }
    uint64_t v10 = [*(id *)((char *)&self->super.super.isa + v9) copyWithZone:a3];
    v11 = *(void **)(v5 + v9);
    *(void *)(v5 + v9) = v10;

    unint64_t whichResult = self->_whichResult;
    goto LABEL_10;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPairedDeviceReplyEnvelopeReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOPairedDeviceReplyEnvelope *)self readAll:1];
  [v4 readAll:1];
  unint64_t whichResult = self->_whichResult;
  if (whichResult != v4[8]) {
    goto LABEL_9;
  }
  if (whichResult != 2)
  {
    if (whichResult != 1 || [(GEOPairedDeviceReply *)self->_success isEqual:v4[5]]) {
      goto LABEL_6;
    }
LABEL_9:
    char v7 = 0;
    goto LABEL_10;
  }
  if (![(GEOPairedDeviceReplyError *)self->_error isEqual:v4[3]]) {
    goto LABEL_9;
  }
LABEL_6:
  metadata = self->_metadata;
  if ((unint64_t)metadata | v4[4]) {
    char v7 = -[GEOPairedDeviceReplyMetadata isEqual:](metadata, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  [(GEOPairedDeviceReplyEnvelope *)self readAll:1];
  BOOL v3 = &OBJC_IVAR___GEOPairedDeviceReplyEnvelope__success;
  unint64_t whichResult = self->_whichResult;
  uint64_t v5 = 2654435761u * whichResult;
  if (whichResult == 1) {
    goto LABEL_4;
  }
  if (whichResult == 2)
  {
    BOOL v3 = &OBJC_IVAR___GEOPairedDeviceReplyEnvelope__error;
LABEL_4:
    v5 ^= [*(id *)((char *)&self->super.super.isa + *v3) hash];
  }
  return [(GEOPairedDeviceReplyMetadata *)self->_metadata hash] ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v12 = a3;
  [v12 readAll:0];
  [(GEOPairedDeviceReplyEnvelope *)self resetResult];
  v4 = v12;
  uint64_t v5 = &OBJC_IVAR___GEOPairedDeviceReplyEnvelope__success;
  unint64_t v6 = v12[8];
  if (v6 != 1)
  {
    if (v6 != 2) {
      goto LABEL_5;
    }
    uint64_t v5 = &OBJC_IVAR___GEOPairedDeviceReplyEnvelope__error;
  }
  uint64_t v7 = *v5;
  uint64_t v8 = (objc_class *)*(id *)((char *)v12 + v7);
  uint64_t v9 = *(Class *)((char *)&self->super.super.isa + v7);
  *(Class *)((char *)&self->super.super.isa + v7) = v8;

  v4 = v12;
  unint64_t v6 = v12[8];
LABEL_5:
  self->_unint64_t whichResult = v6;
  metadata = self->_metadata;
  uint64_t v11 = v4[4];
  if (metadata)
  {
    if (!v11) {
      goto LABEL_11;
    }
    -[GEOPairedDeviceReplyMetadata mergeFrom:](metadata, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_11;
    }
    -[GEOPairedDeviceReplyEnvelope setMetadata:](self, "setMetadata:");
  }
  v4 = v12;
LABEL_11:
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
      GEOPairedDeviceReplyEnvelopeReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_435);
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
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPairedDeviceReplyEnvelope *)self readAll:0];
    [(GEOPairedDeviceReplyMetadata *)self->_metadata clearUnknownFields:1];
    [(GEOPairedDeviceReply *)self->_success clearUnknownFields:1];
    error = self->_error;
    [(GEOPairedDeviceReplyError *)error clearUnknownFields:1];
  }
}

- (unint64_t)whichResult
{
  return self->_whichResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_success, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end