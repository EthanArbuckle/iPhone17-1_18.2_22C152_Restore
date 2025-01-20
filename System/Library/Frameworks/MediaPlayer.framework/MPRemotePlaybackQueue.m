@interface MPRemotePlaybackQueue
+ (BOOL)supportsSecureCoding;
+ (id)queueWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3;
+ (id)queueWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4;
- (BOOL)isRequestingImmediatePlayback;
- (BOOL)verifyWithError:(id *)a3;
- (ICUserIdentity)userIdentity;
- (MPRemotePlaybackQueue)init;
- (MPRemotePlaybackQueue)initWithCoder:(id)a3;
- (MPRemotePlaybackQueue)initWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4;
- (NSDictionary)mediaRemoteOptions;
- (NSDictionary)siriWHAMetricsInfo;
- (NSDictionary)userInfo;
- (NSNumber)privateListeningOverride;
- (NSString)featureName;
- (NSString)queueGroupingID;
- (NSString)siriAssetInfo;
- (NSString)siriRecommendationIdentifier;
- (NSString)siriReferenceIdentifier;
- (_MRSystemAppPlaybackQueue)_mediaRemotePlaybackQueue;
- (id)description;
- (int64_t)replaceIntent;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMediaRemoteOptions:(id)a3;
- (void)setReplaceIntent:(int64_t)a3;
- (void)setRequestingImmediatePlayback:(BOOL)a3;
- (void)setSiriRecommendationIdentifier:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation MPRemotePlaybackQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteOptions, 0);
  objc_storeStrong((id *)&self->_queueGroupingID, 0);
  objc_storeStrong((id *)&self->_siriReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_privateListeningOverride, 0);

  objc_storeStrong((id *)&self->_userIdentity, 0);
}

- (void)setMediaRemoteOptions:(id)a3
{
}

- (NSDictionary)mediaRemoteOptions
{
  return self->_mediaRemoteOptions;
}

- (NSString)queueGroupingID
{
  return self->_queueGroupingID;
}

- (NSString)siriReferenceIdentifier
{
  return self->_siriReferenceIdentifier;
}

- (NSNumber)privateListeningOverride
{
  return self->_privateListeningOverride;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (_MRSystemAppPlaybackQueue)_mediaRemotePlaybackQueue
{
  return self->_mediaRemotePlaybackQueue;
}

- (BOOL)verifyWithError:(id *)a3
{
  return 1;
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)MEMORY[0x1F412EA80](self->_mediaRemotePlaybackQueue, a2);
}

- (void)setReplaceIntent:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    uint64_t v3 = a3;
  }
  else {
    uint64_t v3 = 0;
  }
  MEMORY[0x1F412EAE8](self->_mediaRemotePlaybackQueue, v3);
}

- (int64_t)replaceIntent
{
  uint64_t v2 = MRSystemAppPlaybackQueueGetReplaceIntent() - 1;
  if (v2 < 3) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

- (void)setSiriRecommendationIdentifier:(id)a3
{
}

- (NSDictionary)siriWHAMetricsInfo
{
  return (NSDictionary *)MEMORY[0x1F412EA58](self->_mediaRemotePlaybackQueue, a2);
}

- (NSString)featureName
{
  uint64_t v2 = (void *)MRSystemAppPlaybackQueueCopyFeatureName();

  return (NSString *)v2;
}

- (NSString)siriAssetInfo
{
  return (NSString *)MEMORY[0x1F412EA48](self->_mediaRemotePlaybackQueue, a2);
}

- (NSString)siriRecommendationIdentifier
{
  return (NSString *)MEMORY[0x1F412EA50](self->_mediaRemotePlaybackQueue, a2);
}

- (void)setRequestingImmediatePlayback:(BOOL)a3
{
}

- (BOOL)isRequestingImmediatePlayback
{
  return MEMORY[0x1F412EA88](self->_mediaRemotePlaybackQueue, a2);
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  id ExternalRepresentation = (id)MRSystemAppPlaybackQueueCreateExternalRepresentation();
  [v3 encodeObject:ExternalRepresentation forKey:@"queue"];
}

- (MPRemotePlaybackQueue)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queue"];

  if (v5)
  {
    self = [(MPRemotePlaybackQueue *)self initWithMediaRemotePlaybackQueue:MRSystemAppPlaybackQueueCreateFromExternalRepresentation() options:0];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (self->_mediaRemotePlaybackQueue)
  {
    id ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
    id v16 = 0;
    id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:ExternalRepresentation options:0 format:0 error:&v16];
    if (!v4)
    {
      v17 = @"error";
      id v5 = v16;
      uint64_t v6 = objc_msgSend(v5, "msv_description");
      v7 = (void *)v6;
      v8 = @"failed to parse external representation";
      if (v6) {
        v8 = (__CFString *)v6;
      }
      v18[0] = v8;
      id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    }
  }
  else
  {
    id v4 = 0;
  }
  v9 = NSString;
  uint64_t v10 = objc_opt_class();
  v11 = [(MPRemotePlaybackQueue *)self userIdentity];
  v12 = [v11 accountDSID];
  v13 = MPCreateLoggableValueForDSID(v12);
  v14 = [v9 stringWithFormat:@"<%@:%p [%@] siriReferenceIdentifier=%@ privateListeningOverride=%@ mediaRemoteQueueAsDictionary=%@>", v10, self, v13, self->_siriReferenceIdentifier, self->_privateListeningOverride, v4];

  return v14;
}

- (void)dealloc
{
  if (self->_mediaRemotePlaybackQueue) {
    MRSystemAppPlaybackQueueDestroy();
  }
  v3.receiver = self;
  v3.super_class = (Class)MPRemotePlaybackQueue;
  [(MPRemotePlaybackQueue *)&v3 dealloc];
}

- (MPRemotePlaybackQueue)init
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(sel_initWithMediaRemotePlaybackQueue_options_);
  [v3 raise:v4, @"You must provide %@ with a MediaRemote playback queue. Use %@ instead.", v6, v7 format];

  return 0;
}

- (MPRemotePlaybackQueue)initWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)MPRemotePlaybackQueue;
  v8 = [(MPRemotePlaybackQueue *)&v36 init];
  v9 = v8;
  if (v8)
  {
    v8->_mediaRemotePlaybackQueue = a3;
    uint64_t v10 = [v7 valueForKey:*MEMORY[0x1E4F777E0]];
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v12 = objc_opt_class();
      id v37 = 0;
      uint64_t v13 = [v11 unarchivedObjectOfClass:v12 fromData:v10 error:&v37];
      id v14 = v37;
      v15 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      id v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_ERROR, "userIdentityForMediaRemoteOptions -❗️Cannot decode override user identity. Using active account.", buf, 2u);
        }

        [MEMORY[0x1E4FB87B8] activeAccount];
        v13 = id v16 = v13;
      }
      else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        uint64_t v39 = v13;
        _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_DEFAULT, "userIdentityForMediaRemoteOptions - Decoded override user identity: %{private}@.", buf, 0xCu);
      }
    }
    else
    {
      v17 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_DEFAULT, "userIdentityForMediaRemoteOptions - No user identity data. Using active account.", buf, 2u);
      }

      uint64_t v13 = [MEMORY[0x1E4FB87B8] activeAccount];
    }

    userIdentity = v9->_userIdentity;
    v9->_userIdentity = (ICUserIdentity *)v13;

    objc_storeStrong((id *)&v9->_mediaRemoteOptions, a4);
    uint64_t v19 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F77680]];
    siriReferenceIdentifier = v9->_siriReferenceIdentifier;
    v9->_siriReferenceIdentifier = (NSString *)v19;

    v21 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F77750]];
    objc_storeStrong((id *)&v9->_privateListeningOverride, v21);
    if (!v9->_privateListeningOverride
      && +[MPHomeMonitor isCurrentDeviceValidHomeAccessory])
    {
      v22 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F776A8]];
      if (v22)
      {
        v23 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v22];
        if (v23)
        {
          v24 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F77690]];
          v25 = (void *)MEMORY[0x1E4F1CAD0];
          v46[0] = objc_opt_class();
          v46[1] = objc_opt_class();
          v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
          v27 = [v25 setWithArray:v26];

          v28 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v27 fromData:v24 error:0];
          if ([v28 count])
          {
            v35 = v24;
            v29 = +[MPHomeUserMonitor userMonitorWithHomeIdentifier:v23];
            v30 = v29;
            if (v29)
            {
              v31 = [v29 privateListeningEnabledForGroupWithRouteIDs:v28];
              if (v31)
              {
                objc_storeStrong((id *)&v9->_privateListeningOverride, v31);
                v32 = _MPLogCategoryRemoteControl();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  v34 = objc_msgSend(v28, "msv_compactDescription");
                  *(_DWORD *)buf = 138544130;
                  uint64_t v39 = (uint64_t)v9;
                  __int16 v40 = 2114;
                  v41 = v22;
                  __int16 v42 = 2114;
                  v43 = v34;
                  __int16 v44 = 2114;
                  v45 = v31;
                  _os_log_impl(&dword_1952E8000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Applying HomeKit private listening override: homeKitUserID=%{public}@ destinationUIDs=%{public}@ privateListeningOverride=%{public}@", buf, 0x2Au);
                }
              }
            }
            v24 = v35;
          }
        }
      }
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)queueWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"MPRemotePlaybackQueue.m", 75, @"Invalid parameter not satisfying: %@", @"mrQueue" object file lineNumber description];
  }
  unsigned int Type = MRSystemAppPlaybackQueueGetType();
  if (Type <= 8 && ((0x1EFu >> Type) & 1) != 0) {
    v9 = (objc_class *)objc_opt_class();
  }
  else {
    v9 = 0;
  }
  uint64_t v10 = (void *)[[v9 alloc] initWithMediaRemotePlaybackQueue:a3 options:v7];

  return v10;
}

+ (id)queueWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3
{
  uint64_t v4 = objc_opt_class();

  return (id)[v4 queueWithMediaRemotePlaybackQueue:a3 options:0];
}

@end