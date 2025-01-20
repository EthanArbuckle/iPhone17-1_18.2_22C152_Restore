@interface NMTileRequest
+ (Class)baseHeadersType;
+ (Class)localizationHeadersType;
- (BOOL)hasBaseURL;
- (BOOL)hasCachedBaseETag;
- (BOOL)hasCachedETag;
- (BOOL)hasCachedLocalizationETag;
- (BOOL)hasChecksumMethod;
- (BOOL)hasLocalizationURL;
- (BOOL)hasPriority;
- (BOOL)hasTileKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)tileKey;
- (NSMutableArray)baseHeaders;
- (NSMutableArray)localizationHeaders;
- (NSString)baseURL;
- (NSString)cachedBaseETag;
- (NSString)cachedETag;
- (NSString)cachedLocalizationETag;
- (NSString)localizationURL;
- (id)baseHeadersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)localizationHeadersAtIndex:(unint64_t)a3;
- (int)checksumMethod;
- (unint64_t)baseHeadersCount;
- (unint64_t)hash;
- (unint64_t)localizationHeadersCount;
- (unsigned)priority;
- (void)addBaseHeaders:(id)a3;
- (void)addLocalizationHeaders:(id)a3;
- (void)clearBaseHeaders;
- (void)clearLocalizationHeaders;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBaseHeaders:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCachedBaseETag:(id)a3;
- (void)setCachedETag:(id)a3;
- (void)setCachedLocalizationETag:(id)a3;
- (void)setChecksumMethod:(int)a3;
- (void)setHasChecksumMethod:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setLocalizationHeaders:(id)a3;
- (void)setLocalizationURL:(id)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setTileKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NMTileRequest

- (BOOL)hasTileKey
{
  return self->_tileKey != 0;
}

- (BOOL)hasCachedETag
{
  return self->_cachedETag != 0;
}

- (BOOL)hasBaseURL
{
  return self->_baseURL != 0;
}

- (void)clearBaseHeaders
{
}

- (void)addBaseHeaders:(id)a3
{
  id v4 = a3;
  baseHeaders = self->_baseHeaders;
  id v8 = v4;
  if (!baseHeaders)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_baseHeaders;
    self->_baseHeaders = v6;

    id v4 = v8;
    baseHeaders = self->_baseHeaders;
  }
  [(NSMutableArray *)baseHeaders addObject:v4];
}

- (unint64_t)baseHeadersCount
{
  return (unint64_t)[(NSMutableArray *)self->_baseHeaders count];
}

- (id)baseHeadersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_baseHeaders objectAtIndex:a3];
}

+ (Class)baseHeadersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCachedBaseETag
{
  return self->_cachedBaseETag != 0;
}

- (BOOL)hasLocalizationURL
{
  return self->_localizationURL != 0;
}

- (void)clearLocalizationHeaders
{
}

- (void)addLocalizationHeaders:(id)a3
{
  id v4 = a3;
  localizationHeaders = self->_localizationHeaders;
  id v8 = v4;
  if (!localizationHeaders)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_localizationHeaders;
    self->_localizationHeaders = v6;

    id v4 = v8;
    localizationHeaders = self->_localizationHeaders;
  }
  [(NSMutableArray *)localizationHeaders addObject:v4];
}

- (unint64_t)localizationHeadersCount
{
  return (unint64_t)[(NSMutableArray *)self->_localizationHeaders count];
}

- (id)localizationHeadersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_localizationHeaders objectAtIndex:a3];
}

+ (Class)localizationHeadersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCachedLocalizationETag
{
  return self->_cachedLocalizationETag != 0;
}

- (void)setChecksumMethod:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_checksumMethod = a3;
}

- (void)setHasChecksumMethod:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChecksumMethod
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPriority:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPriority
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NMTileRequest;
  char v3 = [(NMTileRequest *)&v7 description];
  id v4 = [(NMTileRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  tileKey = self->_tileKey;
  if (tileKey) {
    [v3 setObject:tileKey forKey:@"tileKey"];
  }
  cachedETag = self->_cachedETag;
  if (cachedETag) {
    [v4 setObject:cachedETag forKey:@"cachedETag"];
  }
  baseURL = self->_baseURL;
  if (baseURL) {
    [v4 setObject:baseURL forKey:@"baseURL"];
  }
  if ([(NSMutableArray *)self->_baseHeaders count])
  {
    id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_baseHeaders, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v9 = self->_baseHeaders;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v33 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"baseHeaders"];
  }
  cachedBaseETag = self->_cachedBaseETag;
  if (cachedBaseETag) {
    [v4 setObject:cachedBaseETag forKey:@"cachedBaseETag"];
  }
  localizationURL = self->_localizationURL;
  if (localizationURL) {
    [v4 setObject:localizationURL forKey:@"localizationURL"];
  }
  if ([(NSMutableArray *)self->_localizationHeaders count])
  {
    id v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_localizationHeaders, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v18 = self->_localizationHeaders;
    id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)j), "dictionaryRepresentation", (void)v29);
          [v17 addObject:v23];
        }
        id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v20);
    }

    [v4 setObject:v17 forKey:@"localizationHeaders"];
  }
  cachedLocalizationETag = self->_cachedLocalizationETag;
  if (cachedLocalizationETag) {
    [v4 setObject:cachedLocalizationETag forKey:@"cachedLocalizationETag"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v26 = +[NSNumber numberWithInt:self->_checksumMethod];
    [v4 setObject:v26 forKey:@"checksumMethod"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v27 = +[NSNumber numberWithUnsignedInt:self->_priority];
    [v4 setObject:v27 forKey:@"priority"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NMTileRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_tileKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_cachedETag) {
    PBDataWriterWriteStringField();
  }
  if (self->_baseURL) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_baseHeaders;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  if (self->_cachedBaseETag) {
    PBDataWriterWriteStringField();
  }
  if (self->_localizationURL) {
    PBDataWriterWriteStringField();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = self->_localizationHeaders;
  id v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  if (self->_cachedLocalizationETag) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v13 = a3;
  if (self->_tileKey) {
    objc_msgSend(v13, "setTileKey:");
  }
  if (self->_cachedETag) {
    objc_msgSend(v13, "setCachedETag:");
  }
  if (self->_baseURL) {
    objc_msgSend(v13, "setBaseURL:");
  }
  if ([(NMTileRequest *)self baseHeadersCount])
  {
    [v13 clearBaseHeaders];
    unint64_t v4 = [(NMTileRequest *)self baseHeadersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(NMTileRequest *)self baseHeadersAtIndex:i];
        [v13 addBaseHeaders:v7];
      }
    }
  }
  if (self->_cachedBaseETag) {
    objc_msgSend(v13, "setCachedBaseETag:");
  }
  if (self->_localizationURL) {
    objc_msgSend(v13, "setLocalizationURL:");
  }
  if ([(NMTileRequest *)self localizationHeadersCount])
  {
    [v13 clearLocalizationHeaders];
    unint64_t v8 = [(NMTileRequest *)self localizationHeadersCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        id v11 = [(NMTileRequest *)self localizationHeadersAtIndex:j];
        [v13 addLocalizationHeaders:v11];
      }
    }
  }
  if (self->_cachedLocalizationETag) {
    objc_msgSend(v13, "setCachedLocalizationETag:");
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v13 + 12) = self->_checksumMethod;
    *((unsigned char *)v13 + 88) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v13 + 18) = self->_priority;
    *((unsigned char *)v13 + 88) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_tileKey copyWithZone:a3];
  objc_super v7 = (void *)v5[10];
  v5[10] = v6;

  id v8 = [(NSString *)self->_cachedETag copyWithZone:a3];
  unint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(NSString *)self->_baseURL copyWithZone:a3];
  id v11 = (void *)v5[2];
  v5[2] = v10;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v12 = self->_baseHeaders;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v36 + 1) + 8 * i) copyWithZone:a3];
        [v5 addBaseHeaders:v17];
      }
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v14);
  }

  id v18 = [(NSString *)self->_cachedBaseETag copyWithZone:a3];
  long long v19 = (void *)v5[3];
  v5[3] = v18;

  id v20 = [(NSString *)self->_localizationURL copyWithZone:a3];
  long long v21 = (void *)v5[8];
  v5[8] = v20;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v22 = self->_localizationHeaders;
  id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v24; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v33 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * (void)j), "copyWithZone:", a3, (void)v32);
        [v5 addLocalizationHeaders:v27];
      }
      id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v24);
  }

  id v28 = [(NSString *)self->_cachedLocalizationETag copyWithZone:a3];
  long long v29 = (void *)v5[5];
  v5[5] = v28;

  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 12) = self->_checksumMethod;
    *((unsigned char *)v5 + 88) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 18) = self->_priority;
    *((unsigned char *)v5 + 88) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  tileKey = self->_tileKey;
  if ((unint64_t)tileKey | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](tileKey, "isEqual:")) {
      goto LABEL_27;
    }
  }
  cachedETag = self->_cachedETag;
  if ((unint64_t)cachedETag | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](cachedETag, "isEqual:")) {
      goto LABEL_27;
    }
  }
  baseURL = self->_baseURL;
  if ((unint64_t)baseURL | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](baseURL, "isEqual:")) {
      goto LABEL_27;
    }
  }
  baseHeaders = self->_baseHeaders;
  if ((unint64_t)baseHeaders | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](baseHeaders, "isEqual:")) {
      goto LABEL_27;
    }
  }
  cachedBaseETag = self->_cachedBaseETag;
  if ((unint64_t)cachedBaseETag | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](cachedBaseETag, "isEqual:")) {
      goto LABEL_27;
    }
  }
  localizationURL = self->_localizationURL;
  if ((unint64_t)localizationURL | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](localizationURL, "isEqual:")) {
      goto LABEL_27;
    }
  }
  localizationHeaders = self->_localizationHeaders;
  if ((unint64_t)localizationHeaders | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](localizationHeaders, "isEqual:")) {
      goto LABEL_27;
    }
  }
  cachedLocalizationETag = self->_cachedLocalizationETag;
  if ((unint64_t)cachedLocalizationETag | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](cachedLocalizationETag, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_checksumMethod != *((_DWORD *)v4 + 12)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
LABEL_27:
    BOOL v13 = 0;
    goto LABEL_28;
  }
  BOOL v13 = (*((unsigned char *)v4 + 88) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_priority != *((_DWORD *)v4 + 18)) {
      goto LABEL_27;
    }
    BOOL v13 = 1;
  }
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_tileKey hash];
  NSUInteger v4 = [(NSString *)self->_cachedETag hash];
  NSUInteger v5 = [(NSString *)self->_baseURL hash];
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_baseHeaders hash];
  NSUInteger v7 = [(NSString *)self->_cachedBaseETag hash];
  NSUInteger v8 = [(NSString *)self->_localizationURL hash];
  unint64_t v9 = (unint64_t)[(NSMutableArray *)self->_localizationHeaders hash];
  NSUInteger v10 = [(NSString *)self->_cachedLocalizationETag hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v11 = 2654435761 * self->_checksumMethod;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v12 = 2654435761 * self->_priority;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 10)) {
    -[NMTileRequest setTileKey:](self, "setTileKey:");
  }
  if (*((void *)v4 + 4)) {
    -[NMTileRequest setCachedETag:](self, "setCachedETag:");
  }
  if (*((void *)v4 + 2)) {
    -[NMTileRequest setBaseURL:](self, "setBaseURL:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *((id *)v4 + 1);
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NMTileRequest *)self addBaseHeaders:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 3)) {
    -[NMTileRequest setCachedBaseETag:](self, "setCachedBaseETag:");
  }
  if (*((void *)v4 + 8)) {
    -[NMTileRequest setLocalizationURL:](self, "setLocalizationURL:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = *((id *)v4 + 7);
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NMTileRequest addLocalizationHeaders:](self, "addLocalizationHeaders:", *(void *)(*((void *)&v16 + 1) + 8 * (void)j), (void)v16);
      }
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 5)) {
    -[NMTileRequest setCachedLocalizationETag:](self, "setCachedLocalizationETag:");
  }
  char v15 = *((unsigned char *)v4 + 88);
  if (v15)
  {
    self->_checksumMethod = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
    char v15 = *((unsigned char *)v4 + 88);
  }
  if ((v15 & 2) != 0)
  {
    self->_priority = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSData)tileKey
{
  return self->_tileKey;
}

- (void)setTileKey:(id)a3
{
}

- (NSString)cachedETag
{
  return self->_cachedETag;
}

- (void)setCachedETag:(id)a3
{
}

- (NSString)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (NSMutableArray)baseHeaders
{
  return self->_baseHeaders;
}

- (void)setBaseHeaders:(id)a3
{
}

- (NSString)cachedBaseETag
{
  return self->_cachedBaseETag;
}

- (void)setCachedBaseETag:(id)a3
{
}

- (NSString)localizationURL
{
  return self->_localizationURL;
}

- (void)setLocalizationURL:(id)a3
{
}

- (NSMutableArray)localizationHeaders
{
  return self->_localizationHeaders;
}

- (void)setLocalizationHeaders:(id)a3
{
}

- (NSString)cachedLocalizationETag
{
  return self->_cachedLocalizationETag;
}

- (void)setCachedLocalizationETag:(id)a3
{
}

- (int)checksumMethod
{
  return self->_checksumMethod;
}

- (unsigned)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileKey, 0);
  objc_storeStrong((id *)&self->_localizationURL, 0);
  objc_storeStrong((id *)&self->_localizationHeaders, 0);
  objc_storeStrong((id *)&self->_cachedLocalizationETag, 0);
  objc_storeStrong((id *)&self->_cachedETag, 0);
  objc_storeStrong((id *)&self->_cachedBaseETag, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);

  objc_storeStrong((id *)&self->_baseHeaders, 0);
}

@end