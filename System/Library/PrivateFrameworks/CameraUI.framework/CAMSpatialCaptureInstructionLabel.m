@interface CAMSpatialCaptureInstructionLabel
- (BOOL)useHoldStillLowLightInstruction;
- (int64_t)stereoCaptureStatus;
- (void)_updateText;
- (void)setStereoCaptureStatus:(int64_t)a3;
- (void)setUseHoldStillLowLightInstruction:(BOOL)a3;
@end

@implementation CAMSpatialCaptureInstructionLabel

- (void)setStereoCaptureStatus:(int64_t)a3
{
  if (self->_stereoCaptureStatus != a3)
  {
    self->_stereoCaptureStatus = a3;
    [(CAMSpatialCaptureInstructionLabel *)self _updateText];
  }
}

- (void)setUseHoldStillLowLightInstruction:(BOOL)a3
{
  if (self->_useHoldStillLowLightInstruction != a3)
  {
    self->_useHoldStillLowLightInstruction = a3;
    [(CAMSpatialCaptureInstructionLabel *)self _updateText];
  }
}

- (void)_updateText
{
  int v3 = [(CAMSpatialCaptureInstructionLabel *)self stereoCaptureStatus];
  if ((~v3 & 3) != 0)
  {
    if ((v3 & 2) != 0)
    {
      v5 = CAMLocalizedFrameworkString(@"SPATIAL_VIDEO_LOW_LIGHT_INSTRUCTION_LABEL", 0);
      if ([(CAMSpatialCaptureInstructionLabel *)self useHoldStillLowLightInstruction])
      {
        uint64_t v6 = CAMLocalizedFrameworkString(@"SPATIAL_LOW_LIGHT_HOLD_STILL_INSTRUCTION_LABEL", 0);

        v5 = (void *)v6;
      }
      goto LABEL_7;
    }
    if ((v3 & 4) == 0) {
      goto LABEL_9;
    }
    v4 = @"SPATIAL_VIDEO_SUBJECT_TOO_CLOSE_INSTRUCTION_LABEL";
  }
  else
  {
    v4 = @"SPATIAL_MORE_LIGHT_REQUIRED_INSTRUCTION_LABEL";
  }
  v5 = CAMLocalizedFrameworkString(v4, 0);
LABEL_7:
  if (v5)
  {
    [(CAMInstructionLabel *)self setText:v5];
  }
LABEL_9:
  id v7 = [(CAMInstructionLabel *)self delegate];
  [v7 instructionLabelDidChangeIntrinsicContentSize:self];
}

- (int64_t)stereoCaptureStatus
{
  return self->_stereoCaptureStatus;
}

- (BOOL)useHoldStillLowLightInstruction
{
  return self->_useHoldStillLowLightInstruction;
}

@end