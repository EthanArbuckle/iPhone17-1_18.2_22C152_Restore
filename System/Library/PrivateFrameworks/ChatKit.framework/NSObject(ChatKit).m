@interface NSObject(ChatKit)
+ (uint64_t)__ck_isKindOfClass:()ChatKit;
- (uint64_t)ck_constrainedSizeThatFits:()ChatKit;
@end

@implementation NSObject(ChatKit)

+ (uint64_t)__ck_isKindOfClass:()ChatKit
{
  if (objc_msgSend(a1, "isEqual:")) {
    return 1;
  }

  return [a1 isSubclassOfClass:a3];
}

- (uint64_t)ck_constrainedSizeThatFits:()ChatKit
{
  return objc_msgSend(a1, "sizeThatFits:");
}

@end