@interface LACGlobalDomain
+ (BOOL)isCompanionDeviceMocked;
+ (BOOL)osVariantAllowsDomainOverrides;
+ (NSData)companionAuthentication;
+ (NSNumber)isCompanionSessionActive;
+ (NSNumber)isSharedModeActive;
+ (NSNumber)preboardMode;
+ (NSNumber)runningInBATS;
+ (NSNumber)sharedModeLatency;
+ (id)sharedInstance;
+ (void)setCompanionAuthentication:(id)a3;
+ (void)setIsCompanionDeviceMocked:(BOOL)a3;
+ (void)setIsCompanionSessionActive:(id)a3;
+ (void)setIsSharedModeActive:(id)a3;
+ (void)setPreboardMode:(id)a3;
+ (void)setRunningInBATS:(id)a3;
+ (void)setSharedModeLatency:(id)a3;
- (NSNumber)isDTOStrictModeEnabled;
- (void)setIsDTOStrictModeEnabled:(id)a3;
@end

@implementation LACGlobalDomain

+ (NSNumber)isCompanionSessionActive
{
  return (NSNumber *)@objc static LACGlobalDomain.isCompanionSessionActive.getter((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_valueForFlagOnenessSessionActive);
}

+ (BOOL)osVariantAllowsDomainOverrides
{
  return os_variant_allows_internal_security_policies();
}

+ (NSNumber)isSharedModeActive
{
  return (NSNumber *)@objc static LACGlobalDomain.isCompanionSessionActive.getter((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_valueForFlagSharedModeActive);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_10);
  }
  v2 = (void *)sharedInstance_sharedInstance_5;
  return v2;
}

uint64_t __33__LACGlobalDomain_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_5 = objc_alloc_init(LACGlobalDomain);
  return MEMORY[0x270F9A758]();
}

- (NSNumber)isDTOStrictModeEnabled
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_sharedInstance);
  id v6 = objc_msgSend(v5, sel_valueForFlagDTOStrictModeEnabled);

  return (NSNumber *)v6;
}

- (void)setIsDTOStrictModeEnabled:(id)a3
{
  id v4 = a3;
  specialized LACGlobalDomain.isDTOStrictModeEnabled.setter(a3, (SEL *)&selRef_flagDTOStrictModeEnabledKey);
}

+ (NSData)companionAuthentication
{
  id v2 = objc_msgSend(self, sel_sharedInstance);
  Class isa = (Class)objc_msgSend(v2, sel_valueForFlagOnenessSessionAuthentication);

  if (isa)
  {
    uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;

    Class isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v4, v6);
  }
  return (NSData *)isa;
}

+ (void)setCompanionAuthentication:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    id v4 = a3;
    uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;
  }
  else
  {
    unint64_t v6 = 0xF000000000000000;
  }
  specialized static LACGlobalDomain.companionAuthentication.setter(v3, v6);
}

+ (void)setIsCompanionSessionActive:(id)a3
{
  id v4 = a3;
  specialized LACGlobalDomain.isDTOStrictModeEnabled.setter(a3, (SEL *)&selRef_flagOnenessSessionActiveKey);
}

+ (BOOL)isCompanionDeviceMocked
{
  id v2 = objc_msgSend(self, sel_sharedInstance);
  id v3 = objc_msgSend(v2, sel_valueForFlagCompanionMockDevices);

  if (!v3) {
    return 0;
  }
  unsigned __int8 v4 = objc_msgSend(v3, sel_BOOLValue);

  return v4;
}

+ (void)setIsCompanionDeviceMocked:(BOOL)a3
{
  v8[3] = MEMORY[0x263F8D4F8];
  LOBYTE(v8[0]) = a3;
  id v3 = objc_msgSend(self, sel_sharedInstance, v8[0]);
  id v4 = objc_msgSend(v3, sel_flagCompanionMockDevicesKey);

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;

  specialized static LACGlobalDomain.setObject(_:forKey:)((uint64_t)v8, v5, v7);
  swift_bridgeObjectRelease();
  outlined destroy of Any?((uint64_t)v8);
}

+ (NSNumber)preboardMode
{
  return (NSNumber *)@objc static LACGlobalDomain.isCompanionSessionActive.getter((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_valueForFlagPreboardMode);
}

+ (void)setPreboardMode:(id)a3
{
  id v4 = a3;
  specialized LACGlobalDomain.isDTOStrictModeEnabled.setter(a3, (SEL *)&selRef_flagPreboardModeKey);
}

+ (NSNumber)runningInBATS
{
  return (NSNumber *)@objc static LACGlobalDomain.isCompanionSessionActive.getter((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_valueForFlagRunningInBATS);
}

+ (void)setRunningInBATS:(id)a3
{
  id v4 = a3;
  specialized LACGlobalDomain.isDTOStrictModeEnabled.setter(a3, (SEL *)&selRef_flagRunningInBATSKey);
}

+ (void)setIsSharedModeActive:(id)a3
{
  id v4 = a3;
  specialized LACGlobalDomain.isDTOStrictModeEnabled.setter(a3, (SEL *)&selRef_flagSharedModeActiveKey);
}

+ (NSNumber)sharedModeLatency
{
  return (NSNumber *)@objc static LACGlobalDomain.isCompanionSessionActive.getter((uint64_t)a1, (uint64_t)a2, (SEL *)&selRef_valueForFlagSharedModeLatency);
}

+ (void)setSharedModeLatency:(id)a3
{
  id v4 = a3;
  specialized LACGlobalDomain.isDTOStrictModeEnabled.setter(a3, (SEL *)&selRef_flagSharedModeLatencyKey);
}

@end