@interface NSLocale
+ (id)sk_localeWithBagLanguageCode:(id)a3 currencyCode:(id)a4;
@end

@implementation NSLocale

+ (id)sk_localeWithBagLanguageCode:(id)a3 currencyCode:(id)a4
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  Class v9 = sub_10010FDF4(v4, v6, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v9;
}

@end