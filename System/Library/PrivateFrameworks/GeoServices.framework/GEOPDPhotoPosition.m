@interface GEOPDPhotoPosition
+ (BOOL)isValid:(id)a3;
+ (Class)cameraMetadataType;
- (BOOL)hasBuild;
- (BOOL)hasBuildTableIndex;
- (BOOL)hasImageryTimestamp;
- (BOOL)hasImdataId;
- (BOOL)hasParentTile;
- (BOOL)hasPosition;
- (BOOL)hasPositionGeo;
- (BOOL)hasRevision;
- (BOOL)hasRigMetrics;
- (BOOL)hasTilePosition;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGeographicCoordinate)positionGeo;
- (GEOPDGroundDataBuild)build;
- (GEOPDOrientedPosition)position;
- (GEOPDOrientedTilePosition)tilePosition;
- (GEOPDPhotoPosition)init;
- (GEOPDPhotoPosition)initWithData:(id)a3;
- (GEOPDPhotoPosition)initWithDictionary:(id)a3;
- (GEOPDPhotoPosition)initWithJSON:(id)a3;
- (GEOPDRigMetrics)rigMetrics;
- (GEOTileCoordinate)parentTile;
- (NSMutableArray)cameraMetadatas;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)cameraMetadataAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)revision;
- (unint64_t)cameraMetadataIndexsCount;
- (unint64_t)cameraMetadatasCount;
- (unint64_t)hash;
- (unint64_t)imageryTimestamp;
- (unint64_t)imdataId;
- (unsigned)buildTableIndex;
- (unsigned)cameraMetadataIndexAtIndex:(unint64_t)a3;
- (unsigned)cameraMetadataIndexs;
- (void)_addNoFlagsCameraMetadata:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readBuild;
- (void)_readCameraMetadataIndexs;
- (void)_readCameraMetadatas;
- (void)_readParentTile;
- (void)_readPosition;
- (void)_readPositionGeo;
- (void)_readRigMetrics;
- (void)_readTilePosition;
- (void)addCameraMetadata:(id)a3;
- (void)addCameraMetadataIndex:(unsigned int)a3;
- (void)clearCameraMetadataIndexs;
- (void)clearCameraMetadatas;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBuild:(id)a3;
- (void)setBuildTableIndex:(unsigned int)a3;
- (void)setCameraMetadataIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCameraMetadatas:(id)a3;
- (void)setHasBuildTableIndex:(BOOL)a3;
- (void)setHasImageryTimestamp:(BOOL)a3;
- (void)setHasImdataId:(BOOL)a3;
- (void)setHasRevision:(BOOL)a3;
- (void)setImageryTimestamp:(unint64_t)a3;
- (void)setImdataId:(unint64_t)a3;
- (void)setParentTile:(id)a3;
- (void)setPosition:(id)a3;
- (void)setPositionGeo:(id)a3;
- (void)setRevision:(int)a3;
- (void)setRigMetrics:(id)a3;
- (void)setTilePosition:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPhotoPosition

- (GEOPDPhotoPosition)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDPhotoPosition;
  v2 = [(GEOPDPhotoPosition *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPhotoPosition)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDPhotoPosition;
  v3 = [(GEOPDPhotoPosition *)&v7 initWithData:a3];
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
  v3.super_class = (Class)GEOPDPhotoPosition;
  [(GEOPDPhotoPosition *)&v3 dealloc];
}

- (unint64_t)imdataId
{
  return self->_imdataId;
}

- (void)setImdataId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_imdataId = a3;
}

- (void)setHasImdataId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4098;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasImdataId
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readCameraMetadatas
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCameraMetadatas_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (NSMutableArray)cameraMetadatas
{
  -[GEOPDPhotoPosition _readCameraMetadatas]((uint64_t)self);
  cameraMetadatas = self->_cameraMetadatas;

  return cameraMetadatas;
}

- (void)setCameraMetadatas:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  cameraMetadatas = self->_cameraMetadatas;
  self->_cameraMetadatas = v4;
}

- (void)clearCameraMetadatas
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  cameraMetadatas = self->_cameraMetadatas;

  [(NSMutableArray *)cameraMetadatas removeAllObjects];
}

- (void)addCameraMetadata:(id)a3
{
  id v4 = a3;
  -[GEOPDPhotoPosition _readCameraMetadatas]((uint64_t)self);
  -[GEOPDPhotoPosition _addNoFlagsCameraMetadata:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsCameraMetadata:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)cameraMetadatasCount
{
  -[GEOPDPhotoPosition _readCameraMetadatas]((uint64_t)self);
  cameraMetadatas = self->_cameraMetadatas;

  return [(NSMutableArray *)cameraMetadatas count];
}

- (id)cameraMetadataAtIndex:(unint64_t)a3
{
  -[GEOPDPhotoPosition _readCameraMetadatas]((uint64_t)self);
  cameraMetadatas = self->_cameraMetadatas;

  return (id)[(NSMutableArray *)cameraMetadatas objectAtIndex:a3];
}

+ (Class)cameraMetadataType
{
  return (Class)objc_opt_class();
}

- (void)_readPosition
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPosition_tags_482);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasPosition
{
  return self->_position != 0;
}

- (GEOPDOrientedPosition)position
{
  -[GEOPDPhotoPosition _readPosition]((uint64_t)self);
  position = self->_position;

  return position;
}

- (void)setPosition:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_position, a3);
}

- (int)revision
{
  return self->_revision;
}

- (void)setRevision:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_revision = a3;
}

- (void)setHasRevision:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4104;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasRevision
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unint64_t)imageryTimestamp
{
  return self->_imageryTimestamp;
}

- (void)setImageryTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_imageryTimestamp = a3;
}

- (void)setHasImageryTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasImageryTimestamp
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readPositionGeo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPositionGeo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasPositionGeo
{
  return self->_positionGeo != 0;
}

- (GEOPDGeographicCoordinate)positionGeo
{
  -[GEOPDPhotoPosition _readPositionGeo]((uint64_t)self);
  positionGeo = self->_positionGeo;

  return positionGeo;
}

- (void)setPositionGeo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_positionGeo, a3);
}

- (unsigned)buildTableIndex
{
  return self->_buildTableIndex;
}

- (void)setBuildTableIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_buildTableIndex = a3;
}

- (void)setHasBuildTableIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4100;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasBuildTableIndex
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readBuild
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBuild_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (GEOPDGroundDataBuild)build
{
  -[GEOPDPhotoPosition _readBuild]((uint64_t)self);
  build = self->_build;

  return build;
}

- (void)setBuild:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  objc_storeStrong((id *)&self->_build, a3);
}

- (void)_readCameraMetadataIndexs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCameraMetadataIndexs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)cameraMetadataIndexsCount
{
  return self->_cameraMetadataIndexs.count;
}

- (unsigned)cameraMetadataIndexs
{
  return self->_cameraMetadataIndexs.list;
}

- (void)clearCameraMetadataIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;

  PBRepeatedUInt32Clear();
}

- (void)addCameraMetadataIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (unsigned)cameraMetadataIndexAtIndex:(unint64_t)a3
{
  -[GEOPDPhotoPosition _readCameraMetadataIndexs]((uint64_t)self);
  p_cameraMetadataIndexs = &self->_cameraMetadataIndexs;
  unint64_t count = self->_cameraMetadataIndexs.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_cameraMetadataIndexs->list[a3];
}

- (void)setCameraMetadataIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;

  MEMORY[0x1F4147400](&self->_cameraMetadataIndexs, a3, a4);
}

- (void)_readTilePosition
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTilePosition_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasTilePosition
{
  return self->_tilePosition != 0;
}

- (GEOPDOrientedTilePosition)tilePosition
{
  -[GEOPDPhotoPosition _readTilePosition]((uint64_t)self);
  tilePosition = self->_tilePosition;

  return tilePosition;
}

- (void)setTilePosition:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_tilePosition, a3);
}

- (void)_readParentTile
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readParentTile_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasParentTile
{
  return self->_parentTile != 0;
}

- (GEOTileCoordinate)parentTile
{
  -[GEOPDPhotoPosition _readParentTile]((uint64_t)self);
  parentTile = self->_parentTile;

  return parentTile;
}

- (void)setParentTile:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_parentTile, a3);
}

- (void)_readRigMetrics
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 132) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoPositionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRigMetrics_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasRigMetrics
{
  return self->_rigMetrics != 0;
}

- (GEOPDRigMetrics)rigMetrics
{
  -[GEOPDPhotoPosition _readRigMetrics]((uint64_t)self);
  rigMetrics = self->_rigMetrics;

  return rigMetrics;
}

- (void)setRigMetrics:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_rigMetrics, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPhotoPosition;
  id v4 = [(GEOPDPhotoPosition *)&v8 description];
  id v5 = [(GEOPDPhotoPosition *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPhotoPosition _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ((*(_WORD *)(a1 + 132) & 2) != 0)
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64)];
      if (a2) {
        objc_super v6 = @"imdataId";
      }
      else {
        objc_super v6 = @"imdata_id";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 48) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v8 = *(id *)(a1 + 48);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v48 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = objc_msgSend(v13, "dictionaryRepresentation", (void)v47);
            }
            objc_msgSend(v7, "addObject:", v14, (void)v47);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"cameraMetadata";
      }
      else {
        v15 = @"camera_metadata";
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v15, (void)v47);
    }
    v16 = [(id)a1 position];
    v17 = v16;
    if (v16)
    {
      if (a2) {
        [v16 jsonRepresentation];
      }
      else {
      v18 = [v16 dictionaryRepresentation];
      }
      [v4 setObject:v18 forKey:@"position"];
    }
    __int16 v19 = *(_WORD *)(a1 + 132);
    if ((v19 & 8) != 0)
    {
      v20 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 128)];
      [v4 setObject:v20 forKey:@"revision"];

      __int16 v19 = *(_WORD *)(a1 + 132);
    }
    if (v19)
    {
      v21 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
      if (a2) {
        v22 = @"imageryTimestamp";
      }
      else {
        v22 = @"imagery_timestamp";
      }
      [v4 setObject:v21 forKey:v22];
    }
    v23 = [(id)a1 positionGeo];
    v24 = v23;
    if (v23)
    {
      if (a2)
      {
        v25 = [v23 jsonRepresentation];
        v26 = @"positionGeo";
      }
      else
      {
        v25 = [v23 dictionaryRepresentation];
        v26 = @"position_geo";
      }
      [v4 setObject:v25 forKey:v26];
    }
    if ((*(_WORD *)(a1 + 132) & 4) != 0)
    {
      v27 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 124)];
      if (a2) {
        v28 = @"buildTableIndex";
      }
      else {
        v28 = @"build_table_index";
      }
      [v4 setObject:v27 forKey:v28];
    }
    v29 = [(id)a1 build];
    v30 = v29;
    if (v29)
    {
      if (a2) {
        [v29 jsonRepresentation];
      }
      else {
      v31 = [v29 dictionaryRepresentation];
      }
      [v4 setObject:v31 forKey:@"build"];
    }
    if (*(void *)(a1 + 24))
    {
      v32 = PBRepeatedUInt32NSArray();
      if (a2) {
        v33 = @"cameraMetadataIndex";
      }
      else {
        v33 = @"camera_metadata_index";
      }
      [v4 setObject:v32 forKey:v33];
    }
    v34 = [(id)a1 tilePosition];
    v35 = v34;
    if (v34)
    {
      if (a2)
      {
        v36 = [v34 jsonRepresentation];
        v37 = @"tilePosition";
      }
      else
      {
        v36 = [v34 dictionaryRepresentation];
        v37 = @"tile_position";
      }
      [v4 setObject:v36 forKey:v37];
    }
    v38 = [(id)a1 parentTile];
    v39 = v38;
    if (v38)
    {
      if (a2)
      {
        v40 = [v38 jsonRepresentation];
        v41 = @"parentTile";
      }
      else
      {
        v40 = [v38 dictionaryRepresentation];
        v41 = @"parent_tile";
      }
      [v4 setObject:v40 forKey:v41];
    }
    v42 = [(id)a1 rigMetrics];
    v43 = v42;
    if (v42)
    {
      if (a2)
      {
        v44 = [v42 jsonRepresentation];
        v45 = @"rigMetrics";
      }
      else
      {
        v44 = [v42 dictionaryRepresentation];
        v45 = @"rig_metrics";
      }
      [v4 setObject:v44 forKey:v45];
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
  return -[GEOPDPhotoPosition _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPhotoPosition)initWithDictionary:(id)a3
{
  return (GEOPDPhotoPosition *)-[GEOPDPhotoPosition _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"imdataId";
      }
      else {
        objc_super v6 = @"imdata_id";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setImdataId:", objc_msgSend(v7, "unsignedLongLongValue"));
      }

      if (a3) {
        id v8 = @"cameraMetadata";
      }
      else {
        id v8 = @"camera_metadata";
      }
      uint64_t v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      id v69 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        v67 = v9;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v74 objects:v83 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v75;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v75 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v74 + 1) + 8 * v14);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v16 = [GEOPDCameraMetadata alloc];
                if (v16) {
                  v17 = (void *)-[GEOPDCameraMetadata _initWithDictionary:isJSON:](v16, v15, a3);
                }
                else {
                  v17 = 0;
                }
                [a1 addCameraMetadata:v17];
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v18 = [v10 countByEnumeratingWithState:&v74 objects:v83 count:16];
            uint64_t v12 = v18;
          }
          while (v18);
        }

        uint64_t v9 = v67;
      }

      __int16 v19 = [v5 objectForKeyedSubscript:@"position"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [GEOPDOrientedPosition alloc];
        if (a3) {
          uint64_t v21 = [(GEOPDOrientedPosition *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEOPDOrientedPosition *)v20 initWithDictionary:v19];
        }
        v22 = (void *)v21;
        [a1 setPosition:v21];
      }
      v23 = [v5 objectForKeyedSubscript:@"revision"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRevision:", objc_msgSend(v23, "intValue"));
      }

      if (a3) {
        v24 = @"imageryTimestamp";
      }
      else {
        v24 = @"imagery_timestamp";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setImageryTimestamp:", objc_msgSend(v25, "unsignedLongLongValue"));
      }

      if (a3) {
        v26 = @"positionGeo";
      }
      else {
        v26 = @"position_geo";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = [GEOPDGeographicCoordinate alloc];
        if (a3) {
          uint64_t v29 = [(GEOPDGeographicCoordinate *)v28 initWithJSON:v27];
        }
        else {
          uint64_t v29 = [(GEOPDGeographicCoordinate *)v28 initWithDictionary:v27];
        }
        v30 = (void *)v29;
        [a1 setPositionGeo:v29];
      }
      if (a3) {
        v31 = @"buildTableIndex";
      }
      else {
        v31 = @"build_table_index";
      }
      v32 = [v5 objectForKeyedSubscript:v31];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setBuildTableIndex:", objc_msgSend(v32, "unsignedIntValue"));
      }

      v33 = [v5 objectForKeyedSubscript:@"build"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v34 = [GEOPDGroundDataBuild alloc];
        if (v34) {
          v35 = (void *)-[GEOPDGroundDataBuild _initWithDictionary:isJSON:](v34, v33, a3);
        }
        else {
          v35 = 0;
        }
        [a1 setBuild:v35];
      }
      if (a3) {
        v36 = @"cameraMetadataIndex";
      }
      else {
        v36 = @"camera_metadata_index";
      }
      v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v38 = v37;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v70 objects:v82 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v71;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v71 != v41) {
                objc_enumerationMutation(v38);
              }
              v43 = *(void **)(*((void *)&v70 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addCameraMetadataIndex:", objc_msgSend(v43, "unsignedIntValue"));
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v70 objects:v82 count:16];
          }
          while (v40);
        }

        id v5 = v69;
      }

      if (a3) {
        v44 = @"tilePosition";
      }
      else {
        v44 = @"tile_position";
      }
      v45 = [v5 objectForKeyedSubscript:v44];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v46 = [GEOPDOrientedTilePosition alloc];
        if (a3) {
          uint64_t v47 = [(GEOPDOrientedTilePosition *)v46 initWithJSON:v45];
        }
        else {
          uint64_t v47 = [(GEOPDOrientedTilePosition *)v46 initWithDictionary:v45];
        }
        long long v48 = (void *)v47;
        [a1 setTilePosition:v47];
      }
      if (a3) {
        long long v49 = @"parentTile";
      }
      else {
        long long v49 = @"parent_tile";
      }
      long long v50 = [v5 objectForKeyedSubscript:v49];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v51 = [GEOTileCoordinate alloc];
        if (a3) {
          uint64_t v52 = [(GEOTileCoordinate *)v51 initWithJSON:v50];
        }
        else {
          uint64_t v52 = [(GEOTileCoordinate *)v51 initWithDictionary:v50];
        }
        v53 = (void *)v52;
        [a1 setParentTile:v52];
      }
      if (a3) {
        v54 = @"rigMetrics";
      }
      else {
        v54 = @"rig_metrics";
      }
      v55 = [v5 objectForKeyedSubscript:v54];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v56 = [GEOPDRigMetrics alloc];
        if (v56)
        {
          id v57 = v55;
          v56 = [(GEOPDRigMetrics *)v56 init];
          if (v56)
          {
            if (a3) {
              v58 = @"occlusionScore";
            }
            else {
              v58 = @"occlusion_score";
            }
            v59 = [v57 objectForKeyedSubscript:v58];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v68 = v57;
              long long v80 = 0u;
              long long v81 = 0u;
              long long v78 = 0u;
              long long v79 = 0u;
              id v60 = v59;
              uint64_t v61 = [v60 countByEnumeratingWithState:&v78 objects:v84 count:16];
              if (v61)
              {
                uint64_t v62 = v61;
                uint64_t v63 = *(void *)v79;
                do
                {
                  for (uint64_t j = 0; j != v62; ++j)
                  {
                    if (*(void *)v79 != v63) {
                      objc_enumerationMutation(v60);
                    }
                    v65 = *(void **)(*((void *)&v78 + 1) + 8 * j);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [v65 unsignedIntValue];
                      PBRepeatedUInt32Add();
                    }
                  }
                  uint64_t v62 = [v60 countByEnumeratingWithState:&v78 objects:v84 count:16];
                }
                while (v62);
              }

              id v57 = v68;
              id v5 = v69;
            }
          }
        }
        [a1 setRigMetrics:v56];
      }
    }
  }

  return a1;
}

- (GEOPDPhotoPosition)initWithJSON:(id)a3
{
  return (GEOPDPhotoPosition *)-[GEOPDPhotoPosition _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_548;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_549;
    }
    GEOPDPhotoPositionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDPhotoPositionCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPhotoPositionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPhotoPositionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPhotoPositionIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDPhotoPosition *)self readAll:0];
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint64Field();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v6 = self->_cameraMetadatas;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    if (self->_position) {
      PBDataWriterWriteSubmessage();
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteInt32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_positionGeo) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_build) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_cameraMetadataIndexs.count)
    {
      unint64_t v11 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v11;
      }
      while (v11 < self->_cameraMetadataIndexs.count);
    }
    if (self->_tilePosition) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_parentTile) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_rigMetrics) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  long long v14 = (id *)a3;
  [(GEOPDPhotoPosition *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v14 + 1, self->_reader);
  *((_DWORD *)v14 + 28) = self->_readerMarkPos;
  *((_DWORD *)v14 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    v14[8] = self->_imdataId;
    *((_WORD *)v14 + 66) |= 2u;
  }
  if ([(GEOPDPhotoPosition *)self cameraMetadatasCount])
  {
    [v14 clearCameraMetadatas];
    unint64_t v4 = [(GEOPDPhotoPosition *)self cameraMetadatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDPhotoPosition *)self cameraMetadataAtIndex:i];
        [v14 addCameraMetadata:v7];
      }
    }
  }
  if (self->_position) {
    objc_msgSend(v14, "setPosition:");
  }
  __int16 flags = (__int16)self->_flags;
  uint64_t v9 = v14;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v14 + 32) = self->_revision;
    *((_WORD *)v14 + 66) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    v14[7] = self->_imageryTimestamp;
    *((_WORD *)v14 + 66) |= 1u;
  }
  if (self->_positionGeo)
  {
    objc_msgSend(v14, "setPositionGeo:");
    uint64_t v9 = v14;
  }
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v9 + 31) = self->_buildTableIndex;
    *((_WORD *)v9 + 66) |= 4u;
  }
  if (self->_build) {
    objc_msgSend(v14, "setBuild:");
  }
  if ([(GEOPDPhotoPosition *)self cameraMetadataIndexsCount])
  {
    [v14 clearCameraMetadataIndexs];
    unint64_t v10 = [(GEOPDPhotoPosition *)self cameraMetadataIndexsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        objc_msgSend(v14, "addCameraMetadataIndex:", -[GEOPDPhotoPosition cameraMetadataIndexAtIndex:](self, "cameraMetadataIndexAtIndex:", j));
    }
  }
  if (self->_tilePosition) {
    objc_msgSend(v14, "setTilePosition:");
  }
  uint64_t v13 = v14;
  if (self->_parentTile)
  {
    objc_msgSend(v14, "setParentTile:");
    uint64_t v13 = v14;
  }
  if (self->_rigMetrics)
  {
    objc_msgSend(v14, "setRigMetrics:");
    uint64_t v13 = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDPhotoPositionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDPhotoPosition *)self readAll:0];
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(void *)(v5 + 64) = self->_imdataId;
    *(_WORD *)(v5 + 132) |= 2u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = self->_cameraMetadatas;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "copyWithZone:", a3, (void)v27);
        [(id)v5 addCameraMetadata:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  id v14 = [(GEOPDOrientedPosition *)self->_position copyWithZone:a3];
  long long v15 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v14;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_revision;
    *(_WORD *)(v5 + 132) |= 8u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(void *)(v5 + 56) = self->_imageryTimestamp;
    *(_WORD *)(v5 + 132) |= 1u;
  }
  id v17 = -[GEOPDGeographicCoordinate copyWithZone:](self->_positionGeo, "copyWithZone:", a3, (void)v27);
  uint64_t v18 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v17;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_buildTableIndex;
    *(_WORD *)(v5 + 132) |= 4u;
  }
  id v19 = [(GEOPDGroundDataBuild *)self->_build copyWithZone:a3];
  v20 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v19;

  PBRepeatedUInt32Copy();
  id v21 = [(GEOPDOrientedTilePosition *)self->_tilePosition copyWithZone:a3];
  v22 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v21;

  id v23 = [(GEOTileCoordinate *)self->_parentTile copyWithZone:a3];
  v24 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v23;

  id v25 = [(GEOPDRigMetrics *)self->_rigMetrics copyWithZone:a3];
  id v8 = *(id *)(v5 + 96);
  *(void *)(v5 + 96) = v25;
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  [(GEOPDPhotoPosition *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 66);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_imdataId != *((void *)v4 + 8)) {
      goto LABEL_38;
    }
  }
  else if ((v5 & 2) != 0)
  {
    goto LABEL_38;
  }
  cameraMetadatas = self->_cameraMetadatas;
  if ((unint64_t)cameraMetadatas | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](cameraMetadatas, "isEqual:"))
  {
    goto LABEL_38;
  }
  position = self->_position;
  if ((unint64_t)position | *((void *)v4 + 11))
  {
    if (!-[GEOPDOrientedPosition isEqual:](position, "isEqual:")) {
      goto LABEL_38;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 66);
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_revision != *((_DWORD *)v4 + 32)) {
      goto LABEL_38;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_38;
  }
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_imageryTimestamp != *((void *)v4 + 7)) {
      goto LABEL_38;
    }
  }
  else if (v9)
  {
    goto LABEL_38;
  }
  positionGeo = self->_positionGeo;
  if ((unint64_t)positionGeo | *((void *)v4 + 10))
  {
    if (!-[GEOPDGeographicCoordinate isEqual:](positionGeo, "isEqual:"))
    {
LABEL_38:
      char v15 = 0;
      goto LABEL_39;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v9 = *((_WORD *)v4 + 66);
  }
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_buildTableIndex != *((_DWORD *)v4 + 31)) {
      goto LABEL_38;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_38;
  }
  build = self->_build;
  if ((unint64_t)build | *((void *)v4 + 5) && !-[GEOPDGroundDataBuild isEqual:](build, "isEqual:")) {
    goto LABEL_38;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_38;
  }
  tilePosition = self->_tilePosition;
  if ((unint64_t)tilePosition | *((void *)v4 + 13))
  {
    if (!-[GEOPDOrientedTilePosition isEqual:](tilePosition, "isEqual:")) {
      goto LABEL_38;
    }
  }
  parentTile = self->_parentTile;
  if ((unint64_t)parentTile | *((void *)v4 + 9))
  {
    if (!-[GEOTileCoordinate isEqual:](parentTile, "isEqual:")) {
      goto LABEL_38;
    }
  }
  rigMetrics = self->_rigMetrics;
  if ((unint64_t)rigMetrics | *((void *)v4 + 12)) {
    char v15 = -[GEOPDRigMetrics isEqual:](rigMetrics, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_39:

  return v15;
}

- (unint64_t)hash
{
  [(GEOPDPhotoPosition *)self readAll:1];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_imdataId;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_cameraMetadatas hash];
  unint64_t v5 = [(GEOPDOrientedPosition *)self->_position hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    uint64_t v7 = 2654435761 * self->_revision;
    if (flags) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (flags)
    {
LABEL_6:
      unint64_t v8 = 2654435761u * self->_imageryTimestamp;
      goto LABEL_9;
    }
  }
  unint64_t v8 = 0;
LABEL_9:
  unint64_t v9 = [(GEOPDGeographicCoordinate *)self->_positionGeo hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v10 = 2654435761 * self->_buildTableIndex;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(GEOPDGroundDataBuild *)self->_build hash];
  uint64_t v12 = PBRepeatedUInt32Hash();
  unint64_t v13 = v12 ^ [(GEOPDOrientedTilePosition *)self->_tilePosition hash];
  unint64_t v14 = v13 ^ [(GEOTileCoordinate *)self->_parentTile hash];
  return v11 ^ v14 ^ [(GEOPDRigMetrics *)self->_rigMetrics hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((_WORD *)v4 + 66) & 2) != 0)
  {
    self->_imdataId = *((void *)v4 + 8);
    *(_WORD *)&self->_flags |= 2u;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v5 = *((id *)v4 + 6);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOPDPhotoPosition *)self addCameraMetadata:*(void *)(*((void *)&v49 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v7);
  }

  position = self->_position;
  uint64_t v11 = *((void *)v4 + 11);
  if (position)
  {
    if (v11) {
      -[GEOPDOrientedPosition mergeFrom:](position, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOPDPhotoPosition setPosition:](self, "setPosition:");
  }
  __int16 v12 = *((_WORD *)v4 + 66);
  if ((v12 & 8) != 0)
  {
    self->_revision = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_flags |= 8u;
    __int16 v12 = *((_WORD *)v4 + 66);
  }
  if (v12)
  {
    self->_imageryTimestamp = *((void *)v4 + 7);
    *(_WORD *)&self->_flags |= 1u;
  }
  positionGeo = self->_positionGeo;
  uint64_t v14 = *((void *)v4 + 10);
  if (positionGeo)
  {
    if (v14) {
      -[GEOPDGeographicCoordinate mergeFrom:](positionGeo, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[GEOPDPhotoPosition setPositionGeo:](self, "setPositionGeo:");
  }
  if ((*((_WORD *)v4 + 66) & 4) != 0)
  {
    self->_buildTableIndex = *((_DWORD *)v4 + 31);
    *(_WORD *)&self->_flags |= 4u;
  }
  build = self->_build;
  long long v16 = (void *)*((void *)v4 + 5);
  if (build)
  {
    if (!v16) {
      goto LABEL_52;
    }
    id v17 = v16;
    -[GEOPDGroundDataBuild readAll:]((uint64_t)v17, 0);
    __int16 v18 = *((_WORD *)v17 + 54);
    if ((v18 & 0x20) != 0)
    {
      build->_index = *((_DWORD *)v17 + 24);
      *(_WORD *)&build->_flags |= 0x20u;
      __int16 v18 = *((_WORD *)v17 + 54);
      if ((v18 & 2) == 0)
      {
LABEL_30:
        if ((v18 & 4) == 0) {
          goto LABEL_31;
        }
        goto LABEL_78;
      }
    }
    else if ((v18 & 2) == 0)
    {
      goto LABEL_30;
    }
    build->_buildId = *((_DWORD *)v17 + 20);
    *(_WORD *)&build->_flags |= 2u;
    __int16 v18 = *((_WORD *)v17 + 54);
    if ((v18 & 4) == 0)
    {
LABEL_31:
      if ((v18 & 8) == 0) {
        goto LABEL_32;
      }
      goto LABEL_79;
    }
LABEL_78:
    build->_dataFormatVersion = *((_DWORD *)v17 + 21);
    *(_WORD *)&build->_flags |= 4u;
    __int16 v18 = *((_WORD *)v17 + 54);
    if ((v18 & 8) == 0)
    {
LABEL_32:
      if ((v18 & 0x80) == 0) {
        goto LABEL_33;
      }
      goto LABEL_80;
    }
LABEL_79:
    build->_dataOutputVersion = *((_DWORD *)v17 + 22);
    *(_WORD *)&build->_flags |= 8u;
    __int16 v18 = *((_WORD *)v17 + 54);
    if ((v18 & 0x80) == 0)
    {
LABEL_33:
      if ((v18 & 0x10) == 0)
      {
LABEL_35:
        -[GEOPDGroundDataBuild _readCapabilitys]((uint64_t)v17);
        uint64_t v19 = *((void *)v17 + 3);
        if (v19)
        {
          unint64_t v20 = 0;
          uint64_t v47 = *MEMORY[0x1E4F1C4A8];
          do
          {
            -[GEOPDGroundDataBuild _readCapabilitys]((uint64_t)v17);
            unint64_t v21 = *((void *)v17 + 3);
            if (v21 <= v20)
            {
              v22 = (void *)MEMORY[0x1E4F1CA00];
              id v23 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v20, v21);
              v24 = [v22 exceptionWithName:v47 reason:v23 userInfo:0];
              [v24 raise];
            }
            -[GEOPDGroundDataBuild addCapability:]((uint64_t)build);
            ++v20;
          }
          while (v19 != v20);
        }
        if (*((_WORD *)v17 + 54))
        {
          build->_bucketId = *((_DWORD *)v17 + 19);
          *(_WORD *)&build->_flags |= 1u;
        }
        -[GEOPDGroundDataBuild _readLodWithTextures]((uint64_t)v17);
        uint64_t v25 = *((void *)v17 + 6);
        if (v25)
        {
          unint64_t v26 = 0;
          uint64_t v48 = *MEMORY[0x1E4F1C4A8];
          do
          {
            -[GEOPDGroundDataBuild _readLodWithTextures]((uint64_t)v17);
            unint64_t v27 = *((void *)v17 + 6);
            if (v27 <= v26)
            {
              long long v28 = (void *)MEMORY[0x1E4F1CA00];
              long long v29 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v26, v27);
              long long v30 = [v28 exceptionWithName:v48 reason:v29 userInfo:0];
              [v30 raise];
            }
            -[GEOPDGroundDataBuild addLodWithTextures:]((uint64_t)build);
            ++v26;
          }
          while (v25 != v26);
        }
        if ((*((_WORD *)v17 + 54) & 0x40) != 0)
        {
          build->_metricsVersion = *((_DWORD *)v17 + 25);
          *(_WORD *)&build->_flags |= 0x40u;
        }

        goto LABEL_52;
      }
LABEL_34:
      build->_heightAboveGroundM = *((float *)v17 + 23);
      *(_WORD *)&build->_flags |= 0x10u;
      goto LABEL_35;
    }
LABEL_80:
    build->_type = *((_DWORD *)v17 + 26);
    *(_WORD *)&build->_flags |= 0x80u;
    if ((*((_WORD *)v17 + 54) & 0x10) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  if (v16) {
    -[GEOPDPhotoPosition setBuild:](self, "setBuild:");
  }
LABEL_52:
  uint64_t v31 = [v4 cameraMetadataIndexsCount];
  if (v31)
  {
    uint64_t v32 = v31;
    for (uint64_t j = 0; j != v32; ++j)
      -[GEOPDPhotoPosition addCameraMetadataIndex:](self, "addCameraMetadataIndex:", [v4 cameraMetadataIndexAtIndex:j]);
  }
  tilePosition = self->_tilePosition;
  uint64_t v35 = *((void *)v4 + 13);
  if (tilePosition)
  {
    if (v35) {
      -[GEOPDOrientedTilePosition mergeFrom:](tilePosition, "mergeFrom:");
    }
  }
  else if (v35)
  {
    -[GEOPDPhotoPosition setTilePosition:](self, "setTilePosition:");
  }
  parentTile = self->_parentTile;
  uint64_t v37 = *((void *)v4 + 9);
  if (parentTile)
  {
    if (v37) {
      -[GEOTileCoordinate mergeFrom:](parentTile, "mergeFrom:");
    }
  }
  else if (v37)
  {
    -[GEOPDPhotoPosition setParentTile:](self, "setParentTile:");
  }
  id v38 = (void *)*((void *)v4 + 12);
  if (self->_rigMetrics)
  {
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = v39[2];
      if (v40)
      {
        unint64_t v41 = 0;
        uint64_t v42 = *MEMORY[0x1E4F1C4A8];
        do
        {
          unint64_t v43 = v39[2];
          if (v43 <= v41)
          {
            v44 = (void *)MEMORY[0x1E4F1CA00];
            v45 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v41, v43);
            v46 = [v44 exceptionWithName:v42 reason:v45 userInfo:0];
            [v46 raise];
          }
          PBRepeatedUInt32Add();
          ++v41;
        }
        while (v40 != v41);
      }
    }
  }
  else if (v38)
  {
    -[GEOPDPhotoPosition setRigMetrics:](self, "setRigMetrics:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tilePosition, 0);
  objc_storeStrong((id *)&self->_rigMetrics, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_positionGeo, 0);
  objc_storeStrong((id *)&self->_parentTile, 0);
  objc_storeStrong((id *)&self->_cameraMetadatas, 0);
  objc_storeStrong((id *)&self->_build, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end