@interface GEOResourceManifestConfiguration
+ (BOOL)supportsSecureCoding;
+ (GEOResourceManifestConfiguration)configurationWithPairedDevice:(id)a3;
+ (id)defaultConfiguration;
- (BOOL)isDefaultConfiguration;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresLegacyFormat;
- (GEOResourceManifestConfiguration)init;
- (GEOResourceManifestConfiguration)initWithCoder:(id)a3;
- (NSArray)tileSetOverrides;
- (NSString)applicationIdentifier;
- (NSString)applicationVersion;
- (NSString)countryCode;
- (NSString)directorySuffix;
- (NSString)environment;
- (NSString)hardwareIdentifier;
- (NSString)os;
- (NSString)osBuild;
- (NSString)osVersion;
- (NSString)urlTemplate;
- (id)_directorySuffixParameters;
- (id)dataDirectoryFor:(unint64_t)a3;
- (id)manifestDictionaryRepresentation;
- (int)defaultScale;
- (unint64_t)hash;
- (unsigned)tileGroupIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationVersion:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDataDirectory:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setHardwareIdentifier:(id)a3;
- (void)setOs:(id)a3;
- (void)setOsBuild:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setTileGroupIdentifier:(unsigned int)a3;
- (void)setTileSetOverrides:(id)a3;
- (void)setUrlTemplate:(id)a3;
@end

@implementation GEOResourceManifestConfiguration

- (id)dataDirectoryFor:(unint64_t)a3
{
  if ([(GEOResourceManifestConfiguration *)self isDefaultConfiguration])
  {
    v5 = +[GEOFilePaths pathFor:a3];
LABEL_5:
    v7 = v5;
    goto LABEL_6;
  }
  dataDirectory = self->_dataDirectory;
  if (dataDirectory)
  {
    v5 = dataDirectory;
    goto LABEL_5;
  }
  v9 = [(GEOResourceManifestConfiguration *)self directorySuffix];
  uint64_t v10 = [v9 length];
  v11 = +[GEOFilePaths pathFor:a3];
  v7 = v11;
  if (v10)
  {
    uint64_t v12 = [v11 stringByAppendingPathComponent:v9];

    v7 = (void *)v12;
  }

LABEL_6:

  return v7;
}

- (BOOL)isDefaultConfiguration
{
  return !self->_tileGroupIdentifier
      && !self->_os
      && !self->_osVersion
      && !self->_osBuild
      && !self->_countryCode
      && !self->_hardwareIdentifier
      && !self->_applicationIdentifier
      && !self->_applicationVersion
      && !self->_environment
      && !self->_dataDirectory
      && !self->_tileSetOverrides
      && self->_urlTemplate == 0;
}

- (NSString)environment
{
  environment = self->_environment;
  if (environment)
  {
    v3 = environment;
  }
  else
  {
    v4 = _getValue(GeoServicesConfig_CustomEnvironmentConfiguration, (uint64_t)off_1E91155F8, 1, 0, 0, 0);
    v5 = [v4 objectForKey:@"GEOResourceManifestEnvironment"];
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      _getValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1E9113958, 1, 0, 0, 0);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v3 = v7;
  }

  return v3;
}

+ (id)defaultConfiguration
{
  v2 = objc_alloc_init(GEOResourceManifestConfiguration);

  return v2;
}

- (GEOResourceManifestConfiguration)init
{
  v9.receiver = self;
  v9.super_class = (Class)GEOResourceManifestConfiguration;
  v2 = [(GEOResourceManifestConfiguration *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_tileGroupIdentifier = 0;
    v4 = +[GEOPlatform sharedPlatform];
    [v4 deviceScreenScale];
    if (v5 <= 1.0) {
      int v6 = 1;
    }
    else {
      int v6 = 2;
    }
    if (v5 > 2.0) {
      int v6 = 3;
    }
    v3->_defaultScale = v6;

    v7 = v3;
  }

  return v3;
}

- (NSString)urlTemplate
{
  urlTemplate = self->_urlTemplate;
  if (urlTemplate)
  {
    v3 = urlTemplate;
  }
  else
  {
    _GEOGetURLWithSource(1, 0, 1, 0);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)manifestDictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(GEOResourceManifestConfiguration *)self os];
  [v3 setObject:v4 forKeyedSubscript:@"os"];

  double v5 = [(GEOResourceManifestConfiguration *)self osVersion];
  [v3 setObject:v5 forKeyedSubscript:@"os_version"];

  int v6 = [(GEOResourceManifestConfiguration *)self osBuild];
  [v3 setObject:v6 forKeyedSubscript:@"os_build"];

  v7 = [(GEOResourceManifestConfiguration *)self countryCode];
  [v3 setObject:v7 forKeyedSubscript:@"country_code"];

  v8 = [(GEOResourceManifestConfiguration *)self hardwareIdentifier];
  [v3 setObject:v8 forKeyedSubscript:@"hardware"];

  objc_super v9 = [(GEOResourceManifestConfiguration *)self applicationIdentifier];
  [v3 setObject:v9 forKeyedSubscript:@"application"];

  uint64_t v10 = [(GEOResourceManifestConfiguration *)self applicationVersion];
  [v3 setObject:v10 forKeyedSubscript:@"application_version"];

  return v3;
}

- (NSString)os
{
  os = self->_os;
  if (os) {
    v3 = os;
  }
  else {
    v3 = @"ios";
  }

  return (NSString *)v3;
}

- (NSString)osVersion
{
  osVersion = self->_osVersion;
  if (osVersion)
  {
    v3 = osVersion;
  }
  else
  {
    v4 = +[GEOPlatform sharedPlatform];
    v3 = [v4 osVersion];
  }

  return v3;
}

- (NSString)osBuild
{
  osBuild = self->_osBuild;
  if (osBuild)
  {
    v3 = osBuild;
  }
  else
  {
    v4 = +[GEOPlatform sharedPlatform];
    v3 = [v4 buildVersion];
  }

  return v3;
}

- (NSString)hardwareIdentifier
{
  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier)
  {
    v3 = hardwareIdentifier;
  }
  else
  {
    v4 = +[GEOPlatform sharedPlatform];
    v3 = [v4 hardwareIdentifier];
  }

  return v3;
}

- (NSString)countryCode
{
  countryCode = self->_countryCode;
  if (countryCode)
  {
    v3 = countryCode;
  }
  else
  {
    v4 = +[GEOCountryConfiguration sharedConfiguration];
    uint64_t v5 = [v4 countryCode];

    if (v5) {
      v3 = (__CFString *)v5;
    }
    else {
      v3 = @"unknown";
    }
  }

  return (NSString *)v3;
}

- (NSString)applicationVersion
{
  if (self->_applicationVersion) {
    return self->_applicationVersion;
  }
  else {
    return (NSString *)@"1";
  }
}

- (NSString)applicationIdentifier
{
  if (self->_applicationIdentifier) {
    return self->_applicationIdentifier;
  }
  else {
    return (NSString *)@"geod";
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlTemplate, 0);
  objc_storeStrong((id *)&self->_tileSetOverrides, 0);
  objc_storeStrong((id *)&self->_dataDirectory, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);

  objc_storeStrong((id *)&self->_os, 0);
}

- (int)defaultScale
{
  return self->_defaultScale;
}

- (unsigned)tileGroupIdentifier
{
  return self->_tileGroupIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (GEOResourceManifestConfiguration)configurationWithPairedDevice:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(GEOResourceManifestConfiguration);
    uint64_t v5 = getNRDevicePropertySystemVersion();
    int v6 = [v3 valueForProperty:v5];
    [(GEOResourceManifestConfiguration *)v4 setOsVersion:v6];

    v7 = getNRDevicePropertySystemBuildVersion();
    v8 = [v3 valueForProperty:v7];
    [(GEOResourceManifestConfiguration *)v4 setOsBuild:v8];

    objc_super v9 = getNRDevicePropertyProductType();
    uint64_t v10 = [v3 valueForProperty:v9];
    [(GEOResourceManifestConfiguration *)v4 setHardwareIdentifier:v10];

    v11 = +[GEOFilePaths pathFor:13];
    uint64_t v12 = [(GEOResourceManifestConfiguration *)v4 directorySuffix];
    v13 = [v11 stringByAppendingPathComponent:v12];
    [(GEOResourceManifestConfiguration *)v4 setDataDirectory:v13];

    [(GEOResourceManifestConfiguration *)v4 setOs:@"watchos"];
    v14 = getNRDevicePropertyScreenScale();
    v15 = [v3 valueForProperty:v14];
    [v15 floatValue];
    if (v16 <= 1.0) {
      int v17 = 1;
    }
    else {
      int v17 = 2;
    }
    if (v16 > 2.0) {
      int v17 = 3;
    }
    v4->_defaultScale = v17;

    uint64_t v18 = geoNRWatchOSVersionForRemoteDevice(v3);
    if ((geoNRVersionIsGreaterThanOrEqual(v18, 327680) & 1) == 0) {
      v4->_requiresLegacyFormat = 1;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (GEOResourceManifestConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)GEOResourceManifestConfiguration;
  uint64_t v5 = [(GEOResourceManifestConfiguration *)&v36 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"tgi"]) {
      v5->_tileGroupIdentifier = [v4 decodeInt32ForKey:@"tgi"];
    }
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"os"];
    os = v5->_os;
    v5->_os = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"osv"];
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"osb"];
    osBuild = v5->_osBuild;
    v5->_osBuild = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cc"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hw"];
    hardwareIdentifier = v5->_hardwareIdentifier;
    v5->_hardwareIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"app"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appv"];
    applicationVersion = v5->_applicationVersion;
    v5->_applicationVersion = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"env"];
    environment = v5->_environment;
    v5->_environment = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"datadir"];
    dataDirectory = v5->_dataDirectory;
    v5->_dataDirectory = (NSString *)v22;

    if ([v4 containsValueForKey:@"mnscl"])
    {
      v5->_defaultScale = [v4 decodeInt32ForKey:@"mnscl"];
    }
    else
    {
      v24 = +[GEOPlatform sharedPlatform];
      [v24 deviceScreenScale];
      if (v25 <= 1.0) {
        int v26 = 1;
      }
      else {
        int v26 = 2;
      }
      if (v25 > 2.0) {
        int v26 = 3;
      }
      v5->_defaultScale = v26;
    }
    if ([v4 containsValueForKey:@"rlf"]) {
      v5->_requiresLegacyFormat = [v4 decodeBoolForKey:@"rlf"];
    }
    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"tileSetOverrides"];
    tileSetOverrides = v5->_tileSetOverrides;
    v5->_tileSetOverrides = (NSArray *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlTemplate"];
    urlTemplate = v5->_urlTemplate;
    v5->_urlTemplate = (NSString *)v32;

    v34 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t tileGroupIdentifier = self->_tileGroupIdentifier;
  id v18 = v4;
  if (tileGroupIdentifier)
  {
    [v4 encodeInt32:tileGroupIdentifier forKey:@"tgi"];
    id v4 = v18;
  }
  os = self->_os;
  if (os)
  {
    [v18 encodeObject:os forKey:@"os"];
    id v4 = v18;
  }
  osVersion = self->_osVersion;
  if (osVersion)
  {
    [v18 encodeObject:osVersion forKey:@"osv"];
    id v4 = v18;
  }
  osBuild = self->_osBuild;
  if (osBuild)
  {
    [v18 encodeObject:osBuild forKey:@"osb"];
    id v4 = v18;
  }
  countryCode = self->_countryCode;
  if (countryCode)
  {
    [v18 encodeObject:countryCode forKey:@"cc"];
    id v4 = v18;
  }
  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier)
  {
    [v18 encodeObject:hardwareIdentifier forKey:@"hw"];
    id v4 = v18;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier)
  {
    [v18 encodeObject:applicationIdentifier forKey:@"app"];
    id v4 = v18;
  }
  applicationVersion = self->_applicationVersion;
  if (applicationVersion)
  {
    [v18 encodeObject:applicationVersion forKey:@"appv"];
    id v4 = v18;
  }
  environment = self->_environment;
  if (environment)
  {
    [v18 encodeObject:environment forKey:@"env"];
    id v4 = v18;
  }
  dataDirectory = self->_dataDirectory;
  if (dataDirectory)
  {
    [v18 encodeObject:dataDirectory forKey:@"datadir"];
    id v4 = v18;
  }
  [v4 encodeInt32:self->_defaultScale forKey:@"mnscl"];
  if (self->_requiresLegacyFormat) {
    [v18 encodeBool:1 forKey:@"rlf"];
  }
  tileSetOverrides = self->_tileSetOverrides;
  if (tileSetOverrides) {
    [v18 encodeObject:tileSetOverrides forKey:@"tileSetOverrides"];
  }
  urlTemplate = self->_urlTemplate;
  int v17 = v18;
  if (urlTemplate)
  {
    [v18 encodeObject:urlTemplate forKey:@"urlTemplate"];
    int v17 = v18;
  }
}

- (id)_directorySuffixParameters
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_tileGroupIdentifier)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    [v3 setObject:v4 forKey:@"tgi"];
  }
  os = self->_os;
  if (os) {
    [v3 setObject:os forKey:@"os"];
  }
  osVersion = self->_osVersion;
  if (osVersion) {
    [v3 setObject:osVersion forKey:@"osv"];
  }
  osBuild = self->_osBuild;
  if (osBuild) {
    [v3 setObject:osBuild forKey:@"osb"];
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    [v3 setObject:countryCode forKey:@"cc"];
  }
  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier) {
    [v3 setObject:hardwareIdentifier forKey:@"hw"];
  }
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier) {
    [v3 setObject:applicationIdentifier forKey:@"app"];
  }
  applicationVersion = self->_applicationVersion;
  if (applicationVersion) {
    [v3 setObject:applicationVersion forKey:@"appv"];
  }
  environment = self->_environment;
  if (environment) {
    [v3 setObject:environment forKey:@"env"];
  }
  dataDirectory = self->_dataDirectory;
  if (dataDirectory) {
    [v3 setObject:dataDirectory forKey:@"datadir"];
  }
  uint64_t v14 = [NSNumber numberWithInt:self->_defaultScale];
  [v3 setObject:v14 forKey:@"mnscl"];

  if (self->_requiresLegacyFormat) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"rlf"];
  }
  tileSetOverrides = self->_tileSetOverrides;
  if (tileSetOverrides)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v16 = tileSetOverrides;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = 0;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v16);
          }
          v19 ^= objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "hash", (void)v28);
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v18);
    }
    else
    {
      uint64_t v19 = 0;
    }

    uint64_t v22 = [NSNumber numberWithUnsignedInteger:v19];
    [v3 setObject:v22 forKey:@"tso"];
  }
  urlTemplate = self->_urlTemplate;
  if (urlTemplate)
  {
    v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSString hash](urlTemplate, "hash"));
    [v3 setObject:v24 forKey:@"urltmp"];
  }
  if (objc_msgSend(v3, "count", (void)v28)) {
    double v25 = v3;
  }
  else {
    double v25 = 0;
  }
  id v26 = v25;

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (NSString **)v4;
    if (self->_tileGroupIdentifier != *((_DWORD *)v5 + 2)) {
      goto LABEL_27;
    }
    os = self->_os;
    if (os != v5[2] && !-[NSString isEqualToString:](os, "isEqualToString:")) {
      goto LABEL_27;
    }
    osVersion = self->_osVersion;
    if (osVersion != v5[3] && !-[NSString isEqualToString:](osVersion, "isEqualToString:")) {
      goto LABEL_27;
    }
    osBuild = self->_osBuild;
    if (osBuild != v5[4] && !-[NSString isEqualToString:](osBuild, "isEqualToString:")) {
      goto LABEL_27;
    }
    countryCode = self->_countryCode;
    if (countryCode != v5[5] && !-[NSString isEqualToString:](countryCode, "isEqualToString:")) {
      goto LABEL_27;
    }
    if (((hardwareIdentifier = self->_hardwareIdentifier, hardwareIdentifier == v5[6])
       || -[NSString isEqualToString:](hardwareIdentifier, "isEqualToString:"))
      && ((applicationIdentifier = self->_applicationIdentifier, applicationIdentifier == v5[7])
       || -[NSString isEqualToString:](applicationIdentifier, "isEqualToString:"))
      && ((applicationVersion = self->_applicationVersion, applicationVersion == v5[8])
       || -[NSString isEqualToString:](applicationVersion, "isEqualToString:"))
      && ((environment = self->_environment, environment == v5[9])
       || -[NSString isEqualToString:](environment, "isEqualToString:"))
      && ((dataDirectory = self->_dataDirectory, dataDirectory == v5[10])
       || -[NSString isEqualToString:](dataDirectory, "isEqualToString:"))
      && ((tileSetOverrides = self->_tileSetOverrides, tileSetOverrides == (NSArray *)v5[12])
       || -[NSArray isEqualToArray:](tileSetOverrides, "isEqualToArray:"))
      && ((urlTemplate = self->_urlTemplate, urlTemplate == v5[13])
       || -[NSString isEqualToString:](urlTemplate, "isEqualToString:")))
    {
      BOOL v17 = 1;
    }
    else
    {
LABEL_27:
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  uint64_t tileGroupIdentifier = self->_tileGroupIdentifier;
  NSUInteger v4 = [(NSString *)self->_os hash] ^ tileGroupIdentifier;
  NSUInteger v5 = [(NSString *)self->_osVersion hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_osBuild hash];
  NSUInteger v7 = [(NSString *)self->_countryCode hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_hardwareIdentifier hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_applicationIdentifier hash];
  NSUInteger v10 = [(NSString *)self->_applicationVersion hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_environment hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_dataDirectory hash];
  uint64_t v13 = v9 ^ v12 ^ [(NSArray *)self->_tileSetOverrides hash];
  return v13 ^ [(NSString *)self->_urlTemplate hash];
}

- (NSString)directorySuffix
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(GEOResourceManifestConfiguration *)self _directorySuffixParameters];
  if ([v2 count])
  {
    id v3 = [v2 allKeys];
    NSUInteger v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_538];

    NSUInteger v5 = [MEMORY[0x1E4F28E78] string];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 1;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v6);
          }
          NSUInteger v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (([v12 isEqualToString:@"datadir"] & 1) == 0
            && ([v12 isEqualToString:@"mnscl"] & 1) == 0)
          {
            if ((v9 & 1) == 0) {
              [v5 appendFormat:@"."];
            }
            uint64_t v13 = [v2 objectForKey:v12];
            [v5 appendFormat:@"%@_%@", v12, v13, (void)v15];

            char v9 = 0;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    NSUInteger v5 = 0;
  }

  return (NSString *)v5;
}

uint64_t __51__GEOResourceManifestConfiguration_directorySuffix__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setDataDirectory:(id)a3
{
  NSUInteger v4 = (NSString *)[a3 copy];
  dataDirectory = self->_dataDirectory;
  self->_dataDirectory = v4;
}

- (void)setTileSetOverrides:(id)a3
{
}

- (NSArray)tileSetOverrides
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  tileSetOverrides = self->_tileSetOverrides;
  if (tileSetOverrides)
  {
    double v25 = tileSetOverrides;
  }
  else
  {
    id v3 = _getValue(GeoServicesConfig_ActiveTileGroupOverrides, (uint64_t)off_1E9114208, 1, 0, 0, 0);
    NSUInteger v4 = v3;
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
      double v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v23 = v4;
      id obj = v4;
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v27 != v7) {
              objc_enumerationMutation(obj);
            }
            char v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            uint64_t v10 = [v9 objectForKey:@"style"];
            uint64_t v11 = [v10 intValue];

            NSUInteger v12 = [v9 objectForKey:@"size"];
            uint64_t v13 = [v12 intValue];

            uint64_t v14 = [v9 objectForKey:@"scale"];
            uint64_t v15 = [v14 intValue];

            long long v16 = [v9 objectForKey:@"version"];
            long long v17 = [v9 objectForKey:@"baseURL"];
            long long v18 = [v9 objectForKey:@"localizationURL"];
            uint64_t v19 = [[_GEOResourceManifestTileSetOverride alloc] initWithStyle:v11 size:v13 scale:v15];
            [(_GEOResourceManifestTileSetOverride *)v19 setVersion:v16];
            uint64_t v20 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
            [(_GEOResourceManifestTileSetOverride *)v19 setBaseURL:v20];

            v21 = [MEMORY[0x1E4F1CB10] URLWithString:v18];
            [(_GEOResourceManifestTileSetOverride *)v19 setLocalizationURL:v21];

            [(NSArray *)v25 addObject:v19];
          }
          uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v6);
      }

      NSUInteger v4 = v23;
    }
    else
    {
      double v25 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v25;
}

- (void)setTileGroupIdentifier:(unsigned int)a3
{
  self->_uint64_t tileGroupIdentifier = a3;
}

- (void)setOs:(id)a3
{
}

- (void)setOsVersion:(id)a3
{
}

- (void)setOsBuild:(id)a3
{
}

- (void)setCountryCode:(id)a3
{
}

- (void)setHardwareIdentifier:(id)a3
{
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (void)setApplicationVersion:(id)a3
{
}

- (void)setEnvironment:(id)a3
{
}

- (void)setUrlTemplate:(id)a3
{
}

- (BOOL)requiresLegacyFormat
{
  return self->_requiresLegacyFormat;
}

@end