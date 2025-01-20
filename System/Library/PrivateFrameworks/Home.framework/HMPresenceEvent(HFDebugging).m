@interface HMPresenceEvent(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMPresenceEvent(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  v6.receiver = a1;
  v6.super_class = (Class)&off_26C1576D0;
  v2 = objc_msgSendSuper2(&v6, sel_hf_stateDumpBuilderWithContext_);
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "presenceEventType"));
  [v2 setObject:v3 forKeyedSubscript:@"eventType"];

  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "presenceUserType"));
  [v2 setObject:v4 forKeyedSubscript:@"userType"];

  return v2;
}

@end