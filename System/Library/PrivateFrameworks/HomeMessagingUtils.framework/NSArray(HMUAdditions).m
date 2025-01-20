@interface NSArray(HMUAdditions)
- (id)hmu_compactMap:()HMUAdditions;
@end

@implementation NSArray(HMUAdditions)

- (id)hmu_compactMap:()HMUAdditions
{
  id v4 = a3;
  v5 = objc_opt_new();
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __40__NSArray_HMUAdditions__hmu_compactMap___block_invoke;
  v13 = &unk_264545448;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

@end