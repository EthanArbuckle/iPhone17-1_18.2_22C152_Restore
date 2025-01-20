@interface RTRoutineManagerRegistrantPeopleDiscovery
- (BOOL)registered;
- (NSString)configurationIdentifier;
- (RTPeopleDiscoveryServiceConfiguration)configuration;
- (RTRoutineManagerRegistrantPeopleDiscovery)initWithConfigurationIdentifier:(id)a3;
- (id)startMonitoringForPeopleDiscovery:(id)a3;
- (id)stopMonitoringForPeopleDiscovery;
- (void)onDensityUpdate:(id)a3 error:(id)a4;
@end

@implementation RTRoutineManagerRegistrantPeopleDiscovery

- (RTRoutineManagerRegistrantPeopleDiscovery)initWithConfigurationIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTRoutineManagerRegistrantPeopleDiscovery;
  v5 = [(RTRoutineManagerRegistrantPeopleDiscovery *)&v11 init];
  v6 = v5;
  if (v5)
  {
    id densityHandler = v5->_densityHandler;
    v5->_id densityHandler = 0;

    uint64_t v8 = [v4 copy];
    configurationIdentifier = v6->_configurationIdentifier;
    v6->_configurationIdentifier = (NSString *)v8;
  }
  return v6;
}

- (BOOL)registered
{
  return self->_registered;
}

- (id)startMonitoringForPeopleDiscovery:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 densityCallbackConfiguration];

    if (!v7)
    {
LABEL_5:
      objc_storeStrong((id *)&self->_configuration, a3);
      v12 = 0;
      self->_registered = 1;
      goto LABEL_8;
    }
    uint64_t v8 = [v6 densityCallbackConfiguration];
    v9 = [v8 densityUpdateHandler];

    if (v9)
    {
      v10 = [v8 densityUpdateHandler];
      id densityHandler = self->_densityHandler;
      self->_id densityHandler = v10;

      goto LABEL_5;
    }
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19 = @"Invalid parameter value for density update handler.  Requires non-nil value.";
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v12 = [v15 errorWithDomain:@"RTErrorDomain" code:7 userInfo:v16];
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"Invalid configuration to register for people discovery service.  Requires non-nil value.";
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v12 = [v13 errorWithDomain:@"RTErrorDomain" code:7 userInfo:v14];
  }
LABEL_8:

  return v12;
}

- (id)stopMonitoringForPeopleDiscovery
{
  self->_registered = 0;
  id densityHandler = self->_densityHandler;
  self->_id densityHandler = 0;

  configuration = self->_configuration;
  self->_configuration = 0;

  return 0;
}

- (void)onDensityUpdate:(id)a3 error:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = self->_configuration;
  v10 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_super v11 = NSStringFromSelector(a2);
    if (self->_registered) {
      v12 = @"YES";
    }
    else {
      v12 = @"NO";
    }
    v13 = [(RTPeopleDiscoveryServiceConfiguration *)v9 description];
    int v15 = 138413314;
    v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    __int16 v21 = 2048;
    uint64_t v22 = [v7 count];
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl(&dword_1A8FEF000, v10, OS_LOG_TYPE_INFO, "%@, registered, %@, monitoredConfig, %@, densityBundles count, %lu, error, %@", (uint8_t *)&v15, 0x34u);
  }
  if (self->_registered)
  {
    id densityHandler = (void (**)(id, id, id))self->_densityHandler;
    if (densityHandler) {
      densityHandler[2](densityHandler, v7, v8);
    }
  }
}

- (NSString)configurationIdentifier
{
  return self->_configurationIdentifier;
}

- (RTPeopleDiscoveryServiceConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong(&self->_densityHandler, 0);
}

@end