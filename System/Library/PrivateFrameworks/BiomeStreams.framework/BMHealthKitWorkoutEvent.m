@interface BMHealthKitWorkoutEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMHealthKitWorkoutEvent)initWithIsFirstPartyDonation:(BOOL)a3 isIndoor:(BOOL)a4 activityType:(id)a5 activityUUID:(id)a6 eventType:(unint64_t)a7;
- (BMHealthKitWorkoutEvent)initWithIsFirstPartyDonation:(BOOL)a3 isIndoor:(BOOL)a4 activityType:(id)a5 activityUUID:(id)a6 eventType:(unint64_t)a7 isUpdate:(BOOL)a8;
- (BMHealthKitWorkoutEvent)initWithProto:(id)a3;
- (BMHealthKitWorkoutEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstPartyDonation;
- (BOOL)isIndoor;
- (BOOL)isUpdate;
- (NSString)activityType;
- (NSString)activityUUID;
- (NSString)description;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)eventType;
- (unsigned)dataVersion;
- (void)proto;
- (void)setActivityType:(id)a3;
- (void)setActivityUUID:(id)a3;
- (void)setEventType:(unint64_t)a3;
@end

@implementation BMHealthKitWorkoutEvent

- (BMHealthKitWorkoutEvent)initWithIsFirstPartyDonation:(BOOL)a3 isIndoor:(BOOL)a4 activityType:(id)a5 activityUUID:(id)a6 eventType:(unint64_t)a7
{
  return [(BMHealthKitWorkoutEvent *)self initWithIsFirstPartyDonation:a3 isIndoor:a4 activityType:a5 activityUUID:a6 eventType:a7 isUpdate:0];
}

- (BMHealthKitWorkoutEvent)initWithIsFirstPartyDonation:(BOOL)a3 isIndoor:(BOOL)a4 activityType:(id)a5 activityUUID:(id)a6 eventType:(unint64_t)a7 isUpdate:(BOOL)a8
{
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMHealthKitWorkoutEvent;
  v17 = [(BMEventBase *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_isFirstPartyDonation = a3;
    v17->_isIndoor = a4;
    objc_storeStrong((id *)&v17->_activityType, a5);
    objc_storeStrong((id *)&v18->_activityUUID, a6);
    v18->_eventType = a7;
    v18->_isUpdate = a8;
  }

  return v18;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [NSNumber numberWithBool:self->_isFirstPartyDonation];
  v5 = [NSNumber numberWithBool:self->_isIndoor];
  activityType = self->_activityType;
  activityUUID = self->_activityUUID;
  v8 = [NSNumber numberWithUnsignedInteger:self->_eventType];
  v9 = [NSNumber numberWithBool:self->_isUpdate];
  v10 = (void *)[v3 initWithFormat:@"Workout event with isFirstPartyDonation: %@, isIndoor: %@, activityType: %@, activityUUID: %@, eventType: %@, isUpdate: %@", v4, v5, activityType, activityUUID, v8, v9];

  return (NSString *)v10;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1) {
    v4 = (objc_class *)BMHealthKitWorkoutEvent_v1;
  }
  else {
    v4 = (objc_class *)a1;
  }
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithProtoData:v5];

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(BMHealthKitWorkoutEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMHealthKitWorkoutEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [v5 isFirstPartyDonation];
      uint64_t v7 = [v5 isIndoor];
      v8 = [v5 activityType];
      v9 = [v5 activityUUID];
      uint64_t v10 = [v5 eventType];
      uint64_t v11 = v10;
      if (v10 >= 4)
      {
        v14 = __biome_log_for_category();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[BMHealthKitWorkoutEvent initWithProto:](v11);
        }

        uint64_t v12 = 4;
      }
      else
      {
        uint64_t v12 = v10;
      }
      self = [(BMHealthKitWorkoutEvent *)self initWithIsFirstPartyDonation:v6 isIndoor:v7 activityType:v8 activityUUID:v9 eventType:v12 isUpdate:[v5 isUpdate]];

      v13 = self;
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMHealthKitWorkoutEvent initWithProto:]();
      }
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BMHealthKitWorkoutEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBHealthKitWorkoutEvent alloc] initWithData:v4];

    self = [(BMHealthKitWorkoutEvent *)self initWithProto:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)proto
{
  id v3 = objc_opt_new();
  objc_msgSend(v3, "setIsFirstPartyDonation:", -[BMHealthKitWorkoutEvent isFirstPartyDonation](self, "isFirstPartyDonation"));
  objc_msgSend(v3, "setIsIndoor:", -[BMHealthKitWorkoutEvent isIndoor](self, "isIndoor"));
  id v4 = [(BMHealthKitWorkoutEvent *)self activityType];
  [v3 setActivityType:v4];

  id v5 = [(BMHealthKitWorkoutEvent *)self activityUUID];
  [v3 setActivityUUID:v5];

  unint64_t v6 = [(BMHealthKitWorkoutEvent *)self eventType];
  if (v6 >= 4)
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[BMHealthKitWorkoutEvent proto](v6);
    }

    id v7 = 0;
  }
  else
  {
    [v3 setEventType:v6];
    objc_msgSend(v3, "setIsUpdate:", -[BMHealthKitWorkoutEvent isUpdate](self, "isUpdate"));
    id v7 = v3;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int isFirstPartyDonation = self->_isFirstPartyDonation;
    if (isFirstPartyDonation == [v5 isFirstPartyDonation]
      && (int isIndoor = self->_isIndoor, isIndoor == [v5 isIndoor]))
    {
      activityType = self->_activityType;
      v9 = [v5 activityType];
      if ([(NSString *)activityType isEqualToString:v9])
      {
        activityUUID = self->_activityUUID;
        uint64_t v11 = [v5 activityUUID];
        if ([(NSString *)activityUUID isEqualToString:v11]
          && (unint64_t eventType = self->_eventType, eventType == [v5 eventType]))
        {
          int isUpdate = self->_isUpdate;
          BOOL v14 = isUpdate == [v5 isUpdate];
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)isFirstPartyDonation
{
  return self->_isFirstPartyDonation;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
}

- (NSString)activityUUID
{
  return self->_activityUUID;
}

- (void)setActivityUUID:(id)a3
{
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_unint64_t eventType = a3;
}

- (BOOL)isUpdate
{
  return self->_isUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityUUID, 0);

  objc_storeStrong((id *)&self->_activityType, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMHealthKitWorkoutEvent: unable to convert BMPBHealthKitWorkoutEventType enum value: %@", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBWorkoutEvent proto", v4, v5, v6, v7, v8);
}

- (void)proto
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMHealthKitWorkoutEvent: unable to convert BMHealthKitWorkoutEventType enum value: %@", v4, v5, v6, v7, v8);
}

@end