@interface HMPresenceEvent(HFAdditions)
+ (uint64_t)hf_locationEventTypeForPresenceEventType:()HFAdditions;
+ (uint64_t)hf_presenceDisableReasonsForHome:()HFAdditions;
- (uint64_t)hf_activationGranularity;
- (uint64_t)hf_eventType;
@end

@implementation HMPresenceEvent(HFAdditions)

+ (uint64_t)hf_locationEventTypeForPresenceEventType:()HFAdditions
{
  if ((unint64_t)(a3 - 1) < 4) {
    return qword_20BD13658[a3 - 1];
  }
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  NSLog(&cfstr_UnexpectedEven_0.isa, v4);

  return 0;
}

+ (uint64_t)hf_presenceDisableReasonsForHome:()HFAdditions
{
  id v3 = a3;
  v4 = [v3 currentUser];
  v5 = [v3 homeAccessControlForUser:v4];

  uint64_t v6 = [v5 presenceComputationStatus];
  int v7 = objc_msgSend(v3, "hf_supportsSharedEventAutomation");

  uint64_t v8 = v7 ^ 1u;
  if (v6 == 2
    && +[HFUtilities supportsBeingCurrentLocationDevice])
  {
    v8 |= 2uLL;
  }
  if (+[HFUtilities supportsBeingCurrentLocationDevice])
  {
    v9 = +[HFLocationManagerDispatcher sharedDispatcher];
    int v10 = [v9 authorizationStatus];

    if ((v10 - 3) >= 2) {
      v8 |= 2uLL;
    }
  }

  return v8;
}

- (uint64_t)hf_activationGranularity
{
  uint64_t v2 = [a1 presenceEventType];
  if ((unint64_t)(v2 - 1) < 4) {
    return qword_20BD13678[v2 - 1];
  }
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "presenceEventType"));
  NSLog(&cfstr_UnexpectedEven_0.isa, v4);

  return 0;
}

- (uint64_t)hf_eventType
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = [a1 presenceEventType];
  return objc_msgSend(v2, "hf_locationEventTypeForPresenceEventType:", v3);
}

@end