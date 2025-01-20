@interface NSString
@end

@implementation NSString

void __63__NSString_UTAdditions__stringByAppendingPathExtensionForType___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v6 = [v9 preferredTagOfClass:@"public.filename-extension"];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a4 = 1;
  }
}

@end