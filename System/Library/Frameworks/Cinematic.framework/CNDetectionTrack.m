@interface CNDetectionTrack
+ (id)_internalFromTracks:(id)a3;
+ (id)_trackFromInternal:(id)a3;
+ (id)_tracksFromInternal:(id)a3;
- (BOOL)isDiscrete;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserCreated;
- (CNDetection)detectionAtOrBeforeTime:(CMTime *)time;
- (CNDetection)detectionNearestTime:(CMTime *)time;
- (CNDetectionGroupID)detectionGroupID;
- (CNDetectionID)detectionID;
- (CNDetectionType)detectionType;
- (NSArray)detectionsInTimeRange:(CMTimeRange *)timeRange;
- (PTCinematographyTrack)internalTrack;
- (id)_initWithInternal:(id)a3;
- (unint64_t)hash;
- (void)setInternalTrack:(id)a3;
@end

@implementation CNDetectionTrack

- (CNDetectionType)detectionType
{
  return [(PTCinematographyTrack *)self->_internalTrack detectionType];
}

- (CNDetectionID)detectionID
{
  return [(PTCinematographyTrack *)self->_internalTrack trackIdentifier];
}

- (CNDetectionGroupID)detectionGroupID
{
  return [(PTCinematographyTrack *)self->_internalTrack groupIdentifier];
}

- (BOOL)isUserCreated
{
  return [(PTCinematographyTrack *)self->_internalTrack isUserCreated];
}

- (BOOL)isDiscrete
{
  return [(PTCinematographyTrack *)self->_internalTrack isDiscrete];
}

- (CNDetection)detectionAtOrBeforeTime:(CMTime *)time
{
  internalTrack = self->_internalTrack;
  CMTime v7 = *time;
  v4 = [(PTCinematographyTrack *)internalTrack detectionAtOrBeforeTime:&v7];
  if (v4) {
    id v5 = +[CNDetection _copyDetectionFromInternal:v4];
  }
  else {
    id v5 = 0;
  }

  return (CNDetection *)v5;
}

- (CNDetection)detectionNearestTime:(CMTime *)time
{
  internalTrack = self->_internalTrack;
  CMTime v7 = *time;
  v4 = [(PTCinematographyTrack *)internalTrack detectionNearestTime:&v7];
  if (v4) {
    id v5 = +[CNDetection _copyDetectionFromInternal:v4];
  }
  else {
    id v5 = 0;
  }

  return (CNDetection *)v5;
}

- (NSArray)detectionsInTimeRange:(CMTimeRange *)timeRange
{
  internalTrack = self->_internalTrack;
  long long v4 = *(_OWORD *)&timeRange->start.epoch;
  v8[0] = *(_OWORD *)&timeRange->start.value;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&timeRange->duration.timescale;
  id v5 = [(PTCinematographyTrack *)internalTrack detectionsInTimeRange:v8];
  id v6 = +[CNDetection _copyDetectionsFromInternal:v5];

  return (NSArray *)v6;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (unint64_t)hash
{
  v2 = [(CNDetectionTrack *)self internalTrack];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)_initWithInternal:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNDetectionTrack;
  id v5 = [(CNDetectionTrack *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    internalTrack = v5->_internalTrack;
    v5->_internalTrack = (PTCinematographyTrack *)v6;
  }
  return v5;
}

- (PTCinematographyTrack)internalTrack
{
  return (PTCinematographyTrack *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternalTrack:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)_trackFromInternal:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = off_26517A138;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v4 = off_26517A130;
    if (isKindOfClass) {
      id v4 = off_26517A118;
    }
  }
  uint64_t v6 = (void *)[objc_alloc(*v4) _initWithInternal:v3];

  return v6;
}

+ (id)_tracksFromInternal:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "_trackFromInternal:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];

  return v12;
}

+ (id)_internalFromTracks:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "internalTrack", (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v4 copy];

  return v11;
}

@end