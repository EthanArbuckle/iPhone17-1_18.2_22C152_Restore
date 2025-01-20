@interface GEOCachedCategorySuggestionsPlaceResponse
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCountryCode;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLanguage;
- (BOOL)hasResponse;
- (BOOL)hasSourceURL;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCachedCategorySuggestionsPlaceResponse)init;
- (GEOCachedCategorySuggestionsPlaceResponse)initWithData:(id)a3;
- (GEOCachedCategorySuggestionsPlaceResponse)initWithDictionary:(id)a3;
- (GEOCachedCategorySuggestionsPlaceResponse)initWithJSON:(id)a3;
- (GEOPDPlaceResponse)response;
- (NSString)countryCode;
- (NSString)language;
- (NSString)sourceURL;
- (PBUnknownFields)unknownFields;
- (double)timestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readCountryCode;
- (void)_readLanguage;
- (void)_readResponse;
- (void)_readSourceURL;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCountryCode:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setResponse:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCachedCategorySuggestionsPlaceResponse

- (GEOCachedCategorySuggestionsPlaceResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOCachedCategorySuggestionsPlaceResponse;
  v2 = [(GEOCachedCategorySuggestionsPlaceResponse *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOCachedCategorySuggestionsPlaceResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOCachedCategorySuggestionsPlaceResponse;
  v3 = [(GEOCachedCategorySuggestionsPlaceResponse *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readResponse
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCachedCategorySuggestionsPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResponse_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (GEOPDPlaceResponse)response
{
  -[GEOCachedCategorySuggestionsPlaceResponse _readResponse]((uint64_t)self);
  response = self->_response;

  return response;
}

- (void)setResponse:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_response, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readSourceURL
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCachedCategorySuggestionsPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSourceURL
{
  return self->_sourceURL != 0;
}

- (NSString)sourceURL
{
  -[GEOCachedCategorySuggestionsPlaceResponse _readSourceURL]((uint64_t)self);
  sourceURL = self->_sourceURL;

  return sourceURL;
}

- (void)setSourceURL:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_sourceURL, a3);
}

- (void)_readCountryCode
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCachedCategorySuggestionsPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryCode_tags_4);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (NSString)countryCode
{
  -[GEOCachedCategorySuggestionsPlaceResponse _readCountryCode]((uint64_t)self);
  countryCode = self->_countryCode;

  return countryCode;
}

- (void)setCountryCode:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (void)_readLanguage
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOCachedCategorySuggestionsPlaceResponseReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLanguage_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (NSString)language
{
  -[GEOCachedCategorySuggestionsPlaceResponse _readLanguage]((uint64_t)self);
  language = self->_language;

  return language;
}

- (void)setLanguage:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_language, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCachedCategorySuggestionsPlaceResponse;
  v4 = [(GEOCachedCategorySuggestionsPlaceResponse *)&v8 description];
  v5 = [(GEOCachedCategorySuggestionsPlaceResponse *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCachedCategorySuggestionsPlaceResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 response];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"response"];
    }
    if (*(unsigned char *)(a1 + 76))
    {
      objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
      [v4 setObject:v8 forKey:@"timestamp"];
    }
    v9 = [(id)a1 sourceURL];
    if (v9) {
      [v4 setObject:v9 forKey:@"sourceURL"];
    }

    v10 = [(id)a1 countryCode];
    if (v10) {
      [v4 setObject:v10 forKey:@"countryCode"];
    }

    v11 = [(id)a1 language];
    if (v11) {
      [v4 setObject:v11 forKey:@"language"];
    }

    v12 = *(void **)(a1 + 16);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __71__GEOCachedCategorySuggestionsPlaceResponse__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
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
  return -[GEOCachedCategorySuggestionsPlaceResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __71__GEOCachedCategorySuggestionsPlaceResponse__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOCachedCategorySuggestionsPlaceResponse)initWithDictionary:(id)a3
{
  return (GEOCachedCategorySuggestionsPlaceResponse *)-[GEOCachedCategorySuggestionsPlaceResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"response"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOPDPlaceResponse alloc];
        if (a3) {
          uint64_t v8 = [(GEOPDPlaceResponse *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOPDPlaceResponse *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setResponse:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"timestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v10 doubleValue];
        objc_msgSend(a1, "setTimestamp:");
      }

      v11 = [v5 objectForKeyedSubscript:@"sourceURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[v11 copy];
        [a1 setSourceURL:v12];
      }
      v13 = [v5 objectForKeyedSubscript:@"countryCode"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setCountryCode:v14];
      }
      v15 = [v5 objectForKeyedSubscript:@"language"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = (void *)[v15 copy];
        [a1 setLanguage:v16];
      }
    }
  }

  return a1;
}

- (GEOCachedCategorySuggestionsPlaceResponse)initWithJSON:(id)a3
{
  return (GEOCachedCategorySuggestionsPlaceResponse *)-[GEOCachedCategorySuggestionsPlaceResponse _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_138_0;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_139_0;
    }
    GEOCachedCategorySuggestionsPlaceResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOPDPlaceResponse *)self->_response readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  [a3 position];
  [a3 length];
  v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  objc_super v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    objc_super v7 = (int *)MEMORY[0x1E4F940B8];
    while (!*((unsigned char *)a3 + *v6))
    {
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v4;
        uint64_t v12 = *(void *)((char *)a3 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
        *(void *)((char *)a3 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          uint64_t v16 = *v6;
          int v17 = *((unsigned __int8 *)a3 + v16);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      uint64_t v16 = *v6;
      int v17 = *((unsigned __int8 *)a3 + v16);
      if (*((unsigned char *)a3 + v16)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v18 = v10 & 7;
      if (v17 || v18 == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          if (v18 != 2 || !PBReaderPlaceMark() || !GEOPDPlaceResponseIsValid((char *)a3)) {
            goto LABEL_38;
          }
          PBReaderRecallMark();
          goto LABEL_33;
        case 2u:
          if (v18 != 1) {
            goto LABEL_38;
          }
          uint64_t v20 = *v4;
          unint64_t v21 = *(void *)((char *)a3 + v20);
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && (unint64_t v22 = v21 + 8, v22 <= *(void *)((char *)a3 + *v5))) {
            *(void *)((char *)a3 + v20) = v22;
          }
          else {
            *((unsigned char *)a3 + v16) = 1;
          }
          goto LABEL_33;
        case 3u:
          if (v18 == 2) {
            goto LABEL_32;
          }
          goto LABEL_38;
        case 4u:
          if (v18 == 2) {
            goto LABEL_32;
          }
          goto LABEL_38;
        case 5u:
          if (v18 == 2) {
            goto LABEL_32;
          }
          goto LABEL_38;
        default:
LABEL_32:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
          {
LABEL_38:
            PBReaderRecallMark();
            return 0;
          }
LABEL_33:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_36;
          }
          break;
      }
    }
  }
LABEL_36:
  BOOL v23 = *((unsigned char *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v23;
}

- (BOOL)readFrom:(id)a3
{
  return GEOCachedCategorySuggestionsPlaceResponseReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_7;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x40) != 0) {
    goto LABEL_7;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if (GEOPDPlaceResponseIsDirty((os_unfair_lock_s *)self->_response)) {
      goto LABEL_7;
    }
    char flags = (char)self->_flags;
  }
  if ((flags & 0x2C) == 0)
  {
    objc_super v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    char v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_18;
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCachedCategorySuggestionsPlaceResponse *)self readAll:0];
  if (self->_response) {
    PBDataWriterWriteSubmessage();
  }
  id v6 = v9;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteDoubleField();
    id v6 = v9;
  }
  if (self->_sourceURL)
  {
    PBDataWriterWriteStringField();
    id v6 = v9;
  }
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    id v6 = v9;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v6 = v9;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v6];
LABEL_18:
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  if ([(GEOCachedCategorySuggestionsPlaceResponse *)self hasResponse]
    && ([(GEOCachedCategorySuggestionsPlaceResponse *)self response],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int HasSensitiveFields = GEOPDPlaceResponseHasSensitiveFields(v5, a3),
        v5,
        HasSensitiveFields))
  {
    objc_super v7 = [(GEOCachedCategorySuggestionsPlaceResponse *)self response];
    char v8 = (id *)[v7 copy];

    GEOPDPlaceResponseClearSensitiveFields(v8, a3, 0);
    [(GEOCachedCategorySuggestionsPlaceResponse *)self setResponse:v8];
  }
  else
  {
    char v8 = [(GEOCachedCategorySuggestionsPlaceResponse *)self response];
    [v8 clearSensitiveFields:a3];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOCachedCategorySuggestionsPlaceResponse _readResponse]((uint64_t)self);
  response = self->_response;

  return [(GEOPDPlaceResponse *)response hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOCachedCategorySuggestionsPlaceResponse *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_response) {
    objc_msgSend(v5, "setResponse:");
  }
  v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    v5[7] = *(id *)&self->_timestamp;
    *((unsigned char *)v5 + 76) |= 1u;
  }
  if (self->_sourceURL)
  {
    objc_msgSend(v5, "setSourceURL:");
    v4 = v5;
  }
  if (self->_countryCode)
  {
    objc_msgSend(v5, "setCountryCode:");
    v4 = v5;
  }
  if (self->_language)
  {
    objc_msgSend(v5, "setLanguage:");
    v4 = v5;
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
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOCachedCategorySuggestionsPlaceResponseReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOCachedCategorySuggestionsPlaceResponse *)self readAll:0];
  id v9 = [(GEOPDPlaceResponse *)self->_response copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 56) = self->_timestamp;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_sourceURL copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  uint64_t v13 = [(NSString *)self->_countryCode copyWithZone:a3];
  char v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  uint64_t v15 = [(NSString *)self->_language copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  int v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEOCachedCategorySuggestionsPlaceResponse *)self readAll:1];
  [v4 readAll:1];
  response = self->_response;
  if ((unint64_t)response | *((void *)v4 + 5))
  {
    if (!-[GEOPDPlaceResponse isEqual:](response, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_timestamp != *((double *)v4 + 7)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  sourceURL = self->_sourceURL;
  if ((unint64_t)sourceURL | *((void *)v4 + 6) && !-[NSString isEqual:](sourceURL, "isEqual:")) {
    goto LABEL_15;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_15;
    }
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 4)) {
    char v9 = -[NSString isEqual:](language, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  [(GEOCachedCategorySuggestionsPlaceResponse *)self readAll:1];
  unint64_t v3 = [(GEOPDPlaceResponse *)self->_response hash];
  if (*(unsigned char *)&self->_flags)
  {
    double timestamp = self->_timestamp;
    double v6 = -timestamp;
    if (timestamp >= 0.0) {
      double v6 = self->_timestamp;
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
  NSUInteger v10 = [(NSString *)self->_sourceURL hash];
  NSUInteger v11 = v9 ^ v10 ^ [(NSString *)self->_countryCode hash];
  return v11 ^ [(NSString *)self->_language hash];
}

- (void)mergeFrom:(id)a3
{
  long double v7 = (double *)a3;
  [v7 readAll:0];
  response = self->_response;
  uint64_t v5 = *((void *)v7 + 5);
  if (response)
  {
    if (v5) {
      -[GEOPDPlaceResponse mergeFrom:](response, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOCachedCategorySuggestionsPlaceResponse setResponse:](self, "setResponse:");
  }
  double v6 = v7;
  if (*((unsigned char *)v7 + 76))
  {
    self->_double timestamp = v7[7];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v7 + 6))
  {
    -[GEOCachedCategorySuggestionsPlaceResponse setSourceURL:](self, "setSourceURL:");
    double v6 = v7;
  }
  if (*((void *)v6 + 3))
  {
    -[GEOCachedCategorySuggestionsPlaceResponse setCountryCode:](self, "setCountryCode:");
    double v6 = v7;
  }
  if (*((void *)v6 + 4))
  {
    -[GEOCachedCategorySuggestionsPlaceResponse setLanguage:](self, "setLanguage:");
    double v6 = v7;
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
      GEOCachedCategorySuggestionsPlaceResponseReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_143);
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
  *(unsigned char *)&self->_flags |= 0x42u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOCachedCategorySuggestionsPlaceResponse *)self readAll:0];
    response = self->_response;
    [(GEOPDPlaceResponse *)response clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end