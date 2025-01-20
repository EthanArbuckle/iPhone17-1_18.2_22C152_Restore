@interface CSBatteryFillView
- (CSBatteryFillView)initWithFrame:(CGRect)a3 isInternalBattery:(BOOL)a4 lowBatteryLevel:(int64_t)a5;
- (void)drawRect:(CGRect)a3;
- (void)setBatterySaverModeActive:(BOOL)a3;
- (void)setChargePercentage:(int64_t)a3;
@end

@implementation CSBatteryFillView

- (CSBatteryFillView)initWithFrame:(CGRect)a3 isInternalBattery:(BOOL)a4 lowBatteryLevel:(int64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CSBatteryFillView;
  result = -[CSBatteryFillView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_isInternalBattery = a4;
    result->_lowBatteryLevel = a5;
  }
  return result;
}

- (void)setChargePercentage:(int64_t)a3
{
  self->_chargePercentage = a3;
  [(CSBatteryFillView *)self setNeedsDisplay];
}

- (void)setBatterySaverModeActive:(BOOL)a3
{
  self->_isBatterySaverModeActive = a3;
  [(CSBatteryFillView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_isInternalBattery && self->_isBatterySaverModeActive)
  {
    objc_super v8 = [MEMORY[0x1E4F428B8] systemYellowColor];
  }
  else
  {
    if (self->_chargePercentage <= self->_lowBatteryLevel) {
      [MEMORY[0x1E4F428B8] systemRedColor];
    }
    else {
    objc_super v8 = [MEMORY[0x1E4F428B8] systemGreenColor];
    }
  }
  id v12 = v8;
  [v8 set];
  float v9 = width * (double)self->_chargePercentage / 100.0;
  double v10 = floorf(v9);
  v11 = (id *)MEMORY[0x1E4F43630];
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] != 1 && !self->_isInternalBattery
    || [*v11 userInterfaceLayoutDirection] == 1 && self->_isInternalBattery)
  {
    double x = x + width - v10;
  }
  v14.origin.double x = x;
  v14.origin.CGFloat y = y;
  v14.size.double width = v10;
  v14.size.CGFloat height = height;
  UIRectFill(v14);
}

@end