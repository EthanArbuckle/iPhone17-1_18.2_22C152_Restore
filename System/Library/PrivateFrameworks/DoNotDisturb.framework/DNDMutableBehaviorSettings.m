@interface DNDMutableBehaviorSettings
- (id)copyWithZone:(_NSZone *)a3;
- (void)setInterruptionBehaviorSetting:(unint64_t)a3;
@end

@implementation DNDMutableBehaviorSettings

- (void)setInterruptionBehaviorSetting:(unint64_t)a3
{
  self->super._interruptionBehaviorSetting = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DNDBehaviorSettings alloc];
  return [(DNDBehaviorSettings *)v4 _initWithSettings:self];
}

@end