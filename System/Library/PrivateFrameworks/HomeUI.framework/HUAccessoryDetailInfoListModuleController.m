@interface HUAccessoryDetailInfoListModuleController
- (Class)cellClassForItem:(id)a3;
- (HUAccessoryDetailInfoListModuleController)initWithModule:(id)a3;
- (id)init:(id)a3;
- (unint64_t)didSelectItem:(id)a3;
- (void)accessoryButtonTappedForItem:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5;
@end

@implementation HUAccessoryDetailInfoListModuleController

- (id)init:(id)a3
{
  v5 = (char *)self + OBJC_IVAR___HUAccessoryDetailInfoListModuleController_delegate;
  v6 = (objc_class *)type metadata accessor for AccessoryDetailInfoListModuleController();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(HUItemModuleController *)&v8 initWithModule:a3];
}

- (Class)cellClassForItem:(id)a3
{
  sub_1BE52424C();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for AccessoryDetailInfoListModuleController();
  id v6 = a3;
  id v7 = a4;
  id v8 = v12.receiver;
  [(HUItemModuleController *)&v12 setupCell:v6 forItem:v7];
  self;
  uint64_t v9 = swift_dynamicCastObjCClass();
  if (v9)
  {
    v10 = (void *)v9;
    id v11 = v6;
    objc_msgSend(v10, sel_setHideIcon_, 1, v12.receiver, v12.super_class);
    objc_msgSend(v10, sel_setAccessoryType_, 4);

    id v7 = v8;
    id v8 = v11;
  }
}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_1BE52439C(v8, v9, a5);
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE524808((uint64_t)v4);

  return 0;
}

- (void)accessoryButtonTappedForItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE524930((uint64_t)v4);
}

- (HUAccessoryDetailInfoListModuleController)initWithModule:(id)a3
{
  id v3 = a3;
  result = (HUAccessoryDetailInfoListModuleController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end