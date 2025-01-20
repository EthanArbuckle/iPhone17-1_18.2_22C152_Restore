@interface MUTransitLineItemActionManager
- (MUTransitLineItemActionManager)init;
- (MUTransitLineItemActionManager)initWithDelegate:(id)a3 analyticsDelegate:(id)a4;
- (id)createFooterActions;
- (id)createRowActionsWithStyle:(unint64_t)a3;
- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation MUTransitLineItemActionManager

- (MUTransitLineItemActionManager)initWithDelegate:(id)a3 analyticsDelegate:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(MUTransitLineItemActionManager *)&v7 init];
}

- (MUTransitLineItemActionManager)init
{
  result = (MUTransitLineItemActionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1931F0EAC((uint64_t)self + OBJC_IVAR___MUTransitLineItemActionManager_delegate);
  v3 = (char *)self + OBJC_IVAR___MUTransitLineItemActionManager_analyticsDelegate;
  sub_1931F0EAC((uint64_t)v3);
}

- (id)createRowActionsWithStyle:(unint64_t)a3
{
  if (_s6MapsUI28TransitLineItemActionManagerC19createFooterActionsSaySo011MKPlaceCardfE0CGSgyF_0())
  {
    sub_193274EA4();
    v3 = (void *)sub_193341450();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
  v8 = (void (*)(uint64_t))_Block_copy(a5);
  if (a4) {
    a4 = (id)sub_193341310();
  }
  if (v8)
  {
    *(void *)(swift_allocObject() + 16) = v8;
    v8 = (void (*)(uint64_t))sub_193274F1C;
  }
  id v9 = a3;
  v10 = self;
  TransitLineItemActionManager.performAction(_:options:completion:)(a3, (uint64_t)a4, v8);
  sub_1931FEDEC((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (id)createFooterActions
{
  if (_s6MapsUI28TransitLineItemActionManagerC19createFooterActionsSaySo011MKPlaceCardfE0CGSgyF_0())
  {
    sub_193274EA4();
    v2 = (void *)sub_193341450();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end