@interface CAMMaxRecordingTimeInstructionLabel
- (CAMMaxRecordingTimeInstructionLabel)initWithFrame:(CGRect)a3;
- (NSDateComponentsFormatter)_dateComponentsFormatter;
- (UIEdgeInsets)_textInsets;
- (double)remainingTimeInSeconds;
- (void)_updateText;
- (void)setRemainingTimeInSeconds:(double)a3;
- (void)set_dateComponentsFormatter:(id)a3;
@end

@implementation CAMMaxRecordingTimeInstructionLabel

- (CAMMaxRecordingTimeInstructionLabel)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMMaxRecordingTimeInstructionLabel;
  v3 = -[CAMInstructionLabel initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x263F08780]);
    dateComponentsFormatter = v3->__dateComponentsFormatter;
    v3->__dateComponentsFormatter = v4;

    [(NSDateComponentsFormatter *)v3->__dateComponentsFormatter setAllowedUnits:64];
    [(NSDateComponentsFormatter *)v3->__dateComponentsFormatter setZeroFormattingBehavior:14];
    [(NSDateComponentsFormatter *)v3->__dateComponentsFormatter setUnitsStyle:2];
    [(CAMMaxRecordingTimeInstructionLabel *)v3 _updateText];
  }
  return v3;
}

- (void)setRemainingTimeInSeconds:(double)a3
{
  if (self->_remainingTimeInSeconds != a3)
  {
    self->_remainingTimeInSeconds = a3;
    [(CAMMaxRecordingTimeInstructionLabel *)self _updateText];
    id v4 = [(CAMInstructionLabel *)self delegate];
    [v4 instructionLabelDidChangeIntrinsicContentSize:self];
  }
}

- (void)_updateText
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(CAMMaxRecordingTimeInstructionLabel *)self remainingTimeInSeconds];
  double v4 = (double)(60 * ((int)v3 / 60));
  v5 = [(CAMMaxRecordingTimeInstructionLabel *)self _dateComponentsFormatter];
  v6 = [v5 stringFromTimeInterval:v4];

  objc_super v7 = CAMLocalizedFrameworkString(@"MAX_RECORDING_TIME", 0);
  v8 = [NSString stringWithValidatedFormat:v7, @"%@", 0, v6 validFormatSpecifiers error];
  v9 = [(CAMInstructionLabel *)self text];
  char v10 = [v9 isEqualToString:v8];

  if ((v10 & 1) == 0)
  {
    v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Updating max recording time: %{public}@", buf, 0xCu);
    }
  }
  [(CAMInstructionLabel *)self setText:v8];
}

- (UIEdgeInsets)_textInsets
{
  double v2 = CAMPixelWidthForView(self);
  double v3 = v2 * 2.0 + 2.0;
  double v4 = 5.0;
  double v5 = 5.0;
  double v6 = v2 + 2.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v6;
  return result;
}

- (double)remainingTimeInSeconds
{
  return self->_remainingTimeInSeconds;
}

- (NSDateComponentsFormatter)_dateComponentsFormatter
{
  return self->__dateComponentsFormatter;
}

- (void)set_dateComponentsFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end