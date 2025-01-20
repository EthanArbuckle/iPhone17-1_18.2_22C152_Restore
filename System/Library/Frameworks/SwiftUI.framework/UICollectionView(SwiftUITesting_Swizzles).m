@interface UICollectionView(SwiftUITesting_Swizzles)
+ (void)_performSwiftUITestingOverrides;
- (uint64_t)_SwiftUITesting__viewAnimationsForCurrentUpdateWithCollectionViewAnimator:()SwiftUITesting_Swizzles;
@end

@implementation UICollectionView(SwiftUITesting_Swizzles)

+ (void)_performSwiftUITestingOverrides
{
  self;
  v0 = (objc_class *)objc_claimAutoreleasedReturnValue();
  _SwizzleMethods(v0, sel__viewAnimationsForCurrentUpdateWithCollectionViewAnimator_, sel__SwiftUITesting__viewAnimationsForCurrentUpdateWithCollectionViewAnimator_);
}

- (uint64_t)_SwiftUITesting__viewAnimationsForCurrentUpdateWithCollectionViewAnimator:()SwiftUITesting_Swizzles
{
  return 0;
}

@end