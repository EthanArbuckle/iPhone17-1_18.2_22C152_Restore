@interface HUAccessoryDetailsRouter
+ (id)detailsViewFor:(id)a3 navigationController:(id)a4 dismiss:(id)a5;
- (HUAccessoryDetailsRouter)init;
@end

@implementation HUAccessoryDetailsRouter

- (HUAccessoryDetailsRouter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AccessoryDetailsRouter();
  return [(HUAccessoryDetailsRouter *)&v3 init];
}

+ (id)detailsViewFor:(id)a3 navigationController:(id)a4 dismiss:(id)a5
{
  v7 = _Block_copy(a5);
  if (v7)
  {
    v8 = (void *)swift_allocObject();
    v8[2] = v7;
    v7 = sub_1BE43BE18;
  }
  else
  {
    v8 = 0;
  }
  id v9 = a3;
  id v10 = a4;
  if (sub_1BE43ABF8(v9))
  {
    type metadata accessor for AccessoryDetailsRouter();
    uint64_t v11 = sub_1BE4397BC(v9, (uint64_t)v7, v8, a4);
  }
  else
  {
    uint64_t v11 = (uint64_t)sub_1BE43BB64(v9);
  }
  v12 = (void *)v11;
  sub_1BE3B21C0((uint64_t)v7);

  return v12;
}

@end