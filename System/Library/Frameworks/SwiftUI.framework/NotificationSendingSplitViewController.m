@interface NotificationSendingSplitViewController
- (_TtC7SwiftUI38NotificationSendingSplitViewController)initWithCoder:(id)a3;
- (_TtC7SwiftUI38NotificationSendingSplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7SwiftUI38NotificationSendingSplitViewController)initWithStyle:(int64_t)a3;
- (void)showDetailViewController:(id)a3 sender:(id)a4;
@end

@implementation NotificationSendingSplitViewController

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
  NotificationSendingSplitViewController.showDetailViewController(_:sender:)(a3, (uint64_t)v10);

  outlined destroy of Any?((uint64_t)v10);
}

- (_TtC7SwiftUI38NotificationSendingSplitViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NotificationSendingSplitViewController();
  return [(NotificationSendingSplitViewController *)&v5 initWithCoder:a3];
}

- (_TtC7SwiftUI38NotificationSendingSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    id v9 = a4;
    v10 = (void *)MEMORY[0x18C115780](v6, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v11 = a4;
    v10 = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for NotificationSendingSplitViewController();
  v12 = [(NotificationSendingSplitViewController *)&v14 initWithNibName:v10 bundle:a4];

  return v12;
}

- (_TtC7SwiftUI38NotificationSendingSplitViewController)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NotificationSendingSplitViewController();
  return [(NotificationSendingSplitViewController *)&v5 initWithStyle:a3];
}

@end