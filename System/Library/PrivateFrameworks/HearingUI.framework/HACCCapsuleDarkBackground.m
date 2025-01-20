@interface HACCCapsuleDarkBackground
- (void)setupBackgroundVisualStyle;
@end

@implementation HACCCapsuleDarkBackground

- (void)setupBackgroundVisualStyle
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__HACCCapsuleDarkBackground_setupBackgroundVisualStyle__block_invoke;
  block[3] = &unk_2647CD1B8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __55__HACCCapsuleDarkBackground_setupBackgroundVisualStyle__block_invoke(uint64_t a1)
{
  HUICCBackgroundVisualStylingProviderForCategory(2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _automaticallyUpdateView:*(void *)(a1 + 32) withStyleNamed:@"moduleListTint" andObserverBlock:0];
}

@end