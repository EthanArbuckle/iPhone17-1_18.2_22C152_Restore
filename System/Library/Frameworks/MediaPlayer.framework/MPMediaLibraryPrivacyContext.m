@interface MPMediaLibraryPrivacyContext
+ (id)contextForDefaultClient;
+ (id)sharedContextForCurrentProcess;
+ (void)initialize;
+ (void)setDefaultClientWithAuditToken:(id *)a3;
- (MPMediaLibraryPrivacyContext)init;
- (MPMediaLibraryPrivacyContext)initWithAuditToken:(id *)a3;
- (MPMediaLibraryPrivacyContext)initWithClientIdentity:(id)a3;
- (MPMediaLibraryPrivacyContext)initWithPAApplication:(id)a3;
- (void)beginAccessInterval;
- (void)endAccessInterval;
- (void)logPrivacyAccess;
@end

@implementation MPMediaLibraryPrivacyContext

+ (void)initialize
{
  if (initialize_onceToken_36206 != -1) {
    dispatch_once(&initialize_onceToken_36206, &__block_literal_global_36207);
  }
}

- (void)logPrivacyAccess
{
  [(MPGreenTeaLoggerWrapper *)self->_gtLogger logAccess];
  id v4 = [MEMORY[0x1E4F934D0] sharedInstance];
  if ([v4 loggingEnabled])
  {
    v3 = [MEMORY[0x1E4F93508] accessWithAccessor:self->_clientApplication forService:*MEMORY[0x1E4FA9AA0]];
    [v4 log:v3];
  }
}

+ (id)sharedContextForCurrentProcess
{
  if (sharedContextForCurrentProcess_onceToken != -1) {
    dispatch_once(&sharedContextForCurrentProcess_onceToken, &__block_literal_global_19_36204);
  }
  v2 = (void *)sharedContextForCurrentProcess___contextForCurrentProcess;

  return v2;
}

void __62__MPMediaLibraryPrivacyContext_sharedContextForCurrentProcess__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F934E0];
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v2 = [v1 bundleIdentifier];
  id v5 = [v0 applicationWithBundleID:v2];

  v3 = [[MPMediaLibraryPrivacyContext alloc] initWithPAApplication:v5];
  id v4 = (void *)sharedContextForCurrentProcess___contextForCurrentProcess;
  sharedContextForCurrentProcess___contextForCurrentProcess = (uint64_t)v3;
}

void __42__MPMediaLibraryPrivacyContext_initialize__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F934E0];
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v4 bundleIdentifier];
  uint64_t v2 = [v0 applicationWithBundleID:v1];
  v3 = (void *)__defaultApplication;
  __defaultApplication = v2;
}

+ (id)contextForDefaultClient
{
  os_unfair_lock_lock((os_unfair_lock_t)&__defaultLock);
  id v2 = (id)__defaultApplication;
  os_unfair_lock_unlock((os_unfair_lock_t)&__defaultLock);
  v3 = [[MPMediaLibraryPrivacyContext alloc] initWithPAApplication:v2];

  return v3;
}

- (MPMediaLibraryPrivacyContext)initWithPAApplication:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MPMediaLibraryPrivacyContext;
  id v5 = [(MPMediaLibraryPrivacyContext *)&v17 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (PAApplication *)v4;
      clientApplication = v5->_clientApplication;
      v5->_clientApplication = v6;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E4F934E0];
      clientApplication = [MEMORY[0x1E4F28B50] mainBundle];
      v9 = [clientApplication bundleIdentifier];
      uint64_t v10 = [v8 applicationWithBundleID:v9];
      v11 = v5->_clientApplication;
      v5->_clientApplication = (PAApplication *)v10;
    }
    v12 = [MPGreenTeaLoggerWrapper alloc];
    v13 = [(PAApplication *)v5->_clientApplication bundleID];
    uint64_t v14 = [(MPGreenTeaLoggerWrapper *)v12 initWithAccessorName:v13];
    gtLogger = v5->_gtLogger;
    v5->_gtLogger = (MPGreenTeaLoggerWrapper *)v14;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gtLogger, 0);
  objc_storeStrong((id *)&self->_privacyAccessInterval, 0);

  objc_storeStrong((id *)&self->_clientApplication, 0);
}

- (void)endAccessInterval
{
  [(PAAccessInterval *)self->_privacyAccessInterval end];
  gtLogger = self->_gtLogger;

  [(MPGreenTeaLoggerWrapper *)gtLogger endLogAccessInterval];
}

- (void)beginAccessInterval
{
  id v6 = [MEMORY[0x1E4F93508] accessWithAccessor:self->_clientApplication forService:*MEMORY[0x1E4FA9AA0]];
  v3 = [MEMORY[0x1E4F934D0] sharedInstance];
  id v4 = [v3 beginIntervalForAccess:v6];
  privacyAccessInterval = self->_privacyAccessInterval;
  self->_privacyAccessInterval = v4;

  [(MPGreenTeaLoggerWrapper *)self->_gtLogger beginLogAccessInterval];
}

- (MPMediaLibraryPrivacyContext)initWithAuditToken:(id *)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F934E0]);
  long long v6 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v6;
  v7 = (void *)[v5 initWithAuditToken:v10];
  v8 = [(MPMediaLibraryPrivacyContext *)self initWithPAApplication:v7];

  return v8;
}

- (MPMediaLibraryPrivacyContext)initWithClientIdentity:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F934E0];
    id v5 = a3;
    long long v6 = (void *)[[v4 alloc] initWithTCCIdentity:v5];
  }
  else
  {
    long long v6 = 0;
  }
  v7 = [(MPMediaLibraryPrivacyContext *)self initWithPAApplication:v6];

  return v7;
}

- (MPMediaLibraryPrivacyContext)init
{
  return [(MPMediaLibraryPrivacyContext *)self initWithPAApplication:0];
}

+ (void)setDefaultClientWithAuditToken:(id *)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&__defaultLock);
  id v4 = objc_alloc(MEMORY[0x1E4F934E0]);
  long long v5 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v5;
  uint64_t v6 = [v4 initWithAuditToken:v8];
  v7 = (void *)__defaultApplication;
  __defaultApplication = v6;

  os_unfair_lock_unlock((os_unfair_lock_t)&__defaultLock);
}

@end