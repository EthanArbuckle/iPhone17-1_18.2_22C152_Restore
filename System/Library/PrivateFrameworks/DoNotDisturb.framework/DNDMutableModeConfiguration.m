@interface DNDMutableModeConfiguration
- (id)copyWithZone:(_NSZone *)a3;
- (void)_configurationWasModified;
- (void)setAutomaticallyGenerated:(BOOL)a3;
- (void)setCompatibilityVersion:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setCreated:(id)a3;
- (void)setDimsLockScreen:(unint64_t)a3;
- (void)setImpactsAvailability:(unint64_t)a3;
- (void)setLastModified:(id)a3;
- (void)setLastModifiedByDeviceID:(id)a3;
- (void)setLastModifiedByVersion:(id *)a3;
- (void)setMode:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation DNDMutableModeConfiguration

- (void)setMode:(id)a3
{
  v4 = (DNDMode *)[a3 copy];
  mode = self->super._mode;
  self->super._mode = v4;

  [(DNDMutableModeConfiguration *)self _configurationWasModified];
}

- (void)setConfiguration:(id)a3
{
  v4 = (DNDConfiguration *)[a3 copy];
  configuration = self->super._configuration;
  self->super._configuration = v4;

  [(DNDMutableModeConfiguration *)self _configurationWasModified];
  BOOL v6 = ([(DNDConfiguration *)self->super._configuration hasSecureData] & 1) != 0
    || [(DNDModeConfiguration *)self _containsSecureTriggers:self->super._triggers];
  self->super._hasSecureData = v6;
}

- (void)setTriggers:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  triggers = self->super._triggers;
  self->super._triggers = v4;

  [(DNDMutableModeConfiguration *)self _configurationWasModified];
  BOOL v6 = ([(DNDConfiguration *)self->super._configuration hasSecureData] & 1) != 0
    || [(DNDModeConfiguration *)self _containsSecureTriggers:self->super._triggers];
  self->super._hasSecureData = v6;
}

- (void)setImpactsAvailability:(unint64_t)a3
{
  self->super._impactsAvailability = a3;
  [(DNDMutableModeConfiguration *)self _configurationWasModified];
}

- (void)setDimsLockScreen:(unint64_t)a3
{
  self->super._dimsLockScreen = a3;
  [(DNDMutableModeConfiguration *)self _configurationWasModified];
}

- (void)setCreated:(id)a3
{
  v4 = (NSDate *)[a3 copy];
  created = self->super._created;
  self->super._created = v4;
  MEMORY[0x1F41817F8](v4, created);
}

- (void)setLastModified:(id)a3
{
  v4 = (NSDate *)[a3 copy];
  lastModified = self->super._lastModified;
  self->super._lastModified = v4;
  MEMORY[0x1F41817F8](v4, lastModified);
}

- (void)setLastModifiedByVersion:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->super._lastModifiedByVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->super._lastModifiedByVersion.majorVersion = v3;
}

- (void)setLastModifiedByDeviceID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  lastModifiedByDeviceID = self->super._lastModifiedByDeviceID;
  self->super._lastModifiedByDeviceID = v4;
  MEMORY[0x1F41817F8](v4, lastModifiedByDeviceID);
}

- (void)setAutomaticallyGenerated:(BOOL)a3
{
  self->super._automaticallyGenerated = a3;
}

- (void)setCompatibilityVersion:(int64_t)a3
{
  self->super._compatibilityVersion = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[DNDModeConfiguration allocWithZone:a3];
  return [(DNDModeConfiguration *)v4 _initWithModeConfiguration:self];
}

- (void)_configurationWasModified
{
  self->super._automaticallyGenerated = 0;
  long long v3 = +[DNDDevice currentDevice];
  v4 = v3;
  if (v3)
  {
    [v3 frameworkVersion];
  }
  else
  {
    long long v6 = 0uLL;
    int64_t v7 = 0;
  }
  *(_OWORD *)&self->super._lastModifiedByVersion.majorVersion = v6;
  self->super._lastModifiedByVersion.patchVersion = v7;

  lastModifiedByDeviceID = self->super._lastModifiedByDeviceID;
  self->super._lastModifiedByDeviceID = 0;
}

@end