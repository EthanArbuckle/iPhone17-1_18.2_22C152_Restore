@interface DNDSMutableStateProviderSystemSnapshot
- (id)copyWithZone:(_NSZone *)a3;
- (void)setActiveAssertionUUIDs:(id)a3;
- (void)setActiveDateIntervalByAssertionUUID:(id)a3;
- (void)setAssertions:(id)a3;
- (void)setInterruptionBehaviorSetting:(unint64_t)a3;
- (void)setLastUpdate:(id)a3;
- (void)setLostModeState:(unint64_t)a3;
@end

@implementation DNDSMutableStateProviderSystemSnapshot

- (void)setAssertions:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  assertions = self->super._assertions;
  self->super._assertions = v4;
  MEMORY[0x1F41817F8](v4, assertions);
}

- (void)setActiveAssertionUUIDs:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  activeAssertionUUIDs = self->super._activeAssertionUUIDs;
  self->super._activeAssertionUUIDs = v4;
  MEMORY[0x1F41817F8](v4, activeAssertionUUIDs);
}

- (void)setActiveDateIntervalByAssertionUUID:(id)a3
{
  v4 = (NSDictionary *)[a3 copy];
  activeDateIntervalByAssertionUUID = self->super._activeDateIntervalByAssertionUUID;
  self->super._activeDateIntervalByAssertionUUID = v4;
  MEMORY[0x1F41817F8](v4, activeDateIntervalByAssertionUUID);
}

- (void)setInterruptionBehaviorSetting:(unint64_t)a3
{
  self->super._interruptionBehaviorSetting = a3;
}

- (void)setLostModeState:(unint64_t)a3
{
  self->super._lostModeState = a3;
}

- (void)setLastUpdate:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DNDSStateProviderSystemSnapshot alloc];
  return [(DNDSStateProviderSystemSnapshot *)v4 _initWithSnapshot:self];
}

@end