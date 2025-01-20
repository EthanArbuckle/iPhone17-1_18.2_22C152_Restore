@interface UIView(RPVideoOverlayButton)
+ (id)_srVideoOverlayButtonWithStyle:()RPVideoOverlayButton;
@end

@implementation UIView(RPVideoOverlayButton)

+ (id)_srVideoOverlayButtonWithStyle:()RPVideoOverlayButton
{
  if (a3 == 2
    || !a3
    && ([MEMORY[0x263F1C5C0] currentDevice],
        v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 _graphicsQuality],
        v4,
        v5 == 10))
  {
    v6 = off_26451D508;
  }
  else
  {
    v6 = off_26451D510;
  }
  v7 = (void *)[objc_alloc(*v6) initWithStyle:a3];

  return v7;
}

@end