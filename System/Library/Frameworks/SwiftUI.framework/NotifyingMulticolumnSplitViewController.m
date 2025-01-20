@interface NotifyingMulticolumnSplitViewController
+ (BOOL)_isFromSwiftUI;
- (UIViewController)childViewControllerForStatusBarHidden;
- (_TtC7SwiftUI39NotifyingMulticolumnSplitViewController)initWithCoder:(id)a3;
- (_TtC7SwiftUI39NotifyingMulticolumnSplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7SwiftUI39NotifyingMulticolumnSplitViewController)initWithStyle:(int64_t)a3;
- (id)makeDetailNavigationControllerWithRoot:(id)a3;
- (void)showDetailViewController:(id)a3 sender:(id)a4;
@end

@implementation NotifyingMulticolumnSplitViewController

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (void)showDetailViewController:(id)a3 sender:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a3;
    v9 = self;
  }
  NotifyingMulticolumnSplitViewController.showDetailViewController(_:sender:)(a3, (uint64_t)v10);

  outlined destroy of Any?((uint64_t)v10);
}

- (id)makeDetailNavigationControllerWithRoot:(id)a3
{
  type metadata accessor for StyleContextSplitViewNavigationController<NoStyleContext>(0, &lazy cache variable for type metadata for StyleContextSplitViewNavigationController<NoStyleContext>, MEMORY[0x1E4F3F9B0], MEMORY[0x1E4F3F9A8], (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for StyleContextSplitViewNavigationController);
  id v5 = objc_msgSend(objc_allocWithZone(v4), sel_initWithRootViewController_, a3);

  return v5;
}

- (UIViewController)childViewControllerForStatusBarHidden
{
  v2 = self;
  NotifyingMulticolumnSplitViewController.childForStatusBarHidden.getter();
  Class v4 = v3;

  return (UIViewController *)v4;
}

- (_TtC7SwiftUI39NotifyingMulticolumnSplitViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(NotifyingMulticolumnSplitViewController *)&v5 initWithCoder:a3];
}

- (_TtC7SwiftUI39NotifyingMulticolumnSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;
    id v11 = a4;
    a3 = (id)MEMORY[0x18C115780](v8, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v12 = a4;
  }
  v15.receiver = self;
  v15.super_class = ObjectType;
  v13 = [(NotifyingMulticolumnSplitViewController *)&v15 initWithNibName:a3 bundle:a4];

  return v13;
}

- (_TtC7SwiftUI39NotifyingMulticolumnSplitViewController)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(NotifyingMulticolumnSplitViewController *)&v5 initWithStyle:a3];
}

@end