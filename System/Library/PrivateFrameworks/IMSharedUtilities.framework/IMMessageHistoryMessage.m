@interface IMMessageHistoryMessage
+ (BOOL)supportsSecureCoding;
- (IMMessageHistoryMessage)initWithCoder:(id)a3;
- (IMMessageHistoryMessage)initWithGUID:(id)a3 date:(id)a4 messagePartCount:(int64_t)a5;
- (NSDate)date;
- (NSString)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)messagePartCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMMessageHistoryMessage

- (IMMessageHistoryMessage)initWithGUID:(id)a3 date:(id)a4 messagePartCount:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMMessageHistoryMessage;
  v10 = [(IMMessageHistoryMessage *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    guid = v10->_guid;
    v10->_guid = (NSString *)v11;

    objc_storeStrong((id *)&v10->_date, a4);
    v10->_messagePartCount = a5;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  guid = self->_guid;
  date = self->_date;
  int64_t messagePartCount = self->_messagePartCount;

  return (id)[v4 initWithGUID:guid date:date messagePartCount:messagePartCount];
}

- (void)encodeWithCoder:(id)a3
{
  guid = self->_guid;
  id v5 = a3;
  [v5 encodeObject:guid forKey:@"guid"];
  [v5 encodeObject:self->_date forKey:@"date"];
  [v5 encodeInteger:self->_messagePartCount forKey:@"messagePartCount"];
}

- (IMMessageHistoryMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guid"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"messagePartCount"];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    self = [(IMMessageHistoryMessage *)self initWithGUID:v5 date:v6 messagePartCount:v7];
    id v9 = self;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSDate)date
{
  return self->_date;
}

- (int64_t)messagePartCount
{
  return self->_messagePartCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_guid, 0);
}

@end