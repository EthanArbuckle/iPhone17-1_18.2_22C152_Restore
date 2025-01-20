@interface CRKSystemInfo
+ (CRKSystemInfo)sharedSystemInfo;
- (BOOL)cloudConfigEnablesEphemeralMultiUser;
- (BOOL)isEphemeralMultiUser;
- (NSDate)bootDate;
- (NSString)buildVersion;
- (NSString)systemVersion;
- (unint64_t)platform;
- (void)populateVersions;
- (void)setBuildVersion:(id)a3;
- (void)setSystemVersion:(id)a3;
@end

@implementation CRKSystemInfo

+ (CRKSystemInfo)sharedSystemInfo
{
  if (sharedSystemInfo_onceToken != -1) {
    dispatch_once(&sharedSystemInfo_onceToken, &__block_literal_global_71);
  }
  v2 = (void *)sharedSystemInfo_info;

  return (CRKSystemInfo *)v2;
}

uint64_t __33__CRKSystemInfo_sharedSystemInfo__block_invoke()
{
  sharedSystemInfo_info = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (void)populateVersions
{
  v3 = +[CRKMobileGestalt sharedGestalt];
  id v6 = [v3 buildVersion];

  v4 = +[CRKMobileGestalt sharedGestalt];
  v5 = [v4 productVersion];

  [(CRKSystemInfo *)self setBuildVersion:v6];
  [(CRKSystemInfo *)self setSystemVersion:v5];
}

- (NSString)buildVersion
{
  buildVersion = self->_buildVersion;
  if (!buildVersion)
  {
    [(CRKSystemInfo *)self populateVersions];
    buildVersion = self->_buildVersion;
  }

  return buildVersion;
}

- (NSString)systemVersion
{
  systemVersion = self->_systemVersion;
  if (!systemVersion)
  {
    [(CRKSystemInfo *)self populateVersions];
    systemVersion = self->_systemVersion;
  }

  return systemVersion;
}

- (unint64_t)platform
{
  return 1;
}

- (NSDate)bootDate
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  *(void *)v7 = 0x1500000001;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  size_t v4 = 16;
  if (sysctl(v7, 2u, &v5, &v4, 0, 0) == -1)
  {
    v2 = 0;
  }
  else
  {
    v2 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(int)v6 / 1000000.0 + (double)v5];
  }

  return (NSDate *)v2;
}

- (BOOL)isEphemeralMultiUser
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isEphemeralMultiUser];

  return v3;
}

- (BOOL)cloudConfigEnablesEphemeralMultiUser
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 userMode] == 1;

  return v3;
}

- (void)setBuildVersion:(id)a3
{
}

- (void)setSystemVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemVersion, 0);

  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end