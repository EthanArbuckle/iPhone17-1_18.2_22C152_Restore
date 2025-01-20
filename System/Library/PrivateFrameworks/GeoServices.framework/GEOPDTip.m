@interface GEOPDTip
+ (id)tipsForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTip)init;
- (GEOPDTip)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)snippets;
- (id)tipId;
- (id)tipster;
- (unint64_t)hash;
- (void)_addNoFlagsSnippet:(uint64_t)a1;
- (void)_readSnippets;
- (void)_readTipId;
- (void)_readTipster;
- (void)addSnippet:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTip

+ (id)tipsForPlaceData:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__GEOPDTip_PlaceDataExtras__tipsForPlaceData___block_invoke;
  v10[3] = &unk_1E53E1940;
  id v11 = v5;
  id v6 = v5;
  [v4 enumerateValidComponentValuesOfType:36 usingBlock:v10];

  if ([v6 count]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

void __46__GEOPDTip_PlaceDataExtras__tipsForPlaceData___block_invoke(uint64_t a1, id *a2)
{
  v3 = -[GEOPDComponentValue tip](a2);
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    v3 = v4;
  }
}

- (GEOPDTip)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTip;
  v2 = [(GEOPDTip *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDTip)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTip;
  v3 = [(GEOPDTip *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSnippets
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
        GEOPDTipReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSnippets_tags_9001);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)snippets
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTip _readSnippets]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addSnippet:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTip _readSnippets](a1);
    -[GEOPDTip _addNoFlagsSnippet:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsSnippet:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readTipster
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
        GEOPDTipReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTipster_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)tipster
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTip _readTipster]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readTipId
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
        GEOPDTipReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTipId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)tipId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTip _readTipId]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTip;
  id v4 = [(GEOPDTip *)&v8 description];
  id v5 = [(GEOPDTip *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTip _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDTip readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 24))
    {
      id v5 = -[GEOPDTip snippets]((id *)a1);
      [v4 setObject:v5 forKey:@"snippet"];
    }
    if (*(unsigned char *)(a1 + 68))
    {
      objc_super v6 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
      if (a2) {
        id v7 = @"tipTime";
      }
      else {
        id v7 = @"tip_time";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = -[GEOPDTip tipster]((id *)a1);
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"tipster"];
    }
    id v11 = -[GEOPDTip tipId]((id *)a1);
    if (v11)
    {
      if (a2) {
        v12 = @"tipId";
      }
      else {
        v12 = @"tip_id";
      }
      [v4 setObject:v11 forKey:v12];
    }

    v13 = *(void **)(a1 + 16);
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __38__GEOPDTip__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEOPDTip _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_9018;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_9019;
      }
      GEOPDTipReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      -[GEOPDTipUser readAll:](*(void *)(a1 + 48), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __38__GEOPDTip__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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
  return GEOPDTipReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_9;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 0x24) != 0) {
    goto LABEL_9;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    tipster = self->_tipster;
    if (tipster)
    {
      os_unfair_lock_lock_with_options();
      BOOL IsDirty = _GEOPDTipUserIsDirty((uint64_t)tipster);
      os_unfair_lock_unlock(&tipster->_readerLock);
      if (IsDirty) {
        goto LABEL_9;
      }
      char flags = (char)self->_flags;
    }
  }
  if ((flags & 8) == 0)
  {
    v9 = self->_reader;
    objc_sync_enter(v9);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v10];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v9);
    goto LABEL_23;
  }
LABEL_9:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTip readAll:]((uint64_t)self, 0);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v11 = self->_snippets;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_tipster) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_tipId) {
    PBDataWriterWriteStringField();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v15);
LABEL_23:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDTipReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTip readAll:]((uint64_t)self, 0);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = self->_snippets;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        -[GEOPDTip addSnippet:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 40) = self->_tipTime;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  id v14 = -[GEOPDTipUser copyWithZone:](self->_tipster, "copyWithZone:", a3, (void)v20);
  long long v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  uint64_t v16 = [(NSString *)self->_tipId copyWithZone:a3];
  long long v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  long long v18 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v18;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  -[GEOPDTip readAll:]((uint64_t)self, 1);
  -[GEOPDTip readAll:]((uint64_t)v4, 1);
  snippets = self->_snippets;
  if ((unint64_t)snippets | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](snippets, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_tipTime != *((double *)v4 + 5)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  tipster = self->_tipster;
  if ((unint64_t)tipster | *((void *)v4 + 6) && !-[GEOPDTipUser isEqual:](tipster, "isEqual:")) {
    goto LABEL_13;
  }
  tipId = self->_tipId;
  if ((unint64_t)tipId | *((void *)v4 + 4)) {
    char v8 = -[NSString isEqual:](tipId, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDTip readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_snippets hash];
  if (*(unsigned char *)&self->_flags)
  {
    double tipTime = self->_tipTime;
    double v6 = -tipTime;
    if (tipTime >= 0.0) {
      double v6 = self->_tipTime;
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
  unint64_t v10 = [(GEOPDTipUser *)self->_tipster hash];
  return v9 ^ v10 ^ [(NSString *)self->_tipId hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipster, 0);
  objc_storeStrong((id *)&self->_tipId, 0);
  objc_storeStrong((id *)&self->_snippets, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end