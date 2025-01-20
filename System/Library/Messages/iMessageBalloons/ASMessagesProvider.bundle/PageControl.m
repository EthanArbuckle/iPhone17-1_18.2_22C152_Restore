@interface PageControl
- (_TtC18ASMessagesProviderP33_7801CE2CD236390AE6FA8ADBE4D2096411PageControl)initWithCoder:(id)a3;
- (_TtC18ASMessagesProviderP33_7801CE2CD236390AE6FA8ADBE4D2096411PageControl)initWithFrame:(CGRect)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation PageControl

- (void)accessibilityIncrement
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    v3 = self;
    sub_55108C(1u);

    swift_unknownObjectRelease();
  }
}

- (void)accessibilityDecrement
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    v3 = self;
    sub_55108C(0);

    swift_unknownObjectRelease();
  }
}

- (_TtC18ASMessagesProviderP33_7801CE2CD236390AE6FA8ADBE4D2096411PageControl)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)&self->delegate[OBJC_IVAR____TtC18ASMessagesProviderP33_7801CE2CD236390AE6FA8ADBE4D2096411PageControl_delegate] = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PageControl();
  return -[PageControl initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC18ASMessagesProviderP33_7801CE2CD236390AE6FA8ADBE4D2096411PageControl)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC18ASMessagesProviderP33_7801CE2CD236390AE6FA8ADBE4D2096411PageControl_delegate] = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PageControl();
  return [(PageControl *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end