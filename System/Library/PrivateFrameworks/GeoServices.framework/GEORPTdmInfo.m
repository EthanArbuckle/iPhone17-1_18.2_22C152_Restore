@interface GEORPTdmInfo
+ (BOOL)isValid:(id)a3;
+ (Class)baaCertificatesType;
- (BOOL)hasAnonymousUserId;
- (BOOL)hasBaaSignature;
- (BOOL)hasIsBlocked;
- (BOOL)hasIsTrusted;
- (BOOL)isBlocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTrusted;
- (BOOL)readFrom:(id)a3;
- (GEORPTdmInfo)init;
- (GEORPTdmInfo)initWithData:(id)a3;
- (GEORPTdmInfo)initWithDictionary:(id)a3;
- (GEORPTdmInfo)initWithJSON:(id)a3;
- (NSData)baaSignature;
- (NSMutableArray)baaCertificates;
- (NSString)anonymousUserId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)baaCertificatesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)baaCertificatesCount;
- (unint64_t)hash;
- (void)_addNoFlagsBaaCertificates:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAnonymousUserId;
- (void)_readBaaCertificates;
- (void)_readBaaSignature;
- (void)addBaaCertificates:(id)a3;
- (void)clearBaaCertificates;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAnonymousUserId:(id)a3;
- (void)setBaaCertificates:(id)a3;
- (void)setBaaSignature:(id)a3;
- (void)setHasIsBlocked:(BOOL)a3;
- (void)setHasIsTrusted:(BOOL)a3;
- (void)setIsBlocked:(BOOL)a3;
- (void)setIsTrusted:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPTdmInfo

- (void)clearBaaCertificates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  baaCertificates = self->_baaCertificates;

  [(NSMutableArray *)baaCertificates removeAllObjects];
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"anonymousUserId";
      }
      else {
        v6 = @"anonymous_user_id";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = (void *)[v7 copy];
        [a1 setAnonymousUserId:v8];
      }
      if (a3) {
        v9 = @"isBlocked";
      }
      else {
        v9 = @"is_blocked";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsBlocked:", objc_msgSend(v10, "BOOLValue"));
      }

      if (a3) {
        v11 = @"baaCertificates";
      }
      else {
        v11 = @"baa_certificates";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v26 = a3;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v28;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v28 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * v17);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v18 options:0];
                [a1 addBaaCertificates:v19];
              }
              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v15);
        }

        a3 = v26;
      }

      if (a3) {
        v20 = @"baaSignature";
      }
      else {
        v20 = @"baa_signature";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v21 options:0];
        [a1 setBaaSignature:v22];
      }
      if (a3) {
        v23 = @"isTrusted";
      }
      else {
        v23 = @"is_trusted";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsTrusted:", objc_msgSend(v24, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPTdmInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_17;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPTdmInfo *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_anonymousUserId copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 60) = self->_isBlocked;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v11 = self->_baaCertificates;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        [(id)v5 addBaaCertificates:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [(NSData *)self->_baaSignature copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v16;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 61) = self->_isTrusted;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  uint64_t v18 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v18;
LABEL_17:

  return (id)v5;
}

- (unint64_t)hash
{
  [(GEORPTdmInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_anonymousUserId hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_isBlocked;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_baaCertificates hash];
  uint64_t v6 = [(NSData *)self->_baaSignature hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_isTrusted;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    unint64_t v4 = 0x1E4F1C000uLL;
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v6 = [(id)a1 anonymousUserId];
    if (v6)
    {
      if (a2) {
        uint64_t v7 = @"anonymousUserId";
      }
      else {
        uint64_t v7 = @"anonymous_user_id";
      }
      [v5 setObject:v6 forKey:v7];
    }

    unint64_t v8 = 0x1E4F28000uLL;
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 60)];
      if (a2) {
        v10 = @"isBlocked";
      }
      else {
        v10 = @"is_blocked";
      }
      [v5 setObject:v9 forKey:v10];
    }
    if (*(void *)(a1 + 32))
    {
      if (a2)
      {
        v11 = (void *)MEMORY[0x1E4F1CA48];
        uint64_t v12 = [(id)a1 baaCertificates];
        uint64_t v13 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));

        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v14 = [(id)a1 baaCertificates];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v36 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = [*(id *)(*((void *)&v35 + 1) + 8 * i) base64EncodedStringWithOptions:0];
              [v13 addObject:v19];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
          }
          while (v16);
        }

        [v5 setObject:v13 forKey:@"baaCertificates"];
        unint64_t v4 = 0x1E4F1C000;
        unint64_t v8 = 0x1E4F28000;
      }
      else
      {
        long long v20 = [(id)a1 baaCertificates];
        [v5 setObject:v20 forKey:@"baa_certificates"];
      }
    }
    long long v21 = [(id)a1 baaSignature];
    long long v22 = v21;
    if (v21)
    {
      if (a2)
      {
        long long v23 = [v21 base64EncodedStringWithOptions:0];
        [v5 setObject:v23 forKey:@"baaSignature"];
      }
      else
      {
        [v5 setObject:v21 forKey:@"baa_signature"];
      }
    }

    if ((*(unsigned char *)(a1 + 64) & 2) != 0)
    {
      v24 = [*(id *)(v8 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 61)];
      if (a2) {
        uint64_t v25 = @"isTrusted";
      }
      else {
        uint64_t v25 = @"is_trusted";
      }
      [v5 setObject:v24 forKey:v25];
    }
    int v26 = *(void **)(a1 + 16);
    if (v26)
    {
      long long v27 = [v26 dictionaryRepresentation];
      long long v28 = v27;
      if (a2)
      {
        long long v29 = objc_msgSend(*(id *)(v4 + 2656), "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __42__GEORPTdmInfo__dictionaryRepresentation___block_invoke;
        v33[3] = &unk_1E53D8860;
        id v30 = v29;
        id v34 = v30;
        [v28 enumerateKeysAndObjectsUsingBlock:v33];
        id v31 = v30;

        long long v28 = v31;
      }
      [v5 setObject:v28 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (GEORPTdmInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPTdmInfo;
  v2 = [(GEORPTdmInfo *)&v6 init];
  NSUInteger v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    unint64_t v4 = v2;
  }

  return v3;
}

- (GEORPTdmInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPTdmInfo;
  NSUInteger v3 = [(GEORPTdmInfo *)&v7 initWithData:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readAnonymousUserId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnonymousUserId_tags_3645);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAnonymousUserId
{
  return self->_anonymousUserId != 0;
}

- (NSString)anonymousUserId
{
  -[GEORPTdmInfo _readAnonymousUserId]((uint64_t)self);
  anonymousUserId = self->_anonymousUserId;

  return anonymousUserId;
}

- (void)setAnonymousUserId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_anonymousUserId, a3);
}

- (BOOL)isBlocked
{
  return self->_isBlocked;
}

- (void)setIsBlocked:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_isBlocked = a3;
}

- (void)setHasIsBlocked:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasIsBlocked
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readBaaCertificates
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBaaCertificates_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)baaCertificates
{
  -[GEORPTdmInfo _readBaaCertificates]((uint64_t)self);
  baaCertificates = self->_baaCertificates;

  return baaCertificates;
}

- (void)setBaaCertificates:(id)a3
{
  unint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
  baaCertificates = self->_baaCertificates;
  self->_baaCertificates = v4;
}

- (void)addBaaCertificates:(id)a3
{
  id v4 = a3;
  -[GEORPTdmInfo _readBaaCertificates]((uint64_t)self);
  -[GEORPTdmInfo _addNoFlagsBaaCertificates:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsBaaCertificates:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)baaCertificatesCount
{
  -[GEORPTdmInfo _readBaaCertificates]((uint64_t)self);
  baaCertificates = self->_baaCertificates;

  return [(NSMutableArray *)baaCertificates count];
}

- (id)baaCertificatesAtIndex:(unint64_t)a3
{
  -[GEORPTdmInfo _readBaaCertificates]((uint64_t)self);
  baaCertificates = self->_baaCertificates;

  return (id)[(NSMutableArray *)baaCertificates objectAtIndex:a3];
}

+ (Class)baaCertificatesType
{
  return (Class)objc_opt_class();
}

- (void)_readBaaSignature
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPTdmInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBaaSignature_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasBaaSignature
{
  return self->_baaSignature != 0;
}

- (NSData)baaSignature
{
  -[GEORPTdmInfo _readBaaSignature]((uint64_t)self);
  baaSignature = self->_baaSignature;

  return baaSignature;
}

- (void)setBaaSignature:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_baaSignature, a3);
}

- (BOOL)isTrusted
{
  return self->_isTrusted;
}

- (void)setIsTrusted:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_isTrusted = a3;
}

- (void)setHasIsTrusted:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsTrusted
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPTdmInfo;
  id v4 = [(GEORPTdmInfo *)&v8 description];
  id v5 = [(GEORPTdmInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPTdmInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEORPTdmInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __42__GEORPTdmInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORPTdmInfo)initWithDictionary:(id)a3
{
  return (GEORPTdmInfo *)-[GEORPTdmInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEORPTdmInfo)initWithJSON:(id)a3
{
  return (GEORPTdmInfo *)-[GEORPTdmInfo _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_3670;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3671;
    }
    GEORPTdmInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTdmInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTdmInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x78) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPTdmInfo *)self readAll:0];
    if (self->_anonymousUserId) {
      PBDataWriterWriteStringField();
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_baaCertificates;
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

    if (self->_baaSignature) {
      PBDataWriterWriteDataField();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEORPTdmInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_anonymousUserId) {
    objc_msgSend(v8, "setAnonymousUserId:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v8 + 60) = self->_isBlocked;
    *((unsigned char *)v8 + 64) |= 1u;
  }
  if ([(GEORPTdmInfo *)self baaCertificatesCount])
  {
    [v8 clearBaaCertificates];
    unint64_t v4 = [(GEORPTdmInfo *)self baaCertificatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPTdmInfo *)self baaCertificatesAtIndex:i];
        [v8 addBaaCertificates:v7];
      }
    }
  }
  if (self->_baaSignature) {
    objc_msgSend(v8, "setBaaSignature:");
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v8 + 61) = self->_isTrusted;
    *((unsigned char *)v8 + 64) |= 2u;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEORPTdmInfo *)self readAll:1];
  [v4 readAll:1];
  anonymousUserId = self->_anonymousUserId;
  if ((unint64_t)anonymousUserId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](anonymousUserId, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0) {
      goto LABEL_18;
    }
    if (self->_isBlocked)
    {
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_18;
      }
    }
    else if (*((unsigned char *)v4 + 60))
    {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_18;
  }
  baaCertificates = self->_baaCertificates;
  if ((unint64_t)baaCertificates | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](baaCertificates, "isEqual:"))
  {
    goto LABEL_18;
  }
  baaSignature = self->_baaSignature;
  if ((unint64_t)baaSignature | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](baaSignature, "isEqual:")) {
      goto LABEL_18;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 64) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) != 0)
    {
      if (self->_isTrusted)
      {
        if (!*((unsigned char *)v4 + 61)) {
          goto LABEL_18;
        }
      }
      else if (*((unsigned char *)v4 + 61))
      {
        goto LABEL_18;
      }
      BOOL v8 = 1;
      goto LABEL_19;
    }
LABEL_18:
    BOOL v8 = 0;
  }
LABEL_19:

  return v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 3)) {
    -[GEORPTdmInfo setAnonymousUserId:](self, "setAnonymousUserId:");
  }
  if (*((unsigned char *)v4 + 64))
  {
    self->_isBlocked = *((unsigned char *)v4 + 60);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 4);
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
        -[GEORPTdmInfo addBaaCertificates:](self, "addBaaCertificates:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 5)) {
    -[GEORPTdmInfo setBaaSignature:](self, "setBaaSignature:");
  }
  if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    self->_isTrusted = *((unsigned char *)v4 + 61);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEORPTdmInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3675);
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
  *(unsigned char *)&self->_flags |= 0x44u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPTdmInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baaSignature, 0);
  objc_storeStrong((id *)&self->_baaCertificates, 0);
  objc_storeStrong((id *)&self->_anonymousUserId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end