@interface VSNotificationHeaderView
- (_TtC12AutoSettings24VSNotificationHeaderView)initWithCoder:(id)a3;
- (_TtC12AutoSettings24VSNotificationHeaderView)initWithReuseIdentifier:(id)a3;
@end

@implementation VSNotificationHeaderView

- (_TtC12AutoSettings24VSNotificationHeaderView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings24VSNotificationHeaderView_notificationItem] = 0;
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
    *(void *)&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings24VSNotificationHeaderView_notificationItem] = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for VSNotificationHeaderView();
  v5 = [(VSNotificationHeaderView *)&v7 initWithReuseIdentifier:v4];

  return v5;
}

- (_TtC12AutoSettings24VSNotificationHeaderView)initWithCoder:(id)a3
{
  *(void *)&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings24VSNotificationHeaderView_notificationItem] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VSNotificationHeaderView();
  return [(VSNotificationHeaderView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end