@interface CSLPRFMutableDepthAutoLaunchSettings
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAutoLaunchBehavior:(int64_t)a3;
- (void)setBundleID:(id)a3;
- (void)setChangeSource:(unint64_t)a3;
- (void)setThreshold:(int64_t)a3;
@end

@implementation CSLPRFMutableDepthAutoLaunchSettings

- (void)setThreshold:(int64_t)a3
{
  if ((unint64_t)a3 >= 2)
  {
    v3 = (void *)MEMORY[0x263EFF940];
    uint64_t v4 = *MEMORY[0x263EFF4A0];
    NSStringFromCSLPRFDepthAutoLaunchThreshold(a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v3 raise:v4, @"Invalid threshold: %@", v5 format];
  }
  else
  {
    self->super._threshold = a3;
  }
}

- (void)setChangeSource:(unint64_t)a3
{
  self->super._changeSource = a3;
}

- (void)setBundleID:(id)a3
{
  self->super._bundleID = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setAutoLaunchBehavior:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    v3 = (void *)MEMORY[0x263EFF940];
    uint64_t v4 = *MEMORY[0x263EFF4A0];
    NSStringFromCSLPRFDepthAutoLaunchBehavior(a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v3 raise:v4, @"Invalid behavior: %@", v5 format];
  }
  else
  {
    self->super._autoLaunchBehavior = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [CSLPRFDepthAutoLaunchSettings alloc];
  return [(CSLPRFDepthAutoLaunchSettings *)v4 initWithSettings:self];
}

@end