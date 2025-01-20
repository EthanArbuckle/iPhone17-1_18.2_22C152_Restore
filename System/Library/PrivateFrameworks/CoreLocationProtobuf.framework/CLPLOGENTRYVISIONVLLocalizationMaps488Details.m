@interface CLPLOGENTRYVISIONVLLocalizationMaps488Details
- (BOOL)hasDescriptorDimension;
- (BOOL)hasNumFrames;
- (BOOL)hasNumInliers;
- (BOOL)hasNumSlamTracks;
- (BOOL)hasSlamTrackDescriptors;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)slamTrackDescriptors;
- (double)points3dAtIndex:(unint64_t)a3;
- (double)points3ds;
- (double)resultPoseRotationAtIndex:(unint64_t)a3;
- (double)resultPoseRotations;
- (double)resultPoseTranslationAtIndex:(unint64_t)a3;
- (double)resultPoseTranslations;
- (double)slamOriginAtIndex:(unint64_t)a3;
- (double)slamOrigins;
- (float)perFrameCalibrationMatrices;
- (float)perFrameCalibrationMatricesAtIndex:(unint64_t)a3;
- (float)perFrameDistortionAtIndex:(unint64_t)a3;
- (float)perFrameDistortions;
- (float)perFrameVioPoses;
- (float)perFrameVioPosesAtIndex:(unint64_t)a3;
- (float)points2dAtIndex:(unint64_t)a3;
- (float)points2ds;
- (float)slamTracks;
- (float)slamTracks2dAtIndex:(unint64_t)a3;
- (float)slamTracks2ds;
- (float)slamTracksAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)inlierIndices;
- (int)inlierIndicesAtIndex:(unint64_t)a3;
- (int)perFrameVioStatusCodes;
- (int)perFrameVioStatusCodesAtIndex:(unint64_t)a3;
- (int)slamTrackImageIndices;
- (int)slamTrackImageIndicesAtIndex:(unint64_t)a3;
- (int)slamTrackObservations;
- (int)slamTrackObservationsAtIndex:(unint64_t)a3;
- (unint64_t)descriptorDimension;
- (unint64_t)hash;
- (unint64_t)inlierIndicesCount;
- (unint64_t)numFrames;
- (unint64_t)numInliers;
- (unint64_t)numSlamTracks;
- (unint64_t)perFrameCalibrationMatricesCount;
- (unint64_t)perFrameDistortionsCount;
- (unint64_t)perFrameVioPosesCount;
- (unint64_t)perFrameVioStatusCodesCount;
- (unint64_t)points2dsCount;
- (unint64_t)points3dsCount;
- (unint64_t)resultPoseRotationsCount;
- (unint64_t)resultPoseTranslationsCount;
- (unint64_t)slamOriginsCount;
- (unint64_t)slamTrackImageIndicesCount;
- (unint64_t)slamTrackObservationsCount;
- (unint64_t)slamTracks2dsCount;
- (unint64_t)slamTracksCount;
- (void)addInlierIndices:(int)a3;
- (void)addPerFrameCalibrationMatrices:(float)a3;
- (void)addPerFrameDistortion:(float)a3;
- (void)addPerFrameVioPoses:(float)a3;
- (void)addPerFrameVioStatusCodes:(int)a3;
- (void)addPoints2d:(float)a3;
- (void)addPoints3d:(double)a3;
- (void)addResultPoseRotation:(double)a3;
- (void)addResultPoseTranslation:(double)a3;
- (void)addSlamOrigin:(double)a3;
- (void)addSlamTrackImageIndices:(int)a3;
- (void)addSlamTrackObservations:(int)a3;
- (void)addSlamTracks2d:(float)a3;
- (void)addSlamTracks:(float)a3;
- (void)clearInlierIndices;
- (void)clearPerFrameCalibrationMatrices;
- (void)clearPerFrameDistortions;
- (void)clearPerFrameVioPoses;
- (void)clearPerFrameVioStatusCodes;
- (void)clearPoints2ds;
- (void)clearPoints3ds;
- (void)clearResultPoseRotations;
- (void)clearResultPoseTranslations;
- (void)clearSlamOrigins;
- (void)clearSlamTrackImageIndices;
- (void)clearSlamTrackObservations;
- (void)clearSlamTracks;
- (void)clearSlamTracks2ds;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDescriptorDimension:(unint64_t)a3;
- (void)setHasDescriptorDimension:(BOOL)a3;
- (void)setHasNumFrames:(BOOL)a3;
- (void)setHasNumInliers:(BOOL)a3;
- (void)setHasNumSlamTracks:(BOOL)a3;
- (void)setInlierIndices:(int *)a3 count:(unint64_t)a4;
- (void)setNumFrames:(unint64_t)a3;
- (void)setNumInliers:(unint64_t)a3;
- (void)setNumSlamTracks:(unint64_t)a3;
- (void)setPerFrameCalibrationMatrices:(float *)a3 count:(unint64_t)a4;
- (void)setPerFrameDistortions:(float *)a3 count:(unint64_t)a4;
- (void)setPerFrameVioPoses:(float *)a3 count:(unint64_t)a4;
- (void)setPerFrameVioStatusCodes:(int *)a3 count:(unint64_t)a4;
- (void)setPoints2ds:(float *)a3 count:(unint64_t)a4;
- (void)setPoints3ds:(double *)a3 count:(unint64_t)a4;
- (void)setResultPoseRotations:(double *)a3 count:(unint64_t)a4;
- (void)setResultPoseTranslations:(double *)a3 count:(unint64_t)a4;
- (void)setSlamOrigins:(double *)a3 count:(unint64_t)a4;
- (void)setSlamTrackDescriptors:(id)a3;
- (void)setSlamTrackImageIndices:(int *)a3 count:(unint64_t)a4;
- (void)setSlamTrackObservations:(int *)a3 count:(unint64_t)a4;
- (void)setSlamTracks2ds:(float *)a3 count:(unint64_t)a4;
- (void)setSlamTracks:(float *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation CLPLOGENTRYVISIONVLLocalizationMaps488Details

- (void)dealloc
{
  PBRepeatedFloatClear();
  PBRepeatedDoubleClear();
  PBRepeatedInt32Clear();
  PBRepeatedDoubleClear();
  PBRepeatedFloatClear();
  PBRepeatedInt32Clear();
  PBRepeatedFloatClear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedDoubleClear();
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)CLPLOGENTRYVISIONVLLocalizationMaps488Details;
  [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)&v3 dealloc];
}

- (void)setNumInliers:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numInliers = a3;
}

- (void)setHasNumInliers:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumInliers
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (unint64_t)points2dsCount
{
  return self->_points2ds.count;
}

- (float)points2ds
{
  return self->_points2ds.list;
}

- (void)clearPoints2ds
{
}

- (void)addPoints2d:(float)a3
{
}

- (float)points2dAtIndex:(unint64_t)a3
{
  p_points2ds = &self->_points2ds;
  unint64_t count = self->_points2ds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_points2ds->list[a3];
}

- (void)setPoints2ds:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)points3dsCount
{
  return self->_points3ds.count;
}

- (double)points3ds
{
  return self->_points3ds.list;
}

- (void)clearPoints3ds
{
}

- (void)addPoints3d:(double)a3
{
}

- (double)points3dAtIndex:(unint64_t)a3
{
  p_points3ds = &self->_points3ds;
  unint64_t count = self->_points3ds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_points3ds->list[a3];
}

- (void)setPoints3ds:(double *)a3 count:(unint64_t)a4
{
}

- (unint64_t)inlierIndicesCount
{
  return self->_inlierIndices.count;
}

- (int)inlierIndices
{
  return self->_inlierIndices.list;
}

- (void)clearInlierIndices
{
}

- (void)addInlierIndices:(int)a3
{
}

- (int)inlierIndicesAtIndex:(unint64_t)a3
{
  p_inlierIndices = &self->_inlierIndices;
  unint64_t count = self->_inlierIndices.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_inlierIndices->list[a3];
}

- (void)setInlierIndices:(int *)a3 count:(unint64_t)a4
{
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
}

- (void)addSlamOrigin:(double)a3
{
}

- (double)slamOriginAtIndex:(unint64_t)a3
{
  p_slamOrigins = &self->_slamOrigins;
  unint64_t count = self->_slamOrigins.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_slamOrigins->list[a3];
}

- (void)setSlamOrigins:(double *)a3 count:(unint64_t)a4
{
}

- (void)setNumSlamTracks:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numSlamTracks = a3;
}

- (void)setHasNumSlamTracks:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumSlamTracks
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (unint64_t)slamTracksCount
{
  return self->_slamTracks.count;
}

- (float)slamTracks
{
  return self->_slamTracks.list;
}

- (void)clearSlamTracks
{
}

- (void)addSlamTracks:(float)a3
{
}

- (float)slamTracksAtIndex:(unint64_t)a3
{
  p_slamTracks = &self->_slamTracks;
  unint64_t count = self->_slamTracks.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_slamTracks->list[a3];
}

- (void)setSlamTracks:(float *)a3 count:(unint64_t)a4
{
}

- (void)setDescriptorDimension:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_descriptorDimension = a3;
}

- (void)setHasDescriptorDimension:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDescriptorDimension
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSlamTrackDescriptors
{
  return self->_slamTrackDescriptors != 0;
}

- (unint64_t)slamTrackObservationsCount
{
  return self->_slamTrackObservations.count;
}

- (int)slamTrackObservations
{
  return self->_slamTrackObservations.list;
}

- (void)clearSlamTrackObservations
{
}

- (void)addSlamTrackObservations:(int)a3
{
}

- (int)slamTrackObservationsAtIndex:(unint64_t)a3
{
  p_slamTrackObservations = &self->_slamTrackObservations;
  unint64_t count = self->_slamTrackObservations.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_slamTrackObservations->list[a3];
}

- (void)setSlamTrackObservations:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)slamTracks2dsCount
{
  return self->_slamTracks2ds.count;
}

- (float)slamTracks2ds
{
  return self->_slamTracks2ds.list;
}

- (void)clearSlamTracks2ds
{
}

- (void)addSlamTracks2d:(float)a3
{
}

- (float)slamTracks2dAtIndex:(unint64_t)a3
{
  p_slamTracks2ds = &self->_slamTracks2ds;
  unint64_t count = self->_slamTracks2ds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_slamTracks2ds->list[a3];
}

- (void)setSlamTracks2ds:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)slamTrackImageIndicesCount
{
  return self->_slamTrackImageIndices.count;
}

- (int)slamTrackImageIndices
{
  return self->_slamTrackImageIndices.list;
}

- (void)clearSlamTrackImageIndices
{
}

- (void)addSlamTrackImageIndices:(int)a3
{
}

- (int)slamTrackImageIndicesAtIndex:(unint64_t)a3
{
  p_slamTrackImageIndices = &self->_slamTrackImageIndices;
  unint64_t count = self->_slamTrackImageIndices.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_slamTrackImageIndices->list[a3];
}

- (void)setSlamTrackImageIndices:(int *)a3 count:(unint64_t)a4
{
}

- (void)setNumFrames:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numFrames = a3;
}

- (void)setHasNumFrames:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumFrames
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)perFrameVioStatusCodesCount
{
  return self->_perFrameVioStatusCodes.count;
}

- (int)perFrameVioStatusCodes
{
  return self->_perFrameVioStatusCodes.list;
}

- (void)clearPerFrameVioStatusCodes
{
}

- (void)addPerFrameVioStatusCodes:(int)a3
{
}

- (int)perFrameVioStatusCodesAtIndex:(unint64_t)a3
{
  p_perFrameVioStatusCodes = &self->_perFrameVioStatusCodes;
  unint64_t count = self->_perFrameVioStatusCodes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_perFrameVioStatusCodes->list[a3];
}

- (void)setPerFrameVioStatusCodes:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)perFrameVioPosesCount
{
  return self->_perFrameVioPoses.count;
}

- (float)perFrameVioPoses
{
  return self->_perFrameVioPoses.list;
}

- (void)clearPerFrameVioPoses
{
}

- (void)addPerFrameVioPoses:(float)a3
{
}

- (float)perFrameVioPosesAtIndex:(unint64_t)a3
{
  p_perFrameVioPoses = &self->_perFrameVioPoses;
  unint64_t count = self->_perFrameVioPoses.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_perFrameVioPoses->list[a3];
}

- (void)setPerFrameVioPoses:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)perFrameCalibrationMatricesCount
{
  return self->_perFrameCalibrationMatrices.count;
}

- (float)perFrameCalibrationMatrices
{
  return self->_perFrameCalibrationMatrices.list;
}

- (void)clearPerFrameCalibrationMatrices
{
}

- (void)addPerFrameCalibrationMatrices:(float)a3
{
}

- (float)perFrameCalibrationMatricesAtIndex:(unint64_t)a3
{
  p_perFrameCalibrationMatrices = &self->_perFrameCalibrationMatrices;
  unint64_t count = self->_perFrameCalibrationMatrices.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_perFrameCalibrationMatrices->list[a3];
}

- (void)setPerFrameCalibrationMatrices:(float *)a3 count:(unint64_t)a4
{
}

- (unint64_t)perFrameDistortionsCount
{
  return self->_perFrameDistortions.count;
}

- (float)perFrameDistortions
{
  return self->_perFrameDistortions.list;
}

- (void)clearPerFrameDistortions
{
}

- (void)addPerFrameDistortion:(float)a3
{
}

- (float)perFrameDistortionAtIndex:(unint64_t)a3
{
  p_perFrameDistortions = &self->_perFrameDistortions;
  unint64_t count = self->_perFrameDistortions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_perFrameDistortions->list[a3];
}

- (void)setPerFrameDistortions:(float *)a3 count:(unint64_t)a4
{
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
}

- (void)addResultPoseRotation:(double)a3
{
}

- (double)resultPoseRotationAtIndex:(unint64_t)a3
{
  p_resultPoseRotations = &self->_resultPoseRotations;
  unint64_t count = self->_resultPoseRotations.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_resultPoseRotations->list[a3];
}

- (void)setResultPoseRotations:(double *)a3 count:(unint64_t)a4
{
}

- (unint64_t)resultPoseTranslationsCount
{
  return self->_resultPoseTranslations.count;
}

- (double)resultPoseTranslations
{
  return self->_resultPoseTranslations.list;
}

- (void)clearResultPoseTranslations
{
}

- (void)addResultPoseTranslation:(double)a3
{
}

- (double)resultPoseTranslationAtIndex:(unint64_t)a3
{
  p_resultPoseTranslations = &self->_resultPoseTranslations;
  unint64_t count = self->_resultPoseTranslations.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_resultPoseTranslations->list[a3];
}

- (void)setResultPoseTranslations:(double *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPLOGENTRYVISIONVLLocalizationMaps488Details;
  v4 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)&v8 description];
  v5 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_numInliers];
    [v3 setObject:v4 forKey:@"num_inliers"];
  }
  v5 = PBRepeatedFloatNSArray();
  [v3 setObject:v5 forKey:@"points2d"];

  v6 = PBRepeatedDoubleNSArray();
  [v3 setObject:v6 forKey:@"points3d"];

  uint64_t v7 = PBRepeatedInt32NSArray();
  [v3 setObject:v7 forKey:@"inlier_indices"];

  objc_super v8 = PBRepeatedDoubleNSArray();
  [v3 setObject:v8 forKey:@"slam_origin"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:self->_numSlamTracks];
    [v3 setObject:v9 forKey:@"num_slam_tracks"];
  }
  v10 = PBRepeatedFloatNSArray();
  [v3 setObject:v10 forKey:@"slam_tracks"];

  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithUnsignedLongLong:self->_descriptorDimension];
    [v3 setObject:v11 forKey:@"descriptor_dimension"];
  }
  slamTrackDescriptors = self->_slamTrackDescriptors;
  if (slamTrackDescriptors) {
    [v3 setObject:slamTrackDescriptors forKey:@"slam_track_descriptors"];
  }
  v13 = PBRepeatedInt32NSArray();
  [v3 setObject:v13 forKey:@"slam_track_observations"];

  v14 = PBRepeatedFloatNSArray();
  [v3 setObject:v14 forKey:@"slam_tracks2d"];

  v15 = PBRepeatedInt32NSArray();
  [v3 setObject:v15 forKey:@"slam_track_image_indices"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v16 = [NSNumber numberWithUnsignedLongLong:self->_numFrames];
    [v3 setObject:v16 forKey:@"num_frames"];
  }
  v17 = PBRepeatedInt32NSArray();
  [v3 setObject:v17 forKey:@"per_frame_vio_status_codes"];

  v18 = PBRepeatedFloatNSArray();
  [v3 setObject:v18 forKey:@"per_frame_vio_poses"];

  v19 = PBRepeatedFloatNSArray();
  [v3 setObject:v19 forKey:@"per_frame_calibration_matrices"];

  v20 = PBRepeatedFloatNSArray();
  [v3 setObject:v20 forKey:@"per_frame_distortion"];

  v21 = PBRepeatedDoubleNSArray();
  [v3 setObject:v21 forKey:@"result_pose_rotation"];

  v22 = PBRepeatedDoubleNSArray();
  [v3 setObject:v22 forKey:@"result_pose_translation"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONVLLocalizationMaps488DetailsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v20 = v4;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v20;
  }
  if (self->_points2ds.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v20;
      ++v5;
    }
    while (v5 < self->_points2ds.count);
  }
  if (self->_points3ds.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      id v4 = v20;
      ++v6;
    }
    while (v6 < self->_points3ds.count);
  }
  if (self->_inlierIndices.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v20;
      ++v7;
    }
    while (v7 < self->_inlierIndices.count);
  }
  if (self->_slamOrigins.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      id v4 = v20;
      ++v8;
    }
    while (v8 < self->_slamOrigins.count);
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v20;
  }
  if (self->_slamTracks.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v20;
      ++v9;
    }
    while (v9 < self->_slamTracks.count);
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v20;
  }
  if (self->_slamTrackDescriptors)
  {
    PBDataWriterWriteDataField();
    id v4 = v20;
  }
  if (self->_slamTrackObservations.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v20;
      ++v10;
    }
    while (v10 < self->_slamTrackObservations.count);
  }
  if (self->_slamTracks2ds.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v20;
      ++v11;
    }
    while (v11 < self->_slamTracks2ds.count);
  }
  if (self->_slamTrackImageIndices.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v20;
      ++v12;
    }
    while (v12 < self->_slamTrackImageIndices.count);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v20;
  }
  if (self->_perFrameVioStatusCodes.count)
  {
    unint64_t v13 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v20;
      ++v13;
    }
    while (v13 < self->_perFrameVioStatusCodes.count);
  }
  if (self->_perFrameVioPoses.count)
  {
    unint64_t v14 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v20;
      ++v14;
    }
    while (v14 < self->_perFrameVioPoses.count);
  }
  if (self->_perFrameCalibrationMatrices.count)
  {
    unint64_t v15 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v20;
      ++v15;
    }
    while (v15 < self->_perFrameCalibrationMatrices.count);
  }
  if (self->_perFrameDistortions.count)
  {
    unint64_t v16 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v20;
      ++v16;
    }
    while (v16 < self->_perFrameDistortions.count);
  }
  if (self->_resultPoseRotations.count)
  {
    unint64_t v17 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      id v4 = v20;
      ++v17;
    }
    while (v17 < self->_resultPoseRotations.count);
  }
  p_resultPoseTranslations = &self->_resultPoseTranslations;
  if (p_resultPoseTranslations->count)
  {
    unint64_t v19 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      id v4 = v20;
      ++v19;
    }
    while (v19 < p_resultPoseTranslations->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[45] = self->_numInliers;
    *((unsigned char *)v4 + 384) |= 4u;
  }
  id v47 = v4;
  if ([(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self points2dsCount])
  {
    [v47 clearPoints2ds];
    unint64_t v5 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self points2dsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self points2dAtIndex:i];
        objc_msgSend(v47, "addPoints2d:");
      }
    }
  }
  if ([(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self points3dsCount])
  {
    [v47 clearPoints3ds];
    unint64_t v8 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self points3dsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self points3dAtIndex:j];
        objc_msgSend(v47, "addPoints3d:");
      }
    }
  }
  if ([(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self inlierIndicesCount])
  {
    [v47 clearInlierIndices];
    unint64_t v11 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self inlierIndicesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        objc_msgSend(v47, "addInlierIndices:", -[CLPLOGENTRYVISIONVLLocalizationMaps488Details inlierIndicesAtIndex:](self, "inlierIndicesAtIndex:", k));
    }
  }
  if ([(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self slamOriginsCount])
  {
    [v47 clearSlamOrigins];
    unint64_t v14 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self slamOriginsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
      {
        [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self slamOriginAtIndex:m];
        objc_msgSend(v47, "addSlamOrigin:");
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((void *)v47 + 46) = self->_numSlamTracks;
    *((unsigned char *)v47 + 384) |= 8u;
  }
  if ([(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self slamTracksCount])
  {
    [v47 clearSlamTracks];
    unint64_t v17 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self slamTracksCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
      {
        [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self slamTracksAtIndex:n];
        objc_msgSend(v47, "addSlamTracks:");
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v47 + 43) = self->_descriptorDimension;
    *((unsigned char *)v47 + 384) |= 1u;
  }
  if (self->_slamTrackDescriptors) {
    objc_msgSend(v47, "setSlamTrackDescriptors:");
  }
  if ([(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self slamTrackObservationsCount])
  {
    [v47 clearSlamTrackObservations];
    unint64_t v20 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self slamTrackObservationsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (iuint64_t i = 0; ii != v21; ++ii)
        objc_msgSend(v47, "addSlamTrackObservations:", -[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamTrackObservationsAtIndex:](self, "slamTrackObservationsAtIndex:", ii));
    }
  }
  if ([(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self slamTracks2dsCount])
  {
    [v47 clearSlamTracks2ds];
    unint64_t v23 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self slamTracks2dsCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (juint64_t j = 0; jj != v24; ++jj)
      {
        [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self slamTracks2dAtIndex:jj];
        objc_msgSend(v47, "addSlamTracks2d:");
      }
    }
  }
  if ([(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self slamTrackImageIndicesCount])
  {
    [v47 clearSlamTrackImageIndices];
    unint64_t v26 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self slamTrackImageIndicesCount];
    if (v26)
    {
      unint64_t v27 = v26;
      for (kuint64_t k = 0; kk != v27; ++kk)
        objc_msgSend(v47, "addSlamTrackImageIndices:", -[CLPLOGENTRYVISIONVLLocalizationMaps488Details slamTrackImageIndicesAtIndex:](self, "slamTrackImageIndicesAtIndex:", kk));
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v47 + 44) = self->_numFrames;
    *((unsigned char *)v47 + 384) |= 2u;
  }
  if ([(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self perFrameVioStatusCodesCount])
  {
    [v47 clearPerFrameVioStatusCodes];
    unint64_t v29 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self perFrameVioStatusCodesCount];
    if (v29)
    {
      unint64_t v30 = v29;
      for (muint64_t m = 0; mm != v30; ++mm)
        objc_msgSend(v47, "addPerFrameVioStatusCodes:", -[CLPLOGENTRYVISIONVLLocalizationMaps488Details perFrameVioStatusCodesAtIndex:](self, "perFrameVioStatusCodesAtIndex:", mm));
    }
  }
  if ([(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self perFrameVioPosesCount])
  {
    [v47 clearPerFrameVioPoses];
    unint64_t v32 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self perFrameVioPosesCount];
    if (v32)
    {
      unint64_t v33 = v32;
      for (nuint64_t n = 0; nn != v33; ++nn)
      {
        [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self perFrameVioPosesAtIndex:nn];
        objc_msgSend(v47, "addPerFrameVioPoses:");
      }
    }
  }
  if ([(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self perFrameCalibrationMatricesCount])
  {
    [v47 clearPerFrameCalibrationMatrices];
    unint64_t v35 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self perFrameCalibrationMatricesCount];
    if (v35)
    {
      unint64_t v36 = v35;
      for (uint64_t i1 = 0; i1 != v36; ++i1)
      {
        [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self perFrameCalibrationMatricesAtIndex:i1];
        objc_msgSend(v47, "addPerFrameCalibrationMatrices:");
      }
    }
  }
  if ([(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self perFrameDistortionsCount])
  {
    [v47 clearPerFrameDistortions];
    unint64_t v38 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self perFrameDistortionsCount];
    if (v38)
    {
      unint64_t v39 = v38;
      for (uint64_t i2 = 0; i2 != v39; ++i2)
      {
        [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self perFrameDistortionAtIndex:i2];
        objc_msgSend(v47, "addPerFrameDistortion:");
      }
    }
  }
  if ([(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self resultPoseRotationsCount])
  {
    [v47 clearResultPoseRotations];
    unint64_t v41 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self resultPoseRotationsCount];
    if (v41)
    {
      unint64_t v42 = v41;
      for (uint64_t i3 = 0; i3 != v42; ++i3)
      {
        [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self resultPoseRotationAtIndex:i3];
        objc_msgSend(v47, "addResultPoseRotation:");
      }
    }
  }
  if ([(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self resultPoseTranslationsCount])
  {
    [v47 clearResultPoseTranslations];
    unint64_t v44 = [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self resultPoseTranslationsCount];
    if (v44)
    {
      unint64_t v45 = v44;
      for (uint64_t i4 = 0; i4 != v45; ++i4)
      {
        [(CLPLOGENTRYVISIONVLLocalizationMaps488Details *)self resultPoseTranslationAtIndex:i4];
        objc_msgSend(v47, "addResultPoseTranslation:");
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 360) = self->_numInliers;
    *(unsigned char *)(v5 + 384) |= 4u;
  }
  PBRepeatedFloatCopy();
  PBRepeatedDoubleCopy();
  PBRepeatedInt32Copy();
  PBRepeatedDoubleCopy();
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(void *)(v6 + 368) = self->_numSlamTracks;
    *(unsigned char *)(v6 + 384) |= 8u;
  }
  PBRepeatedFloatCopy();
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 344) = self->_descriptorDimension;
    *(unsigned char *)(v6 + 384) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_slamTrackDescriptors copyWithZone:a3];
  unint64_t v8 = *(void **)(v6 + 376);
  *(void *)(v6 + 376) = v7;

  PBRepeatedInt32Copy();
  PBRepeatedFloatCopy();
  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v6 + 352) = self->_numFrames;
    *(unsigned char *)(v6 + 384) |= 2u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedDoubleCopy();
  PBRepeatedDoubleCopy();
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 384) & 4) == 0 || self->_numInliers != *((void *)v4 + 45)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 384) & 4) != 0)
  {
    goto LABEL_38;
  }
  if (!PBRepeatedFloatIsEqual()
    || !PBRepeatedDoubleIsEqual()
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedDoubleIsEqual())
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 384) & 8) == 0 || self->_numSlamTracks != *((void *)v4 + 46)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 384) & 8) != 0)
  {
    goto LABEL_38;
  }
  if (!PBRepeatedFloatIsEqual())
  {
LABEL_38:
    char IsEqual = 0;
    goto LABEL_39;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 384) & 1) == 0 || self->_descriptorDimension != *((void *)v4 + 43)) {
      goto LABEL_38;
    }
  }
  else if (*((unsigned char *)v4 + 384))
  {
    goto LABEL_38;
  }
  slamTrackDescriptors = self->_slamTrackDescriptors;
  if ((unint64_t)slamTrackDescriptors | *((void *)v4 + 47)
    && !-[NSData isEqual:](slamTrackDescriptors, "isEqual:")
    || !PBRepeatedInt32IsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 384) & 2) == 0 || self->_numFrames != *((void *)v4 + 44)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 384) & 2) != 0)
  {
    goto LABEL_38;
  }
  if (!PBRepeatedInt32IsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedDoubleIsEqual())
  {
    goto LABEL_38;
  }
  char IsEqual = PBRepeatedDoubleIsEqual();
LABEL_39:

  return IsEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    unint64_t v23 = 2654435761u * self->_numInliers;
  }
  else {
    unint64_t v23 = 0;
  }
  uint64_t v22 = PBRepeatedFloatHash();
  uint64_t v21 = PBRepeatedDoubleHash();
  uint64_t v19 = PBRepeatedInt32Hash();
  uint64_t v3 = PBRepeatedDoubleHash();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    unint64_t v4 = 2654435761u * self->_numSlamTracks;
  }
  else {
    unint64_t v4 = 0;
  }
  uint64_t v5 = PBRepeatedFloatHash();
  if (*(unsigned char *)&self->_has) {
    unint64_t v6 = 2654435761u * self->_descriptorDimension;
  }
  else {
    unint64_t v6 = 0;
  }
  uint64_t v7 = [(NSData *)self->_slamTrackDescriptors hash];
  uint64_t v8 = PBRepeatedInt32Hash();
  uint64_t v9 = PBRepeatedFloatHash();
  uint64_t v10 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v11 = 2654435761u * self->_numFrames;
  }
  else {
    unint64_t v11 = 0;
  }
  unint64_t v12 = v22 ^ v23 ^ v21 ^ v20 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7;
  uint64_t v13 = v8 ^ v9 ^ v10 ^ v11 ^ PBRepeatedInt32Hash();
  uint64_t v14 = v12 ^ v13 ^ PBRepeatedFloatHash();
  uint64_t v15 = PBRepeatedFloatHash();
  uint64_t v16 = v15 ^ PBRepeatedFloatHash();
  uint64_t v17 = v16 ^ PBRepeatedDoubleHash();
  return v14 ^ v17 ^ PBRepeatedDoubleHash();
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  if ((v4[48] & 4) != 0)
  {
    self->_numInliers = v4[45];
    *(unsigned char *)&self->_has |= 4u;
  }
  v48 = v4;
  uint64_t v5 = [v4 points2dsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      [v48 points2dAtIndex:i];
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addPoints2d:](self, "addPoints2d:");
    }
  }
  uint64_t v8 = [v48 points3dsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
    {
      [v48 points3dAtIndex:j];
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addPoints3d:](self, "addPoints3d:");
    }
  }
  uint64_t v11 = [v48 inlierIndicesCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addInlierIndices:](self, "addInlierIndices:", [v48 inlierIndicesAtIndex:k]);
  }
  uint64_t v14 = [v48 slamOriginsCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t m = 0; m != v15; ++m)
    {
      [v48 slamOriginAtIndex:m];
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addSlamOrigin:](self, "addSlamOrigin:");
    }
  }
  if ((v48[48] & 8) != 0)
  {
    self->_numSlamTracks = v48[46];
    *(unsigned char *)&self->_has |= 8u;
  }
  uint64_t v17 = [v48 slamTracksCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t n = 0; n != v18; ++n)
    {
      [v48 slamTracksAtIndex:n];
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addSlamTracks:](self, "addSlamTracks:");
    }
  }
  uint64_t v20 = v48;
  if (v48[48])
  {
    self->_descriptorDimensiouint64_t n = v48[43];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v48[47])
  {
    -[CLPLOGENTRYVISIONVLLocalizationMaps488Details setSlamTrackDescriptors:](self, "setSlamTrackDescriptors:");
    uint64_t v20 = v48;
  }
  uint64_t v21 = [v20 slamTrackObservationsCount];
  if (v21)
  {
    uint64_t v22 = v21;
    for (iuint64_t i = 0; ii != v22; ++ii)
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addSlamTrackObservations:](self, "addSlamTrackObservations:", [v48 slamTrackObservationsAtIndex:ii]);
  }
  uint64_t v24 = [v48 slamTracks2dsCount];
  if (v24)
  {
    uint64_t v25 = v24;
    for (juint64_t j = 0; jj != v25; ++jj)
    {
      [v48 slamTracks2dAtIndex:jj];
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addSlamTracks2d:](self, "addSlamTracks2d:");
    }
  }
  uint64_t v27 = [v48 slamTrackImageIndicesCount];
  if (v27)
  {
    uint64_t v28 = v27;
    for (kuint64_t k = 0; kk != v28; ++kk)
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addSlamTrackImageIndices:](self, "addSlamTrackImageIndices:", [v48 slamTrackImageIndicesAtIndex:kk]);
  }
  if ((v48[48] & 2) != 0)
  {
    self->_numFrames = v48[44];
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v30 = [v48 perFrameVioStatusCodesCount];
  if (v30)
  {
    uint64_t v31 = v30;
    for (muint64_t m = 0; mm != v31; ++mm)
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addPerFrameVioStatusCodes:](self, "addPerFrameVioStatusCodes:", [v48 perFrameVioStatusCodesAtIndex:mm]);
  }
  uint64_t v33 = [v48 perFrameVioPosesCount];
  if (v33)
  {
    uint64_t v34 = v33;
    for (nuint64_t n = 0; nn != v34; ++nn)
    {
      [v48 perFrameVioPosesAtIndex:nn];
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addPerFrameVioPoses:](self, "addPerFrameVioPoses:");
    }
  }
  uint64_t v36 = [v48 perFrameCalibrationMatricesCount];
  if (v36)
  {
    uint64_t v37 = v36;
    for (uint64_t i1 = 0; i1 != v37; ++i1)
    {
      [v48 perFrameCalibrationMatricesAtIndex:i1];
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addPerFrameCalibrationMatrices:](self, "addPerFrameCalibrationMatrices:");
    }
  }
  uint64_t v39 = [v48 perFrameDistortionsCount];
  if (v39)
  {
    uint64_t v40 = v39;
    for (uint64_t i2 = 0; i2 != v40; ++i2)
    {
      [v48 perFrameDistortionAtIndex:i2];
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addPerFrameDistortion:](self, "addPerFrameDistortion:");
    }
  }
  uint64_t v42 = [v48 resultPoseRotationsCount];
  if (v42)
  {
    uint64_t v43 = v42;
    for (uint64_t i3 = 0; i3 != v43; ++i3)
    {
      [v48 resultPoseRotationAtIndex:i3];
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addResultPoseRotation:](self, "addResultPoseRotation:");
    }
  }
  uint64_t v45 = [v48 resultPoseTranslationsCount];
  if (v45)
  {
    uint64_t v46 = v45;
    for (uint64_t i4 = 0; i4 != v46; ++i4)
    {
      [v48 resultPoseTranslationAtIndex:i4];
      -[CLPLOGENTRYVISIONVLLocalizationMaps488Details addResultPoseTranslation:](self, "addResultPoseTranslation:");
    }
  }
}

- (unint64_t)numInliers
{
  return self->_numInliers;
}

- (unint64_t)numSlamTracks
{
  return self->_numSlamTracks;
}

- (unint64_t)descriptorDimension
{
  return self->_descriptorDimension;
}

- (NSData)slamTrackDescriptors
{
  return self->_slamTrackDescriptors;
}

- (void)setSlamTrackDescriptors:(id)a3
{
}

- (unint64_t)numFrames
{
  return self->_numFrames;
}

- (void).cxx_destruct
{
}

@end