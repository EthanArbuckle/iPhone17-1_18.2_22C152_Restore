@interface DOCCopyableLabel
- (BOOL)canBecomeFirstResponder;
- (UIColor)textColor;
- (_TtC17RecentsAppPopover16DOCCopyableLabel)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover16DOCCopyableLabel)initWithFrame:(CGRect)a3;
- (void)copyDetail;
- (void)handleTapWithSender:(id)a3;
- (void)setTextColor:(id)a3;
- (void)tintColorDidChange;
@end

@implementation DOCCopyableLabel

- (UIColor)textColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCCopyableLabel();
  v2 = [(DOCCopyableLabel *)&v4 textColor];
  return v2;
}

- (void)setTextColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCCopyableLabel();
  [(DOCCopyableLabel *)&v4 setTextColor:a3];
}

- (void)handleTapWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  if ([v4 state] == (id)3 && swift_unknownObjectWeakLoadStrong())
  {
    sub_1002A6D28();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (BOOL)canBecomeFirstResponder
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC17RecentsAppPopover16DOCCopyableLabel_supportsCopy);
}

- (void)copyDetail
{
  v2 = self;
  sub_1003B0C44();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_1003B0F7C();
}

- (_TtC17RecentsAppPopover16DOCCopyableLabel)initWithFrame:(CGRect)a3
{
  return (_TtC17RecentsAppPopover16DOCCopyableLabel *)sub_1003B108C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17RecentsAppPopover16DOCCopyableLabel)initWithCoder:(id)a3
{
  return (_TtC17RecentsAppPopover16DOCCopyableLabel *)sub_1003B11BC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover16DOCCopyableLabel_textColorIfStaticText));
  swift_bridgeObjectRelease();
  sub_10003CC04((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover16DOCCopyableLabel_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover16DOCCopyableLabel____lazy_storage___tapGesture));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover16DOCCopyableLabel____lazy_storage___menuInteraction);
}

@end