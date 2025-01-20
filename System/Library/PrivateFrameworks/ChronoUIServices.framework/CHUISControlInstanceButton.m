@interface CHUISControlInstanceButton
- (CHUISControlButtonViewModel)viewModel;
- (CHUISControlIconView)iconView;
- (CHUISControlInstanceButton)initWithControl:(id)a3;
- (CHUISControlInstanceButton)initWithControl:(id)a3 contentType:(unint64_t)a4;
- (CHUISControlInstanceButton)initWithInstanceIdentity:(id)a3;
- (NSString)title;
- (UIColor)tintColor;
@end

@implementation CHUISControlInstanceButton

- (NSString)title
{
  v2 = self;
  CHUISControlInstanceButton.title.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1BC488898();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (CHUISControlIconView)iconView
{
  uint64_t v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1BC40DC4C((uint64_t)v3, (uint64_t)v8);
  uint64_t v4 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB808C90);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB808678);
  swift_dynamicCast();
  id v5 = *(id *)(v7 + 24);

  swift_release();

  return (CHUISControlIconView *)v5;
}

- (UIColor)tintColor
{
  v2 = self;
  id v3 = CHUISControlInstanceButton.tintColor.getter();

  return (UIColor *)v3;
}

- (CHUISControlButtonViewModel)viewModel
{
  id v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1BC40DC4C((uint64_t)v3, (uint64_t)v8);
  uint64_t v4 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB808C90);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB808678);
  swift_dynamicCast();
  swift_beginAccess();
  id v5 = *(id *)(v7 + 16);

  swift_release();

  return (CHUISControlButtonViewModel *)v5;
}

- (CHUISControlInstanceButton)initWithControl:(id)a3 contentType:(unint64_t)a4
{
  id v7 = objc_allocWithZone(MEMORY[0x1E4F58C90]);
  id v8 = a3;
  id v9 = objc_msgSend(v7, sel_initWithControl_contentType_hostIdentifier_configurationIdentifier_, v8, a4, 0, 0);
  v10 = [(CHUISControlInstanceButton *)self initWithInstanceIdentity:v9];

  return v10;
}

- (CHUISControlInstanceButton)initWithInstanceIdentity:(id)a3
{
  return (CHUISControlInstanceButton *)CHUISControlInstanceButton.init(instanceIdentity:)(a3);
}

- (CHUISControlInstanceButton)initWithControl:(id)a3
{
  id v3 = a3;
  result = (CHUISControlInstanceButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end