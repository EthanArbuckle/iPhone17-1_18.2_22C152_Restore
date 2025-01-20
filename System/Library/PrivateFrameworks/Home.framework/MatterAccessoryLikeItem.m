@interface MatterAccessoryLikeItem
+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4;
- (BOOL)actionsMayRequireDeviceUnlock;
- (BOOL)containsActions;
- (BOOL)hf_effectiveIsFavorite;
- (BOOL)hf_effectiveShowInHomeDashboard;
- (BOOL)hf_hasSetFavorite;
- (BOOL)hf_hasSetShowInHomeDashboard;
- (BOOL)hf_hasSetVisibleInHomeStatus;
- (BOOL)hf_isFavorite;
- (BOOL)hf_isForcedVisibleInHomeStatus;
- (BOOL)hf_isVisibleInHomeStatus;
- (BOOL)hf_shouldShowInFavorites;
- (BOOL)hf_showInHomeDashboard;
- (BOOL)hf_supportsHomeStatus;
- (HFAccessoryRepresentable)accessoryRepresentableObject;
- (HFCharacteristicValueSource)valueSource;
- (HFHomeKitObject)homeKitObject;
- (HMHome)home;
- (NSSet)services;
- (_TtC4Home23MatterAccessoryLikeItem)init;
- (id)accessories;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)currentStateActionBuildersForHome:(id)a3;
- (id)hf_updateIsFavorite:(BOOL)a3;
- (id)hf_updateIsVisibleInHomeStatus:(BOOL)a3;
- (id)hf_updateShowInHomeDashboard:(BOOL)a3;
- (id)namingComponentForHomeKitObject;
- (id)serviceLikeBuilderInHome:(id)a3;
@end

@implementation MatterAccessoryLikeItem

- (HFHomeKitObject)homeKitObject
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_hf_homeKitObject);

  return (HFHomeKitObject *)v4;
}

- (HFAccessoryRepresentable)accessoryRepresentableObject
{
  return (HFAccessoryRepresentable *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                             + OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable));
}

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v5 = (void *)_s4Home23MatterAccessoryLikeItemC04withC19RepresentableObject_11valueSourceACXDSgSo011HFAccessoryG0_p_So021HFCharacteristicValueJ0_ptFZ_0((uint64_t)a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v5;
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_20BA43EE0(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  id v4 = (void *)sub_20BCE7FF0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (_TtC4Home23MatterAccessoryLikeItem)init
{
  result = (_TtC4Home23MatterAccessoryLikeItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_tilePath;
  uint64_t v4 = sub_20BCE69E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable));
  swift_release();
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_actionSetBuilder);
}

- (BOOL)hf_showInHomeDashboard
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_showInHomeDashboard);
}

- (BOOL)hf_hasSetShowInHomeDashboard
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_hasSetShowInHomeDashboard);
}

- (BOOL)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_effectiveShowInHomeDashboard);
}

- (id)hf_updateShowInHomeDashboard:(BOOL)a3
{
  return sub_20BA44654((uint64_t)self, (uint64_t)a2, a3, (SEL *)&selRef_hf_updateShowInHomeDashboard_);
}

- (BOOL)hf_isFavorite
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_isFavorite);
}

- (BOOL)hf_hasSetFavorite
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_hasSetFavorite);
}

- (BOOL)hf_shouldShowInFavorites
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_shouldShowInFavorites);
}

- (BOOL)hf_effectiveIsFavorite
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_effectiveIsFavorite);
}

- (id)hf_updateIsFavorite:(BOOL)a3
{
  return sub_20BA44654((uint64_t)self, (uint64_t)a2, a3, (SEL *)&selRef_hf_updateIsFavorite_);
}

- (BOOL)hf_supportsHomeStatus
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_supportsHomeStatus);
}

- (BOOL)hf_isVisibleInHomeStatus
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_isVisibleInHomeStatus);
}

- (BOOL)hf_hasSetVisibleInHomeStatus
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_hasSetVisibleInHomeStatus);
}

- (BOOL)hf_isForcedVisibleInHomeStatus
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable), sel_hf_isForcedVisibleInHomeStatus);
}

- (id)hf_updateIsVisibleInHomeStatus:(BOOL)a3
{
  return sub_20BA44654((uint64_t)self, (uint64_t)a2, a3, (SEL *)&selRef_hf_updateIsVisibleInHomeStatus_);
}

- (HFCharacteristicValueSource)valueSource
{
  return (HFCharacteristicValueSource *)0;
}

- (id)copyWithValueSource:(id)a3
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  [(MatterAccessoryLikeItem *)v4 copy];
  sub_20BCE7C00();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  swift_unknownObjectRelease();

  return v6;
}

- (HMHome)home
{
  id v2 = objc_msgSend(*(id *)(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable)+ OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_home);
  return (HMHome *)v2;
}

- (NSSet)services
{
  id v2 = self;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_20BCE7F20()) {
    sub_20BA36DA4(MEMORY[0x263F8EE78]);
  }

  sub_20BA208F4(0, (unint64_t *)&qword_2676ADEB0);
  sub_20BA378FC((unint64_t *)&qword_2676AE680, (unint64_t *)&qword_2676ADEB0);
  v3 = (void *)sub_20BCE7920();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (id)accessories
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable);
  v3 = self;
  id v4 = v2;
  id v5 = objc_msgSend(v4, sel_hf_associatedAccessories);
  sub_20BA208F4(0, (unint64_t *)&unk_2676AE3F0);
  sub_20BA378FC((unint64_t *)&unk_2676AEFF0, (unint64_t *)&unk_2676AE3F0);
  sub_20BCE7940();

  v6 = (void *)sub_20BCE7920();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)namingComponentForHomeKitObject
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)HFNamingComponents), sel_initWithHomeKitObject_, 0);
  return v2;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Home23MatterAccessoryLikeItem_matterAccessoryRepresentable);
  id v5 = a3;
  v6 = self;
  id v7 = objc_msgSend(v4, sel_hf_homeKitObject);
  v8 = [(MatterAccessoryLikeItem *)v6 home];
  id v9 = objc_msgSend(objc_allocWithZone((Class)HFAccessoryBuilder), sel_initWithExistingObject_inHome_, v7, v8);

  swift_unknownObjectRelease();
  return v9;
}

- (BOOL)containsActions
{
  return _s4Home23MatterAccessoryLikeItemC15containsActionsSbyF_0() & 1;
}

- (BOOL)actionsMayRequireDeviceUnlock
{
  return 0;
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v6 = (void *)MatterAccessoryLikeItem.currentStateActionBuilders(for:)(v4);

  return v6;
}

@end