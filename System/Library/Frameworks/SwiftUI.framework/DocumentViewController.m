@interface DocumentViewController
- (UIDocument)document;
- (_TtC7SwiftUI22DocumentViewController)initWithCoder:(id)a3;
- (_TtC7SwiftUI22DocumentViewController)initWithDocument:(id)a3;
- (_TtC7SwiftUI22DocumentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)navigationItemDidUpdate;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)setDocument:(id)a3;
@end

@implementation DocumentViewController

- (_TtC7SwiftUI22DocumentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized DocumentViewController.init(coder:)();
}

- (UIDocument)document
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DocumentViewController();
  v2 = [(UIDocumentViewController *)&v4 document];

  return v2;
}

- (void)setDocument:(id)a3
{
  id v5 = a3;
  v6 = self;
  DocumentViewController.document.setter(a3);
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DocumentViewController();
  v2 = v4.receiver;
  id v3 = [(UIDocumentViewController *)&v4 loadView];
  (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x100))(v3);
}

- (void)navigationItemDidUpdate
{
  v2 = self;
  DocumentViewController.navigationItemDidUpdate()();
}

- (_TtC7SwiftUI22DocumentViewController)initWithDocument:(id)a3
{
  id v3 = a3;
  result = (_TtC7SwiftUI22DocumentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI22DocumentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7SwiftUI22DocumentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  outlined consume of NavigationListState?(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI22DocumentViewController_lastNavigationItemDescription), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUI22DocumentViewController_lastNavigationItemDescription));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI22DocumentViewController_onDocumentClose));
  outlined destroy of AccessibilityValueStorage?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI22DocumentViewController_rootModifier, (unint64_t *)&lazy cache variable for type metadata for RootModifier?);
  swift_release();

  swift_unknownObjectRelease();
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  v8 = self;
  specialized DocumentViewController.presentationController(_:willPresentWithAdaptiveStyle:transitionCoordinator:)(a5);

  swift_unknownObjectRelease();
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  specialized DocumentViewController.presentationControllerWillDismiss(_:)();
}

@end