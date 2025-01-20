@interface AFAnalyticsEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventsReferenceTime;
- (AFAnalyticsEvent)init;
- (AFAnalyticsEvent)initWithCoder:(id)a3;
- (AFAnalyticsEvent)initWithDeliveryStream:(unint64_t)a3 type:(int64_t)a4 timestamp:(unint64_t)a5 contextDataType:(int64_t)a6 contextData:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSData)contextData;
- (NSString)assistantId;
- (NSString)speechId;
- (id)contextDataAsDictionary;
- (id)contextDataAsProtobuf;
- (id)dateStamp;
- (id)legacyTypeName;
- (id)typeName;
- (int64_t)contextDataType;
- (int64_t)type;
- (unint64_t)deliveryStream;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setAssistantId:(id)a3;
- (void)setSpeechId:(id)a3;
@end

@implementation AFAnalyticsEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_assistantId, 0);
  objc_storeStrong((id *)&self->_contextData, 0);
}

- (void)setSpeechId:(id)a3
{
}

- (NSString)speechId
{
  return self->_speechId;
}

- (void)setAssistantId:(id)a3
{
}

- (NSString)assistantId
{
  return self->_assistantId;
}

- (NSData)contextData
{
  return self->_contextData;
}

- (int64_t)contextDataType
{
  return self->_contextDataType;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)deliveryStream
{
  return self->_deliveryStream;
}

- (AFAnalyticsEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFAnalyticsEvent;
  v5 = [(AFAnalyticsEvent *)&v14 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    v5->_deliveryStream = [v4 decodeIntegerForKey:@"_deliveryStream"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_timestamp"];
    v5->_timestamp = [v6 unsignedLongLongValue];

    v5->_contextDataType = [v4 decodeIntegerForKey:@"_contextDataType"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contextData"];
    contextData = v5->_contextData;
    v5->_contextData = (NSData *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_assistantId"];
    assistantId = v5->_assistantId;
    v5->_assistantId = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_speechId"];
    speechId = v5->_speechId;
    v5->_speechId = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v6 = a3;
  [v6 encodeInteger:type forKey:@"_type"];
  [v6 encodeInteger:self->_deliveryStream forKey:@"_deliveryStream"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_timestamp];
  [v6 encodeObject:v5 forKey:@"_timestamp"];

  [v6 encodeInteger:self->_contextDataType forKey:@"_contextDataType"];
  [v6 encodeObject:self->_contextData forKey:@"_contextData"];
  [v6 encodeObject:self->_assistantId forKey:@"_assistantId"];
  [v6 encodeObject:self->_speechId forKey:@"_speechId"];
}

- (id)dateStamp
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  double v3 = (double)self->_timestamp / 1000000000.0;
  id v4 = +[AFAnalyticsEvent eventsReferenceTime];
  v5 = [v2 dateWithTimeInterval:v4 sinceDate:v3];

  return v5;
}

- (id)contextDataAsProtobuf
{
  if (self->_contextDataType == 4)
  {
    unint64_t deliveryStream = self->_deliveryStream;
    if (deliveryStream == 2)
    {
      p_contextData = &self->_contextData;
      if (self->_contextData)
      {
        id v4 = (Class *)0x1E4FA1248;
        goto LABEL_8;
      }
    }
    else if (deliveryStream == 1)
    {
      p_contextData = &self->_contextData;
      if (self->_contextData)
      {
        id v4 = (Class *)off_1E5923B68;
LABEL_8:
        v5 = (void *)[objc_alloc(*v4) initWithData:*p_contextData];
        goto LABEL_10;
      }
    }
  }
  v5 = 0;
LABEL_10:
  return v5;
}

- (id)contextDataAsDictionary
{
  int64_t contextDataType = self->_contextDataType;
  switch(contextDataType)
  {
    case 4:
      id v6 = [(AFAnalyticsEvent *)self contextDataAsProtobuf];
      uint64_t v7 = objc_msgSend(v6, "si_dictionaryRepresentation");
      id v4 = AFAnalyticsSafeContextForJson(v7);

      id v8 = 0;
      goto LABEL_11;
    case 2:
      contextData = self->_contextData;
      uint64_t v11 = 0;
      id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:contextData options:0 error:&v11];
      v5 = v11;
      break;
    case 1:
      double v3 = self->_contextData;
      v12 = 0;
      id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v12];
      v5 = v12;
      break;
    default:
      id v8 = 0;
      goto LABEL_10;
  }
  id v8 = v5;
  if (!v8) {
    goto LABEL_11;
  }

LABEL_10:
  id v4 = 0;
LABEL_11:

  return v4;
}

- (id)legacyTypeName
{
  unint64_t deliveryStream = self->_deliveryStream;
  if (deliveryStream - 1 >= 2)
  {
    if (deliveryStream) {
      goto LABEL_6;
    }
    AFAnalyticsEventTypeGetLegacyName((__CFString *)self->_type);
    double v3 = (const char *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v3 = [(AFAnalyticsEvent *)self typeName];
  }
  a2 = v3;
LABEL_6:
  return (id)(id)a2;
}

- (id)typeName
{
  unint64_t deliveryStream = self->_deliveryStream;
  switch(deliveryStream)
  {
    case 2uLL:
      v5 = [(AFAnalyticsEvent *)self contextDataAsProtobuf];
      unsigned int v6 = [(__CFString *)v5 anyEventType] - 1;
      if (v6 > 0x6C) {
        uint64_t v7 = @"UNKNOWN_EVENT";
      }
      else {
        uint64_t v7 = off_1E592B9C0[v6];
      }
LABEL_12:
      v2 = [@"instrumentation." stringByAppendingString:v7];

      break;
    case 1uLL:
      id v8 = (objc_class *)SIReflectionInferClassFromEventType();
      if (v8) {
        NSStringFromClass(v8);
      }
      else {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown.%ld", self->_type);
      }
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = v5;
      goto LABEL_12;
    case 0uLL:
      v2 = AFAnalyticsEventTypeGetName(self->_type);
      break;
  }
  return v2;
}

- (AFAnalyticsEvent)initWithDeliveryStream:(unint64_t)a3 type:(int64_t)a4 timestamp:(unint64_t)a5 contextDataType:(int64_t)a6 contextData:(id)a7
{
  id v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)AFAnalyticsEvent;
  v13 = [(AFAnalyticsEvent *)&v18 init];
  objc_super v14 = v13;
  if (v13)
  {
    v13->_unint64_t deliveryStream = a3;
    v13->_int64_t type = a4;
    v13->_timestamp = a5;
    v13->_int64_t contextDataType = a6;
    uint64_t v15 = [v12 copy];
    contextData = v14->_contextData;
    v14->_contextData = (NSData *)v15;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    int64_t type = self->_type;
    if (type == [v5 type]
      && (unint64_t timestamp = self->_timestamp, timestamp == [v5 timestamp])
      && (int64_t contextDataType = self->_contextDataType, contextDataType == [v5 contextDataType]))
    {
      contextData = self->_contextData;
      v10 = [v5 contextData];
      if ([(NSData *)contextData isEqualToData:v10]
        && (unint64_t deliveryStream = self->_deliveryStream, deliveryStream == [v5 deliveryStream]))
      {
        assistantId = self->_assistantId;
        v13 = [v5 assistantId];
        if ([(NSString *)assistantId isEqualToString:v13])
        {
          speechId = self->_speechId;
          uint64_t v15 = [v5 speechId];
          BOOL v16 = [(NSString *)speechId isEqualToString:v15];
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  double v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_type];
  uint64_t v4 = [v3 hash];
  id v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_timestamp];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_contextDataType];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSData *)self->_contextData hash];
  v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_deliveryStream];
  uint64_t v11 = [v10 hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_assistantId hash];
  NSUInteger v13 = v9 ^ v12 ^ [(NSString *)self->_speechId hash];

  return v13;
}

- (AFAnalyticsEvent)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventsReferenceTime
{
  v2 = (void *)_eventsReferenceTime;
  if (!_eventsReferenceTime)
  {
    double v3 = (void *)MEMORY[0x1E4F1C9C8];
    if (AFSystemGetBootTimeInMicroseconds_onceToken != -1) {
      dispatch_once(&AFSystemGetBootTimeInMicroseconds_onceToken, &__block_literal_global_501);
    }
    uint64_t v4 = [v3 dateWithTimeIntervalSince1970:(double)(unint64_t)AFSystemGetBootTimeInMicroseconds_bootTime / 1000000.0];
    id v5 = (void *)_eventsReferenceTime;
    _eventsReferenceTime = v4;

    v2 = (void *)_eventsReferenceTime;
  }
  return v2;
}

@end