@interface MPMusicPlayerQueueDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)disableQueueModifications;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivate;
- (BOOL)prioritizeStartupOverQuality;
- (MPMusicPlayerQueueDescriptor)initWithCoder:(id)a3;
- (NSData)playActivityRecommendationData;
- (NSDictionary)endTimes;
- (NSDictionary)startTimes;
- (NSString)playActivityFeatureName;
- (NSString)playActivityQueueGroupingID;
- (NSString)requestingBundleIdentifier;
- (NSString)requestingBundleVersion;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)repeatType;
- (int64_t)shuffleType;
- (void)_setEndTime:(double)a3 forIdentifiers:(id)a4;
- (void)_setStartTime:(double)a3 forIdentifiers:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDisableQueueModifications:(BOOL)a3;
- (void)setPlayActivityFeatureName:(id)a3;
- (void)setPlayActivityQueueGroupingID:(id)a3;
- (void)setPlayActivityRecommendationData:(id)a3;
- (void)setPrioritizeStartupOverQuality:(BOOL)a3;
- (void)setPrivate:(BOOL)a3;
- (void)setRepeatType:(int64_t)a3;
- (void)setShuffleType:(int64_t)a3;
@end

@implementation MPMusicPlayerQueueDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimes, 0);
  objc_storeStrong((id *)&self->_startTimes, 0);
  objc_storeStrong((id *)&self->_playActivityRecommendationData, 0);
  objc_storeStrong((id *)&self->_playActivityFeatureName, 0);
  objc_storeStrong((id *)&self->_playActivityQueueGroupingID, 0);
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);

  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
}

- (void)setPrioritizeStartupOverQuality:(BOOL)a3
{
  self->_prioritizeStartupOverQuality = a3;
}

- (BOOL)prioritizeStartupOverQuality
{
  return self->_prioritizeStartupOverQuality;
}

- (NSDictionary)endTimes
{
  return self->_endTimes;
}

- (NSDictionary)startTimes
{
  return self->_startTimes;
}

- (void)setPlayActivityRecommendationData:(id)a3
{
}

- (NSData)playActivityRecommendationData
{
  return self->_playActivityRecommendationData;
}

- (void)setPlayActivityFeatureName:(id)a3
{
}

- (NSString)playActivityFeatureName
{
  return self->_playActivityFeatureName;
}

- (void)setPlayActivityQueueGroupingID:(id)a3
{
}

- (NSString)playActivityQueueGroupingID
{
  return self->_playActivityQueueGroupingID;
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (NSString)requestingBundleIdentifier
{
  return self->_requestingBundleIdentifier;
}

- (void)setPrivate:(BOOL)a3
{
  self->_isPrivate = a3;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (void)setRepeatType:(int64_t)a3
{
  self->_repeatType = a3;
}

- (int64_t)repeatType
{
  return self->_repeatType;
}

- (void)setShuffleType:(int64_t)a3
{
  self->_shuffleType = a3;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (void)setDisableQueueModifications:(BOOL)a3
{
  self->_disableQueueModifications = a3;
}

- (BOOL)disableQueueModifications
{
  return self->_disableQueueModifications;
}

- (void)_setEndTime:(double)a3 forIdentifiers:(id)a4
{
  id v10 = a4;
  endTimes = self->_endTimes;
  p_endTimes = &self->_endTimes;
  v8 = endTimes;
  if (!v8)
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_storeStrong((id *)p_endTimes, v8);
  }
  v9 = [NSNumber numberWithDouble:a3];
  [(NSDictionary *)v8 setObject:v9 forKey:v10];
}

- (void)_setStartTime:(double)a3 forIdentifiers:(id)a4
{
  id v10 = a4;
  startTimes = self->_startTimes;
  p_startTimes = &self->_startTimes;
  v8 = startTimes;
  if (!v8)
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_storeStrong((id *)p_startTimes, v8);
  }
  v9 = [NSNumber numberWithDouble:a3];
  [(NSDictionary *)v8 setObject:v9 forKey:v10];
}

- (BOOL)isEmpty
{
  uint64_t v4 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v4 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"MPMusicPlayerQueueDescriptor.m", 189, @"Subclass %@ must implement -%@ defined in %@.", v8, v9, @"[MPMusicPlayerQueueDescriptor class]" object file lineNumber description];
  }
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  *((unsigned char *)v4 + 8) = self->_disableQueueModifications;
  *((void *)v4 + 2) = self->_shuffleType;
  *((void *)v4 + 3) = self->_repeatType;
  *((unsigned char *)v4 + 9) = self->_isPrivate;
  uint64_t v5 = [(NSDictionary *)self->_startTimes mutableCopy];
  v6 = (void *)*((void *)v4 + 9);
  *((void *)v4 + 9) = v5;

  uint64_t v7 = [(NSDictionary *)self->_endTimes mutableCopy];
  v8 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v7;

  objc_storeStrong((id *)v4 + 4, self->_requestingBundleIdentifier);
  objc_storeStrong((id *)v4 + 5, self->_requestingBundleVersion);
  objc_storeStrong((id *)v4 + 6, self->_playActivityQueueGroupingID);
  objc_storeStrong((id *)v4 + 7, self->_playActivityFeatureName);
  objc_storeStrong((id *)v4 + 8, self->_playActivityRecommendationData);
  *((unsigned char *)v4 + 10) = self->_prioritizeStartupOverQuality;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL disableQueueModifications = self->_disableQueueModifications;
  id v5 = a3;
  [v5 encodeBool:disableQueueModifications forKey:@"disableQueueModifications"];
  [v5 encodeInteger:self->_shuffleType forKey:@"shuffleType"];
  [v5 encodeInteger:self->_repeatType forKey:@"repeatType"];
  [v5 encodeBool:self->_isPrivate forKey:@"private"];
  [v5 encodeObject:self->_startTimes forKey:@"MPMusicPlayerQueueDescriptorStartTimes"];
  [v5 encodeObject:self->_endTimes forKey:@"MPMusicPlayerQueueDescriptorEndTimes"];
  [v5 encodeObject:self->_requestingBundleIdentifier forKey:@"bundleID"];
  [v5 encodeObject:self->_requestingBundleVersion forKey:@"bundleVersion"];
  [v5 encodeObject:self->_playActivityQueueGroupingID forKey:@"queueGroupingID"];
  [v5 encodeObject:self->_playActivityFeatureName forKey:@"featureName"];
  [v5 encodeObject:self->_playActivityRecommendationData forKey:@"recommendationData"];
  [v5 encodeBool:self->_prioritizeStartupOverQuality forKey:@"prioritizeStartupOverQuality"];
}

- (MPMusicPlayerQueueDescriptor)initWithCoder:(id)a3
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MPMusicPlayerQueueDescriptor;
  id v5 = [(MPMusicPlayerQueueDescriptor *)&v24 init];
  if (v5)
  {
    v5->_BOOL disableQueueModifications = [v4 decodeBoolForKey:@"disableQueueModifications"];
    v5->_shuffleType = [v4 decodeIntegerForKey:@"shuffleType"];
    v5->_repeatType = [v4 decodeIntegerForKey:@"repeatType"];
    v5->_isPrivate = [v4 decodeBoolForKey:@"private"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MPMusicPlayerQueueDescriptorStartTimes"];
    startTimes = v5->_startTimes;
    v5->_startTimes = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"MPMusicPlayerQueueDescriptorEndTimes"];
    endTimes = v5->_endTimes;
    v5->_endTimes = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    requestingBundleIdentifier = v5->_requestingBundleIdentifier;
    v5->_requestingBundleIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleVersion"];
    requestingBundleVersion = v5->_requestingBundleVersion;
    v5->_requestingBundleVersion = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queueGroupingID"];
    playActivityQueueGroupingID = v5->_playActivityQueueGroupingID;
    v5->_playActivityQueueGroupingID = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureName"];
    playActivityFeatureName = v5->_playActivityFeatureName;
    v5->_playActivityFeatureName = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recommendationData"];
    playActivityRecommendationData = v5->_playActivityRecommendationData;
    v5->_playActivityRecommendationData = (NSData *)v21;

    v5->_prioritizeStartupOverQuality = [v4 decodeBoolForKey:@"prioritizeStartupOverQuality"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t repeatType = self->_repeatType;
    int64_t shuffleType = self->_shuffleType;
    uint64_t v6 = v5[2];
    uint64_t v34 = v5[3];
    int isPrivate = self->_isPrivate;
    int v7 = *((unsigned __int8 *)v5 + 9);
    v8 = (NSDictionary *)v5[9];
    uint64_t v9 = self->_startTimes;
    id v10 = v9;
    if (v9 == v8) {
      LOBYTE(v11) = 0;
    }
    else {
      int v11 = [(NSDictionary *)v9 isEqual:v8] ^ 1;
    }

    uint64_t v13 = (NSDictionary *)v5[10];
    v14 = self->_endTimes;
    uint64_t v15 = v14;
    if (v14 == v13) {
      LOBYTE(v16) = 0;
    }
    else {
      int v16 = [(NSDictionary *)v14 isEqual:v13] ^ 1;
    }

    uint64_t v17 = (NSString *)v5[6];
    v18 = self->_playActivityQueueGroupingID;
    uint64_t v19 = v18;
    if (v18 == v17) {
      LOBYTE(v20) = 0;
    }
    else {
      int v20 = [(NSString *)v18 isEqual:v17] ^ 1;
    }

    uint64_t v21 = (NSString *)v5[7];
    v22 = self->_playActivityFeatureName;
    v23 = v22;
    if (v22 == v21) {
      char v24 = 1;
    }
    else {
      char v24 = [(NSString *)v22 isEqual:v21];
    }

    v25 = (NSData *)v5[8];
    v26 = self->_playActivityRecommendationData;
    v27 = v26;
    if (v26 == v25) {
      char v28 = 1;
    }
    else {
      char v28 = [(NSData *)v26 isEqual:v25];
    }

    if (shuffleType == v6 && repeatType == v34 && isPrivate == v7) {
      char v31 = v11;
    }
    else {
      char v31 = 1;
    }
    char v12 = v24 & ~(v31 | v16 | v20) & v28;
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)_init
{
  v13.receiver = self;
  v13.super_class = (Class)MPMusicPlayerQueueDescriptor;
  v2 = [(MPMusicPlayerQueueDescriptor *)&v13 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_int64_t shuffleType = xmmword_195689850;
    if (_MPMusicPlayerGetBundleInfoPair_onceToken != -1) {
      dispatch_once(&_MPMusicPlayerGetBundleInfoPair_onceToken, &__block_literal_global_20564);
    }
    id v4 = [MEMORY[0x1E4F779D8] pairWithFirst:_MPMusicPlayerGetBundleInfoPair___bundleIdentifier second:_MPMusicPlayerGetBundleInfoPair___bundleVersion];
    uint64_t v5 = [v4 first];
    requestingBundleIdentifier = v3->_requestingBundleIdentifier;
    v3->_requestingBundleIdentifier = (NSString *)v5;

    uint64_t v7 = [v4 second];
    requestingBundleVersion = v3->_requestingBundleVersion;
    v3->_requestingBundleVersion = (NSString *)v7;

    playActivityFeatureName = v3->_playActivityFeatureName;
    v3->_playActivityFeatureName = (NSString *)@"MusicKit";

    playActivityRecommendationData = v3->_playActivityRecommendationData;
    v3->_playActivityRecommendationData = 0;
  }
  v12.receiver = v3;
  v12.super_class = (Class)MPMusicPlayerQueueDescriptor;
  return [(MPMusicPlayerQueueDescriptor *)&v12 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end