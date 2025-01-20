@interface MedicationDoseEvent
- (void)medicationDetailDidUpdate:(id)a3 for:(id)a4;
@end

@implementation MedicationDoseEvent

- (void)medicationDetailDidUpdate:(id)a3 for:(id)a4
{
  uint64_t v5 = sub_1C2B73FA0();
  uint64_t v7 = v6;
  id v8 = a3;
  swift_retain();
  sub_1C2B0F538(v8, v5, v7);

  swift_release();
  swift_bridgeObjectRelease();
}

@end