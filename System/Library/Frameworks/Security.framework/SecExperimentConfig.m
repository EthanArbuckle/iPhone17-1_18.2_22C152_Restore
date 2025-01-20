@interface SecExperimentConfig
- (BOOL)isSampled;
- (BOOL)shouldRunWithSamplingRate:(id)a3;
- (NSDictionary)config;
- (NSDictionary)configurationData;
- (NSString)identifier;
- (SecExperimentConfig)initWithConfiguration:(id)a3;
- (unsigned)deviceSampleRate;
- (unsigned)fleetSampleRate;
- (unsigned)hostHash;
- (void)setConfig:(id)a3;
- (void)setConfigurationData:(id)a3;
- (void)setDeviceSampleRate:(unsigned int)a3;
- (void)setFleetSampleRate:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation SecExperimentConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_configurationData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setConfig:(id)a3
{
}

- (NSDictionary)config
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfigurationData:(id)a3
{
}

- (NSDictionary)configurationData
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceSampleRate:(unsigned int)a3
{
  self->_deviceSampleRate = a3;
}

- (unsigned)deviceSampleRate
{
  return self->_deviceSampleRate;
}

- (void)setFleetSampleRate:(unsigned int)a3
{
  self->_fleetSampleRate = a3;
}

- (unsigned)fleetSampleRate
{
  return self->_fleetSampleRate;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isSampled
{
  unsigned int v3 = [(SecExperimentConfig *)self hostHash];
  if (!v3 || [(SecExperimentConfig *)self fleetSampleRate] < v3) {
    return 0;
  }
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SecExperimentConfig deviceSampleRate](self, "deviceSampleRate"));
  BOOL v6 = [(SecExperimentConfig *)self shouldRunWithSamplingRate:v5];

  return v6;
}

- (BOOL)shouldRunWithSamplingRate:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  float v4 = (float)arc4random();
  unint64_t v5 = [v3 unsignedIntegerValue];

  return (float)(4295000000.0 / (float)v5) > v4;
}

- (unsigned)hostHash
{
  if (sec_experiment_host_hash_onceToken != -1) {
    dispatch_once(&sec_experiment_host_hash_onceToken, &__block_literal_global_415);
  }
  return sec_experiment_host_hash_hash;
}

- (SecExperimentConfig)initWithConfiguration:(id)a3
{
  id v4 = a3;
  if (v4
    && (v14.receiver = self,
        v14.super_class = (Class)SecExperimentConfig,
        unint64_t v5 = [(SecExperimentConfig *)&v14 init],
        (self = v5) != 0))
  {
    [(SecExperimentConfig *)v5 setConfig:v4];
    BOOL v6 = [v4 objectForKey:@"ExpName"];
    [(SecExperimentConfig *)self setIdentifier:v6];

    v7 = [v4 objectForKey:@"DeviceSampleRate"];
    v8 = v7;
    if (v7) {
      -[SecExperimentConfig setDeviceSampleRate:](self, "setDeviceSampleRate:", [v7 unsignedIntValue]);
    }
    v9 = [v4 objectForKey:@"FleetSampleRate"];
    v10 = v9;
    if (v9) {
      -[SecExperimentConfig setFleetSampleRate:](self, "setFleetSampleRate:", [v9 unsignedIntValue]);
    }
    v11 = [v4 objectForKey:@"ConfigData"];
    [(SecExperimentConfig *)self setConfigurationData:v11];

    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end