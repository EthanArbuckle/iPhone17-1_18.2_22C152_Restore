@interface ATXUserNotificationDerivedData
+ (BOOL)supportsSecureCoding;
- (ATXUserNotificationDerivedData)init;
- (ATXUserNotificationDerivedData)initWithCoder:(id)a3;
- (ATXUserNotificationDerivedData)initWithProto:(id)a3;
- (ATXUserNotificationDerivedData)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXUserNotificationDerivedData:(id)a3;
- (NSArray)getPublicScores;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProto;
- (id)initFromJSON:(id)a3;
- (id)initFromModelScores:(id)a3;
- (id)jsonRepresentation;
- (id)proto;
- (void)addScore:(id)a3;
- (void)addScores:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXUserNotificationDerivedData

- (NSArray)getPublicScores
{
  return (NSArray *)self->_internalScores;
}

- (ATXUserNotificationDerivedData)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXUserNotificationDerivedData;
  v2 = [(ATXUserNotificationDerivedData *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    internalScores = v2->_internalScores;
    v2->_internalScores = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)initFromModelScores:(id)a3
{
  id v4 = a3;
  v5 = [(ATXUserNotificationDerivedData *)self init];
  objc_super v6 = v5;
  if (v5) {
    [(ATXUserNotificationDerivedData *)v5 addScores:v4];
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXUserNotificationDerivedData allocWithZone:a3];
  internalScores = self->_internalScores;

  return [(ATXUserNotificationDerivedData *)v4 initFromModelScores:internalScores];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXUserNotificationDerivedData *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXUserNotificationDerivedData *)self isEqualToATXUserNotificationDerivedData:v5];

  return v6;
}

- (BOOL)isEqualToATXUserNotificationDerivedData:(id)a3
{
  id v4 = self->_internalScores;
  v5 = v4;
  if (v4 == *((NSMutableArray **)a3 + 1)) {
    char v6 = 1;
  }
  else {
    char v6 = -[NSMutableArray isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBUserNotificationDerivedData alloc] initFromJSON:v4];

  char v6 = [(ATXUserNotificationDerivedData *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(ATXUserNotificationDerivedData *)self proto];
  uint64_t v3 = [v2 jsonRepresentation];

  return v3;
}

- (void)addScore:(id)a3
{
}

- (void)addScores:(id)a3
{
}

- (ATXUserNotificationDerivedData)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBUserNotificationDerivedData alloc] initWithData:v4];

    self = [(ATXUserNotificationDerivedData *)self initWithProto:v5];
    char v6 = self;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXUserNotificationDerivedData *)self proto];
  uint64_t v3 = [v2 data];

  return v3;
}

- (ATXUserNotificationDerivedData)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ATXDigestTimeline initWithProto:]((uint64_t)self, v8);
    }

    goto LABEL_8;
  }
  id v5 = [v4 scores];
  char v6 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_22);

  if (v6) {
    v7 = [(ATXUserNotificationDerivedData *)self initFromModelScores:v6];
  }
  else {
    v7 = [(ATXUserNotificationDerivedData *)self init];
  }
  self = v7;

  v9 = self;
LABEL_11:

  return v9;
}

ATXUserNotificationModelScore *__48__ATXUserNotificationDerivedData_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[ATXUserNotificationModelScore alloc] initWithProto:v2];

  return v3;
}

- (id)proto
{
  uint64_t v3 = objc_opt_new();
  id v4 = [(NSMutableArray *)self->_internalScores _pas_mappedArrayWithTransform:&__block_literal_global_13_0];
  id v5 = objc_opt_new();
  [v3 setScores:v5];

  if (v4 && [v4 count])
  {
    char v6 = [v3 scores];
    [v6 addObjectsFromArray:v4];
  }

  return v3;
}

uint64_t __39__ATXUserNotificationDerivedData_proto__block_invoke(uint64_t a1, void *a2)
{
  return [a2 proto];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXUserNotificationDerivedData *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXUserNotificationDerivedData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  if (v5)
  {
    self = [(ATXUserNotificationDerivedData *)self initWithProtoData:v5];
    char v6 = self;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end