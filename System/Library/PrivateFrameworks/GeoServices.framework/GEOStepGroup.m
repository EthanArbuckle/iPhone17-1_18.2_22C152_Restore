@interface GEOStepGroup
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGroupInstruction;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)groupInstruction;
- (GEOStepGroup)init;
- (GEOStepGroup)initWithData:(id)a3;
- (GEOStepGroup)initWithDictionary:(id)a3;
- (GEOStepGroup)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)stepIdsCount;
- (unsigned)stepIdAtIndex:(unint64_t)a3;
- (unsigned)stepIds;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readGroupInstruction;
- (void)_readStepIds;
- (void)addStepId:(unsigned int)a3;
- (void)clearStepIds;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setGroupInstruction:(id)a3;
- (void)setStepIds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOStepGroup

- (GEOStepGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOStepGroup;
  v2 = [(GEOStepGroup *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOStepGroup)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOStepGroup;
  v3 = [(GEOStepGroup *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOStepGroup;
  [(GEOStepGroup *)&v3 dealloc];
}

- (void)_readGroupInstruction
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
        GEOStepGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGroupInstruction_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasGroupInstruction
{
  return self->_groupInstruction != 0;
}

- (GEOFormattedString)groupInstruction
{
  -[GEOStepGroup _readGroupInstruction]((uint64_t)self);
  groupInstruction = self->_groupInstruction;

  return groupInstruction;
}

- (void)setGroupInstruction:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_groupInstruction, a3);
}

- (void)_readStepIds
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
        GEOStepGroupReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStepIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)stepIdsCount
{
  return self->_stepIds.count;
}

- (unsigned)stepIds
{
  return self->_stepIds.list;
}

- (void)clearStepIds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedUInt32Clear();
}

- (void)addStepId:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (unsigned)stepIdAtIndex:(unint64_t)a3
{
  -[GEOStepGroup _readStepIds]((uint64_t)self);
  p_stepIds = &self->_stepIds;
  unint64_t count = self->_stepIds.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_stepIds->list[a3];
}

- (void)setStepIds:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147400](&self->_stepIds, a3, a4);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOStepGroup;
  v4 = [(GEOStepGroup *)&v8 description];
  v5 = [(GEOStepGroup *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStepGroup _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 groupInstruction];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"groupInstruction";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"group_instruction";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (a1[4])
    {
      v9 = PBRepeatedUInt32NSArray();
      if (a2) {
        v10 = @"stepId";
      }
      else {
        v10 = @"step_id";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = (void *)a1[2];
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __42__GEOStepGroup__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOStepGroup _dictionaryRepresentation:](self, 1);
}

void __42__GEOStepGroup__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOStepGroup)initWithDictionary:(id)a3
{
  return (GEOStepGroup *)-[GEOStepGroup _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"groupInstruction";
      }
      else {
        objc_super v6 = @"group_instruction";
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
        [a1 setGroupInstruction:v9];
      }
      if (a3) {
        v11 = @"stepId";
      }
      else {
        v11 = @"step_id";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v21 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addStepId:", objc_msgSend(v18, "unsignedIntValue", (void)v20));
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v15);
        }
      }
    }
  }

  return a1;
}

- (GEOStepGroup)initWithJSON:(id)a3
{
  return (GEOStepGroup *)-[GEOStepGroup _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_7451;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_7452;
    }
    GEOStepGroupReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOFormattedString *)self->_groupInstruction readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStepGroupIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStepGroupReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOStepGroupIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v7 = self->_reader;
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
    [(GEOStepGroup *)self readAll:0];
    if (self->_groupInstruction) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v9;
    if (self->_stepIds.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        id v5 = v9;
        ++v6;
      }
      while (v6 < self->_stepIds.count);
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  objc_super v7 = (id *)a3;
  [(GEOStepGroup *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 14) = self->_readerMarkPos;
  *((_DWORD *)v7 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_groupInstruction) {
    objc_msgSend(v7, "setGroupInstruction:");
  }
  if ([(GEOStepGroup *)self stepIdsCount])
  {
    [v7 clearStepIds];
    unint64_t v4 = [(GEOStepGroup *)self stepIdsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addStepId:", -[GEOStepGroup stepIdAtIndex:](self, "stepIdAtIndex:", i));
    }
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
    [(GEOStepGroup *)self readAll:0];
    id v8 = [(GEOFormattedString *)self->_groupInstruction copyWithZone:a3];
    id v9 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v8;

    PBRepeatedUInt32Copy();
    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOStepGroupReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOStepGroup *)self readAll:1],
         [v4 readAll:1],
         groupInstruction = self->_groupInstruction,
         !((unint64_t)groupInstruction | v4[6]))
     || -[GEOFormattedString isEqual:](groupInstruction, "isEqual:")))
  {
    char IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  [(GEOStepGroup *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_groupInstruction hash];
  return PBRepeatedUInt32Hash() ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v10 = a3;
  [v10 readAll:0];
  unint64_t v4 = v10;
  groupInstruction = self->_groupInstruction;
  uint64_t v6 = v10[6];
  if (groupInstruction)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOFormattedString mergeFrom:](groupInstruction, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOStepGroup setGroupInstruction:](self, "setGroupInstruction:");
  }
  unint64_t v4 = v10;
LABEL_7:
  uint64_t v7 = [v4 stepIdsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[GEOStepGroup addStepId:](self, "addStepId:", [v10 stepIdAtIndex:i]);
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
      GEOStepGroupReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7456);
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
    [(GEOStepGroup *)self readAll:0];
    groupInstruction = self->_groupInstruction;
    [(GEOFormattedString *)groupInstruction clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupInstruction, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end