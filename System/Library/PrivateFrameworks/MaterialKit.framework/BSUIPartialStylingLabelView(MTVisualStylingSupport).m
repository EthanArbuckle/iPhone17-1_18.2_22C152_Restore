@interface BSUIPartialStylingLabelView(MTVisualStylingSupport)
- (void)mt_applyVisualStyling:()MTVisualStylingSupport;
- (void)mt_removeAllVisualStyling;
@end

@implementation BSUIPartialStylingLabelView(MTVisualStylingSupport)

- (void)mt_applyVisualStyling:()MTVisualStylingSupport
{
  id v4 = a3;
  v5 = [a1 contentLabel];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__BSUIPartialStylingLabelView_MTVisualStylingSupport__mt_applyVisualStyling___block_invoke;
  v6[3] = &unk_264256BB0;
  v6[4] = a1;
  [v4 applyToView:v5 withColorBlock:v6];
}

- (void)mt_removeAllVisualStyling
{
  id v1 = [a1 contentLabel];
  objc_msgSend(v1, "mt_removeAllVisualStyling");
}

@end