@interface UICollectionViewAccessibility__MusicUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation UICollectionViewAccessibility__MusicUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(UICollectionViewAccessibility__MusicUI__UIKit *)self accessibilityIdentifier];
  if (([v8 isEqualToString:@"AXFeaturedStationsCollectionViewIdentifier"] & 1) == 0)
  {

    goto LABEL_6;
  }
  v9 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (v10)
  {
LABEL_6:
    v15 = self;
    v12 = &v15;
    goto LABEL_7;
  }
  [(UICollectionViewAccessibility__MusicUI__UIKit *)self bounds];
  v19.size.height = v11 + -30.0;
  v18.double x = x;
  v18.double y = y;
  if (CGRectContainsPoint(v19, v18))
  {
    v16 = self;
    v12 = &v16;
LABEL_7:
    v12[1] = (UICollectionViewAccessibility__MusicUI__UIKit *)UICollectionViewAccessibility__MusicUI__UIKit;
    v13 = objc_msgSendSuper2((objc_super *)v12, sel__accessibilityHitTest_withEvent_, v7, x, y, v15);
    goto LABEL_8;
  }
  v13 = 0;
LABEL_8:

  return v13;
}

@end