@interface EMCoreAnalyticsEvent
- (EMCoreAnalyticsEvent)initWithEventName:(id)a3 collectionData:(id)a4;
- (NSDictionary)data;
- (NSString)name;
@end

@implementation EMCoreAnalyticsEvent

- (NSDictionary)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)name
{
  return self->_name;
}

- (EMCoreAnalyticsEvent)initWithEventName:(id)a3 collectionData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMCoreAnalyticsEvent;
  v9 = [(EMCoreAnalyticsEvent *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    uint64_t v11 = [v8 copy];
    data = v10->_data;
    v10->_data = (NSDictionary *)v11;
  }
  return v10;
}

@end