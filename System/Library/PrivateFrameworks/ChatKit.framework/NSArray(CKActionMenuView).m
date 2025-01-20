@interface NSArray(CKActionMenuView)
- (BOOL)ck_containsObjectIdenticalTo:()CKActionMenuView;
@end

@implementation NSArray(CKActionMenuView)

- (BOOL)ck_containsObjectIdenticalTo:()CKActionMenuView
{
  return objc_msgSend(a1, "indexOfObjectIdenticalTo:") != 0x7FFFFFFFFFFFFFFFLL;
}

@end