@interface MTLumaDodgePillStyleSettings
+ (id)settingsControllerModule;
- (double)blur;
- (double)brightness;
- (double)colorAddOpacity;
- (double)lumaMapPlusColorOpacity;
- (double)overlayBlendOpacity;
- (double)saturation;
- (void)setBlur:(double)a3;
- (void)setBrightness:(double)a3;
- (void)setColorAddOpacity:(double)a3;
- (void)setDefaultValues;
- (void)setLumaMapPlusColorOpacity:(double)a3;
- (void)setOverlayBlendOpacity:(double)a3;
- (void)setSaturation:(double)a3;
@end

@implementation MTLumaDodgePillStyleSettings

- (double)overlayBlendOpacity
{
  return self->_overlayBlendOpacity;
}

- (double)lumaMapPlusColorOpacity
{
  return self->_lumaMapPlusColorOpacity;
}

- (double)colorAddOpacity
{
  return self->_colorAddOpacity;
}

- (double)blur
{
  return self->_blur;
}

- (double)saturation
{
  return self->_saturation;
}

- (double)brightness
{
  return self->_brightness;
}

- (void)setDefaultValues
{
  [(MTLumaDodgePillStyleSettings *)self setColorAddOpacity:0.0];
  [(MTLumaDodgePillStyleSettings *)self setLumaMapPlusColorOpacity:0.0];
  [(MTLumaDodgePillStyleSettings *)self setOverlayBlendOpacity:0.0];
  [(MTLumaDodgePillStyleSettings *)self setBlur:0.0];
  [(MTLumaDodgePillStyleSettings *)self setBrightness:0.0];

  [(MTLumaDodgePillStyleSettings *)self setSaturation:1.0];
}

+ (id)settingsControllerModule
{
  v27[12] = *MEMORY[0x263EF8340];
  v25 = [MEMORY[0x263F622C0] rowWithTitle:@"+Color: Opacity" valueKeyPath:@"colorAddOpacity"];
  v27[0] = v25;
  v24 = [MEMORY[0x263F62320] rowWithTitle:0 valueKeyPath:@"colorAddOpacity"];
  v23 = [v24 minValue:0.0 maxValue:1.0];
  v27[1] = v23;
  v22 = [MEMORY[0x263F622C0] rowWithTitle:@"Luma+Color Opacity" valueKeyPath:@"lumaMapPlusColorOpacity"];
  v27[2] = v22;
  v21 = [MEMORY[0x263F62320] rowWithTitle:0 valueKeyPath:@"lumaMapPlusColorOpacity"];
  v20 = [v21 minValue:0.0 maxValue:1.0];
  v27[3] = v20;
  v19 = [MEMORY[0x263F622C0] rowWithTitle:@"Overlay-Blend Opacity" valueKeyPath:@"overlayBlendOpacity"];
  v27[4] = v19;
  v18 = [MEMORY[0x263F62320] rowWithTitle:0 valueKeyPath:@"overlayBlendOpacity"];
  v17 = [v18 minValue:0.0 maxValue:1.0];
  v27[5] = v17;
  v2 = [MEMORY[0x263F622C0] rowWithTitle:@"Blur Radius" valueKeyPath:@"blur"];
  v27[6] = v2;
  v3 = [MEMORY[0x263F62320] rowWithTitle:0 valueKeyPath:@"blur"];
  v4 = [v3 minValue:0.0 maxValue:50.0];
  v27[7] = v4;
  v5 = [MEMORY[0x263F622C0] rowWithTitle:@"Brightness" valueKeyPath:@"brightness"];
  v27[8] = v5;
  v6 = [MEMORY[0x263F62320] rowWithTitle:0 valueKeyPath:@"brightness"];
  v7 = [v6 minValue:-10.0 maxValue:10.0];
  v27[9] = v7;
  v8 = [MEMORY[0x263F622C0] rowWithTitle:@"Saturation" valueKeyPath:@"saturation"];
  v27[10] = v8;
  v9 = [MEMORY[0x263F62320] rowWithTitle:0 valueKeyPath:@"saturation"];
  v10 = [v9 minValue:0.0 maxValue:2.0];
  v27[11] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:12];

  v12 = (void *)MEMORY[0x263F622D8];
  v13 = [MEMORY[0x263F622D8] sectionWithRows:v11 title:@"Parameters"];
  v26 = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  v15 = [v12 moduleWithTitle:0 contents:v14];

  return v15;
}

- (void)setColorAddOpacity:(double)a3
{
  self->_colorAddOpacity = a3;
}

- (void)setLumaMapPlusColorOpacity:(double)a3
{
  self->_lumaMapPlusColorOpacity = a3;
}

- (void)setOverlayBlendOpacity:(double)a3
{
  self->_overlayBlendOpacity = a3;
}

- (void)setBlur:(double)a3
{
  self->_blur = a3;
}

- (void)setBrightness:(double)a3
{
  self->_brightness = a3;
}

- (void)setSaturation:(double)a3
{
  self->_saturation = a3;
}

@end