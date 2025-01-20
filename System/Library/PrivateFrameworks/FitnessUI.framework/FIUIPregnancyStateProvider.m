@interface FIUIPregnancyStateProvider
- (BOOL)isPregnant;
- (FIUIPregnancyStateProvider)init;
- (FIUIPregnancyStateProvider)initWithHealthStore:(id)a3;
- (id)currentModel;
- (void)activate;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)notifyObservers:(id)a3;
- (void)pregnancyModelDidChangeWithModel:(id)a3;
- (void)removeObserver:(id)a3;
- (void)stopQuery;
@end

@implementation FIUIPregnancyStateProvider

- (FIUIPregnancyStateProvider)initWithHealthStore:(id)a3
{
  return (FIUIPregnancyStateProvider *)sub_21E49A9D0(a3);
}

- (void)dealloc
{
  v2 = self;
  sub_21E49AAD8();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FIUIPregnancyStateProvider_pregnancyModel);
}

- (id)currentModel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___FIUIPregnancyStateProvider_pregnancyModel));
}

- (BOOL)isPregnant
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FIUIPregnancyStateProvider_pregnancyModel);
  if (v2) {
    LOBYTE(v2) = objc_msgSend(v2, sel_state) == (id)1;
  }
  return (char)v2;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)notifyObservers:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E49ADFC((uint64_t)v4);
}

- (void)activate
{
  v2 = self;
  sub_21E49AFF0();
}

- (void)stopQuery
{
  v2 = self;
  sub_21E49B2AC();
}

- (void)pregnancyModelDidChangeWithModel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E49B4B0(v4);
}

- (FIUIPregnancyStateProvider)init
{
  result = (FIUIPregnancyStateProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end