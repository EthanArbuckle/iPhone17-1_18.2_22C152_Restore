@interface NSString(EDAMNilAdditions)
- (uint64_t)enIsEqualToStringOrNil:()EDAMNilAdditions;
@end

@implementation NSString(EDAMNilAdditions)

- (uint64_t)enIsEqualToStringOrNil:()EDAMNilAdditions
{
  if (!a3) {
    return objc_msgSend(a1, "length", v3, v4) == 0;
  }
  return objc_msgSend(a1, "isEqualToString:");
}

@end