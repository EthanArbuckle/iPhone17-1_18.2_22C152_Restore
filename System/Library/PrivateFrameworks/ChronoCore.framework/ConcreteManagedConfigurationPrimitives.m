@interface ConcreteManagedConfigurationPrimitives
- (_TtC10ChronoCore38ConcreteManagedConfigurationPrimitives)init;
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation ConcreteManagedConfigurationPrimitives

- (_TtC10ChronoCore38ConcreteManagedConfigurationPrimitives)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->delegate[OBJC_IVAR____TtC10ChronoCore38ConcreteManagedConfigurationPrimitives_delegate] = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v4 = [(ConcreteManagedConfigurationPrimitives *)&v9 init];
  v5 = self;
  v6 = v4;
  result = (_TtC10ChronoCore38ConcreteManagedConfigurationPrimitives *)objc_msgSend(v5, sel_sharedConnection);
  if (result)
  {
    v8 = result;
    [(ConcreteManagedConfigurationPrimitives *)result registerObserver:v6];

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void).cxx_destruct
{
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  if (a4) {
    sub_1DAD277B8();
  }
  id v6 = a3;
  v7 = self;
  sub_1DABB85D8();

  swift_bridgeObjectRelease();
}

@end