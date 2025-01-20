@interface HMDCloudSyncUploadReasonLogEvent
+ (id)uploadReason:(id)a3 acceptedHomeManagerZonePush:(BOOL)a4;
+ (id)uploadReason:(id)a3 acceptedHomeZonePush:(BOOL)a4;
+ (id)uploadReason:(id)a3 acceptedLegacyPush:(BOOL)a4;
- (HMDCloudSyncUploadReasonLogEvent)initWithUploadReason:(id)a3 legacyPushCount:(int64_t)a4 homeZonePushCount:(int64_t)a5 homeManagerPushCount:(int64_t)a6;
- (NSString)saveReason;
- (int64_t)homeManagerPushCount;
- (int64_t)homeZonePushCount;
- (int64_t)legacyPushCount;
@end

@implementation HMDCloudSyncUploadReasonLogEvent

- (void).cxx_destruct
{
}

- (NSString)saveReason
{
  return self->_saveReason;
}

- (int64_t)homeManagerPushCount
{
  return self->_homeManagerPushCount;
}

- (int64_t)homeZonePushCount
{
  return self->_homeZonePushCount;
}

- (int64_t)legacyPushCount
{
  return self->_legacyPushCount;
}

- (HMDCloudSyncUploadReasonLogEvent)initWithUploadReason:(id)a3 legacyPushCount:(int64_t)a4 homeZonePushCount:(int64_t)a5 homeManagerPushCount:(int64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDCloudSyncUploadReasonLogEvent;
  v12 = [(HMMLogEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_saveReason, a3);
    v13->_legacyPushCount = a4;
    v13->_homeZonePushCount = a5;
    v13->_homeManagerPushCount = a6;
  }

  return v13;
}

+ (id)uploadReason:(id)a3 acceptedHomeManagerZonePush:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [HMDCloudSyncUploadReasonLogEvent alloc];
  if (v4) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = -1;
  }
  v8 = [(HMDCloudSyncUploadReasonLogEvent *)v6 initWithUploadReason:v5 legacyPushCount:0 homeZonePushCount:0 homeManagerPushCount:v7];

  return v8;
}

+ (id)uploadReason:(id)a3 acceptedHomeZonePush:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [HMDCloudSyncUploadReasonLogEvent alloc];
  if (v4) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = -1;
  }
  v8 = [(HMDCloudSyncUploadReasonLogEvent *)v6 initWithUploadReason:v5 legacyPushCount:0 homeZonePushCount:v7 homeManagerPushCount:0];

  return v8;
}

+ (id)uploadReason:(id)a3 acceptedLegacyPush:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [HMDCloudSyncUploadReasonLogEvent alloc];
  if (v4) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = -1;
  }
  v8 = [(HMDCloudSyncUploadReasonLogEvent *)v6 initWithUploadReason:v5 legacyPushCount:v7 homeZonePushCount:0 homeManagerPushCount:0];

  return v8;
}

@end