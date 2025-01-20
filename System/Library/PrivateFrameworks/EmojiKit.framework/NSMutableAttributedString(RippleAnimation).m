@interface NSMutableAttributedString(RippleAnimation)
- (EMKRippleAnimation)addRippleAnimationForRange_emk:()RippleAnimation;
- (void)removeRippleAnimation:()RippleAnimation includingFilterEffect_emk:;
@end

@implementation NSMutableAttributedString(RippleAnimation)

- (EMKRippleAnimation)addRippleAnimationForRange_emk:()RippleAnimation
{
  v7 = [MEMORY[0x1E4F43368] animationWithName:@"glimmer"];
  objc_msgSend(a1, "addAttribute:value:range:", @"_NSTextFilterAnimation", v7, a3, a4);
  v8 = [MEMORY[0x1E4F43368] animationWithName:@"scaleRipple"];
  objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E4FB0788], v8, a3, a4);
  v9 = [[EMKRippleAnimation alloc] initWithGlimmerFilterAnimation:v7 scaleRippleAnimation:v8];

  return v9;
}

- (void)removeRippleAnimation:()RippleAnimation includingFilterEffect_emk:
{
  id v6 = a3;
  uint64_t v7 = [a1 length];
  uint64_t v8 = *MEMORY[0x1E4FB0788];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __94__NSMutableAttributedString_RippleAnimation__removeRippleAnimation_includingFilterEffect_emk___block_invoke;
  v13[3] = &unk_1E6E96E98;
  id v9 = v6;
  id v14 = v9;
  v15 = a1;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v13);
  if (a4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __94__NSMutableAttributedString_RippleAnimation__removeRippleAnimation_includingFilterEffect_emk___block_invoke_2;
    v10[3] = &unk_1E6E96E98;
    id v11 = v9;
    v12 = a1;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", @"_NSTextFilterAnimation", 0, v7, 0, v10);
  }
}

@end