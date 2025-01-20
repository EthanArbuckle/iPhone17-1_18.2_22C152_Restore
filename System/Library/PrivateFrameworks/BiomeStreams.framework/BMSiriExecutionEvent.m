@interface BMSiriExecutionEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMSiriExecutionEvent)initWithProto:(id)a3;
- (BMSiriExecutionEvent)initWithProtoData:(id)a3;
- (BMSiriExecutionEvent)initWithTaskID:(id)a3 taskStep:(unint64_t)a4 statusReason:(id)a5 slotValue:(id)a6 intentName:(id)a7;
- (BMSiriExecutionEvent)initWithTaskID:(id)a3 taskStep:(unint64_t)a4 statusReason:(id)a5 slotValue:(id)a6 intentName:(id)a7 appBundleId:(id)a8 interactionId:(id)a9;
- (BMSiriExecutionEvent)initWithTaskID:(id)a3 taskStep:(unint64_t)a4 statusReason:(id)a5 slotValue:(id)a6 intentName:(id)a7 appBundleId:(id)a8 interactionId:(id)a9 absoluteTimestamp:(double)a10;
- (BOOL)isEqual:(id)a3;
- (NSString)appBundleId;
- (NSString)intentName;
- (NSString)interactionId;
- (NSString)slotValue;
- (NSString)statusReason;
- (NSString)taskId;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unint64_t)taskStep;
- (unsigned)dataVersion;
- (void)proto;
@end

@implementation BMSiriExecutionEvent

- (BMSiriExecutionEvent)initWithTaskID:(id)a3 taskStep:(unint64_t)a4 statusReason:(id)a5 slotValue:(id)a6 intentName:(id)a7
{
  return -[BMSiriExecutionEvent initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:](self, "initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:", a3, a4, a5, a6, a7, 0.0, &stru_1EDD7E578);
}

- (BMSiriExecutionEvent)initWithTaskID:(id)a3 taskStep:(unint64_t)a4 statusReason:(id)a5 slotValue:(id)a6 intentName:(id)a7 appBundleId:(id)a8 interactionId:(id)a9
{
  return -[BMSiriExecutionEvent initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:](self, "initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:", a3, a4, a5, a6, a7, a8, 0.0);
}

- (BMSiriExecutionEvent)initWithTaskID:(id)a3 taskStep:(unint64_t)a4 statusReason:(id)a5 slotValue:(id)a6 intentName:(id)a7 appBundleId:(id)a8 interactionId:(id)a9 absoluteTimestamp:(double)a10
{
  id v26 = a3;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v18 = a8;
  id v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)BMSiriExecutionEvent;
  v20 = [(BMEventBase *)&v27 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_taskId, a3);
    v21->_taskStep = a4;
    objc_storeStrong((id *)&v21->_statusReason, a5);
    objc_storeStrong((id *)&v21->_slotValue, a6);
    objc_storeStrong((id *)&v21->_intentName, a7);
    objc_storeStrong((id *)&v21->_appBundleId, a8);
    objc_storeStrong((id *)&v21->_interactionId, a9);
    v21->_absoluteTimestamp = a10;
  }

  return v21;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 3) {
    v4 = (objc_class *)BMSiriExecutionEvent_v3;
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
  v2 = [(BMSiriExecutionEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMSiriExecutionEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [v5 taskId];
      uint64_t v7 = [v5 taskStep];
      uint64_t v8 = v7;
      if (v7 >= 0x5E)
      {
        v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[BMSiriExecutionEvent initWithProto:](v8);
        }

        uint64_t v9 = 94;
      }
      else
      {
        uint64_t v9 = v7;
      }
      v12 = [v5 statusReason];
      v13 = [v5 slotValue];
      v14 = [v5 intentName];
      v15 = [v5 appBundleId];
      v16 = [v5 interactionId];
      [v5 absoluteTimestamp];
      self = -[BMSiriExecutionEvent initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:](self, "initWithTaskID:taskStep:statusReason:slotValue:intentName:appBundleId:interactionId:absoluteTimestamp:", v6, v9, v12, v13, v14, v15, v16);

      v10 = self;
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMSiriExecutionEvent initWithProto:]();
      }
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BMSiriExecutionEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBSiriExecutionEvent alloc] initWithData:v4];

    self = [(BMSiriExecutionEvent *)self initWithProto:v5];
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
  v3 = objc_opt_new();
  id v4 = [(BMSiriExecutionEvent *)self taskId];
  [v3 setTaskId:v4];

  unint64_t v5 = [(BMSiriExecutionEvent *)self taskStep];
  if (v5 >= 0x5E)
  {
    v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BMSiriExecutionEvent proto](v5);
    }

    id v11 = 0;
  }
  else
  {
    [v3 setTaskStep:v5];
    v6 = [(BMSiriExecutionEvent *)self statusReason];
    [v3 setStatusReason:v6];

    uint64_t v7 = [(BMSiriExecutionEvent *)self slotValue];
    [v3 setSlotValue:v7];

    uint64_t v8 = [(BMSiriExecutionEvent *)self intentName];
    [v3 setIntentName:v8];

    uint64_t v9 = [(BMSiriExecutionEvent *)self appBundleId];
    [v3 setAppBundleId:v9];

    v10 = [(BMSiriExecutionEvent *)self interactionId];
    [v3 setInteractionId:v10];

    [(BMSiriExecutionEvent *)self absoluteTimestamp];
    objc_msgSend(v3, "setAbsoluteTimestamp:");
    id v11 = v3;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(BMSiriExecutionEvent *)self taskId];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BMSiriExecutionEvent taskStep](self, "taskStep"));
  uint64_t v6 = [v5 hash];
  uint64_t v7 = [(BMSiriExecutionEvent *)self statusReason];
  uint64_t v8 = v4 ^ [v7 hash];
  uint64_t v9 = [(BMSiriExecutionEvent *)self slotValue];
  uint64_t v10 = v8 ^ [v9 hash];
  id v11 = [(BMSiriExecutionEvent *)self intentName];
  uint64_t v12 = v10 ^ [v11 hash];
  v13 = [(BMSiriExecutionEvent *)self appBundleId];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(BMSiriExecutionEvent *)self interactionId];
  uint64_t v16 = v6 ^ v14 ^ [v15 hash];
  v17 = NSNumber;
  [(BMSiriExecutionEvent *)self absoluteTimestamp];
  id v18 = objc_msgSend(v17, "numberWithDouble:");
  unint64_t v19 = v16 ^ [v18 hash];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    taskId = self->_taskId;
    uint64_t v7 = [v5 taskId];
    if ([(NSString *)taskId isEqual:v7]
      && (unint64_t taskStep = self->_taskStep, taskStep == [v5 taskStep]))
    {
      statusReason = self->_statusReason;
      uint64_t v10 = [v5 statusReason];
      if ([(NSString *)statusReason isEqual:v10])
      {
        slotValue = self->_slotValue;
        uint64_t v12 = [v5 slotValue];
        if ([(NSString *)slotValue isEqual:v12])
        {
          intentName = self->_intentName;
          uint64_t v14 = [v5 intentName];
          if ([(NSString *)intentName isEqual:v14])
          {
            appBundleId = self->_appBundleId;
            uint64_t v16 = [v5 appBundleId];
            if ([(NSString *)appBundleId isEqual:v16])
            {
              interactionId = self->_interactionId;
              id v18 = [v5 interactionId];
              if ([(NSString *)interactionId isEqual:v18])
              {
                double absoluteTimestamp = self->_absoluteTimestamp;
                [v5 absoluteTimestamp];
                BOOL v21 = absoluteTimestamp == v20;
              }
              else
              {
                BOOL v21 = 0;
              }
            }
            else
            {
              BOOL v21 = 0;
            }
          }
          else
          {
            BOOL v21 = 0;
          }
        }
        else
        {
          BOOL v21 = 0;
        }
      }
      else
      {
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (NSString)taskId
{
  return self->_taskId;
}

- (unint64_t)taskStep
{
  return self->_taskStep;
}

- (NSString)statusReason
{
  return self->_statusReason;
}

- (NSString)slotValue
{
  return self->_slotValue;
}

- (NSString)intentName
{
  return self->_intentName;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_intentName, 0);
  objc_storeStrong((id *)&self->_slotValue, 0);
  objc_storeStrong((id *)&self->_statusReason, 0);

  objc_storeStrong((id *)&self->_taskId, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMSiriExecutionEvent: unable to convert BMPBTaskStepType enum value: %@", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBSiriExecutionEvent proto", v4, v5, v6, v7, v8);
}

- (void)proto
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMSiriExecutionEvent: unable to convert BMSiriExecutionTaskStepType enum value: %@", v4, v5, v6, v7, v8);
}

@end