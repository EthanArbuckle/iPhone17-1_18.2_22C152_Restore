@interface BMGroupActivitySessionEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMGroupActivitySessionEvent)initWithIsActive:(BOOL)a3 sourceBundleID:(id)a4 activitySessionID:(id)a5 activityID:(id)a6 messagesChatGuid:(id)a7 participantHandles:(id)a8 memberHandles:(id)a9 experienceType:(id)a10;
- (BMGroupActivitySessionEvent)initWithProto:(id)a3;
- (BMGroupActivitySessionEvent)initWithProtoData:(id)a3;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (NSArray)memberHandles;
- (NSArray)participantHandles;
- (NSString)activityID;
- (NSString)activitySessionID;
- (NSString)description;
- (NSString)experienceType;
- (NSString)messagesChatGuid;
- (NSString)sourceBundleID;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
@end

@implementation BMGroupActivitySessionEvent

- (BMGroupActivitySessionEvent)initWithIsActive:(BOOL)a3 sourceBundleID:(id)a4 activitySessionID:(id)a5 activityID:(id)a6 messagesChatGuid:(id)a7 participantHandles:(id)a8 memberHandles:(id)a9 experienceType:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v40.receiver = self;
  v40.super_class = (Class)BMGroupActivitySessionEvent;
  v23 = [(BMEventBase *)&v40 init];
  v24 = v23;
  if (v23)
  {
    v23->_isActive = a3;
    uint64_t v25 = [v16 copy];
    sourceBundleID = v24->_sourceBundleID;
    v24->_sourceBundleID = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    activitySessionID = v24->_activitySessionID;
    v24->_activitySessionID = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    activityID = v24->_activityID;
    v24->_activityID = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    messagesChatGuid = v24->_messagesChatGuid;
    v24->_messagesChatGuid = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    participantHandles = v24->_participantHandles;
    v24->_participantHandles = (NSArray *)v33;

    uint64_t v35 = [v21 copy];
    memberHandles = v24->_memberHandles;
    v24->_memberHandles = (NSArray *)v35;

    uint64_t v37 = [v22 copy];
    experienceType = v24->_experienceType;
    v24->_experienceType = (NSString *)v37;
  }
  return v24;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  if (self->_isActive) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  v5 = (void *)[v3 initWithFormat:@"GroupActivitySessionEvent event with sourceBundleID: %@ activitySessionID: %@ activityID: %@ messagesChatGuid: %@ participantHandles: %@ memberHandles: %@ experienceType: %@ isActive: %@", self->_sourceBundleID, self->_activitySessionID, self->_activityID, self->_messagesChatGuid, self->_participantHandles, self->_memberHandles, self->_experienceType, v4];

  return (NSString *)v5;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(BMGroupActivitySessionEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMGroupActivitySessionEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BMGroupActivitySessionEvent initWithProto:]((uint64_t)self, v14);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  unsigned int v16 = [v5 isActive];
  v6 = [v5 sourceBundleId];
  v7 = [v5 activitySessionId];
  v8 = [v5 activityId];
  v9 = [v5 messagesChatGuid];
  v10 = [v5 participantHandles];
  v11 = [v5 memberHandles];
  v12 = [v5 experienceType];

  self = [(BMGroupActivitySessionEvent *)self initWithIsActive:v16 sourceBundleID:v6 activitySessionID:v7 activityID:v8 messagesChatGuid:v9 participantHandles:v10 memberHandles:v11 experienceType:v12];
  v13 = self;
LABEL_8:

  return v13;
}

- (BMGroupActivitySessionEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBGroupActivitySessionEvent alloc] initWithData:v4];

    self = [(BMGroupActivitySessionEvent *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  id v3 = objc_opt_new();
  objc_msgSend(v3, "setIsActive:", -[BMGroupActivitySessionEvent isActive](self, "isActive"));
  id v4 = [(BMGroupActivitySessionEvent *)self sourceBundleID];
  [v3 setSourceBundleId:v4];

  id v5 = [(BMGroupActivitySessionEvent *)self activitySessionID];
  [v3 setActivitySessionId:v5];

  v6 = [(BMGroupActivitySessionEvent *)self activityID];
  [v3 setActivityId:v6];

  v7 = [(BMGroupActivitySessionEvent *)self messagesChatGuid];
  [v3 setMessagesChatGuid:v7];

  v8 = [(BMGroupActivitySessionEvent *)self participantHandles];
  v9 = (void *)[v8 mutableCopy];
  [v3 setParticipantHandles:v9];

  v10 = [(BMGroupActivitySessionEvent *)self memberHandles];
  v11 = (void *)[v10 mutableCopy];
  [v3 setMemberHandles:v11];

  v12 = [(BMGroupActivitySessionEvent *)self experienceType];
  [v3 setExperienceType:v12];

  return v3;
}

- (unint64_t)hash
{
  id v3 = [NSNumber numberWithBool:self->_isActive];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_sourceBundleID hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_activitySessionID hash] ^ v4;
  NSUInteger v7 = [(NSString *)self->_activityID hash];
  NSUInteger v8 = v6 ^ v7 ^ [(NSString *)self->_experienceType hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(BMGroupActivitySessionEvent *)self isActive];
    if (v6 != [v5 isActive])
    {
LABEL_3:
      char v7 = 0;
LABEL_16:

      goto LABEL_17;
    }
    NSUInteger v8 = [(BMGroupActivitySessionEvent *)self sourceBundleID];
    v9 = [v5 sourceBundleID];
    if ([v8 isEqualToString:v9])
    {
      v10 = [(BMGroupActivitySessionEvent *)self activitySessionID];
      v11 = [v5 activitySessionID];
      if ([v10 isEqualToString:v11])
      {
        v12 = [(BMGroupActivitySessionEvent *)self activityID];
        v13 = [v5 activityID];
        if ([v12 isEqualToString:v13])
        {
          [(BMGroupActivitySessionEvent *)self experienceType];
          v14 = v26 = v12;
          v15 = [v5 experienceType];
          int v27 = [v14 isEqualToString:v15];

          if (!v27) {
            goto LABEL_3;
          }
          unsigned int v16 = [(BMGroupActivitySessionEvent *)self messagesChatGuid];

          if (v16)
          {
            id v17 = [(BMGroupActivitySessionEvent *)self messagesChatGuid];
            id v18 = [v5 messagesChatGuid];
            char v7 = [v17 isEqualToString:v18];
          }
          else
          {
            char v7 = 0;
          }
          id v20 = [(BMGroupActivitySessionEvent *)self participantHandles];
          if ([v20 count])
          {
            id v21 = [v5 participantHandles];
            uint64_t v22 = [v21 count];

            if (!v22)
            {
LABEL_23:
              NSUInteger v8 = [(BMGroupActivitySessionEvent *)self memberHandles];
              if (![v8 count]) {
                goto LABEL_15;
              }
              v24 = [v5 memberHandles];
              uint64_t v25 = [v24 count];

              if (!v25) {
                goto LABEL_16;
              }
              NSUInteger v8 = [(BMGroupActivitySessionEvent *)self memberHandles];
              v9 = [v5 memberHandles];
              char v7 = [v8 isEqualToArray:v9];
LABEL_14:

LABEL_15:
              goto LABEL_16;
            }
            id v20 = [(BMGroupActivitySessionEvent *)self participantHandles];
            v23 = [v5 participantHandles];
            char v7 = [v20 isEqualToArray:v23];
          }
          goto LABEL_23;
        }
      }
    }
    char v7 = 0;
    goto LABEL_14;
  }
  char v7 = 0;
LABEL_17:

  return v7;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (NSString)activitySessionID
{
  return self->_activitySessionID;
}

- (NSString)activityID
{
  return self->_activityID;
}

- (NSString)messagesChatGuid
{
  return self->_messagesChatGuid;
}

- (NSArray)participantHandles
{
  return self->_participantHandles;
}

- (NSArray)memberHandles
{
  return self->_memberHandles;
}

- (NSString)experienceType
{
  return self->_experienceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experienceType, 0);
  objc_storeStrong((id *)&self->_memberHandles, 0);
  objc_storeStrong((id *)&self->_participantHandles, 0);
  objc_storeStrong((id *)&self->_messagesChatGuid, 0);
  objc_storeStrong((id *)&self->_activityID, 0);
  objc_storeStrong((id *)&self->_activitySessionID, 0);

  objc_storeStrong((id *)&self->_sourceBundleID, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  int v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBGroupActivitySessionEvent proto", (uint8_t *)&v5, 0xCu);
}

@end