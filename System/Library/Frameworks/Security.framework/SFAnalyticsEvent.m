@interface SFAnalyticsEvent
- (NSDictionary)record;
- (NSNumber)timestamp;
- (id)initFromRow:(id)a3;
@end

@implementation SFAnalyticsEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_record, 0);
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (NSDictionary)record
{
  return self->_record;
}

- (id)initFromRow:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SFAnalyticsEvent;
  v5 = [(SFAnalyticsEvent *)&v14 init];
  if (v5)
  {
    uint64_t v6 = deserializedRecordFromRow(v4);
    record = v5->_record;
    v5->_record = (NSDictionary *)v6;

    if (!v5->_record)
    {
      v12 = 0;
      goto LABEL_6;
    }
    uint64_t v8 = [v4 indexForColumnName:@"timestamp"];
    v9 = NSNumber;
    [v4 doubleAtIndex:v8];
    uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v10;
  }
  v12 = v5;
LABEL_6:

  return v12;
}

@end