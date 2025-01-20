@interface FMR1AvailabilityHelper.FMR1AvailabilityHelperTrampoline
- (_TtCC11FMFindingUI22FMR1AvailabilityHelper32FMR1AvailabilityHelperTrampoline)init;
- (void)didFailWithError:(id)a3;
- (void)itemLocalizerChangedState:(unint64_t)a3;
@end

@implementation FMR1AvailabilityHelper.FMR1AvailabilityHelperTrampoline

- (void)itemLocalizerChangedState:(unint64_t)a3
{
  v3 = *(void (**)(BOOL, void))((char *)&self->super.isa
                                             + OBJC_IVAR____TtCC11FMFindingUI22FMR1AvailabilityHelper32FMR1AvailabilityHelperTrampoline_handler);
  BOOL v4 = a3 == 2;
  v5 = self;
  v3(v4, 0);
}

- (void)didFailWithError:(id)a3
{
  v5 = *(void (**)(id, uint64_t))((char *)&self->super.isa
                                          + OBJC_IVAR____TtCC11FMFindingUI22FMR1AvailabilityHelper32FMR1AvailabilityHelperTrampoline_handler);
  id v7 = a3;
  v6 = self;
  v5(a3, 1);
}

- (_TtCC11FMFindingUI22FMR1AvailabilityHelper32FMR1AvailabilityHelperTrampoline)init
{
  result = (_TtCC11FMFindingUI22FMR1AvailabilityHelper32FMR1AvailabilityHelperTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end