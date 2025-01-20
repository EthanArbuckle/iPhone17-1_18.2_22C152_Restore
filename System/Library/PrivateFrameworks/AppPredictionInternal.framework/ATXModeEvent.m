@interface ATXModeEvent
+ (ATXModeEvent)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXModeEntityProtocol)entity;
- (ATXModeEvent)initWithCoder:(id)a3;
- (ATXModeEvent)initWithStartDate:(id)a3 endDate:(id)a4;
- (ATXModeEvent)initWithStartDate:(id)a3 endDate:(id)a4 entity:(id)a5;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (id)json;
- (id)jsonRawData;
- (id)serialize;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setEntity:(id)a3;
@end

@implementation ATXModeEvent

- (ATXModeEvent)initWithStartDate:(id)a3 endDate:(id)a4
{
  return [(ATXModeEvent *)self initWithStartDate:a3 endDate:a4 entity:0];
}

- (ATXModeEvent)initWithStartDate:(id)a3 endDate:(id)a4 entity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXModeEvent;
  v12 = [(ATXModeEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_startDate, a3);
    objc_storeStrong((id *)&v13->_endDate, a4);
    objc_storeStrong((id *)&v13->_entity, a5);
  }

  return v13;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  startDate = self->_startDate;
  endDate = self->_endDate;
  v6 = [(ATXModeEntityProtocol *)self->_entity identifier];
  v7 = (void *)[v3 initWithFormat:@"startDate: %@, endDate: %@, identifier: %@", startDate, endDate, v6];

  return (NSString *)v7;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (ATXModeEvent)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  return 0;
}

- (id)serialize
{
  v2 = objc_opt_new();
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
}

- (ATXModeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_notifications();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"startDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXModeEvent" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], id v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    id v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    v13 = __atxlog_handle_notifications();
    v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"endDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXModeEvent" errorCode:-1 logHandle:v13];

    if (v14 && ([v4 error], objc_super v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      self = [(ATXModeEvent *)self initWithStartDate:v8 endDate:v14];
      id v10 = self;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)jsonRawData
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"startDate";
  v5[1] = @"endDate";
  endDate = self->_endDate;
  v6[0] = self->_startDate;
  v6[1] = endDate;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(ATXModeEvent *)self jsonRawData];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (ATXModeEntityProtocol)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end