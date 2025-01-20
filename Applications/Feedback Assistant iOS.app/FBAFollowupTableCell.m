@interface FBAFollowupTableCell
- (UILabel)promptLabel;
- (UILabel)responseLabel;
- (void)setPromptLabel:(id)a3;
- (void)setResponseLabel:(id)a3;
@end

@implementation FBAFollowupTableCell

- (UILabel)promptLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_promptLabel);

  return (UILabel *)WeakRetained;
}

- (void)setPromptLabel:(id)a3
{
}

- (UILabel)responseLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responseLabel);

  return (UILabel *)WeakRetained;
}

- (void)setResponseLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_responseLabel);

  objc_destroyWeak((id *)&self->_promptLabel);
}

@end