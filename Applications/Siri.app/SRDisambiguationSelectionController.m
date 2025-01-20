@interface SRDisambiguationSelectionController
- (double)baselineOffsetFromBottom;
- (double)desiredHeightForWidth:(double)a3;
- (int64_t)_pinAnimationType;
- (void)loadView;
@end

@implementation SRDisambiguationSelectionController

- (void)loadView
{
  v7 = -[SRUserUtteranceView initWithFrame:]([SRUserUtteranceView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = [(SRDisambiguationSelectionController *)self aceObject];
  v4 = [v3 selectionResponse];

  if (!v4)
  {
    v5 = [(SRDisambiguationSelectionController *)self aceObject];
    v4 = [v5 selectionText];

    if (!v4)
    {
      v6 = [(SRDisambiguationSelectionController *)self aceObject];
      v4 = [v6 title];
    }
  }
  [(SRUserUtteranceView *)v7 setText:v4];
  [(SRUserUtteranceView *)v7 setEditable:0];
  [(SRUserUtteranceView *)v7 setBlendEffectEnabled:1];
  [(SRDisambiguationSelectionController *)self setView:v7];
}

- (double)desiredHeightForWidth:(double)a3
{
  v4 = [(SRDisambiguationSelectionController *)self view];
  [v4 sizeThatFits:a3, 1.79769313e308];
  double v6 = v5;

  return v6;
}

- (double)baselineOffsetFromBottom
{
  v2 = [(SRDisambiguationSelectionController *)self view];
  [v2 baselineOffsetFromBottom];
  double v4 = v3;

  return v4;
}

- (int64_t)_pinAnimationType
{
  return 1;
}

@end