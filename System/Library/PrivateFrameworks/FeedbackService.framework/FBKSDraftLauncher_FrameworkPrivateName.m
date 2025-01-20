@interface FBKSDraftLauncher_FrameworkPrivateName
- (FBKSDraftLauncher_FrameworkPrivateName)init;
- (FBKSDraftLauncher_FrameworkPrivateName)initWithFeedbackForm:(id)a3;
- (FBKSForm_FrameworkPrivateName)form;
- (void)collectFeedbackWithLaunchConfiguration:(id)a3 completion:(id)a4;
- (void)setForm:(id)a3;
@end

@implementation FBKSDraftLauncher_FrameworkPrivateName

- (FBKSForm_FrameworkPrivateName)form
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___FBKSDraftLauncher_FrameworkPrivateName_form);
  swift_beginAccess();
  return (FBKSForm_FrameworkPrivateName *)*v2;
}

- (void)setForm:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___FBKSDraftLauncher_FrameworkPrivateName_form);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (FBKSDraftLauncher_FrameworkPrivateName)initWithFeedbackForm:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FBKSDraftLauncher_FrameworkPrivateName_form) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBKSDraftLauncher();
  id v4 = a3;
  return [(FBKSDraftLauncher_FrameworkPrivateName *)&v6 init];
}

- (void)collectFeedbackWithLaunchConfiguration:(id)a3 completion:(id)a4
{
  objc_super v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    objc_super v6 = sub_24DFFACE8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_24DFF9D64(a3, v6, v7);
  sub_24DFFACA0((uint64_t)v6);
}

- (FBKSDraftLauncher_FrameworkPrivateName)init
{
  result = (FBKSDraftLauncher_FrameworkPrivateName *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end