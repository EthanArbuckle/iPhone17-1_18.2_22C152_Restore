@interface APOnBoardingWelcomeController
- (_TtC15AppProtectionUI29APOnBoardingWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC15AppProtectionUI29APOnBoardingWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)viewDidLayoutSubviews;
@end

@implementation APOnBoardingWelcomeController

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for APOnBoardingWelcomeController();
  v2 = (char *)v6.receiver;
  [(OBBaseWelcomeController *)&v6 viewDidLayoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant];
  if (v3)
  {
    id v4 = v3;
    v5 = (char *)objc_msgSend(v2, sel_scrollView, v6.receiver, v6.super_class);
    objc_msgSend(v4, sel_performAdjustmentsForScrollView_, v5);

    v2 = v5;
  }
}

- (_TtC15AppProtectionUI29APOnBoardingWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = sub_247E1A258();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    return (_TtC15AppProtectionUI29APOnBoardingWelcomeController *)sub_247E110E8(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)sub_247E1A258();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = sub_247E1A258();
  uint64_t v16 = v15;
  return (_TtC15AppProtectionUI29APOnBoardingWelcomeController *)sub_247E110E8(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC15AppProtectionUI29APOnBoardingWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  sub_247E1A258();
  if (a4)
  {
    sub_247E1A258();
    a4 = v10;
  }
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant) = 0;
  id v11 = a5;
  uint64_t v12 = (void *)sub_247E1A248();
  swift_bridgeObjectRelease();
  if (a4)
  {
    uint64_t v13 = (void *)sub_247E1A248();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for APOnBoardingWelcomeController();
  uint64_t v14 = [(APOnBoardingWelcomeController *)&v16 initWithTitle:v12 detailText:v13 icon:v11 contentLayout:a6];

  return v14;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant));
}

@end