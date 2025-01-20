@interface BMCommunicationSafetyResultEvent
+ (BOOL)isEqual:(Class)a3;
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMCommunicationSafetyResultEvent)initWithChildID:(id)a3 deviceID:(id)a4 sourceBundleID:(id)a5 absoluteTimeStamp:(double)a6 eventDirection:(unint64_t)a7 eventType:(unint64_t)a8 contentType:(unint64_t)a9 contactHandles:(id)a10 contentID:(id)a11 conversationID:(id)a12 imageData:(id)a13;
- (BMCommunicationSafetyResultEvent)initWithChildID:(id)a3 deviceID:(id)a4 sourceBundleID:(id)a5 absoluteTimeStamp:(double)a6 eventDirection:(unint64_t)a7 eventType:(unint64_t)a8 contentType:(unint64_t)a9 contactHandles:(id)a10 contentID:(id)a11 conversationID:(id)a12 imageData:(id)a13 senderHandle:(id)a14 contentURL:(id)a15 conversationURL:(id)a16;
- (BMCommunicationSafetyResultEvent)initWithCoder:(id)a3;
- (BMCommunicationSafetyResultEvent)initWithProto:(id)a3;
- (BMCommunicationSafetyResultEvent)initWithProtoData:(id)a3;
- (BMCommunicationSafetyResultEvent)initWithProtoData:(id)a3 skipImage:(BOOL)a4;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidWithContext:(id)a3 error:(id *)a4;
- (NSArray)contactHandles;
- (NSData)imageData;
- (NSString)childID;
- (NSString)contentID;
- (NSString)conversationID;
- (NSString)deviceID;
- (NSString)senderHandle;
- (NSString)sourceBundleID;
- (NSURL)contentURL;
- (NSURL)conversationURL;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)contentType;
- (unint64_t)eventDirection;
- (unint64_t)eventType;
- (unint64_t)hash;
- (unsigned)contentCount;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
- (void)proto;
- (void)setContentCount:(unsigned int)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setEventDirection:(unint64_t)a3;
- (void)setEventType:(unint64_t)a3;
@end

@implementation BMCommunicationSafetyResultEvent

+ (BOOL)isEqual:(Class)a3
{
  return (Class)objc_opt_class() == a3 || objc_opt_class() == (void)a3;
}

- (BMCommunicationSafetyResultEvent)initWithChildID:(id)a3 deviceID:(id)a4 sourceBundleID:(id)a5 absoluteTimeStamp:(double)a6 eventDirection:(unint64_t)a7 eventType:(unint64_t)a8 contentType:(unint64_t)a9 contactHandles:(id)a10 contentID:(id)a11 conversationID:(id)a12 imageData:(id)a13
{
  return [(BMCommunicationSafetyResultEvent *)self initWithChildID:a3 deviceID:a4 sourceBundleID:a5 absoluteTimeStamp:a7 eventDirection:a8 eventType:a9 contentType:a6 contactHandles:a10 contentID:a11 conversationID:a12 imageData:a13 senderHandle:0 contentURL:0 conversationURL:0];
}

- (BMCommunicationSafetyResultEvent)initWithChildID:(id)a3 deviceID:(id)a4 sourceBundleID:(id)a5 absoluteTimeStamp:(double)a6 eventDirection:(unint64_t)a7 eventType:(unint64_t)a8 contentType:(unint64_t)a9 contactHandles:(id)a10 contentID:(id)a11 conversationID:(id)a12 imageData:(id)a13 senderHandle:(id)a14 contentURL:(id)a15 conversationURL:(id)a16
{
  id v48 = a3;
  id v47 = a4;
  id v46 = a5;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v45 = a13;
  id v23 = a14;
  id v24 = a15;
  id v25 = a16;
  v49.receiver = self;
  v49.super_class = (Class)BMCommunicationSafetyResultEvent;
  v26 = [(BMCommunicationSafetyResultEvent *)&v49 init];
  if (v26)
  {
    uint64_t v27 = [v48 copy];
    childID = v26->_childID;
    v26->_childID = (NSString *)v27;

    uint64_t v29 = [v47 copy];
    deviceID = v26->_deviceID;
    v26->_deviceID = (NSString *)v29;

    uint64_t v31 = [v46 copy];
    sourceBundleID = v26->_sourceBundleID;
    v26->_sourceBundleID = (NSString *)v31;

    v26->_absoluteTimestamp = a6;
    v26->_eventDirection = a7;
    v26->_eventType = a8;
    v26->_contentType = a9;
    uint64_t v33 = [v20 copy];
    contactHandles = v26->_contactHandles;
    v26->_contactHandles = (NSArray *)v33;

    uint64_t v35 = [v21 copy];
    contentID = v26->_contentID;
    v26->_contentID = (NSString *)v35;

    uint64_t v37 = [v22 copy];
    conversationID = v26->_conversationID;
    v26->_conversationID = (NSString *)v37;

    objc_storeStrong((id *)&v26->_imageData, a13);
    uint64_t v39 = [v23 copy];
    senderHandle = v26->_senderHandle;
    v26->_senderHandle = (NSString *)v39;

    objc_storeStrong((id *)&v26->_contentURL, a15);
    objc_storeStrong((id *)&v26->_conversationURL, a16);
  }

  return v26;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    v7 = (objc_class *)a1;
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    v7 = (objc_class *)BMCommunicationSafetyResultEvent_v2;
LABEL_5:
    v8 = (void *)[[v7 alloc] initWithProtoData:v6];
    goto LABEL_9;
  }
  v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[BMCommunicationSafetyResultEvent eventWithData:dataVersion:]();
  }

  v8 = 0;
LABEL_9:

  return v8;
}

- (id)jsonDict
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)&self->_childID;
  v15[0] = @"childId";
  v15[1] = @"deviceId";
  sourceBundleID = self->_sourceBundleID;
  long long v16 = v3;
  v15[2] = @"sourceBundleId";
  v15[3] = @"absoluteTimestamp";
  v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  v18 = v4;
  v15[4] = @"eventDirection";
  v5 = [NSNumber numberWithUnsignedInteger:self->_eventDirection];
  v19 = v5;
  v15[5] = @"eventType";
  id v6 = [NSNumber numberWithUnsignedInteger:self->_eventType];
  id v20 = v6;
  v15[6] = @"contentType";
  v7 = [NSNumber numberWithUnsignedInteger:self->_contentType];
  id v21 = v7;
  long long v22 = *(_OWORD *)&self->_contactHandles;
  v15[7] = @"contactHandles";
  v15[8] = @"contentID";
  conversationID = self->_conversationID;
  v15[9] = @"conversationID";
  v15[10] = @"imageDataLengthInBytes";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSData length](self->_imageData, "length"));
  senderHandle = self->_senderHandle;
  contentURL = self->_contentURL;
  id v24 = v8;
  id v25 = senderHandle;
  v15[11] = @"senderHandle";
  v15[12] = @"contentURL";
  v11 = [(NSURL *)contentURL absoluteString];
  v26 = v11;
  v15[13] = @"conversationURL";
  v12 = [(NSURL *)self->_conversationURL absoluteString];
  uint64_t v27 = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:v15 count:14];

  return v13;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  long long v3 = [(BMCommunicationSafetyResultEvent *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMCommunicationSafetyResultEvent json]();
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMCommunicationSafetyResultEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMCommunicationSafetyResultEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMCommunicationSafetyResultEvent *)self initWithProtoData:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMCommunicationSafetyResultEvent *)self proto];
  long long v3 = [v2 data];

  return v3;
}

- (BMCommunicationSafetyResultEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v36 = [v5 childId];
      uint64_t v35 = [v5 deviceId];
      v34 = [v5 sourceBundleId];
      [v5 absoluteTimestamp];
      double v7 = v6;
      unsigned int v8 = [v5 communicationSafetyResultEventDirection];
      if (v8 >= 3)
      {
        v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[BMCommunicationSafetyResultEvent initWithProto:]();
        }

        uint64_t v9 = 2;
      }
      else
      {
        uint64_t v9 = v8;
      }
      uint64_t v33 = v9;
      unsigned int v12 = [v5 communicationSafetyResultEventType];
      if (v12 >= 4)
      {
        v14 = __biome_log_for_category();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[BMCommunicationSafetyResultEvent initWithProto:]();
        }

        uint64_t v13 = 4;
      }
      else
      {
        uint64_t v13 = v12;
      }
      uint64_t v32 = v13;
      unsigned int v15 = [v5 communicationSafetyResultContentType];
      if (v15 >= 3)
      {
        v17 = __biome_log_for_category();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[BMCommunicationSafetyResultEvent initWithProto:]();
        }

        uint64_t v16 = 3;
      }
      else
      {
        uint64_t v16 = v15;
      }
      uint64_t v30 = v16;
      uint64_t v31 = [v5 contactHandles];
      uint64_t v28 = (void *)[v31 copy];
      uint64_t v27 = [v5 contentId];
      v26 = [v5 conversationId];
      v18 = [v5 imageData];
      v19 = [v5 senderHandle];
      id v20 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v29 = [v5 contentURL];
      id v21 = [v20 URLWithString:v29];
      long long v22 = (void *)MEMORY[0x1E4F1CB10];
      id v23 = [v5 conversationURL];
      id v24 = [v22 URLWithString:v23];
      self = [(BMCommunicationSafetyResultEvent *)self initWithChildID:v36 deviceID:v35 sourceBundleID:v34 absoluteTimeStamp:v33 eventDirection:v32 eventType:v30 contentType:v7 contactHandles:v28 contentID:v27 conversationID:v26 imageData:v18 senderHandle:v19 contentURL:v21 conversationURL:v24];

      v10 = self;
    }
    else
    {
      id v5 = __biome_log_for_category();
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

- (BMCommunicationSafetyResultEvent)initWithProtoData:(id)a3
{
  return [(BMCommunicationSafetyResultEvent *)self initWithProtoData:a3 skipImage:0];
}

- (BMCommunicationSafetyResultEvent)initWithProtoData:(id)a3 skipImage:(BOOL)a4
{
  if (a3)
  {
    BOOL v5 = a4;
    id v6 = a3;
    double v7 = [[BMPBCommunicationSafetyResultEvent alloc] initWithData:v6 skipImage:v5];

    self = [(BMCommunicationSafetyResultEvent *)self initWithProto:v7];
    unsigned int v8 = self;
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (id)proto
{
  long long v3 = objc_opt_new();
  id v4 = [(BMCommunicationSafetyResultEvent *)self deviceID];
  [v3 setDeviceId:v4];

  BOOL v5 = [(BMCommunicationSafetyResultEvent *)self childID];
  [v3 setChildId:v5];

  id v6 = [(BMCommunicationSafetyResultEvent *)self sourceBundleID];
  [v3 setSourceBundleId:v6];

  [(BMCommunicationSafetyResultEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  unint64_t v7 = [(BMCommunicationSafetyResultEvent *)self eventDirection];
  if (v7 >= 3)
  {
    uint64_t v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMCommunicationSafetyResultEvent proto](v7);
    }

    unint64_t v7 = 0xFFFFFFFFLL;
    int v8 = 1;
  }
  else
  {
    int v8 = 0;
  }
  uint64_t v10 = [(BMCommunicationSafetyResultEvent *)self eventType];
  uint64_t v11 = 0;
  switch(v10)
  {
    case 0:
      break;
    case 1:
      uint64_t v11 = 1;
      break;
    case 2:
      uint64_t v11 = 2;
      break;
    case 3:
      uint64_t v11 = 3;
      break;
    default:
      unsigned int v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[BMCommunicationSafetyResultEvent proto](v10);
      }

      uint64_t v11 = 0xFFFFFFFFLL;
      int v8 = 1;
      break;
  }
  unint64_t v13 = [(BMCommunicationSafetyResultEvent *)self contentType];
  if (v13 >= 3)
  {
    id v25 = __biome_log_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[BMCommunicationSafetyResultEvent proto](v13);
    }
  }
  else if (!v8)
  {
    [v3 setCommunicationSafetyResultEventDirection:v7];
    [v3 setCommunicationSafetyResultEventType:v11];
    [v3 setCommunicationSafetyResultContentType:v13];
    v14 = [(BMCommunicationSafetyResultEvent *)self contactHandles];
    unsigned int v15 = (void *)[v14 mutableCopy];
    [v3 setContactHandles:v15];

    uint64_t v16 = [(BMCommunicationSafetyResultEvent *)self contentID];
    [v3 setContentId:v16];

    v17 = [(BMCommunicationSafetyResultEvent *)self conversationID];
    [v3 setConversationId:v17];

    v18 = [(BMCommunicationSafetyResultEvent *)self imageData];
    [v3 setImageData:v18];

    v19 = [(BMCommunicationSafetyResultEvent *)self senderHandle];
    [v3 setSenderHandle:v19];

    id v20 = [(BMCommunicationSafetyResultEvent *)self contentURL];
    id v21 = [v20 absoluteString];
    [v3 setContentURL:v21];

    long long v22 = [(BMCommunicationSafetyResultEvent *)self conversationURL];
    id v23 = [v22 absoluteString];
    [v3 setConversationURL:v23];

    id v24 = v3;
    goto LABEL_20;
  }
  id v24 = 0;
LABEL_20:

  return v24;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_childID hash];
  id v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  uint64_t v5 = [v4 hash];
  NSUInteger v6 = v3 ^ [(NSString *)self->_deviceID hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_sourceBundleID hash];
  NSUInteger v8 = [(NSString *)self->_contentID hash];
  uint64_t v9 = [(NSURL *)self->_contentURL absoluteString];
  uint64_t v10 = v8 ^ [v9 hash];
  NSUInteger v11 = v7 ^ v10 ^ [(NSString *)self->_conversationID hash];
  unsigned int v12 = [(NSURL *)self->_conversationURL absoluteString];
  unint64_t v13 = v11 ^ [v12 hash];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v13 = 0;
    goto LABEL_45;
  }
  id v7 = v6;
  NSUInteger v8 = v7;
  childID = self->_childID;
  uint64_t v10 = childID;
  if (!childID)
  {
    uint64_t v11 = [v7 childID];
    if (!v11)
    {
      v78 = 0;
      int v12 = 0;
      goto LABEL_10;
    }
    v78 = (void *)v11;
    uint64_t v10 = self->_childID;
  }
  NSUInteger v3 = [v8 childID];
  if (![(NSString *)v10 isEqualToString:v3])
  {

    char v13 = 0;
    goto LABEL_42;
  }
  int v12 = 1;
LABEL_10:
  deviceID = self->_deviceID;
  unsigned int v15 = deviceID;
  if (!deviceID)
  {
    uint64_t v16 = [v8 deviceID];
    if (!v16)
    {
      int v17 = v12;
      v76 = 0;
      int v77 = 0;
      goto LABEL_17;
    }
    v76 = (void *)v16;
    unsigned int v15 = self->_deviceID;
  }
  id v4 = [v8 deviceID];
  if (![(NSString *)v15 isEqualToString:v4])
  {

    char v13 = 0;
    goto LABEL_39;
  }
  int v17 = v12;
  int v77 = 1;
LABEL_17:
  sourceBundleID = self->_sourceBundleID;
  v19 = sourceBundleID;
  if (!sourceBundleID)
  {
    uint64_t v20 = [v8 sourceBundleID];
    if (!v20)
    {
      v74 = 0;
      int v75 = 0;
      goto LABEL_24;
    }
    v74 = (void *)v20;
    v19 = self->_sourceBundleID;
  }
  uint64_t v21 = [v8 sourceBundleID];
  long long v22 = v19;
  id v23 = (void *)v21;
  if (![(NSString *)v22 isEqualToString:v21])
  {

    char v13 = 0;
    int v12 = v17;
    goto LABEL_36;
  }
  v73 = v23;
  int v75 = 1;
LABEL_24:
  double absoluteTimestamp = self->_absoluteTimestamp;
  [v8 absoluteTimestamp];
  if (absoluteTimestamp == v25)
  {
    unint64_t eventDirection = self->_eventDirection;
    if (eventDirection == [v8 eventDirection])
    {
      unint64_t eventType = self->_eventType;
      if (eventType == [v8 eventType])
      {
        unint64_t contentType = self->_contentType;
        if (contentType == [v8 contentType])
        {
          contactHandles = self->_contactHandles;
          v72 = contactHandles;
          if (!contactHandles)
          {
            uint64_t v30 = [v8 contactHandles];
            if (!v30)
            {
              v67 = 0;
              int v70 = 0;
              goto LABEL_52;
            }
            v67 = (void *)v30;
            contactHandles = self->_contactHandles;
          }
          v71 = [v8 contactHandles];
          if (!-[NSArray isEqual:](contactHandles, "isEqual:"))
          {
            char v13 = 0;
            int v12 = v17;
            goto LABEL_100;
          }
          int v70 = 1;
LABEL_52:
          contentID = self->_contentID;
          v69 = contentID;
          if (!contentID)
          {
            uint64_t v33 = [v8 contentID];
            if (!v33)
            {
              v63 = 0;
              int v66 = 0;
              goto LABEL_59;
            }
            v63 = (void *)v33;
            contentID = self->_contentID;
          }
          v68 = [v8 contentID];
          if (!-[NSString isEqualToString:](contentID, "isEqualToString:"))
          {
            char v13 = 0;
            int v12 = v17;
            goto LABEL_97;
          }
          int v66 = 1;
LABEL_59:
          conversationID = self->_conversationID;
          v65 = conversationID;
          if (!conversationID)
          {
            uint64_t v35 = [v8 conversationID];
            if (!v35)
            {
              v59 = 0;
              int v62 = 0;
              goto LABEL_66;
            }
            v59 = (void *)v35;
            conversationID = self->_conversationID;
          }
          v64 = [v8 conversationID];
          if (!-[NSString isEqualToString:](conversationID, "isEqualToString:"))
          {
            char v13 = 0;
            int v12 = v17;
            goto LABEL_94;
          }
          int v62 = 1;
LABEL_66:
          senderHandle = self->_senderHandle;
          v61 = senderHandle;
          if (!senderHandle)
          {
            uint64_t v37 = [v8 senderHandle];
            if (!v37)
            {
              v53 = 0;
              int v57 = 0;
              goto LABEL_73;
            }
            v53 = (void *)v37;
            senderHandle = self->_senderHandle;
          }
          v60 = [v8 senderHandle];
          if (!-[NSString isEqualToString:](senderHandle, "isEqualToString:"))
          {
            char v13 = 0;
            int v12 = v17;
            goto LABEL_91;
          }
          int v57 = 1;
LABEL_73:
          int v12 = v17;
          contentURL = self->_contentURL;
          v58 = contentURL;
          if (!contentURL)
          {
            id v48 = [v8 contentURL];
            if (!v48)
            {
              id v48 = 0;
              int v52 = 0;
              goto LABEL_80;
            }
            contentURL = self->_contentURL;
          }
          uint64_t v39 = [(NSURL *)contentURL absoluteString];
          v55 = [v8 contentURL];
          [v55 absoluteString];
          v54 = v56 = v39;
          if (!objc_msgSend(v39, "isEqualToString:"))
          {
            char v13 = 0;
            goto LABEL_89;
          }
          int v52 = 1;
LABEL_80:
          int v51 = v12;
          conversationURL = self->_conversationURL;
          v41 = conversationURL;
          if (!conversationURL)
          {
            uint64_t v42 = [v8 conversationURL];
            if (!v42)
            {
              id v45 = 0;
              char v13 = 1;
              goto LABEL_88;
            }
            uint64_t v46 = v42;
            v41 = self->_conversationURL;
          }
          objc_super v49 = [(NSURL *)v41 absoluteString];
          v50 = [v8 conversationURL];
          v43 = [v50 absoluteString];
          char v13 = [v49 isEqualToString:v43];

          if (conversationURL)
          {
            int v12 = v51;
            if (!v52)
            {
              v44 = v58;
              goto LABEL_111;
            }
            goto LABEL_89;
          }
          int v12 = v51;
          id v45 = v47;
LABEL_88:

          v44 = v58;
          if ((v52 & 1) == 0)
          {
LABEL_111:
            if (!v44)
            {
LABEL_112:

              if ((v57 & 1) == 0)
              {
LABEL_92:
                if (v61)
                {
                  if (!v62) {
                    goto LABEL_95;
                  }
                }
                else
                {

                  if ((v62 & 1) == 0)
                  {
LABEL_95:
                    if (v65)
                    {
                      if (!v66) {
                        goto LABEL_98;
                      }
                    }
                    else
                    {

                      if ((v66 & 1) == 0)
                      {
LABEL_98:
                        if (v69)
                        {
                          if (!v70)
                          {
LABEL_101:
                            if (v72)
                            {
                              if (!v75) {
                                goto LABEL_36;
                              }
                              goto LABEL_35;
                            }

                            goto LABEL_34;
                          }
                        }
                        else
                        {

                          if ((v70 & 1) == 0) {
                            goto LABEL_101;
                          }
                        }
LABEL_100:

                        goto LABEL_101;
                      }
                    }
LABEL_97:

                    goto LABEL_98;
                  }
                }
LABEL_94:

                goto LABEL_95;
              }
LABEL_91:

              goto LABEL_92;
            }
LABEL_90:
            if (!v57) {
              goto LABEL_92;
            }
            goto LABEL_91;
          }
LABEL_89:

          if (!v58) {
            goto LABEL_112;
          }
          goto LABEL_90;
        }
      }
    }
  }
  char v13 = 0;
  int v12 = v17;
LABEL_34:
  if (v75) {
LABEL_35:
  }

LABEL_36:
  if (!sourceBundleID)
  {

    if ((v77 & 1) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (v77) {
LABEL_38:
  }

LABEL_39:
  if (!deviceID)
  {

    if ((v12 & 1) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if (v12) {
LABEL_41:
  }

LABEL_42:
  if (!childID) {

  }
LABEL_45:
  return v13;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)isValidWithContext:(id)a3 error:(id *)a4
{
  return 1;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)childID
{
  return self->_childID;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (unint64_t)eventDirection
{
  return self->_eventDirection;
}

- (void)setEventDirection:(unint64_t)a3
{
  self->_unint64_t eventDirection = a3;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_unint64_t eventType = a3;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_unint64_t contentType = a3;
}

- (unsigned)contentCount
{
  return self->_contentCount;
}

- (void)setContentCount:(unsigned int)a3
{
  self->_contentCount = a3;
}

- (NSArray)contactHandles
{
  return self->_contactHandles;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (NSURL)conversationURL
{
  return self->_conversationURL;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_conversationURL, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);

  objc_storeStrong((id *)&self->_childID, 0);
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "BMCommunicationSafetyResultEvent: Mismatched data versions (%u != %u) cannot deserialize", v1, 0xEu);
}

- (void)json
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "BMCommunicationSafetyResultEvent: Unable to create json from object: %@", v1, 0xCu);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  os_log_t v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMCommunicationSafetyResultEvent: unable to convert BMPBCommunicationSafetyResultContentType enum value: %@", v3, v4, v5, v6, v7);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  os_log_t v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMCommunicationSafetyResultEvent: unable to convert BMPBCommunicationSafetyResultEventType enum value: %@", v3, v4, v5, v6, v7);
}

- (void)initWithProto:.cold.3()
{
  OUTLINED_FUNCTION_2_1();
  os_log_t v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMCommunicationSafetyResultEvent: unable to convert BMPBCommunicationSafetyResultEventDirection enum value: %@", v3, v4, v5, v6, v7);
}

- (void)initWithProto:(os_log_t)log .cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMCommunicationSafetyResultEvent: tried to initialize with a non-BMCommunicationSafetyResultEvent proto", v1, 2u);
}

- (void)proto
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMCommunicationSafetyResultEvent: unable to convert BMCommunicationSafetyResultEventDirection enum value: %@", v4, v5, v6, v7, v8);
}

@end