@interface UIImageView(CCUIGroupRenderingSupport)
- (id)ccui_punchOutCompensatingCopy;
- (uint64_t)ccui_configureForPunchOutRendering:()CCUIGroupRenderingSupport;
- (uint64_t)ccui_setCompensationAlpha:()CCUIGroupRenderingSupport;
@end

@implementation UIImageView(CCUIGroupRenderingSupport)

- (uint64_t)ccui_configureForPunchOutRendering:()CCUIGroupRenderingSupport
{
  v4 = [a1 layer];
  v5 = v4;
  if (a3) {
    uint64_t v6 = *MEMORY[0x1E4F3A098];
  }
  else {
    uint64_t v6 = 0;
  }
  [v4 setCompositingFilter:v6];
  v7 = [v5 superlayer];
  uint64_t v8 = a3 ^ 1u;
  [v7 setAllowsGroupOpacity:v8];
  [v7 setAllowsGroupBlending:v8];

  return 1;
}

- (id)ccui_punchOutCompensatingCopy
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1838]);
  v3 = [a1 image];
  v4 = (void *)[v2 initWithImage:v3];

  [a1 frame];
  objc_msgSend(v4, "setFrame:");
  v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.37254902 green:0.37254902 blue:0.37254902 alpha:1.0];
  objc_msgSend(v4, "ccui_applyGlyphTintColor:", v5);

  [a1 alpha];
  objc_msgSend(v4, "ccui_setCompensationAlpha:");
  return v4;
}

- (uint64_t)ccui_setCompensationAlpha:()CCUIGroupRenderingSupport
{
  if (a3 > 0.15) {
    a3 = 0.15;
  }
  return [a1 setAlpha:a3];
}

@end