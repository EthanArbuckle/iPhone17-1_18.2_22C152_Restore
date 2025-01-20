@interface GEOPDSearchQueryNeuralRewriteMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryNeuralRewriteMetadata)init;
- (GEOPDSearchQueryNeuralRewriteMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryNeuralRewriteMetadata

- (GEOPDSearchQueryNeuralRewriteMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryNeuralRewriteMetadata;
  v2 = [(GEOPDSearchQueryNeuralRewriteMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryNeuralRewriteMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryNeuralRewriteMetadata;
  v3 = [(GEOPDSearchQueryNeuralRewriteMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQueryNeuralRewriteMetadata;
  v4 = [(GEOPDSearchQueryNeuralRewriteMetadata *)&v8 description];
  v5 = [(GEOPDSearchQueryNeuralRewriteMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryNeuralRewriteMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchQueryNeuralRewriteMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQueryNeuralRewriteMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readModelId_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v7 = *(id *)(a1 + 24);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"modelId";
      }
      else {
        objc_super v8 = @"model_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if (*(unsigned char *)(a1 + 56))
    {
      LODWORD(v9) = *(_DWORD *)(a1 + 52);
      v10 = [NSNumber numberWithFloat:v9];
      if (a2) {
        v11 = @"modelScore";
      }
      else {
        v11 = @"model_score";
      }
      [v4 setObject:v10 forKey:v11];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 2) == 0)
    {
      v12 = *(void **)(a1 + 8);
      if (v12)
      {
        id v13 = v12;
        objc_sync_enter(v13);
        GEOPDSearchQueryNeuralRewriteMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInputQuery_tags);
        objc_sync_exit(v13);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v14 = *(id *)(a1 + 16);
    if (v14)
    {
      if (a2) {
        v15 = @"inputQuery";
      }
      else {
        v15 = @"input_query";
      }
      [v4 setObject:v14 forKey:v15];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v16 = *(void **)(a1 + 8);
      if (v16)
      {
        id v17 = v16;
        objc_sync_enter(v17);
        GEOPDSearchQueryNeuralRewriteMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRewrittenQuery_tags_1886);
        objc_sync_exit(v17);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    id v18 = *(id *)(a1 + 32);
    if (v18)
    {
      if (a2) {
        v19 = @"rewrittenQuery";
      }
      else {
        v19 = @"rewritten_query";
      }
      [v4 setObject:v18 forKey:v19];
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
  return -[GEOPDSearchQueryNeuralRewriteMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_1905;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_1906;
      }
      GEOPDSearchQueryNeuralRewriteMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryNeuralRewriteMetadataReadAllFrom((uint64_t)self, a3, 0);
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
    id v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryNeuralRewriteMetadata readAll:]((uint64_t)self, 0);
    if (self->_modelId) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteFloatField();
    }
    if (self->_inputQuery) {
      PBDataWriterWriteStringField();
    }
    if (self->_rewrittenQuery) {
      PBDataWriterWriteStringField();
    }
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
      GEOPDSearchQueryNeuralRewriteMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryNeuralRewriteMetadata readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_modelId copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(float *)(v5 + 52) = self->_modelScore;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_inputQuery copyWithZone:a3];
  v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  uint64_t v13 = [(NSString *)self->_rewrittenQuery copyWithZone:a3];
  id v8 = *(id *)(v5 + 32);
  *(void *)(v5 + 32) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  -[GEOPDSearchQueryNeuralRewriteMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryNeuralRewriteMetadata readAll:]((uint64_t)v4, 1);
  modelId = self->_modelId;
  if ((unint64_t)modelId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](modelId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_modelScore != *((float *)v4 + 13)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  inputQuery = self->_inputQuery;
  if ((unint64_t)inputQuery | *((void *)v4 + 2) && !-[NSString isEqual:](inputQuery, "isEqual:")) {
    goto LABEL_13;
  }
  rewrittenQuery = self->_rewrittenQuery;
  if ((unint64_t)rewrittenQuery | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](rewrittenQuery, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDSearchQueryNeuralRewriteMetadata readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_modelId hash];
  if (*(unsigned char *)&self->_flags)
  {
    float modelScore = self->_modelScore;
    double v6 = modelScore;
    if (modelScore < 0.0) {
      double v6 = -modelScore;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unint64_t v9 = v4 ^ v3;
  NSUInteger v10 = [(NSString *)self->_inputQuery hash];
  return v9 ^ v10 ^ [(NSString *)self->_rewrittenQuery hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenQuery, 0);
  objc_storeStrong((id *)&self->_modelId, 0);
  objc_storeStrong((id *)&self->_inputQuery, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end