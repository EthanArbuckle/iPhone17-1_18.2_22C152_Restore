@interface _AXEFixedDurationQueueValueWithTimestamp
+ (id)createWithValue:(id)a3 timestamp:(id)a4;
- (NSDate)timestamp;
- (_AXEFixedDurationQueueValueWithTimestamp)initWithValue:(id)a3 timestamp:(id)a4;
- (id)value;
@end

@implementation _AXEFixedDurationQueueValueWithTimestamp

+ (id)createWithValue:(id)a3 timestamp:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithValue:v7 timestamp:v6];

  return v8;
}

- (_AXEFixedDurationQueueValueWithTimestamp)initWithValue:(id)a3 timestamp:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_AXEFixedDurationQueueValueWithTimestamp;
  v9 = [(_AXEFixedDurationQueueValueWithTimestamp *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_value, a3);
    objc_storeStrong((id *)&v10->_timestamp, a4);
  }

  return v10;
}

- (id)value
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong(&self->_value, 0);
}

@end