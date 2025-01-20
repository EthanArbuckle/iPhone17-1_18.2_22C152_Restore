@interface NSSet(WFFileCoder)
+ (id)wf_classSetFromArray:()WFFileCoder;
@end

@implementation NSSet(WFFileCoder)

+ (id)wf_classSetFromArray:()WFFileCoder
{
  v3 = (objc_class *)MEMORY[0x263EFFA08];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithArray:v4];

  return v5;
}

@end