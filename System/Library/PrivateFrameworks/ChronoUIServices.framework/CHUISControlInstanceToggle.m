@interface CHUISControlInstanceToggle
- (BOOL)state;
- (CHUISControlIconView)iconView;
- (CHUISControlInstanceToggle)initWithControl:(id)a3;
- (CHUISControlInstanceToggle)initWithControl:(id)a3 contentType:(unint64_t)a4;
- (CHUISControlInstanceToggle)initWithInstanceIdentity:(id)a3;
- (CHUISControlInstanceToggle)initWithWidget:(id)a3;
- (CHUISControlToggleViewModel)viewModel;
- (NSString)title;
- (NSString)valueLabel;
- (NSString)valueLabelAfterAction;
- (UIColor)tintColor;
@end

@implementation CHUISControlInstanceToggle

- (NSString)title
{
  return (NSString *)sub_1BC437824(self, (uint64_t)a2, (void (*)(void))CHUISControlInstanceToggle.title.getter);
}

- (CHUISControlIconView)iconView
{
  v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1BC40DC4C((uint64_t)v3, (uint64_t)v8);
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB808C90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8064F8);
  swift_dynamicCast();
  id v5 = *(id *)(v7 + 24);

  swift_release();

  return (CHUISControlIconView *)v5;
}

- (UIColor)tintColor
{
  v2 = self;
  id v3 = CHUISControlInstanceToggle.tintColor.getter();

  return (UIColor *)v3;
}

- (BOOL)state
{
  v2 = self;
  unsigned __int8 v3 = CHUISControlInstanceToggle.state.getter();

  return v3 & 1;
}

- (NSString)valueLabel
{
  return (NSString *)sub_1BC437824(self, (uint64_t)a2, (void (*)(void))CHUISControlInstanceToggle.valueLabel.getter);
}

- (NSString)valueLabelAfterAction
{
  return (NSString *)sub_1BC437824(self, (uint64_t)a2, (void (*)(void))CHUISControlInstanceToggle.valueLabelAfterAction.getter);
}

- (CHUISControlToggleViewModel)viewModel
{
  unsigned __int8 v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1BC40DC4C((uint64_t)v3, (uint64_t)v8);
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB808C90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8064F8);
  swift_dynamicCast();
  swift_beginAccess();
  id v5 = *(id *)(v7 + 16);

  swift_release();

  return (CHUISControlToggleViewModel *)v5;
}

- (CHUISControlInstanceToggle)initWithControl:(id)a3
{
  return (CHUISControlInstanceToggle *)CHUISControlInstanceToggle.init(control:)(a3);
}

- (CHUISControlInstanceToggle)initWithControl:(id)a3 contentType:(unint64_t)a4
{
  id v7 = objc_allocWithZone(MEMORY[0x1E4F58C90]);
  id v8 = a3;
  id v9 = objc_msgSend(v7, sel_initWithControl_contentType_hostIdentifier_configurationIdentifier_, v8, a4, 0, 0);
  v10 = [(CHUISControlInstanceToggle *)self initWithInstanceIdentity:v9];

  return v10;
}

- (CHUISControlInstanceToggle)initWithInstanceIdentity:(id)a3
{
  return (CHUISControlInstanceToggle *)CHUISControlInstanceToggle.init(instanceIdentity:)(a3);
}

- (CHUISControlInstanceToggle)initWithWidget:(id)a3
{
  return (CHUISControlInstanceToggle *)CHUISControlInstanceToggle.init(widget:)(a3);
}

@end