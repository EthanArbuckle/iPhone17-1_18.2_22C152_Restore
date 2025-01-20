@interface HFMatterAccessoryRepresentable
- (BOOL)hf_canShowInControlCenter;
- (BOOL)hf_canSpanMultipleRooms;
- (BOOL)hf_effectiveShowInHomeDashboard;
- (BOOL)hf_hasSetFavorite;
- (BOOL)hf_hasSetShowInHomeDashboard;
- (BOOL)hf_hasSetVisibleInHomeStatus;
- (BOOL)hf_isFavorite;
- (BOOL)hf_isForcedVisibleInHomeStatus;
- (BOOL)hf_isIdentifiable;
- (BOOL)hf_isInRoom:(id)a3;
- (BOOL)hf_isMatterOnlyAccessory;
- (BOOL)hf_isVisibleInHomeStatus;
- (BOOL)hf_shouldShowInFavorites;
- (BOOL)hf_showInHomeDashboard;
- (BOOL)hf_supportsHomeStatus;
- (BOOL)isEqual:(id)a3;
- (Class)hf_itemClass;
- (HFAccessoryType)hf_accessoryType;
- (HFHomeContainedObject)hf_homeKitObject;
- (HFMatterAccessoryRepresentable)init;
- (HFMatterAccessoryRepresentable)initWithAccessory:(id)a3;
- (HFServiceNameComponents)hf_serviceNameComponents;
- (HMRoom)hf_safeRoom;
- (NSSet)hf_associatedAccessories;
- (NSSet)hf_containedCharacteristics;
- (NSSet)hf_containedProfiles;
- (NSSet)hf_containedServices;
- (NSString)hf_iconIdentifier;
- (NSString)hf_tileSize;
- (id)hf_moveToRoom:(id)a3;
- (id)hf_setTileSize:(id)a3;
- (id)hf_updateIsFavorite:(BOOL)a3;
- (id)hf_updateIsVisibleInHomeStatus:(BOOL)a3;
- (id)hf_updateShowInHomeDashboard:(BOOL)a3;
- (int64_t)hash;
@end

@implementation HFMatterAccessoryRepresentable

- (HFMatterAccessoryRepresentable)initWithAccessory:(id)a3
{
  return (HFMatterAccessoryRepresentable *)MatterAccessoryRepresentable.init(accessory:)(a3);
}

- (HFMatterAccessoryRepresentable)init
{
  result = (HFMatterAccessoryRepresentable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___HFMatterAccessoryRepresentable_tilePath;
  uint64_t v4 = sub_20BCE69E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_20BA1FD90((uint64_t)self + OBJC_IVAR___HFMatterAccessoryRepresentable_staticMatterDevice, &qword_2676AE320);
  sub_20BA1FD90((uint64_t)self + OBJC_IVAR___HFMatterAccessoryRepresentable__tileInfo, &qword_2676AE330);
  swift_bridgeObjectRelease();
}

- (HFHomeContainedObject)hf_homeKitObject
{
  return (HFHomeContainedObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory));
}

- (Class)hf_itemClass
{
  type metadata accessor for MatterAccessoryLikeItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)hf_canShowInControlCenter
{
  v2 = self;
  char canShowInControl = MatterAccessoryRepresentable.__hf_canShowInControlCenter.getter();

  return canShowInControl & 1;
}

- (HMRoom)hf_safeRoom
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_room);
  return (HMRoom *)v2;
}

- (BOOL)hf_canSpanMultipleRooms
{
  return 0;
}

- (BOOL)hf_isIdentifiable
{
  id v2 = self;
  unsigned __int8 v3 = MatterAccessoryRepresentable.__hf_isIdentifiable.getter();

  return v3 & 1;
}

- (BOOL)hf_isMatterOnlyAccessory
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_isMatterOnlyAccessory);
}

- (NSSet)hf_containedCharacteristics
{
  return (NSSet *)sub_20BA3B908(self, (uint64_t)a2, sub_20BA334CC, (unint64_t *)&qword_26AB2E410, 0x263F0E248, (unint64_t *)&qword_26AB2E420);
}

- (NSSet)hf_containedServices
{
  return (NSSet *)sub_20BA3B908(self, (uint64_t)a2, sub_20BA36DA4, (unint64_t *)&qword_2676ADEB0, 0x263F0E708, (unint64_t *)&qword_2676AE680);
}

- (NSSet)hf_containedProfiles
{
  return (NSSet *)sub_20BA3B908(self, (uint64_t)a2, sub_20BA37124, &qword_2676AE400, 0x263F0E010, &qword_2676AE408);
}

- (NSSet)hf_associatedAccessories
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E4C0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20BD11B70;
  uint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory);
  *(void *)(inited + 32) = v4;
  unint64_t v13 = inited;
  sub_20BCE7730();
  if (!(v13 >> 62))
  {
    uint64_t v5 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v6 = self;
    id v7 = v4;
    if (!v5) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  v8 = self;
  id v9 = v4;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_20BCE7F20();
  swift_bridgeObjectRelease();
  if (v10) {
LABEL_3:
  }
    sub_20BA37140(v13);
LABEL_5:
  swift_bridgeObjectRelease();

  sub_20BA208F4(0, (unint64_t *)&unk_2676AE3F0);
  sub_20BA378FC((unint64_t *)&unk_2676AEFF0, (unint64_t *)&unk_2676AE3F0);
  v11 = (void *)sub_20BCE7920();
  swift_bridgeObjectRelease();
  return (NSSet *)v11;
}

- (BOOL)hf_isInRoom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = MatterAccessoryRepresentable.__hf_is(in:)((HMRoom)v4);

  return self & 1;
}

- (id)hf_moveToRoom:(id)a3
{
  return sub_20BA3CC3C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_hf_moveToRoom_);
}

- (HFAccessoryType)hf_accessoryType
{
  id v2 = self;
  id v3 = MatterAccessoryRepresentable.__hf_accessoryType.getter();

  return (HFAccessoryType *)v3;
}

- (HFServiceNameComponents)hf_serviceNameComponents
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_serviceNameComponents);
  return (HFServiceNameComponents *)v2;
}

- (BOOL)hf_isFavorite
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_isFavorite);
}

- (BOOL)hf_hasSetFavorite
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_hasSetFavorite);
}

- (BOOL)hf_shouldShowInFavorites
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_shouldShowInFavorites);
}

- (id)hf_updateIsFavorite:(BOOL)a3
{
  id v3 = objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_updateIsFavorite_, a3);
  return v3;
}

- (BOOL)hf_supportsHomeStatus
{
  return 1;
}

- (BOOL)hf_isForcedVisibleInHomeStatus
{
  return 0;
}

- (BOOL)hf_isVisibleInHomeStatus
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_isVisibleInHomeStatus);
}

- (BOOL)hf_hasSetVisibleInHomeStatus
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_hasSetVisibleInHomeStatus);
}

- (id)hf_updateIsVisibleInHomeStatus:(BOOL)a3
{
  id v3 = objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_updateIsVisibleInHomeStatus_, a3);
  return v3;
}

- (BOOL)hf_showInHomeDashboard
{
  id v2 = self;
  char v3 = sub_20BCE7A50();

  return v3 & 1;
}

- (BOOL)hf_hasSetShowInHomeDashboard
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_hasSetShowInHomeDashboard);
}

- (BOOL)hf_effectiveShowInHomeDashboard
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_effectiveShowInHomeDashboard);
}

- (id)hf_updateShowInHomeDashboard:(BOOL)a3
{
  id v3 = objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_updateShowInHomeDashboard_, a3);
  return v3;
}

- (NSString)hf_tileSize
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_hf_tileSize);
  return (NSString *)v2;
}

- (id)hf_setTileSize:(id)a3
{
  return sub_20BA3CC3C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_hf_setTileSize_);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_20BCE7C00();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = MatterAccessoryRepresentable.isEqual(_:)((uint64_t)v8);

  sub_20BA1FD90((uint64_t)v8, (uint64_t *)&unk_26AB2E690);
  return v6 & 1;
}

- (int64_t)hash
{
  uint64_t v3 = sub_20BCE65C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20BCE8130();
  id v7 = self;
  sub_20BCE69B0();
  id v8 = objc_msgSend(*(id *)((char *)&v7->super.isa + OBJC_IVAR___HFMatterAccessoryRepresentable_accessory), sel_uniqueIdentifier);
  sub_20BCE6590();

  sub_20BCE65A0();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  long long v18 = v13;
  long long v19 = v14;
  uint64_t v20 = v15;
  long long v16 = *(_OWORD *)&v11[8];
  long long v17 = v12;
  int64_t v9 = sub_20BCE8110();

  return v9;
}

- (NSString)hf_iconIdentifier
{
  id v2 = self;
  MatterAccessoryRepresentable.__hf_iconIdentifier.getter();

  uint64_t v3 = (void *)sub_20BCE75E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end