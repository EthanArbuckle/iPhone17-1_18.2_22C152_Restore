@interface UIKitFocusableFillerItem
- (BOOL)canBecomeFocused;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)frame;
- (NSArray)preferredFocusEnvironments;
- (UIFocusEnvironment)parentFocusEnvironment;
- (UIFocusItemContainer)focusItemContainer;
- (_TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem)init;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
@end

@implementation UIKitFocusableFillerItem

- (CGRect)frame
{
  v2 = (double *)((char *)self
                + OBJC_IVAR____TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem_focusableFrame);
  if (self->axis[OBJC_IVAR____TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem_focusableFrame]) {
    v2 = (double *)((char *)self
  }
                  + OBJC_IVAR____TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem_logicalFrame);
  double v3 = v2[2];
  double v4 = v2[3];
  double v5 = *v2;
  double v6 = v2[1];
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (NSArray)preferredFocusEnvironments
{
  type metadata accessor for _UISceneBSActionHandler(0, (unint64_t *)&lazy cache variable for type metadata for UIFocusEnvironment);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  NSArray v2 = (void *)MEMORY[0x18C119DF0]((char *)self+ OBJC_IVAR____TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem_host, a2);

  return (UIFocusEnvironment *)v2;
}

- (UIFocusItemContainer)focusItemContainer
{
  return (UIFocusItemContainer *)0;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized UIKitFocusableFillerItem.didUpdateFocus(in:with:)();
}

- (_TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem)init
{
  CGRect result = (_TtC7SwiftUIP33_60C465D0E37117769FC505C04DE5239A24UIKitFocusableFillerItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end