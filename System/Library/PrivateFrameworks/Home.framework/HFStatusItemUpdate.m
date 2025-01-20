@interface HFStatusItemUpdate
- (HFIconDescriptor)iconDescriptor;
- (HFNumberRange)currentValue;
- (HFNumberRange)possibleValues;
- (HFStatusItemUpdate)init;
- (HFStatusItemUpdate)initWithTitle:(id)a3;
- (HFStatusItemUpdate)initWithTitle:(id)a3 secondaryText:(id)a4 iconDescriptor:(id)a5;
- (NSString)description;
- (NSString)secondaryText;
- (NSString)title;
- (void)setCurrentValue:(id)a3;
- (void)setIconDescriptor:(id)a3;
- (void)setPossibleValues:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation HFStatusItemUpdate

- (NSString)title
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_20BCE7320();
  swift_release();
  swift_release();

  v4 = (void *)sub_20BCE75E0();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)setTitle:(id)a3
{
  sub_20BCE7620();
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_20BCE7330();
}

- (NSString)secondaryText
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_20BCE7320();
  swift_release();
  swift_release();

  if (v6)
  {
    v4 = (void *)sub_20BCE75E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setSecondaryText:(id)a3
{
  if (a3) {
    sub_20BCE7620();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_20BCE7330();
}

- (HFIconDescriptor)iconDescriptor
{
  return (HFIconDescriptor *)sub_20BA538A0(self);
}

- (void)setIconDescriptor:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_unknownObjectRetain_n();
  v4 = self;
  sub_20BCE7330();
  sub_20BA53218();
  swift_unknownObjectRelease();
}

- (HFNumberRange)currentValue
{
  return (HFNumberRange *)sub_20BA538A0(self);
}

- (void)setCurrentValue:(id)a3
{
}

- (HFNumberRange)possibleValues
{
  return (HFNumberRange *)sub_20BA538A0(self);
}

- (void)setPossibleValues:(id)a3
{
}

- (HFStatusItemUpdate)initWithTitle:(id)a3 secondaryText:(id)a4 iconDescriptor:(id)a5
{
  uint64_t v7 = sub_20BCE7620();
  uint64_t v9 = v8;
  if (a4)
  {
    a4 = (id)sub_20BCE7620();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }
  swift_unknownObjectRetain();
  v12 = (HFStatusItemUpdate *)sub_20BA54FF0(v7, v9, (uint64_t)a4, v11, (uint64_t)a5);
  swift_unknownObjectRelease();
  return v12;
}

- (HFStatusItemUpdate)initWithTitle:(id)a3
{
  uint64_t v3 = sub_20BCE7620();
  return (HFStatusItemUpdate *)StatusItemUpdate.init(title:)(v3, v4);
}

- (NSString)description
{
  v2 = self;
  sub_20BA54848();

  uint64_t v3 = (void *)sub_20BCE75E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (HFStatusItemUpdate)init
{
  result = (HFStatusItemUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___HFStatusItemUpdate__title;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AE958);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___HFStatusItemUpdate__secondaryText;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AE970);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = (char *)self + OBJC_IVAR___HFStatusItemUpdate__iconDescriptor;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AE988);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = (char *)self + OBJC_IVAR___HFStatusItemUpdate__currentValue;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676AE9A0);
  v12 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v12)((void *)(v10 - 8), v9, v10);
  uint64_t v11 = (char *)self + OBJC_IVAR___HFStatusItemUpdate__possibleValues;
  v12(v11, v10);
}

@end