@interface HFNetworkRouterStatusItem
+ (NSSet)serviceTypes;
- (HFNetworkRouterStatusItem)initWithHome:(id)a3 room:(id)a4 valueSource:(id)a5;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFNetworkRouterStatusItem

+ (NSSet)serviceTypes
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AB2E498);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20BD12330;
  *(void *)(inited + 32) = sub_20BCE7620();
  *(void *)(inited + 40) = v3;
  *(void *)(inited + 48) = sub_20BCE7620();
  *(void *)(inited + 56) = v4;
  sub_20BA37758(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v5 = (void *)sub_20BCE7920();
  swift_bridgeObjectRelease();
  return (NSSet *)v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  if (a3) {
    sub_20BCE7520();
  }
  uint64_t v4 = self;
  id updated = _sSo25HFNetworkRouterStatusItemC4HomeE16_subclass_update7optionsSo8NAFutureCySo19HFItemUpdateOutcomeCGSDys11AnyHashableVypGSg_tF_0();

  swift_bridgeObjectRelease();
  return updated;
}

- (HFNetworkRouterStatusItem)initWithHome:(id)a3 room:(id)a4 valueSource:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HFNetworkRouterStatusItem;
  return [(HFStatusItem *)&v6 initWithHome:a3 room:a4 valueSource:a5];
}

@end