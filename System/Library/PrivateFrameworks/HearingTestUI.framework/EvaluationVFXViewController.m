@interface EvaluationVFXViewController
- (_TtC13HearingTestUIP33_082BE27A287B6DD65B327A94BB91711E27EvaluationVFXViewController)initWithCoder:(id)a3;
- (_TtC13HearingTestUIP33_082BE27A287B6DD65B327A94BB91711E27EvaluationVFXViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleTap;
- (void)viewDidLoad;
@end

@implementation EvaluationVFXViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2513DE338();
}

- (void)handleTap
{
  v2 = self;
  sub_2513D5DD8();
}

- (_TtC13HearingTestUIP33_082BE27A287B6DD65B327A94BB91711E27EvaluationVFXViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_251444C20();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = OBJC_IVAR____TtC13HearingTestUIP33_082BE27A287B6DD65B327A94BB91711E27EvaluationVFXViewController_vfxView;
  id v9 = objc_allocWithZone((Class)type metadata accessor for EvaluationVFXView());
  v10 = self;
  id v11 = a4;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  if (v7)
  {
    v12 = (void *)sub_251444BE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for EvaluationVFXViewController();
  v13 = [(EvaluationVFXViewController *)&v15 initWithNibName:v12 bundle:v11];

  return v13;
}

- (_TtC13HearingTestUIP33_082BE27A287B6DD65B327A94BB91711E27EvaluationVFXViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC13HearingTestUIP33_082BE27A287B6DD65B327A94BB91711E27EvaluationVFXViewController_vfxView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for EvaluationVFXView());
  id v7 = a3;
  uint64_t v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for EvaluationVFXViewController();
  id v9 = [(EvaluationVFXViewController *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HearingTestUIP33_082BE27A287B6DD65B327A94BB91711E27EvaluationVFXViewController_vfxView));
}

@end