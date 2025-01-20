@interface CAMLowLightInstructionLabel
- (CAMLowLightInstructionLabel)initWithFrame:(CGRect)a3;
@end

@implementation CAMLowLightInstructionLabel

- (CAMLowLightInstructionLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMLowLightInstructionLabel;
  v3 = -[CAMInstructionLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = CAMLocalizedFrameworkString(@"LOW_LIGHT_INSTRUCTION_HOLD_STILL", 0);
    [(CAMInstructionLabel *)v3 setText:v4];
  }
  return v3;
}

@end