@interface GEOPDSearchToken
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSearchToken)init;
- (GEOPDSearchToken)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsAlternateForm:(uint64_t)a1;
- (void)addAlternateForm:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchToken

- (GEOPDSearchToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchToken;
  v2 = [(GEOPDSearchToken *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchToken)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchToken;
  v3 = [(GEOPDSearchToken *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addAlternateForm:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 2) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchTokenReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlternateForms_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    -[GEOPDSearchToken _addNoFlagsAlternateForm:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 64) |= 0x20u;
  }
}

- (void)_addNoFlagsAlternateForm:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchToken;
  v4 = [(GEOPDSearchToken *)&v8 description];
  id v5 = [(GEOPDSearchToken *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchToken _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDSearchToken readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSearchTokenReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProcessedValue_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v7 = *(id *)(a1 + 24);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"processedValue";
      }
      else {
        objc_super v8 = @"processed_value";
      }
      [v4 setObject:v7 forKey:v8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDSearchTokenReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRawValue_tags);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v11 = *(id *)(a1 + 32);
    if (v11)
    {
      if (a2) {
        v12 = @"rawValue";
      }
      else {
        v12 = @"raw_value";
      }
      [v4 setObject:v11 forKey:v12];
    }

    if (*(unsigned char *)(a1 + 64))
    {
      v13 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 60)];
      [v4 setObject:v13 forKey:@"position"];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v15 = *(id *)(a1 + 16);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v30 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = objc_msgSend(v19, "dictionaryRepresentation", (void)v29);
            }
            objc_msgSend(v14, "addObject:", v20, (void)v29);
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v16);
      }

      if (a2) {
        v21 = @"alternateForm";
      }
      else {
        v21 = @"alternate_form";
      }
      objc_msgSend(v4, "setObject:forKey:", v14, v21, (void)v29);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v22 = *(void **)(a1 + 8);
      if (v22)
      {
        id v23 = v22;
        objc_sync_enter(v23);
        GEOPDSearchTokenReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTokenSpan_tags);
        objc_sync_exit(v23);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    id v24 = *(id *)(a1 + 40);
    v25 = v24;
    if (v24)
    {
      if (a2)
      {
        v26 = [v24 jsonRepresentation];
        v27 = @"tokenSpan";
      }
      else
      {
        v26 = [v24 dictionaryRepresentation];
        v27 = @"token_span";
      }
      [v4 setObject:v26 forKey:v27];
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
  return -[GEOPDSearchToken _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_60;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_60;
      }
      GEOPDSearchTokenReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSearchTokenCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchTokenReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3E) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchToken readAll:]((uint64_t)self, 0);
    if (self->_processedValue) {
      PBDataWriterWriteStringField();
    }
    if (self->_rawValue) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_alternateForms;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_tokenSpan) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSearchTokenReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchToken readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_processedValue copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_rawValue copyWithZone:a3];
  long long v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_position;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_alternateForms;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        -[GEOPDSearchToken addAlternateForm:](v5, v17);
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  id v18 = [(GEOPDSearchTokenSpan *)self->_tokenSpan copyWithZone:a3];
  id v8 = *(id *)(v5 + 40);
  *(void *)(v5 + 40) = v18;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  -[GEOPDSearchToken readAll:]((uint64_t)self, 1);
  -[GEOPDSearchToken readAll:]((uint64_t)v4, 1);
  processedValue = self->_processedValue;
  if ((unint64_t)processedValue | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](processedValue, "isEqual:")) {
      goto LABEL_15;
    }
  }
  rawValue = self->_rawValue;
  if ((unint64_t)rawValue | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](rawValue, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_position != *((_DWORD *)v4 + 15)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  alternateForms = self->_alternateForms;
  if ((unint64_t)alternateForms | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](alternateForms, "isEqual:"))
  {
    goto LABEL_15;
  }
  tokenSpan = self->_tokenSpan;
  if ((unint64_t)tokenSpan | *((void *)v4 + 5)) {
    char v9 = -[GEOPDSearchTokenSpan isEqual:](tokenSpan, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDSearchToken readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_processedValue hash];
  NSUInteger v4 = [(NSString *)self->_rawValue hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_position;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = v4 ^ v3;
  uint64_t v7 = v5 ^ [(NSMutableArray *)self->_alternateForms hash];
  return v6 ^ v7 ^ [(GEOPDSearchTokenSpan *)self->_tokenSpan hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSpan, 0);
  objc_storeStrong((id *)&self->_rawValue, 0);
  objc_storeStrong((id *)&self->_processedValue, 0);
  objc_storeStrong((id *)&self->_alternateForms, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end