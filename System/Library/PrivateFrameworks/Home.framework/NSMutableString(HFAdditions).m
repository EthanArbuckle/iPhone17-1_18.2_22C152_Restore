@interface NSMutableString(HFAdditions)
- (uint64_t)hf_appendLine:()HFAdditions;
- (uint64_t)hf_appendLineWithFormat:()HFAdditions;
@end

@implementation NSMutableString(HFAdditions)

- (uint64_t)hf_appendLine:()HFAdditions
{
  objc_msgSend(a1, "appendString:");
  return [a1 appendString:@"\n"];
}

- (uint64_t)hf_appendLineWithFormat:()HFAdditions
{
  v10 = (objc_class *)NSString;
  id v11 = a3;
  v12 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  [a1 appendString:v12];
  return [a1 appendString:@"\n"];
}

@end