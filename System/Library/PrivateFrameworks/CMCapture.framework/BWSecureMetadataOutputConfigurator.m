@interface BWSecureMetadataOutputConfigurator
+ (void)initialize;
- (BWSecureMetadataOutputConfiguration)coalescedSecureMetadataOutputConfiguration;
- (BWSecureMetadataOutputConfiguration)configurationForPrimaryClient;
- (BWSecureMetadataOutputConfigurator)init;
- (BWSecureMetadataOutputConfiguratorDelegate)delegate;
- (id)_coalescedClientConfiguration;
- (void)_updateSecureMetadataOutputConfigurationForceDelegate:(BOOL)a3;
- (void)dealloc;
- (void)setConfigurationForPrimaryClient:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BWSecureMetadataOutputConfigurator

- (void)setConfigurationForPrimaryClient:(id)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);

  self->_configurationForPrimaryClient = (BWSecureMetadataOutputConfiguration *)a3;
  [(BWSecureMetadataOutputConfigurator *)self _updateSecureMetadataOutputConfigurationForceDelegate:0];
  os_unfair_lock_unlock(p_stateLock);
}

- (void)_updateSecureMetadataOutputConfigurationForceDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BWSecureMetadataOutputConfigurator *)self _coalescedClientConfiguration];
  if ([v5 isEqual:self->_coalescedSecureMetadataOutputConfiguration])
  {
    if (!v3) {
      return;
    }
  }
  else
  {

    self->_coalescedSecureMetadataOutputConfiguration = (BWSecureMetadataOutputConfiguration *)v5;
  }
  delegate = self->_delegate;
  [(BWSecureMetadataOutputConfiguratorDelegate *)delegate secureMetadataOutputConfigurationDidChange:v5];
}

- (id)_coalescedClientConfiguration
{
  BOOL v3 = (BWSecureMetadataOutputConfiguration *)[(BWSecureMetadataOutputConfiguration *)self->_configurationForPrimaryClient copy];
  if (!v3) {
    BOOL v3 = objc_alloc_init(BWSecureMetadataOutputConfiguration);
  }
  [(BWSecureMetadataOutputConfiguration *)v3 setEnabledDetectedObjectTypes:[(BWSecureMetadataOutputConfiguration *)self->_configurationForPrimaryClient enabledDetectedObjectTypes]];
  return v3;
}

- (BWSecureMetadataOutputConfigurator)init
{
  v3.receiver = self;
  v3.super_class = (Class)BWSecureMetadataOutputConfigurator;
  result = [(BWSecureMetadataOutputConfigurator *)&v3 init];
  if (result) {
    result->_stateLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BWSecureMetadataOutputConfiguration)configurationForPrimaryClient
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_configurationForPrimaryClient;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSecureMetadataOutputConfigurator;
  [(BWSecureMetadataOutputConfigurator *)&v3 dealloc];
}

- (BWSecureMetadataOutputConfiguration)coalescedSecureMetadataOutputConfiguration
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = (BWSecureMetadataOutputConfiguration *)(id)[(BWSecureMetadataOutputConfiguration *)self->_coalescedSecureMetadataOutputConfiguration copy];
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (BWSecureMetadataOutputConfiguratorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_delegate != a3)
  {
    self->_delegate = (BWSecureMetadataOutputConfiguratorDelegate *)a3;
    if (a3) {
      [(BWSecureMetadataOutputConfigurator *)self _updateSecureMetadataOutputConfigurationForceDelegate:1];
    }
  }
  os_unfair_lock_unlock(p_stateLock);
}

@end