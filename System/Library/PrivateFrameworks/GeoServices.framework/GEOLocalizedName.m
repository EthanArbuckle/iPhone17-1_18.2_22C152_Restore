@interface GEOLocalizedName
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIsDefault;
- (BOOL)hasLanguageCode;
- (BOOL)hasName;
- (BOOL)hasNameRank;
- (BOOL)hasNameType;
- (BOOL)hasPhoneticName;
- (BOOL)isDefault;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocalizedName)init;
- (GEOLocalizedName)initWithData:(id)a3;
- (GEOLocalizedName)initWithDictionary:(id)a3;
- (GEOLocalizedName)initWithJSON:(id)a3;
- (GEOLocalizedName)initWithPlaceDataLocalizedString:(id)a3;
- (NSString)languageCode;
- (NSString)name;
- (NSString)nameType;
- (NSString)phoneticName;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)nameRank;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readLanguageCode;
- (void)_readName;
- (void)_readNameType;
- (void)_readPhoneticName;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasIsDefault:(BOOL)a3;
- (void)setHasNameRank:(BOOL)a3;
- (void)setIsDefault:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setName:(id)a3;
- (void)setNameRank:(unsigned int)a3;
- (void)setNameType:(id)a3;
- (void)setPhoneticName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLocalizedName

- (GEOLocalizedName)initWithPlaceDataLocalizedString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOLocalizedName;
  v5 = [(GEOLocalizedName *)&v10 init];
  if (v5)
  {
    if ([v4 hasLocale])
    {
      v6 = [v4 locale];
      [(GEOLocalizedName *)v5 setLanguageCode:v6];
    }
    if ([v4 hasStringValue])
    {
      v7 = [v4 stringValue];
      [(GEOLocalizedName *)v5 setName:v7];
    }
    v8 = v5;
  }

  return v5;
}

- (void)setName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setLanguageCode:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (GEOLocalizedName)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLocalizedName;
  v2 = [(GEOLocalizedName *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOLocalizedName)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLocalizedName;
  v3 = [(GEOLocalizedName *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void)setIsDefault:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_isDefault = a3;
}

- (void)setHasIsDefault:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsDefault
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (void)_readLanguageCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedNameReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLanguageCode_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (NSString)languageCode
{
  -[GEOLocalizedName _readLanguageCode]((uint64_t)self);
  languageCode = self->_languageCode;

  return languageCode;
}

- (void)_readNameType
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedNameReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNameType_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasNameType
{
  return self->_nameType != 0;
}

- (NSString)nameType
{
  -[GEOLocalizedName _readNameType]((uint64_t)self);
  nameType = self->_nameType;

  return nameType;
}

- (void)setNameType:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_nameType, a3);
}

- (void)_readName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedNameReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_1532);
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
  -[GEOLocalizedName _readName]((uint64_t)self);
  name = self->_name;

  return name;
}

- (unsigned)nameRank
{
  return self->_nameRank;
}

- (void)setNameRank:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_nameRank = a3;
}

- (void)setHasNameRank:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasNameRank
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readPhoneticName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedNameReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhoneticName_tags_1533);
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
  -[GEOLocalizedName _readPhoneticName]((uint64_t)self);
  phoneticName = self->_phoneticName;

  return phoneticName;
}

- (void)setPhoneticName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_phoneticName, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLocalizedName;
  id v4 = [(GEOLocalizedName *)&v8 description];
  v5 = [(GEOLocalizedName *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLocalizedName _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
      [v4 setObject:v5 forKey:@"isDefault"];
    }
    objc_super v6 = [(id)a1 languageCode];
    if (v6) {
      [v4 setObject:v6 forKey:@"languageCode"];
    }

    objc_super v7 = [(id)a1 nameType];
    if (v7) {
      [v4 setObject:v7 forKey:@"nameType"];
    }

    objc_super v8 = [(id)a1 name];
    if (v8) {
      [v4 setObject:v8 forKey:@"name"];
    }

    if (*(unsigned char *)(a1 + 76))
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
      [v4 setObject:v9 forKey:@"nameRank"];
    }
    objc_super v10 = [(id)a1 phoneticName];
    if (v10) {
      [v4 setObject:v10 forKey:@"phoneticName"];
    }

    v11 = *(void **)(a1 + 16);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __46__GEOLocalizedName__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLocalizedName _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOLocalizedName__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLocalizedName)initWithDictionary:(id)a3
{
  return (GEOLocalizedName *)-[GEOLocalizedName _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v4 = [v3 objectForKeyedSubscript:@"isDefault"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsDefault:", objc_msgSend(v4, "BOOLValue"));
      }

      id v5 = [v3 objectForKeyedSubscript:@"languageCode"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v6 = (void *)[v5 copy];
        [a1 setLanguageCode:v6];
      }
      objc_super v7 = [v3 objectForKeyedSubscript:@"nameType"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setNameType:v8];
      }
      v9 = [v3 objectForKeyedSubscript:@"name"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (void *)[v9 copy];
        [a1 setName:v10];
      }
      v11 = [v3 objectForKeyedSubscript:@"nameRank"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNameRank:", objc_msgSend(v11, "unsignedIntValue"));
      }

      v12 = [v3 objectForKeyedSubscript:@"phoneticName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = (void *)[v12 copy];
        [a1 setPhoneticName:v13];
      }
    }
  }

  return a1;
}

- (GEOLocalizedName)initWithJSON:(id)a3
{
  return (GEOLocalizedName *)-[GEOLocalizedName _initWithDictionary:isJSON:](self, a3);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1546;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1547;
    }
    GEOLocalizedNameReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocalizedNameIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLocalizedNameReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 7u))
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
    [(GEOLocalizedName *)self readAll:0];
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    id v5 = v8;
    if (self->_languageCode)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_nameType)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_name)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v8;
    }
    if (self->_phoneticName)
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
  [(GEOLocalizedName *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  id v4 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v5 + 72) = self->_isDefault;
    *((unsigned char *)v5 + 76) |= 2u;
  }
  if (self->_languageCode)
  {
    objc_msgSend(v5, "setLanguageCode:");
    id v4 = v5;
  }
  if (self->_nameType)
  {
    objc_msgSend(v5, "setNameType:");
    id v4 = v5;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 17) = self->_nameRank;
    *((unsigned char *)v4 + 76) |= 1u;
  }
  if (self->_phoneticName)
  {
    objc_msgSend(v5, "setPhoneticName:");
    id v4 = v5;
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
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLocalizedNameReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLocalizedName *)self readAll:0];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 72) = self->_isDefault;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_languageCode copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_nameType copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  uint64_t v13 = [(NSString *)self->_name copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_nameRank;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v15 = [(NSString *)self->_phoneticName copyWithZone:a3];
  id v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEOLocalizedName *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) != 0)
    {
      if (self->_isDefault)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_23;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_10;
      }
    }
LABEL_23:
    char v9 = 0;
    goto LABEL_24;
  }
  if ((*((unsigned char *)v4 + 76) & 2) != 0) {
    goto LABEL_23;
  }
LABEL_10:
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((void *)v4 + 3)
    && !-[NSString isEqual:](languageCode, "isEqual:"))
  {
    goto LABEL_23;
  }
  nameType = self->_nameType;
  if ((unint64_t)nameType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](nameType, "isEqual:")) {
      goto LABEL_23;
    }
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_nameRank != *((_DWORD *)v4 + 17)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_23;
  }
  phoneticName = self->_phoneticName;
  if ((unint64_t)phoneticName | *((void *)v4 + 6)) {
    char v9 = -[NSString isEqual:](phoneticName, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  [(GEOLocalizedName *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_isDefault;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_languageCode hash];
  NSUInteger v5 = [(NSString *)self->_nameType hash];
  NSUInteger v6 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v7 = 2654435761 * self->_nameRank;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_phoneticName hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v5 = (BOOL *)a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if ((v5[76] & 2) != 0)
  {
    self->_isDefault = v5[72];
    *(unsigned char *)&self->_flags |= 2u;
  }
  if (*((void *)v5 + 3))
  {
    -[GEOLocalizedName setLanguageCode:](self, "setLanguageCode:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[GEOLocalizedName setNameType:](self, "setNameType:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[GEOLocalizedName setName:](self, "setName:");
    NSUInteger v4 = v5;
  }
  if (v4[76])
  {
    self->_nameRank = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 6))
  {
    -[GEOLocalizedName setPhoneticName:](self, "setPhoneticName:");
    NSUInteger v4 = v5;
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
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEOLocalizedNameReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1551);
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
  *(unsigned char *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOLocalizedName *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_nameType, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end