@interface HMDAddActionSetLogEvent
- (HMDAddActionSetLogEvent)initWithActionSetType:(id)a3 homeUUID:(id)a4;
- (NSString)actionSetType;
@end

@implementation HMDAddActionSetLogEvent

- (void).cxx_destruct
{
}

- (NSString)actionSetType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (HMDAddActionSetLogEvent)initWithActionSetType:(id)a3 homeUUID:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDAddActionSetLogEvent;
  v8 = [(HMMHomeLogEvent *)&v11 initWithHomeUUID:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_actionSetType, a3);
  }

  return v9;
}

@end