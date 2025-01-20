@interface GEOAddressCorrectionInitRequest
+ (BOOL)isValid:(id)a3;
- (BOOL)hasPersonID;
- (BOOL)hasSupportsCollectionByRegion;
- (BOOL)hasSupportsMultipleAddresses;
- (BOOL)hasToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsCollectionByRegion;
- (BOOL)supportsMultipleAddresses;
- (Class)responseClass;
- (GEOAddressCorrectionInitRequest)init;
- (GEOAddressCorrectionInitRequest)initWithData:(id)a3;
- (GEOAddressCorrectionInitRequest)initWithDictionary:(id)a3;
- (GEOAddressCorrectionInitRequest)initWithJSON:(id)a3;
- (NSString)personID;
- (NSString)token;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readPersonID;
- (void)_readToken;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasSupportsCollectionByRegion:(BOOL)a3;
- (void)setHasSupportsMultipleAddresses:(BOOL)a3;
- (void)setPersonID:(id)a3;
- (void)setSupportsCollectionByRegion:(BOOL)a3;
- (void)setSupportsMultipleAddresses:(BOOL)a3;
- (void)setToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAddressCorrectionInitRequest

- (GEOAddressCorrectionInitRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAddressCorrectionInitRequest;
  v2 = [(GEOAddressCorrectionInitRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAddressCorrectionInitRequest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAddressCorrectionInitRequest;
  v3 = [(GEOAddressCorrectionInitRequest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readToken
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 48) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAddressCorrectionInitRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readToken_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (NSString)token
{
  -[GEOAddressCorrectionInitRequest _readToken]((uint64_t)self);
  token = self->_token;

  return token;
}

- (void)setToken:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_token, a3);
}

- (void)_readPersonID
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
        GEOAddressCorrectionInitRequestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPersonID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasPersonID
{
  return self->_personID != 0;
}

- (NSString)personID
{
  -[GEOAddressCorrectionInitRequest _readPersonID]((uint64_t)self);
  personID = self->_personID;

  return personID;
}

- (void)setPersonID:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_personID, a3);
}

- (BOOL)supportsMultipleAddresses
{
  return self->_supportsMultipleAddresses;
}

- (void)setSupportsMultipleAddresses:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  self->_supportsMultipleAddresses = a3;
}

- (void)setHasSupportsMultipleAddresses:(BOOL)a3
{
  if (a3) {
    char v3 = 18;
  }
  else {
    char v3 = 16;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSupportsMultipleAddresses
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)supportsCollectionByRegion
{
  return self->_supportsCollectionByRegion;
}

- (void)setSupportsCollectionByRegion:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_supportsCollectionByRegion = a3;
}

- (void)setHasSupportsCollectionByRegion:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasSupportsCollectionByRegion
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAddressCorrectionInitRequest;
  v4 = [(GEOAddressCorrectionInitRequest *)&v8 description];
  v5 = [(GEOAddressCorrectionInitRequest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    char v3 = [a1 token];
    if (v3) {
      [v2 setObject:v3 forKey:@"token"];
    }

    v4 = [a1 personID];
    if (v4) {
      [v2 setObject:v4 forKey:@"personID"];
    }

    unsigned __int8 v5 = a1[48];
    if ((v5 & 2) != 0)
    {
      objc_super v6 = [NSNumber numberWithBool:a1[45]];
      [v2 setObject:v6 forKey:@"supportsMultipleAddresses"];

      unsigned __int8 v5 = a1[48];
    }
    if (v5)
    {
      objc_super v7 = [NSNumber numberWithBool:a1[44]];
      [v2 setObject:v7 forKey:@"supportsCollectionByRegion"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEOAddressCorrectionInitRequest)initWithDictionary:(id)a3
{
  return (GEOAddressCorrectionInitRequest *)-[GEOAddressCorrectionInitRequest _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"token"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned __int8 v5 = (void *)[v4 copy];
        [a1 setToken:v5];
      }
      objc_super v6 = [v3 objectForKeyedSubscript:@"personID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setPersonID:v7];
      }
      objc_super v8 = [v3 objectForKeyedSubscript:@"supportsMultipleAddresses"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSupportsMultipleAddresses:", objc_msgSend(v8, "BOOLValue"));
      }

      v9 = [v3 objectForKeyedSubscript:@"supportsCollectionByRegion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSupportsCollectionByRegion:", objc_msgSend(v9, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOAddressCorrectionInitRequest)initWithJSON:(id)a3
{
  return (GEOAddressCorrectionInitRequest *)-[GEOAddressCorrectionInitRequest _initWithDictionary:isJSON:](self, a3);
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
      objc_super v8 = (int *)&readAll__recursiveTag_100;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_101;
    }
    GEOAddressCorrectionInitRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAddressCorrectionInitRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAddressCorrectionInitRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
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
    [(GEOAddressCorrectionInitRequest *)self readAll:0];
    if (self->_token) {
      PBDataWriterWriteStringField();
    }
    if (self->_personID) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteBOOLField();
    }
  }
}

- (unsigned)requestTypeCode
{
  return 53;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  unsigned __int8 v5 = (id *)a3;
  [(GEOAddressCorrectionInitRequest *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 8) = self->_readerMarkPos;
  *((_DWORD *)v5 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_token) {
    objc_msgSend(v5, "setToken:");
  }
  if (self->_personID) {
    objc_msgSend(v5, "setPersonID:");
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v5 + 45) = self->_supportsMultipleAddresses;
    *((unsigned char *)v5 + 48) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((unsigned char *)v5 + 44) = self->_supportsCollectionByRegion;
    *((unsigned char *)v5 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOAddressCorrectionInitRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOAddressCorrectionInitRequest *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_token copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_personID copyWithZone:a3];
  v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 45) = self->_supportsMultipleAddresses;
    *(unsigned char *)(v5 + 48) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(unsigned char *)(v5 + 44) = self->_supportsCollectionByRegion;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOAddressCorrectionInitRequest *)self readAll:1];
  [v4 readAll:1];
  token = self->_token;
  if ((unint64_t)token | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](token, "isEqual:")) {
      goto LABEL_16;
    }
  }
  personID = self->_personID;
  if ((unint64_t)personID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](personID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0) {
      goto LABEL_16;
    }
    if (self->_supportsMultipleAddresses)
    {
      if (!*((unsigned char *)v4 + 45)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)v4 + 45))
    {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 48))
    {
      if (self->_supportsCollectionByRegion)
      {
        if (!*((unsigned char *)v4 + 44)) {
          goto LABEL_16;
        }
      }
      else if (*((unsigned char *)v4 + 44))
      {
        goto LABEL_16;
      }
      BOOL v7 = 1;
      goto LABEL_17;
    }
LABEL_16:
    BOOL v7 = 0;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  [(GEOAddressCorrectionInitRequest *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_token hash];
  NSUInteger v4 = [(NSString *)self->_personID hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_supportsMultipleAddresses;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_supportsCollectionByRegion;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v6 = a3;
  [v6 readAll:0];
  NSUInteger v4 = v6;
  if (v6[3])
  {
    -[GEOAddressCorrectionInitRequest setToken:](self, "setToken:");
    NSUInteger v4 = v6;
  }
  if (v4[2])
  {
    -[GEOAddressCorrectionInitRequest setPersonID:](self, "setPersonID:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_supportsMultipleAddresses = *((unsigned char *)v4 + 45);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 48);
  }
  if (v5)
  {
    self->_supportsCollectionByRegion = *((unsigned char *)v4 + 44);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_personID, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end