@interface VSNotificationActionTableCell
- (_TtC12AutoSettings29VSNotificationActionTableCell)initWithCoder:(id)a3;
- (_TtC12AutoSettings29VSNotificationActionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation VSNotificationActionTableCell

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_100019250(a3, a4);
}

- (_TtC12AutoSettings29VSNotificationActionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = (char *)self + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((_OWORD *)v6 + 2) = 0u;
    v6[48] = 0;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
    v8 = (char *)self + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction;
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((_OWORD *)v8 + 2) = 0u;
    v8[48] = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for VSNotificationActionTableCell();
  v9 = [(VSTableCell *)&v11 initWithStyle:a3 reuseIdentifier:v7];

  return v9;
}

- (_TtC12AutoSettings29VSNotificationActionTableCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction;
  v6 = (objc_class *)type metadata accessor for VSNotificationActionTableCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  v5[48] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(VSTableCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end