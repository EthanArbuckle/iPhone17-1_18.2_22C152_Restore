@interface FBSystemShellInitializationOptions
- (BOOL)initializeDisplayManager;
- (BOOL)initializeReadyForInteraction;
- (BOOL)isEqual:(id)a3;
- (BOOL)resetDarkBootState;
- (BOOL)shouldWaitForMigrator;
- (FBSystemShellInitializationOptions)init;
- (NSString)independentWatchdogPortName;
- (double)systemSleepInterval;
- (id)_initWithOptions:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)registerAdditionalServicesBlock;
- (unint64_t)hash;
@end

@implementation FBSystemShellInitializationOptions

- (id)_initWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(FBSystemShellInitializationOptions *)self init];
  v6 = v5;
  if (v5)
  {
    v5->_resetDarkBootState = *((unsigned char *)v4 + 10);
    v5->_initializeReadyForInteraction = *((unsigned char *)v4 + 8);
    v5->_shouldWaitForMigrator = *((unsigned char *)v4 + 9);
    v5->_systemSleepInterval = *((double *)v4 + 3);
    objc_storeStrong((id *)&v5->_independentWatchdogPortName, *((id *)v4 + 2));
    v6->_initializeDisplayManager = *((unsigned char *)v4 + 11);
    uint64_t v7 = [*((id *)v4 + 4) copy];
    id registerServicesBlock = v6->_registerServicesBlock;
    v6->_id registerServicesBlock = (id)v7;
  }
  return v6;
}

- (FBSystemShellInitializationOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)FBSystemShellInitializationOptions;
  result = [(FBSystemShellInitializationOptions *)&v3 init];
  if (result)
  {
    result->_shouldWaitForMigrator = 1;
    result->_initializeDisplayManager = 1;
    result->_systemSleepInterval = 1.0;
  }
  return result;
}

- (unint64_t)hash
{
  objc_super v3 = [MEMORY[0x1E4F62840] builder];
  id v4 = (id)[v3 appendBool:self->_resetDarkBootState];
  id v5 = (id)[v3 appendBool:self->_initializeReadyForInteraction];
  id v6 = (id)[v3 appendBool:self->_shouldWaitForMigrator];
  id v7 = (id)[v3 appendBool:self->_initializeDisplayManager];
  id v8 = (id)[v3 appendDouble:self->_systemSleepInterval];
  v9 = (void *)MEMORY[0x1AD0B8C50](self->_registerServicesBlock);
  id v10 = (id)[v3 appendObject:v9];

  id v11 = (id)[v3 appendObject:self->_independentWatchdogPortName];
  unint64_t v12 = [v3 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FBSystemShellInitializationOptions *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if (BSEqualBools()
        && BSEqualBools()
        && BSEqualBools()
        && BSEqualBools()
        && BSFloatEqualToFloat())
      {
        id v6 = (void *)MEMORY[0x1AD0B8C50](self->_registerServicesBlock);
        id v7 = (void *)MEMORY[0x1AD0B8C50](v5->_registerServicesBlock);
        if (BSEqualObjects()) { {
          char v8 = BSEqualObjects();
        }
        }
        else {
          char v8 = 0;
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [FBMutableSystemShellInitializationOptions alloc];

  return [(FBSystemShellInitializationOptions *)v4 _initWithOptions:self];
}

- (BOOL)initializeReadyForInteraction
{
  return self->_initializeReadyForInteraction;
}

- (BOOL)resetDarkBootState
{
  return self->_resetDarkBootState;
}

- (BOOL)shouldWaitForMigrator
{
  return self->_shouldWaitForMigrator;
}

- (double)systemSleepInterval
{
  return self->_systemSleepInterval;
}

- (id)registerAdditionalServicesBlock
{
  return self->_registerServicesBlock;
}

- (NSString)independentWatchdogPortName
{
  return self->_independentWatchdogPortName;
}

- (BOOL)initializeDisplayManager
{
  return self->_initializeDisplayManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_independentWatchdogPortName, 0);
}

@end