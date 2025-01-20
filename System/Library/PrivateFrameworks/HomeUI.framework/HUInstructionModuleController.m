@interface HUInstructionModuleController
- (Class)collectionCellClassForItem:(id)a3;
- (HUInstructionModuleController)initWithModule:(id)a3;
- (void)configureCell:(id)a3 forItem:(id)a4;
@end

@implementation HUInstructionModuleController

- (Class)collectionCellClassForItem:(id)a3
{
  sub_1BE37E9E8(0, (unint64_t *)&unk_1EA115E80);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = a3;
  v7 = self;
  if (objc_msgSend(v6, sel_isKindOfClass_, ObjCClassFromMetadata))
  {

    sub_1BE37E9E8(0, (unint64_t *)&unk_1EA1157E0);
  }
  else
  {
    v9.receiver = v7;
    v9.super_class = (Class)type metadata accessor for InstructionModuleController();
    [(HUItemModuleController *)&v9 collectionCellClassForItem:v6];

    swift_getObjCClassMetadata();
  }
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1BE494A48(v6, v7);
}

- (HUInstructionModuleController)initWithModule:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InstructionModuleController();
  return [(HUItemModuleController *)&v5 initWithModule:a3];
}

@end