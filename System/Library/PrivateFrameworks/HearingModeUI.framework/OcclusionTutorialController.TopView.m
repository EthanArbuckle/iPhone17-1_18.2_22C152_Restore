@interface OcclusionTutorialController.TopView
- (_TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView)initWithCoder:(id)a3;
- (_TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OcclusionTutorialController.TopView

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for OcclusionTutorialController.TopView();
  id v4 = v9.receiver;
  id v5 = a3;
  [(OcclusionTutorialController.TopView *)&v9 traitCollectionDidChange:v5];
  id v6 = sub_2512A267C();
  id v7 = objc_msgSend(self, sel__preferredFontForTextStyle_weight_, *MEMORY[0x263F83570], *MEMORY[0x263F81838], v9.receiver, v9.super_class);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v6, sel_setFont_, v7);
  }
  else
  {
    __break(1u);
  }
}

- (_TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2512A4338();
}

- (_TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView)initWithFrame:(CGRect)a3
{
  result = (_TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView____lazy_storage___spacerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_leftBudImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_rightBudImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_leftStatusMarkImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC13HearingModeUI27OcclusionTutorialControllerP33_BB0ED88BAA1A46658A630804B4A339A37TopView_rightStatusMarkImage));
  swift_bridgeObjectRelease();
}

@end