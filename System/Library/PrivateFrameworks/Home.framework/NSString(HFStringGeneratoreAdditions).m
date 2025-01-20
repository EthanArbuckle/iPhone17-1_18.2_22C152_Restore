@interface NSString(HFStringGeneratoreAdditions)
- (id)dynamicStringForSize:()HFStringGeneratoreAdditions attributes:;
- (id)stringWithAttributes:()HFStringGeneratoreAdditions;
- (uint64_t)prefersDynamicString;
@end

@implementation NSString(HFStringGeneratoreAdditions)

- (id)stringWithAttributes:()HFStringGeneratoreAdditions
{
  v4 = (objc_class *)MEMORY[0x263F086A0];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithString:a1 attributes:v5];

  return v6;
}

- (id)dynamicStringForSize:()HFStringGeneratoreAdditions attributes:
{
  v4 = (objc_class *)MEMORY[0x263F086A0];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithString:a1 attributes:v5];

  return v6;
}

- (uint64_t)prefersDynamicString
{
  return 0;
}

@end