@interface DNDMutableBypassSettings
- (id)copyWithZone:(_NSZone *)a3;
- (void)setImmediateBypassCNGroupIdentifier:(id)a3;
- (void)setImmediateBypassEventSourceType:(unint64_t)a3;
- (void)setRepeatEventSourceBehaviorEnabledSetting:(unint64_t)a3;
@end

@implementation DNDMutableBypassSettings

- (void)setImmediateBypassEventSourceType:(unint64_t)a3
{
  self->super._immediateBypassEventSourceType = a3;
}

- (void)setImmediateBypassCNGroupIdentifier:(id)a3
{
  v4 = (NSString *)[a3 copy];
  immediateBypassCNGroupIdentifier = self->super._immediateBypassCNGroupIdentifier;
  self->super._immediateBypassCNGroupIdentifier = v4;
  MEMORY[0x1F41817F8](v4, immediateBypassCNGroupIdentifier);
}

- (void)setRepeatEventSourceBehaviorEnabledSetting:(unint64_t)a3
{
  self->super._repeatEventSourceBehaviorEnabledSetting = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DNDBypassSettings alloc];
  return [(DNDBypassSettings *)v4 _initWithSettings:self];
}

@end