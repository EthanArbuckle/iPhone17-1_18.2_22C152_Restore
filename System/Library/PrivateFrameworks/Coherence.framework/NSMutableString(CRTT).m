@interface NSMutableString(CRTT)
- (id)cr_emptyCopy;
- (id)cr_storageFromRange:()CRTT;
- (void)cr_appendStorage:()CRTT fromRange:;
- (void)cr_replaceStorageInRange:()CRTT withStorage:fromRange:;
@end

@implementation NSMutableString(CRTT)

- (void)cr_replaceStorageInRange:()CRTT withStorage:fromRange:
{
  objc_msgSend(a5, "substringWithRange:", a6, a7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [a1 replaceCharactersInRange:a3 withString:a4];
}

- (void)cr_appendStorage:()CRTT fromRange:
{
  id v8 = a3;
  objc_msgSend(a1, "cr_replaceStorageInRange:withStorage:fromRange:", objc_msgSend(a1, "length"), 0, v8, a4, a5);
}

- (id)cr_storageFromRange:()CRTT
{
  v1 = objc_msgSend(a1, "substringWithRange:");
  v2 = (void *)[v1 mutableCopy];

  return v2;
}

- (id)cr_emptyCopy
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  return v0;
}

@end