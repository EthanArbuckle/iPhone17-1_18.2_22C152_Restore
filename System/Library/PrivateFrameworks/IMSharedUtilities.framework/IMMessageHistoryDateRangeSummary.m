@interface IMMessageHistoryDateRangeSummary
+ (BOOL)supportsSecureCoding;
- (IMMessageHistoryDateRangeSummary)initWithCoder:(id)a3;
- (IMMessageHistoryDateRangeSummary)initWithDateInterval:(id)a3 messages:(id)a4;
- (NSArray)messages;
- (NSDateInterval)dateInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messagesMatchingDateInterval:(id)a3;
- (int64_t)totalMessagePartCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMMessageHistoryDateRangeSummary

- (IMMessageHistoryDateRangeSummary)initWithDateInterval:(id)a3 messages:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMMessageHistoryDateRangeSummary;
  v9 = [(IMMessageHistoryDateRangeSummary *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateInterval, a3);
    uint64_t v11 = [v8 copy];
    messages = v10->_messages;
    v10->_messages = (NSArray *)v11;
  }
  return v10;
}

- (id)messagesMatchingDateInterval:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = self->_messages;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "date", (void)v17);
        if ([v4 containsDate:v12]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v13 = [IMMessageHistoryDateRangeSummary alloc];
  objc_super v14 = (void *)[v5 copy];
  v15 = [(IMMessageHistoryDateRangeSummary *)v13 initWithDateInterval:v4 messages:v14];

  return v15;
}

- (int64_t)totalMessagePartCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_messages;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "messagePartCount", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  dateInterval = self->_dateInterval;
  messages = self->_messages;

  return (id)[v4 initWithDateInterval:dateInterval messages:messages];
}

- (void)encodeWithCoder:(id)a3
{
  dateInterval = self->_dateInterval;
  id v5 = a3;
  [v5 encodeObject:dateInterval forKey:@"dateInterval"];
  [v5 encodeObject:self->_messages forKey:@"messages"];
}

- (IMMessageHistoryDateRangeSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
  uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"messages"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    self = [(IMMessageHistoryDateRangeSummary *)self initWithDateInterval:v5 messages:v6];
    uint64_t v8 = self;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSArray)messages
{
  return self->_messages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messages, 0);

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end