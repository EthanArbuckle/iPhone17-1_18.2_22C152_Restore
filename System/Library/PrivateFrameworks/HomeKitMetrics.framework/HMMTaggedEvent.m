@interface HMMTaggedEvent
- (HMMTaggedEvent)initWithTag:(id)a3 data:(id)a4;
- (HMMTaggedEvent)initWithTag:(id)a3 time:(int64_t)a4 data:(id)a5;
- (NSDictionary)tagData;
- (NSString)tagName;
- (id)description;
- (int64_t)tagTime;
@end

@implementation HMMTaggedEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagData, 0);
  objc_storeStrong((id *)&self->_tagName, 0);
}

- (NSDictionary)tagData
{
  return self->_tagData;
}

- (int64_t)tagTime
{
  return self->_tagTime;
}

- (NSString)tagName
{
  return self->_tagName;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMMTaggedEvent *)self tagName];
  int64_t v5 = [(HMMTaggedEvent *)self tagTime];
  v6 = [(HMMTaggedEvent *)self tagData];
  v7 = [v3 stringWithFormat:@"%@/%lu/%@", v4, v5, v6];

  return v7;
}

- (HMMTaggedEvent)initWithTag:(id)a3 time:(int64_t)a4 data:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMMTaggedEvent;
  v11 = [(HMMTaggedEvent *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_tagName, a3);
    v12->_tagTime = a4;
    objc_storeStrong((id *)&v12->_tagData, a5);
  }

  return v12;
}

- (HMMTaggedEvent)initWithTag:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMMTaggedEvent *)self initWithTag:v7 time:clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0xF4240 data:v6];

  return v8;
}

@end