@interface HFNullValueSource
+ (NAIdentity)na_identity;
- (BOOL)hasPendingWritesForRouteID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNaturalLightingEnabledForProfile:(id)a3;
- (BOOL)isNaturalLightingSupportedForProfile:(id)a3;
- (id)cachedPlaybackStateWriteErrorForRouteID:(id)a3;
- (id)cachedValueForCharacteristic:(id)a3;
- (id)mediaProfileContainerForRouteID:(id)a3;
- (id)readValuesForCharacteristicTypes:(id)a3 inServices:(id)a4;
- (id)readValuesForCharacteristics:(id)a3;
- (id)writeNaturalLightEnabledState:(BOOL)a3 forProfile:(id)a4;
- (id)writePlaybackState:(int64_t)a3 playbackArchive:(id)a4 forRouteID:(id)a5;
- (id)writeValuesForCharacteristics:(id)a3;
- (int64_t)lastPlaybackStateForProfileForRouteID:(id)a3;
- (unint64_t)hash;
@end

@implementation HFNullValueSource

- (BOOL)isNaturalLightingSupportedForProfile:(id)a3
{
  return 0;
}

- (BOOL)isNaturalLightingEnabledForProfile:(id)a3
{
  return 0;
}

- (id)writeNaturalLightEnabledState:(BOOL)a3 forProfile:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", a3, a4);
}

- (id)readValuesForCharacteristics:(id)a3
{
  v3 = objc_msgSend(a3, "na_map:", &__block_literal_global_106);
  v4 = [[HFCharacteristicBatchReadResponse alloc] initWithReadResponses:v3 contextProvider:0];
  v5 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v5;
}

HFCharacteristicReadResponse *__50__HFNullValueSource_readValuesForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [HFCharacteristicReadResponse alloc];
  v4 = [MEMORY[0x263EFFA08] setWithObject:@"ExplicitlyDisallowed"];
  v5 = [(HFCharacteristicReadResponse *)v3 initWithCharacteristic:v2 readTraits:v4 value:0 error:0];

  return v5;
}

- (id)readValuesForCharacteristicTypes:(id)a3 inServices:(id)a4
{
  id v5 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__HFNullValueSource_readValuesForCharacteristicTypes_inServices___block_invoke;
  v12[3] = &unk_264091C28;
  id v13 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a4, "na_map:", v12);
  v8 = objc_msgSend(v7, "na_setByFlattening");

  v9 = [[HFCharacteristicBatchReadResponse alloc] initWithReadResponses:v8 contextProvider:0];
  v10 = [MEMORY[0x263F58190] futureWithResult:v9];

  return v10;
}

id __65__HFNullValueSource_readValuesForCharacteristicTypes_inServices___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263EFFA08];
  v4 = [a2 characteristics];
  id v5 = [v3 setWithArray:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__HFNullValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_2;
  v9[3] = &unk_2640903A0;
  id v10 = *(id *)(a1 + 32);
  id v6 = objc_msgSend(v5, "na_filter:", v9);
  v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_6_4);

  return v7;
}

uint64_t __65__HFNullValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [a2 characteristicType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

HFCharacteristicReadResponse *__65__HFNullValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [HFCharacteristicReadResponse alloc];
  uint64_t v4 = [MEMORY[0x263EFFA08] setWithObject:@"ExplicitlyDisallowed"];
  id v5 = [(HFCharacteristicReadResponse *)v3 initWithCharacteristic:v2 readTraits:v4 value:0 error:0];

  return v5;
}

- (id)writeValuesForCharacteristics:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", a3);
}

- (id)cachedValueForCharacteristic:(id)a3
{
  return 0;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_260 != -1) {
    dispatch_once(&_MergedGlobals_260, &__block_literal_global_13_5);
  }
  id v2 = (void *)qword_26AB2F178;
  return (NAIdentity *)v2;
}

void __32__HFNullValueSource_na_identity__block_invoke_2()
{
  id v2 = [MEMORY[0x263F58198] builder];
  uint64_t v0 = [v2 build];
  v1 = (void *)qword_26AB2F178;
  qword_26AB2F178 = v0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (id)mediaProfileContainerForRouteID:(id)a3
{
  return 0;
}

- (int64_t)lastPlaybackStateForProfileForRouteID:(id)a3
{
  return 0;
}

- (id)writePlaybackState:(int64_t)a3 playbackArchive:(id)a4 forRouteID:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", a3, a4, a5);
}

- (BOOL)hasPendingWritesForRouteID:(id)a3
{
  return 0;
}

- (id)cachedPlaybackStateWriteErrorForRouteID:(id)a3
{
  return 0;
}

@end