@interface OSLogEntry
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (NSString)composedMessage;
- (OSLogEntry)initWithCoder:(id)a3;
- (OSLogEntry)initWithDate:(id)a3 composedMessage:(id)a4;
- (OSLogEntry)initWithEventProxy:(id)a3;
- (OSLogEntryStoreCategory)storeCategory;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OSLogEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_composedMessage, 0);
}

- (OSLogEntryStoreCategory)storeCategory
{
  return self->_storeCategory;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)composedMessage
{
  return self->_composedMessage;
}

- (OSLogEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OSLogEntry;
  v5 = [(OSLogEntry *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"composedMessage"];
    composedMessage = v5->_composedMessage;
    v5->_composedMessage = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    v5->_storeCategory = [v4 decodeIntegerForKey:@"storeCategory"];
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(OSLogEntry *)self composedMessage];
  [v6 encodeObject:v4 forKey:@"composedMessage"];

  v5 = [(OSLogEntry *)self date];
  [v6 encodeObject:v5 forKey:@"date"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[OSLogEntry storeCategory](self, "storeCategory"), @"storeCategory");
}

- (OSLogEntry)initWithDate:(id)a3 composedMessage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)OSLogEntry;
  v9 = [(OSLogEntry *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_composedMessage, a4);
    objc_storeStrong((id *)&v10->_date, a3);
    v10->_storeCategory = 0;
    v11 = v10;
  }

  return v10;
}

- (OSLogEntry)initWithEventProxy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OSLogEntry;
  v5 = [(OSLogEntry *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 composedMessage];
    composedMessage = v5->_composedMessage;
    v5->_composedMessage = (NSString *)v6;

    uint64_t v8 = [v4 date];
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    v5->_storeCategory = 0;
    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end