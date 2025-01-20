@interface HUQuickControlColorViewProfile
- (BOOL)naturalLightingEnabled;
- (BOOL)supportsNaturalLighting;
- (BOOL)supportsRGBColor;
- (HFColorProfile)colorProfile;
- (HUQuickControlColorViewProfile)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)mode;
- (void)setColorProfile:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setNaturalLightingEnabled:(BOOL)a3;
- (void)setSupportsNaturalLighting:(BOOL)a3;
- (void)setSupportsRGBColor:(BOOL)a3;
@end

@implementation HUQuickControlColorViewProfile

- (HUQuickControlColorViewProfile)init
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlColorViewProfile;
  v2 = [(HUQuickControlColorViewProfile *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(HUQuickControlColorViewProfile *)v2 setSupportsRGBColor:1];
    [(HUQuickControlColorViewProfile *)v3 setSupportsNaturalLighting:0];
    [(HUQuickControlColorViewProfile *)v3 setNaturalLightingEnabled:0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlColorViewProfile;
  id v4 = [(HUQuickControlViewProfile *)&v7 copyWithZone:a3];
  objc_msgSend(v4, "setSupportsRGBColor:", -[HUQuickControlColorViewProfile supportsRGBColor](self, "supportsRGBColor"));
  objc_msgSend(v4, "setSupportsNaturalLighting:", -[HUQuickControlColorViewProfile supportsNaturalLighting](self, "supportsNaturalLighting"));
  objc_msgSend(v4, "setNaturalLightingEnabled:", -[HUQuickControlColorViewProfile naturalLightingEnabled](self, "naturalLightingEnabled"));
  objc_super v5 = [(HUQuickControlColorViewProfile *)self colorProfile];
  [v4 setColorProfile:v5];

  objc_msgSend(v4, "setMode:", -[HUQuickControlColorViewProfile mode](self, "mode"));
  return v4;
}

- (BOOL)supportsRGBColor
{
  return self->_supportsRGBColor;
}

- (void)setSupportsRGBColor:(BOOL)a3
{
  self->_supportsRGBColor = a3;
}

- (BOOL)supportsNaturalLighting
{
  return self->_supportsNaturalLighting;
}

- (void)setSupportsNaturalLighting:(BOOL)a3
{
  self->_supportsNaturalLighting = a3;
}

- (BOOL)naturalLightingEnabled
{
  return self->_naturalLightingEnabled;
}

- (void)setNaturalLightingEnabled:(BOOL)a3
{
  self->_naturalLightingEnabled = a3;
}

- (HFColorProfile)colorProfile
{
  return self->_colorProfile;
}

- (void)setColorProfile:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
}

@end