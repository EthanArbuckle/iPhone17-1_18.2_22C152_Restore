@interface BMStoreEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithEventType:(Class)a3 eventData:(id)a4 dataVersion:(unsigned int)a5;
- (BMFrame)frame;
- (BMStoreData)eventBody;
- (BMStoreEvent)initWithCoder:(id)a3;
- (BMStoreEvent)initWithEventBody:(id)a3 timestamp:(double)a4;
- (BMStoreEvent)initWithFrame:(id)a3 error:(unsigned __int8)a4;
- (BMStoreEvent)initWithFrame:(id)a3 error:(unsigned __int8)a4 metadata:(id)a5;
- (BMStoreEvent)initWithFrame:(id)a3 segmentName:(id)a4 error:(unsigned __int8)a5 eventCategory:(unint64_t)a6 metadata:(id)a7 dataType:(Class)a8;
- (BMStoreEvent)initWithFrame:(id)a3 segmentName:(id)a4 frameOffset:(unint64_t)a5 eventBodyData:(id)a6 eventBodyDataVersion:(unsigned int)a7 dataType:(Class)a8 eventCategory:(unint64_t)a9 timestamp:(double)a10 metadata:(id)a11 error:(unsigned __int8)a12;
- (BMStreamMetadata)metadata;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (Class)dataType;
- (NSData)eventBodyData;
- (NSString)segmentName;
- (double)timestamp;
- (id)bookmark;
- (id)eventBodyKeepingBackingData:(BOOL)a3;
- (unint64_t)eventCategory;
- (unint64_t)hash;
- (unsigned)error;
- (unsigned)eventBodyDataVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMStoreEvent

- (NSData)eventBodyData
{
  return self->_eventBodyData;
}

- (BMStoreData)eventBody
{
  return (BMStoreData *)[(BMStoreEvent *)self eventBodyKeepingBackingData:0];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (id)eventBodyKeepingBackingData:(BOOL)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  eventBody = self->_eventBody;
  if (!eventBody)
  {
    v8 = (void *)MEMORY[0x1AD11E210]();
    p_Class dataType = (uint64_t *)&self->_dataType;
    if (self->_dataType)
    {
      if (objc_opt_respondsToSelector())
      {
        frame = self->_frame;
        if (frame && [(BMFrame *)frame state] != 1)
        {
          v32 = __biome_log_for_category();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            unsigned int v33 = [(BMFrame *)self->_frame state];
            if (v33 >= 6)
            {
              objc_msgSend(NSString, "stringWithFormat:", @"BMFrameStateUnknown(%lu)", v33);
              v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v34 = off_1E5E78728[v33];
            }
            *(_DWORD *)buf = 138543362;
            v53 = v34;
            _os_log_impl(&dword_1AD076000, v32, OS_LOG_TYPE_INFO, "Frame is in state %{public}@, unable to decode", buf, 0xCu);
          }
          goto LABEL_26;
        }
        eventBodyData = self->_eventBodyData;
        if (eventBodyData)
        {
          v12 = [(objc_class *)self->_dataType eventWithData:eventBodyData dataVersion:self->_eventBodyDataVersion];
          v13 = self->_eventBody;
          self->_eventBody = v12;

          v14 = self->_eventBody;
          if (v14)
          {
            if (!a3)
            {
              v15 = self->_eventBodyData;
              self->_eventBodyData = 0;

              v14 = self->_eventBody;
            }
            v6 = v14;
            goto LABEL_27;
          }
          v43 = __biome_log_for_category();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            segmentName = self->_segmentName;
            unint64_t v48 = [(BMFrame *)self->_frame offset];
            NSUInteger v49 = [(NSData *)self->_eventBodyData length];
            Class dataType = self->_dataType;
            unsigned int eventBodyDataVersion = self->_eventBodyDataVersion;
            *(_DWORD *)buf = 138544386;
            v53 = (__CFString *)segmentName;
            __int16 v54 = 2048;
            unint64_t v55 = v48;
            __int16 v56 = 2048;
            NSUInteger v57 = v49;
            __int16 v58 = 2114;
            Class v59 = dataType;
            __int16 v60 = 1024;
            unsigned int v61 = eventBodyDataVersion;
            _os_log_error_impl(&dword_1AD076000, v43, OS_LOG_TYPE_ERROR, "Failed to deserialize event segment '%{public}@' offset '%lu' length '%lu' class '%{public}@' version '%u'", buf, 0x30u);
          }

          v44 = [MEMORY[0x1E4F1CA98] null];
          v45 = self->_eventBody;
          self->_eventBody = v44;

          v46 = self->_eventBodyData;
          self->_eventBodyData = 0;

LABEL_26:
          v6 = 0;
LABEL_27:
          goto LABEL_28;
        }
        v24 = __biome_log_for_category();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[BMStoreEvent eventBodyKeepingBackingData:](v24, v35, v36, v37, v38, v39, v40, v41);
        }
      }
      else
      {
        v24 = __biome_log_for_category();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[BMStoreEvent eventBodyKeepingBackingData:](p_dataType, v24);
        }
      }
    }
    else
    {
      v24 = __biome_log_for_category();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[BMStoreEvent eventBodyKeepingBackingData:](v24, v25, v26, v27, v28, v29, v30, v31);
      }
    }

    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E4F1CA98], "null", a3);
  v5 = (BMStoreData *)objc_claimAutoreleasedReturnValue();

  if (eventBody == v5)
  {
    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[BMStoreEvent eventBodyKeepingBackingData:].cold.4(v16, v17, v18, v19, v20, v21, v22, v23);
    }

    v6 = 0;
  }
  else
  {
    v6 = self->_eventBody;
  }
LABEL_28:
  return v6;
}

- (BMStoreEvent)initWithFrame:(id)a3 segmentName:(id)a4 error:(unsigned __int8)a5 eventCategory:(unint64_t)a6 metadata:(id)a7 dataType:(Class)a8
{
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = [v16 offset];
  uint64_t v18 = [v16 data];
  uint64_t v19 = [v16 dataVersion];
  [v16 creationTimestamp];
  LOBYTE(v22) = a5;
  uint64_t v20 = -[BMStoreEvent initWithFrame:segmentName:frameOffset:eventBodyData:eventBodyDataVersion:dataType:eventCategory:timestamp:metadata:error:](self, "initWithFrame:segmentName:frameOffset:eventBodyData:eventBodyDataVersion:dataType:eventCategory:timestamp:metadata:error:", v16, v15, v17, v18, v19, a8, a6, v14, v22);

  return v20;
}

- (BMStoreEvent)initWithFrame:(id)a3 segmentName:(id)a4 frameOffset:(unint64_t)a5 eventBodyData:(id)a6 eventBodyDataVersion:(unsigned int)a7 dataType:(Class)a8 eventCategory:(unint64_t)a9 timestamp:(double)a10 metadata:(id)a11 error:(unsigned __int8)a12
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a6;
  id v23 = a11;
  v31.receiver = self;
  v31.super_class = (Class)BMStoreEvent;
  v24 = [(BMStoreEvent *)&v31 init];
  uint64_t v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_frame, a3);
    uint64_t v26 = [v21 copy];
    segmentName = v25->_segmentName;
    v25->_segmentName = (NSString *)v26;

    v25->_frameOffset = a5;
    if (v22)
    {
      uint64_t v28 = [v22 copy];
    }
    else
    {
      uint64_t v28 = [v20 data];
    }
    eventBodyData = v25->_eventBodyData;
    v25->_eventBodyData = (NSData *)v28;

    v25->_unsigned int eventBodyDataVersion = a7;
    v25->_eventCategory = a9;
    if (!a8) {
      a8 = (Class)[v23 eventDataClass];
    }
    v25->_Class dataType = a8;
    v25->_timestamp = a10;
    objc_storeStrong((id *)&v25->_metadata, a11);
    v25->_error = a12;
  }

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBodyData, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_frame, 0);
  objc_storeStrong((id *)&self->_segmentName, 0);
  objc_storeStrong((id *)&self->_eventBody, 0);
}

- (id)bookmark
{
  v3 = [(BMStoreEvent *)self metadata];
  v4 = [v3 streamId];
  if (!v4)
  {
    v8 = 0;
    goto LABEL_5;
  }
  segmentName = self->_segmentName;

  if (segmentName)
  {
    v6 = [BMStoreBookmark alloc];
    v3 = [(BMStoreEvent *)self metadata];
    v7 = [v3 streamId];
    v8 = [(BMStoreBookmark *)v6 initWithStream:v7 segment:self->_segmentName iterationStartTime:self->_frameOffset offset:CFAbsoluteTimeGetCurrent()];

LABEL_5:
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:
  return v8;
}

- (BMStoreEvent)initWithFrame:(id)a3 error:(unsigned __int8)a4
{
  return [(BMStoreEvent *)self initWithFrame:a3 segmentName:0 error:a4 eventCategory:0 metadata:0 dataType:0];
}

- (BMStoreEvent)initWithFrame:(id)a3 error:(unsigned __int8)a4 metadata:(id)a5
{
  return [(BMStoreEvent *)self initWithFrame:a3 segmentName:0 error:a4 eventCategory:0 metadata:a5 dataType:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    id v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = [NSString stringWithFormat:@"Failed to decode key %@", v11, *MEMORY[0x1E4F28568]];
      v22[0] = v17;
      BOOL v14 = 1;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      uint64_t v19 = [v16 errorWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BMStoreEvent)initWithCoder:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"segmentName"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frameOffset"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classString"];
  if (!v8)
  {
    Class v10 = (Class)[v7 eventDataClass];
    goto LABEL_5;
  }
  if (![(BMStoreEvent *)self checkAndReportDecodingFailureIfNeededForid:v8 key:@"classString" coder:v4 errorDomain:@"com.apple.Biome.BMStoreEvent" errorCode:-1])
  {
    Class v10 = NSClassFromString(v8);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v18 = __biome_log_for_category();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v36 = 16;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __30__BMStoreEvent_initWithCoder___block_invoke;
      block[3] = &unk_1E5E78708;
      block[4] = buf;
      if (initWithCoder__onceToken != -1) {
        dispatch_once(&initWithCoder__onceToken, block);
      }
      os_log_type_t v19 = *(unsigned char *)(*(void *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v8;
        _os_log_impl(&dword_1AD076000, v18, v19, "Class \"%@\" doesn't conform to BMStoreData", buf, 0xCu);
      }

      goto LABEL_21;
    }
    id v13 = [v4 allowedClasses];
    char v14 = [v13 containsObject:v10];

    if ((v14 & 1) == 0)
    {
      id v15 = __biome_log_for_category();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v36 = 16;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __30__BMStoreEvent_initWithCoder___block_invoke_41;
      v33[3] = &unk_1E5E78708;
      v33[4] = buf;
      if (initWithCoder__onceToken_40 != -1) {
        dispatch_once(&initWithCoder__onceToken_40, v33);
      }
      os_log_type_t v16 = *(unsigned char *)(*(void *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v17;
        _os_log_impl(&dword_1AD076000, v15, v16, "Event class '%@' missing from %@ allowedClasses", buf, 0x16u);
      }
    }
LABEL_5:
    if (v10)
    {
      id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventBody"];
      if (![(BMStoreEvent *)self checkAndReportDecodingFailureIfNeededForid:v11 key:@"eventBody" coder:v4 errorDomain:@"com.apple.Biome.BMStoreEvent" errorCode:-1])
      {
        v32 = v5;
        id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventDataVersion"];
        if ([(BMStoreEvent *)self checkAndReportDecodingFailureIfNeededForid:v12 key:@"eventDataVersion" coder:v4 errorDomain:@"com.apple.Biome.BMStoreEvent" errorCode:-1])
        {
          v9 = 0;
        }
        else
        {
          id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventCategory"];
          [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
          uint64_t v21 = v31 = v12;
          [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storeError"];
          id v22 = v30 = v6;
          uint64_t v29 = [v30 unsignedIntValue];
          unsigned int v28 = [v31 unsignedIntValue];
          uint64_t v23 = [v20 unsignedIntValue];
          [v21 doubleValue];
          double v25 = v24;
          LOBYTE(v27) = [v22 unsignedIntValue];
          self = [(BMStoreEvent *)self initWithFrame:0 segmentName:v32 frameOffset:v29 eventBodyData:v11 eventBodyDataVersion:v28 dataType:v10 eventCategory:v25 timestamp:v23 metadata:v7 error:v27];

          v6 = v30;
          id v12 = v31;

          v9 = self;
        }

        v5 = v32;
        goto LABEL_26;
      }
LABEL_23:
      v9 = 0;
LABEL_26:

      goto LABEL_27;
    }
LABEL_21:
    id v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMStoreEvent initWithCoder:]((uint64_t)v8, v11);
    }
    goto LABEL_23;
  }
  v9 = 0;
LABEL_27:

  return v9;
}

uint64_t __30__BMStoreEvent_initWithCoder___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t __30__BMStoreEvent_initWithCoder___block_invoke_41(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

+ (id)eventWithEventType:(Class)a3 eventData:(id)a4 dataVersion:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    v8 = [(objc_class *)a3 eventWithData:v7 dataVersion:v5];
  }
  else
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[BMStoreEvent eventWithEventType:eventData:dataVersion:](a3, v9);
    }

    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  eventBodyData = self->_eventBodyData;
  id v13 = v4;
  if (eventBodyData)
  {
    [v4 encodeObject:eventBodyData forKey:@"eventBody"];
  }
  else
  {
    v6 = [(BMStoreData *)self->_eventBody serialize];
    [v13 encodeObject:v6 forKey:@"eventBody"];
  }
  id v7 = NSStringFromClass(self->_dataType);
  [v13 encodeObject:v7 forKey:@"classString"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_eventBodyDataVersion];
  [v13 encodeObject:v8 forKey:@"eventDataVersion"];

  v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_timestamp];
  [v13 encodeObject:v9 forKey:@"timestamp"];

  Class v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedChar:self->_error];
  [v13 encodeObject:v10 forKey:@"storeError"];

  [v13 encodeObject:self->_metadata forKey:@"metadata"];
  id v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_eventCategory];
  [v13 encodeObject:v11 forKey:@"eventCategory"];

  [v13 encodeObject:self->_segmentName forKey:@"segmentName"];
  id v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:self->_frameOffset];
  [v13 encodeObject:v12 forKey:@"frameOffset"];
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v11 = 0;
    goto LABEL_26;
  }
  id v7 = v6;
  v8 = [(BMStoreEvent *)self eventBody];
  if (!v8)
  {
    v3 = [v7 eventBody];
    if (!v3)
    {
      int v10 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  id v4 = [(BMStoreEvent *)self eventBody];
  v9 = [v7 eventBody];
  int v10 = [v4 isEqual:v9];

  if (!v8) {
    goto LABEL_8;
  }
LABEL_9:

  id v12 = [(BMStoreEvent *)self metadata];
  if (!v12)
  {
    id v4 = [v7 metadata];
    if (!v4)
    {
      int v15 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  id v13 = [(BMStoreEvent *)self metadata];
  char v14 = [v7 metadata];
  int v15 = [v13 isEqual:v14];

  if (!v12) {
    goto LABEL_14;
  }
LABEL_15:

  segmentName = self->_segmentName;
  if ((unint64_t)segmentName | v7[3]) {
    char v17 = -[NSString isEqualToString:](segmentName, "isEqualToString:");
  }
  else {
    char v17 = 1;
  }
  if ((v10 & v15) == 1
    && (-[BMStoreEvent timestamp](self, "timestamp"), double v19 = v18, [v7 timestamp], v19 == v20)
    && (unint64_t v21 = -[BMStoreEvent eventCategory](self, "eventCategory"), v21 == [v7 eventCategory]))
  {
    if (self->_frameOffset == v7[4]) {
      BOOL v11 = v17;
    }
    else {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

LABEL_26:
  return v11;
}

- (unint64_t)hash
{
  v3 = [(BMStoreEvent *)self eventBody];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
  [(BMStoreEvent *)self timestamp];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v7 = [v6 hash];
  v8 = [(BMStoreEvent *)self metadata];
  uint64_t v9 = v7 ^ v4 ^ [v8 hash];
  int v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[BMStoreEvent eventCategory](self, "eventCategory"));
  uint64_t v11 = [v10 hash];
  id v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:self->_frameOffset];
  uint64_t v13 = v9 ^ v11 ^ [v12 hash];
  NSUInteger v14 = v13 ^ [(NSString *)self->_segmentName hash];

  return v14;
}

- (unsigned)error
{
  return self->_error;
}

- (NSString)segmentName
{
  return self->_segmentName;
}

- (BMFrame)frame
{
  return self->_frame;
}

- (Class)dataType
{
  return self->_dataType;
}

- (BMStreamMetadata)metadata
{
  return self->_metadata;
}

- (unsigned)eventBodyDataVersion
{
  return self->_eventBodyDataVersion;
}

- (unint64_t)eventCategory
{
  return self->_eventCategory;
}

- (BMStoreEvent)initWithEventBody:(id)a3 timestamp:(double)a4
{
  id v7 = a3;
  v8 = objc_opt_new();
  uint64_t v9 = [(BMStoreEvent *)self initWithFrame:v8 error:1];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventBody, a3);
    v10->_timestamp = a4;
    v10->_Class dataType = (Class)objc_opt_class();
  }

  return v10;
}

- (void)eventBodyKeepingBackingData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)eventBodyKeepingBackingData:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)eventBodyKeepingBackingData:(uint64_t *)a1 .cold.3(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1AD076000, a2, OS_LOG_TYPE_ERROR, "Event class - %{public}@ doesn't conform to BMStoreData protocol", (uint8_t *)&v3, 0xCu);
}

- (void)eventBodyKeepingBackingData:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AD076000, a2, OS_LOG_TYPE_ERROR, "Unable to determine event class from string, verify that the following class definition is available at runtime - %@", (uint8_t *)&v2, 0xCu);
}

+ (void)eventWithEventType:(objc_class *)a1 eventData:(NSObject *)a2 dataVersion:.cold.1(objc_class *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromClass(a1);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1AD076000, a2, OS_LOG_TYPE_ERROR, "Event class - %@ doesn't - conform to BMStoreData protocol or Maybe the framework containing the event class isn't linked. We can't deserialize", (uint8_t *)&v4, 0xCu);
}

@end