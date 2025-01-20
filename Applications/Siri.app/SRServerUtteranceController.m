@interface SRServerUtteranceController
- (BOOL)_shouldSkipAnimationsInAlternateSpeeds;
- (double)_extendedTopPadding;
- (double)_insertionAnimatedZPosition;
- (double)_scaledTopPadding;
- (double)baselineOffsetFromBottom;
- (double)desiredHeightForWidth:(double)a3;
- (id)description;
- (int64_t)_insertionAnimation;
- (int64_t)_pinAnimationType;
- (int64_t)_replacementAnimation;
- (void)_loadFromObject:(id)a3;
- (void)loadView;
- (void)setAceObject:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SRServerUtteranceController

- (void)setAceObject:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRServerUtteranceController;
  id v4 = a3;
  [(SRServerUtteranceController *)&v6 setAceObject:v4];
  -[SRServerUtteranceController _loadFromObject:](self, "_loadFromObject:", v4, v6.receiver, v6.super_class);

  utteranceView = self->_utteranceView;
  if (utteranceView) {
    [(SRServerUtteranceView *)utteranceView setText:self->_utterance];
  }
}

- (void)_loadFromObject:(id)a3
{
  id v4 = a3;
  v5 = [v4 text];
  objc_super v6 = [v4 context];
  v7 = +[AFUIUtilities parsedUtteranceFromText:v5 context:v6];

  v8 = (NSString *)[v7 copy];
  utterance = self->_utterance;
  self->_utterance = v8;

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  self->_isTip = isKindOfClass & 1;
  if (isKindOfClass)
  {
    v11 = [v4 tipPrefix];
    utterancePrefix = self->_utterancePrefix;
    self->_utterancePrefix = v11;
  }
  v13 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = [v4 dialogIdentifier];
    v16 = [v4 text];
    int v17 = 136315650;
    v18 = "-[SRServerUtteranceController _loadFromObject:]";
    __int16 v19 = 2112;
    v20 = v15;
    __int16 v21 = 2112;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s dialogIdentifier:%@ utterance:%@", (uint8_t *)&v17, 0x20u);
  }
}

- (void)loadView
{
  if (self->_utteranceView) {
    return;
  }
  BOOL isTip = self->_isTip;
  id v4 = -[SRServerUtteranceView initWithFrame:]([SRServerUtteranceView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  utteranceView = self->_utteranceView;
  self->_utteranceView = v4;

  objc_super v6 = self->_utteranceView;
  if (!isTip)
  {
    v12 = +[UIFont siriui_serverUtteranceFont];
    [(SRServerUtteranceView *)v6 setFont:v12];

    [(SRServerUtteranceView *)self->_utteranceView setBlendEffectEnabled:0];
LABEL_7:
    [(SRServerUtteranceView *)self->_utteranceView setText:self->_utterance];
    goto LABEL_8;
  }
  [(SRServerUtteranceView *)self->_utteranceView setBlendEffectEnabled:1];
  if (![(NSString *)self->_utterancePrefix length])
  {
    v13 = self->_utteranceView;
    v14 = +[UIFont siriui_serverTipFont];
    [(SRServerUtteranceView *)v13 setFont:v14];

    goto LABEL_7;
  }
  id v7 = objc_alloc((Class)NSMutableAttributedString);
  v8 = [(NSString *)self->_utterancePrefix stringByAppendingString:self->_utterance];
  id v9 = [v7 initWithString:v8];

  v10 = +[UIFont siriui_serverTipPrefixFont];
  [v9 addAttribute:NSFontAttributeName value:v10 range:0 -[NSString length](self->_utterancePrefix, "length")];

  v11 = +[UIFont siriui_serverTipFont];
  [v9 addAttribute:NSFontAttributeName value:v11 range:[self->_utterancePrefix length] [self->_utterance length]];

  [(SRServerUtteranceView *)self->_utteranceView setAttributedText:v9];
LABEL_8:
  v15 = self->_utteranceView;

  [(SRServerUtteranceController *)self setView:v15];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SRServerUtteranceController;
  [(SRServerUtteranceController *)&v8 viewDidAppear:a3];
  if (![(SRServerUtteranceView *)self->_utteranceView chevronHasBeenShown])
  {
    id v4 = [(SRServerUtteranceController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      objc_super v6 = [(SRServerUtteranceController *)self delegate];
      unsigned int v7 = [v6 shouldEnableInteractionForSiriViewController:self];

      if (v7) {
        [(SRServerUtteranceController *)self setUtteranceUserInteractionEnabled:1];
      }
    }
  }
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)SRServerUtteranceController;
  v3 = [(SRServerUtteranceController *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@", %@", self->_utterance];

  return v4;
}

- (double)desiredHeightForWidth:(double)a3
{
  id v4 = [(SRServerUtteranceController *)self view];
  [v4 sizeThatFits:a3];
  double v6 = v5;

  return v6;
}

- (double)baselineOffsetFromBottom
{
  [(SRServerUtteranceView *)self->_utteranceView baselineOffsetFromBottom];
  return result;
}

- (double)_extendedTopPadding
{
  if (self->_isTip)
  {
    *(double *)&uint64_t v2 = 56.0;
LABEL_5:
    double v3 = *(double *)&v2;
    goto LABEL_9;
  }
  if (SiriUIIsCompactWidth())
  {
    *(double *)&uint64_t v2 = 62.0;
    goto LABEL_5;
  }
  if (SiriUIIsCompactHeight()) {
    double v3 = 62.0;
  }
  else {
    double v3 = 94.0;
  }
LABEL_9:
  id v4 = +[UIFont siriui_serverUtteranceFont];
  [v4 _scaledValueForValue:v3];
  double v6 = v5;

  return v6;
}

- (double)_scaledTopPadding
{
  uint64_t v2 = +[UIFont siriui_serverUtteranceFont];
  [v2 _scaledValueForValue:42.0];
  double v4 = v3;

  return v4;
}

- (BOOL)_shouldSkipAnimationsInAlternateSpeeds
{
  return 1;
}

- (int64_t)_pinAnimationType
{
  return 2;
}

- (int64_t)_insertionAnimation
{
  return 1;
}

- (int64_t)_replacementAnimation
{
  return 2;
}

- (double)_insertionAnimatedZPosition
{
  +[SRServerUtteranceView insertionAnimatedZPosition];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterancePrefix, 0);
  objc_storeStrong((id *)&self->_utterance, 0);

  objc_storeStrong((id *)&self->_utteranceView, 0);
}

@end