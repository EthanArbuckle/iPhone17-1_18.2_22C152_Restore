@interface BLSHInvalidationTimer
- (void)timerFired;
@end

@implementation BLSHInvalidationTimer

- (void)timerFired
{
  v10[1] = *MEMORY[0x263EF8340];
  v3 = [(BLSHAssertionAttributeTimer *)self service];
  v4 = [(BLSHAssertionAttributeTimer *)self assertion];
  v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F29920];
  uint64_t v9 = *MEMORY[0x263F08320];
  v10[0] = @"invalidation duration expired";
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8 = [v5 errorWithDomain:v6 code:10 userInfo:v7];
  [v3 cancelAssertion:v4 withError:v8];

  [(BLSHAssertionAttributeTimer *)self invalidate];
}

@end