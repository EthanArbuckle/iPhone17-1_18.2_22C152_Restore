@interface BridgeZoomLabeledSliderCell
- (NPSDomainAccessor)zoomDomainAccessor;
- (double)initialValue;
- (id)_zoomDomainAccessor;
- (id)labelTextColor;
- (void)handleSliderDidFinishDrag:(id)a3;
- (void)setZoomDomainAccessor:(id)a3;
@end

@implementation BridgeZoomLabeledSliderCell

- (void)handleSliderDidFinishDrag:(id)a3
{
  id v4 = a3;
  v5 = [(BridgeZoomLabeledSliderCell *)self _zoomDomainAccessor];
  v6 = NSNumber;
  [v4 value];
  int v8 = v7;

  LODWORD(v9) = v8;
  v10 = [v6 numberWithFloat:v9];
  [v5 setObject:v10 forKey:@"ZoomPreferredMaximumZoomScale"];

  v11 = [(BridgeZoomLabeledSliderCell *)self _zoomDomainAccessor];
  id v12 = (id)[v11 synchronize];

  id v14 = (id)objc_opt_new();
  v13 = [MEMORY[0x263EFFA08] setWithArray:&unk_26FB00778];
  [v14 synchronizeNanoDomain:@"com.apple.ZoomTouch" keys:v13];
}

- (id)_zoomDomainAccessor
{
  zoomDomainAccessor = self->_zoomDomainAccessor;
  if (!zoomDomainAccessor)
  {
    id v4 = (NPSDomainAccessor *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.ZoomTouch"];
    v5 = self->_zoomDomainAccessor;
    self->_zoomDomainAccessor = v4;

    zoomDomainAccessor = self->_zoomDomainAccessor;
  }

  return zoomDomainAccessor;
}

- (id)labelTextColor
{
  return (id)[MEMORY[0x263F825C8] whiteColor];
}

- (double)initialValue
{
  v2 = [(BridgeZoomLabeledSliderCell *)self _zoomDomainAccessor];
  v3 = [v2 objectForKey:@"ZoomPreferredMaximumZoomScale"];

  if (v3)
  {
    [v3 floatValue];
    double v5 = v4;
  }
  else
  {
    double v5 = *MEMORY[0x263F212F8];
  }

  return v5;
}

- (NPSDomainAccessor)zoomDomainAccessor
{
  return (NPSDomainAccessor *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setZoomDomainAccessor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end