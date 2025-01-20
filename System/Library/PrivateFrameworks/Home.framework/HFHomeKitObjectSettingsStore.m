@interface HFHomeKitObjectSettingsStore
+ (id)setTileSize:(id)a3 forObject:(id)a4;
+ (id)setValue:(id)a3 forSetting:(int64_t)a4 onObject:(id)a5;
+ (id)setValue:(id)a3 forSetting:(int64_t)a4 onObject:(id)a5 inLocation:(int64_t)a6;
+ (id)stringValueForSetting:(int64_t)a3 onObject:(id)a4;
+ (id)tileSizeForObject:(id)a3;
+ (id)valueForSetting:(int64_t)a3 onObject:(id)a4;
+ (id)valueForSetting:(int64_t)a3 onObject:(id)a4 inLocation:(int64_t)a5;
- (HFHomeKitObjectSettingsStore)init;
@end

@implementation HFHomeKitObjectSettingsStore

- (HFHomeKitObjectSettingsStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HomeKitObjectSettingsStore();
  return [(HFHomeKitObjectSettingsStore *)&v3 init];
}

+ (id)tileSizeForObject:(id)a3
{
  swift_unknownObjectRetain();
  objc_super v3 = (void *)_s4Home0A22KitObjectSettingsStoreC8tileSize3forSo015HFTileResizableG0aSgSo06HFHomebC0_p_tFZ_0();
  swift_unknownObjectRelease();
  return v3;
}

+ (id)setTileSize:(id)a3 forObject:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = (void *)_s4Home0A22KitObjectSettingsStoreC3set8tileSize3forSo8NAFutureCySo6NSNullCGSo015HFTileResizableH0aSg_So06HFHomebC0_ptFZ_0((uint64_t)a3);

  swift_unknownObjectRelease();
  return v6;
}

+ (id)valueForSetting:(int64_t)a3 onObject:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = (void *)sub_20BA9A124(a3);
  swift_unknownObjectRelease();
  return v5;
}

+ (id)valueForSetting:(int64_t)a3 onObject:(id)a4 inLocation:(int64_t)a5
{
  swift_unknownObjectRetain();
  v6 = (void *)sub_20BA9A124(a3);
  swift_unknownObjectRelease();
  return v6;
}

+ (id)stringValueForSetting:(int64_t)a3 onObject:(id)a4
{
  swift_unknownObjectRetain();
  _s4Home0A22KitObjectSettingsStoreC21stringValueForSetting_2onSSSgAC0I3KeyO_So06HFHomebC0_ptFZ_0(a3);
  uint64_t v6 = v5;
  swift_unknownObjectRelease();
  if (v6)
  {
    v7 = (void *)sub_20BCE75E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)setValue:(id)a3 forSetting:(int64_t)a4 onObject:(id)a5
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = (void *)_s4Home0A22KitObjectSettingsStoreC8setValue__2onSo8NAFutureCySo6NSNullCGyXlSg_AC10SettingKeyOSo06HFHomebC0_ptFZ_0((uint64_t)a3, a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v7;
}

+ (id)setValue:(id)a3 forSetting:(int64_t)a4 onObject:(id)a5 inLocation:(int64_t)a6
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = (void *)_s4Home0A22KitObjectSettingsStoreC8setValue__2onSo8NAFutureCySo6NSNullCGyXlSg_AC10SettingKeyOSo06HFHomebC0_ptFZ_0((uint64_t)a3, a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v8;
}

@end