@interface BLSDesiredFidelityResponse
- (BLSDesiredFidelityResponse)initWithDesiredFidelity:(int64_t)a3;
- (int64_t)desiredFidelity;
@end

@implementation BLSDesiredFidelityResponse

- (BLSDesiredFidelityResponse)initWithDesiredFidelity:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forSetting:1];

  v9.receiver = self;
  v9.super_class = (Class)BLSDesiredFidelityResponse;
  v7 = [(BLSDesiredFidelityResponse *)&v9 initWithInfo:v5 error:0];

  return v7;
}

- (int64_t)desiredFidelity
{
  v2 = [(BLSDesiredFidelityResponse *)self info];
  v3 = [v2 objectForSetting:1];

  int64_t v4 = [v3 integerValue];
  return v4;
}

@end