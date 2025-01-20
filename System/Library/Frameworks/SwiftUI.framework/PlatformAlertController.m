@interface PlatformAlertController
- (_TtC7SwiftUI23PlatformAlertController)initWithCoder:(id)a3;
- (_TtC7SwiftUI23PlatformAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PlatformAlertController

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PlatformAlertController();
  v4 = (char *)v7.receiver;
  [(PlatformAlertController *)&v7 viewDidDisappear:v3];
  v5 = *(void (**)(uint64_t))&v4[OBJC_IVAR____TtC7SwiftUI23PlatformAlertController_onDismissAction];
  if (v5)
  {
    uint64_t v6 = swift_retain();
    v5(v6);
    outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?((uint64_t)v5);
  }
}

- (_TtC7SwiftUI23PlatformAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC7SwiftUI23PlatformAlertController_onDismissAction);
    void *v9 = 0;
    v9[1] = 0;
    id v10 = a4;
    v11 = (void *)MEMORY[0x18C115780](v6, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC7SwiftUI23PlatformAlertController_onDismissAction);
    void *v12 = 0;
    v12[1] = 0;
    id v13 = a4;
    v11 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for PlatformAlertController();
  v14 = [(PlatformAlertController *)&v16 initWithNibName:v11 bundle:a4];

  return v14;
}

- (_TtC7SwiftUI23PlatformAlertController)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7SwiftUI23PlatformAlertController_onDismissAction);
  uint64_t v6 = (objc_class *)type metadata accessor for PlatformAlertController();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(PlatformAlertController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end