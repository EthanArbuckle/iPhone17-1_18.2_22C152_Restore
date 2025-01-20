@interface GEOPDSearchQueryTokenizerMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchQueryTokenizerMetadata)init;
- (GEOPDSearchQueryTokenizerMetadata)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryTokenizerMetadata

- (GEOPDSearchQueryTokenizerMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryTokenizerMetadata;
  v2 = [(GEOPDSearchQueryTokenizerMetadata *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryTokenizerMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryTokenizerMetadata;
  v3 = [(GEOPDSearchQueryTokenizerMetadata *)&v7 initWithData:a3];
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
  v8.super_class = (Class)GEOPDSearchQueryTokenizerMetadata;
  v4 = [(GEOPDSearchQueryTokenizerMetadata *)&v8 description];
  v5 = [(GEOPDSearchQueryTokenizerMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryTokenizerMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSearchQueryTokenizerMetadata readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchQueryTokenizerMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenSet_tags_2210);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v7 = *(id *)(a1 + 16);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"tokenSet";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"token_set";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v11 = *(int *)(a1 + 44);
      if (v11 >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_1E53E28E0[v11];
      }
      if (a2) {
        v13 = @"tokenizerType";
      }
      else {
        v13 = @"tokenizer_type";
      }
      [v4 setObject:v12 forKey:v13];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v14 = *(void **)(a1 + 8);
      if (v14)
      {
        id v15 = v14;
        objc_sync_enter(v15);
        GEOPDSearchQueryTokenizerMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenizerName_tags);
        objc_sync_exit(v15);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    id v16 = *(id *)(a1 + 24);
    if (v16)
    {
      if (a2) {
        v17 = @"tokenizerName";
      }
      else {
        v17 = @"tokenizer_name";
      }
      [v4 setObject:v16 forKey:v17];
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
  return -[GEOPDSearchQueryTokenizerMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_2223;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_2224;
      }
      GEOPDSearchQueryTokenizerMetadataReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDSearchTokenSet readAll:](*(void *)(a1 + 16), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_40;
  }
  if (a3) {
    id v7 = @"tokenSet";
  }
  else {
    id v7 = @"token_set";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [GEOPDSearchTokenSet alloc];
    if (v9) {
      v10 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v9, v8, a3);
    }
    else {
      v10 = 0;
    }
    id v11 = v10;
    *(unsigned char *)(v6 + 48) |= 2u;
    *(unsigned char *)(v6 + 48) |= 8u;
    objc_storeStrong((id *)(v6 + 16), v10);
  }
  if (a3) {
    v12 = @"tokenizerType";
  }
  else {
    v12 = @"tokenizer_type";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v13;
    if ([v14 isEqualToString:@"NONE"])
    {
      int v15 = 0;
    }
    else if ([v14 isEqualToString:@"TOKENIZER_STANDARD"])
    {
      int v15 = 1;
    }
    else if ([v14 isEqualToString:@"TOKENIZER_WHITESPACE"])
    {
      int v15 = 2;
    }
    else if ([v14 isEqualToString:@"TOKENIZER_ZH"])
    {
      int v15 = 3;
    }
    else if ([v14 isEqualToString:@"ANALYZER_ZH"])
    {
      int v15 = 4;
    }
    else if ([v14 isEqualToString:@"TOKENIZER_JP"])
    {
      int v15 = 5;
    }
    else if ([v14 isEqualToString:@"ANALYZER_JP"])
    {
      int v15 = 6;
    }
    else if ([v14 isEqualToString:@"GEO_SEARCH_TOKENIZER_CJK"])
    {
      int v15 = 7;
    }
    else
    {
      int v15 = 0;
    }

    goto LABEL_33;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v15 = [v13 intValue];
LABEL_33:
    *(unsigned char *)(v6 + 48) |= 8u;
    *(unsigned char *)(v6 + 48) |= 1u;
    *(_DWORD *)(v6 + 44) = v15;
  }

  if (a3) {
    id v16 = @"tokenizerName";
  }
  else {
    id v16 = @"tokenizer_name";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = (void *)[v17 copy];
    id v19 = v18;
    *(unsigned char *)(v6 + 48) |= 4u;
    *(unsigned char *)(v6 + 48) |= 8u;
    objc_storeStrong((id *)(v6 + 24), v18);
  }
LABEL_40:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryTokenizerMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchQueryTokenizerMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryTokenizerMetadata readAll:]((uint64_t)self, 0);
    if (self->_tokenSet) {
      PBDataWriterWriteSubmessage();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_tokenizerName) {
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
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchQueryTokenizerMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryTokenizerMetadata readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDSearchTokenSet *)self->_tokenSet copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 44) = self->_tokenizerType;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_tokenizerName copyWithZone:a3];
  id v8 = *(id *)(v5 + 24);
  *(void *)(v5 + 24) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  -[GEOPDSearchQueryTokenizerMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryTokenizerMetadata readAll:]((uint64_t)v4, 1);
  tokenSet = self->_tokenSet;
  if ((unint64_t)tokenSet | *((void *)v4 + 2))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](tokenSet, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_tokenizerType != *((_DWORD *)v4 + 11)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  tokenizerName = self->_tokenizerName;
  if ((unint64_t)tokenizerName | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](tokenizerName, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  -[GEOPDSearchQueryTokenizerMetadata readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDSearchTokenSet *)self->_tokenSet hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_tokenizerType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ [(NSString *)self->_tokenizerName hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizerName, 0);
  objc_storeStrong((id *)&self->_tokenSet, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end