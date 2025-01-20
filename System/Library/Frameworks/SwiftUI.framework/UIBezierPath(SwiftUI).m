@interface UIBezierPath(SwiftUI)
- (uint64_t)initWithArcRoundedRectForSwiftUI:()SwiftUI cornerRadius:;
@end

@implementation UIBezierPath(SwiftUI)

- (uint64_t)initWithArcRoundedRectForSwiftUI:()SwiftUI cornerRadius:
{
  v11 = (void *)[a1 init];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB14C0], "_bezierPathWithArcRoundedRect:cornerRadius:", a2, a3, a4, a5, a6);

  return v12;
}

@end