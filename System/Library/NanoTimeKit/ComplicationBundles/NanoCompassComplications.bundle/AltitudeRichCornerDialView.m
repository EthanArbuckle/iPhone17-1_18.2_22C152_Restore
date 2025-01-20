@interface AltitudeRichCornerDialView
- (id)_newBottomView;
- (id)_newTopView;
@end

@implementation AltitudeRichCornerDialView

- (id)_newTopView
{
  id v2 = objc_alloc(MEMORY[0x263F1C6D0]);
  v3 = NanoCompassComplicationImageNamed(@"Altitude/Corner/Top");
  v6 = objc_msgSend_initWithImage_(v2, v4, (uint64_t)v3, v5);

  return v6;
}

- (id)_newBottomView
{
  id v2 = objc_alloc(MEMORY[0x263F1C6D0]);
  v3 = NanoCompassComplicationImageNamed(@"Altitude/Corner/Bottom");
  v6 = objc_msgSend_initWithImage_(v2, v4, (uint64_t)v3, v5);

  return v6;
}

@end