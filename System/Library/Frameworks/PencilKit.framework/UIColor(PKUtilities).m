@interface UIColor(PKUtilities)
+ (id)pk_doneButtonBackgroundColor;
+ (id)pk_paletteStrokeColor;
+ (id)pk_thicknessButtonBackgroundUseSystemColor:()PKUtilities;
+ (id)pk_thicknessButtonBlackUseSystemColor:()PKUtilities;
+ (id)pk_thicknessButtonLightGrayUseSystemColor:()PKUtilities;
+ (id)pk_thicknessButtonWhiteUseSystemColor:()PKUtilities;
+ (id)pk_toolSampleViewBackgroundColor;
+ (uint64_t)_pk_betaLabelTextColor;
+ (uint64_t)_pk_betaLabelTextEncapsulationColor;
+ (uint64_t)pk_buttonImageColor;
+ (uint64_t)pk_convertColorPickerColor:()PKUtilities fromUserInterfaceStyle:to:;
+ (uint64_t)pk_crosshairViewBorderColor;
+ (uint64_t)pk_crosshairViewShadowColor;
+ (uint64_t)pk_doneButtonTitleColor;
+ (uint64_t)pk_linedPaperLineColor_dark;
+ (uint64_t)pk_linedPaperLineColor_light;
+ (uint64_t)pk_opacityTitleLabel;
+ (uint64_t)pk_opacityValueLabel;
+ (uint64_t)pk_paletteBackgroundColor;
+ (uint64_t)pk_paletteButtonBackgroundColor;
+ (uint64_t)pk_paletteShadowColor;
+ (uint64_t)pk_randomColor;
+ (uint64_t)pk_removeActiveToolButtonColor;
+ (uint64_t)pk_selectedPickerButtonBackgroundColor;
+ (uint64_t)pk_selectedPickerButtonMaskColor;
+ (uint64_t)pk_separatorLineColor;
+ (uint64_t)pk_textInputDeletionPreviewColor;
+ (uint64_t)pk_textInputReserveSpaceColor;
+ (uint64_t)pk_thicknessButtonBlack;
+ (uint64_t)pk_thicknessButtonLightGray;
+ (uint64_t)pk_thicknessButtonWhite;
+ (uint64_t)pk_toolDockMaskColor;
+ (uint64_t)pk_toolTintColor;
@end

@implementation UIColor(PKUtilities)

+ (uint64_t)pk_paletteButtonBackgroundColor
{
  return [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
}

+ (uint64_t)pk_paletteBackgroundColor
{
  return [MEMORY[0x1E4FB1618] systemBackgroundColor];
}

+ (uint64_t)pk_buttonImageColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (id)pk_paletteStrokeColor
{
  v0 = (void *)MEMORY[0x1E4FB1618];
  v1 = PencilKitBundle();
  v2 = [v0 colorNamed:@"paletteStrokeColor" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (uint64_t)pk_paletteShadowColor
{
  return [MEMORY[0x1E4FB1618] systemBlackColor];
}

+ (uint64_t)pk_opacityTitleLabel
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (uint64_t)pk_opacityValueLabel
{
  return [MEMORY[0x1E4FB1618] lightGrayColor];
}

+ (uint64_t)pk_selectedPickerButtonBackgroundColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (uint64_t)pk_selectedPickerButtonMaskColor
{
  return [MEMORY[0x1E4FB1618] systemBackgroundColor];
}

+ (uint64_t)pk_thicknessButtonLightGray
{
  return objc_msgSend(a1, "pk_thicknessButtonLightGrayUseSystemColor:", 1);
}

+ (id)pk_thicknessButtonLightGrayUseSystemColor:()PKUtilities
{
  if (a3) {
    [MEMORY[0x1E4FB1618] systemLightGrayColor];
  }
  else {
  v3 = [MEMORY[0x1E4FB1618] lightGrayColor];
  }

  return v3;
}

+ (uint64_t)pk_thicknessButtonBlack
{
  return objc_msgSend(a1, "pk_thicknessButtonBlackUseSystemColor:", 1);
}

+ (id)pk_thicknessButtonBlackUseSystemColor:()PKUtilities
{
  if (a3) {
    [MEMORY[0x1E4FB1618] labelColor];
  }
  else {
  v3 = [MEMORY[0x1E4FB1618] systemLightMidGrayColor];
  }

  return v3;
}

+ (uint64_t)pk_thicknessButtonWhite
{
  return objc_msgSend(a1, "pk_thicknessButtonWhiteUseSystemColor:", 1);
}

+ (id)pk_thicknessButtonWhiteUseSystemColor:()PKUtilities
{
  if (a3) {
    [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  else {
  v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }

  return v3;
}

+ (id)pk_thicknessButtonBackgroundUseSystemColor:()PKUtilities
{
  if (a3) {
    [MEMORY[0x1E4FB1618] labelColor];
  }
  else {
  v3 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
  }

  return v3;
}

+ (uint64_t)pk_crosshairViewBorderColor
{
  return [MEMORY[0x1E4FB1618] systemBackgroundColor];
}

+ (uint64_t)pk_crosshairViewShadowColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (uint64_t)pk_toolDockMaskColor
{
  return [MEMORY[0x1E4FB1618] systemBackgroundColor];
}

+ (uint64_t)pk_toolTintColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (uint64_t)pk_separatorLineColor
{
  return [MEMORY[0x1E4FB1618] separatorColor];
}

+ (uint64_t)pk_doneButtonTitleColor
{
  return [MEMORY[0x1E4FB1618] labelColor];
}

+ (id)pk_doneButtonBackgroundColor
{
  v0 = (void *)MEMORY[0x1E4FB1618];
  v1 = PencilKitBundle();
  v2 = [v0 colorNamed:@"doneButtonBackgroundColor" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (id)pk_toolSampleViewBackgroundColor
{
  v0 = (void *)MEMORY[0x1E4FB1618];
  v1 = PencilKitBundle();
  v2 = [v0 colorNamed:@"toolSampleViewBackgroundColor" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (uint64_t)pk_removeActiveToolButtonColor
{
  return [MEMORY[0x1E4FB1618] quaternaryLabelColor];
}

+ (uint64_t)pk_linedPaperLineColor_dark
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:0.23 alpha:1.0];
}

+ (uint64_t)pk_linedPaperLineColor_light
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:0.8 alpha:1.0];
}

+ (uint64_t)pk_textInputDeletionPreviewColor
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:0.2];
}

+ (uint64_t)pk_textInputReserveSpaceColor
{
  return [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:0.2];
}

+ (uint64_t)pk_convertColorPickerColor:()PKUtilities fromUserInterfaceStyle:to:
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "_convertColorPickerColor:fromUserInterfaceStyle:to:");
}

+ (uint64_t)pk_randomColor
{
  double v0 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v1 = (double)arc4random_uniform(0xFFu) / 255.0;
  double v2 = (double)arc4random_uniform(0xFFu) / 255.0;
  v3 = (void *)MEMORY[0x1E4FB1618];

  return [v3 colorWithRed:v0 green:v1 blue:v2 alpha:1.0];
}

+ (uint64_t)_pk_betaLabelTextColor
{
  return [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_14_0];
}

+ (uint64_t)_pk_betaLabelTextEncapsulationColor
{
  return [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_16];
}

@end