@interface GEOTriggerPointRange
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDisplayTime;
- (BOOL)hasHideAtPoint;
- (BOOL)hasShowAtPoint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTriggerPoint)hideAtPoint;
- (GEOTriggerPoint)showAtPoint;
- (GEOTriggerPointRange)init;
- (GEOTriggerPointRange)initWithData:(id)a3;
- (GEOTriggerPointRange)initWithDictionary:(id)a3;
- (GEOTriggerPointRange)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)displayTime;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readHideAtPoint;
- (void)_readShowAtPoint;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDisplayTime:(unsigned int)a3;
- (void)setHasDisplayTime:(BOOL)a3;
- (void)setHideAtPoint:(id)a3;
- (void)setShowAtPoint:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTriggerPointRange

- (GEOTriggerPointRange)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTriggerPointRange;
  v2 = [(GEOTriggerPointRange *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTriggerPointRange)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTriggerPointRange;
  v3 = [(GEOTriggerPointRange *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readShowAtPoint
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
        GEOTriggerPointRangeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShowAtPoint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasShowAtPoint
{
  return self->_showAtPoint != 0;
}

- (GEOTriggerPoint)showAtPoint
{
  -[GEOTriggerPointRange _readShowAtPoint]((uint64_t)self);
  showAtPoint = self->_showAtPoint;

  return showAtPoint;
}

- (void)setShowAtPoint:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_showAtPoint, a3);
}

- (void)_readHideAtPoint
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
        GEOTriggerPointRangeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHideAtPoint_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasHideAtPoint
{
  return self->_hideAtPoint != 0;
}

- (GEOTriggerPoint)hideAtPoint
{
  -[GEOTriggerPointRange _readHideAtPoint]((uint64_t)self);
  hideAtPoint = self->_hideAtPoint;

  return hideAtPoint;
}

- (void)setHideAtPoint:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_hideAtPoint, a3);
}

- (unsigned)displayTime
{
  return self->_displayTime;
}

- (void)setDisplayTime:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_displayTime = a3;
}

- (void)setHasDisplayTime:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasDisplayTime
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTriggerPointRange;
  v4 = [(GEOTriggerPointRange *)&v8 description];
  v5 = [(GEOTriggerPointRange *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTriggerPointRange _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 showAtPoint];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"showAtPoint";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"show_at_point";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [(id)a1 hideAtPoint];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"hideAtPoint";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"hide_at_point";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if (*(unsigned char *)(a1 + 56))
    {
      v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        v14 = @"displayTime";
      }
      else {
        v14 = @"display_time";
      }
      [v4 setObject:v13 forKey:v14];
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
        v22[2] = __50__GEOTriggerPointRange__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEOTriggerPointRange _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOTriggerPointRange__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTriggerPointRange)initWithDictionary:(id)a3
{
  return (GEOTriggerPointRange *)-[GEOTriggerPointRange _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"showAtPoint";
      }
      else {
        objc_super v6 = @"show_at_point";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOTriggerPoint alloc];
        if (a3) {
          uint64_t v9 = [(GEOTriggerPoint *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOTriggerPoint *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setShowAtPoint:v9];
      }
      if (a3) {
        v11 = @"hideAtPoint";
      }
      else {
        v11 = @"hide_at_point";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOTriggerPoint alloc];
        if (a3) {
          uint64_t v14 = [(GEOTriggerPoint *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOTriggerPoint *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setHideAtPoint:v14];
      }
      if (a3) {
        v16 = @"displayTime";
      }
      else {
        v16 = @"display_time";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setDisplayTime:", objc_msgSend(v17, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOTriggerPointRange)initWithJSON:(id)a3
{
  return (GEOTriggerPointRange *)-[GEOTriggerPointRange _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_8590;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_8591;
    }
    GEOTriggerPointRangeReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOTriggerPoint *)self->_showAtPoint readAll:1];
    [(GEOTriggerPoint *)self->_hideAtPoint readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTriggerPointRangeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTriggerPointRangeReadAllFrom((uint64_t)self, a3, 0);
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
    [(GEOTriggerPointRange *)self readAll:0];
    if (self->_showAtPoint) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_hideAtPoint)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOTriggerPointRange *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_showAtPoint) {
    objc_msgSend(v4, "setShowAtPoint:");
  }
  if (self->_hideAtPoint) {
    objc_msgSend(v4, "setHideAtPoint:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 13) = self->_displayTime;
    *((unsigned char *)v4 + 56) |= 1u;
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
      GEOTriggerPointRangeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTriggerPointRange *)self readAll:0];
  id v9 = [(GEOTriggerPoint *)self->_showAtPoint copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  id v11 = [(GEOTriggerPoint *)self->_hideAtPoint copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_displayTime;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
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
    goto LABEL_10;
  }
  [(GEOTriggerPointRange *)self readAll:1];
  [v4 readAll:1];
  showAtPoint = self->_showAtPoint;
  if ((unint64_t)showAtPoint | *((void *)v4 + 4))
  {
    if (!-[GEOTriggerPoint isEqual:](showAtPoint, "isEqual:")) {
      goto LABEL_10;
    }
  }
  hideAtPoint = self->_hideAtPoint;
  if ((unint64_t)hideAtPoint | *((void *)v4 + 3))
  {
    if (!-[GEOTriggerPoint isEqual:](hideAtPoint, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) != 0 && self->_displayTime == *((_DWORD *)v4 + 13))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  [(GEOTriggerPointRange *)self readAll:1];
  unint64_t v3 = [(GEOTriggerPoint *)self->_showAtPoint hash];
  unint64_t v4 = [(GEOTriggerPoint *)self->_hideAtPoint hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v5 = 2654435761 * self->_displayTime;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v9 = a3;
  [v9 readAll:0];
  unint64_t v4 = v9;
  showAtPoint = self->_showAtPoint;
  uint64_t v6 = v9[4];
  if (showAtPoint)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOTriggerPoint mergeFrom:](showAtPoint, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOTriggerPointRange setShowAtPoint:](self, "setShowAtPoint:");
  }
  unint64_t v4 = v9;
LABEL_7:
  hideAtPoint = self->_hideAtPoint;
  uint64_t v8 = v4[3];
  if (hideAtPoint)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOTriggerPoint mergeFrom:](hideAtPoint, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOTriggerPointRange setHideAtPoint:](self, "setHideAtPoint:");
  }
  unint64_t v4 = v9;
LABEL_13:
  if (v4[7])
  {
    self->_displayTime = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
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
      GEOTriggerPointRangeReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8595);
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
    [(GEOTriggerPointRange *)self readAll:0];
    [(GEOTriggerPoint *)self->_showAtPoint clearUnknownFields:1];
    hideAtPoint = self->_hideAtPoint;
    [(GEOTriggerPoint *)hideAtPoint clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showAtPoint, 0);
  objc_storeStrong((id *)&self->_hideAtPoint, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end