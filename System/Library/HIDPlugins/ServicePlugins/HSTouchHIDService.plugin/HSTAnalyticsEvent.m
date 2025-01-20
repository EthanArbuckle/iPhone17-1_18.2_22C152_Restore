@interface HSTAnalyticsEvent
- (HSTAnalyticsEvent)initWithName:(id)a3 payload:(id)a4;
- (NSDictionary)payload;
- (NSString)name;
@end

@implementation HSTAnalyticsEvent

- (HSTAnalyticsEvent)initWithName:(id)a3 payload:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HSTAnalyticsEvent;
  v9 = [(HSTAnalyticsEvent *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_payload, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end