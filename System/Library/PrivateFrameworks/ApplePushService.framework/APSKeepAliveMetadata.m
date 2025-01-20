@interface APSKeepAliveMetadata
- (APSKeepAliveMetadata)initWithUsingWWAN:(BOOL)a3 keepAliveInterval:(int)a4 delayedResponseInterval:(int)a5 usingServerStats:(BOOL)a6 keepAliveState:(id)a7;
- (APSKeepAliveMetadata)initWithUsingWWAN:(BOOL)a3 keepAliveInterval:(int)a4 delayedResponseInterval:(int)a5 usingServerStats:(BOOL)a6 keepAliveState:(id)a7 hwVersion:(id)a8 swVersion:(id)a9 swBuild:(id)a10;
- (APSKeepAliveMetadata)initWithUsingWWAN:(BOOL)a3 keepAliveInterval:(int)a4 keepAliveState:(id)a5;
- (BOOL)usingServerStats;
- (NSString)carrier;
- (NSString)hardwareVersion;
- (NSString)softwareBuild;
- (NSString)softwareVersion;
- (PCKeepAliveState)keepAliveState;
- (int)delayedResponseInterval;
- (int)keepAliveAction;
- (int)keepAliveInterval;
- (void)setCarrier:(id)a3;
- (void)setDelayedResponseInterval:(int)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setKeepAliveAction:(int)a3;
- (void)setKeepAliveInterval:(int)a3;
- (void)setKeepAliveState:(id)a3;
- (void)setSoftwareBuild:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setUsingServerStats:(BOOL)a3;
@end

@implementation APSKeepAliveMetadata

- (APSKeepAliveMetadata)initWithUsingWWAN:(BOOL)a3 keepAliveInterval:(int)a4 keepAliveState:(id)a5
{
  return [(APSKeepAliveMetadata *)self initWithUsingWWAN:a3 keepAliveInterval:*(void *)&a4 delayedResponseInterval:0 usingServerStats:0 keepAliveState:a5];
}

- (APSKeepAliveMetadata)initWithUsingWWAN:(BOOL)a3 keepAliveInterval:(int)a4 delayedResponseInterval:(int)a5 usingServerStats:(BOOL)a6 keepAliveState:(id)a7
{
  return [(APSKeepAliveMetadata *)self initWithUsingWWAN:a3 keepAliveInterval:*(void *)&a4 delayedResponseInterval:*(void *)&a5 usingServerStats:a6 keepAliveState:a7 hwVersion:0 swVersion:0 swBuild:0];
}

- (APSKeepAliveMetadata)initWithUsingWWAN:(BOOL)a3 keepAliveInterval:(int)a4 delayedResponseInterval:(int)a5 usingServerStats:(BOOL)a6 keepAliveState:(id)a7 hwVersion:(id)a8 swVersion:(id)a9 swBuild:(id)a10
{
  BOOL v14 = a3;
  v16 = (PCKeepAliveState *)a7;
  id v17 = a8;
  v18 = v16;
  id v19 = a9;
  id v20 = a10;
  v49.receiver = self;
  v49.super_class = (Class)APSKeepAliveMetadata;
  v21 = [(APSKeepAliveMetadata *)&v49 init];
  v22 = v21;
  if (v21)
  {
    carrier = v21->_carrier;
    v21->_carrier = (NSString *)@"Unknown";

    if (v14)
    {
      int v24 = a5;
      BOOL v25 = a6;
      v26 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
      char v27 = objc_opt_respondsToSelector();

      if (v27)
      {
        v28 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
        v29 = [v28 networkCode];

        if (v29 && [v29 length])
        {
          v30 = (NSString *)[v29 copy];
          v31 = v22->_carrier;
          v22->_carrier = v30;
        }
      }
      else
      {
        v29 = 0;
      }
      a6 = v25;
      a5 = v24;
    }
    else
    {
      v29 = v22->_carrier;
      v22->_carrier = (NSString *)@"WiFi";
    }

    if (v19 && v20)
    {
      v32 = (NSString *)[v19 copy];
      softwareVersion = v22->_softwareVersion;
      v22->_softwareVersion = v32;

      v34 = (NSString *)[v20 copy];
      softwareBuild = v22->_softwareBuild;
      v22->_softwareBuild = v34;
    }
    else
    {
      v36 = (NSString *)_CFCopySystemVersionDictionary();
      softwareBuild = v36;
      if (v36)
      {
        uint64_t v37 = [(NSString *)v36 objectForKey:_kCFSystemVersionProductVersionKey];
        v38 = v22->_softwareVersion;
        v22->_softwareVersion = (NSString *)v37;

        uint64_t v39 = [(NSString *)softwareBuild objectForKey:_kCFSystemVersionBuildVersionKey];
        v40 = v22->_softwareBuild;
        v22->_softwareBuild = (NSString *)v39;
      }
      else
      {
        v41 = v22->_softwareVersion;
        v22->_softwareVersion = (NSString *)@"Unknown";

        v40 = v22->_softwareBuild;
        v22->_softwareBuild = (NSString *)@"Unknown";
      }
    }
    if (v17)
    {
      v42 = (NSString *)[v17 copy];
      hardwareVersion = v22->_hardwareVersion;
      v22->_hardwareVersion = v42;
    }
    else
    {
      size_t size = 0;
      sysctlbyname("hw.machine", 0, &size, 0, 0);
      v44 = malloc_type_malloc(size, 0x4E64C94BuLL);
      sysctlbyname("hw.machine", v44, &size, 0, 0);
      v45 = (NSString *)[objc_alloc((Class)NSString) initWithCString:v44 encoding:4];
      v46 = v22->_hardwareVersion;
      v22->_hardwareVersion = v45;

      if (v44) {
        free(v44);
      }
    }
    v22->_keepAliveInterval = a4;
    v22->_delayedResponseInterval = a5;
    v22->_usingServerStats = a6;
    v22->_keepAliveState = v18;
  }

  return v22;
}

- (NSString)carrier
{
  return self->_carrier;
}

- (void)setCarrier:(id)a3
{
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(id)a3
{
}

- (NSString)softwareBuild
{
  return self->_softwareBuild;
}

- (void)setSoftwareBuild:(id)a3
{
}

- (NSString)hardwareVersion
{
  return self->_hardwareVersion;
}

- (void)setHardwareVersion:(id)a3
{
}

- (int)keepAliveInterval
{
  return self->_keepAliveInterval;
}

- (void)setKeepAliveInterval:(int)a3
{
  self->_keepAliveInterval = a3;
}

- (int)delayedResponseInterval
{
  return self->_delayedResponseInterval;
}

- (void)setDelayedResponseInterval:(int)a3
{
  self->_delayedResponseInterval = a3;
}

- (BOOL)usingServerStats
{
  return self->_usingServerStats;
}

- (void)setUsingServerStats:(BOOL)a3
{
  self->_usingServerStats = a3;
}

- (PCKeepAliveState)keepAliveState
{
  return self->_keepAliveState;
}

- (void)setKeepAliveState:(id)a3
{
  self->_keepAliveState = (PCKeepAliveState *)a3;
}

- (int)keepAliveAction
{
  return self->_keepAliveAction;
}

- (void)setKeepAliveAction:(int)a3
{
  self->_keepAliveAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_softwareBuild, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_carrier, 0);
}

@end