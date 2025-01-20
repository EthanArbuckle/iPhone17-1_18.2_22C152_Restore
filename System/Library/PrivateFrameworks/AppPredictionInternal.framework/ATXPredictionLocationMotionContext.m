@interface ATXPredictionLocationMotionContext
- (ATXLocationOfInterest)currentLOI;
- (ATXLocationOfInterest)previousLOI;
- (ATXPredictionLocationMotionContext)initWithCurrentLOI:(id)a3 previousLOI:(id)a4 motionType:(int64_t)a5 currentLocation:(id)a6 locationEnabled:(BOOL)a7 distanceFromHome:(double)a8 distanceFromWork:(double)a9 distanceFromSchool:(double)a10 distanceFromGym:(double)a11 canPredictClipsGivenRecentMotion:(BOOL)a12;
- (ATXPredictionLocationMotionContext)initWithCurrentLOI:(id)a3 previousLOI:(id)a4 motionType:(int64_t)a5 geohash:(int64_t)a6 coarseGeohash:(int64_t)a7 largeGeohash:(int64_t)a8 locationEnabled:(BOOL)a9 distanceFromHome:(double)a10 distanceFromWork:(double)a11 distanceFromSchool:(double)a12 distanceFromGym:(double)a13 canPredictClipsGivenRecentMotion:(BOOL)a14;
- (ATXPredictionLocationMotionContext)initWithProto:(id)a3;
- (ATXPredictionLocationMotionContext)initWithProtoData:(id)a3;
- (BOOL)canPredictClipsGivenRecentMotion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXPredictionLocationMotionContext:(id)a3;
- (BOOL)locationEnabled;
- (double)distanceFromGymOfCurrentLocationInMeters;
- (double)distanceFromHomeOfCurrentLocationInMeters;
- (double)distanceFromSchoolOfCurrentLocationInMeters;
- (double)distanceFromWorkOfCurrentLocationInMeters;
- (id)_unarchiveCLLocation:(id)a3;
- (id)description;
- (id)encodeAsProto;
- (id)jsonDict;
- (id)proto;
- (int)_pbMotionTypeFromATXMotionType:(int64_t)a3;
- (int64_t)_atxMotionTypeFromPBMotionType:(int)a3;
- (int64_t)coarseGeohash;
- (int64_t)geohash;
- (int64_t)largeGeohash;
- (int64_t)motionType;
@end

@implementation ATXPredictionLocationMotionContext

- (ATXPredictionLocationMotionContext)initWithCurrentLOI:(id)a3 previousLOI:(id)a4 motionType:(int64_t)a5 currentLocation:(id)a6 locationEnabled:(BOOL)a7 distanceFromHome:(double)a8 distanceFromWork:(double)a9 distanceFromSchool:(double)a10 distanceFromGym:(double)a11 canPredictClipsGivenRecentMotion:(BOOL)a12
{
  BOOL v17 = a7;
  id v22 = a6;
  id v23 = a4;
  id v24 = a3;
  int64_t v25 = +[ATXPrivacyPreservingLocationHash privacyPreservingGeohashForLocation:v22 locationEnabled:v17];
  int64_t v26 = +[ATXPrivacyPreservingLocationHash privacyPreservingCoarseGeohashForLocation:v22 locationEnabled:v17];
  int64_t v27 = +[ATXPrivacyPreservingLocationHash privacyPreservingZoom7GeohashForLocation:v22 locationEnabled:v17];

  BYTE1(v30) = a12;
  LOBYTE(v30) = v17;
  v28 = -[ATXPredictionLocationMotionContext initWithCurrentLOI:previousLOI:motionType:geohash:coarseGeohash:largeGeohash:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:](self, "initWithCurrentLOI:previousLOI:motionType:geohash:coarseGeohash:largeGeohash:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:", v24, v23, a5, v25, v26, v27, a8, a9, a10, a11, v30);

  return v28;
}

- (ATXPredictionLocationMotionContext)initWithCurrentLOI:(id)a3 previousLOI:(id)a4 motionType:(int64_t)a5 geohash:(int64_t)a6 coarseGeohash:(int64_t)a7 largeGeohash:(int64_t)a8 locationEnabled:(BOOL)a9 distanceFromHome:(double)a10 distanceFromWork:(double)a11 distanceFromSchool:(double)a12 distanceFromGym:(double)a13 canPredictClipsGivenRecentMotion:(BOOL)a14
{
  id v25 = a3;
  id v26 = a4;
  v30.receiver = self;
  v30.super_class = (Class)ATXPredictionLocationMotionContext;
  int64_t v27 = [(ATXPredictionLocationMotionContext *)&v30 init];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_previousLOI, a4);
    objc_storeStrong((id *)&v28->_currentLOI, a3);
    v28->_motionType = a5;
    v28->_geohash = a6;
    v28->_coarseGeohash = a7;
    v28->_largeGeohash = a8;
    v28->_locationEnabled = a9;
    v28->_distanceFromHomeOfCurrentLocationInMeters = a10;
    v28->_distanceFromWorkOfCurrentLocationInMeters = a11;
    v28->_distanceFromSchoolOfCurrentLocationInMeters = a12;
    v28->_distanceFromGymOfCurrentLocationInMeters = a13;
    v28->_canPredictClipsGivenRecentMotion = a14;
  }

  return v28;
}

- (id)description
{
  v2 = [(ATXPredictionLocationMotionContext *)self jsonDict];
  v3 = [v2 description];

  return v3;
}

- (id)jsonDict
{
  v26[11] = *MEMORY[0x1E4F143B8];
  v25[0] = @"currentLOI";
  uint64_t v3 = [(ATXLocationOfInterest *)self->_currentLOI description];
  id v24 = (void *)v3;
  if (v3) {
    v4 = (__CFString *)v3;
  }
  else {
    v4 = @"nil";
  }
  v26[0] = v4;
  v25[1] = @"previousLOI";
  uint64_t v5 = [(ATXLocationOfInterest *)self->_previousLOI description];
  id v23 = (void *)v5;
  if (v5) {
    v6 = (__CFString *)v5;
  }
  else {
    v6 = @"nil";
  }
  v26[1] = v6;
  v25[2] = @"motionType";
  id v22 = [MEMORY[0x1E4F93618] stringForMotionType:self->_motionType];
  v26[2] = v22;
  v25[3] = @"geohash";
  v21 = [NSNumber numberWithLongLong:self->_geohash];
  v26[3] = v21;
  v25[4] = @"coarseGeohash";
  v20 = [NSNumber numberWithLongLong:self->_coarseGeohash];
  v26[4] = v20;
  v25[5] = @"largeGeohash";
  uint64_t v7 = [NSNumber numberWithLongLong:self->_largeGeohash];
  v8 = (void *)v7;
  v9 = @"NO";
  if (self->_locationEnabled) {
    v9 = @"YES";
  }
  v26[5] = v7;
  v26[6] = v9;
  v25[6] = @"locationEnabled";
  v25[7] = @"distanceFromHome";
  v10 = [NSNumber numberWithDouble:self->_distanceFromHomeOfCurrentLocationInMeters];
  v11 = [v10 stringValue];
  v26[7] = v11;
  v25[8] = @"distanceFromWork";
  v12 = [NSNumber numberWithDouble:self->_distanceFromWorkOfCurrentLocationInMeters];
  v13 = [v12 stringValue];
  v26[8] = v13;
  v25[9] = @"distanceFromSchool";
  v14 = [NSNumber numberWithDouble:self->_distanceFromSchoolOfCurrentLocationInMeters];
  v15 = [v14 stringValue];
  v26[9] = v15;
  v25[10] = @"distanceFromGym";
  v16 = [NSNumber numberWithDouble:self->_distanceFromGymOfCurrentLocationInMeters];
  BOOL v17 = [v16 stringValue];
  v26[10] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:11];

  return v18;
}

- (ATXPredictionLocationMotionContext)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [[ATXPBPredictionLocationMotionContext alloc] initWithData:v4];

    self = [(ATXPredictionLocationMotionContext *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXPredictionLocationMotionContext *)self proto];
  uint64_t v3 = [v2 data];

  return v3;
}

- (ATXPredictionLocationMotionContext)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_9:
    id v23 = 0;
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v24 = __atxlog_handle_default();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[ATXPredictionLocationMotionContext initWithProto:]((uint64_t)self, v24);
    }

    goto LABEL_9;
  }
  id v5 = v4;
  id v6 = objc_alloc(MEMORY[0x1E4F935F0]);
  uint64_t v7 = [v5 currentLOI];
  v8 = (void *)[v6 initWithProto:v7];

  id v9 = objc_alloc(MEMORY[0x1E4F935F0]);
  v10 = [v5 previousLOI];
  v11 = (void *)[v9 initWithProto:v10];

  int64_t v12 = -[ATXPredictionLocationMotionContext _atxMotionTypeFromPBMotionType:](self, "_atxMotionTypeFromPBMotionType:", [v5 motionType]);
  if ([v5 hasCurrentLocation])
  {
    v13 = [v5 currentLocation];
    v14 = [(ATXPredictionLocationMotionContext *)self _unarchiveCLLocation:v13];

    if (v14)
    {
      uint64_t v15 = [v5 locationEnabled];
      [v5 distanceFromHome];
      double v17 = v16;
      [v5 distanceFromWork];
      double v19 = v18;
      [v5 distanceFromSchool];
      double v21 = v20;
      [v5 distanceFromGym];
      self = -[ATXPredictionLocationMotionContext initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:](self, "initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:", v8, v11, v12, v14, v15, [v5 canPredictClipsGivenRecentMotion], v17, v19, v21, v22);
      id v23 = self;
    }
    else
    {
      id v23 = 0;
    }
  }
  else
  {
    if (([v5 hasGeohash] & 1) != 0
      || ([v5 hasCoarseGeohash] & 1) != 0
      || [v5 hasLargeGeohash])
    {
      uint64_t v25 = [v5 geohash];
      uint64_t v26 = [v5 coarseGeohash];
      uint64_t v27 = [v5 largeGeohash];
      char v28 = [v5 locationEnabled];
      [v5 distanceFromHome];
      double v30 = v29;
      [v5 distanceFromWork];
      double v32 = v31;
      [v5 distanceFromSchool];
      double v34 = v33;
      [v5 distanceFromGym];
      double v36 = v35;
      BYTE1(v47) = [v5 canPredictClipsGivenRecentMotion];
      LOBYTE(v47) = v28;
      v37 = -[ATXPredictionLocationMotionContext initWithCurrentLOI:previousLOI:motionType:geohash:coarseGeohash:largeGeohash:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:](self, "initWithCurrentLOI:previousLOI:motionType:geohash:coarseGeohash:largeGeohash:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:", v8, v11, v12, v25, v26, v27, v30, v32, v34, v36, v47);
    }
    else
    {
      uint64_t v39 = [v5 locationEnabled];
      [v5 distanceFromHome];
      double v41 = v40;
      [v5 distanceFromWork];
      double v43 = v42;
      [v5 distanceFromSchool];
      double v45 = v44;
      [v5 distanceFromGym];
      v37 = -[ATXPredictionLocationMotionContext initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:](self, "initWithCurrentLOI:previousLOI:motionType:currentLocation:locationEnabled:distanceFromHome:distanceFromWork:distanceFromSchool:distanceFromGym:canPredictClipsGivenRecentMotion:", v8, v11, v12, 0, v39, [v5 canPredictClipsGivenRecentMotion], v41, v43, v45, v46);
    }
    self = v37;
    id v23 = self;
  }

LABEL_18:
  return v23;
}

- (id)proto
{
  uint64_t v3 = objc_opt_new();
  id v4 = [(ATXLocationOfInterest *)self->_currentLOI proto];
  [v3 setCurrentLOI:v4];

  id v5 = [(ATXLocationOfInterest *)self->_previousLOI proto];
  [v3 setPreviousLOI:v5];

  objc_msgSend(v3, "setMotionType:", -[ATXPredictionLocationMotionContext _pbMotionTypeFromATXMotionType:](self, "_pbMotionTypeFromATXMotionType:", self->_motionType));
  [v3 setGeohash:self->_geohash];
  [v3 setCoarseGeohash:self->_coarseGeohash];
  [v3 setLargeGeohash:self->_largeGeohash];
  [v3 setLocationEnabled:self->_locationEnabled];
  [v3 setDistanceFromHome:self->_distanceFromHomeOfCurrentLocationInMeters];
  [v3 setDistanceFromWork:self->_distanceFromWorkOfCurrentLocationInMeters];
  [v3 setDistanceFromSchool:self->_distanceFromSchoolOfCurrentLocationInMeters];
  [v3 setDistanceFromGym:self->_distanceFromGymOfCurrentLocationInMeters];
  [v3 setCanPredictClipsGivenRecentMotion:self->_canPredictClipsGivenRecentMotion];
  return v3;
}

- (id)_unarchiveCLLocation:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D25F6CC0]();
    id v10 = 0;
    id v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v10];
    id v6 = v10;
    id v7 = 0;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8) {
      id v7 = v5;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (int64_t)_atxMotionTypeFromPBMotionType:(int)a3
{
  uint64_t v3 = (a3 - 1);
  if (v3 < 4) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

- (int)_pbMotionTypeFromATXMotionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 4) {
    return a3;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXPredictionLocationMotionContext *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXPredictionLocationMotionContext *)self isEqualToATXPredictionLocationMotionContext:v5];

  return v6;
}

- (BOOL)isEqualToATXPredictionLocationMotionContext:(id)a3
{
  id v4 = (id *)a3;
  currentLOI = self->_currentLOI;
  BOOL v6 = (ATXLocationOfInterest *)v4[3];
  if (currentLOI == v6)
  {
  }
  else
  {
    id v7 = v6;
    BOOL v8 = currentLOI;
    char v9 = [(ATXLocationOfInterest *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_18;
    }
  }
  previousLOI = self->_previousLOI;
  v11 = (ATXLocationOfInterest *)v4[2];
  if (previousLOI == v11)
  {
  }
  else
  {
    int64_t v12 = v11;
    v13 = previousLOI;
    char v14 = [(ATXLocationOfInterest *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_18;
    }
  }
  int64_t motionType = self->_motionType;
  if (motionType == [v4 motionType]
    && self->_geohash == v4[5]
    && self->_coarseGeohash == v4[6]
    && self->_largeGeohash == v4[7]
    && self->_locationEnabled == *((unsigned __int8 *)v4 + 8)
    && self->_distanceFromHomeOfCurrentLocationInMeters == *((double *)v4 + 8)
    && self->_distanceFromWorkOfCurrentLocationInMeters == *((double *)v4 + 9)
    && self->_distanceFromSchoolOfCurrentLocationInMeters == *((double *)v4 + 10)
    && self->_distanceFromGymOfCurrentLocationInMeters == *((double *)v4 + 11))
  {
    BOOL v16 = self->_canPredictClipsGivenRecentMotion == *((unsigned __int8 *)v4 + 9);
    goto LABEL_19;
  }
LABEL_18:
  BOOL v16 = 0;
LABEL_19:

  return v16;
}

- (ATXLocationOfInterest)previousLOI
{
  return self->_previousLOI;
}

- (ATXLocationOfInterest)currentLOI
{
  return self->_currentLOI;
}

- (int64_t)motionType
{
  return self->_motionType;
}

- (int64_t)geohash
{
  return self->_geohash;
}

- (int64_t)coarseGeohash
{
  return self->_coarseGeohash;
}

- (int64_t)largeGeohash
{
  return self->_largeGeohash;
}

- (BOOL)locationEnabled
{
  return self->_locationEnabled;
}

- (double)distanceFromHomeOfCurrentLocationInMeters
{
  return self->_distanceFromHomeOfCurrentLocationInMeters;
}

- (double)distanceFromWorkOfCurrentLocationInMeters
{
  return self->_distanceFromWorkOfCurrentLocationInMeters;
}

- (double)distanceFromSchoolOfCurrentLocationInMeters
{
  return self->_distanceFromSchoolOfCurrentLocationInMeters;
}

- (double)distanceFromGymOfCurrentLocationInMeters
{
  return self->_distanceFromGymOfCurrentLocationInMeters;
}

- (BOOL)canPredictClipsGivenRecentMotion
{
  return self->_canPredictClipsGivenRecentMotion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLOI, 0);
  objc_storeStrong((id *)&self->_previousLOI, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  BOOL v6 = v4;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBPredictionLocationMotionContext proto", (uint8_t *)&v5, 0xCu);
}

@end