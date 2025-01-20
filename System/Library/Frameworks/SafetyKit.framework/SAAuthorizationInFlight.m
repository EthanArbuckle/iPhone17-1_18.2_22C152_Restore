@interface SAAuthorizationInFlight
+ (id)sharedInstance;
- (BOOL)isInFlight;
- (NSString)fromBundleId;
- (NSString)getFromBundleLocalizedName;
- (NSString)getToBundleLocalizedName;
- (NSString)toBundleId;
- (SABundleManagerApp)fromApp;
- (id)completionHandler;
- (id)description;
- (int64_t)preflightAuthorizationStatus;
- (void)getFromBundleLocalizedNameWithCompletion:(id)a3;
- (void)getToBundleLocalizedName;
- (void)reset;
- (void)setCompletionHandler:(id)a3;
- (void)setFromApp:(id)a3;
- (void)setFromBundleId:(id)a3;
- (void)setInFlight:(BOOL)a3;
- (void)setPreflightAuthorizationStatus:(int64_t)a3;
- (void)setToBundleId:(id)a3;
@end

@implementation SAAuthorizationInFlight

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SAAuthorizationInFlight_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_sSAServerAuthorizationInFlight;

  return v2;
}

uint64_t __41__SAAuthorizationInFlight_sharedInstance__block_invoke()
{
  sharedInstance_sSAServerAuthorizationInFlight = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (NSString)getToBundleLocalizedName
{
  if (self->_toBundleId)
  {
    v2 = objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:");
    if (!v2)
    {
      v3 = sa_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        [(SAAuthorizationInFlight *)v3 getToBundleLocalizedName];
      }
    }
    v11 = [v2 objectForInfoDictionaryKey:@"CFBundleName"];
  }
  else
  {
    v11 = 0;
  }

  return (NSString *)v11;
}

- (NSString)getFromBundleLocalizedName
{
  v2 = [(SAAuthorizationInFlight *)self fromApp];
  v3 = [v2 getLocalizedName];

  return (NSString *)v3;
}

- (void)getFromBundleLocalizedNameWithCompletion:(id)a3
{
  uint64_t v8 = a3;
  uint64_t v4 = [(SAAuthorizationInFlight *)self fromApp];
  uint64_t v5 = [v4 getLocalizedName];

  if (v5)
  {
    uint64_t v6 = (void (*)(void))v8[2];
LABEL_3:
    v6();
    goto LABEL_6;
  }
  fromApp = self->_fromApp;
  if (!fromApp)
  {
    uint64_t v6 = (void (*)(void))v8[2];
    goto LABEL_3;
  }
  [(SABundleManagerApp *)fromApp getLocalizedNameForPairedDeviceWithCompletion:v8];
LABEL_6:
}

- (void)reset
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  fromApp = self->_fromApp;
  self->_fromApp = 0;

  toBundleId = self->_toBundleId;
  self->_toBundleId = 0;

  self->_inFlight = 0;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = [(SAAuthorizationInFlight *)self isInFlight];
  uint64_t v5 = [(SAAuthorizationInFlight *)self fromApp];
  uint64_t v6 = [v5 bundleId];
  uint64_t v7 = [(SAAuthorizationInFlight *)self getFromBundleLocalizedName];
  uint64_t v8 = [(SAAuthorizationInFlight *)self toBundleId];
  uint64_t v9 = [(SAAuthorizationInFlight *)self getToBundleLocalizedName];
  uint64_t v10 = [v3 stringWithFormat:@"Authorization, isInFlight: %d, from: %@ (%@), to: %@ (%@)", v4, v6, v7, v8, v9];

  return v10;
}

- (BOOL)isInFlight
{
  return self->_inFlight;
}

- (void)setInFlight:(BOOL)a3
{
  self->_inFlight = a3;
}

- (int64_t)preflightAuthorizationStatus
{
  return self->_preflightAuthorizationStatus;
}

- (void)setPreflightAuthorizationStatus:(int64_t)a3
{
  self->_preflightAuthorizationStatus = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSString)fromBundleId
{
  return self->_fromBundleId;
}

- (void)setFromBundleId:(id)a3
{
}

- (SABundleManagerApp)fromApp
{
  return self->_fromApp;
}

- (void)setFromApp:(id)a3
{
}

- (NSString)toBundleId
{
  return self->_toBundleId;
}

- (void)setToBundleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toBundleId, 0);
  objc_storeStrong((id *)&self->_fromApp, 0);
  objc_storeStrong((id *)&self->_fromBundleId, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->toBundleLocalizedName, 0);
}

- (void)getToBundleLocalizedName
{
}

@end