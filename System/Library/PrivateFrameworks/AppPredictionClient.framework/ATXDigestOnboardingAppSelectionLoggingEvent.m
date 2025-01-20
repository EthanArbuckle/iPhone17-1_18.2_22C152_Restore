@interface ATXDigestOnboardingAppSelectionLoggingEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXDigestOnboardingAppSelectionLoggingEvent)initWithProto:(id)a3;
- (ATXDigestOnboardingAppSelectionLoggingEvent)initWithProtoData:(id)a3;
- (ATXDigestOnboardingAppSelectionLoggingEvent)initWithSessionUUID:(id)a3 bundleId:(id)a4 avgNumBasicNotifications:(unint64_t)a5 avgNumMessageNotifications:(unint64_t)a6 avgNumTimeSensitiveNonMessageNotifications:(unint64_t)a7 rank:(unint64_t)a8 addedToDigest:(BOOL)a9 wasShownInDigestOnboarding:(BOOL)a10;
- (BOOL)addedToDigest;
- (BOOL)wasShownInDigestOnboarding;
- (NSString)bundleId;
- (NSUUID)sessionUUID;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)avgNumBasicNotifications;
- (unint64_t)avgNumMessageNotfications;
- (unint64_t)avgNumTimeSensitiveNonMessageNotifications;
- (unint64_t)rank;
- (unsigned)dataVersion;
@end

@implementation ATXDigestOnboardingAppSelectionLoggingEvent

- (ATXDigestOnboardingAppSelectionLoggingEvent)initWithSessionUUID:(id)a3 bundleId:(id)a4 avgNumBasicNotifications:(unint64_t)a5 avgNumMessageNotifications:(unint64_t)a6 avgNumTimeSensitiveNonMessageNotifications:(unint64_t)a7 rank:(unint64_t)a8 addedToDigest:(BOOL)a9 wasShownInDigestOnboarding:(BOOL)a10
{
  id v17 = a3;
  id v18 = a4;
  v22.receiver = self;
  v22.super_class = (Class)ATXDigestOnboardingAppSelectionLoggingEvent;
  v19 = [(ATXDigestOnboardingAppSelectionLoggingEvent *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_sessionUUID, a3);
    objc_storeStrong((id *)&v20->_bundleId, a4);
    v20->_avgNumBasicNotifications = a5;
    v20->_avgNumMessageNotfications = a6;
    v20->_avgNumTimeSensitiveNonMessageNotifications = a7;
    v20->_rank = a8;
    v20->_addedToDigest = a9;
    v20->_wasShownInDigestOnboarding = a10;
  }

  return v20;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (ATXDigestOnboardingAppSelectionLoggingEvent)initWithProtoData:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBDigestOnboardingAppSelectionLoggingEvent alloc] initWithData:v4];

  v6 = [(ATXDigestOnboardingAppSelectionLoggingEvent *)self initWithProto:v5];
  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXDigestOnboardingAppSelectionLoggingEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXDigestOnboardingAppSelectionLoggingEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[ATXDigestTimeline initWithProto:]((uint64_t)self, v17);
    }

    goto LABEL_7;
  }
  id v5 = (objc_class *)MEMORY[0x1E4F29128];
  id v6 = v4;
  id v7 = [v5 alloc];
  v8 = [v6 sessionUUID];
  v9 = (void *)[v7 initWithUUIDString:v8];

  v10 = [v6 bundleId];
  uint64_t v20 = [v6 avgNumBasicNotifications];
  uint64_t v11 = [v6 avgNumMessageNotifications];
  uint64_t v12 = [v6 avgNumTimeSensitiveNonMessageNotifications];
  uint64_t v13 = [v6 rank];
  char v14 = [v6 addedToDigest];
  char v15 = [v6 wasShownInDigestOnboarding];

  BYTE1(v19) = v15;
  LOBYTE(v19) = v14;
  self = -[ATXDigestOnboardingAppSelectionLoggingEvent initWithSessionUUID:bundleId:avgNumBasicNotifications:avgNumMessageNotifications:avgNumTimeSensitiveNonMessageNotifications:rank:addedToDigest:wasShownInDigestOnboarding:](self, "initWithSessionUUID:bundleId:avgNumBasicNotifications:avgNumMessageNotifications:avgNumTimeSensitiveNonMessageNotifications:rank:addedToDigest:wasShownInDigestOnboarding:", v9, v10, v20, v11, v12, v13, v19);

  v16 = self;
LABEL_8:

  return v16;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(NSUUID *)self->_sessionUUID UUIDString];
  [v3 setSessionUUID:v4];

  [v3 setBundleId:self->_bundleId];
  [v3 setAvgNumBasicNotifications:LODWORD(self->_avgNumBasicNotifications)];
  [v3 setAvgNumMessageNotifications:LODWORD(self->_avgNumMessageNotfications)];
  [v3 setAvgNumTimeSensitiveNonMessageNotifications:LODWORD(self->_avgNumTimeSensitiveNonMessageNotifications)];
  [v3 setRank:LODWORD(self->_rank)];
  [v3 setAddedToDigest:self->_addedToDigest];
  [v3 setWasShownInDigestOnboarding:self->_wasShownInDigestOnboarding];

  return v3;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (unint64_t)avgNumBasicNotifications
{
  return self->_avgNumBasicNotifications;
}

- (unint64_t)avgNumMessageNotfications
{
  return self->_avgNumMessageNotfications;
}

- (unint64_t)avgNumTimeSensitiveNonMessageNotifications
{
  return self->_avgNumTimeSensitiveNonMessageNotifications;
}

- (unint64_t)rank
{
  return self->_rank;
}

- (BOOL)addedToDigest
{
  return self->_addedToDigest;
}

- (BOOL)wasShownInDigestOnboarding
{
  return self->_wasShownInDigestOnboarding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);

  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end