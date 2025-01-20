@interface CHUISControlInstancePicker
- (CHUISControlIconView)iconView;
- (CHUISControlInstancePicker)initWithControl:(id)a3;
- (CHUISControlInstancePicker)initWithControl:(id)a3 contentType:(unint64_t)a4;
- (CHUISControlInstancePicker)initWithInstanceIdentity:(id)a3;
- (CHUISControlPickerViewModel)viewModel;
- (NSArray)options;
- (NSString)title;
- (NSString)valueLabel;
- (UIColor)tintColor;
- (int64_t)state;
- (void)setState:(int64_t)a3 completion:(id)a4;
@end

@implementation CHUISControlInstancePicker

- (NSString)title
{
  return (NSString *)sub_1BC4355B4(self, (uint64_t)a2, (void (*)(void))CHUISControlInstancePicker.title.getter);
}

- (CHUISControlIconView)iconView
{
  v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1BC40DC4C((uint64_t)v3, (uint64_t)v8);
  v4 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB808C90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F97D18);
  swift_dynamicCast();
  id v5 = *(id *)(v7 + 24);

  swift_release();

  return (CHUISControlIconView *)v5;
}

- (UIColor)tintColor
{
  v2 = self;
  id v3 = CHUISControlInstancePicker.tintColor.getter();

  return (UIColor *)v3;
}

- (int64_t)state
{
  v2 = self;
  id v3 = CHUISControlInstancePicker.state.getter();

  return (int64_t)v3;
}

- (NSString)valueLabel
{
  return (NSString *)sub_1BC4355B4(self, (uint64_t)a2, (void (*)(void))CHUISControlInstancePicker.valueLabel.getter);
}

- (NSArray)options
{
  v2 = self;
  uint64_t v3 = CHUISControlInstancePicker.options.getter();

  if (v3)
  {
    type metadata accessor for CHUISControlPickerOption(v4);
    id v5 = (void *)sub_1BC488928();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }

  return (NSArray *)v5;
}

- (CHUISControlPickerViewModel)viewModel
{
  uint64_t v3 = (char *)self + OBJC_IVAR___CHUISControlInstance__adapter;
  swift_beginAccess();
  sub_1BC40DC4C((uint64_t)v3, (uint64_t)v8);
  uint64_t v4 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB808C90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9F97D18);
  swift_dynamicCast();
  swift_beginAccess();
  id v5 = *(id *)(v7 + 16);

  swift_release();

  return (CHUISControlPickerViewModel *)v5;
}

- (CHUISControlInstancePicker)initWithControl:(id)a3 contentType:(unint64_t)a4
{
  id v7 = objc_allocWithZone(MEMORY[0x1E4F58C90]);
  id v8 = a3;
  id v9 = objc_msgSend(v7, sel_initWithControl_contentType_hostIdentifier_configurationIdentifier_, v8, a4, 0, 0);
  v10 = [(CHUISControlInstancePicker *)self initWithInstanceIdentity:v9];

  return v10;
}

- (CHUISControlInstancePicker)initWithInstanceIdentity:(id)a3
{
  return (CHUISControlInstancePicker *)CHUISControlInstancePicker.init(instanceIdentity:)(a3);
}

- (void)setState:(int64_t)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1BC436768;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = self;
  CHUISControlInstancePicker.setState(_:completion:)(a3, (uint64_t)v6, v7);
  sub_1BC436720((uint64_t)v6);
}

- (CHUISControlInstancePicker)initWithControl:(id)a3
{
  id v3 = a3;
  result = (CHUISControlInstancePicker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end