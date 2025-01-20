@interface GEONameInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasLocale;
- (BOOL)hasName;
- (BOOL)hasPhoneticName;
- (BOOL)hasPhoneticType;
- (BOOL)hasShield;
- (BOOL)hasShieldType;
- (BOOL)hasSignType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEONameInfo)init;
- (GEONameInfo)initWithData:(id)a3;
- (GEONameInfo)initWithDictionary:(id)a3;
- (GEONameInfo)initWithJSON:(id)a3;
- (NSString)locale;
- (NSString)name;
- (NSString)phoneticName;
- (NSString)shield;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)phoneticTypeAsString:(int)a3;
- (id)signTypeAsString:(int)a3;
- (int)StringAsPhoneticType:(id)a3;
- (int)StringAsSignType:(id)a3;
- (int)phoneticType;
- (int)shieldType;
- (int)signType;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readLocale;
- (void)_readName;
- (void)_readPhoneticName;
- (void)_readShield;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasPhoneticType:(BOOL)a3;
- (void)setHasShieldType:(BOOL)a3;
- (void)setHasSignType:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setName:(id)a3;
- (void)setPhoneticName:(id)a3;
- (void)setPhoneticType:(int)a3;
- (void)setShield:(id)a3;
- (void)setShieldType:(int)a3;
- (void)setSignType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEONameInfo

- (GEONameInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEONameInfo;
  v2 = [(GEONameInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEONameInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEONameInfo;
  v3 = [(GEONameInfo *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONameInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_17);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (NSString)name
{
  -[GEONameInfo _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (void)setName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x120u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readPhoneticName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONameInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoneticName_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPhoneticName
{
  return self->_phoneticName != 0;
}

- (NSString)phoneticName
{
  -[GEONameInfo _readPhoneticName]((uint64_t)self);
  phoneticName = self->_phoneticName;

  return phoneticName;
}

- (void)setPhoneticName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x140u;
  objc_storeStrong((id *)&self->_phoneticName, a3);
}

- (void)_readShield
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONameInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShield_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasShield
{
  return self->_shield != 0;
}

- (NSString)shield
{
  -[GEONameInfo _readShield]((uint64_t)self);
  shield = self->_shield;

  return shield;
}

- (void)setShield:(id)a3
{
  *(_WORD *)&self->_flags |= 0x180u;
  objc_storeStrong((id *)&self->_shield, a3);
}

- (int)shieldType
{
  return self->_shieldType;
}

- (void)setShieldType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x102u;
  self->_shieldType = a3;
}

- (void)setHasShieldType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 258;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasShieldType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (int)phoneticType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_phoneticType;
  }
  else {
    return 0;
  }
}

- (void)setPhoneticType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x101u;
  self->_phoneticType = a3;
}

- (void)setHasPhoneticType:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x100;
}

- (BOOL)hasPhoneticType
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)phoneticTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53EB9C8[a3];
  }

  return v3;
}

- (int)StringAsPhoneticType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NUANCE_LHPLUS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UNABBREVIATED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"XSAMPA"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)signType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_signType;
  }
  else {
    return 0;
  }
}

- (void)setSignType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x104u;
  self->_signType = a3;
}

- (void)setHasSignType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 260;
  }
  else {
    __int16 v3 = 256;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasSignType
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (id)signTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53EB9E0[a3];
  }

  return v3;
}

- (int)StringAsSignType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNDEFINED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BRANCH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TOWARDS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INTERSECTION"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readLocale
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEONameInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocale_tags_1096);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (NSString)locale
{
  -[GEONameInfo _readLocale]((uint64_t)self);
  locale = self->_locale;

  return locale;
}

- (void)setLocale:(id)a3
{
  *(_WORD *)&self->_flags |= 0x110u;
  objc_storeStrong((id *)&self->_locale, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEONameInfo;
  int v4 = [(GEONameInfo *)&v8 description];
  v5 = [(GEONameInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONameInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_27;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 name];
  if (v5) {
    [v4 setObject:v5 forKey:@"name"];
  }

  objc_super v6 = [(id)a1 phoneticName];
  if (v6) {
    [v4 setObject:v6 forKey:@"phoneticName"];
  }

  objc_super v7 = [(id)a1 shield];
  if (v7) {
    [v4 setObject:v7 forKey:@"shield"];
  }

  __int16 v8 = *(_WORD *)(a1 + 80);
  if ((v8 & 2) == 0)
  {
    if ((v8 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v10 = *(int *)(a1 + 68);
    if (v10 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E53EB9C8[v10];
    }
    [v4 setObject:v11 forKey:@"phoneticType"];

    if ((*(_WORD *)(a1 + 80) & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
  [v4 setObject:v9 forKey:@"shieldType"];

  __int16 v8 = *(_WORD *)(a1 + 80);
  if (v8) {
    goto LABEL_13;
  }
LABEL_10:
  if ((v8 & 4) != 0)
  {
LABEL_17:
    uint64_t v12 = *(int *)(a1 + 76);
    if (v12 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 76));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E53EB9E0[v12];
    }
    [v4 setObject:v13 forKey:@"signType"];
  }
LABEL_21:
  v14 = [(id)a1 locale];
  if (v14) {
    [v4 setObject:v14 forKey:@"locale"];
  }

  v15 = *(void **)(a1 + 16);
  if (v15)
  {
    v16 = [v15 dictionaryRepresentation];
    v17 = v16;
    if (a2)
    {
      v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __41__GEONameInfo__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E53D8860;
      id v19 = v18;
      id v23 = v19;
      [v17 enumerateKeysAndObjectsUsingBlock:v22];
      id v20 = v19;

      v17 = v20;
    }
    [v4 setObject:v17 forKey:@"Unknown Fields"];
  }
LABEL_27:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONameInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEONameInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    __int16 v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    __int16 v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEONameInfo)initWithDictionary:(id)a3
{
  return (GEONameInfo *)-[GEONameInfo _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_40;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_40;
  }
  int v4 = [v3 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)[v4 copy];
    [a1 setName:v5];
  }
  objc_super v6 = [v3 objectForKeyedSubscript:@"phoneticName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = (void *)[v6 copy];
    [a1 setPhoneticName:v7];
  }
  __int16 v8 = [v3 objectForKeyedSubscript:@"shield"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (void *)[v8 copy];
    [a1 setShield:v9];
  }
  id v10 = [v3 objectForKeyedSubscript:@"shieldType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setShieldType:", objc_msgSend(v10, "intValue"));
  }

  v11 = [v3 objectForKeyedSubscript:@"phoneticType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"NUANCE_LHPLUS"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"UNABBREVIATED"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"XSAMPA"])
    {
      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_23;
    }
    uint64_t v13 = [v11 intValue];
  }
  [a1 setPhoneticType:v13];
LABEL_23:

  v14 = [v3 objectForKeyedSubscript:@"signType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = v14;
    if ([v15 isEqualToString:@"UNDEFINED"])
    {
      uint64_t v16 = 0;
    }
    else if ([v15 isEqualToString:@"BRANCH"])
    {
      uint64_t v16 = 1;
    }
    else if ([v15 isEqualToString:@"TOWARDS"])
    {
      uint64_t v16 = 2;
    }
    else if ([v15 isEqualToString:@"INTERSECTION"])
    {
      uint64_t v16 = 3;
    }
    else
    {
      uint64_t v16 = 0;
    }

    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v14 intValue];
LABEL_36:
    [a1 setSignType:v16];
  }

  v17 = [v3 objectForKeyedSubscript:@"locale"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = (void *)[v17 copy];
    [a1 setLocale:v18];
  }
LABEL_40:

  return a1;
}

- (GEONameInfo)initWithJSON:(id)a3
{
  return (GEONameInfo *)-[GEONameInfo _initWithDictionary:isJSON:](self, a3);
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
      __int16 v8 = (int *)&readAll__recursiveTag_1115_0;
    }
    else {
      __int16 v8 = (int *)&readAll__nonRecursiveTag_1116_0;
    }
    GEONameInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEONameInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONameInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x1F0) == 0)
    {
      objc_super v7 = self->_reader;
      objc_sync_enter(v7);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      __int16 v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v9 writeData:v8];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v7);
      goto LABEL_20;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEONameInfo *)self readAll:0];
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  id v5 = v9;
  if (self->_phoneticName)
  {
    PBDataWriterWriteStringField();
    id v5 = v9;
  }
  if (self->_shield)
  {
    PBDataWriterWriteStringField();
    id v5 = v9;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 1) == 0) {
      goto LABEL_11;
    }
LABEL_17:
    PBDataWriterWriteInt32Field();
    id v5 = v9;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  PBDataWriterWriteSint32Field();
  id v5 = v9;
  __int16 flags = (__int16)self->_flags;
  if (flags) {
    goto LABEL_17;
  }
LABEL_11:
  if ((flags & 4) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt32Field();
    id v5 = v9;
  }
LABEL_13:
  if (self->_locale)
  {
    PBDataWriterWriteStringField();
    id v5 = v9;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
LABEL_20:
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEONameInfo *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_name) {
    objc_msgSend(v6, "setName:");
  }
  if (self->_phoneticName) {
    objc_msgSend(v6, "setPhoneticName:");
  }
  int v4 = v6;
  if (self->_shield)
  {
    objc_msgSend(v6, "setShield:");
    int v4 = v6;
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_shieldType;
    *((_WORD *)v4 + 40) |= 2u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_9:
      if ((flags & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((flags & 1) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 17) = self->_phoneticType;
  *((_WORD *)v4 + 40) |= 1u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 19) = self->_signType;
    *((_WORD *)v4 + 40) |= 4u;
  }
LABEL_11:
  if (self->_locale)
  {
    objc_msgSend(v6, "setLocale:");
    int v4 = v6;
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
    [(GEONameInfo *)self readAll:0];
    uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
    id v10 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v9;

    uint64_t v11 = [(NSString *)self->_phoneticName copyWithZone:a3];
    id v12 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v11;

    uint64_t v13 = [(NSString *)self->_shield copyWithZone:a3];
    v14 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v13;

    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 72) = self->_shieldType;
      *(_WORD *)(v5 + 80) |= 2u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_7:
        if ((flags & 4) == 0)
        {
LABEL_9:
          uint64_t v16 = [(NSString *)self->_locale copyWithZone:a3];
          v17 = *(void **)(v5 + 24);
          *(void *)(v5 + 24) = v16;

          v18 = self->_unknownFields;
          id v8 = *(id *)(v5 + 16);
          *(void *)(v5 + 16) = v18;
          goto LABEL_10;
        }
LABEL_8:
        *(_DWORD *)(v5 + 76) = self->_signType;
        *(_WORD *)(v5 + 80) |= 4u;
        goto LABEL_9;
      }
    }
    else if ((flags & 1) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 68) = self->_phoneticType;
    *(_WORD *)(v5 + 80) |= 1u;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEONameInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  [(GEONameInfo *)self readAll:1];
  [v4 readAll:1];
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_25;
    }
  }
  phoneticName = self->_phoneticName;
  if ((unint64_t)phoneticName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](phoneticName, "isEqual:")) {
      goto LABEL_25;
    }
  }
  shield = self->_shield;
  if ((unint64_t)shield | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](shield, "isEqual:")) {
      goto LABEL_25;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 40);
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_shieldType != *((_DWORD *)v4 + 18)) {
      goto LABEL_25;
    }
  }
  else if ((v9 & 2) != 0)
  {
LABEL_25:
    char v11 = 0;
    goto LABEL_26;
  }
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_phoneticType != *((_DWORD *)v4 + 17)) {
      goto LABEL_25;
    }
  }
  else if (v9)
  {
    goto LABEL_25;
  }
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_signType != *((_DWORD *)v4 + 19)) {
      goto LABEL_25;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_25;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 3)) {
    char v11 = -[NSString isEqual:](locale, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_26:

  return v11;
}

- (unint64_t)hash
{
  [(GEONameInfo *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_phoneticName hash];
  NSUInteger v5 = [(NSString *)self->_shield hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    uint64_t v7 = 0;
    if (flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ [(NSString *)self->_locale hash];
  }
  uint64_t v7 = 2654435761 * self->_shieldType;
  if ((flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_phoneticType;
  if ((flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v9 = 2654435761 * self->_signType;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ [(NSString *)self->_locale hash];
}

- (void)mergeFrom:(id)a3
{
  objc_super v6 = a3;
  [v6 readAll:0];
  NSUInteger v4 = v6;
  if (v6[4])
  {
    -[GEONameInfo setName:](self, "setName:");
    NSUInteger v4 = v6;
  }
  if (v4[5])
  {
    -[GEONameInfo setPhoneticName:](self, "setPhoneticName:");
    NSUInteger v4 = v6;
  }
  if (v4[6])
  {
    -[GEONameInfo setShield:](self, "setShield:");
    NSUInteger v4 = v6;
  }
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_shieldType = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_flags |= 2u;
    __int16 v5 = *((_WORD *)v4 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_phoneticType = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_flags |= 1u;
  if ((v4[10] & 4) != 0)
  {
LABEL_10:
    self->_signType = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_11:
  if (v4[3])
  {
    -[GEONameInfo setLocale:](self, "setLocale:");
    NSUInteger v4 = v6;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      __int16 v5 = reader;
      objc_sync_enter(v5);
      GEONameInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1120_0);
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
  *(_WORD *)&self->_flags |= 0x108u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEONameInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shield, 0);
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end