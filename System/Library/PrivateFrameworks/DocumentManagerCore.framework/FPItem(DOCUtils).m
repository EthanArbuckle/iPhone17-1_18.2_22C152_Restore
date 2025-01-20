@interface FPItem(DOCUtils)
- (BOOL)doc_isAppContainerRoot;
@end

@implementation FPItem(DOCUtils)

- (BOOL)doc_isAppContainerRoot
{
  v1 = objc_msgSend(a1, "fp_appContainerBundleIdentifier");
  BOOL v2 = v1 != 0;

  return v2;
}

@end