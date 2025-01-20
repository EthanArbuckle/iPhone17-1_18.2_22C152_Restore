@interface HFVacuumStatusItem
+ (NSSet)serviceTypes;
- (HFVacuumStatusItem)initWithHome:(id)a3 room:(id)a4 valueSource:(id)a5;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFVacuumStatusItem

+ (NSSet)serviceTypes
{
  v2 = (void *)sub_20BCE7920();
  return (NSSet *)v2;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  if (a3) {
    sub_20BCE7520();
  }
  v4 = self;
  id updated = _sSo18HFVacuumStatusItemC4HomeE16_subclass_update7optionsSo8NAFutureCySo19HFItemUpdateOutcomeCGSgSDys11AnyHashableVypGSg_tF_0();

  swift_bridgeObjectRelease();
  return updated;
}

- (HFVacuumStatusItem)initWithHome:(id)a3 room:(id)a4 valueSource:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HFVacuumStatusItem;
  return [(HFStatusItem *)&v6 initWithHome:a3 room:a4 valueSource:a5];
}

@end