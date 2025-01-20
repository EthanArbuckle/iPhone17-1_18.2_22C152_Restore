@interface CALayer(SwiftUIAdditions)
- (uint64_t)setNoAnimationDelegate;
- (uint64_t)swiftUI_displayListID;
- (uint64_t)swiftUI_viewTestProperties;
- (void)setSwiftUI_displayListID:()SwiftUIAdditions;
- (void)setSwiftUI_viewTestProperties:()SwiftUIAdditions;
@end

@implementation CALayer(SwiftUIAdditions)

- (void)setSwiftUI_displayListID:()SwiftUIAdditions
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setValue:v2 forKey:@"_swiftUI_displayListID"];
}

- (uint64_t)setNoAnimationDelegate
{
  uint64_t v2 = objc_opt_class();

  return [a1 setDelegate:v2];
}

- (uint64_t)swiftUI_displayListID
{
  v1 = [a1 valueForKey:@"_swiftUI_displayListID"];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v3;
}

- (uint64_t)swiftUI_viewTestProperties
{
  v1 = [a1 valueForKey:@"_swiftUI_viewTestProperties"];
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (void)setSwiftUI_viewTestProperties:()SwiftUIAdditions
{
  objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setValue:v2 forKey:@"_swiftUI_viewTestProperties"];
}

@end