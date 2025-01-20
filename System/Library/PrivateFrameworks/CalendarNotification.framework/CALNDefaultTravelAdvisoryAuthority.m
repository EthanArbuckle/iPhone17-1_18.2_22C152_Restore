@interface CALNDefaultTravelAdvisoryAuthority
+ (CALNDefaultTravelAdvisoryAuthority)sharedInstance;
- (BOOL)doesHypothesisSatisfyMinimumAllowableTravelTime:(id)a3;
- (BOOL)travelStateIndicatesTravelingTowardDestination:(int64_t)a3;
- (double)maximumAllowableTravelTime;
- (double)minimumAllowableTravelTime;
@end

@implementation CALNDefaultTravelAdvisoryAuthority

+ (CALNDefaultTravelAdvisoryAuthority)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CALNDefaultTravelAdvisoryAuthority_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return (CALNDefaultTravelAdvisoryAuthority *)v2;
}

uint64_t __52__CALNDefaultTravelAdvisoryAuthority_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (double)minimumAllowableTravelTime
{
  [MEMORY[0x263F04C18] minimumAllowableTravelTime];
  return result;
}

- (double)maximumAllowableTravelTime
{
  [MEMORY[0x263F04C18] maximumAllowableTravelTime];
  return result;
}

- (BOOL)doesHypothesisSatisfyMinimumAllowableTravelTime:(id)a3
{
  v4 = (void *)MEMORY[0x263F30538];
  id v5 = a3;
  [(CALNDefaultTravelAdvisoryAuthority *)self minimumAllowableTravelTime];
  LOBYTE(self) = objc_msgSend(v4, "doesHypothesisSatisfyMinimumAllowableTravelTime:minimumAllowableTravelTime:", v5);

  return (char)self;
}

- (BOOL)travelStateIndicatesTravelingTowardDestination:(int64_t)a3
{
  return [MEMORY[0x263F04C18] travelStateIndicatesTravelingTowardDestination:a3];
}

@end