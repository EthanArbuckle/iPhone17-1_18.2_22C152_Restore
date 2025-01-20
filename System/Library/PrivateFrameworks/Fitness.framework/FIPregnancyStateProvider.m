@interface FIPregnancyStateProvider
- (BOOL)isPregnant;
- (FIPregnancyStateProvider)init;
- (FIPregnancyStateProvider)initWithHealthStore:(id)a3;
- (id)currentModel;
- (void)activate;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)notifyObservers:(id)a3;
- (void)pregnancyModelDidChangeWithModel:(id)a3;
- (void)removeObserver:(id)a3;
- (void)stopQuery;
@end

@implementation FIPregnancyStateProvider

- (void)pregnancyModelDidChangeWithModel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21C74DC5C(v4);
}

- (FIPregnancyStateProvider)initWithHealthStore:(id)a3
{
  return (FIPregnancyStateProvider *)sub_21C774130(a3);
}

- (void)dealloc
{
  v2 = self;
  sub_21C774238();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel);
}

- (id)currentModel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel));
}

- (BOOL)isPregnant
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FIPregnancyStateProvider_pregnancyModel);
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
  sub_21C77455C((uint64_t)v4);
}

- (void)activate
{
  v2 = self;
  sub_21C774750();
}

- (void)stopQuery
{
  v2 = self;
  sub_21C774A0C();
}

- (FIPregnancyStateProvider)init
{
  result = (FIPregnancyStateProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end