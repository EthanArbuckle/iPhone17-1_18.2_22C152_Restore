@interface CustomizableDocumentViewController
- (_TtC7SwiftUI34CustomizableDocumentViewController)initWithCoder:(id)a3;
@end

@implementation CustomizableDocumentViewController

- (_TtC7SwiftUI34CustomizableDocumentViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC7SwiftUI34CustomizableDocumentViewController_cardTitle);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7SwiftUI34CustomizableDocumentViewController_screenBackground) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC7SwiftUI34CustomizableDocumentViewController_backgroundAccessoryView);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC7SwiftUI34CustomizableDocumentViewController_overlayAccessoryView);
  void *v6 = 0;
  v6[1] = 0;
  id v7 = a3;

  result = (_TtC7SwiftUI34CustomizableDocumentViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7SwiftUI34CustomizableDocumentViewController_backgroundAccessoryView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC7SwiftUI34CustomizableDocumentViewController_overlayAccessoryView);

  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(v3);
}

@end