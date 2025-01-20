@interface DNDSMutableClientConnectionDetails
- (id)copyWithZone:(_NSZone *)a3;
- (void)setActiveAssertionUpdateClientIdentifiers:(id)a3;
- (void)setAssertionUpdateClientIdentifiers:(id)a3;
- (void)setInterruptionInvalidationAssertionUUID:(id)a3;
- (void)setWantsActiveModeUpdates:(BOOL)a3;
- (void)setWantsGlobalConfigurationUpdates:(BOOL)a3;
- (void)setWantsMeDeviceStateUpdates:(BOOL)a3;
- (void)setWantsModeUpdates:(BOOL)a3;
- (void)setWantsSettingsUpdates:(BOOL)a3;
- (void)setWantsStateUpdates:(BOOL)a3;
@end

@implementation DNDSMutableClientConnectionDetails

- (void)setWantsStateUpdates:(BOOL)a3
{
  self->super._wantsStateUpdates = a3;
}

- (void)setWantsModeUpdates:(BOOL)a3
{
  self->super._wantsModeUpdates = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DNDSClientConnectionDetails alloc];
  return [(DNDSClientConnectionDetails *)v4 _initWithDetails:self];
}

- (void)setInterruptionInvalidationAssertionUUID:(id)a3
{
  v4 = (NSUUID *)[a3 copy];
  interruptionInvalidationAssertionUUID = self->super._interruptionInvalidationAssertionUUID;
  self->super._interruptionInvalidationAssertionUUID = v4;
  MEMORY[0x1F41817F8](v4, interruptionInvalidationAssertionUUID);
}

- (void)setAssertionUpdateClientIdentifiers:(id)a3
{
  v4 = (NSSet *)[a3 copy];
  assertionUpdateClientIdentifiers = self->super._assertionUpdateClientIdentifiers;
  self->super._assertionUpdateClientIdentifiers = v4;
  MEMORY[0x1F41817F8](v4, assertionUpdateClientIdentifiers);
}

- (void)setWantsSettingsUpdates:(BOOL)a3
{
  self->super._wantsSettingsUpdates = a3;
}

- (void)setWantsActiveModeUpdates:(BOOL)a3
{
  self->super._wantsActiveModeUpdates = a3;
}

- (void)setActiveAssertionUpdateClientIdentifiers:(id)a3
{
  v4 = (NSSet *)[a3 copy];
  activeAssertionUpdateClientIdentifiers = self->super._activeAssertionUpdateClientIdentifiers;
  self->super._activeAssertionUpdateClientIdentifiers = v4;
  MEMORY[0x1F41817F8](v4, activeAssertionUpdateClientIdentifiers);
}

- (void)setWantsGlobalConfigurationUpdates:(BOOL)a3
{
  self->super._wantsGlobalConfigurationUpdates = a3;
}

- (void)setWantsMeDeviceStateUpdates:(BOOL)a3
{
  self->super._wantsMeDeviceStateUpdates = a3;
}

@end