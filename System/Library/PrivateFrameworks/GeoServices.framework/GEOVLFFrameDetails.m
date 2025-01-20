@interface GEOVLFFrameDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasRadialDistortion1;
- (BOOL)hasRadialDistortion2;
- (BOOL)hasResultStatus;
- (BOOL)hasResultTranslationX;
- (BOOL)hasResultTranslationY;
- (BOOL)hasResultTranslationZ;
- (BOOL)hasTileId;
- (BOOL)hasTimestamp;
- (BOOL)hasVioStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFFrameDetails)init;
- (GEOVLFFrameDetails)initWithData:(id)a3;
- (GEOVLFFrameDetails)initWithDictionary:(id)a3;
- (GEOVLFFrameDetails)initWithJSON:(id)a3;
- (GEOVLFUsageTileID)tileId;
- (double)resultPoseRotationAtIndex:(unint64_t)a3;
- (double)resultPoseRotations;
- (double)resultTranslationX;
- (double)resultTranslationY;
- (double)resultTranslationZ;
- (double)timestamp;
- (float)calibrationMatrixAtIndex:(unint64_t)a3;
- (float)calibrationMatrixs;
- (float)radialDistortion1;
- (float)radialDistortion2;
- (float)slamPoseAtIndex:(unint64_t)a3;
- (float)slamPoses;
- (float)vioPoseAtIndex:(unint64_t)a3;
- (float)vioPoses;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)resultStatus;
- (unint64_t)calibrationMatrixsCount;
- (unint64_t)hash;
- (unint64_t)resultPoseRotationsCount;
- (unint64_t)slamPosesCount;
- (unint64_t)vioPosesCount;
- (unsigned)vioStatus;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCalibrationMatrixs;
- (void)_readResultPoseRotations;
- (void)_readSlamPoses;
- (void)_readTileId;
- (void)_readVioPoses;
- (void)addCalibrationMatrix:(float)a3;
- (void)addResultPoseRotation:(double)a3;
- (void)addSlamPose:(float)a3;
- (void)addVioPose:(float)a3;
- (void)clearCalibrationMatrixs;
- (void)clearResultPoseRotations;
- (void)clearSlamPoses;
- (void)clearVioPoses;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCalibrationMatrixs:(float *)a3 count:(unint64_t)a4;
- (void)setHasRadialDistortion1:(BOOL)a3;
- (void)setHasRadialDistortion2:(BOOL)a3;
- (void)setHasResultStatus:(BOOL)a3;
- (void)setHasResultTranslationX:(BOOL)a3;
- (void)setHasResultTranslationY:(BOOL)a3;
- (void)setHasResultTranslationZ:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVioStatus:(BOOL)a3;
- (void)setRadialDistortion1:(float)a3;
- (void)setRadialDistortion2:(float)a3;
- (void)setResultPoseRotations:(double *)a3 count:(unint64_t)a4;
- (void)setResultStatus:(int)a3;
- (void)setResultTranslationX:(double)a3;
- (void)setResultTranslationY:(double)a3;
- (void)setResultTranslationZ:(double)a3;
- (void)setSlamPoses:(float *)a3 count:(unint64_t)a4;
- (void)setTileId:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setVioPoses:(float *)a3 count:(unint64_t)a4;
- (void)setVioStatus:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFFrameDetails

- (GEOVLFFrameDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOVLFFrameDetails;
  v2 = [(GEOVLFFrameDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLFFrameDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOVLFFrameDetails;
  v3 = [(GEOVLFFrameDetails *)&v7 initWithData:a3];
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
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)GEOVLFFrameDetails;
  [(GEOVLFFrameDetails *)&v3 dealloc];
}

- (unsigned)vioStatus
{
  return self->_vioStatus;
}

- (void)setVioStatus:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  self->_vioStatus = a3;
}

- (void)setHasVioStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8320;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasVioStatus
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (void)_readVioPoses
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 180) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFFrameDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVioPoses_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (unint64_t)vioPosesCount
{
  return self->_vioPoses.count;
}

- (float)vioPoses
{
  return self->_vioPoses.list;
}

- (void)clearVioPoses
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  PBRepeatedFloatClear();
}

- (void)addVioPose:(float)a3
{
  if (self) {
    PBRepeatedFloatAdd();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (float)vioPoseAtIndex:(unint64_t)a3
{
  -[GEOVLFFrameDetails _readVioPoses]((uint64_t)self);
  p_vioPoses = &self->_vioPoses;
  unint64_t count = self->_vioPoses.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_vioPoses->list[a3];
}

- (void)setVioPoses:(float *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  MEMORY[0x1F4147358](&self->_vioPoses, a3, a4);
}

- (void)_readCalibrationMatrixs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 180) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFFrameDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCalibrationMatrixs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (unint64_t)calibrationMatrixsCount
{
  return self->_calibrationMatrixs.count;
}

- (float)calibrationMatrixs
{
  return self->_calibrationMatrixs.list;
}

- (void)clearCalibrationMatrixs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  PBRepeatedFloatClear();
}

- (void)addCalibrationMatrix:(float)a3
{
  if (self) {
    PBRepeatedFloatAdd();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (float)calibrationMatrixAtIndex:(unint64_t)a3
{
  -[GEOVLFFrameDetails _readCalibrationMatrixs]((uint64_t)self);
  p_calibrationMatrixs = &self->_calibrationMatrixs;
  unint64_t count = self->_calibrationMatrixs.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_calibrationMatrixs->list[a3];
}

- (void)setCalibrationMatrixs:(float *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  MEMORY[0x1F4147358](&self->_calibrationMatrixs, a3, a4);
}

- (float)radialDistortion1
{
  return self->_radialDistortion1;
}

- (void)setRadialDistortion1:(float)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  self->_radialDistortion1 = a3;
}

- (void)setHasRadialDistortion1:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8208;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasRadialDistortion1
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (float)radialDistortion2
{
  return self->_radialDistortion2;
}

- (void)setRadialDistortion2:(float)a3
{
  *(_WORD *)&self->_flags |= 0x2020u;
  self->_radialDistortion2 = a3;
}

- (void)setHasRadialDistortion2:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8224;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasRadialDistortion2
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8200;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readSlamPoses
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 180) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFFrameDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSlamPoses_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (unint64_t)slamPosesCount
{
  return self->_slamPoses.count;
}

- (float)slamPoses
{
  return self->_slamPoses.list;
}

- (void)clearSlamPoses
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  PBRepeatedFloatClear();
}

- (void)addSlamPose:(float)a3
{
  if (self) {
    PBRepeatedFloatAdd();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (float)slamPoseAtIndex:(unint64_t)a3
{
  -[GEOVLFFrameDetails _readSlamPoses]((uint64_t)self);
  p_slamPoses = &self->_slamPoses;
  unint64_t count = self->_slamPoses.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_slamPoses->list[a3];
}

- (void)setSlamPoses:(float *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  MEMORY[0x1F4147358](&self->_slamPoses, a3, a4);
}

- (void)_readTileId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 180) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFFrameDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
  }
}

- (BOOL)hasTileId
{
  return self->_tileId != 0;
}

- (GEOVLFUsageTileID)tileId
{
  -[GEOVLFFrameDetails _readTileId]((uint64_t)self);
  tileId = self->_tileId;

  return tileId;
}

- (void)setTileId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x3000u;
  objc_storeStrong((id *)&self->_tileId, a3);
}

- (void)_readResultPoseRotations
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 160));
    if ((*(_WORD *)(a1 + 180) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFFrameDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultPoseRotations_tags_11618);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 160));
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
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  PBRepeatedDoubleClear();
}

- (void)addResultPoseRotation:(double)a3
{
  if (self) {
    PBRepeatedDoubleAdd();
  }
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (double)resultPoseRotationAtIndex:(unint64_t)a3
{
  -[GEOVLFFrameDetails _readResultPoseRotations]((uint64_t)self);
  p_resultPoseRotations = &self->_resultPoseRotations;
  unint64_t count = self->_resultPoseRotations.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
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
  *(_WORD *)&self->_flags |= 0x200u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;

  MEMORY[0x1F4147320](&self->_resultPoseRotations, a3, a4);
}

- (double)resultTranslationX
{
  return self->_resultTranslationX;
}

- (void)setResultTranslationX:(double)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_resultTranslationX = a3;
}

- (void)setHasResultTranslationX:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
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
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_resultTranslationY = a3;
}

- (void)setHasResultTranslationY:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8194;
  }
  else {
    __int16 v3 = 0x2000;
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
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_resultTranslationZ = a3;
}

- (void)setHasResultTranslationZ:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8196;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasResultTranslationZ
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (int)resultStatus
{
  return self->_resultStatus;
}

- (void)setResultStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  self->_resultStatus = a3;
}

- (void)setHasResultStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8256;
  }
  else {
    __int16 v3 = 0x2000;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasResultStatus
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFFrameDetails;
  v4 = [(GEOVLFFrameDetails *)&v8 description];
  v5 = [(GEOVLFFrameDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFFrameDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_66;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(_WORD *)(a1 + 180) & 0x80) != 0)
  {
    objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 176)];
    if (a2) {
      objc_super v7 = @"vioStatus";
    }
    else {
      objc_super v7 = @"vio_status";
    }
    [v4 setObject:v6 forKey:v7];
  }
  if (*(void *)(a1 + 96))
  {
    objc_super v8 = PBRepeatedFloatNSArray();
    if (a2) {
      v9 = @"vioPose";
    }
    else {
      v9 = @"vio_pose";
    }
    [v4 setObject:v8 forKey:v9];
  }
  if (*(void *)(a1 + 24))
  {
    v10 = PBRepeatedFloatNSArray();
    if (a2) {
      v11 = @"calibrationMatrix";
    }
    else {
      v11 = @"calibration_matrix";
    }
    [v4 setObject:v10 forKey:v11];
  }
  __int16 v12 = *(_WORD *)(a1 + 180);
  if ((v12 & 0x10) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 164);
    v20 = [NSNumber numberWithFloat:v5];
    if (a2) {
      v21 = @"radialDistortion1";
    }
    else {
      v21 = @"radial_distortion_1";
    }
    [v4 setObject:v20 forKey:v21];

    __int16 v12 = *(_WORD *)(a1 + 180);
    if ((v12 & 0x20) == 0)
    {
LABEL_19:
      if ((v12 & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((v12 & 0x20) == 0)
  {
    goto LABEL_19;
  }
  LODWORD(v5) = *(_DWORD *)(a1 + 168);
  v22 = [NSNumber numberWithFloat:v5];
  if (a2) {
    v23 = @"radialDistortion2";
  }
  else {
    v23 = @"radial_distortion_2";
  }
  [v4 setObject:v22 forKey:v23];

  if ((*(_WORD *)(a1 + 180) & 8) != 0)
  {
LABEL_20:
    v13 = [NSNumber numberWithDouble:*(double *)(a1 + 144)];
    [v4 setObject:v13 forKey:@"timestamp"];
  }
LABEL_21:
  if (*(void *)(a1 + 72))
  {
    v14 = PBRepeatedFloatNSArray();
    if (a2) {
      v15 = @"slamPose";
    }
    else {
      v15 = @"slam_pose";
    }
    [v4 setObject:v14 forKey:v15];
  }
  v16 = [(id)a1 tileId];
  v17 = v16;
  if (v16)
  {
    if (a2)
    {
      v18 = [v16 jsonRepresentation];
      v19 = @"tileId";
    }
    else
    {
      v18 = [v16 dictionaryRepresentation];
      v19 = @"tile_id";
    }
    [v4 setObject:v18 forKey:v19];
  }
  if (*(void *)(a1 + 48))
  {
    v24 = PBRepeatedDoubleNSArray();
    if (a2) {
      v25 = @"resultPoseRotation";
    }
    else {
      v25 = @"result_pose_rotation";
    }
    [v4 setObject:v24 forKey:v25];
  }
  __int16 v26 = *(_WORD *)(a1 + 180);
  if (v26)
  {
    v27 = [NSNumber numberWithDouble:*(double *)(a1 + 112)];
    if (a2) {
      v28 = @"resultTranslationX";
    }
    else {
      v28 = @"result_translation_x";
    }
    [v4 setObject:v27 forKey:v28];

    __int16 v26 = *(_WORD *)(a1 + 180);
    if ((v26 & 2) == 0)
    {
LABEL_47:
      if ((v26 & 4) == 0) {
        goto LABEL_48;
      }
LABEL_58:
      v31 = [NSNumber numberWithDouble:*(double *)(a1 + 128)];
      if (a2) {
        v32 = @"resultTranslationZ";
      }
      else {
        v32 = @"result_translation_z";
      }
      [v4 setObject:v31 forKey:v32];

      if ((*(_WORD *)(a1 + 180) & 0x40) == 0) {
        goto LABEL_66;
      }
      goto LABEL_62;
    }
  }
  else if ((v26 & 2) == 0)
  {
    goto LABEL_47;
  }
  v29 = [NSNumber numberWithDouble:*(double *)(a1 + 120)];
  if (a2) {
    v30 = @"resultTranslationY";
  }
  else {
    v30 = @"result_translation_y";
  }
  [v4 setObject:v29 forKey:v30];

  __int16 v26 = *(_WORD *)(a1 + 180);
  if ((v26 & 4) != 0) {
    goto LABEL_58;
  }
LABEL_48:
  if ((v26 & 0x40) != 0)
  {
LABEL_62:
    v33 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 172)];
    if (a2) {
      v34 = @"resultStatus";
    }
    else {
      v34 = @"result_status";
    }
    [v4 setObject:v33 forKey:v34];
  }
LABEL_66:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFFrameDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFFrameDetails)initWithDictionary:(id)a3
{
  return (GEOVLFFrameDetails *)-[GEOVLFFrameDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"vioStatus";
      }
      else {
        objc_super v6 = @"vio_status";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setVioStatus:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"vioPose";
      }
      else {
        objc_super v8 = @"vio_pose";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v71 objects:v78 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v72;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v72 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v15 floatValue];
                objc_msgSend(a1, "addVioPose:");
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v71 objects:v78 count:16];
          }
          while (v12);
        }
      }
      if (a3) {
        v16 = @"calibrationMatrix";
      }
      else {
        v16 = @"calibration_matrix";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v67 objects:v77 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v68;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v68 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(void **)(*((void *)&v67 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v23 floatValue];
                objc_msgSend(a1, "addCalibrationMatrix:");
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v67 objects:v77 count:16];
          }
          while (v20);
        }
      }
      if (a3) {
        v24 = @"radialDistortion1";
      }
      else {
        v24 = @"radial_distortion_1";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v25 floatValue];
        objc_msgSend(a1, "setRadialDistortion1:");
      }

      if (a3) {
        __int16 v26 = @"radialDistortion2";
      }
      else {
        __int16 v26 = @"radial_distortion_2";
      }
      v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v27 floatValue];
        objc_msgSend(a1, "setRadialDistortion2:");
      }

      v28 = [v5 objectForKeyedSubscript:@"timestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v28 doubleValue];
        objc_msgSend(a1, "setTimestamp:");
      }

      if (a3) {
        v29 = @"slamPose";
      }
      else {
        v29 = @"slam_pose";
      }
      v30 = [v5 objectForKeyedSubscript:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v31 = v30;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v63 objects:v76 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v64;
          do
          {
            for (uint64_t k = 0; k != v33; ++k)
            {
              if (*(void *)v64 != v34) {
                objc_enumerationMutation(v31);
              }
              v36 = *(void **)(*((void *)&v63 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v36 floatValue];
                objc_msgSend(a1, "addSlamPose:");
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v63 objects:v76 count:16];
          }
          while (v33);
        }
      }
      if (a3) {
        v37 = @"tileId";
      }
      else {
        v37 = @"tile_id";
      }
      v38 = [v5 objectForKeyedSubscript:v37];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v39 = [GEOVLFUsageTileID alloc];
        if (a3) {
          uint64_t v40 = [(GEOVLFUsageTileID *)v39 initWithJSON:v38];
        }
        else {
          uint64_t v40 = [(GEOVLFUsageTileID *)v39 initWithDictionary:v38];
        }
        v41 = (void *)v40;
        [a1 setTileId:v40];
      }
      if (a3) {
        v42 = @"resultPoseRotation";
      }
      else {
        v42 = @"result_pose_rotation";
      }
      v43 = [v5 objectForKeyedSubscript:v42];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v44 = v43;
        uint64_t v45 = [v44 countByEnumeratingWithState:&v59 objects:v75 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v60;
          do
          {
            for (uint64_t m = 0; m != v46; ++m)
            {
              if (*(void *)v60 != v47) {
                objc_enumerationMutation(v44);
              }
              v49 = *(void **)(*((void *)&v59 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_msgSend(v49, "doubleValue", (void)v59);
                objc_msgSend(a1, "addResultPoseRotation:");
              }
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v59 objects:v75 count:16];
          }
          while (v46);
        }
      }
      if (a3) {
        v50 = @"resultTranslationX";
      }
      else {
        v50 = @"result_translation_x";
      }
      v51 = objc_msgSend(v5, "objectForKeyedSubscript:", v50, (void)v59);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v51 doubleValue];
        objc_msgSend(a1, "setResultTranslationX:");
      }

      if (a3) {
        v52 = @"resultTranslationY";
      }
      else {
        v52 = @"result_translation_y";
      }
      v53 = [v5 objectForKeyedSubscript:v52];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v53 doubleValue];
        objc_msgSend(a1, "setResultTranslationY:");
      }

      if (a3) {
        v54 = @"resultTranslationZ";
      }
      else {
        v54 = @"result_translation_z";
      }
      v55 = [v5 objectForKeyedSubscript:v54];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v55 doubleValue];
        objc_msgSend(a1, "setResultTranslationZ:");
      }

      if (a3) {
        v56 = @"resultStatus";
      }
      else {
        v56 = @"result_status";
      }
      v57 = [v5 objectForKeyedSubscript:v56];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setResultStatus:", objc_msgSend(v57, "intValue"));
      }
    }
  }

  return a1;
}

- (GEOVLFFrameDetails)initWithJSON:(id)a3
{
  return (GEOVLFFrameDetails *)-[GEOVLFFrameDetails _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_11668;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_11669;
    }
    GEOVLFFrameDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOVLFUsageTileID *)self->_tileId readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFFrameDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFFrameDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x3F00) == 0)
    {
      uint64_t v12 = self->_reader;
      objc_sync_enter(v12);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      uint64_t v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v14 writeData:v13];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v12);
      goto LABEL_36;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOVLFFrameDetails *)self readAll:0];
  if ((*(_WORD *)&self->_flags & 0x80) != 0) {
    PBDataWriterWriteUint32Field();
  }
  id v5 = v14;
  if (self->_vioPoses.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v5 = v14;
      ++v6;
    }
    while (v6 < self->_vioPoses.count);
  }
  if (self->_calibrationMatrixs.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v5 = v14;
      ++v7;
    }
    while (v7 < self->_calibrationMatrixs.count);
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    id v5 = v14;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_13:
      if ((flags & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteFloatField();
  id v5 = v14;
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
LABEL_14:
    PBDataWriterWriteDoubleField();
    id v5 = v14;
  }
LABEL_15:
  if (self->_slamPoses.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v5 = v14;
      ++v9;
    }
    while (v9 < self->_slamPoses.count);
  }
  if (self->_tileId)
  {
    PBDataWriterWriteSubmessage();
    id v5 = v14;
  }
  if (self->_resultPoseRotations.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      id v5 = v14;
      ++v10;
    }
    while (v10 < self->_resultPoseRotations.count);
  }
  __int16 v11 = (__int16)self->_flags;
  if (v11)
  {
    PBDataWriterWriteDoubleField();
    id v5 = v14;
    __int16 v11 = (__int16)self->_flags;
    if ((v11 & 2) == 0)
    {
LABEL_25:
      if ((v11 & 4) == 0) {
        goto LABEL_26;
      }
LABEL_33:
      PBDataWriterWriteDoubleField();
      id v5 = v14;
      if ((*(_WORD *)&self->_flags & 0x40) == 0) {
        goto LABEL_37;
      }
      goto LABEL_34;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteDoubleField();
  id v5 = v14;
  __int16 v11 = (__int16)self->_flags;
  if ((v11 & 4) != 0) {
    goto LABEL_33;
  }
LABEL_26:
  if ((v11 & 0x40) != 0)
  {
LABEL_34:
    PBDataWriterWriteInt32Field();
LABEL_36:
    id v5 = v14;
  }
LABEL_37:
}

- (void)copyTo:(id)a3
{
  id v18 = (id *)a3;
  [(GEOVLFFrameDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v18 + 1, self->_reader);
  *((_DWORD *)v18 + 38) = self->_readerMarkPos;
  *((_DWORD *)v18 + 39) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
    *((_DWORD *)v18 + 44) = self->_vioStatus;
    *((_WORD *)v18 + 90) |= 0x80u;
  }
  if ([(GEOVLFFrameDetails *)self vioPosesCount])
  {
    [v18 clearVioPoses];
    unint64_t v4 = [(GEOVLFFrameDetails *)self vioPosesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(GEOVLFFrameDetails *)self vioPoseAtIndex:i];
        objc_msgSend(v18, "addVioPose:");
      }
    }
  }
  if ([(GEOVLFFrameDetails *)self calibrationMatrixsCount])
  {
    [v18 clearCalibrationMatrixs];
    unint64_t v7 = [(GEOVLFFrameDetails *)self calibrationMatrixsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        [(GEOVLFFrameDetails *)self calibrationMatrixAtIndex:j];
        objc_msgSend(v18, "addCalibrationMatrix:");
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
    if ((flags & 0x20) == 0) {
      goto LABEL_13;
    }
LABEL_34:
    *((_DWORD *)v18 + 42) = LODWORD(self->_radialDistortion2);
    *((_WORD *)v18 + 90) |= 0x20u;
    if ((*(_WORD *)&self->_flags & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  *((_DWORD *)v18 + 41) = LODWORD(self->_radialDistortion1);
  *((_WORD *)v18 + 90) |= 0x10u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0) {
    goto LABEL_34;
  }
LABEL_13:
  if ((flags & 8) != 0)
  {
LABEL_14:
    v18[18] = *(id *)&self->_timestamp;
    *((_WORD *)v18 + 90) |= 8u;
  }
LABEL_15:
  if ([(GEOVLFFrameDetails *)self slamPosesCount])
  {
    [v18 clearSlamPoses];
    unint64_t v11 = [(GEOVLFFrameDetails *)self slamPosesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
      {
        [(GEOVLFFrameDetails *)self slamPoseAtIndex:k];
        objc_msgSend(v18, "addSlamPose:");
      }
    }
  }
  if (self->_tileId) {
    objc_msgSend(v18, "setTileId:");
  }
  if ([(GEOVLFFrameDetails *)self resultPoseRotationsCount])
  {
    [v18 clearResultPoseRotations];
    unint64_t v14 = [(GEOVLFFrameDetails *)self resultPoseRotationsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
      {
        [(GEOVLFFrameDetails *)self resultPoseRotationAtIndex:m];
        objc_msgSend(v18, "addResultPoseRotation:");
      }
    }
  }
  __int16 v17 = (__int16)self->_flags;
  if (v17)
  {
    v18[14] = *(id *)&self->_resultTranslationX;
    *((_WORD *)v18 + 90) |= 1u;
    __int16 v17 = (__int16)self->_flags;
    if ((v17 & 2) == 0)
    {
LABEL_27:
      if ((v17 & 4) == 0) {
        goto LABEL_28;
      }
      goto LABEL_38;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_27;
  }
  v18[15] = *(id *)&self->_resultTranslationY;
  *((_WORD *)v18 + 90) |= 2u;
  __int16 v17 = (__int16)self->_flags;
  if ((v17 & 4) == 0)
  {
LABEL_28:
    if ((v17 & 0x40) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_38:
  v18[16] = *(id *)&self->_resultTranslationZ;
  *((_WORD *)v18 + 90) |= 4u;
  if ((*(_WORD *)&self->_flags & 0x40) != 0)
  {
LABEL_29:
    *((_DWORD *)v18 + 43) = self->_resultStatus;
    *((_WORD *)v18 + 90) |= 0x40u;
  }
LABEL_30:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOVLFFrameDetails *)self readAll:0];
    if ((*(_WORD *)&self->_flags & 0x80) != 0)
    {
      *(_DWORD *)(v5 + 176) = self->_vioStatus;
      *(_WORD *)(v5 + 180) |= 0x80u;
    }
    PBRepeatedFloatCopy();
    PBRepeatedFloatCopy();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(float *)(v5 + 164) = self->_radialDistortion1;
      *(_WORD *)(v5 + 180) |= 0x10u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 0x20) == 0)
      {
LABEL_9:
        if ((flags & 8) == 0) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
    }
    else if ((flags & 0x20) == 0)
    {
      goto LABEL_9;
    }
    *(float *)(v5 + 168) = self->_radialDistortion2;
    *(_WORD *)(v5 + 180) |= 0x20u;
    if ((*(_WORD *)&self->_flags & 8) == 0)
    {
LABEL_11:
      PBRepeatedFloatCopy();
      id v10 = [(GEOVLFUsageTileID *)self->_tileId copyWithZone:a3];
      unint64_t v11 = *(void **)(v5 + 136);
      *(void *)(v5 + 136) = v10;

      PBRepeatedDoubleCopy();
      __int16 v12 = (__int16)self->_flags;
      if (v12)
      {
        *(double *)(v5 + 112) = self->_resultTranslationX;
        *(_WORD *)(v5 + 180) |= 1u;
        __int16 v12 = (__int16)self->_flags;
        if ((v12 & 2) == 0)
        {
LABEL_13:
          if ((v12 & 4) == 0) {
            goto LABEL_14;
          }
          goto LABEL_22;
        }
      }
      else if ((v12 & 2) == 0)
      {
        goto LABEL_13;
      }
      *(double *)(v5 + 120) = self->_resultTranslationY;
      *(_WORD *)(v5 + 180) |= 2u;
      __int16 v12 = (__int16)self->_flags;
      if ((v12 & 4) == 0)
      {
LABEL_14:
        if ((v12 & 0x40) == 0) {
          return (id)v5;
        }
LABEL_15:
        *(_DWORD *)(v5 + 172) = self->_resultStatus;
        *(_WORD *)(v5 + 180) |= 0x40u;
        return (id)v5;
      }
LABEL_22:
      *(double *)(v5 + 128) = self->_resultTranslationZ;
      *(_WORD *)(v5 + 180) |= 4u;
      if ((*(_WORD *)&self->_flags & 0x40) == 0) {
        return (id)v5;
      }
      goto LABEL_15;
    }
LABEL_10:
    *(double *)(v5 + 144) = self->_timestamp;
    *(_WORD *)(v5 + 180) |= 8u;
    goto LABEL_11;
  }
  unint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOVLFFrameDetailsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  [(GEOVLFFrameDetails *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 90);
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
  {
    if ((v5 & 0x80) == 0 || self->_vioStatus != *((_DWORD *)v4 + 44)) {
      goto LABEL_48;
    }
  }
  else if ((v5 & 0x80) != 0)
  {
LABEL_48:
    BOOL v11 = 0;
    goto LABEL_49;
  }
  if (!PBRepeatedFloatIsEqual() || !PBRepeatedFloatIsEqual()) {
    goto LABEL_48;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 90);
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_radialDistortion1 != *((float *)v4 + 41)) {
      goto LABEL_48;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_radialDistortion2 != *((float *)v4 + 42)) {
      goto LABEL_48;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_48;
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_timestamp != *((double *)v4 + 18)) {
      goto LABEL_48;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_48;
  }
  if (!PBRepeatedFloatIsEqual()) {
    goto LABEL_48;
  }
  tileId = self->_tileId;
  if ((unint64_t)tileId | *((void *)v4 + 17))
  {
    if (!-[GEOVLFUsageTileID isEqual:](tileId, "isEqual:")) {
      goto LABEL_48;
    }
  }
  if (!PBRepeatedDoubleIsEqual()) {
    goto LABEL_48;
  }
  __int16 v9 = (__int16)self->_flags;
  __int16 v10 = *((_WORD *)v4 + 90);
  if (v9)
  {
    if ((v10 & 1) == 0 || self->_resultTranslationX != *((double *)v4 + 14)) {
      goto LABEL_48;
    }
  }
  else if (v10)
  {
    goto LABEL_48;
  }
  if ((v9 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_resultTranslationY != *((double *)v4 + 15)) {
      goto LABEL_48;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((v9 & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_resultTranslationZ != *((double *)v4 + 16)) {
      goto LABEL_48;
    }
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_48;
  }
  if ((v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_resultStatus != *((_DWORD *)v4 + 43)) {
      goto LABEL_48;
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = (v10 & 0x40) == 0;
  }
LABEL_49:

  return v11;
}

- (unint64_t)hash
{
  [(GEOVLFFrameDetails *)self readAll:1];
  if ((*(_WORD *)&self->_flags & 0x80) != 0) {
    uint64_t v43 = 2654435761 * self->_vioStatus;
  }
  else {
    uint64_t v43 = 0;
  }
  uint64_t v42 = PBRepeatedFloatHash();
  uint64_t v41 = PBRepeatedFloatHash();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    float radialDistortion1 = self->_radialDistortion1;
    double v6 = radialDistortion1;
    if (radialDistortion1 < 0.0) {
      double v6 = -radialDistortion1;
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
  if ((flags & 0x20) != 0)
  {
    float radialDistortion2 = self->_radialDistortion2;
    double v11 = radialDistortion2;
    if (radialDistortion2 < 0.0) {
      double v11 = -radialDistortion2;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v40 = v4;
  if ((flags & 8) != 0)
  {
    double timestamp = self->_timestamp;
    double v16 = -timestamp;
    if (timestamp >= 0.0) {
      double v16 = self->_timestamp;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  uint64_t v19 = PBRepeatedFloatHash();
  unint64_t v20 = [(GEOVLFUsageTileID *)self->_tileId hash];
  uint64_t v21 = PBRepeatedDoubleHash();
  __int16 v22 = (__int16)self->_flags;
  if (v22)
  {
    double resultTranslationX = self->_resultTranslationX;
    double v25 = -resultTranslationX;
    if (resultTranslationX >= 0.0) {
      double v25 = self->_resultTranslationX;
    }
    long double v26 = floor(v25 + 0.5);
    double v27 = (v25 - v26) * 1.84467441e19;
    unint64_t v23 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0) {
        v23 += (unint64_t)v27;
      }
    }
    else
    {
      v23 -= (unint64_t)fabs(v27);
    }
  }
  else
  {
    unint64_t v23 = 0;
  }
  if ((v22 & 2) != 0)
  {
    double resultTranslationY = self->_resultTranslationY;
    double v30 = -resultTranslationY;
    if (resultTranslationY >= 0.0) {
      double v30 = self->_resultTranslationY;
    }
    long double v31 = floor(v30 + 0.5);
    double v32 = (v30 - v31) * 1.84467441e19;
    unint64_t v28 = 2654435761u * (unint64_t)fmod(v31, 1.84467441e19);
    if (v32 >= 0.0)
    {
      if (v32 > 0.0) {
        v28 += (unint64_t)v32;
      }
    }
    else
    {
      v28 -= (unint64_t)fabs(v32);
    }
  }
  else
  {
    unint64_t v28 = 0;
  }
  if ((v22 & 4) != 0)
  {
    double resultTranslationZ = self->_resultTranslationZ;
    double v35 = -resultTranslationZ;
    if (resultTranslationZ >= 0.0) {
      double v35 = self->_resultTranslationZ;
    }
    long double v36 = floor(v35 + 0.5);
    double v37 = (v35 - v36) * 1.84467441e19;
    unint64_t v33 = 2654435761u * (unint64_t)fmod(v36, 1.84467441e19);
    if (v37 >= 0.0)
    {
      if (v37 > 0.0) {
        v33 += (unint64_t)v37;
      }
    }
    else
    {
      v33 -= (unint64_t)fabs(v37);
    }
  }
  else
  {
    unint64_t v33 = 0;
  }
  if ((v22 & 0x40) != 0) {
    uint64_t v38 = 2654435761 * self->_resultStatus;
  }
  else {
    uint64_t v38 = 0;
  }
  return v42 ^ v43 ^ v41 ^ v40 ^ v9 ^ v14 ^ v19 ^ v21 ^ v20 ^ v23 ^ v28 ^ v33 ^ v38;
}

- (void)mergeFrom:(id)a3
{
  id v21 = a3;
  [v21 readAll:0];
  if ((*((_WORD *)v21 + 90) & 0x80) != 0)
  {
    self->_vioStatus = *((_DWORD *)v21 + 44);
    *(_WORD *)&self->_flags |= 0x80u;
  }
  uint64_t v4 = [v21 vioPosesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      [v21 vioPoseAtIndex:i];
      -[GEOVLFFrameDetails addVioPose:](self, "addVioPose:");
    }
  }
  uint64_t v7 = [v21 calibrationMatrixsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
    {
      [v21 calibrationMatrixAtIndex:j];
      -[GEOVLFFrameDetails addCalibrationMatrix:](self, "addCalibrationMatrix:");
    }
  }
  __int16 v10 = *((_WORD *)v21 + 90);
  if ((v10 & 0x10) != 0)
  {
    self->_float radialDistortion1 = *((float *)v21 + 41);
    *(_WORD *)&self->_flags |= 0x10u;
    __int16 v10 = *((_WORD *)v21 + 90);
    if ((v10 & 0x20) == 0)
    {
LABEL_11:
      if ((v10 & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v10 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  self->_float radialDistortion2 = *((float *)v21 + 42);
  *(_WORD *)&self->_flags |= 0x20u;
  if ((*((_WORD *)v21 + 90) & 8) != 0)
  {
LABEL_12:
    self->_double timestamp = *((double *)v21 + 18);
    *(_WORD *)&self->_flags |= 8u;
  }
LABEL_13:
  uint64_t v11 = [v21 slamPosesCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
    {
      [v21 slamPoseAtIndex:k];
      -[GEOVLFFrameDetails addSlamPose:](self, "addSlamPose:");
    }
  }
  tileId = self->_tileId;
  unint64_t v15 = v21;
  uint64_t v16 = *((void *)v21 + 17);
  if (tileId)
  {
    if (!v16) {
      goto LABEL_25;
    }
    -[GEOVLFUsageTileID mergeFrom:](tileId, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_25;
    }
    -[GEOVLFFrameDetails setTileId:](self, "setTileId:");
  }
  unint64_t v15 = v21;
LABEL_25:
  uint64_t v17 = [v15 resultPoseRotationsCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t m = 0; m != v18; ++m)
    {
      [v21 resultPoseRotationAtIndex:m];
      -[GEOVLFFrameDetails addResultPoseRotation:](self, "addResultPoseRotation:");
    }
  }
  __int16 v20 = *((_WORD *)v21 + 90);
  if (v20)
  {
    self->_double resultTranslationX = *((double *)v21 + 14);
    *(_WORD *)&self->_flags |= 1u;
    __int16 v20 = *((_WORD *)v21 + 90);
    if ((v20 & 2) == 0)
    {
LABEL_30:
      if ((v20 & 4) == 0) {
        goto LABEL_31;
      }
      goto LABEL_38;
    }
  }
  else if ((v20 & 2) == 0)
  {
    goto LABEL_30;
  }
  self->_double resultTranslationY = *((double *)v21 + 15);
  *(_WORD *)&self->_flags |= 2u;
  __int16 v20 = *((_WORD *)v21 + 90);
  if ((v20 & 4) == 0)
  {
LABEL_31:
    if ((v20 & 0x40) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_38:
  self->_double resultTranslationZ = *((double *)v21 + 16);
  *(_WORD *)&self->_flags |= 4u;
  if ((*((_WORD *)v21 + 90) & 0x40) != 0)
  {
LABEL_32:
    self->_resultStatus = *((_DWORD *)v21 + 43);
    *(_WORD *)&self->_flags |= 0x40u;
  }
LABEL_33:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileId, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end