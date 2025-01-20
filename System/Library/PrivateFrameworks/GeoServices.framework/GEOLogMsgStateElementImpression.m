@interface GEOLogMsgStateElementImpression
+ (BOOL)isValid:(id)a3;
- (BOOL)hasElement;
- (BOOL)hasElementSource;
- (BOOL)hasImpressEvent;
- (BOOL)hasImpressNonvisibleTsInMs;
- (BOOL)hasImpressVisibleTsInMs;
- (BOOL)hasImpressionObjectId;
- (BOOL)hasQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOElementDetails)element;
- (GEOImpressionObjectId)impressionObjectId;
- (GEOLogMsgStateElementImpression)init;
- (GEOLogMsgStateElementImpression)initWithData:(id)a3;
- (GEOLogMsgStateElementImpression)initWithDictionary:(id)a3;
- (GEOLogMsgStateElementImpression)initWithJSON:(id)a3;
- (NSString)query;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)elementSourceAsString:(int)a3;
- (id)impressEventAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsElementSource:(id)a3;
- (int)StringAsImpressEvent:(id)a3;
- (int)elementSource;
- (int)impressEvent;
- (unint64_t)hash;
- (unint64_t)impressNonvisibleTsInMs;
- (unint64_t)impressVisibleTsInMs;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readElement;
- (void)_readImpressionObjectId;
- (void)_readQuery;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setElement:(id)a3;
- (void)setElementSource:(int)a3;
- (void)setHasElementSource:(BOOL)a3;
- (void)setHasImpressEvent:(BOOL)a3;
- (void)setHasImpressNonvisibleTsInMs:(BOOL)a3;
- (void)setHasImpressVisibleTsInMs:(BOOL)a3;
- (void)setImpressEvent:(int)a3;
- (void)setImpressNonvisibleTsInMs:(unint64_t)a3;
- (void)setImpressVisibleTsInMs:(unint64_t)a3;
- (void)setImpressionObjectId:(id)a3;
- (void)setQuery:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateElementImpression

- (GEOLogMsgStateElementImpression)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateElementImpression;
  v2 = [(GEOLogMsgStateElementImpression *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateElementImpression)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateElementImpression;
  v3 = [(GEOLogMsgStateElementImpression *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readElement
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
        GEOLogMsgStateElementImpressionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readElement_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasElement
{
  return self->_element != 0;
}

- (GEOElementDetails)element
{
  -[GEOLogMsgStateElementImpression _readElement]((uint64_t)self);
  element = self->_element;

  return element;
}

- (void)setElement:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_element, a3);
}

- (void)_readImpressionObjectId
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
        GEOLogMsgStateElementImpressionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImpressionObjectId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasImpressionObjectId
{
  return self->_impressionObjectId != 0;
}

- (GEOImpressionObjectId)impressionObjectId
{
  -[GEOLogMsgStateElementImpression _readImpressionObjectId]((uint64_t)self);
  impressionObjectId = self->_impressionObjectId;

  return impressionObjectId;
}

- (void)setImpressionObjectId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_impressionObjectId, a3);
}

- (void)_readQuery
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
        GEOLogMsgStateElementImpressionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readQuery_tags_7);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (NSString)query
{
  -[GEOLogMsgStateElementImpression _readQuery]((uint64_t)self);
  query = self->_query;

  return query;
}

- (void)setQuery:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (int)impressEvent
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0) {
    return self->_impressEvent;
  }
  else {
    return 0;
  }
}

- (void)setImpressEvent:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  self->_impressEvent = a3;
}

- (void)setHasImpressEvent:(BOOL)a3
{
  if (a3) {
    char v3 = -120;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasImpressEvent
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)impressEventAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7E30[a3];
  }

  return v3;
}

- (int)StringAsImpressEvent:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ImpressionEventType_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ImpressionEventType_VISIBLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ImpressionEventType_NONVISIBLE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)impressVisibleTsInMs
{
  return self->_impressVisibleTsInMs;
}

- (void)setImpressVisibleTsInMs:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_impressVisibleTsInMs = a3;
}

- (void)setHasImpressVisibleTsInMs:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasImpressVisibleTsInMs
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unint64_t)impressNonvisibleTsInMs
{
  return self->_impressNonvisibleTsInMs;
}

- (void)setImpressNonvisibleTsInMs:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_impressNonvisibleTsInMs = a3;
}

- (void)setHasImpressNonvisibleTsInMs:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasImpressNonvisibleTsInMs
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)elementSource
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0) {
    return self->_elementSource;
  }
  else {
    return 0;
  }
}

- (void)setElementSource:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  self->_elementSource = a3;
}

- (void)setHasElementSource:(BOOL)a3
{
  if (a3) {
    char v3 = -124;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasElementSource
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)elementSourceAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7E48[a3];
  }

  return v3;
}

- (int)StringAsElementSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ElementSource_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ElementSource_MAPS_SEARCH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ElementSource_PLACECARD_TRAY"])
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
  v8.super_class = (Class)GEOLogMsgStateElementImpression;
  int v4 = [(GEOLogMsgStateElementImpression *)&v8 description];
  v5 = [(GEOLogMsgStateElementImpression *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateElementImpression _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_41;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 element];
  objc_super v6 = v5;
  if (v5)
  {
    if (a2) {
      [v5 jsonRepresentation];
    }
    else {
    objc_super v7 = [v5 dictionaryRepresentation];
    }
    [v4 setObject:v7 forKey:@"element"];
  }
  objc_super v8 = [(id)a1 impressionObjectId];
  v9 = v8;
  if (v8)
  {
    if (a2)
    {
      v10 = [v8 jsonRepresentation];
      v11 = @"impressionObjectId";
    }
    else
    {
      v10 = [v8 dictionaryRepresentation];
      v11 = @"impression_object_id";
    }
    [v4 setObject:v10 forKey:v11];
  }
  v12 = [(id)a1 query];
  if (v12) {
    [v4 setObject:v12 forKey:@"query"];
  }

  char v13 = *(unsigned char *)(a1 + 76);
  if ((v13 & 8) != 0)
  {
    uint64_t v14 = *(int *)(a1 + 72);
    if (v14 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 72));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E53F7E30[v14];
    }
    if (a2) {
      v16 = @"impressEvent";
    }
    else {
      v16 = @"impress_event";
    }
    [v4 setObject:v15 forKey:v16];

    char v13 = *(unsigned char *)(a1 + 76);
  }
  if ((v13 & 2) == 0)
  {
    if ((v13 & 1) == 0) {
      goto LABEL_24;
    }
LABEL_30:
    v19 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
    if (a2) {
      v20 = @"impressNonvisibleTsInMs";
    }
    else {
      v20 = @"impress_nonvisible_ts_in_ms";
    }
    [v4 setObject:v19 forKey:v20];

    if ((*(unsigned char *)(a1 + 76) & 4) == 0) {
      goto LABEL_41;
    }
    goto LABEL_34;
  }
  v17 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  if (a2) {
    v18 = @"impressVisibleTsInMs";
  }
  else {
    v18 = @"impress_visible_ts_in_ms";
  }
  [v4 setObject:v17 forKey:v18];

  char v13 = *(unsigned char *)(a1 + 76);
  if (v13) {
    goto LABEL_30;
  }
LABEL_24:
  if ((v13 & 4) != 0)
  {
LABEL_34:
    uint64_t v21 = *(int *)(a1 + 68);
    if (v21 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E53F7E48[v21];
    }
    if (a2) {
      v23 = @"elementSource";
    }
    else {
      v23 = @"element_source";
    }
    [v4 setObject:v22 forKey:v23];
  }
LABEL_41:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateElementImpression _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateElementImpression)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateElementImpression *)-[GEOLogMsgStateElementImpression _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"element"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOElementDetails alloc];
        if (a3) {
          uint64_t v8 = [(GEOElementDetails *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOElementDetails *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setElement:v8];
      }
      if (a3) {
        v10 = @"impressionObjectId";
      }
      else {
        v10 = @"impression_object_id";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOImpressionObjectId alloc];
        if (a3) {
          uint64_t v13 = [(GEOImpressionObjectId *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOImpressionObjectId *)v12 initWithDictionary:v11];
        }
        uint64_t v14 = (void *)v13;
        [a1 setImpressionObjectId:v13];
      }
      v15 = [v5 objectForKeyedSubscript:@"query"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = (void *)[v15 copy];
        [a1 setQuery:v16];
      }
      if (a3) {
        v17 = @"impressEvent";
      }
      else {
        v17 = @"impress_event";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v18;
        if ([v19 isEqualToString:@"ImpressionEventType_UNKNOWN"])
        {
          uint64_t v20 = 0;
        }
        else if ([v19 isEqualToString:@"ImpressionEventType_VISIBLE"])
        {
          uint64_t v20 = 1;
        }
        else if ([v19 isEqualToString:@"ImpressionEventType_NONVISIBLE"])
        {
          uint64_t v20 = 2;
        }
        else
        {
          uint64_t v20 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_33;
        }
        uint64_t v20 = [v18 intValue];
      }
      [a1 setImpressEvent:v20];
LABEL_33:

      if (a3) {
        uint64_t v21 = @"impressVisibleTsInMs";
      }
      else {
        uint64_t v21 = @"impress_visible_ts_in_ms";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setImpressVisibleTsInMs:", objc_msgSend(v22, "unsignedLongLongValue"));
      }

      if (a3) {
        v23 = @"impressNonvisibleTsInMs";
      }
      else {
        v23 = @"impress_nonvisible_ts_in_ms";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setImpressNonvisibleTsInMs:", objc_msgSend(v24, "unsignedLongLongValue"));
      }

      if (a3) {
        v25 = @"elementSource";
      }
      else {
        v25 = @"element_source";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v27 = v26;
        if ([v27 isEqualToString:@"ElementSource_UNKNOWN"])
        {
          uint64_t v28 = 0;
        }
        else if ([v27 isEqualToString:@"ElementSource_MAPS_SEARCH"])
        {
          uint64_t v28 = 1;
        }
        else if ([v27 isEqualToString:@"ElementSource_PLACECARD_TRAY"])
        {
          uint64_t v28 = 2;
        }
        else
        {
          uint64_t v28 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_58:

          goto LABEL_59;
        }
        uint64_t v28 = [v26 intValue];
      }
      [a1 setElementSource:v28];
      goto LABEL_58;
    }
  }
LABEL_59:

  return a1;
}

- (GEOLogMsgStateElementImpression)initWithJSON:(id)a3
{
  return (GEOLogMsgStateElementImpression *)-[GEOLogMsgStateElementImpression _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_7263;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_7264;
    }
    GEOLogMsgStateElementImpressionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOElementDetails *)self->_element readAll:1];
    [(GEOImpressionObjectId *)self->_impressionObjectId readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateElementImpressionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateElementImpressionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if (*(unsigned char *)&self->_flags <= 0xFu)
    {
      objc_super v6 = self->_reader;
      objc_sync_enter(v6);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v8 writeData:v7];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v6);
      goto LABEL_19;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgStateElementImpression *)self readAll:0];
  if (self->_element) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_impressionObjectId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_query) {
    PBDataWriterWriteStringField();
  }
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_11:
      if ((flags & 1) == 0) {
        goto LABEL_12;
      }
LABEL_16:
      PBDataWriterWriteUint64Field();
      if ((*(unsigned char *)&self->_flags & 4) == 0) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field();
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_16;
  }
LABEL_12:
  if ((flags & 4) != 0) {
LABEL_17:
  }
    PBDataWriterWriteInt32Field();
LABEL_19:
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOLogMsgStateElementImpression *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_element) {
    objc_msgSend(v6, "setElement:");
  }
  if (self->_impressionObjectId) {
    objc_msgSend(v6, "setImpressionObjectId:");
  }
  int v4 = v6;
  if (self->_query)
  {
    objc_msgSend(v6, "setQuery:");
    int v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_impressEvent;
    *((unsigned char *)v4 + 76) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_9:
      if ((flags & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_9;
  }
  v4[4] = self->_impressVisibleTsInMs;
  *((unsigned char *)v4 + 76) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_10:
    if ((flags & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  v4[3] = self->_impressNonvisibleTsInMs;
  *((unsigned char *)v4 + 76) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 17) = self->_elementSource;
    *((unsigned char *)v4 + 76) |= 4u;
  }
LABEL_12:
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
    [(GEOLogMsgStateElementImpression *)self readAll:0];
    id v9 = [(GEOElementDetails *)self->_element copyWithZone:a3];
    v10 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v9;

    id v11 = [(GEOImpressionObjectId *)self->_impressionObjectId copyWithZone:a3];
    v12 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v11;

    uint64_t v13 = [(NSString *)self->_query copyWithZone:a3];
    uint64_t v14 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v13;

    char flags = (char)self->_flags;
    if ((flags & 8) != 0)
    {
      *(_DWORD *)(v5 + 72) = self->_impressEvent;
      *(unsigned char *)(v5 + 76) |= 8u;
      char flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0) {
          goto LABEL_8;
        }
        goto LABEL_13;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      goto LABEL_7;
    }
    *(void *)(v5 + 32) = self->_impressVisibleTsInMs;
    *(unsigned char *)(v5 + 76) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_8:
      if ((flags & 4) == 0) {
        return (id)v5;
      }
LABEL_9:
      *(_DWORD *)(v5 + 68) = self->_elementSource;
      *(unsigned char *)(v5 + 76) |= 4u;
      return (id)v5;
    }
LABEL_13:
    *(void *)(v5 + 24) = self->_impressNonvisibleTsInMs;
    *(unsigned char *)(v5 + 76) |= 1u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_9;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgStateElementImpressionReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  [(GEOLogMsgStateElementImpression *)self readAll:1];
  [v4 readAll:1];
  element = self->_element;
  if ((unint64_t)element | *((void *)v4 + 2))
  {
    if (!-[GEOElementDetails isEqual:](element, "isEqual:")) {
      goto LABEL_27;
    }
  }
  impressionObjectId = self->_impressionObjectId;
  if ((unint64_t)impressionObjectId | *((void *)v4 + 5))
  {
    if (!-[GEOImpressionObjectId isEqual:](impressionObjectId, "isEqual:")) {
      goto LABEL_27;
    }
  }
  query = self->_query;
  if ((unint64_t)query | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](query, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 8) == 0 || self->_impressEvent != *((_DWORD *)v4 + 18)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 8) != 0)
  {
LABEL_27:
    BOOL v8 = 0;
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_impressVisibleTsInMs != *((void *)v4 + 4)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_impressNonvisibleTsInMs != *((void *)v4 + 3)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_27;
  }
  BOOL v8 = (*((unsigned char *)v4 + 76) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) == 0 || self->_elementSource != *((_DWORD *)v4 + 17)) {
      goto LABEL_27;
    }
    BOOL v8 = 1;
  }
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateElementImpression *)self readAll:1];
  unint64_t v3 = [(GEOElementDetails *)self->_element hash];
  unint64_t v4 = [(GEOImpressionObjectId *)self->_impressionObjectId hash];
  NSUInteger v5 = [(NSString *)self->_query hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v6 = 2654435761 * self->_impressEvent;
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
LABEL_3:
      unint64_t v7 = 2654435761u * self->_impressVisibleTsInMs;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v8 = 0;
      if ((*(unsigned char *)&self->_flags & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v8 = 2654435761u * self->_impressNonvisibleTsInMs;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v9 = 2654435761 * self->_elementSource;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  v10 = a3;
  [v10 readAll:0];
  unint64_t v4 = v10;
  element = self->_element;
  uint64_t v6 = v10[2];
  if (element)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOElementDetails mergeFrom:](element, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOLogMsgStateElementImpression setElement:](self, "setElement:");
  }
  unint64_t v4 = v10;
LABEL_7:
  impressionObjectId = self->_impressionObjectId;
  uint64_t v8 = v4[5];
  if (impressionObjectId)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOImpressionObjectId mergeFrom:](impressionObjectId, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOLogMsgStateElementImpression setImpressionObjectId:](self, "setImpressionObjectId:");
  }
  unint64_t v4 = v10;
LABEL_13:
  if (v4[6])
  {
    -[GEOLogMsgStateElementImpression setQuery:](self, "setQuery:");
    unint64_t v4 = v10;
  }
  char v9 = *((unsigned char *)v4 + 76);
  if ((v9 & 8) != 0)
  {
    self->_impressEvent = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_flags |= 8u;
    char v9 = *((unsigned char *)v4 + 76);
    if ((v9 & 2) == 0)
    {
LABEL_17:
      if ((v9 & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) == 0)
  {
    goto LABEL_17;
  }
  self->_impressVisibleTsInMs = v4[4];
  *(unsigned char *)&self->_flags |= 2u;
  char v9 = *((unsigned char *)v4 + 76);
  if ((v9 & 1) == 0)
  {
LABEL_18:
    if ((v9 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_25:
  self->_impressNonvisibleTsInMs = v4[3];
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v4 + 76) & 4) != 0)
  {
LABEL_19:
    self->_elementSource = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_20:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_impressionObjectId, 0);
  objc_storeStrong((id *)&self->_element, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end