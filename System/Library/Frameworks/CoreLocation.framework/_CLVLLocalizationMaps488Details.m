@interface _CLVLLocalizationMaps488Details
+ (BOOL)supportsSecureCoding;
- (BOOL)setFrameCount:(unint64_t)a3 perFrameVioStatusCodes:(const int *)a4 perFrameVioPoses:(const float *)a5 perFrameCalibrationMatrices:(const float *)a6 perFrameDistortion:(const float *)a7;
- (BOOL)setInliersCount:(unint64_t)a3 points2D:(const float *)a4 points3D:(const double *)a5 inlierIndices:(const int *)a6;
- (BOOL)setSlamTracksCount:(unint64_t)a3 slamTracks:(const float *)a4 descriptorDimension:(unint64_t)a5 slamTrackDescriptors:(const char *)a6 slamTrackObservations:(const signed __int16 *)a7 slamTracks2D:(const float *)a8 slamTrackImageIndices:(const signed __int16 *)a9;
- (_CLVLLocalizationMaps488Details)initWithCoder:(id)a3;
- (char)slamTrackDescriptors;
- (double)points3D;
- (double)resultPoseRotation;
- (double)resultPoseTranslation;
- (double)slamOrigin;
- (float)perFrameCalibrationMatrices;
- (float)perFrameDistortion;
- (float)perFrameVioPoses;
- (float)points2D;
- (float)slamTracks;
- (float)slamTracks2D;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4;
- (int)inlierIndices;
- (int)perFrameVioStatusCodes;
- (signed)slamTrackImageIndices;
- (signed)slamTrackObservations;
- (unint64_t)descriptorDimension;
- (unint64_t)frameCount;
- (unint64_t)inliersCount;
- (unint64_t)slamTracksCount;
- (unint64_t)totalObservationsCount;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)resetFrames;
- (void)resetInliers;
- (void)resetSlamTracks;
- (void)setResultPoseRotation:(const double *)a3;
- (void)setResultPoseTranslation:(const double *)a3;
- (void)setSlamOrigin:(const double *)a3;
@end

@implementation _CLVLLocalizationMaps488Details

- (void)dealloc
{
  [(_CLVLLocalizationMaps488Details *)self resetInliers];
  [(_CLVLLocalizationMaps488Details *)self resetSlamTracks];
  [(_CLVLLocalizationMaps488Details *)self resetFrames];
  v3.receiver = self;
  v3.super_class = (Class)_CLVLLocalizationMaps488Details;
  [(_CLVLLocalizationMaps488Details *)&v3 dealloc];
}

- (void)resetInliers
{
  points2D = self->_points2D;
  if (points2D)
  {
    free(points2D);
    self->_points2D = 0;
  }
  points3D = self->_points3D;
  if (points3D)
  {
    free(points3D);
    self->_points3D = 0;
  }
  inlierIndices = self->_inlierIndices;
  if (inlierIndices)
  {
    free(inlierIndices);
    self->_inlierIndices = 0;
  }
  self->_inliersCount = 0;
}

- (void)resetSlamTracks
{
  slamTracks = self->_slamTracks;
  if (slamTracks)
  {
    free(slamTracks);
    self->_slamTracks = 0;
  }
  slamTrackDescriptors = self->_slamTrackDescriptors;
  if (slamTrackDescriptors)
  {
    free(slamTrackDescriptors);
    self->_slamTrackDescriptors = 0;
  }
  slamTrackObservations = self->_slamTrackObservations;
  if (slamTrackObservations)
  {
    free(slamTrackObservations);
    self->_slamTrackObservations = 0;
  }
  slamTracks2D = self->_slamTracks2D;
  if (slamTracks2D)
  {
    free(slamTracks2D);
    self->_slamTracks2D = 0;
  }
  slamTrackImageIndices = self->_slamTrackImageIndices;
  if (slamTrackImageIndices)
  {
    free(slamTrackImageIndices);
    self->_slamTrackImageIndices = 0;
  }
  self->_slamTracksCount = 0;
  self->_descriptorDimension = 0;
  self->_totalObservationsCount = 0;
}

- (void)resetFrames
{
  perFrameVioStatusCodes = self->_perFrameVioStatusCodes;
  if (perFrameVioStatusCodes)
  {
    free(perFrameVioStatusCodes);
    self->_perFrameVioStatusCodes = 0;
  }
  perFrameVioPoses = self->_perFrameVioPoses;
  if (perFrameVioPoses)
  {
    free(perFrameVioPoses);
    self->_perFrameVioPoses = 0;
  }
  perFrameCalibrationMatrices = self->_perFrameCalibrationMatrices;
  if (perFrameCalibrationMatrices)
  {
    free(perFrameCalibrationMatrices);
    self->_perFrameCalibrationMatrices = 0;
  }
  perFrameDistortion = self->_perFrameDistortion;
  if (perFrameDistortion)
  {
    free(perFrameDistortion);
    self->_perFrameDistortion = 0;
  }
  self->_frameCount = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (([(id)v4 setInliersCount:self->_inliersCount points2D:self->_points2D points3D:self->_points3D inlierIndices:self->_inlierIndices] & 1) != 0&& (long long v5 = *(_OWORD *)self->_slamOrigin, v6 = *(_OWORD *)&self->_slamOrigin[2], *(_OWORD *)(v4 + 40) = *(_OWORD *)&self->_slamOrigin[4], *(_OWORD *)(v4 + 24) = v6, *(_OWORD *)(v4 + 8) = v5, (objc_msgSend((id)v4, "setSlamTracksCount:slamTracks:descriptorDimension:slamTrackDescriptors:slamTrackObservations:slamTracks2D:slamTrackImageIndices:", self->_slamTracksCount, self->_slamTracks, self->_descriptorDimension, self->_slamTrackDescriptors,
           self->_slamTrackObservations,
           self->_slamTracks2D,
           self->_slamTrackImageIndices) & 1) != 0)
    && ([(id)v4 setFrameCount:self->_frameCount perFrameVioStatusCodes:self->_perFrameVioStatusCodes perFrameVioPoses:self->_perFrameVioPoses perFrameCalibrationMatrices:self->_perFrameCalibrationMatrices perFrameDistortion:self->_perFrameDistortion] & 1) != 0)
  {
    *(_OWORD *)(v4 + 56) = *(_OWORD *)&self->_resultPoseRotation[0][0];
    long long v7 = *(_OWORD *)&self->_resultPoseRotation[0][2];
    long long v8 = *(_OWORD *)&self->_resultPoseRotation[1][1];
    long long v9 = *(_OWORD *)&self->_resultPoseRotation[2][0];
    *(double *)(v4 + 120) = self->_resultPoseRotation[2][2];
    *(_OWORD *)(v4 + 104) = v9;
    *(_OWORD *)(v4 + 88) = v8;
    *(_OWORD *)(v4 + 72) = v7;
    long long v10 = *(_OWORD *)self->_resultPoseTranslation;
    *(double *)(v4 + 144) = self->_resultPoseTranslation[2];
    *(_OWORD *)(v4 + 128) = v10;
  }
  else
  {

    return 0;
  }
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_CLVLLocalizationMaps488Details)initWithCoder:(id)a3
{
  v39.receiver = self;
  v39.super_class = (Class)_CLVLLocalizationMaps488Details;
  uint64_t v4 = [(_CLVLLocalizationMaps488Details *)&v39 init];
  if (v4)
  {
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    unint64_t v36 = 0;
    [a3 decodeBytesForKey:@"points2D" returnedLength:&v38];
    [a3 decodeBytesForKey:@"points3D" returnedLength:&v37];
    [a3 decodeBytesForKey:@"inlierIndices" returnedLength:&v36];
    if (v38 != 8 * (v36 >> 2)) {
      goto LABEL_25;
    }
    if (v37 != 24 * (v36 >> 2)) {
      goto LABEL_25;
    }
    if ((objc_msgSend(v4, "setInliersCount:points2D:points3D:inlierIndices:") & 1) == 0) {
      goto LABEL_25;
    }
    uint64_t v35 = 0;
    long long v5 = (long long *)[a3 decodeBytesForKey:@"slamOrigin" returnedLength:&v35];
    if (v35 != 48) {
      goto LABEL_25;
    }
    long long v6 = *v5;
    long long v7 = v5[1];
    *(_OWORD *)(v4 + 40) = v5[2];
    *(_OWORD *)(v4 + 24) = v7;
    *(_OWORD *)(v4 + 8) = v6;
    uint64_t v8 = [a3 decodeIntegerForKey:@"descriptorDimension"];
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v31 = 0;
    unint64_t v32 = 0;
    uint64_t v30 = 0;
    [a3 decodeBytesForKey:@"slamTracks" returnedLength:&v34];
    [a3 decodeBytesForKey:@"slamTrackDescriptors" returnedLength:&v33];
    uint64_t v9 = [a3 decodeBytesForKey:@"slamTrackObservations" returnedLength:&v32];
    [a3 decodeBytesForKey:@"slamTracks2D" returnedLength:&v31];
    uint64_t v10 = [a3 decodeBytesForKey:@"slamTrackImageIndices" returnedLength:&v30];
    uint64_t v11 = 0;
    unint64_t v12 = v32 >> 1;
    if (v9 && v32 >= 2)
    {
      uint64_t v11 = 0;
      if (v12 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v32 >> 1;
      }
      v14 = (__int16 *)v9;
      do
      {
        uint64_t v15 = *v14++;
        v11 += v15;
        --v13;
      }
      while (v13);
    }
    if (v34 != 12 * v12) {
      goto LABEL_25;
    }
    if (v33 != v12 * v8) {
      goto LABEL_25;
    }
    if (v31 != 8 * v11) {
      goto LABEL_25;
    }
    if (v30 != 2 * v11) {
      goto LABEL_25;
    }
    if ((objc_msgSend(v4, "setSlamTracksCount:slamTracks:descriptorDimension:slamTrackDescriptors:slamTrackObservations:slamTracks2D:slamTrackImageIndices:", v10) & 1) == 0)goto LABEL_25; {
    uint64_t v28 = 0;
    }
    unint64_t v29 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    [a3 decodeBytesForKey:@"perFrameVioStatusCodes" returnedLength:&v29];
    [a3 decodeBytesForKey:@"perFrameVioPoses" returnedLength:&v28];
    [a3 decodeBytesForKey:@"perFrameCalibrationMatrices" returnedLength:&v27];
    [a3 decodeBytesForKey:@"perFrameDistortion" returnedLength:&v26];
    unint64_t v16 = v29 >> 2;
    if (v28 != 48 * (v29 >> 2)) {
      goto LABEL_25;
    }
    if (v27 == 36 * v16
      && v26 == 8 * v16
      && (objc_msgSend(v4, "setFrameCount:perFrameVioStatusCodes:perFrameVioPoses:perFrameCalibrationMatrices:perFrameDistortion:") & 1) != 0&& (v24 = 0, v25 = 0, uint64_t v17 = objc_msgSend(a3, "decodeBytesForKey:returnedLength:", @"resultPoseRotation", &v25), v18 = objc_msgSend(a3, "decodeBytesForKey:returnedLength:", @"resultPoseTranslation", &v24), v25 == 72)&& v24 == 24)
    {
      *(_OWORD *)(v4 + 56) = *(_OWORD *)v17;
      long long v19 = *(_OWORD *)(v17 + 16);
      long long v20 = *(_OWORD *)(v17 + 32);
      long long v21 = *(_OWORD *)(v17 + 48);
      *((void *)v4 + 15) = *(void *)(v17 + 64);
      *(_OWORD *)(v4 + 104) = v21;
      *(_OWORD *)(v4 + 88) = v20;
      *(_OWORD *)(v4 + 72) = v19;
      long long v22 = *(_OWORD *)v18;
      *((void *)v4 + 18) = *(void *)(v18 + 16);
      *((_OWORD *)v4 + 8) = v22;
    }
    else
    {
LABEL_25:

      return 0;
    }
  }
  return (_CLVLLocalizationMaps488Details *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t inliersCount = self->_inliersCount;
  if (inliersCount)
  {
    uint64_t v6 = 24 * inliersCount;
    uint64_t v7 = 4 * inliersCount;
    [a3 encodeBytes:self->_points2D length:8 * inliersCount forKey:@"points2D"];
    [a3 encodeBytes:self->_points3D length:v6 forKey:@"points3D"];
    [a3 encodeBytes:self->_inlierIndices length:v7 forKey:@"inlierIndices"];
  }
  [a3 encodeBytes:self->_slamOrigin length:48 forKey:@"slamOrigin"];
  [a3 encodeInteger:self->_descriptorDimension forKey:@"descriptorDimension"];
  unint64_t slamTracksCount = self->_slamTracksCount;
  if (slamTracksCount)
  {
    uint64_t v9 = 12 * slamTracksCount;
    unint64_t v10 = self->_descriptorDimension * slamTracksCount;
    uint64_t v11 = 2 * slamTracksCount;
    unint64_t totalObservationsCount = self->_totalObservationsCount;
    uint64_t v13 = 8 * totalObservationsCount;
    uint64_t v14 = 2 * totalObservationsCount;
    [a3 encodeBytes:self->_slamTracks length:v9 forKey:@"slamTracks"];
    [a3 encodeBytes:self->_slamTrackDescriptors length:v10 forKey:@"slamTrackDescriptors"];
    [a3 encodeBytes:self->_slamTrackObservations length:v11 forKey:@"slamTrackObservations"];
    [a3 encodeBytes:self->_slamTracks2D length:v13 forKey:@"slamTracks2D"];
    [a3 encodeBytes:self->_slamTrackImageIndices length:v14 forKey:@"slamTrackImageIndices"];
  }
  unint64_t frameCount = self->_frameCount;
  if (frameCount)
  {
    uint64_t v16 = 48 * frameCount;
    uint64_t v17 = 36 * frameCount;
    uint64_t v18 = 8 * frameCount;
    [a3 encodeBytes:self->_perFrameVioStatusCodes length:4 * frameCount forKey:@"perFrameVioStatusCodes"];
    [a3 encodeBytes:self->_perFrameVioPoses length:v16 forKey:@"perFrameVioPoses"];
    [a3 encodeBytes:self->_perFrameCalibrationMatrices length:v17 forKey:@"perFrameCalibrationMatrices"];
    [a3 encodeBytes:self->_perFrameDistortion length:v18 forKey:@"perFrameDistortion"];
  }
  [a3 encodeBytes:self->_resultPoseRotation length:72 forKey:@"resultPoseRotation"];

  [a3 encodeBytes:self->_resultPoseTranslation length:24 forKey:@"resultPoseTranslation"];
}

- (BOOL)setInliersCount:(unint64_t)a3 points2D:(const float *)a4 points3D:(const double *)a5 inlierIndices:(const int *)a6
{
  if (!a3)
  {
    [(_CLVLLocalizationMaps488Details *)self resetInliers];
    return 1;
  }
  BOOL result = 0;
  if (a4 && a5 && a6)
  {
    size_t v12 = 8 * a3;
    size_t v13 = 24 * a3;
    size_t v14 = 4 * a3;
    if (self->_inliersCount == a3)
    {
      points2D = self->_points2D;
    }
    else
    {
      [(_CLVLLocalizationMaps488Details *)self resetInliers];
      self->_points2D = (float *)malloc_type_malloc(v12, 0x3716E0E5uLL);
      self->_points3D = (double *)malloc_type_malloc(v13, 0xAD1130D6uLL);
      uint64_t v16 = (int *)malloc_type_malloc(v14, 0x6454C56BuLL);
      self->_inlierIndices = v16;
      points2D = self->_points2D;
      if (!points2D || !self->_points3D || !v16)
      {
        [(_CLVLLocalizationMaps488Details *)self resetInliers];
        return 0;
      }
    }
    self->_unint64_t inliersCount = a3;
    memcpy(points2D, a4, v12);
    memcpy(self->_points3D, a5, v13);
    memcpy(self->_inlierIndices, a6, v14);
    return 1;
  }
  return result;
}

- (BOOL)setSlamTracksCount:(unint64_t)a3 slamTracks:(const float *)a4 descriptorDimension:(unint64_t)a5 slamTrackDescriptors:(const char *)a6 slamTrackObservations:(const signed __int16 *)a7 slamTracks2D:(const float *)a8 slamTrackImageIndices:(const signed __int16 *)a9
{
  unint64_t v16 = 0;
  if (a3 && a7)
  {
    unint64_t v16 = 0;
    uint64_t v17 = a7;
    unint64_t v18 = a3;
    do
    {
      uint64_t v19 = *v17++;
      v16 += v19;
      --v18;
    }
    while (v18);
  }
  if (!a3)
  {
    [(_CLVLLocalizationMaps488Details *)self resetSlamTracks];
    self->_descriptorDimension = a5;
    return 1;
  }
  if (!a4) {
    return 0;
  }
  BOOL result = 0;
  if (a6) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = a5 == 0;
  }
  if (v21 && a7)
  {
    if (a9) {
      BOOL v22 = a8 == 0;
    }
    else {
      BOOL v22 = 1;
    }
    if (v22 && v16) {
      return 0;
    }
    unint64_t __n = a5 * a3;
    unint64_t size = 12 * a3;
    if (self->_slamTracksCount == a3) {
      goto LABEL_20;
    }
    slamTracks = self->_slamTracks;
    if (slamTracks)
    {
      free(slamTracks);
      self->_slamTracks = 0;
    }
    slamTrackObservations = self->_slamTrackObservations;
    if (slamTrackObservations)
    {
      free(slamTrackObservations);
      self->_slamTrackObservations = 0;
    }
    self->_slamTracks = (float *)malloc_type_malloc(size, 0xF36568ADuLL);
    uint64_t v25 = (signed __int16 *)malloc_type_malloc(2 * a3, 0xDBE51934uLL);
    self->_slamTrackObservations = v25;
    if (!self->_slamTracks || !v25) {
      goto LABEL_42;
    }
    if (self->_slamTracksCount == a3)
    {
LABEL_20:
      if (self->_descriptorDimension == a5) {
        goto LABEL_34;
      }
    }
    slamTrackDescriptors = self->_slamTrackDescriptors;
    if (slamTrackDescriptors)
    {
      free(slamTrackDescriptors);
      self->_slamTrackDescriptors = 0;
    }
    uint64_t v27 = (char *)malloc_type_malloc(__n, 0xFE438E5FuLL);
    self->_slamTrackDescriptors = v27;
    if (v27)
    {
LABEL_34:
      unint64_t v31 = 2 * a3;
      uint64_t v32 = 2 * v16;
      if (self->_totalObservationsCount == v16) {
        goto LABEL_41;
      }
      slamTracks2D = self->_slamTracks2D;
      if (slamTracks2D)
      {
        free(slamTracks2D);
        self->_slamTracks2D = 0;
      }
      slamTrackImageIndices = self->_slamTrackImageIndices;
      if (slamTrackImageIndices)
      {
        free(slamTrackImageIndices);
        self->_slamTrackImageIndices = 0;
      }
      self->_slamTracks2D = (float *)malloc_type_malloc(8 * v16, 0xC411E7B4uLL);
      uint64_t v30 = (signed __int16 *)malloc_type_malloc(v32, 0x1EA59CBFuLL);
      self->_slamTrackImageIndices = v30;
      if (self->_slamTracks2D)
      {
        if (v30)
        {
LABEL_41:
          self->_unint64_t slamTracksCount = a3;
          self->_descriptorDimension = a5;
          self->_unint64_t totalObservationsCount = v16;
          memcpy(self->_slamTracks, a4, size);
          memcpy(self->_slamTrackDescriptors, a6, __n);
          memcpy(self->_slamTrackObservations, a7, v31);
          memcpy(self->_slamTracks2D, a8, 8 * v16);
          memcpy(self->_slamTrackImageIndices, a9, v32);
          return 1;
        }
      }
    }
LABEL_42:
    [(_CLVLLocalizationMaps488Details *)self resetSlamTracks];
    return 0;
  }
  return result;
}

- (BOOL)setFrameCount:(unint64_t)a3 perFrameVioStatusCodes:(const int *)a4 perFrameVioPoses:(const float *)a5 perFrameCalibrationMatrices:(const float *)a6 perFrameDistortion:(const float *)a7
{
  if (!a3)
  {
    [(_CLVLLocalizationMaps488Details *)self resetFrames];
    return 1;
  }
  BOOL result = 0;
  if (a4 && a5 && a6 && a7)
  {
    size_t v14 = 4 * a3;
    size_t v15 = 48 * a3;
    size_t v16 = 36 * a3;
    size_t v17 = 8 * a3;
    if (self->_frameCount == a3)
    {
      perFrameVioStatusCodes = self->_perFrameVioStatusCodes;
    }
    else
    {
      [(_CLVLLocalizationMaps488Details *)self resetFrames];
      self->_perFrameVioStatusCodes = (int *)malloc_type_malloc(v14, 0x61159052uLL);
      self->_perFrameVioPoses = (float *)malloc_type_malloc(v15, 0x83185973uLL);
      self->_perFrameCalibrationMatrices = (float *)malloc_type_malloc(v16, 0xC824F49EuLL);
      uint64_t v19 = (float *)malloc_type_malloc(v17, 0x3FD7CECEuLL);
      self->_perFrameDistortion = v19;
      perFrameVioStatusCodes = self->_perFrameVioStatusCodes;
      if (!perFrameVioStatusCodes || !self->_perFrameVioPoses || !self->_perFrameCalibrationMatrices || !v19)
      {
        [(_CLVLLocalizationMaps488Details *)self resetFrames];
        return 0;
      }
    }
    self->_unint64_t frameCount = a3;
    memcpy(perFrameVioStatusCodes, a4, v14);
    memcpy(self->_perFrameVioPoses, a5, v15);
    memcpy(self->_perFrameCalibrationMatrices, a6, v16);
    memcpy(self->_perFrameDistortion, a7, v17);
    return 1;
  }
  return result;
}

- (double)slamOrigin
{
  return self->_slamOrigin;
}

- (void)setSlamOrigin:(const double *)a3
{
  long long v3 = *(_OWORD *)a3;
  long long v4 = *((_OWORD *)a3 + 1);
  *(_OWORD *)&self->_slamOrigin[4] = *((_OWORD *)a3 + 2);
  *(_OWORD *)&self->_slamOrigin[2] = v4;
  *(_OWORD *)self->_slamOrigin = v3;
}

- (double)resultPoseRotation
{
  return self->_resultPoseRotation[0];
}

- (void)setResultPoseRotation:(const double *)a3
{
  *(_OWORD *)&self->_resultPoseRotation[0][0] = *(_OWORD *)a3;
  long long v3 = *((_OWORD *)a3 + 1);
  long long v4 = *((_OWORD *)a3 + 2);
  long long v5 = *((_OWORD *)a3 + 3);
  self->_resultPoseRotation[2][2] = a3[8];
  *(_OWORD *)&self->_resultPoseRotation[2][0] = v5;
  *(_OWORD *)&self->_resultPoseRotation[1][1] = v4;
  *(_OWORD *)&self->_resultPoseRotation[0][2] = v3;
}

- (double)resultPoseTranslation
{
  return self->_resultPoseTranslation;
}

- (void)setResultPoseTranslation:(const double *)a3
{
  long long v3 = *(_OWORD *)a3;
  self->_resultPoseTranslation[2] = a3[2];
  *(_OWORD *)self->_resultPoseTranslation = v3;
}

- (id)description
{
  return [(_CLVLLocalizationMaps488Details *)self descriptionWithMemberIndent:@"\t" endIndent:&stru_1EE006720];
}

- (id)descriptionWithMemberIndent:(id)a3 endIndent:(id)a4
{
  uint64_t v40 = [a3 stringByAppendingString:@"\t"];
  v49 = NSString;
  unint64_t v48 = [(_CLVLLocalizationMaps488Details *)self inliersCount];
  v47 = [(_CLVLLocalizationMaps488Details *)self points2D];
  unint64_t v46 = 2 * [(_CLVLLocalizationMaps488Details *)self inliersCount];
  v45 = [(_CLVLLocalizationMaps488Details *)self points3D];
  unint64_t v44 = 3 * [(_CLVLLocalizationMaps488Details *)self inliersCount];
  v43 = [(_CLVLLocalizationMaps488Details *)self inlierIndices];
  unint64_t v42 = [(_CLVLLocalizationMaps488Details *)self inliersCount];
  v41 = [(_CLVLLocalizationMaps488Details *)self slamOrigin];
  uint64_t v39 = *(void *)[(_CLVLLocalizationMaps488Details *)self slamOrigin];
  uint64_t v38 = (uint64_t)[(_CLVLLocalizationMaps488Details *)self slamOrigin][8];
  uint64_t v37 = (uint64_t)[(_CLVLLocalizationMaps488Details *)self slamOrigin][16];
  uint64_t v36 = (uint64_t)[(_CLVLLocalizationMaps488Details *)self slamOrigin][24];
  uint64_t v35 = (uint64_t)[(_CLVLLocalizationMaps488Details *)self slamOrigin][32];
  uint64_t v34 = (uint64_t)[(_CLVLLocalizationMaps488Details *)self slamOrigin][40];
  unint64_t v33 = [(_CLVLLocalizationMaps488Details *)self slamTracksCount];
  uint64_t v32 = [(_CLVLLocalizationMaps488Details *)self slamTracks];
  unint64_t v31 = 3 * [(_CLVLLocalizationMaps488Details *)self slamTracksCount];
  unint64_t v30 = [(_CLVLLocalizationMaps488Details *)self descriptorDimension];
  unint64_t v29 = [(_CLVLLocalizationMaps488Details *)self slamTrackDescriptors];
  unint64_t v6 = [(_CLVLLocalizationMaps488Details *)self descriptorDimension];
  unint64_t v28 = [(_CLVLLocalizationMaps488Details *)self slamTracksCount] * v6;
  uint64_t v27 = [(_CLVLLocalizationMaps488Details *)self slamTrackObservations];
  unint64_t v26 = [(_CLVLLocalizationMaps488Details *)self slamTracksCount];
  uint64_t v25 = [(_CLVLLocalizationMaps488Details *)self slamTracks2D];
  unint64_t v24 = 2 * [(_CLVLLocalizationMaps488Details *)self totalObservationsCount];
  v23 = [(_CLVLLocalizationMaps488Details *)self slamTrackImageIndices];
  unint64_t v22 = [(_CLVLLocalizationMaps488Details *)self totalObservationsCount];
  unint64_t v21 = [(_CLVLLocalizationMaps488Details *)self frameCount];
  long long v20 = [(_CLVLLocalizationMaps488Details *)self perFrameVioStatusCodes];
  unint64_t v19 = [(_CLVLLocalizationMaps488Details *)self frameCount];
  uint64_t v7 = [(_CLVLLocalizationMaps488Details *)self perFrameVioPoses];
  unint64_t v8 = 12 * [(_CLVLLocalizationMaps488Details *)self frameCount];
  uint64_t v9 = [(_CLVLLocalizationMaps488Details *)self perFrameCalibrationMatrices];
  unint64_t v10 = 9 * [(_CLVLLocalizationMaps488Details *)self frameCount];
  uint64_t v11 = [(_CLVLLocalizationMaps488Details *)self perFrameDistortion];
  unint64_t v12 = 2 * [(_CLVLLocalizationMaps488Details *)self frameCount];
  size_t v13 = [(_CLVLLocalizationMaps488Details *)self resultPoseRotation];
  uint64_t v18 = *(void *)[(_CLVLLocalizationMaps488Details *)self resultPoseRotation];
  uint64_t v17 = (uint64_t)[(_CLVLLocalizationMaps488Details *)self resultPoseRotation][8];
  uint64_t v16 = (uint64_t)[(_CLVLLocalizationMaps488Details *)self resultPoseRotation][16];
  uint64_t v14 = (uint64_t)[(_CLVLLocalizationMaps488Details *)self resultPoseRotation][24];
  [(_CLVLLocalizationMaps488Details *)self resultPoseRotation];
  [(_CLVLLocalizationMaps488Details *)self resultPoseRotation];
  [(_CLVLLocalizationMaps488Details *)self resultPoseRotation];
  [(_CLVLLocalizationMaps488Details *)self resultPoseRotation];
  [(_CLVLLocalizationMaps488Details *)self resultPoseRotation];
  [(_CLVLLocalizationMaps488Details *)self resultPoseTranslation];
  [(_CLVLLocalizationMaps488Details *)self resultPoseTranslation];
  [(_CLVLLocalizationMaps488Details *)self resultPoseTranslation];
  [(_CLVLLocalizationMaps488Details *)self resultPoseTranslation];
  return (id)objc_msgSend(v49, "stringWithFormat:", @"<_CLVLLocalizationMaps488Details: %p> {\n%@.unint64_t inliersCount = %zu,\n%@.points2D = <float: %p> {length = %zu},\n%@.points3D = <double: %p> {length = %zu},\n%@.inlierIndices = <int: %p> {length = %zu},\n%@.slamOrigin = <double: %p> {length = 6, values = [%f, %f, %f, %f, %f, %f]},\n%@.slamTracksCount = %zu,\n%@.slamTracks = <float: %p> {length = %zu},\n%@.descriptorDimension = %zu,\n%@.slamTrackDescriptors = <unsigned char: %p> {length = %zu},\n%@.slamTrackObservations = <short: %p> {length = %zu},\n%@.slamTracks2D = <float: %p> {length = %zu},\n%@.slamTrackImageIndices = <short: %p> {length = %zu},\n%@.frameCount = %zu,\n%@.perFrameVioStatusCodes = <int: %p> {length = %zu},\n%@.perFrameVioPoses = <float: %p> {length = %zu},\n%@.perFrameCalibrationMatrices = <float: %p> {length = %zu},\n%@.perFrameDistortion = <float: %p> {length = %zu},\n%@.resultPoseRotation = <double: %p> {length = 9, values = [%f, %f, %f;\n%@%f, %f, %f;\n%@%f, %f, %f]},\n%@.resultPoseTranslation = <double: %p> {length = 3, values = [%f, %f, %f]}\n%@}",
               self,
               a3,
               v48,
               a3,
               v47,
               v46,
               a3,
               v45,
               v44,
               a3,
               v43,
               v42,
               a3,
               v41,
               v39,
               v38,
               v37,
               v36,
               v35,
               v34,
               a3,
               v33,
               a3,
               v32,
               v31,
               a3,
               v30,
               a3,
               v29,
               v28,
               a3,
               v27,
               v26,
               a3,
               v25,
               v24,
               a3,
               v23,
               v22,
               a3,
               v21,
               a3,
               v20,
               v19,
               a3,
               v7,
               v8,
               a3,
               v9,
               v10,
               a3,
               v11,
               v12,
               a3,
               v13,
               v18,
               v17,
               v16,
               v40,
               v14);
}

- (unint64_t)inliersCount
{
  return self->_inliersCount;
}

- (float)points2D
{
  return self->_points2D;
}

- (double)points3D
{
  return self->_points3D;
}

- (int)inlierIndices
{
  return self->_inlierIndices;
}

- (unint64_t)slamTracksCount
{
  return self->_slamTracksCount;
}

- (float)slamTracks
{
  return self->_slamTracks;
}

- (unint64_t)descriptorDimension
{
  return self->_descriptorDimension;
}

- (char)slamTrackDescriptors
{
  return self->_slamTrackDescriptors;
}

- (signed)slamTrackObservations
{
  return self->_slamTrackObservations;
}

- (unint64_t)totalObservationsCount
{
  return self->_totalObservationsCount;
}

- (float)slamTracks2D
{
  return self->_slamTracks2D;
}

- (signed)slamTrackImageIndices
{
  return self->_slamTrackImageIndices;
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (int)perFrameVioStatusCodes
{
  return self->_perFrameVioStatusCodes;
}

- (float)perFrameVioPoses
{
  return self->_perFrameVioPoses;
}

- (float)perFrameCalibrationMatrices
{
  return self->_perFrameCalibrationMatrices;
}

- (float)perFrameDistortion
{
  return self->_perFrameDistortion;
}

@end