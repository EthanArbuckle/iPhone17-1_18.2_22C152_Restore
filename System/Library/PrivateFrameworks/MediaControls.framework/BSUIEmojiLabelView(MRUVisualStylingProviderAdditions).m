@interface BSUIEmojiLabelView(MRUVisualStylingProviderAdditions)
- (void)mru_applyVisualStylingWithColor:()MRUVisualStylingProviderAdditions alpha:blendMode:;
@end

@implementation BSUIEmojiLabelView(MRUVisualStylingProviderAdditions)

- (void)mru_applyVisualStylingWithColor:()MRUVisualStylingProviderAdditions alpha:blendMode:
{
  id v8 = a4;
  id v9 = [a1 contentLabel];
  objc_msgSend(v9, "mru_applyVisualStylingWithColor:alpha:blendMode:", v8, a5, a2);
}

@end