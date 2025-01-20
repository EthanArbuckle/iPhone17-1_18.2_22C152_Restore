@interface GEOLaunchAndGoCardText
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBody;
- (BOOL)hasCardTitle;
- (BOOL)hasCommuteTitle;
- (BOOL)hasRouteDescription;
- (BOOL)hasRouteTitle;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)cardTitle;
- (GEOFormattedString)routeDescription;
- (GEOFormattedString)routeTitle;
- (GEOLaunchAndGoCardText)init;
- (GEOLaunchAndGoCardText)initWithData:(id)a3;
- (GEOLaunchAndGoCardText)initWithDictionary:(id)a3;
- (GEOLaunchAndGoCardText)initWithJSON:(id)a3;
- (GEOPlaceFormattedString)body;
- (GEOPlaceFormattedString)commuteTitle;
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
- (void)_readCardTitle;
- (void)_readCommuteTitle;
- (void)_readRouteDescription;
- (void)_readRouteTitle;
- (void)_readTitle;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBody:(id)a3;
- (void)setCardTitle:(id)a3;
- (void)setCommuteTitle:(id)a3;
- (void)setRouteDescription:(id)a3;
- (void)setRouteTitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLaunchAndGoCardText

- (GEOLaunchAndGoCardText)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLaunchAndGoCardText;
  v2 = [(GEOLaunchAndGoCardText *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLaunchAndGoCardText)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLaunchAndGoCardText;
  v3 = [(GEOLaunchAndGoCardText *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCardTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLaunchAndGoCardTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCardTitle_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasCardTitle
{
  return self->_cardTitle != 0;
}

- (GEOFormattedString)cardTitle
{
  -[GEOLaunchAndGoCardText _readCardTitle]((uint64_t)self);
  cardTitle = self->_cardTitle;

  return cardTitle;
}

- (void)setCardTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_cardTitle, a3);
}

- (void)_readRouteTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLaunchAndGoCardTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteTitle_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasRouteTitle
{
  return self->_routeTitle != 0;
}

- (GEOFormattedString)routeTitle
{
  -[GEOLaunchAndGoCardText _readRouteTitle]((uint64_t)self);
  routeTitle = self->_routeTitle;

  return routeTitle;
}

- (void)setRouteTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_routeTitle, a3);
}

- (void)_readRouteDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLaunchAndGoCardTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasRouteDescription
{
  return self->_routeDescription != 0;
}

- (GEOFormattedString)routeDescription
{
  -[GEOLaunchAndGoCardText _readRouteDescription]((uint64_t)self);
  routeDescription = self->_routeDescription;

  return routeDescription;
}

- (void)setRouteDescription:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_routeDescription, a3);
}

- (void)_readTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLaunchAndGoCardTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_3746);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (GEOPlaceFormattedString)title
{
  -[GEOLaunchAndGoCardText _readTitle]((uint64_t)self);
  title = self->_title;

  return title;
}

- (void)setTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readCommuteTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLaunchAndGoCardTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCommuteTitle_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasCommuteTitle
{
  return self->_commuteTitle != 0;
}

- (GEOPlaceFormattedString)commuteTitle
{
  -[GEOLaunchAndGoCardText _readCommuteTitle]((uint64_t)self);
  commuteTitle = self->_commuteTitle;

  return commuteTitle;
}

- (void)setCommuteTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_commuteTitle, a3);
}

- (void)_readBody
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLaunchAndGoCardTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBody_tags_3747);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (GEOPlaceFormattedString)body
{
  -[GEOLaunchAndGoCardText _readBody]((uint64_t)self);
  body = self->_body;

  return body;
}

- (void)setBody:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_body, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLaunchAndGoCardText;
  v4 = [(GEOLaunchAndGoCardText *)&v8 description];
  v5 = [(GEOLaunchAndGoCardText *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLaunchAndGoCardText _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 cardTitle];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"cardTitle";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"card_title";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 routeTitle];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"routeTitle";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"route_title";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 routeDescription];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"routeDescription";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"route_description";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = [a1 title];
    v18 = v17;
    if (v17)
    {
      if (a2) {
        [v17 jsonRepresentation];
      }
      else {
      v19 = [v17 dictionaryRepresentation];
      }
      [v4 setObject:v19 forKey:@"title"];
    }
    v20 = [a1 commuteTitle];
    v21 = v20;
    if (v20)
    {
      if (a2)
      {
        v22 = [v20 jsonRepresentation];
        v23 = @"commuteTitle";
      }
      else
      {
        v22 = [v20 dictionaryRepresentation];
        v23 = @"commute_title";
      }
      [v4 setObject:v22 forKey:v23];
    }
    v24 = [a1 body];
    v25 = v24;
    if (v24)
    {
      if (a2) {
        [v24 jsonRepresentation];
      }
      else {
      v26 = [v24 dictionaryRepresentation];
      }
      [v4 setObject:v26 forKey:@"body"];
    }
    v27 = (void *)a1[2];
    if (v27)
    {
      v28 = [v27 dictionaryRepresentation];
      v29 = v28;
      if (a2)
      {
        v30 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __52__GEOLaunchAndGoCardText__dictionaryRepresentation___block_invoke;
        v34[3] = &unk_1E53D8860;
        id v31 = v30;
        id v35 = v31;
        [v29 enumerateKeysAndObjectsUsingBlock:v34];
        id v32 = v31;

        v29 = v32;
      }
      [v4 setObject:v29 forKey:@"Unknown Fields"];
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
  return -[GEOLaunchAndGoCardText _dictionaryRepresentation:](self, 1);
}

void __52__GEOLaunchAndGoCardText__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLaunchAndGoCardText)initWithDictionary:(id)a3
{
  return (GEOLaunchAndGoCardText *)-[GEOLaunchAndGoCardText _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"cardTitle";
      }
      else {
        objc_super v6 = @"card_title";
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
        [a1 setCardTitle:v9];
      }
      if (a3) {
        v11 = @"routeTitle";
      }
      else {
        v11 = @"route_title";
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
        [a1 setRouteTitle:v14];
      }
      if (a3) {
        v16 = @"routeDescription";
      }
      else {
        v16 = @"route_description";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v19 = [(GEOFormattedString *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOFormattedString *)v18 initWithDictionary:v17];
        }
        v20 = (void *)v19;
        [a1 setRouteDescription:v19];
      }
      v21 = [v5 objectForKeyedSubscript:@"title"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [GEOPlaceFormattedString alloc];
        if (a3) {
          uint64_t v23 = [(GEOPlaceFormattedString *)v22 initWithJSON:v21];
        }
        else {
          uint64_t v23 = [(GEOPlaceFormattedString *)v22 initWithDictionary:v21];
        }
        v24 = (void *)v23;
        [a1 setTitle:v23];
      }
      if (a3) {
        v25 = @"commuteTitle";
      }
      else {
        v25 = @"commute_title";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27 = [GEOPlaceFormattedString alloc];
        if (a3) {
          uint64_t v28 = [(GEOPlaceFormattedString *)v27 initWithJSON:v26];
        }
        else {
          uint64_t v28 = [(GEOPlaceFormattedString *)v27 initWithDictionary:v26];
        }
        v29 = (void *)v28;
        [a1 setCommuteTitle:v28];
      }
      v30 = [v5 objectForKeyedSubscript:@"body"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = [GEOPlaceFormattedString alloc];
        if (a3) {
          uint64_t v32 = [(GEOPlaceFormattedString *)v31 initWithJSON:v30];
        }
        else {
          uint64_t v32 = [(GEOPlaceFormattedString *)v31 initWithDictionary:v30];
        }
        v33 = (void *)v32;
        [a1 setBody:v32];
      }
    }
  }

  return a1;
}

- (GEOLaunchAndGoCardText)initWithJSON:(id)a3
{
  return (GEOLaunchAndGoCardText *)-[GEOLaunchAndGoCardText _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3772_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3773_0;
    }
    GEOLaunchAndGoCardTextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLaunchAndGoCardTextCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLaunchAndGoCardTextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLaunchAndGoCardTextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLaunchAndGoCardTextIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOLaunchAndGoCardText *)self readAll:0];
    if (self->_cardTitle) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_routeTitle)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_routeDescription)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_title)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_commuteTitle)
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
  [(GEOLaunchAndGoCardText *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 18) = self->_readerMarkPos;
  *((_DWORD *)v5 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_cardTitle) {
    objc_msgSend(v5, "setCardTitle:");
  }
  if (self->_routeTitle) {
    objc_msgSend(v5, "setRouteTitle:");
  }
  v4 = v5;
  if (self->_routeDescription)
  {
    objc_msgSend(v5, "setRouteDescription:");
    v4 = v5;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_commuteTitle)
  {
    objc_msgSend(v5, "setCommuteTitle:");
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
  if ((*(unsigned char *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLaunchAndGoCardText *)self readAll:0];
    id v8 = [(GEOFormattedString *)self->_cardTitle copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEOFormattedString *)self->_routeTitle copyWithZone:a3];
    v11 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v10;

    id v12 = [(GEOFormattedString *)self->_routeDescription copyWithZone:a3];
    v13 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v12;

    id v14 = [(GEOPlaceFormattedString *)self->_title copyWithZone:a3];
    v15 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v14;

    id v16 = [(GEOPlaceFormattedString *)self->_commuteTitle copyWithZone:a3];
    v17 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v16;

    id v18 = [(GEOPlaceFormattedString *)self->_body copyWithZone:a3];
    uint64_t v19 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v18;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLaunchAndGoCardTextReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLaunchAndGoCardText *)self readAll:1],
         [v4 readAll:1],
         cardTitle = self->_cardTitle,
         !((unint64_t)cardTitle | v4[4]))
     || -[GEOFormattedString isEqual:](cardTitle, "isEqual:"))
    && ((routeTitle = self->_routeTitle, !((unint64_t)routeTitle | v4[7]))
     || -[GEOFormattedString isEqual:](routeTitle, "isEqual:"))
    && ((routeDescription = self->_routeDescription, !((unint64_t)routeDescription | v4[6]))
     || -[GEOFormattedString isEqual:](routeDescription, "isEqual:"))
    && ((title = self->_title, !((unint64_t)title | v4[8]))
     || -[GEOPlaceFormattedString isEqual:](title, "isEqual:"))
    && ((commuteTitle = self->_commuteTitle, !((unint64_t)commuteTitle | v4[5]))
     || -[GEOPlaceFormattedString isEqual:](commuteTitle, "isEqual:")))
  {
    body = self->_body;
    if ((unint64_t)body | v4[3]) {
      char v11 = -[GEOPlaceFormattedString isEqual:](body, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  [(GEOLaunchAndGoCardText *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_cardTitle hash];
  unint64_t v4 = [(GEOFormattedString *)self->_routeTitle hash] ^ v3;
  unint64_t v5 = [(GEOFormattedString *)self->_routeDescription hash];
  unint64_t v6 = v4 ^ v5 ^ [(GEOPlaceFormattedString *)self->_title hash];
  unint64_t v7 = [(GEOPlaceFormattedString *)self->_commuteTitle hash];
  return v6 ^ v7 ^ [(GEOPlaceFormattedString *)self->_body hash];
}

- (void)mergeFrom:(id)a3
{
  id v16 = a3;
  [v16 readAll:0];
  cardTitle = self->_cardTitle;
  uint64_t v5 = v16[4];
  if (cardTitle)
  {
    if (v5) {
      -[GEOFormattedString mergeFrom:](cardTitle, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOLaunchAndGoCardText setCardTitle:](self, "setCardTitle:");
  }
  routeTitle = self->_routeTitle;
  uint64_t v7 = v16[7];
  if (routeTitle)
  {
    if (v7) {
      -[GEOFormattedString mergeFrom:](routeTitle, "mergeFrom:");
    }
  }
  else if (v7)
  {
    [(GEOLaunchAndGoCardText *)self setRouteTitle:"setRouteTitle:"];
  }
  routeDescription = self->_routeDescription;
  uint64_t v9 = v16[6];
  if (routeDescription)
  {
    if (v9) {
      -[GEOFormattedString mergeFrom:](routeDescription, "mergeFrom:");
    }
  }
  else if (v9)
  {
    [(GEOLaunchAndGoCardText *)self setRouteDescription:"setRouteDescription:"];
  }
  title = self->_title;
  uint64_t v11 = v16[8];
  if (title)
  {
    if (v11) {
      -[GEOPlaceFormattedString mergeFrom:](title, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOLaunchAndGoCardText setTitle:](self, "setTitle:");
  }
  commuteTitle = self->_commuteTitle;
  uint64_t v13 = v16[5];
  if (commuteTitle)
  {
    if (v13) {
      -[GEOPlaceFormattedString mergeFrom:](commuteTitle, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEOLaunchAndGoCardText setCommuteTitle:](self, "setCommuteTitle:");
  }
  body = self->_body;
  uint64_t v15 = v16[3];
  if (body)
  {
    if (v15) {
      -[GEOPlaceFormattedString mergeFrom:](body, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[GEOLaunchAndGoCardText setBody:](self, "setBody:");
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
      GEOLaunchAndGoCardTextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3777);
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
  *(unsigned char *)&self->_flags |= 0x81u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOLaunchAndGoCardText *)self readAll:0];
    [(GEOFormattedString *)self->_cardTitle clearUnknownFields:1];
    [(GEOFormattedString *)self->_routeTitle clearUnknownFields:1];
    [(GEOFormattedString *)self->_routeDescription clearUnknownFields:1];
    [(GEOPlaceFormattedString *)self->_title clearUnknownFields:1];
    [(GEOPlaceFormattedString *)self->_commuteTitle clearUnknownFields:1];
    body = self->_body;
    [(GEOPlaceFormattedString *)body clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_routeTitle, 0);
  objc_storeStrong((id *)&self->_routeDescription, 0);
  objc_storeStrong((id *)&self->_commuteTitle, 0);
  objc_storeStrong((id *)&self->_cardTitle, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end