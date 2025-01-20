@interface GEOPDPlaceSummaryLayoutTemplate
+ (BOOL)isValid:(id)a3;
+ (Class)templateEntryType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasTemplateId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceSummaryLayoutTemplate)init;
- (GEOPDPlaceSummaryLayoutTemplate)initWithData:(id)a3;
- (GEOPDPlaceSummaryLayoutTemplate)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryLayoutTemplate)initWithJSON:(id)a3;
- (NSMutableArray)templateEntrys;
- (NSString)templateId;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)templateEntryAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)templateEntrysCount;
- (void)_addNoFlagsTemplateEntry:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readTemplateEntrys;
- (void)_readTemplateId;
- (void)addTemplateEntry:(id)a3;
- (void)clearTemplateEntrys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setTemplateEntrys:(id)a3;
- (void)setTemplateId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryLayoutTemplate

- (GEOPDPlaceSummaryLayoutTemplate)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceSummaryLayoutTemplate;
  v2 = [(GEOPDPlaceSummaryLayoutTemplate *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceSummaryLayoutTemplate)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceSummaryLayoutTemplate;
  v3 = [(GEOPDPlaceSummaryLayoutTemplate *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTemplateId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutTemplateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTemplateId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasTemplateId
{
  return self->_templateId != 0;
}

- (NSString)templateId
{
  -[GEOPDPlaceSummaryLayoutTemplate _readTemplateId]((uint64_t)self);
  templateId = self->_templateId;

  return templateId;
}

- (void)setTemplateId:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_templateId, a3);
}

- (void)_readTemplateEntrys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutTemplateReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTemplateEntrys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)templateEntrys
{
  -[GEOPDPlaceSummaryLayoutTemplate _readTemplateEntrys]((uint64_t)self);
  templateEntrys = self->_templateEntrys;

  return templateEntrys;
}

- (void)setTemplateEntrys:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  templateEntrys = self->_templateEntrys;
  self->_templateEntrys = v4;
}

- (void)clearTemplateEntrys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  templateEntrys = self->_templateEntrys;

  [(NSMutableArray *)templateEntrys removeAllObjects];
}

- (void)addTemplateEntry:(id)a3
{
  id v4 = a3;
  -[GEOPDPlaceSummaryLayoutTemplate _readTemplateEntrys]((uint64_t)self);
  -[GEOPDPlaceSummaryLayoutTemplate _addNoFlagsTemplateEntry:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsTemplateEntry:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)templateEntrysCount
{
  -[GEOPDPlaceSummaryLayoutTemplate _readTemplateEntrys]((uint64_t)self);
  templateEntrys = self->_templateEntrys;

  return [(NSMutableArray *)templateEntrys count];
}

- (id)templateEntryAtIndex:(unint64_t)a3
{
  -[GEOPDPlaceSummaryLayoutTemplate _readTemplateEntrys]((uint64_t)self);
  templateEntrys = self->_templateEntrys;

  return (id)[(NSMutableArray *)templateEntrys objectAtIndex:a3];
}

+ (Class)templateEntryType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutTemplate;
  id v4 = [(GEOPDPlaceSummaryLayoutTemplate *)&v8 description];
  id v5 = [(GEOPDPlaceSummaryLayoutTemplate *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutTemplate _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 templateId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"templateId";
      }
      else {
        objc_super v6 = @"template_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if ([a1[2] count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = a1[2];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = objc_msgSend(v13, "dictionaryRepresentation", (void)v17);
            }
            objc_msgSend(v7, "addObject:", v14, (void)v17);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"templateEntry";
      }
      else {
        v15 = @"template_entry";
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v15, (void)v17);
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
  return -[GEOPDPlaceSummaryLayoutTemplate _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOPDPlaceSummaryLayoutTemplate)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutTemplate *)-[GEOPDPlaceSummaryLayoutTemplate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"templateId";
      }
      else {
        objc_super v6 = @"template_id";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = (void *)[v7 copy];
        [a1 setTemplateId:v8];
      }
      if (a3) {
        uint64_t v9 = @"templateEntry";
      }
      else {
        uint64_t v9 = @"template_entry";
      }
      uint64_t v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v21 = v10;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v17 = [GEOPDPlaceSummaryLayoutTemplateEntry alloc];
                if (a3) {
                  uint64_t v18 = [(GEOPDPlaceSummaryLayoutTemplateEntry *)v17 initWithJSON:v16];
                }
                else {
                  uint64_t v18 = [(GEOPDPlaceSummaryLayoutTemplateEntry *)v17 initWithDictionary:v16];
                }
                long long v19 = (void *)v18;
                [a1 addTemplateEntry:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v13);
        }

        uint64_t v10 = v21;
      }
    }
  }

  return a1;
}

- (GEOPDPlaceSummaryLayoutTemplate)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutTemplate *)-[GEOPDPlaceSummaryLayoutTemplate _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_277;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_278;
    }
    GEOPDPlaceSummaryLayoutTemplateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDPlaceSummaryLayoutTemplateCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutTemplateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutTemplateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceSummaryLayoutTemplateIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDPlaceSummaryLayoutTemplate *)self readAll:0];
    if (self->_templateId) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_templateEntrys;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOPDPlaceSummaryLayoutTemplate _readTemplateEntrys]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_templateEntrys;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOPDPlaceSummaryLayoutTemplate *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_templateId) {
    objc_msgSend(v8, "setTemplateId:");
  }
  if ([(GEOPDPlaceSummaryLayoutTemplate *)self templateEntrysCount])
  {
    [v8 clearTemplateEntrys];
    unint64_t v4 = [(GEOPDPlaceSummaryLayoutTemplate *)self templateEntrysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDPlaceSummaryLayoutTemplate *)self templateEntryAtIndex:i];
        [v8 addTemplateEntry:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPlaceSummaryLayoutTemplateReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDPlaceSummaryLayoutTemplate *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_templateId copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v10 = self->_templateEntrys;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [v5 addTemplateEntry:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPDPlaceSummaryLayoutTemplate *)self readAll:1],
         [v4 readAll:1],
         templateId = self->_templateId,
         !((unint64_t)templateId | v4[3]))
     || -[NSString isEqual:](templateId, "isEqual:")))
  {
    templateEntrys = self->_templateEntrys;
    if ((unint64_t)templateEntrys | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](templateEntrys, "isEqual:");
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

- (unint64_t)hash
{
  [(GEOPDPlaceSummaryLayoutTemplate *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_templateId hash];
  return [(NSMutableArray *)self->_templateEntrys hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[3]) {
    -[GEOPDPlaceSummaryLayoutTemplate setTemplateId:](self, "setTemplateId:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOPDPlaceSummaryLayoutTemplate addTemplateEntry:](self, "addTemplateEntry:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateId, 0);
  objc_storeStrong((id *)&self->_templateEntrys, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end