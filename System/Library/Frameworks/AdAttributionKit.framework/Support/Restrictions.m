@interface Restrictions
- (_TtC20AttributionKitDaemon12Restrictions)init;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation Restrictions

- (_TtC20AttributionKitDaemon12Restrictions)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_defaultActor_initialize();
  self->cachedValues[0] = 2;
  v9.receiver = self;
  v9.super_class = ObjectType;
  v4 = [(Restrictions *)&v9 init];
  v5 = self;
  v6 = v4;
  result = (_TtC20AttributionKitDaemon12Restrictions *)[v5 sharedConnection];
  if (result)
  {
    v8 = result;
    [(Restrictions *)result registerObserver:v6];

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v4 = a3;
  swift_retain();
  sub_1000C46F8();

  swift_release();
}

@end