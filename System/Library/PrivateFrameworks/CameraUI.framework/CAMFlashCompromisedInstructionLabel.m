@interface CAMFlashCompromisedInstructionLabel
+ (BOOL)shouldDisplayInstructionForCompromise:(unint64_t)a3;
+ (id)_textForCompromise:(unint64_t)a3;
- (id)_symbolPrefixName;
- (unint64_t)compromise;
- (void)_updateTextWithPriorCompromise:(unint64_t)a3;
- (void)setCompromise:(unint64_t)a3;
@end

@implementation CAMFlashCompromisedInstructionLabel

- (void)setCompromise:(unint64_t)a3
{
  unint64_t compromise = self->_compromise;
  if (compromise != a3)
  {
    self->_unint64_t compromise = a3;
    [(CAMFlashCompromisedInstructionLabel *)self _updateTextWithPriorCompromise:compromise];
  }
}

+ (BOOL)shouldDisplayInstructionForCompromise:(unint64_t)a3
{
  v3 = [a1 _textForCompromise:a3];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)_updateTextWithPriorCompromise:(unint64_t)a3
{
  objc_msgSend((id)objc_opt_class(), "_textForCompromise:", -[CAMFlashCompromisedInstructionLabel compromise](self, "compromise"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(id)objc_opt_class() _textForCompromise:a3];
  if ([v7 length]) {
    [(CAMInstructionLabel *)self setText:v7];
  }
  if (([v7 isEqualToString:v5] & 1) == 0)
  {
    v6 = [(CAMInstructionLabel *)self delegate];
    [v6 instructionLabelDidChangeIntrinsicContentSize:self];
  }
}

+ (id)_textForCompromise:(unint64_t)a3
{
  if (a3 == 2)
  {
    BOOL v4 = @"FLASH_COMPROMISED_WALLET";
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    BOOL v4 = @"FLASH_COMPROMISED_BATTERY_PACK";
LABEL_5:
    CAMLocalizedFrameworkString(v4, 0);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 0;
  }
  if (!v6) {
    v5 = @"Mitigation suppressed. (Placeholder copy. Do not file radars.)";
  }
  return v5;
}

- (id)_symbolPrefixName
{
  return @"exclamationmark.triangle";
}

- (unint64_t)compromise
{
  return self->_compromise;
}

@end