@interface HMLocationEvent(HFAdditions)
+ (uint64_t)hf_locationEventTypeForRegion:()HFAdditions;
+ (void)hf_isRegion:()HFAdditions atHome:;
- (uint64_t)hf_eventType;
- (uint64_t)hf_isRegionAtHome:()HFAdditions;
@end

@implementation HMLocationEvent(HFAdditions)

+ (uint64_t)hf_locationEventTypeForRegion:()HFAdditions
{
  if (!a3) {
    return 0;
  }
  if ([a3 notifyOnEntry]) {
    return 1;
  }
  return 2;
}

- (uint64_t)hf_eventType
{
  v2 = objc_opt_class();
  v3 = [a1 region];
  uint64_t v4 = objc_msgSend(v2, "hf_locationEventTypeForRegion:", v3);

  return v4;
}

+ (void)hf_isRegion:()HFAdditions atHome:
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  id v7 = v5;
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    v10 = [v6 location];

    if (v10)
    {
      v11 = [v6 location];
      [v11 coordinate];
      v10 = objc_msgSend(v9, "containsCoordinate:");
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)hf_isRegionAtHome:()HFAdditions
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [a1 region];
  uint64_t v7 = objc_msgSend(v5, "hf_isRegion:atHome:", v6, v4);

  return v7;
}

@end