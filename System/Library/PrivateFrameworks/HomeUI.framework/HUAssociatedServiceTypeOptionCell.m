@interface HUAssociatedServiceTypeOptionCell
- (BOOL)isChecked;
- (BOOL)isDisabled;
- (BOOL)isSuggestion;
- (id)colorForCurrentState;
- (void)prepareForReuse;
- (void)setChecked:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setSuggestion:(BOOL)a3;
@end

@implementation HUAssociatedServiceTypeOptionCell

- (void)prepareForReuse
{
  [(HUAssociatedServiceTypeOptionCell *)self setChecked:0];
  [(HUAssociatedServiceTypeOptionCell *)self setSuggestion:0];
  v3.receiver = self;
  v3.super_class = (Class)HUAssociatedServiceTypeOptionCell;
  [(HUAssociatedServiceTypeOptionCell *)&v3 prepareForReuse];
}

- (void)setChecked:(BOOL)a3
{
  self->_checked = a3;
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  [(HUAssociatedServiceTypeOptionCell *)self setAccessoryType:v3];
}

- (void)setSuggestion:(BOOL)a3
{
  self->_suggestion = a3;
  id v5 = [(HUAssociatedServiceTypeOptionCell *)self colorForCurrentState];
  v4 = [(HUAssociatedServiceTypeOptionCell *)self textLabel];
  [v4 setTextColor:v5];
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  id v5 = [(HUAssociatedServiceTypeOptionCell *)self colorForCurrentState];
  v4 = [(HUAssociatedServiceTypeOptionCell *)self textLabel];
  [v4 setTextColor:v5];
}

- (id)colorForCurrentState
{
  if ([(HUAssociatedServiceTypeOptionCell *)self isDisabled]
    || [(HUAssociatedServiceTypeOptionCell *)self isSuggestion])
  {
    uint64_t v3 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F428B8] labelColor];
  }

  return v3;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (BOOL)isSuggestion
{
  return self->_suggestion;
}

@end