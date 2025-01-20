@interface BMStoreEvent(Extras)
- (id)eventTime;
@end

@implementation BMStoreEvent(Extras)

- (id)eventTime
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [a1 timestamp];
  v3 = objc_msgSend(v2, "initWithTimeIntervalSinceReferenceDate:");
  return v3;
}

@end