@interface DNDMutableApplicationConfiguration
- (void)setAllowedThreads:(id)a3;
- (void)setDeniedThreads:(id)a3;
- (void)setMinimumBreakthroughUrgency:(unint64_t)a3;
@end

@implementation DNDMutableApplicationConfiguration

- (void)setMinimumBreakthroughUrgency:(unint64_t)a3
{
  self->super._minimumBreakthroughUrgency = a3;
}

- (void)setAllowedThreads:(id)a3
{
  v4 = (NSMutableSet *)[a3 mutableCopy];
  allowedThreads = self->super._allowedThreads;
  self->super._allowedThreads = v4;
  MEMORY[0x1F41817F8](v4, allowedThreads);
}

- (void)setDeniedThreads:(id)a3
{
  v4 = (NSMutableSet *)[a3 mutableCopy];
  deniedThreads = self->super._deniedThreads;
  self->super._deniedThreads = v4;
  MEMORY[0x1F41817F8](v4, deniedThreads);
}

@end