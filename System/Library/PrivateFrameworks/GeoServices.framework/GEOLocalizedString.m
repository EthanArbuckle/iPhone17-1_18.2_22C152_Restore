@interface GEOLocalizedString
+ (BOOL)isValid:(id)a3;
+ (id)bestLocalizedString:(id)a3 forPreferredLanguages:(id)a4 fallbackToFirstAvailable:(BOOL)a5;
+ (id)bestLocalizedStringForCurrentLocale:(id)a3 fallbackToFirstAvailable:(BOOL)a4;
+ (id)bestString:(id)a3 forPreferredLanguages:(id)a4 fallbackToFirstAvailable:(BOOL)a5;
+ (id)bestStringForCurrentLocale:(id)a3 fallbackToFirstAvailable:(BOOL)a4;
- (BOOL)hasLocale;
- (BOOL)hasStringValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocalizedString)init;
- (GEOLocalizedString)initWithData:(id)a3;
- (GEOLocalizedString)initWithDictionary:(id)a3;
- (GEOLocalizedString)initWithJSON:(id)a3;
- (NSString)locale;
- (NSString)stringValue;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLocale;
- (void)_readStringValue;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setStringValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLocalizedString

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (NSString)stringValue
{
  -[GEOLocalizedString _readStringValue]((uint64_t)self);
  stringValue = self->_stringValue;

  return stringValue;
}

- (void)_readStringValue
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStringValue_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (NSString)locale
{
  -[GEOLocalizedString _readLocale]((uint64_t)self);
  locale = self->_locale;

  return locale;
}

- (void)_readLocale
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocale_tags_673);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

+ (id)bestLocalizedStringForCurrentLocale:(id)a3 fallbackToFirstAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void *)MEMORY[0x1E4F1CA20];
  id v7 = a3;
  v8 = [v6 preferredLanguages];
  v9 = [a1 bestLocalizedString:v7 forPreferredLanguages:v8 fallbackToFirstAvailable:v4];

  return v9;
}

+ (id)bestLocalizedString:(id)a3 forPreferredLanguages:(id)a4 fallbackToFirstAvailable:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v15, "hasLocale", (void)v24))
          {
            v16 = [v15 locale];
            [v9 setObject:v15 forKeyedSubscript:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }

    v17 = (void *)MEMORY[0x1E4F1CA20];
    v18 = [v9 allKeys];
    v19 = [v17 mostPreferredLanguageOf:v18 withPreferredLanguages:v8 forUsage:1 options:0];

    if (v19)
    {
      v20 = [v9 objectForKeyedSubscript:v19];
      if (v20) {
        goto LABEL_17;
      }
    }
    else
    {
      v20 = 0;
    }
    if (v5)
    {
      id v21 = [v10 firstObject];
LABEL_18:
      v22 = v21;

      goto LABEL_19;
    }
LABEL_17:
    id v21 = v20;
    goto LABEL_18;
  }
  v22 = 0;
LABEL_19:

  return v22;
}

- (GEOLocalizedString)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLocalizedString;
  v2 = [(GEOLocalizedString *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    BOOL v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)setStringValue:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
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
    [(GEOLocalizedString *)self readAll:0];
    if (self->_locale) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_stringValue)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

+ (id)bestStringForCurrentLocale:(id)a3 fallbackToFirstAvailable:(BOOL)a4
{
  BOOL v4 = [a1 bestLocalizedStringForCurrentLocale:a3 fallbackToFirstAvailable:a4];
  id v5 = [v4 stringValue];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLocalizedString *)self readAll:1],
         [v4 readAll:1],
         locale = self->_locale,
         !((unint64_t)locale | v4[3]))
     || -[NSString isEqual:](locale, "isEqual:")))
  {
    stringValue = self->_stringValue;
    if ((unint64_t)stringValue | v4[4]) {
      char v7 = -[NSString isEqual:](stringValue, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    char v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_680;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_681;
    }
    GEOLocalizedStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (id)bestString:(id)a3 forPreferredLanguages:(id)a4 fallbackToFirstAvailable:(BOOL)a5
{
  id v5 = [a1 bestLocalizedString:a3 forPreferredLanguages:a4 fallbackToFirstAvailable:a5];
  objc_super v6 = [v5 stringValue];

  return v6;
}

- (GEOLocalizedString)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLocalizedString;
  BOOL v3 = [(GEOLocalizedString *)&v7 initWithData:a3];
  BOOL v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setLocale:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_locale, a3);
}

- (id)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLocalizedString;
  BOOL v4 = [(GEOLocalizedString *)&v8 description];
  id v5 = [(GEOLocalizedString *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLocalizedString _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 locale];
    if (v5) {
      [v4 setObject:v5 forKey:@"locale"];
    }

    objc_super v6 = [a1 stringValue];
    if (v6)
    {
      if (a2) {
        objc_super v7 = @"stringValue";
      }
      else {
        objc_super v7 = @"string_value";
      }
      [v4 setObject:v6 forKey:v7];
    }

    objc_super v8 = (void *)a1[2];
    if (v8)
    {
      v9 = [v8 dictionaryRepresentation];
      id v10 = v9;
      if (a2)
      {
        uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __48__GEOLocalizedString__dictionaryRepresentation___block_invoke;
        v15[3] = &unk_1E53D8860;
        id v12 = v11;
        id v16 = v12;
        [v10 enumerateKeysAndObjectsUsingBlock:v15];
        id v13 = v12;

        id v10 = v13;
      }
      [v4 setObject:v10 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLocalizedString _dictionaryRepresentation:](self, 1);
}

void __48__GEOLocalizedString__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLocalizedString)initWithDictionary:(id)a3
{
  return (GEOLocalizedString *)-[GEOLocalizedString _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"locale"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setLocale:v7];
      }
      if (a3) {
        objc_super v8 = @"stringValue";
      }
      else {
        objc_super v8 = @"string_value";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (void *)[v9 copy];
        [a1 setStringValue:v10];
      }
    }
  }

  return a1;
}

- (GEOLocalizedString)initWithJSON:(id)a3
{
  return (GEOLocalizedString *)-[GEOLocalizedString _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocalizedStringIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLocalizedStringReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  BOOL v4 = (id *)a3;
  [(GEOLocalizedString *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_locale) {
    objc_msgSend(v4, "setLocale:");
  }
  if (self->_stringValue) {
    objc_msgSend(v4, "setStringValue:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLocalizedString *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_locale copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSString *)self->_stringValue copyWithZone:a3];
    uint64_t v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLocalizedStringReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (unint64_t)hash
{
  [(GEOLocalizedString *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_locale hash];
  return [(NSString *)self->_stringValue hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v4 = a3;
  [v4 readAll:0];
  if (v4[3]) {
    -[GEOLocalizedString setLocale:](self, "setLocale:");
  }
  if (v4[4]) {
    -[GEOLocalizedString setStringValue:](self, "setStringValue:");
  }
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
      GEOLocalizedStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_685);
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
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOLocalizedString *)self readAll:0];
  }
}

@end