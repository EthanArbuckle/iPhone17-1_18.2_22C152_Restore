@interface DynamicTypeLinkedLabel
- (NSAttributedString)attributedText;
- (_TtC12GameCenterUI22DynamicTypeLinkedLabel)initWithCoder:(id)a3;
- (void)labelTapped:(id)a3;
- (void)setAttributedText:(id)a3;
@end

@implementation DynamicTypeLinkedLabel

- (NSAttributedString)attributedText
{
  v2 = self;
  id v3 = sub_1AF44BBC0();

  return (NSAttributedString *)v3;
}

- (void)setAttributedText:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF44BC68(a3);
}

- (void)labelTapped:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AF44C56C(v4);
}

- (_TtC12GameCenterUI22DynamicTypeLinkedLabel)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI22DynamicTypeLinkedLabel *)sub_1AF44CA78(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22DynamicTypeLinkedLabel_tapGestureRecognizer));
  sub_1AF3A4630((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI22DynamicTypeLinkedLabel_linkInteractionDelegate, &qword_1E9AC6590);
}

@end