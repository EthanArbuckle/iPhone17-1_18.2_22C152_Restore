@interface GEOAlertNonRecommendedRouteText
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBody;
- (BOOL)hasResponseAlertPrimary;
- (BOOL)hasResponseAlertSecondary;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAlertNonRecommendedRouteText)init;
- (GEOAlertNonRecommendedRouteText)initWithData:(id)a3;
- (GEOAlertNonRecommendedRouteText)initWithDictionary:(id)a3;
- (GEOAlertNonRecommendedRouteText)initWithJSON:(id)a3;
- (GEOFormattedString)responseAlertPrimary;
- (GEOFormattedString)responseAlertSecondary;
- (GEOPlaceFormattedString)body;
- (GEOPlaceFormattedString)title;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readBody;
- (void)_readResponseAlertPrimary;
- (void)_readResponseAlertSecondary;
- (void)_readTitle;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBody:(id)a3;
- (void)setResponseAlertPrimary:(id)a3;
- (void)setResponseAlertSecondary:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOAlertNonRecommendedRouteText

- (GEOAlertNonRecommendedRouteText)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAlertNonRecommendedRouteText;
  v2 = [(GEOAlertNonRecommendedRouteText *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAlertNonRecommendedRouteText)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAlertNonRecommendedRouteText;
  v3 = [(GEOAlertNonRecommendedRouteText *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readResponseAlertPrimary
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAlertNonRecommendedRouteTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResponseAlertPrimary_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasResponseAlertPrimary
{
  return self->_responseAlertPrimary != 0;
}

- (GEOFormattedString)responseAlertPrimary
{
  -[GEOAlertNonRecommendedRouteText _readResponseAlertPrimary]((uint64_t)self);
  responseAlertPrimary = self->_responseAlertPrimary;

  return responseAlertPrimary;
}

- (void)setResponseAlertPrimary:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_responseAlertPrimary, a3);
}

- (void)_readResponseAlertSecondary
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAlertNonRecommendedRouteTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResponseAlertSecondary_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasResponseAlertSecondary
{
  return self->_responseAlertSecondary != 0;
}

- (GEOFormattedString)responseAlertSecondary
{
  -[GEOAlertNonRecommendedRouteText _readResponseAlertSecondary]((uint64_t)self);
  responseAlertSecondary = self->_responseAlertSecondary;

  return responseAlertSecondary;
}

- (void)setResponseAlertSecondary:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_responseAlertSecondary, a3);
}

- (void)_readTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAlertNonRecommendedRouteTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_574);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (GEOPlaceFormattedString)title
{
  -[GEOAlertNonRecommendedRouteText _readTitle]((uint64_t)self);
  title = self->_title;

  return title;
}

- (void)setTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readBody
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAlertNonRecommendedRouteTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBody_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (GEOPlaceFormattedString)body
{
  -[GEOAlertNonRecommendedRouteText _readBody]((uint64_t)self);
  body = self->_body;

  return body;
}

- (void)setBody:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_body, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAlertNonRecommendedRouteText;
  v4 = [(GEOAlertNonRecommendedRouteText *)&v8 description];
  v5 = [(GEOAlertNonRecommendedRouteText *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAlertNonRecommendedRouteText _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 responseAlertPrimary];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"responseAlertPrimary";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"response_alert_primary";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 responseAlertSecondary];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"responseAlertSecondary";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"response_alert_secondary";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 title];
    v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      v15 = [v13 dictionaryRepresentation];
      }
      [v4 setObject:v15 forKey:@"title"];
    }
    v16 = [a1 body];
    v17 = v16;
    if (v16)
    {
      if (a2) {
        [v16 jsonRepresentation];
      }
      else {
      v18 = [v16 dictionaryRepresentation];
      }
      [v4 setObject:v18 forKey:@"body"];
    }
    v19 = (void *)a1[2];
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __61__GEOAlertNonRecommendedRouteText__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
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
  return -[GEOAlertNonRecommendedRouteText _dictionaryRepresentation:](self, 1);
}

void __61__GEOAlertNonRecommendedRouteText__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAlertNonRecommendedRouteText)initWithDictionary:(id)a3
{
  return (GEOAlertNonRecommendedRouteText *)-[GEOAlertNonRecommendedRouteText _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"responseAlertPrimary";
      }
      else {
        objc_super v6 = @"response_alert_primary";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setResponseAlertPrimary:v9];
      }
      if (a3) {
        v11 = @"responseAlertSecondary";
      }
      else {
        v11 = @"response_alert_secondary";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v14 = [(GEOFormattedString *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOFormattedString *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setResponseAlertSecondary:v14];
      }
      v16 = [v5 objectForKeyedSubscript:@"title"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [GEOPlaceFormattedString alloc];
        if (a3) {
          uint64_t v18 = [(GEOPlaceFormattedString *)v17 initWithJSON:v16];
        }
        else {
          uint64_t v18 = [(GEOPlaceFormattedString *)v17 initWithDictionary:v16];
        }
        v19 = (void *)v18;
        [a1 setTitle:v18];
      }
      v20 = [v5 objectForKeyedSubscript:@"body"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v21 = [GEOPlaceFormattedString alloc];
        if (a3) {
          uint64_t v22 = [(GEOPlaceFormattedString *)v21 initWithJSON:v20];
        }
        else {
          uint64_t v22 = [(GEOPlaceFormattedString *)v21 initWithDictionary:v20];
        }
        id v23 = (void *)v22;
        [a1 setBody:v22];
      }
    }
  }

  return a1;
}

- (GEOAlertNonRecommendedRouteText)initWithJSON:(id)a3
{
  return (GEOAlertNonRecommendedRouteText *)-[GEOAlertNonRecommendedRouteText _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_591;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_592;
    }
    GEOAlertNonRecommendedRouteTextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOAlertNonRecommendedRouteTextCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAlertNonRecommendedRouteTextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAlertNonRecommendedRouteTextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAlertNonRecommendedRouteTextIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOAlertNonRecommendedRouteText *)self readAll:0];
    if (self->_responseAlertPrimary) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_responseAlertSecondary)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_title)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_body)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOAlertNonRecommendedRouteText *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_responseAlertPrimary) {
    objc_msgSend(v5, "setResponseAlertPrimary:");
  }
  if (self->_responseAlertSecondary) {
    objc_msgSend(v5, "setResponseAlertSecondary:");
  }
  v4 = v5;
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_body)
  {
    objc_msgSend(v5, "setBody:");
    v4 = v5;
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
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOAlertNonRecommendedRouteText *)self readAll:0];
    id v8 = [(GEOFormattedString *)self->_responseAlertPrimary copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEOFormattedString *)self->_responseAlertSecondary copyWithZone:a3];
    v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    id v12 = [(GEOPlaceFormattedString *)self->_title copyWithZone:a3];
    v13 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v12;

    id v14 = [(GEOPlaceFormattedString *)self->_body copyWithZone:a3];
    v15 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOAlertNonRecommendedRouteTextReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOAlertNonRecommendedRouteText *)self readAll:1],
         [v4 readAll:1],
         responseAlertPrimary = self->_responseAlertPrimary,
         !((unint64_t)responseAlertPrimary | v4[4]))
     || -[GEOFormattedString isEqual:](responseAlertPrimary, "isEqual:"))
    && ((responseAlertSecondary = self->_responseAlertSecondary, !((unint64_t)responseAlertSecondary | v4[5]))
     || -[GEOFormattedString isEqual:](responseAlertSecondary, "isEqual:"))
    && ((title = self->_title, !((unint64_t)title | v4[6]))
     || -[GEOPlaceFormattedString isEqual:](title, "isEqual:")))
  {
    body = self->_body;
    if ((unint64_t)body | v4[3]) {
      char v9 = -[GEOPlaceFormattedString isEqual:](body, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  [(GEOAlertNonRecommendedRouteText *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_responseAlertPrimary hash];
  unint64_t v4 = [(GEOFormattedString *)self->_responseAlertSecondary hash] ^ v3;
  unint64_t v5 = [(GEOPlaceFormattedString *)self->_title hash];
  return v4 ^ v5 ^ [(GEOPlaceFormattedString *)self->_body hash];
}

- (void)mergeFrom:(id)a3
{
  id v12 = a3;
  [v12 readAll:0];
  responseAlertPrimary = self->_responseAlertPrimary;
  uint64_t v5 = v12[4];
  if (responseAlertPrimary)
  {
    if (v5) {
      -[GEOFormattedString mergeFrom:](responseAlertPrimary, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOAlertNonRecommendedRouteText setResponseAlertPrimary:](self, "setResponseAlertPrimary:");
  }
  responseAlertSecondary = self->_responseAlertSecondary;
  uint64_t v7 = v12[5];
  if (responseAlertSecondary)
  {
    if (v7) {
      -[GEOFormattedString mergeFrom:](responseAlertSecondary, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOAlertNonRecommendedRouteText setResponseAlertSecondary:](self, "setResponseAlertSecondary:");
  }
  title = self->_title;
  uint64_t v9 = v12[6];
  if (title)
  {
    if (v9) {
      -[GEOPlaceFormattedString mergeFrom:](title, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOAlertNonRecommendedRouteText setTitle:](self, "setTitle:");
  }
  body = self->_body;
  uint64_t v11 = v12[3];
  if (body)
  {
    if (v11) {
      -[GEOPlaceFormattedString mergeFrom:](body, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOAlertNonRecommendedRouteText setBody:](self, "setBody:");
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
      GEOAlertNonRecommendedRouteTextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_596);
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
  *(unsigned char *)&self->_flags |= 0x21u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOAlertNonRecommendedRouteText *)self readAll:0];
    [(GEOFormattedString *)self->_responseAlertPrimary clearUnknownFields:1];
    [(GEOFormattedString *)self->_responseAlertSecondary clearUnknownFields:1];
    [(GEOPlaceFormattedString *)self->_title clearUnknownFields:1];
    body = self->_body;
    [(GEOPlaceFormattedString *)body clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_responseAlertSecondary, 0);
  objc_storeStrong((id *)&self->_responseAlertPrimary, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end