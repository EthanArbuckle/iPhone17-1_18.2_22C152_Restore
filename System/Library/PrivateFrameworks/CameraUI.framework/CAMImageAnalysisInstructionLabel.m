@interface CAMImageAnalysisInstructionLabel
- (CAMImageAnalysisInstructionLabel)initWithFrame:(CGRect)a3;
- (int64_t)instruction;
- (void)_updateText;
- (void)setInstruction:(int64_t)a3;
@end

@implementation CAMImageAnalysisInstructionLabel

- (CAMImageAnalysisInstructionLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMImageAnalysisInstructionLabel;
  v3 = -[CAMInstructionLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CAMImageAnalysisInstructionLabel *)v3 _updateText];
  }
  return v4;
}

- (void)setInstruction:(int64_t)a3
{
  if (self->_instruction != a3)
  {
    self->_instruction = a3;
    [(CAMImageAnalysisInstructionLabel *)self _updateText];
    id v4 = [(CAMInstructionLabel *)self delegate];
    [v4 instructionLabelDidChangeIntrinsicContentSize:self];
  }
}

- (void)_updateText
{
  int64_t v3 = [(CAMImageAnalysisInstructionLabel *)self instruction];
  if (!v3)
  {
    id v4 = @"IMAGE_ANALYSIS_INSTRUCTION_SELECT_TEXT";
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    id v4 = @"IMAGE_ANALYSIS_INSTRUCTION_NO_TEXT_FOUND";
LABEL_5:
    uint64_t v5 = CAMLocalizedFrameworkString(v4, 0);
    goto LABEL_7;
  }
  uint64_t v5 = 0;
LABEL_7:
  id v6 = (id)v5;
  [(CAMInstructionLabel *)self setText:v5];
}

- (int64_t)instruction
{
  return self->_instruction;
}

@end