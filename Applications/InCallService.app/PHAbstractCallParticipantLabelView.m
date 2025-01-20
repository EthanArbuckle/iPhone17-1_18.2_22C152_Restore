@interface PHAbstractCallParticipantLabelView
- (BOOL)hidesLabel;
- (BOOL)showsCallDetailsViewButton;
- (BOOL)showsConferenceParticipantsButton;
- (CNKCallParticipantLabelDescriptorProtocol)labelDescriptor;
- (NSString)participantName;
- (PHAbstractCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3;
- (PHAbstractCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3 delegate:(id)a4;
- (PHCallParticipantLabelDelegate)delegate;
- (UIColor)textColor;
- (UILabel)participantMarqueeLabel;
- (UILabel)statusLabel;
- (double)labelAlphaValueForActivityState:(unsigned __int16)a3;
- (unsigned)activityState;
- (void)setActivityState:(unsigned __int16)a3;
- (void)setDelegate:(id)a3;
- (void)setHidesLabel:(BOOL)a3;
- (void)setParticipantMarqueeLabel:(id)a3;
- (void)setParticipantName:(id)a3;
- (void)setStatusLabel:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation PHAbstractCallParticipantLabelView

- (PHAbstractCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PHAbstractCallParticipantLabelView;
  v6 = -[PHAbstractCallParticipantLabelView initWithFrame:](&v13, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
  {
    v8 = [(PHAbstractCallParticipantLabelView *)v6 layer];
    [v8 setHitTestsAsOpaque:1];

    v7->_activityState = -1;
    objc_storeWeak((id *)&v7->_delegate, v5);
    v9 = (UILabel *)objc_alloc_init((Class)UILabel);
    participantMarqueeLabel = v7->_participantMarqueeLabel;
    v7->_participantMarqueeLabel = v9;

    [(UILabel *)v7->_participantMarqueeLabel setAccessibilityIdentifier:@"PHMarqueeView"];
    v11 = +[UIColor colorWithWhite:1.0 alpha:1.0];
    [(UILabel *)v7->_participantMarqueeLabel setTextColor:v11];

    [(UILabel *)v7->_participantMarqueeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v7->_participantMarqueeLabel setMarqueeEnabled:1];
    [(UILabel *)v7->_participantMarqueeLabel setMarqueeRunning:1];
    [(PHAbstractCallParticipantLabelView *)v7 addSubview:v7->_participantMarqueeLabel];
  }

  return v7;
}

- (PHAbstractCallParticipantLabelView)initWithCallDisplayStyleManager:(id)a3
{
  return [(PHAbstractCallParticipantLabelView *)self initWithCallDisplayStyleManager:a3 delegate:0];
}

- (void)setParticipantName:(id)a3
{
  id v4 = a3;
  if (![(NSString *)self->_participantName isEqualToString:v4])
  {
    id v5 = (NSString *)[v4 copy];
    participantName = self->_participantName;
    self->_participantName = v5;

    v7 = [(PHAbstractCallParticipantLabelView *)self participantMarqueeLabel];
    [v7 setText:v4];

    v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updated participant label with name %@", (uint8_t *)&v9, 0xCu);
    }

    [(PHAbstractCallParticipantLabelView *)self setNeedsLayout];
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PHAbstractCallParticipantLabelView;
  -[PHAbstractCallParticipantLabelView setUserInteractionEnabled:](&v6, "setUserInteractionEnabled:");
  double v5 = 0.5;
  if (v3) {
    double v5 = 1.0;
  }
  [(PHAbstractCallParticipantLabelView *)self setAlpha:v5];
}

- (void)setTextColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    [(UILabel *)self->_participantMarqueeLabel setTextColor:v5];
  }
}

- (double)labelAlphaValueForActivityState:(unsigned __int16)a3
{
  return 1.0;
}

- (UILabel)participantMarqueeLabel
{
  return (UILabel *)objc_getProperty(self, a2, 16, 1);
}

- (void)setParticipantMarqueeLabel:(id)a3
{
}

- (UILabel)statusLabel
{
  return (UILabel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStatusLabel:(id)a3
{
}

- (CNKCallParticipantLabelDescriptorProtocol)labelDescriptor
{
  return self->_labelDescriptor;
}

- (BOOL)hidesLabel
{
  return self->_hidesLabel;
}

- (void)setHidesLabel:(BOOL)a3
{
  self->_hidesLabel = a3;
}

- (BOOL)showsConferenceParticipantsButton
{
  return self->_showsConferenceParticipantsButton;
}

- (BOOL)showsCallDetailsViewButton
{
  return self->_showsCallDetailsViewButton;
}

- (NSString)participantName
{
  return self->_participantName;
}

- (unsigned)activityState
{
  return self->_activityState;
}

- (void)setActivityState:(unsigned __int16)a3
{
  self->_activityState = a3;
}

- (PHCallParticipantLabelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHCallParticipantLabelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_participantName, 0);
  objc_storeStrong((id *)&self->_labelDescriptor, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);

  objc_storeStrong((id *)&self->_participantMarqueeLabel, 0);
}

@end