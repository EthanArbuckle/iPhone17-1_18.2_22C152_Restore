@interface CSSearchableItemAttributeSet(Temporary)
- (void)setCachedViewDataSafe:()Temporary;
@end

@implementation CSSearchableItemAttributeSet(Temporary)

- (void)setCachedViewDataSafe:()Temporary
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [a1 setCachedViewData:v4];
  }
}

@end