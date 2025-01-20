@interface MPSectionedCollection(MQFDebugging)
- (id)mpc_identifiersAsJsonValue;
@end

@implementation MPSectionedCollection(MQFDebugging)

- (id)mpc_identifiersAsJsonValue
{
  v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "numberOfSections"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__MPSectionedCollection_MQFDebugging__mpc_identifiersAsJsonValue__block_invoke;
  v7[3] = &unk_2643C1748;
  v7[4] = a1;
  id v3 = v2;
  id v8 = v3;
  [a1 enumerateSectionIdentifiersUsingBlock:v7];
  v4 = v8;
  id v5 = v3;

  return v5;
}

@end