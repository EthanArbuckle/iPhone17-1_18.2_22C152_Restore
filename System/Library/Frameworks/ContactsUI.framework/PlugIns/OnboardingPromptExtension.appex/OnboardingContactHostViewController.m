@interface OnboardingContactHostViewController
+ (id)makeHostingControllerWithName:(id)a3 bottomField:(id)a4 contactCountText:(id)a5 bottomText:(id)a6 avatarWidth:(double)a7 trailPadding:(double)a8 imageData:(id)a9;
- (_TtC25OnboardingPromptExtension35OnboardingContactHostViewController)initWithCoder:(id)a3;
- (_TtC25OnboardingPromptExtension35OnboardingContactHostViewController)initWithName:(id)a3 bottomField:(id)a4 contactCountText:(id)a5 bottomText:(id)a6 imageData:(id)a7;
- (_TtC25OnboardingPromptExtension35OnboardingContactHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation OnboardingContactHostViewController

+ (id)makeHostingControllerWithName:(id)a3 bottomField:(id)a4 contactCountText:(id)a5 bottomText:(id)a6 avatarWidth:(double)a7 trailPadding:(double)a8 imageData:(id)a9
{
  uint64_t v10 = sub_1000062C0();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1000062C0();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1000062C0();
  uint64_t v18 = v17;
  uint64_t v19 = sub_1000062C0();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  if (a9)
  {
    uint64_t v33 = v18;
    uint64_t v23 = v15;
    uint64_t v24 = v12;
    uint64_t v25 = v19;
    uint64_t v26 = v13;
    uint64_t v27 = v10;
    id v28 = a9;
    a9 = (id)sub_100005FC0();
    unint64_t v30 = v29;

    uint64_t v20 = v25;
    uint64_t v12 = v24;
    uint64_t v15 = v23;
    uint64_t v18 = v33;
    uint64_t v10 = v27;
    uint64_t v13 = v26;
  }
  else
  {
    unint64_t v30 = 0xF000000000000000;
  }
  id v31 = sub_100005C90(v10, v12, v13, v15, v16, v18, v20, v22, (uint64_t)a9, v30);
  sub_100005DF0((uint64_t)a9, v30);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v31;
}

- (_TtC25OnboardingPromptExtension35OnboardingContactHostViewController)initWithName:(id)a3 bottomField:(id)a4 contactCountText:(id)a5 bottomText:(id)a6 imageData:(id)a7
{
  uint64_t v8 = sub_1000062C0();
  uint64_t v25 = v9;
  uint64_t v10 = sub_1000062C0();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1000062C0();
  uint64_t v15 = v14;
  uint64_t v17 = sub_1000062C0();
  uint64_t v18 = v16;
  if (a7)
  {
    uint64_t v24 = v16;
    id v19 = a7;
    a7 = (id)sub_100005FC0();
    unint64_t v21 = v20;

    uint64_t v18 = v24;
  }
  else
  {
    unint64_t v21 = 0xF000000000000000;
  }
  uint64_t v22 = (_TtC25OnboardingPromptExtension35OnboardingContactHostViewController *)sub_100005E04(v8, v25, v10, v12, v13, v15, v17, v18, (uint64_t)a7, v21);
  sub_100005DF0((uint64_t)a7, v21);
  return v22;
}

- (_TtC25OnboardingPromptExtension35OnboardingContactHostViewController)initWithCoder:(id)a3
{
  *(_OWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_imageData) = xmmword_100006BD0;
  id v4 = a3;

  result = (_TtC25OnboardingPromptExtension35OnboardingContactHostViewController *)sub_100006300();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  OnboardingContactHostViewController.viewDidLoad()();
}

- (_TtC25OnboardingPromptExtension35OnboardingContactHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC25OnboardingPromptExtension35OnboardingContactHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_imageData);
  unint64_t v4 = *(void *)&self->name[OBJC_IVAR____TtC25OnboardingPromptExtension35OnboardingContactHostViewController_imageData];

  sub_100005DF0(v3, v4);
}

@end