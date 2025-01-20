@interface MPPlaybackContext
+ (BOOL)supportsAutoPlay;
+ (BOOL)supportsSecureCoding;
- (BOOL)containsRestorableContent;
- (BOOL)isReusableForPlaybackContext:(id)a3;
- (BOOL)isSupported;
- (BOOL)shouldBecomeActive;
- (Class)queueFeederClass;
- (ICUserIdentity)userIdentity;
- (MPMusicPlayerQueueDescriptor)queueDescriptor;
- (MPPlaybackContext)init;
- (MPPlaybackContext)initWithCoder:(id)a3;
- (NSData)playActivityRecommendationData;
- (NSDictionary)siriWHAMetricsInfo;
- (NSNumber)privateListeningOverride;
- (NSString)associatedParticipantIdentifier;
- (NSString)overrideSILSectionID;
- (NSString)playActivityFeatureName;
- (NSString)playActivityQueueGroupingID;
- (NSString)sessionIdentifier;
- (NSString)siriAssetInfo;
- (NSString)siriReferenceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionComponents;
- (int64_t)actionAfterQueueLoad;
- (int64_t)queueEndAction;
- (int64_t)repeatType;
- (int64_t)shuffleType;
- (void)encodeWithCoder:(id)a3;
- (void)setActionAfterQueueLoad:(int64_t)a3;
- (void)setAssociatedParticipantIdentifier:(id)a3;
- (void)setOverrideSILSectionID:(id)a3;
- (void)setPlayActivityFeatureName:(id)a3;
- (void)setPlayActivityQueueGroupingID:(id)a3;
- (void)setPlayActivityRecommendationData:(id)a3;
- (void)setPrivateListeningOverride:(id)a3;
- (void)setQueueDescriptor:(id)a3;
- (void)setQueueEndAction:(int64_t)a3;
- (void)setRepeatType:(int64_t)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setShuffleType:(int64_t)a3;
- (void)setSiriAssetInfo:(id)a3;
- (void)setSiriReferenceIdentifier:(id)a3;
- (void)setSiriWHAMetricsInfo:(id)a3;
- (void)setUserIdentity:(id)a3;
@end

@implementation MPPlaybackContext

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  objc_msgSend(v4, "setActionAfterQueueLoad:", -[MPPlaybackContext actionAfterQueueLoad](self, "actionAfterQueueLoad"));
  objc_msgSend(v4, "setShuffleType:", -[MPPlaybackContext shuffleType](self, "shuffleType"));
  objc_msgSend(v4, "setRepeatType:", -[MPPlaybackContext repeatType](self, "repeatType"));
  objc_msgSend(v4, "setQueueEndAction:", -[MPPlaybackContext queueEndAction](self, "queueEndAction"));
  v5 = [(MPPlaybackContext *)self playActivityQueueGroupingID];
  [v4 setPlayActivityQueueGroupingID:v5];

  v6 = [(MPPlaybackContext *)self playActivityFeatureName];
  [v4 setPlayActivityFeatureName:v6];

  v7 = [(MPPlaybackContext *)self playActivityRecommendationData];
  [v4 setPlayActivityRecommendationData:v7];

  v8 = [(MPPlaybackContext *)self queueDescriptor];
  [v4 setQueueDescriptor:v8];

  v9 = [(MPPlaybackContext *)self siriAssetInfo];
  [v4 setSiriAssetInfo:v9];

  v10 = [(MPPlaybackContext *)self siriReferenceIdentifier];
  [v4 setSiriReferenceIdentifier:v10];

  v11 = [(MPPlaybackContext *)self siriWHAMetricsInfo];
  [v4 setSiriWHAMetricsInfo:v11];

  v12 = [(MPPlaybackContext *)self sessionIdentifier];
  [v4 setSessionIdentifier:v12];

  v13 = [(MPPlaybackContext *)self overrideSILSectionID];
  [v4 setOverrideSILSectionID:v13];

  v14 = [(MPPlaybackContext *)self associatedParticipantIdentifier];
  [v4 setAssociatedParticipantIdentifier:v14];

  return v4;
}

- (id)descriptionComponents
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:6];
  v4 = NSString;
  v5 = MPNSStringFromRepeatType([(MPPlaybackContext *)self repeatType]);
  v6 = MPNSStringFromShuffleType([(MPPlaybackContext *)self shuffleType]);
  v7 = [v4 stringWithFormat:@"%@/%@", v5, v6];
  [v3 setObject:v7 forKeyedSubscript:@"repeat/shuffle"];

  v8 = MPNSStringFromQueueEndAction(self->_queueEndAction, 0);
  [v3 setObject:v8 forKeyedSubscript:@"queueEndAction"];

  int64_t actionAfterQueueLoad = self->_actionAfterQueueLoad;
  v10 = @"PrepareToPlay";
  v11 = @"None";
  if (actionAfterQueueLoad) {
    v11 = 0;
  }
  if (actionAfterQueueLoad != 10) {
    v10 = v11;
  }
  if (actionAfterQueueLoad == 20) {
    v12 = @"Play";
  }
  else {
    v12 = v10;
  }
  v13 = v12;
  [v3 setObject:v13 forKeyedSubscript:@"actionAfterQueueLoad"];

  [v3 setObject:self->_overrideSILSectionID forKeyedSubscript:@"overrideSILSectionID"];
  v14 = [NSString stringWithFormat:@"'%@'", self->_playActivityFeatureName];
  [v3 setObject:v14 forKeyedSubscript:@"featureName"];

  [v3 setObject:self->_associatedParticipantIdentifier forKeyedSubscript:@"associatedParticipantID"];
  int64_t v15 = self->_actionAfterQueueLoad;
  if (v15)
  {
    v16 = @"PrepareToPlay";
    if (v15 != 10) {
      v16 = 0;
    }
    if (v15 == 20) {
      v17 = @"Play";
    }
    else {
      v17 = v16;
    }
    v18 = v17;
    [v3 setObject:v18 forKeyedSubscript:@"actionAfterQueueLoad"];
  }
  if ([(NSString *)self->_siriAssetInfo length]) {
    [v3 setObject:@"YES" forKeyedSubscript:@"siriAssetInfo"];
  }
  if ([(NSString *)self->_sessionIdentifier length]) {
    [v3 setObject:@"YES" forKeyedSubscript:@"sessionIdentifier"];
  }
  queueDescriptor = self->_queueDescriptor;
  if (queueDescriptor) {
    [v3 setObject:queueDescriptor forKeyedSubscript:@"queueDescriptor"];
  }

  return v3;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (int64_t)repeatType
{
  return self->_repeatType;
}

- (MPMusicPlayerQueueDescriptor)queueDescriptor
{
  return self->_queueDescriptor;
}

- (NSString)associatedParticipantIdentifier
{
  return self->_associatedParticipantIdentifier;
}

- (NSString)siriReferenceIdentifier
{
  return self->_siriReferenceIdentifier;
}

- (NSDictionary)siriWHAMetricsInfo
{
  return self->_siriWHAMetricsInfo;
}

- (NSData)playActivityRecommendationData
{
  return self->_playActivityRecommendationData;
}

- (NSString)playActivityQueueGroupingID
{
  return self->_playActivityQueueGroupingID;
}

- (NSString)playActivityFeatureName
{
  return self->_playActivityFeatureName;
}

- (NSString)siriAssetInfo
{
  return self->_siriAssetInfo;
}

- (void)setShuffleType:(int64_t)a3
{
  self->_shuffleType = a3;
}

- (NSString)overrideSILSectionID
{
  return self->_overrideSILSectionID;
}

- (void)setSiriWHAMetricsInfo:(id)a3
{
}

- (void)setSiriReferenceIdentifier:(id)a3
{
}

- (void)setSiriAssetInfo:(id)a3
{
}

- (void)setSessionIdentifier:(id)a3
{
}

- (void)setRepeatType:(int64_t)a3
{
  self->_repeatType = a3;
}

- (void)setQueueEndAction:(int64_t)a3
{
  self->_queueEndAction = a3;
}

- (void)setQueueDescriptor:(id)a3
{
}

- (void)setPlayActivityRecommendationData:(id)a3
{
}

- (void)setPlayActivityQueueGroupingID:(id)a3
{
}

- (void)setPlayActivityFeatureName:(id)a3
{
}

- (void)setOverrideSILSectionID:(id)a3
{
}

- (void)setAssociatedParticipantIdentifier:(id)a3
{
}

- (void)setActionAfterQueueLoad:(int64_t)a3
{
  self->_int64_t actionAfterQueueLoad = a3;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (int64_t)queueEndAction
{
  return self->_queueEndAction;
}

- (int64_t)actionAfterQueueLoad
{
  return self->_actionAfterQueueLoad;
}

- (NSNumber)privateListeningOverride
{
  return self->_privateListeningOverride;
}

- (MPPlaybackContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPPlaybackContext;
  v5 = [(MPPlaybackContext *)&v15 init];
  if (v5)
  {
    v5->_shuffleType = [v4 decodeIntegerForKey:@"MPPlaybackContextShuffleType"];
    v5->_repeatType = [v4 decodeIntegerForKey:@"MPPlaybackContextRepeatType"];
    v5->_queueEndAction = [v4 decodeIntegerForKey:@"MPPlaybackContextQueueEndAction"];
    v5->_int64_t actionAfterQueueLoad = [v4 decodeIntegerForKey:@"MPPlaybackContextActionAfterQueueLoad"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPPlaybackContextPlayActionQueueGroupingID"];
    playActivityQueueGroupingID = v5->_playActivityQueueGroupingID;
    v5->_playActivityQueueGroupingID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPPlaybackContextPlayActivityFeatureName"];
    playActivityFeatureName = v5->_playActivityFeatureName;
    v5->_playActivityFeatureName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPPlaybackContextPlayActivityRecommendationData"];
    playActivityRecommendationData = v5->_playActivityRecommendationData;
    v5->_playActivityRecommendationData = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPPlaybackContextAssociatedParticipantIdentifier"];
    associatedParticipantIdentifier = v5->_associatedParticipantIdentifier;
    v5->_associatedParticipantIdentifier = (NSString *)v12;
  }
  return v5;
}

- (id)description
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p", v5, self];

  v7 = [(MPPlaybackContext *)self descriptionComponents];
  uint64_t v8 = [v7 allKeys];
  v9 = [v8 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        objc_super v15 = [v7 objectForKeyedSubscript:v14];
        v16 = [MEMORY[0x1E4F1CA98] null];
        if (v15 == v16)
        {
          v17 = 0;
        }
        else
        {
          v17 = [v7 objectForKeyedSubscript:v14];
        }

        [v6 appendFormat:@" %@=%@", v14, v17];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  [v6 appendString:@">"];
  v18 = (void *)[v6 copy];

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideSILSectionID, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_siriWHAMetricsInfo, 0);
  objc_storeStrong((id *)&self->_siriReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_siriAssetInfo, 0);
  objc_storeStrong((id *)&self->_queueDescriptor, 0);
  objc_storeStrong((id *)&self->_playActivityRecommendationData, 0);
  objc_storeStrong((id *)&self->_playActivityFeatureName, 0);
  objc_storeStrong((id *)&self->_playActivityQueueGroupingID, 0);
  objc_storeStrong((id *)&self->_associatedParticipantIdentifier, 0);
  objc_storeStrong((id *)&self->_privateListeningOverride, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);

  objc_storeStrong((id *)&self->_playerCurrentItem, 0);
}

- (void)setPrivateListeningOverride:(id)a3
{
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (BOOL)isReusableForPlaybackContext:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_30;
  }
  if (-[MPPlaybackContext repeatType](self, "repeatType") == 3 || [v4 repeatType] == 3)
  {
    BOOL v5 = 1;
  }
  else
  {
    int64_t v6 = [(MPPlaybackContext *)self repeatType];
    BOOL v5 = v6 == [v4 repeatType];
  }
  if ([(MPPlaybackContext *)self shuffleType] == 1000)
  {
    BOOL v7 = v5;
  }
  else
  {
    uint64_t v8 = [v4 shuffleType];
    BOOL v7 = v8 == 1000 && v5;
    if (v8 != 1000 && v5)
    {
      int64_t v9 = [(MPPlaybackContext *)self shuffleType];
      BOOL v7 = v9 == [v4 shuffleType];
    }
  }
  if ([(MPPlaybackContext *)self queueEndAction] == 1000)
  {
    int v10 = v7;
    goto LABEL_16;
  }
  uint64_t v11 = [v4 queueEndAction];
  int v10 = v11 == 1000 && v7;
  if (v11 == 1000 || !v7)
  {
LABEL_16:
    if (!v10) {
      goto LABEL_30;
    }
    goto LABEL_24;
  }
  int64_t v12 = [(MPPlaybackContext *)self queueEndAction];
  if (v12 != [v4 queueEndAction])
  {
LABEL_30:
    char v21 = 0;
    goto LABEL_31;
  }
LABEL_24:
  id v13 = [(MPPlaybackContext *)self playActivityFeatureName];
  id v14 = [v4 playActivityFeatureName];
  if (v13 == v14)
  {
  }
  else
  {
    objc_super v15 = v14;
    char v16 = [v13 isEqual:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_30;
    }
  }
  id v17 = [(MPPlaybackContext *)self sessionIdentifier];
  id v18 = [v4 sessionIdentifier];
  if (v17 == v18)
  {
  }
  else
  {
    v19 = v18;
    char v20 = [v17 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_30;
    }
  }
  long long v23 = [(MPPlaybackContext *)self overrideSILSectionID];
  long long v24 = [v4 overrideSILSectionID];
  if (v23 == v24) {
    char v21 = 1;
  }
  else {
    char v21 = [v23 isEqual:v24];
  }

LABEL_31:
  return v21;
}

- (BOOL)isSupported
{
  return 1;
}

- (BOOL)containsRestorableContent
{
  v2 = objc_opt_class();

  return [v2 supportsSecureCoding];
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeInteger:self->_shuffleType forKey:@"MPPlaybackContextShuffleType"];
  [v7 encodeInteger:self->_repeatType forKey:@"MPPlaybackContextRepeatType"];
  [v7 encodeInteger:self->_queueEndAction forKey:@"MPPlaybackContextQueueEndAction"];
  [v7 encodeInteger:self->_actionAfterQueueLoad forKey:@"MPPlaybackContextActionAfterQueueLoad"];
  [v7 encodeObject:self->_playActivityQueueGroupingID forKey:@"MPPlaybackContextPlayActionQueueGroupingID"];
  [v7 encodeObject:self->_playActivityFeatureName forKey:@"MPPlaybackContextPlayActivityFeatureName"];
  [v7 encodeObject:self->_playActivityRecommendationData forKey:@"MPPlaybackContextPlayActivityRecommendationData"];
  id v4 = objc_msgSend(v7, "msv_userInfo");
  BOOL v5 = [v4 objectForKeyedSubscript:@"supplementalReason"];
  uint64_t v6 = [v5 integerValue];

  if (v6 == 1) {
    [v7 encodeObject:self->_associatedParticipantIdentifier forKey:@"MPPlaybackContextAssociatedParticipantIdentifier"];
  }
}

- (void)setUserIdentity:(id)a3
{
  id v4 = (ICUserIdentity *)a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4FB87B8] activeAccount];
  }
  userIdentity = self->_userIdentity;
  self->_userIdentity = v4;
}

- (BOOL)shouldBecomeActive
{
  int64_t actionAfterQueueLoad = self->_actionAfterQueueLoad;
  return actionAfterQueueLoad == 10 || actionAfterQueueLoad == 20;
}

- (MPPlaybackContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)MPPlaybackContext;
  result = [(MPPlaybackContext *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_int64_t actionAfterQueueLoad = xmmword_195689800;
    *(_OWORD *)&result->_repeatType = xmmword_1956897F0;
  }
  return result;
}

- (Class)queueFeederClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsAutoPlay
{
  return 0;
}

@end