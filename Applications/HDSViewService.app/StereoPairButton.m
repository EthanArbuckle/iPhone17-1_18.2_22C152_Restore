@interface StereoPairButton
- (BOOL)isHighlighted;
- (_TtC14HDSViewService16StereoPairButton)initWithCoder:(id)a3;
- (_TtC14HDSViewService16StereoPairButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation StereoPairButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StereoPairButton();
  return [(StereoPairButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StereoPairButton();
  id v4 = v5.receiver;
  [(StereoPairButton *)&v5 setHighlighted:v3];
  sub_100064D18();
}

- (_TtC14HDSViewService16StereoPairButton)initWithCoder:(id)a3
{
  return (_TtC14HDSViewService16StereoPairButton *)sub_100064A2C(a3);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for StereoPairButton();
  v2 = (char *)v4.receiver;
  [(StereoPairButton *)&v4 layoutSubviews];
  id v3 = [v2[OBJC_IVAR____TtC14HDSViewService16StereoPairButton_circle] layer];
  [v2 frame];
  [v3 setCornerRadius:CGRectGetWidth(v5) * 0.5];

  sub_100064D18();
}

- (_TtC14HDSViewService16StereoPairButton)initWithFrame:(CGRect)a3
{
  result = (_TtC14HDSViewService16StereoPairButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService16StereoPairButton_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService16StereoPairButton_circle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14HDSViewService16StereoPairButton_innerLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC14HDSViewService16StereoPairButton_bottomLabel);
}

@end