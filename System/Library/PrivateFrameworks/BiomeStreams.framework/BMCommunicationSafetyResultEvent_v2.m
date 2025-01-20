@interface BMCommunicationSafetyResultEvent_v2
- (BMCommunicationSafetyResultEvent_v2)initWithProto:(id)a3;
@end

@implementation BMCommunicationSafetyResultEvent_v2

- (BMCommunicationSafetyResultEvent_v2)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v36 = [v5 childId];
      v35 = [v5 deviceId];
      v34 = [v5 sourceBundleId];
      [v5 absoluteTimestamp];
      double v7 = v6;
      unsigned int v8 = [v5 communicationSafetyResultEventDirection];
      if (v8 >= 4)
      {
        v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[BMCommunicationSafetyResultEvent_v2 initWithProto:]();
        }

        uint64_t v9 = 2;
      }
      else
      {
        uint64_t v9 = qword_18EB36DF0[v8];
      }
      uint64_t v33 = v9;
      unsigned int v12 = [v5 communicationSafetyResultEventType];
      if (v12 >= 5)
      {
        v14 = __biome_log_for_category();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[BMCommunicationSafetyResultEvent_v2 initWithProto:]();
        }

        uint64_t v13 = 4;
      }
      else
      {
        uint64_t v13 = qword_18EB36E10[v12];
      }
      uint64_t v32 = v13;
      unsigned int v15 = [v5 communicationSafetyResultContentType];
      v37 = self;
      if (v15 >= 4)
      {
        v17 = __biome_log_for_category();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[BMCommunicationSafetyResultEvent_v2 initWithProto:]();
        }

        uint64_t v16 = 3;
      }
      else
      {
        uint64_t v16 = qword_18EB36E38[v15];
      }
      uint64_t v30 = v16;
      v31 = [v5 contactHandles];
      v28 = (void *)[v31 copy];
      v27 = [v5 contentId];
      v26 = [v5 conversationId];
      v18 = [v5 imageData];
      v19 = [v5 senderHandle];
      v20 = (void *)MEMORY[0x1E4F1CB10];
      v29 = [v5 contentURL];
      v21 = [v20 URLWithString:v29];
      v22 = (void *)MEMORY[0x1E4F1CB10];
      v23 = [v5 conversationURL];
      v24 = [v22 URLWithString:v23];
      self = [(BMCommunicationSafetyResultEvent *)v37 initWithChildID:v36 deviceID:v35 sourceBundleID:v34 absoluteTimeStamp:v33 eventDirection:v32 eventType:v30 contentType:v7 contactHandles:v28 contentID:v27 conversationID:v26 imageData:v18 senderHandle:v19 contentURL:v21 conversationURL:v24];

      v10 = self;
    }
    else
    {
      v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMCommunicationSafetyResultEvent initWithProto:].cold.4(v5);
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

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMCommunicationSafetyResultEvent: unable to convert BMPBCommunicationSafetyResultContentType v2 enum value: %@", v3, v4, v5, v6, v7);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMCommunicationSafetyResultEvent: unable to convert BMPBCommunicationSafetyResultEventType v2 enum value: %@", v3, v4, v5, v6, v7);
}

- (void)initWithProto:.cold.3()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMCommunicationSafetyResultEvent: unable to convert BMPBCommunicationSafetyResultEventDirection v2 enum value: %@", v3, v4, v5, v6, v7);
}

@end