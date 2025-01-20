@interface NTKNumeralsAnalogFaceConfiguration
- (BOOL)areAllComplicationsOff;
- (CLKDevice)device;
- (NTKFaceColorPalette)faceColorPalette;
- (NTKNumeralsAnalogFaceConfiguration)initWithFaceColorPalette:(id)a3 colorSchemeUnits:(unint64_t)a4 areAllComplicationsOff:(BOOL)a5 utilitySlot:(int64_t)a6 selectedStyle:(unint64_t)a7 forDevice:(id)a8;
- (int64_t)utilitySlot;
- (unint64_t)colorSchemeUnits;
- (unint64_t)selectedStyle;
@end

@implementation NTKNumeralsAnalogFaceConfiguration

- (NTKNumeralsAnalogFaceConfiguration)initWithFaceColorPalette:(id)a3 colorSchemeUnits:(unint64_t)a4 areAllComplicationsOff:(BOOL)a5 utilitySlot:(int64_t)a6 selectedStyle:(unint64_t)a7 forDevice:(id)a8
{
  id v15 = a3;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)NTKNumeralsAnalogFaceConfiguration;
  v17 = [(NTKNumeralsAnalogFaceConfiguration *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_faceColorPalette, a3);
    v18->_areAllComplicationsOff = a5;
    v18->_selectedStyle = a7;
    v18->_utilitySlot = a6;
    v18->_colorSchemeUnits = a4;
    objc_storeStrong((id *)&v18->_device, a8);
  }

  return v18;
}

- (NTKFaceColorPalette)faceColorPalette
{
  return self->_faceColorPalette;
}

- (unint64_t)colorSchemeUnits
{
  return self->_colorSchemeUnits;
}

- (unint64_t)selectedStyle
{
  return self->_selectedStyle;
}

- (BOOL)areAllComplicationsOff
{
  return self->_areAllComplicationsOff;
}

- (int64_t)utilitySlot
{
  return self->_utilitySlot;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_faceColorPalette, 0);
}

@end