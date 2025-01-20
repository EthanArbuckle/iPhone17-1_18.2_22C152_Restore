@interface HUGraphicsUtilities
+ (BOOL)shouldReduceVisualEffects;
+ (void)setRearrangingAnimation:(BOOL)a3 layer:(id)a4 frame:(CGRect)a5;
@end

@implementation HUGraphicsUtilities

+ (BOOL)shouldReduceVisualEffects
{
  if (qword_1EBA47928 != -1) {
    dispatch_once(&qword_1EBA47928, &__block_literal_global_223);
  }
  return _MergedGlobals_633;
}

void __48__HUGraphicsUtilities_shouldReduceVisualEffects__block_invoke()
{
  id v3 = MTLCreateSystemDefaultDevice();
  char v0 = [v3 supportsFamily:1003] ^ 1;
  v1 = [MEMORY[0x1E4F65570] systemInfo];
  v2 = [v1 modelIdentifier];
  _MergedGlobals_633 = v0 | [v2 hasPrefix:@"iPhone8"];
}

+ (void)setRearrangingAnimation:(BOOL)a3 layer:(id)a4 frame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v10 = a4;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGRectGetHeight(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGRectGetWidth(v13);
  sub_1BE58ADA8(a3, v10);
}

@end