@interface CRLDeviceManagementRestrictionsManager
+ (NSString)deviceManagementRestrictionsChangedNotificationName;
+ (_TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager)sharedManager;
- (BOOL)isDefinitionLookupAllowed;
- (BOOL)isKeyboardMathSolvingAllowed;
- (BOOL)isMathPaperSolvingAllowed;
- (_TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager)init;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)registerObserver;
- (void)setIsDefinitionLookupAllowed:(BOOL)a3;
- (void)setIsKeyboardMathSolvingAllowed:(BOOL)a3;
- (void)setIsMathPaperSolvingAllowed:(BOOL)a3;
@end

@implementation CRLDeviceManagementRestrictionsManager

+ (NSString)deviceManagementRestrictionsChangedNotificationName
{
  return (NSString *)@objc static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName.getter((uint64_t)a1, (uint64_t)a2, &one-time initialization token for deviceManagementRestrictionsChangedNotificationName, (void **)&static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName);
}

- (BOOL)isMathPaperSolvingAllowed
{
  v2 = (BOOL *)self
     + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed;
  swift_beginAccess();
  return *v2;
}

- (void)setIsMathPaperSolvingAllowed:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isKeyboardMathSolvingAllowed
{
  v2 = (BOOL *)self
     + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed;
  swift_beginAccess();
  return *v2;
}

- (void)setIsKeyboardMathSolvingAllowed:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isDefinitionLookupAllowed
{
  v2 = (BOOL *)self
     + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed;
  swift_beginAccess();
  return *v2;
}

- (void)setIsDefinitionLookupAllowed:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)dealloc
{
  v2 = self;
  id v3 = CRLDeviceManagementRestrictionsManager.connection.getter();
  if (v3)
  {
    v4 = v3;
    [v3 unregisterObserver:v2];
  }
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for CRLDeviceManagementRestrictionsManager();
  [(CRLDeviceManagementRestrictionsManager *)&v5 dealloc];
}

- (void).cxx_destruct
{
  outlined consume of MCProfileConnection??(*(id *)((char *)&self->super.isa
                                                  + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager____lazy_storage___connection));
}

+ (_TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager)sharedManager
{
  return (_TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager *)@objc static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName.getter((uint64_t)a1, (uint64_t)a2, &one-time initialization token for _sharedManager, (void **)&static CRLDeviceManagementRestrictionsManager._sharedManager);
}

- (void)registerObserver
{
  v2 = self;
  CRLDeviceManagementRestrictionsManager.registerObserver()();
}

- (_TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed) = 1;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed) = 1;
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed) = 1;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC22FreeformDataclassOwner38CRLDeviceManagementRestrictionsManager____lazy_storage___connection) = (Class)(&dword_0 + 1);
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLDeviceManagementRestrictionsManager();
  return [(CRLDeviceManagementRestrictionsManager *)&v3 init];
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if (a4) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v6 = a3;
  v7 = self;
  specialized CRLDeviceManagementRestrictionsManager.profileConnectionDidReceiveEffectiveSettingsChangedNotification(_:userInfo:)(a3);

  swift_bridgeObjectRelease();
}

@end