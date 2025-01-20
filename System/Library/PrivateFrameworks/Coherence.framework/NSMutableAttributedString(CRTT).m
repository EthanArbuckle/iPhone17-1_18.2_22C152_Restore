@interface NSMutableAttributedString(CRTT)
- (id)cr_emptyCopy;
- (id)cr_storageFromRange:()CRTT;
- (uint64_t)cr_mergeAttributesInRange:()CRTT withStorage:fromRange:;
- (void)cr_appendStorage:()CRTT fromRange:;
- (void)cr_appendString:()CRTT;
- (void)cr_replaceStorageInRange:()CRTT withStorage:fromRange:;
@end

@implementation NSMutableAttributedString(CRTT)

- (void)cr_appendString:()CRTT
{
  id v5 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];
  [a1 appendAttributedString:v4];
}

- (void)cr_replaceStorageInRange:()CRTT withStorage:fromRange:
{
  id v12 = a5;
  v13 = [v12 string];
  v14 = objc_msgSend(v13, "substringWithRange:", a6, a7);
  objc_msgSend(a1, "replaceCharactersInRange:withString:", a3, a4, v14);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__NSMutableAttributedString_CRTT__cr_replaceStorageInRange_withStorage_fromRange___block_invoke;
  v15[3] = &unk_1E64C1AA8;
  v15[6] = a7;
  v15[7] = a3;
  v15[4] = a1;
  v15[5] = a6;
  objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", a6, a7, 0x100000, v15);
}

- (void)cr_appendStorage:()CRTT fromRange:
{
  id v8 = a3;
  objc_msgSend(a1, "cr_replaceStorageInRange:withStorage:fromRange:", objc_msgSend(a1, "length"), 0, v8, a4, a5);
}

- (id)cr_storageFromRange:()CRTT
{
  v1 = objc_msgSend(a1, "attributedSubstringFromRange:");
  v2 = (void *)[v1 mutableCopy];

  return v2;
}

- (id)cr_emptyCopy
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  return v0;
}

- (uint64_t)cr_mergeAttributesInRange:()CRTT withStorage:fromRange:
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__NSMutableAttributedString_CRTT__cr_mergeAttributesInRange_withStorage_fromRange___block_invoke;
  v8[3] = &unk_1E64C1AF8;
  v8[4] = a1;
  v8[5] = a3 - a6;
  return objc_msgSend(a5, "enumerateAttributesInRange:options:usingBlock:", a6, a7, 0x100000, v8);
}

@end