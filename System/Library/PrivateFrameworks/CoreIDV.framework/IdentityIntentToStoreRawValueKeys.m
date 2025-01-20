@interface IdentityIntentToStoreRawValueKeys
+ (NSString)mayStore;
+ (NSString)willNotStore;
+ (id)mayStoreForDays:(int64_t)a3;
- (_TtC7CoreIDV33IdentityIntentToStoreRawValueKeys)init;
@end

@implementation IdentityIntentToStoreRawValueKeys

+ (NSString)willNotStore
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (NSString)mayStore
{
  v2 = (void *)sub_2148A1B78();
  return (NSString *)v2;
}

+ (id)mayStoreForDays:(int64_t)a3
{
  _s7CoreIDV33IdentityIntentToStoreRawValueKeysC03mayF7ForDaysySSSiFZ_0();
  v3 = (void *)sub_2148A1B78();
  swift_bridgeObjectRelease();
  return v3;
}

- (_TtC7CoreIDV33IdentityIntentToStoreRawValueKeys)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IdentityIntentToStoreRawValueKeys();
  return [(IdentityIntentToStoreRawValueKeys *)&v3 init];
}

@end