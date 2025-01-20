@interface CCUIPrivacyAttributionButton
- (CCUIPrivacyAttributionButton)init;
- (CCUIPrivacyAttributionButton)initWithCoder:(id)a3;
- (CCUIPrivacyAttributionButton)initWithDelegate:(id)a3;
- (CCUIPrivacyAttributionButton)initWithFrame:(CGRect)a3;
- (CCUIPrivacyAttributionButton)initWithFrame:(CGRect)a3 primaryAction:(id)a4;
- (void)layoutSubviews;
- (void)sensorAttributionsChanged:(id)a3 uniqueEntities:(id)a4;
@end

@implementation CCUIPrivacyAttributionButton

- (CCUIPrivacyAttributionButton)initWithDelegate:(id)a3
{
  return (CCUIPrivacyAttributionButton *)PrivacyAttributionButton.init(delegate:)();
}

- (CCUIPrivacyAttributionButton)init
{
  swift_unknownObjectWeakInit();
  uint64_t v3 = OBJC_IVAR___CCUIPrivacyAttributionButton_buttonViewModel;
  type metadata accessor for PrivacyAttributionButtonViewModel();
  swift_allocObject();
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)sub_1D7B9B430();

  result = (CCUIPrivacyAttributionButton *)sub_1D7BB78A8();
  __break(1u);
  return result;
}

- (CCUIPrivacyAttributionButton)initWithFrame:(CGRect)a3 primaryAction:(id)a4
{
  swift_unknownObjectWeakInit();
  uint64_t v6 = OBJC_IVAR___CCUIPrivacyAttributionButton_buttonViewModel;
  type metadata accessor for PrivacyAttributionButtonViewModel();
  swift_allocObject();
  id v7 = a4;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)sub_1D7B9B430();

  result = (CCUIPrivacyAttributionButton *)sub_1D7BB78A8();
  __break(1u);
  return result;
}

- (CCUIPrivacyAttributionButton)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR___CCUIPrivacyAttributionButton_buttonViewModel;
  type metadata accessor for PrivacyAttributionButtonViewModel();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_1D7B9B430();

  result = (CCUIPrivacyAttributionButton *)sub_1D7BB78A8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___CCUIPrivacyAttributionButton_hostingViewController);
  uint64_t v3 = self;
  id v4 = objc_msgSend(v2, sel_view);
  if (v4)
  {
    [(CCUIPrivacyAttributionButton *)v3 bounds];
    objc_msgSend(v4, sel_setFrame_);
  }
  else
  {
    __break(1u);
  }
}

- (void)sensorAttributionsChanged:(id)a3 uniqueEntities:(id)a4
{
  sub_1D7B2170C(0, &qword_1EBDFF990);
  sub_1D7B21748();
  unint64_t v5 = sub_1D7BB73A8();
  sub_1D7B2170C(0, (unint64_t *)&unk_1EA871430);
  unint64_t v6 = sub_1D7BB72F8();
  id v7 = self;
  sub_1D7B61C0C(v5, v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (CCUIPrivacyAttributionButton)initWithFrame:(CGRect)a3
{
  result = (CCUIPrivacyAttributionButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D7B63530((uint64_t)self + OBJC_IVAR___CCUIPrivacyAttributionButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CCUIPrivacyAttributionButton_hostingViewController));

  swift_release();
}

@end