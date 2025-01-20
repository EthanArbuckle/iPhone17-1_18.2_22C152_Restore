@interface UIActivityIndicatorView(MTVisualStylingSupport)
- (uint64_t)mt_applyVisualStyling:()MTVisualStylingSupport;
@end

@implementation UIActivityIndicatorView(MTVisualStylingSupport)

- (uint64_t)mt_applyVisualStyling:()MTVisualStylingSupport
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __73__UIActivityIndicatorView_MTVisualStylingSupport__mt_applyVisualStyling___block_invoke;
  v4[3] = &unk_264256BB0;
  v4[4] = a1;
  return [a3 applyToView:a1 withColorBlock:v4];
}

@end