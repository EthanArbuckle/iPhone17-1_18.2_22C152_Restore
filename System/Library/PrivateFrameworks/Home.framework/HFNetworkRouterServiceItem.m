@interface HFNetworkRouterServiceItem
+ (NSSet)supportedServiceTypes;
- (HFNetworkRouterServiceItem)initWithValueSource:(id)a3 service:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFNetworkRouterServiceItem

+ (NSSet)supportedServiceTypes
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
    uint64_t v4 = sub_20BCE7520();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  v6 = (void *)HFNetworkRouterServiceItem._subclass_update(options:)(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (HFNetworkRouterServiceItem)initWithValueSource:(id)a3 service:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HFNetworkRouterServiceItem;
  return [(HFServiceItem *)&v5 initWithValueSource:a3 service:a4];
}

@end