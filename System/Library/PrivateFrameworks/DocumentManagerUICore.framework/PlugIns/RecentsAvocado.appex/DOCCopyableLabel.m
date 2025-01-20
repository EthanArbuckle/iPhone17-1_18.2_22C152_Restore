@interface DOCCopyableLabel
- (BOOL)canBecomeFirstResponder;
- (UIColor)textColor;
- (_TtC14RecentsAvocado16DOCCopyableLabel)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado16DOCCopyableLabel)initWithFrame:(CGRect)a3;
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
    sub_1002A62B4();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (BOOL)canBecomeFirstResponder
{
  return *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC14RecentsAvocado16DOCCopyableLabel_supportsCopy);
}

- (void)copyDetail
{
  v2 = self;
  sub_1003FEAB8();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_1003FEDF0();
}

- (_TtC14RecentsAvocado16DOCCopyableLabel)initWithFrame:(CGRect)a3
{
  return (_TtC14RecentsAvocado16DOCCopyableLabel *)sub_1003FEF00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14RecentsAvocado16DOCCopyableLabel)initWithCoder:(id)a3
{
  return (_TtC14RecentsAvocado16DOCCopyableLabel *)sub_1003FF030(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado16DOCCopyableLabel_textColorIfStaticText));
  swift_bridgeObjectRelease();
  sub_1000391D4((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado16DOCCopyableLabel_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado16DOCCopyableLabel____lazy_storage___tapGesture));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado16DOCCopyableLabel____lazy_storage___menuInteraction);
}

@end