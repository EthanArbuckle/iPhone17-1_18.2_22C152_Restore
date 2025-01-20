@interface BMInferredModeEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeIdentifier:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 uuid:(id)a12 serializedTriggers:(id)a13;
- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeIdentifier:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 uuid:(id)a12 serializedTriggers:(id)a13 modeType:(unint64_t)a14;
- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeUUID:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 suggestionUUID:(id)a12 serializedTriggers:(id)a13 modeType:(unint64_t)a14;
- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeUUID:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 suggestionUUID:(id)a12 serializedTriggers:(id)a13 shouldSuggestTriggers:(BOOL)a14 modeType:(unint64_t)a15;
- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeUUID:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 suggestionUUID:(id)a12 serializedTriggers:(id)a13 shouldSuggestTriggers:(BOOL)a14 modeType:(unint64_t)a15 userModeName:(id)a16;
- (BMInferredModeEvent)initWithProto:(id)a3;
- (BMInferredModeEvent)initWithProtoData:(id)a3;
- (BOOL)isAutomationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStart;
- (BOOL)shouldSuggestTriggers;
- (NSArray)serializedTriggers;
- (NSString)modeIdentifier;
- (NSString)modeUUID;
- (NSString)originAnchorType;
- (NSString)originBundleId;
- (NSString)suggestionUUID;
- (NSString)userModeName;
- (NSString)uuid;
- (double)absoluteTimestamp;
- (double)confidenceScore;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (int64_t)origin;
- (unint64_t)modeType;
- (unint64_t)uiLocation;
- (unsigned)dataVersion;
- (void)proto;
@end

@implementation BMInferredModeEvent

- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeIdentifier:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 uuid:(id)a12 serializedTriggers:(id)a13
{
  LOBYTE(v15) = 1;
  LOBYTE(v14) = a10;
  return [(BMInferredModeEvent *)self initWithAbsoluteTimestamp:a4 modeUUID:a5 origin:a6 originBundleId:a7 originAnchorType:a8 isAutomationEnabled:a9 uiLocation:a3 isStart:a11 confidenceScore:v14 suggestionUUID:a12 serializedTriggers:a13 shouldSuggestTriggers:v15 modeType:0 userModeName:0];
}

- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeIdentifier:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 uuid:(id)a12 serializedTriggers:(id)a13 modeType:(unint64_t)a14
{
  LOBYTE(v16) = 1;
  LOBYTE(v15) = a10;
  return [(BMInferredModeEvent *)self initWithAbsoluteTimestamp:a4 modeUUID:a5 origin:a6 originBundleId:a7 originAnchorType:a8 isAutomationEnabled:a9 uiLocation:a3 isStart:a11 confidenceScore:v15 suggestionUUID:a12 serializedTriggers:a13 shouldSuggestTriggers:v16 modeType:a14 userModeName:0];
}

- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeUUID:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 suggestionUUID:(id)a12 serializedTriggers:(id)a13 modeType:(unint64_t)a14
{
  LOBYTE(v16) = 1;
  LOBYTE(v15) = a10;
  return [(BMInferredModeEvent *)self initWithAbsoluteTimestamp:a4 modeUUID:a5 origin:a6 originBundleId:a7 originAnchorType:a8 isAutomationEnabled:a9 uiLocation:a3 isStart:a11 confidenceScore:v15 suggestionUUID:a12 serializedTriggers:a13 shouldSuggestTriggers:v16 modeType:a14 userModeName:0];
}

- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeUUID:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 suggestionUUID:(id)a12 serializedTriggers:(id)a13 shouldSuggestTriggers:(BOOL)a14 modeType:(unint64_t)a15
{
  LOBYTE(v17) = a14;
  LOBYTE(v16) = a10;
  return [(BMInferredModeEvent *)self initWithAbsoluteTimestamp:a4 modeUUID:a5 origin:a6 originBundleId:a7 originAnchorType:a8 isAutomationEnabled:a9 uiLocation:a3 isStart:a11 confidenceScore:v16 suggestionUUID:a12 serializedTriggers:a13 shouldSuggestTriggers:v17 modeType:a15 userModeName:0];
}

- (BMInferredModeEvent)initWithAbsoluteTimestamp:(double)a3 modeUUID:(id)a4 origin:(int64_t)a5 originBundleId:(id)a6 originAnchorType:(id)a7 isAutomationEnabled:(BOOL)a8 uiLocation:(unint64_t)a9 isStart:(BOOL)a10 confidenceScore:(double)a11 suggestionUUID:(id)a12 serializedTriggers:(id)a13 shouldSuggestTriggers:(BOOL)a14 modeType:(unint64_t)a15 userModeName:(id)a16
{
  id v23 = a4;
  id v24 = a6;
  id v25 = a7;
  id v26 = a12;
  id v27 = a13;
  id v28 = a16;
  v45.receiver = self;
  v45.super_class = (Class)BMInferredModeEvent;
  v29 = [(BMInferredModeEvent *)&v45 init];
  v30 = v29;
  if (v29)
  {
    v29->_absoluteTimestamp = a3;
    uint64_t v31 = [v23 copy];
    modeUUID = v30->_modeUUID;
    v30->_modeUUID = (NSString *)v31;

    v30->_origin = a5;
    uint64_t v33 = [v24 copy];
    originBundleId = v30->_originBundleId;
    v30->_originBundleId = (NSString *)v33;

    uint64_t v35 = [v25 copy];
    originAnchorType = v30->_originAnchorType;
    v30->_originAnchorType = (NSString *)v35;

    v30->_isAutomationEnabled = a8;
    v30->_uiLocation = a9;
    v30->_isStart = a10;
    v30->_confidenceScore = a11;
    uint64_t v37 = [v26 copy];
    suggestionUUID = v30->_suggestionUUID;
    v30->_suggestionUUID = (NSString *)v37;

    uint64_t v39 = [v27 copy];
    serializedTriggers = v30->_serializedTriggers;
    v30->_serializedTriggers = (NSArray *)v39;

    v30->_shouldSuggestTriggers = a14;
    v30->_modeType = a15;
    uint64_t v41 = [v28 copy];
    userModeName = v30->_userModeName;
    v30->_userModeName = (NSString *)v41;
  }
  return v30;
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
    v7 = (objc_class *)BMInferredModeEvent_v2;
LABEL_5:
    v8 = (void *)[[v7 alloc] initWithProtoData:v6];
    goto LABEL_9;
  }
  v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[BMInferredModeEvent eventWithData:dataVersion:](a4, v9);
  }

  v8 = 0;
LABEL_9:

  return v8;
}

- (NSString)modeIdentifier
{
  return self->_modeUUID;
}

- (NSString)uuid
{
  return self->_suggestionUUID;
}

- (id)jsonDict
{
  v23[14] = *MEMORY[0x1E4F143B8];
  v22[0] = @"absoluteTimeStamp";
  uint64_t v3 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  v21 = (void *)v3;
  modeUUID = (__CFString *)self->_modeUUID;
  if (!modeUUID) {
    modeUUID = @"nil";
  }
  v23[0] = v3;
  v23[1] = modeUUID;
  v22[1] = @"modeUUID";
  v22[2] = @"origin";
  uint64_t v5 = [NSNumber numberWithInteger:self->_origin];
  id v6 = (void *)v5;
  originBundleId = (__CFString *)self->_originBundleId;
  if (!originBundleId) {
    originBundleId = @"nil";
  }
  v23[2] = v5;
  v23[3] = originBundleId;
  v22[3] = @"originBundleId";
  v22[4] = @"originAnchorType";
  originAnchorType = (__CFString *)self->_originAnchorType;
  if (!originAnchorType) {
    originAnchorType = @"nil";
  }
  v23[4] = originAnchorType;
  v22[5] = @"isAutomationEnabled";
  v9 = [NSNumber numberWithBool:self->_isAutomationEnabled];
  v23[5] = v9;
  v22[6] = @"uiLocation";
  v10 = [NSNumber numberWithUnsignedInteger:self->_uiLocation];
  v23[6] = v10;
  v22[7] = @"isStart";
  v11 = [NSNumber numberWithBool:self->_isStart];
  v23[7] = v11;
  v22[8] = @"confidenceScore";
  v12 = [NSNumber numberWithDouble:self->_confidenceScore];
  suggestionUUID = self->_suggestionUUID;
  v23[8] = v12;
  v23[9] = suggestionUUID;
  v22[9] = @"suggestionUUID";
  v22[10] = @"serializedTriggersCount";
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_serializedTriggers, "count"));
  v23[10] = v14;
  v22[11] = @"shouldSuggestTriggers";
  uint64_t v15 = [NSNumber numberWithBool:self->_shouldSuggestTriggers];
  v23[11] = v15;
  v22[12] = @"modeType";
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:self->_modeType];
  uint64_t v17 = (void *)v16;
  v22[13] = @"userModeName";
  userModeName = (__CFString *)self->_userModeName;
  if (!userModeName) {
    userModeName = @"nil";
  }
  v23[12] = v16;
  v23[13] = userModeName;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:14];

  return v19;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v3 = [(BMInferredModeEvent *)self jsonDict];
  uint64_t v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  uint64_t v5 = v8;

  if (v5)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMDeviceMetadataEvent json](v6);
    }
  }

  return v4;
}

- (id)encodeAsProto
{
  v2 = [(BMInferredModeEvent *)self proto];
  uint64_t v3 = [v2 data];

  return v3;
}

- (BMInferredModeEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      [v5 absoluteTimestamp];
      double v7 = v6;
      v30 = [v5 modeIdentifier];
      uint64_t v8 = [v5 origin] + 1;
      if (v8 >= 0x12)
      {
        v11 = __biome_log_for_category();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[BMInferredModeEvent initWithProto:]();
        }

        uint64_t v9 = -1;
      }
      else
      {
        uint64_t v9 = v8 - 1;
      }
      uint64_t v28 = v9;
      v29 = [v5 originBundleId];
      v12 = [v5 originAnchorType];
      unsigned int v27 = [v5 isAutomationEnabled];
      uint64_t v26 = [v5 uiLocation];
      char v13 = [v5 isStart];
      [v5 confidenceScore];
      double v15 = v14;
      uint64_t v16 = [v5 uuid];
      uint64_t v17 = [v5 serializedTriggers];
      char v18 = [v5 shouldSuggestTriggers];
      unsigned int v19 = [v5 modeType];
      if (v19 >= 0x11)
      {
        v21 = __biome_log_for_category();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[BMInferredModeEvent initWithProto:]();
        }

        uint64_t v20 = 1;
      }
      else
      {
        uint64_t v20 = v19;
      }
      v22 = [v5 userModeName];
      LOBYTE(v25) = v18;
      LOBYTE(v24) = v13;
      self = [(BMInferredModeEvent *)self initWithAbsoluteTimestamp:v30 modeUUID:v28 origin:v29 originBundleId:v12 originAnchorType:v27 isAutomationEnabled:v26 uiLocation:v7 isStart:v15 confidenceScore:v24 suggestionUUID:v16 serializedTriggers:v17 shouldSuggestTriggers:v25 modeType:v20 userModeName:v22];

      v10 = self;
    }
    else
    {
      uint64_t v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMInferredModeEvent initWithProto:]();
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

- (BMInferredModeEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [[BMPBInferredModeEvent alloc] initWithData:v4];

    self = [(BMInferredModeEvent *)self initWithProto:v5];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v3 = objc_opt_new();
  [v3 setAbsoluteTimestamp:self->_absoluteTimestamp];
  [v3 setModeIdentifier:self->_modeUUID];
  int64_t origin = self->_origin;
  uint64_t v5 = 0xFFFFFFFFLL;
  int v6 = 1;
  switch(origin)
  {
    case -1:
      break;
    case 0:
      uint64_t v5 = 0;
      break;
    case 1:
      uint64_t v5 = 1;
      break;
    case 2:
      uint64_t v5 = 2;
      break;
    case 3:
      uint64_t v5 = 3;
      break;
    case 4:
      uint64_t v5 = 4;
      break;
    case 5:
      uint64_t v5 = 5;
      break;
    case 6:
      uint64_t v5 = 6;
      break;
    case 7:
      uint64_t v5 = 7;
      break;
    case 8:
      uint64_t v5 = 8;
      break;
    case 9:
      uint64_t v5 = 9;
      break;
    case 10:
      uint64_t v5 = 10;
      break;
    case 11:
      uint64_t v5 = 11;
      break;
    case 12:
      uint64_t v5 = 12;
      break;
    case 13:
      uint64_t v5 = 13;
      break;
    case 14:
      uint64_t v5 = 14;
      break;
    case 15:
      uint64_t v5 = 15;
      break;
    case 16:
      uint64_t v5 = 16;
      break;
    default:
      double v7 = __biome_log_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[BMInferredModeEvent proto](origin);
      }

      int v6 = 0;
      uint64_t v5 = 0xFFFFFFFFLL;
      break;
  }
  unint64_t modeType = self->_modeType;
  if (modeType >= 0x11)
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMInferredModeEvent proto](modeType);
    }
  }
  else if (v6)
  {
    [v3 setOrigin:v5];
    [v3 setOriginBundleId:self->_originBundleId];
    [v3 setOriginAnchorType:self->_originAnchorType];
    [v3 setIsAutomationEnabled:self->_isAutomationEnabled];
    [v3 setUiLocation:self->_uiLocation];
    [v3 setIsStart:self->_isStart];
    [v3 setConfidenceScore:self->_confidenceScore];
    [v3 setUuid:self->_suggestionUUID];
    uint64_t v9 = (void *)[(NSArray *)self->_serializedTriggers mutableCopy];
    [v3 setSerializedTriggers:v9];

    [v3 setShouldSuggestTriggers:self->_shouldSuggestTriggers];
    [v3 setModeType:modeType];
    [v3 setUserModeName:self->_userModeName];
    id v10 = v3;
    goto LABEL_29;
  }
  id v10 = 0;
LABEL_29:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    double absoluteTimestamp = self->_absoluteTimestamp;
    [v8 absoluteTimestamp];
    if (vabdd_f64(absoluteTimestamp, v10) >= 0.01)
    {
      BOOL v15 = 0;
      goto LABEL_50;
    }
    modeUUID = self->_modeUUID;
    v12 = modeUUID;
    if (!modeUUID)
    {
      uint64_t v3 = [v8 modeUUID];
      if (!v3)
      {
        int64_t origin = self->_origin;
        uint64_t v17 = [v8 origin];
        int v14 = 0;
        BOOL v15 = 0;
        if (origin != v17)
        {
LABEL_49:

          goto LABEL_50;
        }
        goto LABEL_14;
      }
      v12 = self->_modeUUID;
    }
    id v4 = [v8 modeUUID];
    if (![(NSString *)v12 isEqualToString:v4])
    {

      BOOL v15 = 0;
      goto LABEL_48;
    }
    int64_t v13 = self->_origin;
    if (v13 != [v8 origin])
    {
      BOOL v15 = 0;
      goto LABEL_47;
    }
    int v14 = 1;
LABEL_14:
    int v49 = v14;
    originBundleId = self->_originBundleId;
    unsigned int v19 = originBundleId;
    if (!originBundleId)
    {
      uint64_t v20 = [v8 originBundleId];
      if (!v20)
      {
        v47 = 0;
        int v48 = 0;
        goto LABEL_21;
      }
      v47 = (void *)v20;
      unsigned int v19 = self->_originBundleId;
    }
    uint64_t v5 = [v8 originBundleId];
    if (![(NSString *)v19 isEqualToString:v5])
    {
      BOOL v15 = 0;
      goto LABEL_45;
    }
    int v48 = 1;
LABEL_21:
    originAnchorType = self->_originAnchorType;
    v22 = originAnchorType;
    if (!originAnchorType)
    {
      uint64_t v23 = [v8 originAnchorType];
      if (!v23)
      {
        objc_super v45 = 0;
        int v46 = 0;
        goto LABEL_28;
      }
      objc_super v45 = (void *)v23;
      v22 = self->_originAnchorType;
    }
    uint64_t v24 = [v8 originAnchorType];
    uint64_t v25 = v22;
    uint64_t v26 = (void *)v24;
    if (![(NSString *)v25 isEqualToString:v24])
    {

      BOOL v15 = 0;
      goto LABEL_43;
    }
    v44 = v26;
    int v46 = 1;
LABEL_28:
    int isAutomationEnabled = self->_isAutomationEnabled;
    if (isAutomationEnabled != [v8 isAutomationEnabled]) {
      goto LABEL_40;
    }
    unint64_t uiLocation = self->_uiLocation;
    if (uiLocation != [v8 uiLocation]) {
      goto LABEL_40;
    }
    int isStart = self->_isStart;
    if (isStart != [v8 isStart]) {
      goto LABEL_40;
    }
    double confidenceScore = self->_confidenceScore;
    [v8 confidenceScore];
    double v32 = confidenceScore - v31;
    if (v32 < 0.0) {
      double v32 = -v32;
    }
    if (v32 >= 2.22044605e-16)
    {
LABEL_40:
      BOOL v15 = 0;
      goto LABEL_41;
    }
    suggestionUUID = self->_suggestionUUID;
    v43 = suggestionUUID;
    if (!suggestionUUID)
    {
      uint64_t v34 = [v8 suggestionUUID];
      if (!v34)
      {
        unint64_t modeType = self->_modeType;
        char v40 = 0;
        uint64_t v41 = 0;
        BOOL v15 = 0;
        if (modeType != [v8 modeType])
        {
LABEL_64:

LABEL_41:
          if ((v46 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_42;
        }
        goto LABEL_62;
      }
      uint64_t v41 = (void *)v34;
      suggestionUUID = self->_suggestionUUID;
    }
    v42 = [v8 suggestionUUID];
    if (!-[NSString isEqualToString:](suggestionUUID, "isEqualToString:")
      || (unint64_t v35 = self->_modeType, v35 != [v8 modeType]))
    {
      BOOL v15 = 0;
      goto LABEL_57;
    }
    char v40 = 1;
LABEL_62:
    int shouldSuggestTriggers = self->_shouldSuggestTriggers;
    BOOL v15 = shouldSuggestTriggers == [v8 shouldSuggestTriggers];
    if ((v40 & 1) == 0)
    {
LABEL_58:
      if (v43)
      {
        if (!v46)
        {
LABEL_43:
          if (originAnchorType)
          {
            if (v48) {
              goto LABEL_45;
            }
          }
          else
          {

            if (v48)
            {
LABEL_45:
              int v36 = v49;

              if (originBundleId) {
                goto LABEL_46;
              }
LABEL_54:

              if ((v36 & 1) == 0)
              {
LABEL_48:
                if (!modeUUID) {
                  goto LABEL_49;
                }
LABEL_50:

                goto LABEL_51;
              }
LABEL_47:

              goto LABEL_48;
            }
          }
          int v36 = v49;
          if (originBundleId)
          {
LABEL_46:
            if (!v36) {
              goto LABEL_48;
            }
            goto LABEL_47;
          }
          goto LABEL_54;
        }
LABEL_42:

        goto LABEL_43;
      }
      goto LABEL_64;
    }
LABEL_57:

    goto LABEL_58;
  }
  BOOL v15 = 0;
LABEL_51:

  return v15;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (NSString)suggestionUUID
{
  return self->_suggestionUUID;
}

- (int64_t)origin
{
  return self->_origin;
}

- (NSString)originBundleId
{
  return self->_originBundleId;
}

- (BOOL)isAutomationEnabled
{
  return self->_isAutomationEnabled;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (BOOL)shouldSuggestTriggers
{
  return self->_shouldSuggestTriggers;
}

- (unint64_t)uiLocation
{
  return self->_uiLocation;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (NSString)originAnchorType
{
  return self->_originAnchorType;
}

- (NSArray)serializedTriggers
{
  return self->_serializedTriggers;
}

- (unint64_t)modeType
{
  return self->_modeType;
}

- (NSString)userModeName
{
  return self->_userModeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userModeName, 0);
  objc_storeStrong((id *)&self->_serializedTriggers, 0);
  objc_storeStrong((id *)&self->_originAnchorType, 0);
  objc_storeStrong((id *)&self->_originBundleId, 0);
  objc_storeStrong((id *)&self->_suggestionUUID, 0);

  objc_storeStrong((id *)&self->_modeUUID, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMInferredModeEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMInferredModeEvent: unable to convert BMPBInferredModeType enum value: %@", v3, v4, v5, v6, v7);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMInferredModeEvent: unable to convert BMPBInferredModeOrigin enum value: %@", v3, v4, v5, v6, v7);
}

- (void)initWithProto:.cold.3()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBInferredModeEvent proto", v4, v5, v6, v7, v8);
}

- (void)proto
{
  uint64_t v1 = [NSNumber numberWithInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMInferredModeEvent: unable to convert BMInferredModeOrigin enum value: %@", v4, v5, v6, v7, v8);
}

@end