@interface FBMutableSystemShellInitializationOptions
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIndependentWatchdogPortName:(id)a3;
- (void)setInitializeDisplayManager:(BOOL)a3;
- (void)setInitializeReadyForInteraction:(BOOL)a3;
- (void)setRegisterAdditionalServicesBlock:(id)a3;
- (void)setResetDarkBootState:(BOOL)a3;
- (void)setShouldWaitForMigrator:(BOOL)a3;
- (void)setSystemSleepInterval:(double)a3;
@end

@implementation FBMutableSystemShellInitializationOptions

- (void)setInitializeReadyForInteraction:(BOOL)a3
{
  self->super._initializeReadyForInteraction = a3;
}

- (void)setResetDarkBootState:(BOOL)a3
{
  self->super._resetDarkBootState = a3;
}

- (void)setShouldWaitForMigrator:(BOOL)a3
{
  self->super._shouldWaitForMigrator = a3;
}

- (void)setInitializeDisplayManager:(BOOL)a3
{
  self->super._initializeDisplayManager = a3;
}

- (void)setSystemSleepInterval:(double)a3
{
  self->super._systemSleepInterval = a3;
}

- (void)setRegisterAdditionalServicesBlock:(id)a3
{
  v4 = (void *)[a3 copy];
  id registerServicesBlock = self->super._registerServicesBlock;
  self->super._id registerServicesBlock = v4;
}

- (void)setIndependentWatchdogPortName:(id)a3
{
  v4 = (NSString *)[a3 copy];
  independentWatchdogPortName = self->super._independentWatchdogPortName;
  self->super._independentWatchdogPortName = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [FBSystemShellInitializationOptions alloc];

  return [(FBSystemShellInitializationOptions *)v4 _initWithOptions:self];
}

@end