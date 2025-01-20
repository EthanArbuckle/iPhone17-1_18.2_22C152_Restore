@interface GEOVLFCrowdsourcingDetails
+ (BOOL)isValid:(id)a3;
+ (Class)frameDetailsType;
+ (Class)slamTracksType;
- (BOOL)hasResultTranslationX;
- (BOOL)hasResultTranslationY;
- (BOOL)hasResultTranslationZ;
- (BOOL)hasStartFrameIdx;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFCrowdsourcingDetails)init;
- (GEOVLFCrowdsourcingDetails)initWithData:(id)a3;
- (GEOVLFCrowdsourcingDetails)initWithDictionary:(id)a3;
- (GEOVLFCrowdsourcingDetails)initWithJSON:(id)a3;
- (NSMutableArray)frameDetails;
- (NSMutableArray)slamTracks;
- (double)inlierPoints3DAtIndex:(unint64_t)a3;
- (double)inlierPoints3Ds;
- (double)resultPoseRotationAtIndex:(unint64_t)a3;
- (double)resultPoseRotations;
- (double)resultTranslationX;
- (double)resultTranslationY;
- (double)resultTranslationZ;
- (double)slamOriginAtIndex:(unint64_t)a3;
- (double)slamOrigins;
- (double)tileOriginAtIndex:(unint64_t)a3;
- (double)tileOrigins;
- (float)inlierPoints2DAtIndex:(unint64_t)a3;
- (float)inlierPoints2Ds;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)frameDetailsAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)slamTracksAtIndex:(unint64_t)a3;
- (unint64_t)frameDetailsCount;
- (unint64_t)hash;
- (unint64_t)inlierPoints2DsCount;
- (unint64_t)inlierPoints3DsCount;
- (unint64_t)resultPoseRotationsCount;
- (unint64_t)slamOriginsCount;
- (unint64_t)slamPtsInlierIdxsCount;
- (unint64_t)slamTracksCount;
- (unint64_t)tileOriginsCount;
- (unsigned)slamPtsInlierIdxAtIndex:(unint64_t)a3;
- (unsigned)slamPtsInlierIdxs;
- (unsigned)startFrameIdx;
- (void)_addNoFlagsFrameDetails:(uint64_t)a1;
- (void)_addNoFlagsSlamTracks:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readFrameDetails;
- (void)_readInlierPoints2Ds;
- (void)_readInlierPoints3Ds;
- (void)_readResultPoseRotations;
- (void)_readSlamOrigins;
- (void)_readSlamPtsInlierIdxs;
- (void)_readSlamTracks;
- (void)_readTileOrigins;
- (void)addFrameDetails:(id)a3;
- (void)addInlierPoints2D:(float)a3;
- (void)addInlierPoints3D:(double)a3;
- (void)addResultPoseRotation:(double)a3;
- (void)addSlamOrigin:(double)a3;
- (void)addSlamPtsInlierIdx:(unsigned int)a3;
- (void)addSlamTracks:(id)a3;
- (void)addTileOrigin:(double)a3;
- (void)clearFrameDetails;
- (void)clearInlierPoints2Ds;
- (void)clearInlierPoints3Ds;
- (void)clearResultPoseRotations;
- (void)clearSlamOrigins;
- (void)clearSlamPtsInlierIdxs;
- (void)clearSlamTracks;
- (void)clearTileOrigins;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setFrameDetails:(id)a3;
- (void)setHasResultTranslationX:(BOOL)a3;
- (void)setHasResultTranslationY:(BOOL)a3;
- (void)setHasResultTranslationZ:(BOOL)a3;
- (void)setHasStartFrameIdx:(BOOL)a3;
- (void)setInlierPoints2Ds:(float *)a3 count:(unint64_t)a4;
- (void)setInlierPoints3Ds:(double *)a3 count:(unint64_t)a4;
- (void)setResultPoseRotations:(double *)a3 count:(unint64_t)a4;
- (void)setResultTranslationX:(double)a3;
- (void)setResultTranslationY:(double)a3;
- (void)setResultTranslationZ:(double)a3;
- (void)setSlamOrigins:(double *)a3 count:(unint64_t)a4;
- (void)setSlamPtsInlierIdxs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSlamTracks:(id)a3;
- (void)setStartFrameIdx:(unsigned int)a3;
- (void)setTileOrigins:(double *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFCrowdsourcingDetails

- (GEOVLFCrowdsourcingDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOVLFCrowdsourcingDetails;
  v2 = [(GEOVLFCrowdsourcingDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLFCrowdsourcingDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOVLFCrowdsourcingDetails;
  v3 = [(GEOVLFCrowdsourcingDetails *)&v7 initWithData:a3];
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
  PBRepeatedDoubleClear();
  PBRepeatedDoubleClear();
  PBRepeatedDoubleClear();
  PBRepeatedDoubleClear();
  PBRepeatedFloatClear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOVLFCrowdsourcingDetails;
  [(GEOVLFCrowdsourcingDetails *)&v3 dealloc];
}

- (void)_readTileOrigins
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileOrigins_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (unint64_t)tileOriginsCount
{
  return self->_tileOrigins.count;
}

- (double)tileOrigins
{
  return self->_tileOrigins.list;
}

- (void)clearTileOrigins
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;

  PBRepeatedDoubleClear();
}

- (void)addTileOrigin:(double)a3
{
  if (self) {
    PBRepeatedDoubleAdd();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (double)tileOriginAtIndex:(unint64_t)a3
{
  -[GEOVLFCrowdsourcingDetails _readTileOrigins]((uint64_t)self);
  p_tileOrigins = &self->_tileOrigins;
  unint64_t count = self->_tileOrigins.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_tileOrigins->list[a3];
}

- (void)setTileOrigins:(double *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;

  MEMORY[0x1F4147320](&self->_tileOrigins, a3, a4);
}

- (void)_readSlamOrigins
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSlamOrigins_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (unint64_t)slamOriginsCount
{
  return self->_slamOrigins.count;
}

- (double)slamOrigins
{
  return self->_slamOrigins.list;
}

- (void)clearSlamOrigins
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;

  PBRepeatedDoubleClear();
}

- (void)addSlamOrigin:(double)a3
{
  if (self) {
    PBRepeatedDoubleAdd();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (double)slamOriginAtIndex:(unint64_t)a3
{
  -[GEOVLFCrowdsourcingDetails _readSlamOrigins]((uint64_t)self);
  p_slamOrigins = &self->_slamOrigins;
  unint64_t count = self->_slamOrigins.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_slamOrigins->list[a3];
}

- (void)setSlamOrigins:(double *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;

  MEMORY[0x1F4147320](&self->_slamOrigins, a3, a4);
}

- (void)_readSlamTracks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSlamTracks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (NSMutableArray)slamTracks
{
  -[GEOVLFCrowdsourcingDetails _readSlamTracks]((uint64_t)self);
  slamTracks = self->_slamTracks;

  return slamTracks;
}

- (void)setSlamTracks:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  slamTracks = self->_slamTracks;
  self->_slamTracks = v4;
}

- (void)clearSlamTracks
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  slamTracks = self->_slamTracks;

  [(NSMutableArray *)slamTracks removeAllObjects];
}

- (void)addSlamTracks:(id)a3
{
  id v4 = a3;
  -[GEOVLFCrowdsourcingDetails _readSlamTracks]((uint64_t)self);
  -[GEOVLFCrowdsourcingDetails _addNoFlagsSlamTracks:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsSlamTracks:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 192);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 192);
      *(void *)(a1 + 192) = v5;

      id v4 = *(void **)(a1 + 192);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)slamTracksCount
{
  -[GEOVLFCrowdsourcingDetails _readSlamTracks]((uint64_t)self);
  slamTracks = self->_slamTracks;

  return [(NSMutableArray *)slamTracks count];
}

- (id)slamTracksAtIndex:(unint64_t)a3
{
  -[GEOVLFCrowdsourcingDetails _readSlamTracks]((uint64_t)self);
  slamTracks = self->_slamTracks;

  return (id)[(NSMutableArray *)slamTracks objectAtIndex:a3];
}

+ (Class)slamTracksType
{
  return (Class)objc_opt_class();
}

- (void)_readFrameDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFrameDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (NSMutableArray)frameDetails
{
  -[GEOVLFCrowdsourcingDetails _readFrameDetails]((uint64_t)self);
  frameDetails = self->_frameDetails;

  return frameDetails;
}

- (void)setFrameDetails:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  frameDetails = self->_frameDetails;
  self->_frameDetails = v4;
}

- (void)clearFrameDetails
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
  frameDetails = self->_frameDetails;

  [(NSMutableArray *)frameDetails removeAllObjects];
}

- (void)addFrameDetails:(id)a3
{
  id v4 = a3;
  -[GEOVLFCrowdsourcingDetails _readFrameDetails]((uint64_t)self);
  -[GEOVLFCrowdsourcingDetails _addNoFlagsFrameDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (void)_addNoFlagsFrameDetails:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 160);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = v5;

      id v4 = *(void **)(a1 + 160);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)frameDetailsCount
{
  -[GEOVLFCrowdsourcingDetails _readFrameDetails]((uint64_t)self);
  frameDetails = self->_frameDetails;

  return [(NSMutableArray *)frameDetails count];
}

- (id)frameDetailsAtIndex:(unint64_t)a3
{
  -[GEOVLFCrowdsourcingDetails _readFrameDetails]((uint64_t)self);
  frameDetails = self->_frameDetails;

  return (id)[(NSMutableArray *)frameDetails objectAtIndex:a3];
}

+ (Class)frameDetailsType
{
  return (Class)objc_opt_class();
}

- (void)_readResultPoseRotations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultPoseRotations_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (unint64_t)resultPoseRotationsCount
{
  return self->_resultPoseRotations.count;
}

- (double)resultPoseRotations
{
  return self->_resultPoseRotations.list;
}

- (void)clearResultPoseRotations
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;

  PBRepeatedDoubleClear();
}

- (void)addResultPoseRotation:(double)a3
{
  if (self) {
    PBRepeatedDoubleAdd();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (double)resultPoseRotationAtIndex:(unint64_t)a3
{
  -[GEOVLFCrowdsourcingDetails _readResultPoseRotations]((uint64_t)self);
  p_resultPoseRotations = &self->_resultPoseRotations;
  unint64_t count = self->_resultPoseRotations.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_resultPoseRotations->list[a3];
}

- (void)setResultPoseRotations:(double *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;

  MEMORY[0x1F4147320](&self->_resultPoseRotations, a3, a4);
}

- (double)resultTranslationX
{
  return self->_resultTranslationX;
}

- (void)setResultTranslationX:(double)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_resultTranslationX = a3;
}

- (void)setHasResultTranslationX:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasResultTranslationX
{
  return *(_WORD *)&self->_flags & 1;
}

- (double)resultTranslationY
{
  return self->_resultTranslationY;
}

- (void)setResultTranslationY:(double)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_resultTranslationY = a3;
}

- (void)setHasResultTranslationY:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4098;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasResultTranslationY
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (double)resultTranslationZ
{
  return self->_resultTranslationZ;
}

- (void)setResultTranslationZ:(double)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_resultTranslationZ = a3;
}

- (void)setHasResultTranslationZ:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4100;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasResultTranslationZ
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readInlierPoints3Ds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInlierPoints3Ds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (unint64_t)inlierPoints3DsCount
{
  return self->_inlierPoints3Ds.count;
}

- (double)inlierPoints3Ds
{
  return self->_inlierPoints3Ds.list;
}

- (void)clearInlierPoints3Ds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;

  PBRepeatedDoubleClear();
}

- (void)addInlierPoints3D:(double)a3
{
  if (self) {
    PBRepeatedDoubleAdd();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (double)inlierPoints3DAtIndex:(unint64_t)a3
{
  -[GEOVLFCrowdsourcingDetails _readInlierPoints3Ds]((uint64_t)self);
  p_inlierPoints3Ds = &self->_inlierPoints3Ds;
  unint64_t count = self->_inlierPoints3Ds.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_inlierPoints3Ds->list[a3];
}

- (void)setInlierPoints3Ds:(double *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;

  MEMORY[0x1F4147320](&self->_inlierPoints3Ds, a3, a4);
}

- (void)_readInlierPoints2Ds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readInlierPoints2Ds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (unint64_t)inlierPoints2DsCount
{
  return self->_inlierPoints2Ds.count;
}

- (float)inlierPoints2Ds
{
  return self->_inlierPoints2Ds.list;
}

- (void)clearInlierPoints2Ds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;

  PBRepeatedFloatClear();
}

- (void)addInlierPoints2D:(float)a3
{
  if (self) {
    PBRepeatedFloatAdd();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (float)inlierPoints2DAtIndex:(unint64_t)a3
{
  -[GEOVLFCrowdsourcingDetails _readInlierPoints2Ds]((uint64_t)self);
  p_inlierPoints2Ds = &self->_inlierPoints2Ds;
  unint64_t count = self->_inlierPoints2Ds.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_inlierPoints2Ds->list[a3];
}

- (void)setInlierPoints2Ds:(float *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;

  MEMORY[0x1F4147358](&self->_inlierPoints2Ds, a3, a4);
}

- (void)_readSlamPtsInlierIdxs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
    if ((*(_WORD *)(a1 + 216) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFCrowdsourcingDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSlamPtsInlierIdxs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 208));
  }
}

- (unint64_t)slamPtsInlierIdxsCount
{
  return self->_slamPtsInlierIdxs.count;
}

- (unsigned)slamPtsInlierIdxs
{
  return self->_slamPtsInlierIdxs.list;
}

- (void)clearSlamPtsInlierIdxs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;

  PBRepeatedUInt32Clear();
}

- (void)addSlamPtsInlierIdx:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;
}

- (unsigned)slamPtsInlierIdxAtIndex:(unint64_t)a3
{
  -[GEOVLFCrowdsourcingDetails _readSlamPtsInlierIdxs]((uint64_t)self);
  p_slamPtsInlierIdxs = &self->_slamPtsInlierIdxs;
  unint64_t count = self->_slamPtsInlierIdxs.count;
  if (count <= a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_slamPtsInlierIdxs->list[a3];
}

- (void)setSlamPtsInlierIdxs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x1000u;

  MEMORY[0x1F4147400](&self->_slamPtsInlierIdxs, a3, a4);
}

- (unsigned)startFrameIdx
{
  return self->_startFrameIdx;
}

- (void)setStartFrameIdx:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_startFrameIdx = a3;
}

- (void)setHasStartFrameIdx:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4104;
  }
  else {
    __int16 v3 = 4096;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasStartFrameIdx
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFCrowdsourcingDetails;
  id v4 = [(GEOVLFCrowdsourcingDetails *)&v8 description];
  id v5 = [(GEOVLFCrowdsourcingDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFCrowdsourcingDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_74;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(void *)(a1 + 144))
  {
    id v5 = PBRepeatedDoubleNSArray();
    if (a2) {
      objc_super v6 = @"tileOrigin";
    }
    else {
      objc_super v6 = @"tile_origin";
    }
    [v4 setObject:v5 forKey:v6];
  }
  if (*(void *)(a1 + 96))
  {
    id v7 = PBRepeatedDoubleNSArray();
    if (a2) {
      objc_super v8 = @"slamOrigin";
    }
    else {
      objc_super v8 = @"slam_origin";
    }
    [v4 setObject:v7 forKey:v8];
  }
  if ([*(id *)(a1 + 192) count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 192), "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v10 = *(id *)(a1 + 192);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v50 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if (a2) {
            [v15 jsonRepresentation];
          }
          else {
          v16 = [v15 dictionaryRepresentation];
          }
          [v9 addObject:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v12);
    }

    if (a2) {
      v17 = @"slamTracks";
    }
    else {
      v17 = @"slam_tracks";
    }
    [v4 setObject:v9 forKey:v17];
  }
  if ([*(id *)(a1 + 160) count])
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 160), "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v19 = *(id *)(a1 + 160);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v46 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          if (a2) {
            [v24 jsonRepresentation];
          }
          else {
          v25 = objc_msgSend(v24, "dictionaryRepresentation", (void)v45);
          }
          objc_msgSend(v18, "addObject:", v25, (void)v45);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v21);
    }

    if (a2) {
      v26 = @"frameDetails";
    }
    else {
      v26 = @"frame_details";
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v26, (void)v45);
  }
  if (*(void *)(a1 + 72))
  {
    v27 = PBRepeatedDoubleNSArray();
    if (a2) {
      v28 = @"resultPoseRotation";
    }
    else {
      v28 = @"result_pose_rotation";
    }
    [v4 setObject:v27 forKey:v28];
  }
  __int16 v29 = *(_WORD *)(a1 + 216);
  if ((v29 & 1) == 0)
  {
    if ((v29 & 2) == 0) {
      goto LABEL_49;
    }
LABEL_81:
    v43 = [NSNumber numberWithDouble:*(double *)(a1 + 176)];
    if (a2) {
      v44 = @"resultTranslationY";
    }
    else {
      v44 = @"result_translation_y";
    }
    [v4 setObject:v43 forKey:v44];

    if ((*(_WORD *)(a1 + 216) & 4) == 0) {
      goto LABEL_54;
    }
    goto LABEL_50;
  }
  v41 = [NSNumber numberWithDouble:*(double *)(a1 + 168)];
  if (a2) {
    v42 = @"resultTranslationX";
  }
  else {
    v42 = @"result_translation_x";
  }
  [v4 setObject:v41 forKey:v42];

  __int16 v29 = *(_WORD *)(a1 + 216);
  if ((v29 & 2) != 0) {
    goto LABEL_81;
  }
LABEL_49:
  if ((v29 & 4) != 0)
  {
LABEL_50:
    v30 = [NSNumber numberWithDouble:*(double *)(a1 + 184)];
    if (a2) {
      v31 = @"resultTranslationZ";
    }
    else {
      v31 = @"result_translation_z";
    }
    [v4 setObject:v30 forKey:v31];
  }
LABEL_54:
  if (*(void *)(a1 + 48))
  {
    v32 = PBRepeatedDoubleNSArray();
    if (a2) {
      v33 = @"inlierPoints3D";
    }
    else {
      v33 = @"inlier_points_3d";
    }
    [v4 setObject:v32 forKey:v33];
  }
  if (*(void *)(a1 + 24))
  {
    v34 = PBRepeatedFloatNSArray();
    if (a2) {
      v35 = @"inlierPoints2D";
    }
    else {
      v35 = @"inlier_points_2d";
    }
    [v4 setObject:v34 forKey:v35];
  }
  if (*(void *)(a1 + 120))
  {
    v36 = PBRepeatedUInt32NSArray();
    if (a2) {
      v37 = @"slamPtsInlierIdx";
    }
    else {
      v37 = @"slam_pts_inlier_idx";
    }
    [v4 setObject:v36 forKey:v37];
  }
  if ((*(_WORD *)(a1 + 216) & 8) != 0)
  {
    v38 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 212)];
    if (a2) {
      v39 = @"startFrameIdx";
    }
    else {
      v39 = @"start_frame_idx";
    }
    [v4 setObject:v38 forKey:v39];
  }
LABEL_74:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFCrowdsourcingDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFCrowdsourcingDetails)initWithDictionary:(id)a3
{
  return (GEOVLFCrowdsourcingDetails *)-[GEOVLFCrowdsourcingDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"tileOrigin";
      }
      else {
        objc_super v6 = @"tile_origin";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v118 = 0u;
        long long v119 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v116 objects:v127 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v117;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v117 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v116 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v13 doubleValue];
                objc_msgSend(a1, "addTileOrigin:");
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v116 objects:v127 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        v14 = @"slamOrigin";
      }
      else {
        v14 = @"slam_origin";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v114 = 0u;
        long long v115 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v112 objects:v126 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v113;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v113 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void **)(*((void *)&v112 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v21 doubleValue];
                objc_msgSend(a1, "addSlamOrigin:");
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v112 objects:v126 count:16];
          }
          while (v18);
        }
      }
      if (a3) {
        uint64_t v22 = @"slamTracks";
      }
      else {
        uint64_t v22 = @"slam_tracks";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      id v87 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        v85 = v23;
        id v24 = v23;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v108 objects:v125 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v109;
          do
          {
            for (uint64_t k = 0; k != v26; ++k)
            {
              if (*(void *)v109 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v108 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v30 = [GEOVLFSLAMTrack alloc];
                if (a3) {
                  uint64_t v31 = [(GEOVLFSLAMTrack *)v30 initWithJSON:v29];
                }
                else {
                  uint64_t v31 = [(GEOVLFSLAMTrack *)v30 initWithDictionary:v29];
                }
                v32 = (void *)v31;
                objc_msgSend(a1, "addSlamTracks:", v31, v85);
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v108 objects:v125 count:16];
          }
          while (v26);
        }

        v23 = v85;
        id v5 = v87;
      }

      if (a3) {
        v33 = @"frameDetails";
      }
      else {
        v33 = @"frame_details";
      }
      v34 = objc_msgSend(v5, "objectForKeyedSubscript:", v33, v85);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        v86 = v34;
        id v35 = v34;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v104 objects:v124 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v105;
          do
          {
            for (uint64_t m = 0; m != v37; ++m)
            {
              if (*(void *)v105 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void *)(*((void *)&v104 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v41 = [GEOVLFFrameDetails alloc];
                if (a3) {
                  uint64_t v42 = [(GEOVLFFrameDetails *)v41 initWithJSON:v40];
                }
                else {
                  uint64_t v42 = [(GEOVLFFrameDetails *)v41 initWithDictionary:v40];
                }
                v43 = (void *)v42;
                objc_msgSend(a1, "addFrameDetails:", v42, v86);
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v104 objects:v124 count:16];
          }
          while (v37);
        }

        v34 = v86;
        id v5 = v87;
      }

      if (a3) {
        v44 = @"resultPoseRotation";
      }
      else {
        v44 = @"result_pose_rotation";
      }
      long long v45 = objc_msgSend(v5, "objectForKeyedSubscript:", v44, v86);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        id v46 = v45;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v100 objects:v123 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v101;
          do
          {
            for (uint64_t n = 0; n != v48; ++n)
            {
              if (*(void *)v101 != v49) {
                objc_enumerationMutation(v46);
              }
              long long v51 = *(void **)(*((void *)&v100 + 1) + 8 * n);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v51 doubleValue];
                objc_msgSend(a1, "addResultPoseRotation:");
              }
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v100 objects:v123 count:16];
          }
          while (v48);
        }
      }
      if (a3) {
        long long v52 = @"resultTranslationX";
      }
      else {
        long long v52 = @"result_translation_x";
      }
      v53 = [v5 objectForKeyedSubscript:v52];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v53 doubleValue];
        objc_msgSend(a1, "setResultTranslationX:");
      }

      if (a3) {
        v54 = @"resultTranslationY";
      }
      else {
        v54 = @"result_translation_y";
      }
      uint64_t v55 = [v5 objectForKeyedSubscript:v54];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v55 doubleValue];
        objc_msgSend(a1, "setResultTranslationY:");
      }

      if (a3) {
        v56 = @"resultTranslationZ";
      }
      else {
        v56 = @"result_translation_z";
      }
      v57 = [v5 objectForKeyedSubscript:v56];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v57 doubleValue];
        objc_msgSend(a1, "setResultTranslationZ:");
      }

      if (a3) {
        v58 = @"inlierPoints3D";
      }
      else {
        v58 = @"inlier_points_3d";
      }
      v59 = [v5 objectForKeyedSubscript:v58];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        id v60 = v59;
        uint64_t v61 = [v60 countByEnumeratingWithState:&v96 objects:v122 count:16];
        if (v61)
        {
          uint64_t v62 = v61;
          uint64_t v63 = *(void *)v97;
          do
          {
            for (iuint64_t i = 0; ii != v62; ++ii)
            {
              if (*(void *)v97 != v63) {
                objc_enumerationMutation(v60);
              }
              v65 = *(void **)(*((void *)&v96 + 1) + 8 * ii);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v65 doubleValue];
                objc_msgSend(a1, "addInlierPoints3D:");
              }
            }
            uint64_t v62 = [v60 countByEnumeratingWithState:&v96 objects:v122 count:16];
          }
          while (v62);
        }
      }
      if (a3) {
        v66 = @"inlierPoints2D";
      }
      else {
        v66 = @"inlier_points_2d";
      }
      v67 = [v5 objectForKeyedSubscript:v66];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v68 = v67;
        uint64_t v69 = [v68 countByEnumeratingWithState:&v92 objects:v121 count:16];
        if (v69)
        {
          uint64_t v70 = v69;
          uint64_t v71 = *(void *)v93;
          do
          {
            for (juint64_t j = 0; jj != v70; ++jj)
            {
              if (*(void *)v93 != v71) {
                objc_enumerationMutation(v68);
              }
              v73 = *(void **)(*((void *)&v92 + 1) + 8 * jj);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v73 floatValue];
                objc_msgSend(a1, "addInlierPoints2D:");
              }
            }
            uint64_t v70 = [v68 countByEnumeratingWithState:&v92 objects:v121 count:16];
          }
          while (v70);
        }
      }
      if (a3) {
        v74 = @"slamPtsInlierIdx";
      }
      else {
        v74 = @"slam_pts_inlier_idx";
      }
      v75 = [v5 objectForKeyedSubscript:v74];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        id v76 = v75;
        uint64_t v77 = [v76 countByEnumeratingWithState:&v88 objects:v120 count:16];
        if (v77)
        {
          uint64_t v78 = v77;
          uint64_t v79 = *(void *)v89;
          do
          {
            for (kuint64_t k = 0; kk != v78; ++kk)
            {
              if (*(void *)v89 != v79) {
                objc_enumerationMutation(v76);
              }
              v81 = *(void **)(*((void *)&v88 + 1) + 8 * kk);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addSlamPtsInlierIdx:", objc_msgSend(v81, "unsignedIntValue"));
              }
            }
            uint64_t v78 = [v76 countByEnumeratingWithState:&v88 objects:v120 count:16];
          }
          while (v78);
        }
      }
      if (a3) {
        v82 = @"startFrameIdx";
      }
      else {
        v82 = @"start_frame_idx";
      }
      v83 = [v5 objectForKeyedSubscript:v82];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setStartFrameIdx:", objc_msgSend(v83, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOVLFCrowdsourcingDetails)initWithJSON:(id)a3
{
  return (GEOVLFCrowdsourcingDetails *)-[GEOVLFCrowdsourcingDetails _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_11435;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_11436;
    }
    GEOVLFCrowdsourcingDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOVLFCrowdsourcingDetailsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFCrowdsourcingDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFCrowdsourcingDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOVLFCrowdsourcingDetailsIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v21 = self->_reader;
    objc_sync_enter(v21);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v22 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v22];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v21);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOVLFCrowdsourcingDetails *)self readAll:0];
    if (self->_tileOrigins.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v6;
      }
      while (v6 < self->_tileOrigins.count);
    }
    if (self->_slamOrigins.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v7;
      }
      while (v7 < self->_slamOrigins.count);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = self->_slamTracks;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v8);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = self->_frameDetails;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v12);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v13);
    }

    if (self->_resultPoseRotations.count)
    {
      unint64_t v16 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v16;
      }
      while (v16 < self->_resultPoseRotations.count);
    }
    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      PBDataWriterWriteDoubleField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteDoubleField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_inlierPoints3Ds.count)
    {
      unint64_t v18 = 0;
      do
      {
        PBDataWriterWriteDoubleField();
        ++v18;
      }
      while (v18 < self->_inlierPoints3Ds.count);
    }
    if (self->_inlierPoints2Ds.count)
    {
      unint64_t v19 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v19;
      }
      while (v19 < self->_inlierPoints2Ds.count);
    }
    if (self->_slamPtsInlierIdxs.count)
    {
      unint64_t v20 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v20;
      }
      while (v20 < self->_slamPtsInlierIdxs.count);
    }
    if ((*(_WORD *)&self->_flags & 8) != 0) {
      PBDataWriterWriteUint32Field();
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v31 = (id *)a3;
  [(GEOVLFCrowdsourcingDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v31 + 1, self->_reader);
  *((_DWORD *)v31 + 50) = self->_readerMarkPos;
  *((_DWORD *)v31 + 51) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOVLFCrowdsourcingDetails *)self tileOriginsCount])
  {
    [v31 clearTileOrigins];
    unint64_t v4 = [(GEOVLFCrowdsourcingDetails *)self tileOriginsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(GEOVLFCrowdsourcingDetails *)self tileOriginAtIndex:i];
        objc_msgSend(v31, "addTileOrigin:");
      }
    }
  }
  if ([(GEOVLFCrowdsourcingDetails *)self slamOriginsCount])
  {
    [v31 clearSlamOrigins];
    unint64_t v7 = [(GEOVLFCrowdsourcingDetails *)self slamOriginsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        [(GEOVLFCrowdsourcingDetails *)self slamOriginAtIndex:j];
        objc_msgSend(v31, "addSlamOrigin:");
      }
    }
  }
  if ([(GEOVLFCrowdsourcingDetails *)self slamTracksCount])
  {
    [v31 clearSlamTracks];
    unint64_t v10 = [(GEOVLFCrowdsourcingDetails *)self slamTracksCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
      {
        uint64_t v13 = [(GEOVLFCrowdsourcingDetails *)self slamTracksAtIndex:k];
        [v31 addSlamTracks:v13];
      }
    }
  }
  if ([(GEOVLFCrowdsourcingDetails *)self frameDetailsCount])
  {
    [v31 clearFrameDetails];
    unint64_t v14 = [(GEOVLFCrowdsourcingDetails *)self frameDetailsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
      {
        uint64_t v17 = [(GEOVLFCrowdsourcingDetails *)self frameDetailsAtIndex:m];
        [v31 addFrameDetails:v17];
      }
    }
  }
  if ([(GEOVLFCrowdsourcingDetails *)self resultPoseRotationsCount])
  {
    [v31 clearResultPoseRotations];
    unint64_t v18 = [(GEOVLFCrowdsourcingDetails *)self resultPoseRotationsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t n = 0; n != v19; ++n)
      {
        [(GEOVLFCrowdsourcingDetails *)self resultPoseRotationAtIndex:n];
        objc_msgSend(v31, "addResultPoseRotation:");
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 2) == 0) {
      goto LABEL_23;
    }
LABEL_43:
    v31[22] = *(id *)&self->_resultTranslationY;
    *((_WORD *)v31 + 108) |= 2u;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  v31[21] = *(id *)&self->_resultTranslationX;
  *((_WORD *)v31 + 108) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_43;
  }
LABEL_23:
  if ((flags & 4) != 0)
  {
LABEL_24:
    v31[23] = *(id *)&self->_resultTranslationZ;
    *((_WORD *)v31 + 108) |= 4u;
  }
LABEL_25:
  if ([(GEOVLFCrowdsourcingDetails *)self inlierPoints3DsCount])
  {
    [v31 clearInlierPoints3Ds];
    unint64_t v22 = [(GEOVLFCrowdsourcingDetails *)self inlierPoints3DsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (iuint64_t i = 0; ii != v23; ++ii)
      {
        [(GEOVLFCrowdsourcingDetails *)self inlierPoints3DAtIndex:ii];
        objc_msgSend(v31, "addInlierPoints3D:");
      }
    }
  }
  if ([(GEOVLFCrowdsourcingDetails *)self inlierPoints2DsCount])
  {
    [v31 clearInlierPoints2Ds];
    unint64_t v25 = [(GEOVLFCrowdsourcingDetails *)self inlierPoints2DsCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (juint64_t j = 0; jj != v26; ++jj)
      {
        [(GEOVLFCrowdsourcingDetails *)self inlierPoints2DAtIndex:jj];
        objc_msgSend(v31, "addInlierPoints2D:");
      }
    }
  }
  if ([(GEOVLFCrowdsourcingDetails *)self slamPtsInlierIdxsCount])
  {
    [v31 clearSlamPtsInlierIdxs];
    unint64_t v28 = [(GEOVLFCrowdsourcingDetails *)self slamPtsInlierIdxsCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (kuint64_t k = 0; kk != v29; ++kk)
        objc_msgSend(v31, "addSlamPtsInlierIdx:", -[GEOVLFCrowdsourcingDetails slamPtsInlierIdxAtIndex:](self, "slamPtsInlierIdxAtIndex:", kk));
    }
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v31 + 53) = self->_startFrameIdx;
    *((_WORD *)v31 + 108) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOVLFCrowdsourcingDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOVLFCrowdsourcingDetails *)self readAll:0];
  PBRepeatedDoubleCopy();
  PBRepeatedDoubleCopy();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = self->_slamTracks;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addSlamTracks:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v14 = self->_frameDetails;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        unint64_t v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        [(id)v5 addFrameDetails:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  PBRepeatedDoubleCopy();
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    *(double *)(v5 + 168) = self->_resultTranslationX;
    *(_WORD *)(v5 + 216) |= 1u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_21:
      if ((flags & 4) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_21;
  }
  *(double *)(v5 + 176) = self->_resultTranslationY;
  *(_WORD *)(v5 + 216) |= 2u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_22:
    *(double *)(v5 + 184) = self->_resultTranslationZ;
    *(_WORD *)(v5 + 216) |= 4u;
  }
LABEL_23:
  PBRepeatedDoubleCopy();
  PBRepeatedFloatCopy();
  PBRepeatedUInt32Copy();
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 212) = self->_startFrameIdx;
    *(_WORD *)(v5 + 216) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  [(GEOVLFCrowdsourcingDetails *)self readAll:1];
  [v4 readAll:1];
  if (!PBRepeatedDoubleIsEqual()) {
    goto LABEL_31;
  }
  if (!PBRepeatedDoubleIsEqual()) {
    goto LABEL_31;
  }
  slamTracks = self->_slamTracks;
  if ((unint64_t)slamTracks | *((void *)v4 + 24))
  {
    if (!-[NSMutableArray isEqual:](slamTracks, "isEqual:")) {
      goto LABEL_31;
    }
  }
  frameDetails = self->_frameDetails;
  if ((unint64_t)frameDetails | *((void *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](frameDetails, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if (!PBRepeatedDoubleIsEqual()) {
    goto LABEL_31;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v8 = *((_WORD *)v4 + 108);
  if (flags)
  {
    if ((v8 & 1) == 0 || self->_resultTranslationX != *((double *)v4 + 21)) {
      goto LABEL_31;
    }
  }
  else if (v8)
  {
LABEL_31:
    BOOL v10 = 0;
    goto LABEL_32;
  }
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_resultTranslationY != *((double *)v4 + 22)) {
      goto LABEL_31;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_resultTranslationZ != *((double *)v4 + 23)) {
      goto LABEL_31;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_31;
  }
  if (!PBRepeatedDoubleIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    goto LABEL_31;
  }
  __int16 v9 = *((_WORD *)v4 + 108);
  BOOL v10 = (v9 & 8) == 0;
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_startFrameIdx != *((_DWORD *)v4 + 53)) {
      goto LABEL_31;
    }
    BOOL v10 = 1;
  }
LABEL_32:

  return v10;
}

- (unint64_t)hash
{
  [(GEOVLFCrowdsourcingDetails *)self readAll:1];
  uint64_t v28 = PBRepeatedDoubleHash();
  uint64_t v27 = PBRepeatedDoubleHash();
  uint64_t v26 = [(NSMutableArray *)self->_slamTracks hash];
  uint64_t v25 = [(NSMutableArray *)self->_frameDetails hash];
  uint64_t v3 = PBRepeatedDoubleHash();
  __int16 flags = (__int16)self->_flags;
  if (flags)
  {
    double resultTranslationX = self->_resultTranslationX;
    double v7 = -resultTranslationX;
    if (resultTranslationX >= 0.0) {
      double v7 = self->_resultTranslationX;
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
  if ((flags & 2) != 0)
  {
    double resultTranslationY = self->_resultTranslationY;
    double v12 = -resultTranslationY;
    if (resultTranslationY >= 0.0) {
      double v12 = self->_resultTranslationY;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((flags & 4) != 0)
  {
    double resultTranslationZ = self->_resultTranslationZ;
    double v17 = -resultTranslationZ;
    if (resultTranslationZ >= 0.0) {
      double v17 = self->_resultTranslationZ;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  uint64_t v20 = PBRepeatedDoubleHash();
  uint64_t v21 = PBRepeatedFloatHash();
  uint64_t v22 = PBRepeatedUInt32Hash();
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    uint64_t v23 = 2654435761 * self->_startFrameIdx;
  }
  else {
    uint64_t v23 = 0;
  }
  return v27 ^ v28 ^ v26 ^ v25 ^ v3 ^ v5 ^ v10 ^ v15 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 tileOriginsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      [v4 tileOriginAtIndex:i];
      -[GEOVLFCrowdsourcingDetails addTileOrigin:](self, "addTileOrigin:");
    }
  }
  uint64_t v8 = [v4 slamOriginsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
    {
      [v4 slamOriginAtIndex:j];
      -[GEOVLFCrowdsourcingDetails addSlamOrigin:](self, "addSlamOrigin:");
    }
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v11 = *((id *)v4 + 24);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v13; ++k)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        [(GEOVLFCrowdsourcingDetails *)self addSlamTracks:*(void *)(*((void *)&v38 + 1) + 8 * k)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v13);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v16 = *((id *)v4 + 20);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v35;
    do
    {
      for (uint64_t m = 0; m != v18; ++m)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(v16);
        }
        -[GEOVLFCrowdsourcingDetails addFrameDetails:](self, "addFrameDetails:", *(void *)(*((void *)&v34 + 1) + 8 * m), (void)v34);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v18);
  }

  uint64_t v21 = [v4 resultPoseRotationsCount];
  if (v21)
  {
    uint64_t v22 = v21;
    for (uint64_t n = 0; n != v22; ++n)
    {
      objc_msgSend(v4, "resultPoseRotationAtIndex:", n, (void)v34);
      -[GEOVLFCrowdsourcingDetails addResultPoseRotation:](self, "addResultPoseRotation:");
    }
  }
  __int16 v24 = *((_WORD *)v4 + 108);
  if (v24)
  {
    self->_double resultTranslationX = *((double *)v4 + 21);
    *(_WORD *)&self->_flags |= 1u;
    __int16 v24 = *((_WORD *)v4 + 108);
    if ((v24 & 2) == 0)
    {
LABEL_26:
      if ((v24 & 4) == 0) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
  }
  else if ((v24 & 2) == 0)
  {
    goto LABEL_26;
  }
  self->_double resultTranslationY = *((double *)v4 + 22);
  *(_WORD *)&self->_flags |= 2u;
  if ((*((_WORD *)v4 + 108) & 4) != 0)
  {
LABEL_27:
    self->_double resultTranslationZ = *((double *)v4 + 23);
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_28:
  uint64_t v25 = objc_msgSend(v4, "inlierPoints3DsCount", (void)v34);
  if (v25)
  {
    uint64_t v26 = v25;
    for (iuint64_t i = 0; ii != v26; ++ii)
    {
      [v4 inlierPoints3DAtIndex:ii];
      -[GEOVLFCrowdsourcingDetails addInlierPoints3D:](self, "addInlierPoints3D:");
    }
  }
  uint64_t v28 = [v4 inlierPoints2DsCount];
  if (v28)
  {
    uint64_t v29 = v28;
    for (juint64_t j = 0; jj != v29; ++jj)
    {
      [v4 inlierPoints2DAtIndex:jj];
      -[GEOVLFCrowdsourcingDetails addInlierPoints2D:](self, "addInlierPoints2D:");
    }
  }
  uint64_t v31 = [v4 slamPtsInlierIdxsCount];
  if (v31)
  {
    uint64_t v32 = v31;
    for (kuint64_t k = 0; kk != v32; ++kk)
      -[GEOVLFCrowdsourcingDetails addSlamPtsInlierIdx:](self, "addSlamPtsInlierIdx:", [v4 slamPtsInlierIdxAtIndex:kk]);
  }
  if ((*((_WORD *)v4 + 108) & 8) != 0)
  {
    self->_startFrameIdx = *((_DWORD *)v4 + 53);
    *(_WORD *)&self->_flags |= 8u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slamTracks, 0);
  objc_storeStrong((id *)&self->_frameDetails, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end