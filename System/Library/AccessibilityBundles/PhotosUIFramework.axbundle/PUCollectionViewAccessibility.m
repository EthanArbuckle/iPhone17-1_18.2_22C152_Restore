@interface PUCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityShouldSpeakScrollStatusOnEntry;
- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4;
@end

@implementation PUCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_scrollViewAnimationEnded:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)PUCollectionViewAccessibility;
  -[PUCollectionViewAccessibility _scrollViewAnimationEnded:finished:](&v6, sel__scrollViewAnimationEnded_finished_, a3);
  if (v4)
  {
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"AXPhotoCollectionViewScrolled" object:0];
  }
}

- (BOOL)_accessibilityShouldSpeakScrollStatusOnEntry
{
  return 1;
}

@end