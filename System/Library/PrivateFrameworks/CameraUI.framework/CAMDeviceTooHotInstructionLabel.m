@interface CAMDeviceTooHotInstructionLabel
- (CAMDeviceTooHotInstructionLabel)initWithFrame:(CGRect)a3;
@end

@implementation CAMDeviceTooHotInstructionLabel

- (CAMDeviceTooHotInstructionLabel)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CAMDeviceTooHotInstructionLabel;
  v3 = -[CAMInstructionLabel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = NSString;
    v5 = [MEMORY[0x263F82670] currentDevice];
    v6 = [v5 model];
    v7 = [v4 stringWithFormat:@"DEVICE_TOO_HOT_%@", v6];

    v8 = CAMLocalizedFrameworkString(v7, 0);
    [(CAMInstructionLabel *)v3 setText:v8];
  }
  return v3;
}

@end