@interface AMUIBatteryChargingUIConfiguration
+ (id)defaultConfiguration;
- (AMUIBatteryChargingUIConfiguration)initWithRingDiameter:(double)a3 lineWidth:(double)a4 boltSize:(CGSize)a5 chargingTextFontSize:(double)a6;
- (BOOL)staticViewNeeded;
- (CGSize)boltSize;
- (double)chargingTextFontSize;
- (double)lineWidth;
- (double)ringDiameter;
- (void)setBoltSize:(CGSize)a3;
- (void)setLineWidth:(double)a3;
- (void)setRingDiameter:(double)a3;
@end

@implementation AMUIBatteryChargingUIConfiguration

+ (id)defaultConfiguration
{
  if (defaultConfiguration_onceToken != -1) {
    dispatch_once(&defaultConfiguration_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)defaultConfiguration___defaultConfiguration;

  return v2;
}

uint64_t __58__AMUIBatteryChargingUIConfiguration_defaultConfiguration__block_invoke()
{
  v0 = -[AMUIBatteryChargingUIConfiguration initWithRingDiameter:lineWidth:boltSize:chargingTextFontSize:]([AMUIBatteryChargingUIConfiguration alloc], "initWithRingDiameter:lineWidth:boltSize:chargingTextFontSize:", 70.0, 7.0, 42.3333, 63.6666, 26.3333);
  uint64_t v1 = defaultConfiguration___defaultConfiguration;
  defaultConfiguration___defaultConfiguration = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (AMUIBatteryChargingUIConfiguration)initWithRingDiameter:(double)a3 lineWidth:(double)a4 boltSize:(CGSize)a5 chargingTextFontSize:(double)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  v12.receiver = self;
  v12.super_class = (Class)AMUIBatteryChargingUIConfiguration;
  result = [(AMUIBatteryChargingUIConfiguration *)&v12 init];
  if (result)
  {
    result->_ringDiameter = a3;
    result->_lineWidth = a4;
    result->_boltSize.CGFloat width = width;
    result->_boltSize.CGFloat height = height;
    result->_chargingTextFontSize = a6;
  }
  return result;
}

- (double)ringDiameter
{
  return self->_ringDiameter;
}

- (void)setRingDiameter:(double)a3
{
  self->_ringDiameter = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (CGSize)boltSize
{
  double width = self->_boltSize.width;
  double height = self->_boltSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBoltSize:(CGSize)a3
{
  self->_boltSize = a3;
}

- (double)chargingTextFontSize
{
  return self->_chargingTextFontSize;
}

- (BOOL)staticViewNeeded
{
  return self->_staticViewNeeded;
}

@end