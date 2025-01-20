@interface DNDSMutableModeConfigurationRecord
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAutomaticallyGenerated:(BOOL)a3;
- (void)setCompatibilityVersion:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setCreated:(id)a3;
- (void)setDimsLockScreen:(unint64_t)a3;
- (void)setEphemeralResolvedCompatibilityVersion:(int64_t)a3;
- (void)setHasSecureData:(BOOL)a3;
- (void)setImpactsAvailability:(unint64_t)a3;
- (void)setLastModified:(id)a3;
- (void)setLastModifiedByDeviceID:(id)a3;
- (void)setLastModifiedByVersion:(id *)a3;
- (void)setMode:(id)a3;
- (void)setSecureConfiguration:(id)a3;
- (void)setTriggers:(id)a3;
@end

@implementation DNDSMutableModeConfigurationRecord

- (void)setMode:(id)a3
{
  v4 = (DNDSModeRecord *)[a3 copy];
  mode = self->super._mode;
  self->super._mode = v4;
  MEMORY[0x1F41817F8](v4, mode);
}

- (void)setConfiguration:(id)a3
{
  v4 = (DNDSConfigurationRecord *)[a3 copy];
  configuration = self->super._configuration;
  self->super._configuration = v4;
  MEMORY[0x1F41817F8](v4, configuration);
}

- (void)setSecureConfiguration:(id)a3
{
  v4 = (DNDSConfigurationSecureRecord *)[a3 copy];
  secureConfiguration = self->super._secureConfiguration;
  self->super._secureConfiguration = v4;
  MEMORY[0x1F41817F8](v4, secureConfiguration);
}

- (void)setTriggers:(id)a3
{
  v4 = (DNDSModeConfigurationTriggersRecord *)[a3 copy];
  triggers = self->super._triggers;
  self->super._triggers = v4;
  MEMORY[0x1F41817F8](v4, triggers);
}

- (void)setImpactsAvailability:(unint64_t)a3
{
  self->super._impactsAvailability = a3;
}

- (void)setDimsLockScreen:(unint64_t)a3
{
  self->super._dimsLockScreen = a3;
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

- (void)setEphemeralResolvedCompatibilityVersion:(int64_t)a3
{
  self->super._ephemeralResolvedCompatibilityVersion = a3;
}

- (void)setHasSecureData:(BOOL)a3
{
  self->super._hasSecureData = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  mode = self->super._mode;
  configuration = self->super._configuration;
  secureConfiguration = self->super._secureConfiguration;
  triggers = self->super._triggers;
  unint64_t impactsAvailability = self->super._impactsAvailability;
  unint64_t dimsLockScreen = self->super._dimsLockScreen;
  created = self->super._created;
  lastModified = self->super._lastModified;
  BOOL automaticallyGenerated = self->super._automaticallyGenerated;
  int64_t compatibilityVersion = self->super._compatibilityVersion;
  int64_t ephemeralResolvedCompatibilityVersion = self->super._ephemeralResolvedCompatibilityVersion;
  BOOL hasSecureData = self->super._hasSecureData;
  long long v21 = *(_OWORD *)&self->super._lastModifiedByVersion.majorVersion;
  lastModifiedByDeviceID = self->super._lastModifiedByDeviceID;
  int64_t patchVersion = self->super._lastModifiedByVersion.patchVersion;
  LOBYTE(v20) = hasSecureData;
  LOBYTE(v19) = automaticallyGenerated;
  return (id)[v4 _initWithMode:mode configuration:configuration secureConfiguration:secureConfiguration triggers:triggers impactsAvailability:impactsAvailability dimsLockScreen:dimsLockScreen created:created lastModified:lastModified lastModifiedByVersion:&v21 lastModifiedByDeviceID:lastModifiedByDeviceID automaticallyGenerated:v19 compatibilityVersion:compatibilityVersion ephemeralResolvedCompatibilityVersion:ephemeralResolvedCompatibilityVersion hasSecureData:v20];
}

@end