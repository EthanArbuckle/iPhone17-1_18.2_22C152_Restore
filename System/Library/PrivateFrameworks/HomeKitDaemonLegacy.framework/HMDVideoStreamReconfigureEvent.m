@interface HMDVideoStreamReconfigureEvent
- (BOOL)isEqual:(id)a3;
- (HMDVideoStreamReconfigureEvent)initWithEventType:(unint64_t)a3;
- (NSDate)timestamp;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)eventType;
- (unint64_t)hash;
@end

@implementation HMDVideoStreamReconfigureEvent

- (void).cxx_destruct
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(HMDVideoStreamReconfigureEvent *)self eventType];
  if (v4 == 1)
  {
    v5 = @"HMDVideoStreamReconfigureEventTypeImprove";
  }
  else if (v4 == 2)
  {
    v5 = @"HMDVideoStreamReconfigureEventTypeDeteriorate";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown reconfig event: %tu", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v6 = [(HMDVideoStreamReconfigureEvent *)self timestamp];
  v7 = objc_msgSend(v6, "hmf_localTimeDescription");
  v8 = [v3 stringWithFormat:@"Event: %@, Timestamp %@", v5, v7];

  return v8;
}

- (unint64_t)hash
{
  v2 = [(HMDVideoStreamReconfigureEvent *)self timestamp];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HMDVideoStreamReconfigureEvent *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HMDVideoStreamReconfigureEvent *)self timestamp];
      v7 = [(HMDVideoStreamReconfigureEvent *)v5 timestamp];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(HMDVideoStreamReconfigureEvent *)self timestamp];
  v6 = [v4 timestamp];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (HMDVideoStreamReconfigureEvent)initWithEventType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HMDVideoStreamReconfigureEvent;
  id v4 = [(HMDVideoStreamReconfigureEvent *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_eventType = a3;
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;
  }
  return v5;
}

@end