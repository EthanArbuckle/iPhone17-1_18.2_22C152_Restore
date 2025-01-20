@interface NSObject(BannerKitAdditions)
- (id)uniquePresentableIdentifier;
@end

@implementation NSObject(BannerKitAdditions)

- (id)uniquePresentableIdentifier
{
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"NSObject+BannerKit.m", 22, @"Attempt to obtain unique presentable identifier from object that isn't a presentable: %@", a1 object file lineNumber description];
  }
  id v4 = a1;
  objc_sync_enter(v4);
  v5 = objc_getAssociatedObject(v4, "com.apple.BannerKit.presentableUniqueIdentifier");
  objc_sync_exit(v4);

  return v5;
}

@end