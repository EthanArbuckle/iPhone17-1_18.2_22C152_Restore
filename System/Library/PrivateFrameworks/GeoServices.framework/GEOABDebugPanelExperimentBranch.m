@interface GEOABDebugPanelExperimentBranch
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBranchLabel;
- (BOOL)hasBranchName;
- (BOOL)hasExperimentId;
- (BOOL)hasExperimentName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOABDebugPanelExperimentBranch)init;
- (GEOABDebugPanelExperimentBranch)initWithData:(id)a3;
- (GEOABDebugPanelExperimentBranch)initWithDictionary:(id)a3;
- (GEOABDebugPanelExperimentBranch)initWithJSON:(id)a3;
- (NSString)branchLabel;
- (NSString)branchName;
- (NSString)experimentId;
- (NSString)experimentName;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readBranchLabel;
- (void)_readBranchName;
- (void)_readExperimentId;
- (void)_readExperimentName;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBranchLabel:(id)a3;
- (void)setBranchName:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setExperimentName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOABDebugPanelExperimentBranch

- (GEOABDebugPanelExperimentBranch)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOABDebugPanelExperimentBranch;
  v2 = [(GEOABDebugPanelExperimentBranch *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOABDebugPanelExperimentBranch)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOABDebugPanelExperimentBranch;
  v3 = [(GEOABDebugPanelExperimentBranch *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readExperimentId
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
        GEOABDebugPanelExperimentBranchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExperimentId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

- (NSString)experimentId
{
  -[GEOABDebugPanelExperimentBranch _readExperimentId]((uint64_t)self);
  experimentId = self->_experimentId;

  return experimentId;
}

- (void)setExperimentId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_experimentId, a3);
}

- (void)_readExperimentName
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
        GEOABDebugPanelExperimentBranchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readExperimentName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasExperimentName
{
  return self->_experimentName != 0;
}

- (NSString)experimentName
{
  -[GEOABDebugPanelExperimentBranch _readExperimentName]((uint64_t)self);
  experimentName = self->_experimentName;

  return experimentName;
}

- (void)setExperimentName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_experimentName, a3);
}

- (void)_readBranchLabel
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
        GEOABDebugPanelExperimentBranchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBranchLabel_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasBranchLabel
{
  return self->_branchLabel != 0;
}

- (NSString)branchLabel
{
  -[GEOABDebugPanelExperimentBranch _readBranchLabel]((uint64_t)self);
  branchLabel = self->_branchLabel;

  return branchLabel;
}

- (void)setBranchLabel:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_branchLabel, a3);
}

- (void)_readBranchName
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
        GEOABDebugPanelExperimentBranchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBranchName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasBranchName
{
  return self->_branchName != 0;
}

- (NSString)branchName
{
  -[GEOABDebugPanelExperimentBranch _readBranchName]((uint64_t)self);
  branchName = self->_branchName;

  return branchName;
}

- (void)setBranchName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_branchName, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOABDebugPanelExperimentBranch;
  v4 = [(GEOABDebugPanelExperimentBranch *)&v8 description];
  v5 = [(GEOABDebugPanelExperimentBranch *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABDebugPanelExperimentBranch _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 experimentId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"experimentId";
      }
      else {
        objc_super v6 = @"experiment_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 experimentName];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"experimentName";
      }
      else {
        objc_super v8 = @"experiment_name";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [a1 branchLabel];
    if (v9)
    {
      if (a2) {
        v10 = @"branchLabel";
      }
      else {
        v10 = @"branch_label";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = [a1 branchName];
    if (v11)
    {
      if (a2) {
        v12 = @"branchName";
      }
      else {
        v12 = @"branch_name";
      }
      [v4 setObject:v11 forKey:v12];
    }

    v13 = (void *)a1[2];
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __61__GEOABDebugPanelExperimentBranch__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOABDebugPanelExperimentBranch _dictionaryRepresentation:](self, 1);
}

void __61__GEOABDebugPanelExperimentBranch__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOABDebugPanelExperimentBranch)initWithDictionary:(id)a3
{
  return (GEOABDebugPanelExperimentBranch *)-[GEOABDebugPanelExperimentBranch _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"experimentId";
      }
      else {
        objc_super v6 = @"experiment_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setExperimentId:v8];
      }
      if (a3) {
        v9 = @"experimentName";
      }
      else {
        v9 = @"experiment_name";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setExperimentName:v11];
      }
      if (a3) {
        v12 = @"branchLabel";
      }
      else {
        v12 = @"branch_label";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setBranchLabel:v14];
      }
      if (a3) {
        v15 = @"branchName";
      }
      else {
        v15 = @"branch_name";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = (void *)[v16 copy];
        [a1 setBranchName:v17];
      }
    }
  }

  return a1;
}

- (GEOABDebugPanelExperimentBranch)initWithJSON:(id)a3
{
  return (GEOABDebugPanelExperimentBranch *)-[GEOABDebugPanelExperimentBranch _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_557_0;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_558_0;
    }
    GEOABDebugPanelExperimentBranchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABDebugPanelExperimentBranchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOABDebugPanelExperimentBranchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3E) == 0))
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
    [(GEOABDebugPanelExperimentBranch *)self readAll:0];
    if (self->_experimentId) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_experimentName)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_branchLabel)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_branchName)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOABDebugPanelExperimentBranch *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_experimentId) {
    objc_msgSend(v5, "setExperimentId:");
  }
  if (self->_experimentName) {
    objc_msgSend(v5, "setExperimentName:");
  }
  v4 = v5;
  if (self->_branchLabel)
  {
    objc_msgSend(v5, "setBranchLabel:");
    v4 = v5;
  }
  if (self->_branchName)
  {
    objc_msgSend(v5, "setBranchName:");
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
    [(GEOABDebugPanelExperimentBranch *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_experimentId copyWithZone:a3];
    v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    uint64_t v10 = [(NSString *)self->_experimentName copyWithZone:a3];
    v11 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v10;

    uint64_t v12 = [(NSString *)self->_branchLabel copyWithZone:a3];
    v13 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v12;

    uint64_t v14 = [(NSString *)self->_branchName copyWithZone:a3];
    v15 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOABDebugPanelExperimentBranchReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOABDebugPanelExperimentBranch *)self readAll:1],
         [v4 readAll:1],
         experimentId = self->_experimentId,
         !((unint64_t)experimentId | v4[5]))
     || -[NSString isEqual:](experimentId, "isEqual:"))
    && ((experimentName = self->_experimentName, !((unint64_t)experimentName | v4[6]))
     || -[NSString isEqual:](experimentName, "isEqual:"))
    && ((branchLabel = self->_branchLabel, !((unint64_t)branchLabel | v4[3]))
     || -[NSString isEqual:](branchLabel, "isEqual:")))
  {
    branchName = self->_branchName;
    if ((unint64_t)branchName | v4[4]) {
      char v9 = -[NSString isEqual:](branchName, "isEqual:");
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
  [(GEOABDebugPanelExperimentBranch *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_experimentId hash];
  NSUInteger v4 = [(NSString *)self->_experimentName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_branchLabel hash];
  return v4 ^ v5 ^ [(NSString *)self->_branchName hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  [v4 readAll:0];
  if (v4[5]) {
    -[GEOABDebugPanelExperimentBranch setExperimentId:](self, "setExperimentId:");
  }
  if (v4[6]) {
    -[GEOABDebugPanelExperimentBranch setExperimentName:](self, "setExperimentName:");
  }
  if (v4[3]) {
    -[GEOABDebugPanelExperimentBranch setBranchLabel:](self, "setBranchLabel:");
  }
  if (v4[4]) {
    -[GEOABDebugPanelExperimentBranch setBranchName:](self, "setBranchName:");
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
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEOABDebugPanelExperimentBranchReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_562_0);
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
    [(GEOABDebugPanelExperimentBranch *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentName, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_branchName, 0);
  objc_storeStrong((id *)&self->_branchLabel, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end