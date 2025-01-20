@interface MSPMapsDefaultsAccessor
+ (id)get:(id)a3;
+ (id)sharedInstance;
+ (void)set:(id)a3 value:(id)a4;
+ (void)synchronize;
- (MSPMapsDefaultsAccessor)init;
- (id)_get:(id)a3;
- (void)_set:(id)a3 value:(id)a4;
- (void)_synchronize;
- (void)protectedDataDidBecomeAvailable:(id)a3;
@end

@implementation MSPMapsDefaultsAccessor

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MSPMapsDefaultsAccessor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB7F4608 != -1) {
    dispatch_once(&qword_1EB7F4608, block);
  }
  v2 = (void *)_MergedGlobals_44;

  return v2;
}

uint64_t __41__MSPMapsDefaultsAccessor_sharedInstance__block_invoke(uint64_t a1)
{
  _MergedGlobals_44 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (MSPMapsDefaultsAccessor)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSPMapsDefaultsAccessor;
  v2 = [(MSPMapsDefaultsAccessor *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F64600] sharedObject];
    v2->_protectedDataAvailable = [v3 addDataDidBecomeAvailableAfterFirstUnlockObserver:v2] ^ 1;
  }
  return v2;
}

- (void)protectedDataDidBecomeAvailable:(id)a3
{
  self->_protectedDataAvailable = 1;
}

- (id)_get:(id)a3
{
  if (self->_protectedDataAvailable)
  {
    id v3 = a3;
    v4 = +[MSPMapsPaths mapsApplicationContainerPaths];
    objc_super v5 = [v4 groupDirectory];
    v6 = (void *)_CFPreferencesCopyAppValueWithContainer();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_set:(id)a3 value:(id)a4
{
  if (self->_protectedDataAvailable)
  {
    id v5 = a4;
    id v6 = a3;
    id v8 = +[MSPMapsPaths mapsApplicationContainerPaths];
    v7 = [v8 groupDirectory];
    _CFPreferencesSetAppValueWithContainer();
  }
}

- (void)_synchronize
{
  if (self->_protectedDataAvailable)
  {
    id v3 = +[MSPMapsPaths mapsApplicationContainerPaths];
    v2 = [v3 groupDirectory];
    _CFPreferencesSynchronizeWithContainer();
  }
}

+ (id)get:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedInstance];
  id v6 = [v5 _get:v4];

  return v6;
}

+ (void)set:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 sharedInstance];
  [v8 _set:v7 value:v6];
}

+ (void)synchronize
{
  id v2 = [a1 sharedInstance];
  [v2 _synchronize];
}

@end