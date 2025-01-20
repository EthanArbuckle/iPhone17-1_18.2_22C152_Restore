@interface ASRelationshipEvent
+ (id)_relationshipEventWithCodable:(id)a3;
+ (id)relationshipEventWithRecord:(id)a3;
- (ASRelationshipEvent)initWithType:(unsigned __int16)a3 anchor:(unsigned __int16)a4 timestamp:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRelationshipEvent:(id)a3;
- (NSDate)timestamp;
- (id)_codableRelationshipEvent;
- (id)description;
- (unsigned)anchor;
- (unsigned)type;
@end

@implementation ASRelationshipEvent

- (id)_codableRelationshipEvent
{
  v3 = objc_alloc_init(ASCodableCloudKitRelationshipEvent);
  [(ASCodableCloudKitRelationshipEvent *)v3 setAnchor:[(ASRelationshipEvent *)self anchor]];
  [(ASCodableCloudKitRelationshipEvent *)v3 setType:[(ASRelationshipEvent *)self type]];
  v4 = [(ASRelationshipEvent *)self timestamp];
  [v4 timeIntervalSinceReferenceDate];
  -[ASCodableCloudKitRelationshipEvent setDate:](v3, "setDate:");

  return v3;
}

+ (id)_relationshipEventWithCodable:(id)a3
{
  id v3 = a3;
  unsigned __int16 v4 = [v3 anchor];
  unsigned __int16 v5 = [v3 type];
  v6 = (void *)MEMORY[0x263EFF910];
  [v3 date];
  double v8 = v7;

  v9 = [v6 dateWithTimeIntervalSinceReferenceDate:v8];
  v10 = [[ASRelationshipEvent alloc] initWithType:v5 anchor:v4 timestamp:v9];

  return v10;
}

+ (id)relationshipEventWithRecord:(id)a3
{
  id v3 = a3;
  if (_ASCloudKitSchemaVersionForRecord(v3) == 2)
  {
    unsigned __int16 v4 = [v3 encryptedValues];
    id v5 = [v4 objectForKeyedSubscript:@"EncryptedData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v6)
    {
      double v8 = [[ASCodableCloudKitRelationshipEvent alloc] initWithData:v6];
      unsigned __int16 v9 = [(ASCodableCloudKitRelationshipEvent *)v8 anchor];
      unsigned __int16 v10 = [(ASCodableCloudKitRelationshipEvent *)v8 type];
      v11 = [v3 creationDate];
      double v7 = [[ASRelationshipEvent alloc] initWithType:v10 anchor:v9 timestamp:v11];
    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
        +[ASRelationshipEvent(CloudKitCoding) relationshipEventWithRecord:]();
      }
      double v7 = 0;
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR)) {
      +[ASRelationshipEvent(CloudKitCoding) relationshipEventWithRecord:]();
    }
    double v7 = 0;
  }

  return v7;
}

- (ASRelationshipEvent)initWithType:(unsigned __int16)a3 anchor:(unsigned __int16)a4 timestamp:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ASRelationshipEvent;
  unsigned __int16 v10 = [(ASRelationshipEvent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_anchor = a4;
    objc_storeStrong((id *)&v10->_timestamp, a5);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 v4 = (ASRelationshipEvent *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(ASRelationshipEvent *)self isEqualToRelationshipEvent:v4];
  }

  return v5;
}

- (BOOL)isEqualToRelationshipEvent:(id)a3
{
  id v4 = a3;
  int anchor = self->_anchor;
  if (anchor == [v4 anchor]
    && (int type = self->_type, type == [v4 type]))
  {
    timestamp = self->_timestamp;
    double v8 = [v4 timestamp];
    BOOL v9 = [(NSDate *)timestamp isEqualToDate:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  id v3 = NSString;
  uint64_t anchor = self->_anchor;
  BOOL v5 = NSStringFromASRelationshipEventType(self->_type);
  id v6 = [v3 stringWithFormat:@"[%d: %@ at %@]", anchor, v5, self->_timestamp];

  return v6;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)anchor
{
  return self->_anchor;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end