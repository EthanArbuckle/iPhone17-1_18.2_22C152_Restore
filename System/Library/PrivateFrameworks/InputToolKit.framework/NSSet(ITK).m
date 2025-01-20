@interface NSSet(ITK)
- (BOOL)itk_containsObjectPassingTest:()ITK;
- (id)itk_compactMap:()ITK;
- (id)itk_map:()ITK;
- (id)itk_objectPassingTest:()ITK;
- (id)itk_objectsConformingToProtocol:()ITK;
- (id)itk_objectsOfClass:()ITK;
@end

@implementation NSSet(ITK)

- (id)itk_objectPassingTest:()ITK
{
  v1 = objc_msgSend(a1, "objectsPassingTest:");
  v2 = [v1 anyObject];

  return v2;
}

- (BOOL)itk_containsObjectPassingTest:()ITK
{
  v1 = objc_msgSend(a1, "itk_objectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)itk_objectsConformingToProtocol:()ITK
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__NSSet_ITK__itk_objectsConformingToProtocol___block_invoke;
  v8[3] = &unk_26538CE98;
  id v9 = v4;
  id v5 = v4;
  v6 = [a1 objectsPassingTest:v8];

  return v6;
}

- (id)itk_objectsOfClass:()ITK
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__NSSet_ITK__itk_objectsOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v5[4] = a3;
  v3 = [a1 objectsPassingTest:v5];

  return v3;
}

- (id)itk_compactMap:()ITK
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __29__NSSet_ITK__itk_compactMap___block_invoke;
  v13 = &unk_26538CEE0;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)itk_map:()ITK
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __22__NSSet_ITK__itk_map___block_invoke;
  v13 = &unk_26538CEE0;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

@end