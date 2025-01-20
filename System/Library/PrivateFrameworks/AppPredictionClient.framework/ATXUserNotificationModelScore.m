@interface ATXUserNotificationModelScore
+ (BOOL)supportsSecureCoding;
- (ATXUserNotificationModelScore)initWithCoder:(id)a3;
- (ATXUserNotificationModelScore)initWithProto:(id)a3;
- (ATXUserNotificationModelScore)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXUserNotificationModelScore:(id)a3;
- (NSData)scoreInfo;
- (NSString)modelId;
- (NSUUID)scoreUUID;
- (double)score;
- (double)scoreTimestamp;
- (id)encodeAsProto;
- (id)initFromJSON:(id)a3;
- (id)initFromModelScoreData:(id)a3 modelVersion:(unint64_t)a4 score:(double)a5 scoreTimestamp:(double)a6 scoreUUID:(id)a7 scoreInfo:(id)a8;
- (id)jsonRepresentation;
- (id)proto;
- (unint64_t)modelVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXUserNotificationModelScore

- (id)initFromModelScoreData:(id)a3 modelVersion:(unint64_t)a4 score:(double)a5 scoreTimestamp:(double)a6 scoreUUID:(id)a7 scoreInfo:(id)a8
{
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)ATXUserNotificationModelScore;
  v18 = [(ATXUserNotificationModelScore *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_modelId, a3);
    v19->_modelVersion = a4;
    v19->_score = a5;
    v19->_scoreTimestamp = a6;
    objc_storeStrong((id *)&v19->_scoreUUID, a7);
    objc_storeStrong((id *)&v19->_scoreInfo, a8);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXUserNotificationModelScore *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXUserNotificationModelScore *)self isEqualToATXUserNotificationModelScore:v5];

  return v6;
}

- (BOOL)isEqualToATXUserNotificationModelScore:(id)a3
{
  v4 = (id *)a3;
  modelId = self->_modelId;
  BOOL v6 = (NSString *)v4[1];
  if (modelId == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = modelId;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_8;
    }
  }
  if (self->_modelVersion != v4[2]
    || self->_score != *((double *)v4 + 3)
    || self->_scoreTimestamp != *((double *)v4 + 4))
  {
    goto LABEL_8;
  }
  scoreUUID = self->_scoreUUID;
  v13 = (NSUUID *)v4[5];
  if (scoreUUID == v13)
  {
  }
  else
  {
    v14 = v13;
    id v15 = scoreUUID;
    char v16 = [(NSUUID *)v15 isEqual:v14];

    if ((v16 & 1) == 0)
    {
LABEL_8:
      char v10 = 0;
      goto LABEL_9;
    }
  }
  id v17 = self->_scoreInfo;
  v18 = v17;
  if (v17 == v4[6]) {
    char v10 = 1;
  }
  else {
    char v10 = -[NSData isEqual:](v17, "isEqual:");
  }

LABEL_9:
  return v10;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBUserNotificationModelScore alloc] initFromJSON:v4];

  BOOL v6 = [(ATXUserNotificationModelScore *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(ATXUserNotificationModelScore *)self proto];
  v3 = [v2 jsonRepresentation];

  return v3;
}

- (ATXUserNotificationModelScore)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBUserNotificationModelScore alloc] initWithData:v4];

    self = [(ATXUserNotificationModelScore *)self initWithProto:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXUserNotificationModelScore *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXUserNotificationModelScore)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    char v16 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[ATXDigestTimeline initWithProto:]((uint64_t)self, v17);
    }

    goto LABEL_7;
  }
  id v5 = v4;
  BOOL v6 = [v5 modelId];
  uint64_t v7 = [v5 modelVersion];
  [v5 score];
  double v9 = v8;
  [v5 scoreTimestamp];
  double v11 = v10;
  id v12 = objc_alloc(MEMORY[0x1E4F29128]);
  v13 = [v5 scoreUUID];
  v14 = (void *)[v12 initWithUUIDString:v13];
  id v15 = [v5 scoreInfo];

  self = (ATXUserNotificationModelScore *)[(ATXUserNotificationModelScore *)self initFromModelScoreData:v6 modelVersion:v7 score:v14 scoreTimestamp:v15 scoreUUID:v9 scoreInfo:v11];
  char v16 = self;
LABEL_8:

  return v16;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setModelId:self->_modelId];
  [v3 setModelVersion:self->_modelVersion];
  [v3 setScore:self->_score];
  [v3 setScoreTimestamp:self->_scoreTimestamp];
  id v4 = [(NSUUID *)self->_scoreUUID UUIDString];
  [v3 setScoreUUID:v4];

  [v3 setScoreInfo:self->_scoreInfo];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXUserNotificationModelScore *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXUserNotificationModelScore)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  if (v5)
  {
    self = [(ATXUserNotificationModelScore *)self initWithProtoData:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSString)modelId
{
  return self->_modelId;
}

- (unint64_t)modelVersion
{
  return self->_modelVersion;
}

- (double)score
{
  return self->_score;
}

- (double)scoreTimestamp
{
  return self->_scoreTimestamp;
}

- (NSUUID)scoreUUID
{
  return self->_scoreUUID;
}

- (NSData)scoreInfo
{
  return self->_scoreInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreInfo, 0);
  objc_storeStrong((id *)&self->_scoreUUID, 0);

  objc_storeStrong((id *)&self->_modelId, 0);
}

@end