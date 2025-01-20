@interface VSNotificationTableCell
- (_TtC12AutoSettings23VSNotificationTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation VSNotificationTableCell

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_100018894(a3, a4);
}

- (_TtC12AutoSettings23VSNotificationTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC12AutoSettings23VSNotificationTableCell *)sub_100018C70(a3, (uint64_t)a4, v6);
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->superclass_opaque[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell____lazy_storage___chevronImageView];
}

@end