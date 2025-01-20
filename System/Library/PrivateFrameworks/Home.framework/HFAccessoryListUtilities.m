@interface HFAccessoryListUtilities
+ (NSArray)sortedAccessoryTypeGroups;
+ (id)accessoryRepresentableItemForAccessoryRepresentable:(id)a3 valueSource:(id)a4;
+ (id)accessoryRepresentableObjectsFromAccessoryLikeObjects:(id)a3 objectLevel:(unint64_t)a4 accessoryTypeGroups:(id)a5;
+ (id)createAccessoryCategorySectionsWithItems:(id)a3 inHome:(id)a4 sectionIdentifierBlock:(id)a5;
+ (id)createRoomSectionsWithItems:(id)a3 inHome:(id)a4 sectionIdentifierBlock:(id)a5;
- (HFAccessoryListUtilities)init;
@end

@implementation HFAccessoryListUtilities

- (HFAccessoryListUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)HFAccessoryListUtilities;
  return [(HFAccessoryListUtilities *)&v3 init];
}

+ (id)accessoryRepresentableObjectsFromAccessoryLikeObjects:(id)a3 objectLevel:(unint64_t)a4 accessoryTypeGroups:(id)a5
{
  sub_20BA208F4(0, &qword_26AB2E438);
  sub_20BA5CA60();
  v7 = (void *)sub_20BCE7940();
  if (a5)
  {
    sub_20BA208F4(0, &qword_26AB2E430);
    a5 = (id)sub_20BCE7710();
  }
  _sSo24HFAccessoryListUtilitiesC4HomeE29accessoryRepresentableObjects4from11objectLevel0E10TypeGroupsSaySo0aF0_pGShySo0A10LikeObjectCG_So0am12ItemProvidernJ0VSaySo0aK5GroupCGSgtFZ_0(v7, a4, (unint64_t)a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB2E450);
  v8 = (void *)sub_20BCE76F0();
  swift_bridgeObjectRelease();
  return v8;
}

+ (id)accessoryRepresentableItemForAccessoryRepresentable:(id)a3 valueSource:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  if (HFAccessoryRepresentable.itemClass.getter()
    && objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_itemWithAccessoryRepresentableObject_valueSource_, a3, a4))
  {
    self;
    v6 = (void *)swift_dynamicCastObjCClass();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    if (!v6) {
      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    v6 = 0;
  }
  return v6;
}

+ (id)createRoomSectionsWithItems:(id)a3 inHome:(id)a4 sectionIdentifierBlock:(id)a5
{
  v6 = _Block_copy(a5);
  sub_20BA208F4(0, (unint64_t *)&qword_26AB2E460);
  unint64_t v7 = sub_20BCE7710();
  ObjCClassMetadata = (void *)swift_getObjCClassMetadata();
  _Block_copy(v6);
  id v9 = a4;
  sub_20BA5BDE4(v7, v9, ObjCClassMetadata, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  sub_20BA208F4(0, (unint64_t *)&unk_26AB2E3F0);
  v10 = (void *)sub_20BCE76F0();
  swift_bridgeObjectRelease();
  return v10;
}

+ (id)createAccessoryCategorySectionsWithItems:(id)a3 inHome:(id)a4 sectionIdentifierBlock:(id)a5
{
  v6 = _Block_copy(a5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676AEA18);
  unint64_t v7 = sub_20BCE7710();
  int ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v6);
  id v9 = a4;
  sub_20BA5C0E0(v7, ObjCClassMetadata, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
  sub_20BA208F4(0, (unint64_t *)&unk_26AB2E3F0);
  v10 = (void *)sub_20BCE76F0();
  swift_bridgeObjectRelease();
  return v10;
}

+ (NSArray)sortedAccessoryTypeGroups
{
  _sSo24HFAccessoryListUtilitiesC4HomeE25sortedAccessoryTypeGroupsSaySo0aG5GroupCGvgZ_0();
  sub_20BA208F4(0, &qword_26AB2E430);
  v2 = (void *)sub_20BCE76F0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

@end