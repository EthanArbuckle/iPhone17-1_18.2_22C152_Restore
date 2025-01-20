@interface HMDIDSDate
- (NSDate)now;
- (double)timeIntervalSince1970;
@end

@implementation HMDIDSDate

- (NSDate)now
{
  return (NSDate *)[MEMORY[0x263EFF910] now];
}

- (double)timeIntervalSince1970
{
  uint64_t v5 = 0;
  v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HMDIDSDate_timeIntervalSince1970__block_invoke;
  block[3] = &unk_264A2C2A8;
  block[4] = &v5;
  dispatch_block_perform(DISPATCH_BLOCK_DETACHED, block);
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __35__HMDIDSDate_timeIntervalSince1970__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x263F4A010] sharedInstance];
  [v3 currentServerTimeInterval];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
}

@end