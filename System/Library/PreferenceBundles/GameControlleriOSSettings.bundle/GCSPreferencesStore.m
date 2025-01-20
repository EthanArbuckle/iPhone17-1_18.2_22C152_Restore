@interface GCSPreferencesStore
+ (Class)keyPathsForValuesAffectingHiddenControllers;
+ (id)keyPathsForValuesAffectingActiveProfiles;
+ (id)keyPathsForValuesAffectingControllers;
+ (id)keyPathsForValuesAffectingFusableControllers;
+ (id)keyPathsForValuesAffectingInactiveProfiles;
+ (id)keyPathsForValuesAffectingSortedProfiles;
+ (id)keyPathsForValuesAffectingUnfusedFusableControllers;
- (BOOL)controllerIsConnected:(id)a3;
- (BOOL)controllerIsFusedController:(id)a3;
- (BOOL)fusedControllerIsConnectedWithPilotOrCopilotController:(id)a3;
- (BOOL)longPressMenuOpensLaunchPad;
- (BOOL)naturalThumbstickScrollDirection;
- (GCSGame)defaultGame;
- (GCSProfile)defaultProfile;
- (NSArray)activeProfiles;
- (NSArray)allControllers;
- (NSArray)connectedControllerIdentifiers;
- (NSArray)controllers;
- (NSArray)copilotFusedControllers;
- (NSArray)fusableControllers;
- (NSArray)fusedControllers;
- (NSArray)games;
- (NSArray)hiddenControllers;
- (NSArray)inactiveProfiles;
- (NSArray)mouseProfiles;
- (NSArray)profiles;
- (NSArray)sortedProfiles;
- (NSArray)unfusedFusableControllers;
- (NSDictionary)profileUsageStats;
- (NSDictionary)tombstones;
- (_TtC25GameControlleriOSSettings19GCSPreferencesStore)init;
- (double)thumbstickScrollingSpeed;
- (id)controllerConnectionFor:(id)a3;
- (id)controllerFor:(id)a3;
- (id)copilotFusedControllerWithController:(id)a3;
- (id)copilotFusedControllerWithFusedController:(id)a3;
- (id)copilotFusedControllerWithPilotOrCopilotController:(id)a3;
- (id)gameWithBundleIdentifier:(id)a3;
- (id)gameWithBundleIdentifier:(id)a3 controller:(id)a4;
- (id)mouseProfileWithBundleIdentifier:(id)a3;
- (void)addController:(id)a3 saveToDisk:(BOOL)a4;
- (void)addCopilotFusedController:(id)a3 saveToDisk:(BOOL)a4;
- (void)addGame:(id)a3 saveToDisk:(BOOL)a4;
- (void)addMouseProfile:(id)a3 saveToDisk:(BOOL)a4;
- (void)addProfile:(id)a3 saveToDisk:(BOOL)a4;
- (void)calculateProfileUsageStats;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeController:(id)a3 saveToDisk:(BOOL)a4;
- (void)removeControllers:(id)a3 saveToDisk:(BOOL)a4;
- (void)removeGame:(id)a3 saveToDisk:(BOOL)a4;
- (void)removeMouseProfile:(id)a3 saveToDisk:(BOOL)a4;
- (void)removeProfile:(id)a3 saveToDisk:(BOOL)a4;
- (void)setAllControllers:(id)a3;
- (void)setConnectedControllerIdentifiers:(id)a3;
- (void)setCopilotFusedControllers:(id)a3;
- (void)setGames:(id)a3;
- (void)setLongPressMenuOpensLaunchPad:(BOOL)a3;
- (void)setMouseProfiles:(id)a3;
- (void)setNaturalThumbstickScrollDirection:(BOOL)a3;
- (void)setProfileUsageStats:(id)a3;
- (void)setProfiles:(id)a3;
- (void)setThumbstickScrollingSpeed:(double)a3;
- (void)setTombstones:(id)a3;
- (void)updateControllerFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5;
- (void)updateControllers;
- (void)updateGameFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5;
- (void)updateMouseProfileFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5;
- (void)updateProfileFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5;
@end

@implementation GCSPreferencesStore

- (NSArray)connectedControllerIdentifiers
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_E6170();

  swift_release();
  swift_release();
  v4.super.isa = sub_E7200().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (void)setConnectedControllerIdentifiers:(id)a3
{
  sub_E7210();
  swift_getKeyPath();
  swift_getKeyPath();
  NSArray v4 = self;
  sub_E6180();
}

- (NSArray)allControllers
{
  return (NSArray *)sub_9B27C(self, (uint64_t)a2, (uint64_t)&unk_EF588, (uint64_t)&unk_EF5B0, (unint64_t *)&qword_124E30);
}

- (void)setAllControllers:(id)a3
{
}

- (NSDictionary)tombstones
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_E6170();

  swift_release();
  swift_release();
  sub_10C7C(&qword_124F88);
  v4.super.isa = sub_E7040().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v4.super.isa;
}

- (void)setTombstones:(id)a3
{
  sub_10C7C(&qword_124F88);
  sub_E7050();
  swift_getKeyPath();
  swift_getKeyPath();
  NSDictionary v4 = self;
  sub_E6180();
}

- (NSArray)profiles
{
  return (NSArray *)sub_9B27C(self, (uint64_t)a2, (uint64_t)&unk_EF638, (uint64_t)&unk_EF660, (unint64_t *)&qword_124E50);
}

- (void)setProfiles:(id)a3
{
}

- (NSArray)mouseProfiles
{
  return (NSArray *)sub_9B27C(self, (uint64_t)a2, (uint64_t)&unk_EF690, (uint64_t)&unk_EF6B8, &qword_124E90);
}

- (void)setMouseProfiles:(id)a3
{
}

- (NSArray)games
{
  return (NSArray *)sub_9B27C(self, (uint64_t)a2, (uint64_t)&unk_EF6E0, (uint64_t)&unk_EF708, (unint64_t *)&qword_122828);
}

- (void)setGames:(id)a3
{
}

- (NSArray)copilotFusedControllers
{
  return (NSArray *)sub_9B27C(self, (uint64_t)a2, (uint64_t)&unk_EF748, (uint64_t)&unk_EF770, (unint64_t *)&unk_124E40);
}

- (void)setCopilotFusedControllers:(id)a3
{
}

- (NSDictionary)profileUsageStats
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_E6170();

  swift_release();
  swift_release();
  sub_E6050();
  type metadata accessor for GCSProfileUsageStats();
  sub_B1FDC(&qword_123E58, (void (*)(uint64_t))&type metadata accessor for UUID);
  v4.super.isa = sub_E7040().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v4.super.isa;
}

- (void)setProfileUsageStats:(id)a3
{
  sub_E6050();
  type metadata accessor for GCSProfileUsageStats();
  sub_B1FDC(&qword_123E58, (void (*)(uint64_t))&type metadata accessor for UUID);
  sub_E7050();
  swift_getKeyPath();
  swift_getKeyPath();
  NSDictionary v4 = self;
  sub_E6180();
}

- (BOOL)longPressMenuOpensLaunchPad
{
  return sub_9C6BC(self);
}

- (void)setLongPressMenuOpensLaunchPad:(BOOL)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  NSDictionary v4 = self;
  sub_E6180();
  id v5 = objc_retain(*(id *)((char *)&v4->super.isa
                         + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults));
  objc_msgSend(v5, "setBool:forKey:", -[GCSPreferencesStore longPressMenuOpensLaunchPad](v4, "longPressMenuOpensLaunchPad"), @"bluetoothPrefsMenuLongPressAction");
}

- (BOOL)naturalThumbstickScrollDirection
{
  return sub_9C6BC(self);
}

- (void)setNaturalThumbstickScrollDirection:(BOOL)a3
{
  v3 = self;
  sub_9C818();
}

- (double)thumbstickScrollingSpeed
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_E6170();

  swift_release();
  swift_release();
  return v5;
}

- (void)setThumbstickScrollingSpeed:(double)a3
{
  v3 = self;
  sub_9CC24();
}

- (id)controllerFor:(id)a3
{
  return sub_A1068(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_allControllers, (unint64_t *)&qword_124E30, (uint64_t)&classRef_GCSController, (SEL *)&selRef_persistentIdentifier);
}

- (NSArray)controllers
{
  v2 = self;
  v3 = [(GCSPreferencesStore *)v2 hiddenControllers];
  sub_B3A64(0, (unint64_t *)&qword_124E30);
  unint64_t v4 = sub_E7210();

  double v5 = [(GCSPreferencesStore *)v2 allControllers];
  unint64_t v6 = sub_E7210();

  sub_AF864(v6, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7.super.isa = sub_E7200().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v7.super.isa;
}

+ (id)keyPathsForValuesAffectingControllers
{
  return sub_9EDF8((uint64_t)a1, (uint64_t)a2, 0x72746E6F436C6C61, 0xEE007372656C6C6FLL);
}

- (NSArray)hiddenControllers
{
  return (NSArray *)sub_9E518(self, (uint64_t)a2, (SEL *)&selRef_allControllers, (unint64_t *)&qword_124E30, (uint64_t)&classRef_GCSController, (void (*)(uint64_t, id))sub_AFB20);
}

- (NSArray)fusedControllers
{
  return (NSArray *)sub_9D8EC(self, (uint64_t)a2, (SEL *)&selRef_allControllers, (uint64_t (*)(uint64_t, char *))sub_AFECC);
}

+ (Class)keyPathsForValuesAffectingHiddenControllers
{
  sub_10C7C(&qword_123488);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_EB580;
  strcpy((char *)(inited + 32), "allControllers");
  *(unsigned char *)(inited + 47) = -18;
  *(void *)(inited + 48) = 0xD000000000000017;
  *(void *)(inited + 56) = 0x80000000000EF710;
  sub_B0B80(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v1.super.isa = sub_E72B0().super.isa;
  swift_bridgeObjectRelease();

  return v1.super.isa;
}

- (NSArray)unfusedFusableControllers
{
  return (NSArray *)sub_9D8EC(self, (uint64_t)a2, (SEL *)&selRef_fusableControllers, (uint64_t (*)(uint64_t, char *))sub_B00F4);
}

+ (id)keyPathsForValuesAffectingUnfusedFusableControllers
{
  sub_10C7C(&qword_123488);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_ECEF0;
  strcpy((char *)(inited + 32), "allControllers");
  *(unsigned char *)(inited + 47) = -18;
  *(void *)(inited + 48) = 0xD000000000000017;
  *(void *)(inited + 56) = 0x80000000000EF710;
  *(void *)(inited + 64) = 0xD00000000000001ALL;
  *(void *)(inited + 72) = 0x80000000000F2D80;
  sub_B0B80(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v3.super.isa = sub_E72B0().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (NSArray)fusableControllers
{
  return (NSArray *)sub_9E7B4(self, (uint64_t)a2, sub_9DDEC, (unint64_t *)&qword_124E30);
}

+ (id)keyPathsForValuesAffectingFusableControllers
{
  return sub_9EDF8((uint64_t)a1, (uint64_t)a2, 0x72746E6F436C6C61, 0xEE007372656C6C6FLL);
}

- (GCSGame)defaultGame
{
  v2 = self;
  NSSet v3 = (void *)sub_9DFFC();

  return (GCSGame *)v3;
}

- (GCSProfile)defaultProfile
{
  v2 = self;
  sub_9E2EC();
  unint64_t v4 = v3;

  return (GCSProfile *)v4;
}

- (NSArray)activeProfiles
{
  return (NSArray *)sub_9E518(self, (uint64_t)a2, (SEL *)&selRef_profiles, (unint64_t *)&qword_124E50, (uint64_t)&classRef_GCSProfile, (void (*)(uint64_t, id))sub_B0304);
}

+ (id)keyPathsForValuesAffectingActiveProfiles
{
  return sub_9EDF8((uint64_t)a1, (uint64_t)a2, 0x73656C69666F7270, 0xE800000000000000);
}

- (NSArray)inactiveProfiles
{
  return (NSArray *)sub_9E518(self, (uint64_t)a2, (SEL *)&selRef_profiles, (unint64_t *)&qword_124E50, (uint64_t)&classRef_GCSProfile, (void (*)(uint64_t, id))sub_B0630);
}

+ (id)keyPathsForValuesAffectingInactiveProfiles
{
  return sub_9EDF8((uint64_t)a1, (uint64_t)a2, 0x73656C69666F7270, 0xE800000000000000);
}

- (NSArray)sortedProfiles
{
  return (NSArray *)sub_9E7B4(self, (uint64_t)a2, (void (*)(void))sub_9E838, (unint64_t *)&qword_124E50);
}

+ (id)keyPathsForValuesAffectingSortedProfiles
{
  return sub_9EDF8((uint64_t)a1, (uint64_t)a2, 0x73656C69666F7270, 0xE800000000000000);
}

- (BOOL)controllerIsConnected:(id)a3
{
  id v4 = a3;
  double v5 = self;
  LOBYTE(self) = sub_9EEB8(v4);

  return self & 1;
}

- (BOOL)fusedControllerIsConnectedWithPilotOrCopilotController:(id)a3
{
  id v4 = a3;
  double v5 = self;
  LOBYTE(self) = sub_9F094();

  return self & 1;
}

- (BOOL)controllerIsFusedController:(id)a3
{
  id v4 = a3;
  double v5 = self;
  unint64_t v6 = [(GCSPreferencesStore *)v5 fusedControllers];
  sub_B3A64(0, (unint64_t *)&qword_124E30);
  unint64_t v7 = sub_E7210();

  LOBYTE(v6) = sub_9D3D0((uint64_t)v4, v7);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (id)copilotFusedControllerWithController:(id)a3
{
  id v4 = a3;
  double v5 = self;
  unint64_t v6 = sub_9F35C(v4);

  return v6;
}

- (id)copilotFusedControllerWithPilotOrCopilotController:(id)a3
{
  id v4 = a3;
  double v5 = self;
  unint64_t v6 = sub_9F6D8(v4);

  return v6;
}

- (id)copilotFusedControllerWithFusedController:(id)a3
{
  id v4 = a3;
  double v5 = self;
  unint64_t v6 = sub_9F9BC(v4);

  return v6;
}

- (id)controllerConnectionFor:(id)a3
{
  id v4 = a3;
  double v5 = self;
  unint64_t v6 = (void *)sub_B1CC0(v4);

  return v6;
}

- (void)calculateProfileUsageStats
{
  v2 = self;
  sub_9FC6C();
}

- (id)gameWithBundleIdentifier:(id)a3
{
  return sub_A1068(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_games, (unint64_t *)&qword_122828, (uint64_t)&classRef_GCSGame, (SEL *)&selRef_bundleIdentifier);
}

- (id)gameWithBundleIdentifier:(id)a3 controller:(id)a4
{
  uint64_t v6 = sub_E7110();
  uint64_t v8 = v7;
  id v9 = a4;
  v10 = self;
  v11 = [(GCSPreferencesStore *)v10 games];
  sub_B3A64(0, (unint64_t *)&qword_122828);
  unint64_t v12 = sub_E7210();

  swift_bridgeObjectRetain();
  v13 = sub_AF6CC(v12, v6, v8, (SEL *)&selRef_bundleIdentifier);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v13)
  {
    unsigned __int8 v14 = [v13 profileExistsFor:v9 with:v10];

    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {

      v13 = 0;
    }
  }
  else
  {

    swift_bridgeObjectRelease();
  }

  return v13;
}

- (void)updateGameFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_A1384(v8, v9, v5);
}

- (void)addGame:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_A1440(v6, a4);
}

- (void)removeGame:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_A14E4(v6, a4);
}

- (void)updateProfileFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_A1CA0(v8, v9, v5);
}

- (void)addCopilotFusedController:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_A1D5C(v6, a4);
}

- (void)addProfile:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_A22C0(v6, a4);
}

- (void)removeProfile:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_A2360(v6, a4);
}

- (id)mouseProfileWithBundleIdentifier:(id)a3
{
  return sub_A1068(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_mouseProfiles, &qword_124E90, (uint64_t)&classRef_GCSMouseProfile, (SEL *)&selRef_bundleIdentifier);
}

- (void)addMouseProfile:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_A2EB0(v6, a4);
}

- (void)removeMouseProfile:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_A2F50(v6, a4);
}

- (void)updateMouseProfileFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_A333C(v8, v9, v5);
}

- (void)addController:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_A33F8(v6, a4);
}

- (void)updateControllerFrom:(id)a3 to:(id)a4 saveToDisk:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_A3DB4(v8, v9, v5);
}

- (void)removeController:(id)a3 saveToDisk:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_A4168(v6, a4);
}

- (void)removeControllers:(id)a3 saveToDisk:(BOOL)a4
{
  sub_B3A64(0, (unint64_t *)&qword_124E30);
  uint64_t v6 = sub_E7210();
  uint64_t v7 = self;
  sub_A4408(v6, a4);

  swift_bridgeObjectRelease();
}

- (_TtC25GameControlleriOSSettings19GCSPreferencesStore)init
{
  return (_TtC25GameControlleriOSSettings19GCSPreferencesStore *)sub_A58C0();
}

- (void)dealloc
{
  v2 = self;
  sub_A666C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_cloudSettings));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore_userDefaults));
  NSSet v3 = (char *)self + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__connectedControllerIdentifiers;
  uint64_t v4 = sub_10C7C(&qword_124D48);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  BOOL v5 = (char *)self + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__allControllers;
  uint64_t v6 = sub_10C7C(&qword_124D60);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__tombstones;
  uint64_t v8 = sub_10C7C(&qword_124D78);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  id v9 = (char *)self + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__profiles;
  uint64_t v10 = sub_10C7C(&qword_124D98);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__mouseProfiles;
  uint64_t v12 = sub_10C7C(&qword_124DB0);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__games;
  uint64_t v14 = sub_10C7C(&qword_124DC8);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__copilotFusedControllers;
  uint64_t v16 = sub_10C7C(&qword_124DE0);
  (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  v17 = (char *)self + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__profileUsageStats;
  uint64_t v18 = sub_10C7C(&qword_124DF8);
  (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  v19 = (char *)self + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__longPressMenuOpensLaunchPad;
  uint64_t v20 = sub_10C7C((uint64_t *)&unk_124E10);
  v21 = *(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8);
  v21(v19, v20);
  v21((char *)self + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__naturalThumbstickScrollDirection, v20);
  v22 = (char *)self + OBJC_IVAR____TtC25GameControlleriOSSettings19GCSPreferencesStore__thumbstickScrollingSpeed;
  uint64_t v23 = sub_10C7C(&qword_124E20);
  v24 = *(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8);

  v24(v22, v23);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_E7110();
    uint64_t v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  uint64_t v14 = self;
  sub_E7440();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_B1FDC(&qword_124EB0, type metadata accessor for NSKeyValueChangeKey);
  v15 = (objc_class *)sub_E7050();

LABEL_8:
  sub_A6AF0(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_B3AA0((uint64_t)v18, &qword_125300);
}

- (void)updateControllers
{
  v2 = self;
  sub_A7344();
}

@end