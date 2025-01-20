@interface ATXNotificationDeliverySuggestion
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXNotificationDeliverySuggestion)initWithCoder:(id)a3;
- (ATXNotificationDeliverySuggestion)initWithInterruptionManagerTuningSuggestion:(id)a3 scope:(int64_t)a4 entityIdentifier:(id)a5 uuid:(id)a6 timestamp:(id)a7 triggerNotificationUUID:(id)a8;
- (ATXNotificationDeliverySuggestion)initWithProto:(id)a3;
- (ATXNotificationDeliverySuggestion)initWithProtoData:(id)a3;
- (ATXNotificationDeliverySuggestion)initWithSmartPauseSuggestion:(id)a3 uuid:(id)a4 scope:(int64_t)a5 entityIdentifier:(id)a6 timestamp:(id)a7 triggerNotificationUUID:(id)a8;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXNotificationDeliverySuggestion:(id)a3;
- (NSDate)timestamp;
- (NSString)description;
- (NSString)entityIdentifier;
- (NSUUID)triggerNotificationUUID;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProto;
- (id)initPromotingSuggestionWithUUID:(id)a3 scope:(int64_t)a4 entityIdentifier:(id)a5 timestamp:(id)a6 triggerNotificationUUID:(id)a7;
- (id)initQuietingSuggestionWithUUID:(id)a3 scope:(int64_t)a4 entityIdentifier:(id)a5 timestamp:(id)a6 triggerNotificationUUID:(id)a7;
- (id)initSendToDigestSuggestionWithUUID:(id)a3 bundleID:(id)a4 timestamp:(id)a5 triggerNotificationUUID:(id)a6;
- (id)initSendToMessagesDigestSuggestionWithUUID:(id)a3 bundleID:(id)a4 timestamp:(id)a5 triggerNotificationUUID:(id)a6;
- (id)initTurnOffNotificationsForAppSuggestionWithUUID:(id)a3 bundleID:(id)a4 timestamp:(id)a5 triggerNotificationUUID:(id)a6;
- (id)initUrgencyTuningSuggestionWithUUID:(id)a3 bundleID:(id)a4 timestamp:(id)a5 triggerNotificationUUID:(id)a6;
- (id)json;
- (id)jsonRawData;
- (id)proto;
- (id)subObject;
- (int64_t)scope;
- (int64_t)subtype;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)proto;
- (void)setScope:(int64_t)a3;
- (void)setTriggerNotificationUUID:(id)a3;
@end

@implementation ATXNotificationDeliverySuggestion

- (ATXNotificationDeliverySuggestion)initWithSmartPauseSuggestion:(id)a3 uuid:(id)a4 scope:(int64_t)a5 entityIdentifier:(id)a6 timestamp:(id)a7 triggerNotificationUUID:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)ATXNotificationDeliverySuggestion;
  v20 = [(ATXNotificationDeliverySuggestion *)&v28 init];
  if (v20)
  {
    uint64_t v21 = [v16 copy];
    uuid = v20->_uuid;
    v20->_uuid = (NSUUID *)v21;

    v20->_scope = a5;
    uint64_t v23 = [v17 copy];
    entityIdentifier = v20->_entityIdentifier;
    v20->_entityIdentifier = (NSString *)v23;

    objc_storeStrong((id *)&v20->_timestamp, a7);
    uint64_t v25 = [v19 copy];
    triggerNotificationUUID = v20->_triggerNotificationUUID;
    v20->_triggerNotificationUUID = (NSUUID *)v25;

    v20->_subtype = 4;
    objc_storeStrong(&v20->_subObject, a3);
  }

  return v20;
}

- (id)initQuietingSuggestionWithUUID:(id)a3 scope:(int64_t)a4 entityIdentifier:(id)a5 timestamp:(id)a6 triggerNotificationUUID:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)ATXNotificationDeliverySuggestion;
  id v16 = [(ATXNotificationDeliverySuggestion *)&v25 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    uuid = v16->_uuid;
    v16->_uuid = (NSUUID *)v17;

    v16->_scope = a4;
    uint64_t v19 = [v13 copy];
    entityIdentifier = v16->_entityIdentifier;
    v16->_entityIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v16->_timestamp, a6);
    uint64_t v21 = [v15 copy];
    triggerNotificationUUID = v16->_triggerNotificationUUID;
    v16->_triggerNotificationUUID = (NSUUID *)v21;

    id subObject = v16->_subObject;
    v16->_subtype = 1;
    v16->_id subObject = 0;
  }
  return v16;
}

- (id)initPromotingSuggestionWithUUID:(id)a3 scope:(int64_t)a4 entityIdentifier:(id)a5 timestamp:(id)a6 triggerNotificationUUID:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)ATXNotificationDeliverySuggestion;
  id v16 = [(ATXNotificationDeliverySuggestion *)&v25 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    uuid = v16->_uuid;
    v16->_uuid = (NSUUID *)v17;

    v16->_scope = a4;
    uint64_t v19 = [v13 copy];
    entityIdentifier = v16->_entityIdentifier;
    v16->_entityIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v16->_timestamp, a6);
    uint64_t v21 = [v15 copy];
    triggerNotificationUUID = v16->_triggerNotificationUUID;
    v16->_triggerNotificationUUID = (NSUUID *)v21;

    id subObject = v16->_subObject;
    v16->_subtype = 2;
    v16->_id subObject = 0;
  }
  return v16;
}

- (ATXNotificationDeliverySuggestion)initWithInterruptionManagerTuningSuggestion:(id)a3 scope:(int64_t)a4 entityIdentifier:(id)a5 uuid:(id)a6 timestamp:(id)a7 triggerNotificationUUID:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)ATXNotificationDeliverySuggestion;
  v20 = [(ATXNotificationDeliverySuggestion *)&v28 init];
  if (v20)
  {
    uint64_t v21 = [v17 copy];
    uuid = v20->_uuid;
    v20->_uuid = (NSUUID *)v21;

    v20->_scope = a4;
    uint64_t v23 = [v16 copy];
    entityIdentifier = v20->_entityIdentifier;
    v20->_entityIdentifier = (NSString *)v23;

    objc_storeStrong((id *)&v20->_timestamp, a7);
    uint64_t v25 = [v19 copy];
    triggerNotificationUUID = v20->_triggerNotificationUUID;
    v20->_triggerNotificationUUID = (NSUUID *)v25;

    v20->_subtype = 5;
    objc_storeStrong(&v20->_subObject, a3);
  }

  return v20;
}

- (id)initSendToDigestSuggestionWithUUID:(id)a3 bundleID:(id)a4 timestamp:(id)a5 triggerNotificationUUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXNotificationDeliverySuggestion;
  id v14 = [(ATXNotificationDeliverySuggestion *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    v14->_scope = 1;
    uint64_t v17 = [v11 copy];
    entityIdentifier = v14->_entityIdentifier;
    v14->_entityIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v14->_timestamp, a5);
    uint64_t v19 = [v13 copy];
    triggerNotificationUUID = v14->_triggerNotificationUUID;
    v14->_triggerNotificationUUID = (NSUUID *)v19;

    v14->_subtype = 6;
    uint64_t v21 = objc_opt_new();
    id subObject = v14->_subObject;
    v14->_id subObject = (id)v21;
  }
  return v14;
}

- (id)initSendToMessagesDigestSuggestionWithUUID:(id)a3 bundleID:(id)a4 timestamp:(id)a5 triggerNotificationUUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXNotificationDeliverySuggestion;
  id v14 = [(ATXNotificationDeliverySuggestion *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    v14->_scope = 1;
    uint64_t v17 = [v11 copy];
    entityIdentifier = v14->_entityIdentifier;
    v14->_entityIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v14->_timestamp, a5);
    uint64_t v19 = [v13 copy];
    triggerNotificationUUID = v14->_triggerNotificationUUID;
    v14->_triggerNotificationUUID = (NSUUID *)v19;

    v14->_subtype = 8;
    uint64_t v21 = objc_opt_new();
    id subObject = v14->_subObject;
    v14->_id subObject = (id)v21;
  }
  return v14;
}

- (id)initUrgencyTuningSuggestionWithUUID:(id)a3 bundleID:(id)a4 timestamp:(id)a5 triggerNotificationUUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXNotificationDeliverySuggestion;
  id v14 = [(ATXNotificationDeliverySuggestion *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    v14->_scope = 1;
    uint64_t v17 = [v11 copy];
    entityIdentifier = v14->_entityIdentifier;
    v14->_entityIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v14->_timestamp, a5);
    uint64_t v19 = [v13 copy];
    triggerNotificationUUID = v14->_triggerNotificationUUID;
    v14->_triggerNotificationUUID = (NSUUID *)v19;

    v14->_subtype = 7;
    uint64_t v21 = objc_opt_new();
    id subObject = v14->_subObject;
    v14->_id subObject = (id)v21;
  }
  return v14;
}

- (id)initTurnOffNotificationsForAppSuggestionWithUUID:(id)a3 bundleID:(id)a4 timestamp:(id)a5 triggerNotificationUUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)ATXNotificationDeliverySuggestion;
  id v14 = [(ATXNotificationDeliverySuggestion *)&v26 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    v14->_scope = 1;
    uint64_t v17 = [v11 copy];
    entityIdentifier = v14->_entityIdentifier;
    v14->_entityIdentifier = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    timestamp = v14->_timestamp;
    v14->_timestamp = (NSDate *)v19;

    uint64_t v21 = [v13 copy];
    triggerNotificationUUID = v14->_triggerNotificationUUID;
    v14->_triggerNotificationUUID = (NSUUID *)v21;

    v14->_subtype = 9;
    uint64_t v23 = objc_opt_new();
    id subObject = v14->_subObject;
    v14->_id subObject = (id)v23;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXNotificationDeliverySuggestion *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXNotificationDeliverySuggestion *)self isEqualToATXNotificationDeliverySuggestion:v5];

  return v6;
}

- (BOOL)isEqualToATXNotificationDeliverySuggestion:(id)a3
{
  v4 = (id *)a3;
  uuid = self->_uuid;
  BOOL v6 = (NSUUID *)v4[1];
  if (uuid == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = uuid;
    char v9 = [(NSUUID *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_21;
    }
  }
  if (self->_scope != v4[4]) {
    goto LABEL_21;
  }
  entityIdentifier = self->_entityIdentifier;
  id v11 = (NSString *)v4[5];
  if (entityIdentifier == v11)
  {
  }
  else
  {
    id v12 = v11;
    id v13 = entityIdentifier;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_21;
    }
  }
  timestamp = self->_timestamp;
  id v16 = (NSDate *)v4[2];
  if (timestamp == v16)
  {
  }
  else
  {
    uint64_t v17 = v16;
    id v18 = timestamp;
    char v19 = [(NSDate *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_21;
    }
  }
  triggerNotificationUUID = self->_triggerNotificationUUID;
  uint64_t v21 = (NSUUID *)v4[3];
  if (triggerNotificationUUID == v21)
  {
  }
  else
  {
    v22 = v21;
    uint64_t v23 = triggerNotificationUUID;
    char v24 = [(NSUUID *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_21;
    }
  }
  if (self->_subtype != v4[6])
  {
LABEL_21:
    char v27 = 0;
    goto LABEL_22;
  }
  id v25 = self->_subObject;
  objc_super v26 = v25;
  if (v25 == v4[7]) {
    char v27 = 1;
  }
  else {
    char v27 = objc_msgSend(v25, "isEqual:");
  }

LABEL_22:
  return v27;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_uuid hash];
  int64_t v4 = self->_scope - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_entityIdentifier hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSDate *)self->_timestamp hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSUUID *)self->_triggerNotificationUUID hash];
  int64_t subtype = self->_subtype;
  unint64_t v9 = subtype - (v7 - v6 + 32 * v6) + 32 * (v7 - v6 + 32 * v6);
  if (subtype == 4)
  {
    unint64_t v9 = [self->_subObject hash] - v9 + 32 * v9;
    int64_t subtype = self->_subtype;
  }
  if (subtype == 5) {
    return [self->_subObject hash] - v9 + 32 * v9;
  }
  return v9;
}

- (NSString)description
{
  if ((self->_subtype & 0xFFFFFFFFFFFFFFFELL) == 4) {
    id v3 = self->_subObject;
  }
  else {
    id v3 = 0;
  }
  id v4 = [NSString alloc];
  uuid = self->_uuid;
  uint64_t v6 = ATXNotificationSuggestionScopeToString(self->_scope);
  timestamp = self->_timestamp;
  triggerNotificationUUID = self->_triggerNotificationUUID;
  entityIdentifier = self->_entityIdentifier;
  id v10 = ATXSuggestionTypeToString(self->_subtype);
  id v11 = (void *)[v4 initWithFormat:@"UUID: %@ Scope: %@, Entity ID: %@, Timestamp: %@, Trigger UUID: %@, Sub type: %@, Sub object: %@", uuid, v6, entityIdentifier, timestamp, triggerNotificationUUID, v10, v3];

  return (NSString *)v11;
}

- (id)encodeAsProto
{
  v2 = [(ATXNotificationDeliverySuggestion *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (ATXNotificationDeliverySuggestion)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    NSUInteger v5 = [[ATXPBNotificationDeliverySuggestion alloc] initWithData:v4];

    self = [(ATXNotificationDeliverySuggestion *)self initWithProto:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (ATXNotificationDeliverySuggestion)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSUInteger v5 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationDeliverySuggestion initWithProto:].cold.8();
      }
      char v14 = 0;
      goto LABEL_27;
    }
    NSUInteger v5 = v4;
    if ([v5 hasUuid])
    {
      if ([v5 hasScope])
      {
        if ([v5 hasEntityIdentifier])
        {
          if ([v5 hasTimestamp])
          {
            if ([v5 hasOneofNotificationDeliverySuggestion])
            {
              id v6 = objc_alloc(MEMORY[0x1E4F29128]);
              uint64_t v7 = [v5 uuid];
              v8 = [v6 initWithUUIDString:v7];

              if (!v8)
              {
                id v10 = __atxlog_handle_notification_management();
                if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
                  -[ATXNotificationDeliverySuggestion initWithProto:]();
                }
                char v14 = 0;
                goto LABEL_44;
              }
              unint64_t v9 = (void *)MEMORY[0x1E4F1C9C8];
              [v5 timestamp];
              id v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
              if ([v5 hasTriggerNotificationUUID])
              {
                id v11 = objc_alloc(MEMORY[0x1E4F29128]);
                id v12 = [v5 triggerNotificationUUID];
                id v13 = (void *)[v11 initWithUUIDString:v12];
              }
              else
              {
                id v13 = 0;
              }
              if ([v5 hasSmartPause])
              {
                id v16 = [ATXNotificationSmartPauseSuggestion alloc];
                uint64_t v17 = [v5 smartPause];
                id v18 = [(ATXNotificationSmartPauseSuggestion *)v16 initWithProto:v17];

                uint64_t v19 = (int)[v5 scope];
                v20 = [v5 entityIdentifier];
                uint64_t v21 = [(ATXNotificationDeliverySuggestion *)self initWithSmartPauseSuggestion:v18 uuid:v8 scope:v19 entityIdentifier:v20 timestamp:v10 triggerNotificationUUID:v13];
                goto LABEL_35;
              }
              if ([v5 hasQuieting])
              {
                uint64_t v22 = (int)[v5 scope];
                uint64_t v23 = [v5 entityIdentifier];
                id v24 = [(ATXNotificationDeliverySuggestion *)self initQuietingSuggestionWithUUID:v8 scope:v22 entityIdentifier:v23 timestamp:v10 triggerNotificationUUID:v13];
              }
              else
              {
                if (![v5 hasPromoting])
                {
                  if (![v5 hasInterruptionManagerTuning])
                  {
                    if ([v5 hasSendToDigest])
                    {
                      id v18 = [v5 entityIdentifier];
                      id v29 = [(ATXNotificationDeliverySuggestion *)self initSendToDigestSuggestionWithUUID:v8 bundleID:v18 timestamp:v10 triggerNotificationUUID:v13];
                    }
                    else if ([v5 hasUrgencyTuning])
                    {
                      id v18 = [v5 entityIdentifier];
                      id v29 = [(ATXNotificationDeliverySuggestion *)self initUrgencyTuningSuggestionWithUUID:v8 bundleID:v18 timestamp:v10 triggerNotificationUUID:v13];
                    }
                    else if ([v5 hasSendMessagesToDigest])
                    {
                      id v18 = [v5 entityIdentifier];
                      id v29 = [(ATXNotificationDeliverySuggestion *)self initSendToMessagesDigestSuggestionWithUUID:v8 bundleID:v18 timestamp:v10 triggerNotificationUUID:v13];
                    }
                    else
                    {
                      if (![v5 hasTurnOffNotificationsForApp])
                      {
                        v30 = __atxlog_handle_notifications();
                        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
                          -[ATXNotificationDeliverySuggestion initWithProto:]();
                        }

                        char v14 = 0;
                        goto LABEL_43;
                      }
                      id v18 = [v5 entityIdentifier];
                      id v29 = [(ATXNotificationDeliverySuggestion *)self initTurnOffNotificationsForAppSuggestionWithUUID:v8 bundleID:v18 timestamp:v10 triggerNotificationUUID:v13];
                    }
                    self = (ATXNotificationDeliverySuggestion *)v29;
                    goto LABEL_36;
                  }
                  objc_super v26 = [ATXInterruptionManagerTuningSuggestion alloc];
                  char v27 = [v5 interruptionManagerTuning];
                  id v18 = [(ATXInterruptionManagerTuningSuggestion *)v26 initWithProto:v27];

                  uint64_t v28 = (int)[v5 scope];
                  v20 = [v5 entityIdentifier];
                  uint64_t v21 = [(ATXNotificationDeliverySuggestion *)self initWithInterruptionManagerTuningSuggestion:v18 scope:v28 entityIdentifier:v20 uuid:v8 timestamp:v10 triggerNotificationUUID:v13];
LABEL_35:
                  self = v21;

LABEL_36:
LABEL_42:
                  char v14 = self;
LABEL_43:

LABEL_44:
                  goto LABEL_26;
                }
                uint64_t v25 = (int)[v5 scope];
                uint64_t v23 = [v5 entityIdentifier];
                id v24 = [(ATXNotificationDeliverySuggestion *)self initPromotingSuggestionWithUUID:v8 scope:v25 entityIdentifier:v23 timestamp:v10 triggerNotificationUUID:v13];
              }
              self = (ATXNotificationDeliverySuggestion *)v24;

              goto LABEL_42;
            }
            v8 = __atxlog_handle_notification_management();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
              -[ATXNotificationDeliverySuggestion initWithProto:]();
            }
          }
          else
          {
            v8 = __atxlog_handle_notification_management();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
              -[ATXNotificationDeliverySuggestion initWithProto:].cold.4();
            }
          }
        }
        else
        {
          v8 = __atxlog_handle_notification_management();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
            -[ATXNotificationDeliverySuggestion initWithProto:].cold.5();
          }
        }
      }
      else
      {
        v8 = __atxlog_handle_notification_management();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          -[ATXNotificationDeliverySuggestion initWithProto:].cold.6();
        }
      }
    }
    else
    {
      v8 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationDeliverySuggestion initWithProto:].cold.7();
      }
    }
    char v14 = 0;
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  char v14 = 0;
LABEL_28:

  return v14;
}

- (id)proto
{
  id v3 = (id)objc_opt_new();
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  [v3 setUuid:v4];

  [v3 setScope:LODWORD(self->_scope)];
  [v3 setEntityIdentifier:self->_entityIdentifier];
  [(NSDate *)self->_timestamp timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setTimestamp:");
  triggerNotificationUUID = self->_triggerNotificationUUID;
  if (triggerNotificationUUID)
  {
    id v6 = [(NSUUID *)triggerNotificationUUID UUIDString];
    [v3 setTriggerNotificationUUID:v6];
  }
  p_int64_t subtype = &self->_subtype;
  switch(self->_subtype)
  {
    case 0:
    case 3:
    case 0xALL:
      v8 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ATXNotificationDeliverySuggestion proto].cold.7((uint64_t)p_subtype);
      }

      unint64_t v9 = 0;
      goto LABEL_36;
    case 1:
      id v10 = objc_opt_new();
      [v3 setQuieting:v10];
      goto LABEL_21;
    case 2:
      id v10 = objc_opt_new();
      [v3 setPromoting:v10];
      goto LABEL_21;
    case 4:
      p_id subObject = &self->_subObject;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [*p_subObject proto];
        [v3 setSmartPause:v10];
        goto LABEL_21;
      }
      uint64_t v17 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationDeliverySuggestion proto]();
      }
      goto LABEL_34;
    case 5:
      id v12 = &self->_subObject;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [*v12 proto];
        [v3 setInterruptionManagerTuning:v10];
        goto LABEL_21;
      }
      uint64_t v17 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationDeliverySuggestion proto]();
      }
      goto LABEL_34;
    case 6:
      id v13 = &self->_subObject;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [*v13 proto];
        [v3 setSendToDigest:v10];
        goto LABEL_21;
      }
      uint64_t v17 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        goto LABEL_27;
      }
      goto LABEL_34;
    case 7:
      char v14 = &self->_subObject;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [*v14 proto];
        [v3 setUrgencyTuning:v10];
        goto LABEL_21;
      }
      uint64_t v17 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationDeliverySuggestion proto].cold.5();
      }
      goto LABEL_34;
    case 8:
      uint64_t v15 = &self->_subObject;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [*v15 proto];
        [v3 setSendMessagesToDigest:v10];
        goto LABEL_21;
      }
      uint64_t v17 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
LABEL_27:
      }
        -[ATXNotificationDeliverySuggestion proto]();
      goto LABEL_34;
    case 9:
      id v16 = &self->_subObject;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [*v16 proto];
        [v3 setTurnOffNotificationsForApp:v10];
LABEL_21:
      }
      else
      {
        uint64_t v17 = __atxlog_handle_notifications();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          -[ATXNotificationDeliverySuggestion proto].cold.6();
        }
LABEL_34:

        id v3 = 0;
      }
LABEL_35:
      id v3 = v3;
      unint64_t v9 = v3;
LABEL_36:

      return v9;
    default:
      goto LABEL_35;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXNotificationDeliverySuggestion *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXNotificationDeliverySuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  id v6 = [(ATXNotificationDeliverySuggestion *)self initWithProtoData:v5];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXNotificationDeliverySuggestion allocWithZone:a3];
  id v5 = v4;
  p_int64_t subtype = &self->_subtype;
  switch(self->_subtype)
  {
    case 0:
    case 3:
    case 0xALL:
      uint64_t v7 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ATXNotificationDeliverySuggestion proto].cold.7((uint64_t)p_subtype);
      }

      v8 = 0;
      goto LABEL_34;
    case 1:
      uint64_t v9 = [(ATXNotificationDeliverySuggestion *)v4 initQuietingSuggestionWithUUID:self->_uuid scope:self->_scope entityIdentifier:self->_entityIdentifier timestamp:self->_timestamp triggerNotificationUUID:self->_triggerNotificationUUID];
      goto LABEL_19;
    case 2:
      uint64_t v9 = [(ATXNotificationDeliverySuggestion *)v4 initPromotingSuggestionWithUUID:self->_uuid scope:self->_scope entityIdentifier:self->_entityIdentifier timestamp:self->_timestamp triggerNotificationUUID:self->_triggerNotificationUUID];
      goto LABEL_19;
    case 4:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v5 initWithSmartPauseSuggestion:self->_subObject uuid:self->_uuid scope:self->_scope entityIdentifier:self->_entityIdentifier timestamp:self->_timestamp triggerNotificationUUID:self->_triggerNotificationUUID];
        goto LABEL_19;
      }
      id v10 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationDeliverySuggestion proto]();
      }
      goto LABEL_32;
    case 5:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v5 initWithInterruptionManagerTuningSuggestion:self->_subObject scope:self->_scope entityIdentifier:self->_entityIdentifier uuid:self->_uuid timestamp:self->_timestamp triggerNotificationUUID:self->_triggerNotificationUUID];
        goto LABEL_19;
      }
      id v10 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationDeliverySuggestion proto]();
      }
      goto LABEL_32;
    case 6:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v5 initSendToDigestSuggestionWithUUID:self->_uuid bundleID:self->_entityIdentifier timestamp:self->_timestamp triggerNotificationUUID:self->_triggerNotificationUUID];
        goto LABEL_19;
      }
      id v10 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationDeliverySuggestion proto]();
      }
      goto LABEL_32;
    case 7:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v5 initUrgencyTuningSuggestionWithUUID:self->_uuid bundleID:self->_entityIdentifier timestamp:self->_timestamp triggerNotificationUUID:self->_triggerNotificationUUID];
        goto LABEL_19;
      }
      id v10 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationDeliverySuggestion proto].cold.5();
      }
      goto LABEL_32;
    case 8:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v5 initSendToMessagesDigestSuggestionWithUUID:self->_uuid bundleID:self->_entityIdentifier timestamp:self->_timestamp triggerNotificationUUID:self->_triggerNotificationUUID];
        goto LABEL_19;
      }
      id v10 = __atxlog_handle_notifications();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[ATXNotificationDeliverySuggestion copyWithZone:].cold.5();
      }
      goto LABEL_32;
    case 9:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v5 initTurnOffNotificationsForAppSuggestionWithUUID:self->_uuid bundleID:self->_entityIdentifier timestamp:self->_timestamp triggerNotificationUUID:self->_triggerNotificationUUID];
LABEL_19:
        id v5 = (id)v9;
      }
      else
      {
        id v10 = __atxlog_handle_notifications();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          -[ATXNotificationDeliverySuggestion copyWithZone:].cold.6();
        }
LABEL_32:

        id v5 = 0;
      }
LABEL_33:
      id v5 = v5;
      v8 = v5;
LABEL_34:

      return v8;
    default:
      goto LABEL_33;
  }
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)jsonRawData
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v11[0] = @"uuid";
  id v3 = [(NSUUID *)self->_uuid UUIDString];
  v12[0] = v3;
  v11[1] = @"scope";
  id v4 = ATXNotificationSuggestionScopeToString(self->_scope);
  timestamp = self->_timestamp;
  triggerNotificationUUID = self->_triggerNotificationUUID;
  v12[1] = v4;
  v12[2] = timestamp;
  v11[2] = @"timestamp";
  v11[3] = @"triggerNotificationUUID";
  v12[3] = triggerNotificationUUID;
  v11[4] = @"subType";
  uint64_t v7 = ATXSuggestionTypeToString(self->_subtype);
  v11[5] = @"subObject";
  id subObject = self->_subObject;
  v12[4] = v7;
  v12[5] = subObject;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(ATXNotificationDeliverySuggestion *)self jsonRawData];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSUUID)triggerNotificationUUID
{
  return self->_triggerNotificationUUID;
}

- (void)setTriggerNotificationUUID:(id)a3
{
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (id)subObject
{
  return self->_subObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_subObject, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_triggerNotificationUUID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)initWithProto:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "%@: decoded uuid was nil.", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "%@: Invalid field suggestion.", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.3()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "%@: missing field suggestion.", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.4()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "%@: missing field timestamp.", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.5()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "%@: missing field entityIdentifier.", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.6()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "%@: missing field scope.", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.7()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "%@: missing field uuid.", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.8()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "%@: Unable to construct class from ProtoBuf object", v4, v5, v6, v7, v8);
}

- (void)proto
{
  uint64_t v1 = OUTLINED_FUNCTION_3_5(a1);
  uint64_t v2 = ATXSuggestionTypeToString(v1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_1A790D000, v3, v4, "Ignored unsupported subtype: %@", v5, v6, v7, v8, v9);
}

- (void)copyWithZone:.cold.5()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = OUTLINED_FUNCTION_3_5(v1);
  ATXSuggestionTypeToString(v2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_4_4();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_5(&dword_1A790D000, v5, v6, "Unexpected subObject: %@ for subtype: %@, expecting ATXSendMessagesToDigestSuggestion.", v7, v8, v9, v10, v11);
}

- (void)copyWithZone:.cold.6()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v2 = OUTLINED_FUNCTION_3_5(v1);
  ATXSuggestionTypeToString(v2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_4_4();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_1_5(&dword_1A790D000, v5, v6, "Unexpected subObject: %@ for subtype: %@, expecting ATXSuggestionTypeTurnOffNotificationsForApp.", v7, v8, v9, v10, v11);
}

@end