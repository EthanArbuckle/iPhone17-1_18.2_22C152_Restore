@interface FBSceneMonitorBehaviors
- (BOOL)isEqual:(id)a3;
- (BOOL)monitorsClientSettings;
- (BOOL)monitorsPairingStatus;
- (BOOL)monitorsSettings;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setMonitorsClientSettings:(BOOL)a3;
- (void)setMonitorsPairingStatus:(BOOL)a3;
- (void)setMonitorsSettings:(BOOL)a3;
@end

@implementation FBSceneMonitorBehaviors

- (BOOL)monitorsSettings
{
  return self->_monitorsSettings;
}

- (BOOL)monitorsClientSettings
{
  return self->_monitorsClientSettings;
}

- (BOOL)monitorsPairingStatus
{
  return self->_monitorsPairingStatus;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(FBSceneMonitorBehaviors);
  [(FBSceneMonitorBehaviors *)v4 setMonitorsSettings:self->_monitorsSettings];
  [(FBSceneMonitorBehaviors *)v4 setMonitorsPairingStatus:self->_monitorsPairingStatus];
  [(FBSceneMonitorBehaviors *)v4 setMonitorsClientSettings:self->_monitorsClientSettings];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F62828] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL monitorsSettings = self->_monitorsSettings;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __35__FBSceneMonitorBehaviors_isEqual___block_invoke;
  v20[3] = &unk_1E5C49E80;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendBool:monitorsSettings counterpart:v20];
  BOOL monitorsPairingStatus = self->_monitorsPairingStatus;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __35__FBSceneMonitorBehaviors_isEqual___block_invoke_2;
  v18[3] = &unk_1E5C49E80;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendBool:monitorsPairingStatus counterpart:v18];
  uint64_t monitorsClientSettings = self->_monitorsClientSettings;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __35__FBSceneMonitorBehaviors_isEqual___block_invoke_3;
  v16[3] = &unk_1E5C49E80;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendBool:monitorsClientSettings counterpart:v16];
  LOBYTE(monitorsClientSettings) = [v5 isEqual];

  return monitorsClientSettings;
}

uint64_t __35__FBSceneMonitorBehaviors_isEqual___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
}

uint64_t __35__FBSceneMonitorBehaviors_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 9);
}

uint64_t __35__FBSceneMonitorBehaviors_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 10);
}

- (void)setMonitorsSettings:(BOOL)a3
{
  self->_BOOL monitorsSettings = a3;
}

- (void)setMonitorsPairingStatus:(BOOL)a3
{
  self->_BOOL monitorsPairingStatus = a3;
}

- (void)setMonitorsClientSettings:(BOOL)a3
{
  self->_uint64_t monitorsClientSettings = a3;
}

@end