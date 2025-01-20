@interface GEORPPostedBy
+ (BOOL)isValid:(id)a3;
- (BOOL)hasNickname;
- (BOOL)hasRole;
- (BOOL)hasUserDsid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPPostedBy)init;
- (GEORPPostedBy)initWithData:(id)a3;
- (GEORPPostedBy)initWithDictionary:(id)a3;
- (GEORPPostedBy)initWithJSON:(id)a3;
- (NSString)nickname;
- (NSString)userDsid;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)roleAsString:(int)a3;
- (int)StringAsRole:(id)a3;
- (int)role;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readNickname;
- (void)_readUserDsid;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasRole:(BOOL)a3;
- (void)setNickname:(id)a3;
- (void)setRole:(int)a3;
- (void)setUserDsid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPostedBy

- (GEORPPostedBy)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPPostedBy;
  v2 = [(GEORPPostedBy *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPostedBy)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPPostedBy;
  v3 = [(GEORPPostedBy *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)role
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_role;
  }
  else {
    return 0;
  }
}

- (void)setRole:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_role = a3;
}

- (void)setHasRole:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasRole
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)roleAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F6868[a3];
  }

  return v3;
}

- (int)StringAsRole:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ROLE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ROLE_CUSTOMER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ROLE_SYSTEM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ROLE_REPRESENTATIVE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readUserDsid
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPostedByReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserDsid_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasUserDsid
{
  return self->_userDsid != 0;
}

- (NSString)userDsid
{
  -[GEORPPostedBy _readUserDsid]((uint64_t)self);
  userDsid = self->_userDsid;

  return userDsid;
}

- (void)setUserDsid:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_userDsid, a3);
}

- (void)_readNickname
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPostedByReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNickname_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasNickname
{
  return self->_nickname != 0;
}

- (NSString)nickname
{
  -[GEORPPostedBy _readNickname]((uint64_t)self);
  nickname = self->_nickname;

  return nickname;
}

- (void)setNickname:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_nickname, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPostedBy;
  int v4 = [(GEORPPostedBy *)&v8 description];
  v5 = [(GEORPPostedBy *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPostedBy _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v5 = *(int *)(a1 + 52);
      if (v5 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53F6868[v5];
      }
      [v4 setObject:v6 forKey:@"role"];
    }
    objc_super v7 = [(id)a1 userDsid];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"userDsid";
      }
      else {
        objc_super v8 = @"user_dsid";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [(id)a1 nickname];
    if (v9) {
      [v4 setObject:v9 forKey:@"nickname"];
    }

    v10 = *(void **)(a1 + 16);
    if (v10)
    {
      v11 = [v10 dictionaryRepresentation];
      v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __43__GEORPPostedBy__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
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
  return -[GEORPPostedBy _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEORPPostedBy__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPPostedBy)initWithDictionary:(id)a3
{
  return (GEORPPostedBy *)-[GEORPPostedBy _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_25;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_25;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"role"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"ROLE_UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"ROLE_CUSTOMER"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"ROLE_SYSTEM"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"ROLE_REPRESENTATIVE"])
    {
      uint64_t v8 = 3;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_16:
    [a1 setRole:v8];
  }

  if (a3) {
    v9 = @"userDsid";
  }
  else {
    v9 = @"user_dsid";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (void *)[v10 copy];
    [a1 setUserDsid:v11];
  }
  v12 = [v5 objectForKeyedSubscript:@"nickname"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (void *)[v12 copy];
    [a1 setNickname:v13];
  }
LABEL_25:

  return a1;
}

- (GEORPPostedBy)initWithJSON:(id)a3
{
  return (GEORPPostedBy *)-[GEORPPostedBy _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_812;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_813;
    }
    GEORPPostedByReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPostedByIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPostedByReadAllFrom((uint64_t)self, a3, 0);
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
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPPostedBy *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    id v5 = v8;
    if (self->_userDsid)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_nickname)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEORPPostedBy *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 13) = self->_role;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  if (self->_userDsid)
  {
    objc_msgSend(v5, "setUserDsid:");
    int v4 = v5;
  }
  if (self->_nickname)
  {
    objc_msgSend(v5, "setNickname:");
    int v4 = v5;
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
      GEORPPostedByReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPPostedBy *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_role;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_userDsid copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_nickname copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEORPPostedBy *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_role != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  userDsid = self->_userDsid;
  if ((unint64_t)userDsid | *((void *)v4 + 4) && !-[NSString isEqual:](userDsid, "isEqual:")) {
    goto LABEL_11;
  }
  nickname = self->_nickname;
  if ((unint64_t)nickname | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](nickname, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEORPPostedBy *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_role;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_userDsid hash] ^ v3;
  return v4 ^ [(NSString *)self->_nickname hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = (int *)a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if (v5[14])
  {
    self->_role = v5[13];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 4))
  {
    -[GEORPPostedBy setUserDsid:](self, "setUserDsid:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[GEORPPostedBy setNickname:](self, "setNickname:");
    NSUInteger v4 = v5;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPPostedByReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_817);
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
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPPostedBy *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDsid, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end