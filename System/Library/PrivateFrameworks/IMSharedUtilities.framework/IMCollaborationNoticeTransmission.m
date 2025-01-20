@interface IMCollaborationNoticeTransmission
+ (BOOL)supportsSecureCoding;
- (IMCollaborationNoticeTransmission)initWithCoder:(id)a3;
- (IMCollaborationNoticeTransmission)initWithEventData:(id)a3 eventType:(int64_t)a4 guidString:(id)a5 date:(id)a6;
- (NSData)eventData;
- (NSDate)date;
- (NSString)guidString;
- (id)description;
- (int64_t)eventType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMCollaborationNoticeTransmission

- (IMCollaborationNoticeTransmission)initWithEventData:(id)a3 eventType:(int64_t)a4 guidString:(id)a5 date:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)IMCollaborationNoticeTransmission;
  v14 = [(IMCollaborationNoticeTransmission *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_guidString, a5);
    objc_storeStrong((id *)&v15->_eventData, a3);
    v15->_eventType = a4;
    objc_storeStrong((id *)&v15->_date, a6);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IMCollaborationNoticeTransmission *)self guidString];
  v6 = NSStringFromSelector(sel_guidString);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(IMCollaborationNoticeTransmission *)self eventData];
  v8 = NSStringFromSelector(sel_eventData);
  [v4 encodeObject:v7 forKey:v8];

  int64_t v9 = [(IMCollaborationNoticeTransmission *)self eventType];
  v10 = NSStringFromSelector(sel_eventType);
  [v4 encodeInt64:v9 forKey:v10];

  id v12 = [(IMCollaborationNoticeTransmission *)self date];
  id v11 = NSStringFromSelector(sel_date);
  [v4 encodeObject:v12 forKey:v11];
}

- (IMCollaborationNoticeTransmission)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IMCollaborationNoticeTransmission;
  v5 = [(IMCollaborationNoticeTransmission *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_guidString);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    guidString = v5->_guidString;
    v5->_guidString = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    id v11 = NSStringFromSelector(sel_eventData);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    eventData = v5->_eventData;
    v5->_eventData = (NSData *)v12;

    v14 = NSStringFromSelector(sel_eventType);
    v5->_eventType = [v4 decodeInt64ForKey:v14];

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector(sel_date);
    uint64_t v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    date = v5->_date;
    v5->_date = (NSDate *)v17;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(IMCollaborationNoticeTransmission *)self eventData];
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[IMCollaborationNoticeTransmission eventType](self, "eventType"));
  uint64_t v8 = [(IMCollaborationNoticeTransmission *)self guidString];
  int64_t v9 = [(IMCollaborationNoticeTransmission *)self date];
  uint64_t v10 = [v3 stringWithFormat:@"<%@ %p event = %@, type = %@, guidString: %@, date: %@", v5, self, v6, v7, v8, v9];

  return v10;
}

- (NSString)guidString
{
  return self->_guidString;
}

- (NSData)eventData
{
  return self->_eventData;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_eventData, 0);

  objc_storeStrong((id *)&self->_guidString, 0);
}

@end