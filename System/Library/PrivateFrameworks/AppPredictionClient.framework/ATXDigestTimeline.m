@interface ATXDigestTimeline
+ (BOOL)supportsSecureCoding;
- (ATXDigestTimeline)initWithCoder:(id)a3;
- (ATXDigestTimeline)initWithProto:(id)a3;
- (ATXDigestTimeline)initWithProtoData:(id)a3;
- (BOOL)_timelineFieldsAreEqual:(id)a3 otherField:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXDigestTimeline:(id)a3;
- (NSDate)digestRemovedTimestamp;
- (NSDate)firstCollapsedViewTimestamp;
- (NSDate)firstScheduledViewTimestamp;
- (NSDate)firstUpcomingViewTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProto;
- (id)initFromJSON:(id)a3;
- (id)json;
- (id)jsonRepresentation;
- (id)proto;
- (void)encodeWithCoder:(id)a3;
- (void)setDigestRemovedTimestamp:(id)a3;
- (void)setFirstCollapsedViewTimestamp:(id)a3;
- (void)setFirstScheduledViewTimestamp:(id)a3;
- (void)setFirstUpcomingViewTimestamp:(id)a3;
@end

@implementation ATXDigestTimeline

- (void)setFirstUpcomingViewTimestamp:(id)a3
{
  id v4 = a3;
  firstUpcomingViewTimestamp = self->_firstUpcomingViewTimestamp;
  id v8 = v4;
  if (firstUpcomingViewTimestamp)
  {
    v6 = [(NSDate *)firstUpcomingViewTimestamp earlierDate:v4];
  }
  else
  {
    v6 = (NSDate *)v4;
  }
  v7 = self->_firstUpcomingViewTimestamp;
  self->_firstUpcomingViewTimestamp = v6;
}

- (void)setFirstCollapsedViewTimestamp:(id)a3
{
  id v4 = a3;
  firstCollapsedViewTimestamp = self->_firstCollapsedViewTimestamp;
  id v8 = v4;
  if (firstCollapsedViewTimestamp)
  {
    v6 = [(NSDate *)firstCollapsedViewTimestamp earlierDate:v4];
  }
  else
  {
    v6 = (NSDate *)v4;
  }
  v7 = self->_firstCollapsedViewTimestamp;
  self->_firstCollapsedViewTimestamp = v6;
}

- (void)setFirstScheduledViewTimestamp:(id)a3
{
  id v4 = a3;
  firstScheduledViewTimestamp = self->_firstScheduledViewTimestamp;
  id v8 = v4;
  if (firstScheduledViewTimestamp)
  {
    v6 = [(NSDate *)firstScheduledViewTimestamp earlierDate:v4];
  }
  else
  {
    v6 = (NSDate *)v4;
  }
  v7 = self->_firstScheduledViewTimestamp;
  self->_firstScheduledViewTimestamp = v6;
}

- (void)setDigestRemovedTimestamp:(id)a3
{
  id v4 = a3;
  digestRemovedTimestamp = self->_digestRemovedTimestamp;
  id v8 = v4;
  if (digestRemovedTimestamp)
  {
    v6 = [(NSDate *)digestRemovedTimestamp earlierDate:v4];
  }
  else
  {
    v6 = (NSDate *)v4;
  }
  v7 = self->_digestRemovedTimestamp;
  self->_digestRemovedTimestamp = v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[ATXDigestTimeline allocWithZone:a3] init];
  v5 = [(ATXDigestTimeline *)self firstUpcomingViewTimestamp];
  [(ATXDigestTimeline *)v4 setFirstUpcomingViewTimestamp:v5];

  v6 = [(ATXDigestTimeline *)self firstCollapsedViewTimestamp];
  [(ATXDigestTimeline *)v4 setFirstCollapsedViewTimestamp:v6];

  v7 = [(ATXDigestTimeline *)self firstScheduledViewTimestamp];
  [(ATXDigestTimeline *)v4 setFirstScheduledViewTimestamp:v7];

  id v8 = [(ATXDigestTimeline *)self digestRemovedTimestamp];
  [(ATXDigestTimeline *)v4 setDigestRemovedTimestamp:v8];

  return v4;
}

- (BOOL)_timelineFieldsAreEqual:(id)a3 otherField:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  BOOL v8 = (v5 | v6) == 0;
  if (v5 && v6)
  {
    [(id)v5 timeIntervalSinceDate:v6];
    if (v9 < 0.0) {
      double v9 = -v9;
    }
    BOOL v8 = v9 < 0.001;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXDigestTimeline *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXDigestTimeline *)self isEqualToATXDigestTimeline:v5];

  return v6;
}

- (BOOL)isEqualToATXDigestTimeline:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ATXDigestTimeline *)self firstUpcomingViewTimestamp];
  BOOL v6 = [v4 firstUpcomingViewTimestamp];
  BOOL v7 = [(ATXDigestTimeline *)self _timelineFieldsAreEqual:v5 otherField:v6];

  if (!v7) {
    goto LABEL_5;
  }
  BOOL v8 = [(ATXDigestTimeline *)self firstScheduledViewTimestamp];
  double v9 = [v4 firstScheduledViewTimestamp];
  BOOL v10 = [(ATXDigestTimeline *)self _timelineFieldsAreEqual:v8 otherField:v9];

  if (!v10) {
    goto LABEL_5;
  }
  v11 = [(ATXDigestTimeline *)self firstCollapsedViewTimestamp];
  v12 = [v4 firstCollapsedViewTimestamp];
  BOOL v13 = [(ATXDigestTimeline *)self _timelineFieldsAreEqual:v11 otherField:v12];

  if (v13)
  {
    v14 = [(ATXDigestTimeline *)self digestRemovedTimestamp];
    v15 = [v4 digestRemovedTimestamp];
    BOOL v16 = [(ATXDigestTimeline *)self _timelineFieldsAreEqual:v14 otherField:v15];
  }
  else
  {
LABEL_5:
    BOOL v16 = 0;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXDigestTimeline *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXDigestTimeline)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  if (v5)
  {
    self = [(ATXDigestTimeline *)self initWithProtoData:v5];
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
  v2 = [(ATXDigestTimeline *)self proto];
  v3 = [v2 data];

  return v3;
}

- (ATXDigestTimeline)initWithProto:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXDigestTimeline;
  id v5 = [(ATXDigestTimeline *)&v18 init];
  if (v5)
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v4;
        if ([v6 hasFirstUpcomingViewTimestamp])
        {
          BOOL v7 = (void *)MEMORY[0x1E4F1C9C8];
          [v6 firstUpcomingViewTimestamp];
          BOOL v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
          [(ATXDigestTimeline *)v5 setFirstUpcomingViewTimestamp:v8];
        }
        if ([v6 hasFirstCollapsedViewTimestamp])
        {
          double v9 = (void *)MEMORY[0x1E4F1C9C8];
          [v6 firstCollapsedViewTimestamp];
          BOOL v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
          [(ATXDigestTimeline *)v5 setFirstCollapsedViewTimestamp:v10];
        }
        if ([v6 hasFirstScheduledViewTimestamp])
        {
          v11 = (void *)MEMORY[0x1E4F1C9C8];
          [v6 firstScheduledViewTimestamp];
          v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
          [(ATXDigestTimeline *)v5 setFirstScheduledViewTimestamp:v12];
        }
        if ([v6 hasDigestRemovedTimestamp])
        {
          BOOL v13 = (void *)MEMORY[0x1E4F1C9C8];
          [v6 digestRemovedTimestamp];
          v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
          [(ATXDigestTimeline *)v5 setDigestRemovedTimestamp:v14];
        }
        goto LABEL_13;
      }
      BOOL v16 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[ATXDigestTimeline initWithProto:]((uint64_t)v5, v16);
      }
    }
    v15 = 0;
    goto LABEL_18;
  }
LABEL_13:
  v15 = v5;
LABEL_18:

  return v15;
}

- (ATXDigestTimeline)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBDigestTimeline alloc] initWithData:v4];

    self = [(ATXDigestTimeline *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(ATXDigestTimeline *)self firstUpcomingViewTimestamp];

  if (v4)
  {
    id v5 = [(ATXDigestTimeline *)self firstUpcomingViewTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "setFirstUpcomingViewTimestamp:");
  }
  id v6 = [(ATXDigestTimeline *)self firstCollapsedViewTimestamp];

  if (v6)
  {
    BOOL v7 = [(ATXDigestTimeline *)self firstCollapsedViewTimestamp];
    [v7 timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "setFirstCollapsedViewTimestamp:");
  }
  BOOL v8 = [(ATXDigestTimeline *)self firstScheduledViewTimestamp];

  if (v8)
  {
    double v9 = [(ATXDigestTimeline *)self firstScheduledViewTimestamp];
    [v9 timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "setFirstScheduledViewTimestamp:");
  }
  BOOL v10 = [(ATXDigestTimeline *)self digestRemovedTimestamp];

  if (v10)
  {
    v11 = [(ATXDigestTimeline *)self digestRemovedTimestamp];
    [v11 timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "setDigestRemovedTimestamp:");
  }

  return v3;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBDigestTimeline alloc] initFromJSON:v4];

  id v6 = [(ATXDigestTimeline *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(ATXDigestTimeline *)self proto];
  v3 = [v2 jsonRepresentation];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXDigestTimeline *)self jsonDict];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (NSDate)firstUpcomingViewTimestamp
{
  return self->_firstUpcomingViewTimestamp;
}

- (NSDate)firstCollapsedViewTimestamp
{
  return self->_firstCollapsedViewTimestamp;
}

- (NSDate)firstScheduledViewTimestamp
{
  return self->_firstScheduledViewTimestamp;
}

- (NSDate)digestRemovedTimestamp
{
  return self->_digestRemovedTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestRemovedTimestamp, 0);
  objc_storeStrong((id *)&self->_firstScheduledViewTimestamp, 0);
  objc_storeStrong((id *)&self->_firstCollapsedViewTimestamp, 0);

  objc_storeStrong((id *)&self->_firstUpcomingViewTimestamp, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "Unable to construct class %@ from ProtoBuf object", (uint8_t *)&v5, 0xCu);
}

@end