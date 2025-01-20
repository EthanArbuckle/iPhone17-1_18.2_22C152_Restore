@interface BMStoreEvent(BiomeSubscriber)
- (id)descriptionWithLocalizedTimestamp;
@end

@implementation BMStoreEvent(BiomeSubscriber)

- (id)descriptionWithLocalizedTimestamp
{
  id v2 = objc_alloc(MEMORY[0x263EFF910]);
  [a1 timestamp];
  v3 = objc_msgSend(v2, "initWithTimeIntervalSinceReferenceDate:");
  v4 = NSString;
  v5 = objc_msgSend(v3, "hmf_localTimeDescription");
  v6 = [v4 stringWithFormat:@"%@ %@", a1, v5];

  return v6;
}

@end