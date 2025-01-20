@interface GEOLogMsgEventLogDiscard
+ (BOOL)isValid:(id)a3;
+ (Class)certificatesType;
- (BOOL)hasSignature;
- (BOOL)hasTrigger;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventLogDiscard)init;
- (GEOLogMsgEventLogDiscard)initWithData:(id)a3;
- (GEOLogMsgEventLogDiscard)initWithDictionary:(id)a3;
- (GEOLogMsgEventLogDiscard)initWithJSON:(id)a3;
- (NSData)signature;
- (NSMutableArray)certificates;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)certificatesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)triggerAsString:(int)a3;
- (int)StringAsTrigger:(id)a3;
- (int)trigger;
- (unint64_t)certificatesCount;
- (unint64_t)hash;
- (void)_addNoFlagsCertificates:(uint64_t)a1;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readCertificates;
- (void)_readSignature;
- (void)addCertificates:(id)a3;
- (void)clearCertificates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCertificates:(id)a3;
- (void)setHasTrigger:(BOOL)a3;
- (void)setSignature:(id)a3;
- (void)setTrigger:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventLogDiscard

- (GEOLogMsgEventLogDiscard)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventLogDiscard;
  v2 = [(GEOLogMsgEventLogDiscard *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventLogDiscard)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventLogDiscard;
  v3 = [(GEOLogMsgEventLogDiscard *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCertificates
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventLogDiscardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCertificates_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)certificates
{
  -[GEOLogMsgEventLogDiscard _readCertificates]((uint64_t)self);
  certificates = self->_certificates;

  return certificates;
}

- (void)setCertificates:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  certificates = self->_certificates;
  self->_certificates = v4;
}

- (void)clearCertificates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  certificates = self->_certificates;

  [(NSMutableArray *)certificates removeAllObjects];
}

- (void)addCertificates:(id)a3
{
  id v4 = a3;
  -[GEOLogMsgEventLogDiscard _readCertificates]((uint64_t)self);
  -[GEOLogMsgEventLogDiscard _addNoFlagsCertificates:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsCertificates:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)certificatesCount
{
  -[GEOLogMsgEventLogDiscard _readCertificates]((uint64_t)self);
  certificates = self->_certificates;

  return [(NSMutableArray *)certificates count];
}

- (id)certificatesAtIndex:(unint64_t)a3
{
  -[GEOLogMsgEventLogDiscard _readCertificates]((uint64_t)self);
  certificates = self->_certificates;

  return (id)[(NSMutableArray *)certificates objectAtIndex:a3];
}

+ (Class)certificatesType
{
  return (Class)objc_opt_class();
}

- (void)_readSignature
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventLogDiscardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSignature_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (NSData)signature
{
  -[GEOLogMsgEventLogDiscard _readSignature]((uint64_t)self);
  signature = self->_signature;

  return signature;
}

- (void)setSignature:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_signature, a3);
}

- (int)trigger
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_trigger;
  }
  else {
    return 0;
  }
}

- (void)setTrigger:(int)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_trigger = a3;
}

- (void)setHasTrigger:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasTrigger
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)triggerAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F7940[a3];
  }

  return v3;
}

- (int)StringAsTrigger:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LOG_DISCARD_TRIGGER_UNSPECIFIED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LOG_DISCARD_TRIGGER_POI_ENRICHMENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LOG_DISCARD_TRIGGER_RAP"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventLogDiscard;
  int v4 = [(GEOLogMsgEventLogDiscard *)&v8 description];
  id v5 = [(GEOLogMsgEventLogDiscard *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventLogDiscard _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 16))
    {
      if (a2)
      {
        id v5 = (void *)MEMORY[0x1E4F1CA48];
        objc_super v6 = [(id)a1 certificates];
        id v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        objc_super v8 = [(id)a1 certificates];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) base64EncodedStringWithOptions:0];
              [v7 addObject:v13];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v10);
        }
      }
      else
      {
        id v7 = [(id)a1 certificates];
      }
      [v4 setObject:v7 forKey:@"certificates"];
    }
    v14 = [(id)a1 signature];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 base64EncodedStringWithOptions:0];
        [v4 setObject:v16 forKey:@"signature"];
      }
      else
      {
        [v4 setObject:v14 forKey:@"signature"];
      }
    }

    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v17 = *(int *)(a1 + 44);
      if (v17 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 44));
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = off_1E53F7940[v17];
      }
      [v4 setObject:v18 forKey:@"trigger"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventLogDiscard _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventLogDiscard)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventLogDiscard *)-[GEOLogMsgEventLogDiscard _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      int v4 = [v3 objectForKeyedSubscript:@"certificates"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v5 = v4;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v20;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v20 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * v9);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                v12 = objc_msgSend(v11, "initWithBase64EncodedString:options:", v10, 0, (void)v19);
                [a1 addCertificates:v12];
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v7);
        }
      }
      v13 = [v3 objectForKeyedSubscript:@"signature"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v13 options:0];
        [a1 setSignature:v14];
      }
      v15 = [v3 objectForKeyedSubscript:@"trigger"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        if ([v16 isEqualToString:@"LOG_DISCARD_TRIGGER_UNSPECIFIED"])
        {
          uint64_t v17 = 0;
        }
        else if ([v16 isEqualToString:@"LOG_DISCARD_TRIGGER_POI_ENRICHMENT"])
        {
          uint64_t v17 = 1;
        }
        else if ([v16 isEqualToString:@"LOG_DISCARD_TRIGGER_RAP"])
        {
          uint64_t v17 = 2;
        }
        else
        {
          uint64_t v17 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_28:

          goto LABEL_29;
        }
        uint64_t v17 = [v15 intValue];
      }
      objc_msgSend(a1, "setTrigger:", v17, (void)v19);
      goto LABEL_28;
    }
  }
LABEL_29:

  return a1;
}

- (GEOLogMsgEventLogDiscard)initWithJSON:(id)a3
{
  return (GEOLogMsgEventLogDiscard *)-[GEOLogMsgEventLogDiscard _initWithDictionary:isJSON:](self, a3);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_3338;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_3339;
    }
    GEOLogMsgEventLogDiscardReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventLogDiscardIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventLogDiscardReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    uint64_t v10 = self->_reader;
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
    [(GEOLogMsgEventLogDiscard *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->_certificates;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteDataField();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (self->_signature) {
      PBDataWriterWriteDataField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOLogMsgEventLogDiscard *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOLogMsgEventLogDiscard *)self certificatesCount])
  {
    [v8 clearCertificates];
    unint64_t v4 = [(GEOLogMsgEventLogDiscard *)self certificatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgEventLogDiscard *)self certificatesAtIndex:i];
        [v8 addCertificates:v7];
      }
    }
  }
  if (self->_signature) {
    objc_msgSend(v8, "setSignature:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v8 + 11) = self->_trigger;
    *((unsigned char *)v8 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgEventLogDiscardReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventLogDiscard *)self readAll:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = self->_certificates;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [(id)v5 addCertificates:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSData *)self->_signature copyWithZone:a3];
  long long v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 44) = self->_trigger;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  [(GEOLogMsgEventLogDiscard *)self readAll:1];
  [v4 readAll:1];
  certificates = self->_certificates;
  if ((unint64_t)certificates | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](certificates, "isEqual:")) {
      goto LABEL_10;
    }
  }
  signature = self->_signature;
  if ((unint64_t)signature | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](signature, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 48) & 1) != 0 && self->_trigger == *((_DWORD *)v4 + 11))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventLogDiscard *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_certificates hash];
  uint64_t v4 = [(NSData *)self->_signature hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_trigger;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOLogMsgEventLogDiscard addCertificates:](self, "addCertificates:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 3)) {
    -[GEOLogMsgEventLogDiscard setSignature:](self, "setSignature:");
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_trigger = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_certificates, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end