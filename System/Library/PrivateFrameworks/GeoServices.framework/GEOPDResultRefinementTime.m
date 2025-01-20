@interface GEOPDResultRefinementTime
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDResultRefinementTime)init;
- (GEOPDResultRefinementTime)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)jsonRepresentation;
- (id)metadata;
- (unint64_t)hash;
- (void)_readDisplayName;
- (void)_readMetadata;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setDisplayName:(uint64_t)a1;
- (void)setMetadata:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultRefinementTime

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 64) |= 8u;
    *(unsigned char *)(a1 + 64) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinementTime readAll:](a1, 0);
      v5 = *(void **)(a1 + 32);
      [v5 clearUnknownFields:1];
    }
  }
}

- (GEOPDResultRefinementTime)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinementTime;
  v2 = [(GEOPDResultRefinementTime *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinementTime)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinementTime;
  v3 = [(GEOPDResultRefinementTime *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementTimeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayName_tags_1221);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)displayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementTime _readDisplayName]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDisplayName:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 64) |= 0x10u;
    *(unsigned char *)(a1 + 64) |= 0x40u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_readMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementTimeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetadata_tags_1222);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)metadata
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultRefinementTime _readMetadata]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setMetadata:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 64) |= 0x20u;
    *(unsigned char *)(a1 + 64) |= 0x40u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultRefinementTime;
  id v4 = [(GEOPDResultRefinementTime *)&v8 description];
  v5 = [(GEOPDResultRefinementTime *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinementTime _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDResultRefinementTime readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDResultRefinementTime displayName]((id *)a1);
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"displayName";
      }
      else {
        objc_super v6 = @"display_name";
      }
      [v4 setObject:v5 forKey:v6];
    }

    char v7 = *(unsigned char *)(a1 + 64);
    if (v7)
    {
      objc_super v8 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
      [v4 setObject:v8 forKey:@"timestamp"];

      char v7 = *(unsigned char *)(a1 + 64);
    }
    if ((v7 & 2) != 0)
    {
      v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 60)];
      if (a2) {
        v10 = @"isSelected";
      }
      else {
        v10 = @"is_selected";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = -[GEOPDResultRefinementTime metadata]((id *)a1);
    v12 = v11;
    if (v11)
    {
      if (a2) {
        [v11 jsonRepresentation];
      }
      else {
      v13 = [v11 dictionaryRepresentation];
      }
      [v4 setObject:v13 forKey:@"metadata"];
    }
    if ((*(unsigned char *)(a1 + 64) & 4) != 0)
    {
      v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 61)];
      if (a2) {
        v15 = @"usedNextDayForFilteration";
      }
      else {
        v15 = @"used_next_day_for_filteration";
      }
      [v4 setObject:v14 forKey:v15];
    }
    v16 = *(void **)(a1 + 16);
    if (v16)
    {
      v17 = [v16 dictionaryRepresentation];
      v18 = v17;
      if (a2)
      {
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __55__GEOPDResultRefinementTime__dictionaryRepresentation___block_invoke;
        v23[3] = &unk_1E53D8860;
        id v20 = v19;
        id v24 = v20;
        [v18 enumerateKeysAndObjectsUsingBlock:v23];
        id v21 = v20;

        v18 = v21;
      }
      [v4 setObject:v18 forKey:@"Unknown Fields"];
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
  return -[GEOPDResultRefinementTime _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_1232;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1233;
      }
      GEOPDResultRefinementTimeReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      [*(id *)(a1 + 32) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __55__GEOPDResultRefinementTime__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementTimeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDResultRefinementTimeIsDirty((uint64_t)self) & 1) == 0)
  {
    char v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinementTime readAll:]((uint64_t)self, 0);
    if (self->_displayName) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    id v6 = v9;
    if (flags)
    {
      PBDataWriterWriteDoubleField();
      id v6 = v9;
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v6 = v9;
    }
    if (self->_metadata)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v9;
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v6 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    char v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDResultRefinementTimeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultRefinementTime readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_displayName copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(double *)(v5 + 40) = self->_timestamp;
    *(unsigned char *)(v5 + 64) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 60) = self->_isSelected;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  id v12 = [(GEOPDResultRefinementMetadata *)self->_metadata copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 61) = self->_usedNextDayForFilteration;
    *(unsigned char *)(v5 + 64) |= 4u;
  }
  v14 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v14;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  -[GEOPDResultRefinementTime readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinementTime readAll:]((uint64_t)v4, 1);
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_22;
    }
  }
  char flags = (char)self->_flags;
  char v7 = *((unsigned char *)v4 + 64);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_timestamp != *((double *)v4 + 5)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0) {
      goto LABEL_22;
    }
    if (self->_isSelected)
    {
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 60))
    {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_22;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 4))
  {
    if (!-[GEOPDResultRefinementMetadata isEqual:](metadata, "isEqual:")) {
      goto LABEL_22;
    }
    char flags = (char)self->_flags;
    char v7 = *((unsigned char *)v4 + 64);
  }
  BOOL v9 = (v7 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) != 0)
    {
      if (self->_usedNextDayForFilteration)
      {
        if (!*((unsigned char *)v4 + 61)) {
          goto LABEL_22;
        }
      }
      else if (*((unsigned char *)v4 + 61))
      {
        goto LABEL_22;
      }
      BOOL v9 = 1;
      goto LABEL_23;
    }
LABEL_22:
    BOOL v9 = 0;
  }
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDResultRefinementTime readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_displayName hash];
  char flags = (char)self->_flags;
  if (flags)
  {
    double timestamp = self->_timestamp;
    double v7 = -timestamp;
    if (timestamp >= 0.0) {
      double v7 = self->_timestamp;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((flags & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_isSelected;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = [(GEOPDResultRefinementMetadata *)self->_metadata hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v12 = 2654435761 * self->_usedNextDayForFilteration;
  }
  else {
    uint64_t v12 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v11 ^ v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end