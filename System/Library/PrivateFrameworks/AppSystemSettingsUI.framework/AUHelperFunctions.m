@interface AUHelperFunctions
+ (id)associatedApplicationBundleIdentifierForTCCService:(const __CFString *)a3;
+ (id)associatedTypedIconIdentifierForTCCService:(const __CFString *)a3;
+ (id)classicIconCacheKeyForTCCService:(const __CFString *)a3;
+ (id)localizedDisplayNameForTCCService:(const __CFString *)a3;
- (_TtC19AppSystemSettingsUI17AUHelperFunctions)init;
@end

@implementation AUHelperFunctions

- (_TtC19AppSystemSettingsUI17AUHelperFunctions)init
{
  result = (_TtC19AppSystemSettingsUI17AUHelperFunctions *)sub_247E82460();
  __break(1u);
  return result;
}

+ (id)associatedApplicationBundleIdentifierForTCCService:(const __CFString *)a3
{
  return sub_247E80828((uint64_t)a1, (uint64_t)a2, (void *)a3, sub_247E81804);
}

+ (id)associatedTypedIconIdentifierForTCCService:(const __CFString *)a3
{
  return sub_247E80828((uint64_t)a1, (uint64_t)a2, (void *)a3, sub_247E81A08);
}

+ (id)localizedDisplayNameForTCCService:(const __CFString *)a3
{
  swift_getObjCClassMetadata();
  v4 = (id)a3;
  sub_247E808A4();
  uint64_t v6 = v5;

  if (v6)
  {
    v7 = (void *)sub_247E82380();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)classicIconCacheKeyForTCCService:(const __CFString *)a3
{
  return 0;
}

@end