@interface GEOLogMsgStateExperiments
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAbAssignInfo;
- (BOOL)hasClientAbExperimentAssignment;
- (BOOL)hasDatasetAbStatus;
- (BOOL)hasTilesAbExperimentAssignment;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOABClientConfig)clientAbExperimentAssignment;
- (GEOABExperimentAssignment)tilesAbExperimentAssignment;
- (GEOAbAssignInfo)abAssignInfo;
- (GEOLogMsgStateExperiments)init;
- (GEOLogMsgStateExperiments)initWithData:(id)a3;
- (GEOLogMsgStateExperiments)initWithDictionary:(id)a3;
- (GEOLogMsgStateExperiments)initWithJSON:(id)a3;
- (GEOPDDatasetABStatus)datasetAbStatus;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAbAssignInfo;
- (void)_readClientAbExperimentAssignment;
- (void)_readDatasetAbStatus;
- (void)_readTilesAbExperimentAssignment;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbAssignInfo:(id)a3;
- (void)setClientAbExperimentAssignment:(id)a3;
- (void)setDatasetAbStatus:(id)a3;
- (void)setTilesAbExperimentAssignment:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateExperiments

- (void)setDatasetAbStatus:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_datasetAbStatus, a3);
}

- (void)setClientAbExperimentAssignment:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_clientAbExperimentAssignment, a3);
}

- (GEOLogMsgStateExperiments)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateExperiments;
  v2 = [(GEOLogMsgStateExperiments *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tilesAbExperimentAssignment, 0);
  objc_storeStrong((id *)&self->_datasetAbStatus, 0);
  objc_storeStrong((id *)&self->_clientAbExperimentAssignment, 0);
  objc_storeStrong((id *)&self->_abAssignInfo, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDDatasetABStatus)datasetAbStatus
{
  -[GEOLogMsgStateExperiments _readDatasetAbStatus]((uint64_t)self);
  datasetAbStatus = self->_datasetAbStatus;

  return datasetAbStatus;
}

- (void)_readDatasetAbStatus
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateExperimentsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDatasetAbStatus_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgStateExperimentsIsDirty((uint64_t)self) & 1) == 0)
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStateExperiments *)self readAll:0];
    if (self->_tilesAbExperimentAssignment) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_clientAbExperimentAssignment) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_datasetAbStatus) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_abAssignInfo) {
      PBDataWriterWriteSubmessage();
    }
  }
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
      v8 = (int *)&readAll__recursiveTag_7357;
    }
    else {
      v8 = (int *)&readAll__nonRecursiveTag_7358;
    }
    GEOLogMsgStateExperimentsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLogMsgStateExperimentsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOLogMsgStateExperiments)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateExperiments;
  BOOL v3 = [(GEOLogMsgStateExperiments *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTilesAbExperimentAssignment
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateExperimentsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTilesAbExperimentAssignment_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasTilesAbExperimentAssignment
{
  return self->_tilesAbExperimentAssignment != 0;
}

- (GEOABExperimentAssignment)tilesAbExperimentAssignment
{
  -[GEOLogMsgStateExperiments _readTilesAbExperimentAssignment]((uint64_t)self);
  tilesAbExperimentAssignment = self->_tilesAbExperimentAssignment;

  return tilesAbExperimentAssignment;
}

- (void)setTilesAbExperimentAssignment:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_tilesAbExperimentAssignment, a3);
}

- (void)_readClientAbExperimentAssignment
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateExperimentsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClientAbExperimentAssignment_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasClientAbExperimentAssignment
{
  return self->_clientAbExperimentAssignment != 0;
}

- (GEOABClientConfig)clientAbExperimentAssignment
{
  -[GEOLogMsgStateExperiments _readClientAbExperimentAssignment]((uint64_t)self);
  clientAbExperimentAssignment = self->_clientAbExperimentAssignment;

  return clientAbExperimentAssignment;
}

- (BOOL)hasDatasetAbStatus
{
  return self->_datasetAbStatus != 0;
}

- (void)_readAbAssignInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateExperimentsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbAssignInfo_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAbAssignInfo
{
  return self->_abAssignInfo != 0;
}

- (GEOAbAssignInfo)abAssignInfo
{
  -[GEOLogMsgStateExperiments _readAbAssignInfo]((uint64_t)self);
  abAssignInfo = self->_abAssignInfo;

  return abAssignInfo;
}

- (void)setAbAssignInfo:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  objc_storeStrong((id *)&self->_abAssignInfo, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateExperiments;
  v4 = [(GEOLogMsgStateExperiments *)&v8 description];
  v5 = [(GEOLogMsgStateExperiments *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateExperiments _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 tilesAbExperimentAssignment];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"tilesAbExperimentAssignment";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"tiles_ab_experiment_assignment";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 clientAbExperimentAssignment];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"clientAbExperimentAssignment";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"client_ab_experiment_assignment";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [a1 datasetAbStatus];
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"datasetAbStatus";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"dataset_ab_status";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = [a1 abAssignInfo];
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"abAssignInfo";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"ab_assign_info";
      }
      [v4 setObject:v19 forKey:v20];
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
  return -[GEOLogMsgStateExperiments _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgStateExperiments)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateExperiments *)-[GEOLogMsgStateExperiments _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"tilesAbExperimentAssignment";
      }
      else {
        objc_super v6 = @"tiles_ab_experiment_assignment";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOABExperimentAssignment alloc];
        if (a3) {
          uint64_t v9 = [(GEOABExperimentAssignment *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOABExperimentAssignment *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setTilesAbExperimentAssignment:v9];
      }
      if (a3) {
        v11 = @"clientAbExperimentAssignment";
      }
      else {
        v11 = @"client_ab_experiment_assignment";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOABClientConfig alloc];
        if (a3) {
          uint64_t v14 = [(GEOABClientConfig *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOABClientConfig *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setClientAbExperimentAssignment:v14];
      }
      if (a3) {
        v16 = @"datasetAbStatus";
      }
      else {
        v16 = @"dataset_ab_status";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [GEOPDDatasetABStatus alloc];
        if (a3) {
          uint64_t v19 = [(GEOPDDatasetABStatus *)v18 initWithJSON:v17];
        }
        else {
          uint64_t v19 = [(GEOPDDatasetABStatus *)v18 initWithDictionary:v17];
        }
        v20 = (void *)v19;
        [a1 setDatasetAbStatus:v19];
      }
      if (a3) {
        v21 = @"abAssignInfo";
      }
      else {
        v21 = @"ab_assign_info";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [GEOAbAssignInfo alloc];
        if (a3) {
          uint64_t v24 = [(GEOAbAssignInfo *)v23 initWithJSON:v22];
        }
        else {
          uint64_t v24 = [(GEOAbAssignInfo *)v23 initWithDictionary:v22];
        }
        v25 = (void *)v24;
        [a1 setAbAssignInfo:v24];
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateExperiments)initWithJSON:(id)a3
{
  return (GEOLogMsgStateExperiments *)-[GEOLogMsgStateExperiments _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateExperimentsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateExperimentsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOLogMsgStateExperiments *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_tilesAbExperimentAssignment) {
    objc_msgSend(v5, "setTilesAbExperimentAssignment:");
  }
  if (self->_clientAbExperimentAssignment) {
    objc_msgSend(v5, "setClientAbExperimentAssignment:");
  }
  v4 = v5;
  if (self->_datasetAbStatus)
  {
    objc_msgSend(v5, "setDatasetAbStatus:");
    v4 = v5;
  }
  if (self->_abAssignInfo)
  {
    objc_msgSend(v5, "setAbAssignInfo:");
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStateExperiments *)self readAll:0];
    id v8 = [(GEOABExperimentAssignment *)self->_tilesAbExperimentAssignment copyWithZone:a3];
    uint64_t v9 = (void *)v5[5];
    v5[5] = v8;

    id v10 = [(GEOABClientConfig *)self->_clientAbExperimentAssignment copyWithZone:a3];
    v11 = (void *)v5[3];
    v5[3] = v10;

    id v12 = [(GEOPDDatasetABStatus *)self->_datasetAbStatus copyWithZone:a3];
    v13 = (void *)v5[4];
    v5[4] = v12;

    id v14 = [(GEOAbAssignInfo *)self->_abAssignInfo copyWithZone:a3];
    objc_super v7 = (PBDataReader *)v5[2];
    v5[2] = v14;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgStateExperimentsReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLogMsgStateExperiments *)self readAll:1],
         [v4 readAll:1],
         tilesAbExperimentAssignment = self->_tilesAbExperimentAssignment,
         !((unint64_t)tilesAbExperimentAssignment | v4[5]))
     || -[GEOABExperimentAssignment isEqual:](tilesAbExperimentAssignment, "isEqual:"))
    && ((clientAbExperimentAssignment = self->_clientAbExperimentAssignment,
         !((unint64_t)clientAbExperimentAssignment | v4[3]))
     || -[GEOABClientConfig isEqual:](clientAbExperimentAssignment, "isEqual:"))
    && ((datasetAbStatus = self->_datasetAbStatus, !((unint64_t)datasetAbStatus | v4[4]))
     || -[GEOPDDatasetABStatus isEqual:](datasetAbStatus, "isEqual:")))
  {
    abAssignInfo = self->_abAssignInfo;
    if ((unint64_t)abAssignInfo | v4[2]) {
      char v9 = -[GEOAbAssignInfo isEqual:](abAssignInfo, "isEqual:");
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
  [(GEOLogMsgStateExperiments *)self readAll:1];
  unint64_t v3 = [(GEOABExperimentAssignment *)self->_tilesAbExperimentAssignment hash];
  unint64_t v4 = [(GEOABClientConfig *)self->_clientAbExperimentAssignment hash] ^ v3;
  unint64_t v5 = [(GEOPDDatasetABStatus *)self->_datasetAbStatus hash];
  return v4 ^ v5 ^ [(GEOAbAssignInfo *)self->_abAssignInfo hash];
}

- (void)mergeFrom:(id)a3
{
  id v12 = a3;
  [v12 readAll:0];
  tilesAbExperimentAssignment = self->_tilesAbExperimentAssignment;
  uint64_t v5 = v12[5];
  if (tilesAbExperimentAssignment)
  {
    if (v5) {
      -[GEOABExperimentAssignment mergeFrom:](tilesAbExperimentAssignment, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOLogMsgStateExperiments setTilesAbExperimentAssignment:](self, "setTilesAbExperimentAssignment:");
  }
  clientAbExperimentAssignment = self->_clientAbExperimentAssignment;
  uint64_t v7 = v12[3];
  if (clientAbExperimentAssignment)
  {
    if (v7) {
      -[GEOABClientConfig mergeFrom:](clientAbExperimentAssignment, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOLogMsgStateExperiments setClientAbExperimentAssignment:](self, "setClientAbExperimentAssignment:");
  }
  datasetAbStatus = self->_datasetAbStatus;
  uint64_t v9 = v12[4];
  if (datasetAbStatus)
  {
    if (v9) {
      -[GEOPDDatasetABStatus mergeFrom:](datasetAbStatus, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[GEOLogMsgStateExperiments setDatasetAbStatus:](self, "setDatasetAbStatus:");
  }
  abAssignInfo = self->_abAssignInfo;
  uint64_t v11 = v12[2];
  if (abAssignInfo)
  {
    if (v11) {
      -[GEOAbAssignInfo mergeFrom:](abAssignInfo, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOLogMsgStateExperiments setAbAssignInfo:](self, "setAbAssignInfo:");
  }
}

@end