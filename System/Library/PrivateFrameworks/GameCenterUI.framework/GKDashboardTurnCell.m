@interface GKDashboardTurnCell
+ (CGSize)defaultSize;
- (BOOL)wantsLocalPlayerAction:(id)a3;
- (NSLayoutConstraint)dateToNameConstraint;
- (NSLayoutConstraint)turnToNameConstraint;
- (UIColor)dateColor;
- (UIColor)turnColor;
- (UIImageView)actionIndicatorView;
- (UILabel)dateLabel;
- (UILabel)turnLabel;
- (double)dateToNameConstant;
- (double)turnToNameConstant;
- (int64_t)displayIndex;
- (void)awakeFromNib;
- (void)configureForMatch:(id)a3;
- (void)configureForParticipant:(id)a3 inMatch:(id)a4;
- (void)setActionIndicatorView:(id)a3;
- (void)setDateColor:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setDateToNameConstant:(double)a3;
- (void)setDateToNameConstraint:(id)a3;
- (void)setDisplayIndex:(int64_t)a3;
- (void)setOnDarkBackground:(BOOL)a3;
- (void)setTurnColor:(id)a3;
- (void)setTurnLabel:(id)a3;
- (void)setTurnToNameConstant:(double)a3;
- (void)setTurnToNameConstraint:(id)a3;
@end

@implementation GKDashboardTurnCell

- (void)awakeFromNib
{
  v10.receiver = self;
  v10.super_class = (Class)GKDashboardTurnCell;
  [(GKDashboardPlayerCell *)&v10 awakeFromNib];
  v3 = [(UILabel *)self->_dateLabel textColor];
  [(GKDashboardTurnCell *)self setDateColor:v3];

  v4 = [(UILabel *)self->_turnLabel textColor];
  [(GKDashboardTurnCell *)self setTurnColor:v4];

  [(NSLayoutConstraint *)self->_dateToNameConstraint constant];
  -[GKDashboardTurnCell setDateToNameConstant:](self, "setDateToNameConstant:");
  [(NSLayoutConstraint *)self->_turnToNameConstraint constant];
  -[GKDashboardTurnCell setTurnToNameConstant:](self, "setTurnToNameConstant:");
  v5 = [MEMORY[0x1E4F63A10] sharedTheme];
  v6 = [v5 statusDotImage];
  [(UIImageView *)self->_actionIndicatorView setImage:v6];

  [(UIImageView *)self->_actionIndicatorView setHidden:1];
  uint64_t v7 = *MEMORY[0x1E4F3A2E8];
  v8 = [(GKDashboardTurnCell *)self turnLabel];
  v9 = [v8 layer];
  [v9 setCompositingFilter:v7];
}

+ (CGSize)defaultSize
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___GKDashboardTurnCell;
  objc_msgSendSuper2(&v4, sel_defaultSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)wantsLocalPlayerAction:(id)a3
{
  int v3 = [a3 state];
  return v3 == 2 || (v3 & 0xFFFFFFFD) == 1;
}

- (void)configureForMatch:(id)a3
{
  id v26 = a3;
  if ([v26 status] == 2)
  {
    objc_super v4 = [v26 firstWinnerOrTiedOrLastLoser];
    v5 = [v4 player];

    if ([v5 isLocalPlayer])
    {
      v6 = [v26 playingWithParticipantOrFirstKnownPlayer];
      uint64_t v7 = [v6 player];

      v5 = (void *)v7;
    }
  }
  else
  {
    v8 = [v26 currentParticipant];
    v5 = [v8 player];

    if (!v5)
    {
      v5 = [MEMORY[0x1E4F63788] automatchPlayer];
    }
  }
  [(GKDashboardPlayerCell *)self setPlayer:v5];
  v9 = [v26 lastTurnDate];
  if (!v9)
  {
    v9 = [v26 creationDate];
  }
  objc_super v10 = [v9 _gkFormattedWhenStringWithOptions:0];
  switch([v26 state])
  {
    case 1u:
      v15 = [v26 currentParticipant];
      v14 = [v15 inviteMessage];

      if (![v14 length]) {
        goto LABEL_18;
      }
      goto LABEL_23;
    case 2u:
      v16 = [v26 activeExchanges];
      v17 = [v16 lastObject];
      v14 = [v17 message];
      if (![v14 length])
      {
        v18 = GKGameCenterUIFrameworkBundle();
        uint64_t v19 = GKGetLocalizedStringFromTableInBundle();

        v14 = (void *)v19;
      }
      goto LABEL_21;
    case 3u:
      goto LABEL_19;
    case 4u:
    case 6u:
      v11 = [(GKDashboardPlayerCell *)self player];

      if (v11
        && ([(GKDashboardPlayerCell *)self player],
            v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = [v12 isAutomatchPlayer],
            v12,
            !v13))
      {
        v23 = NSString;
        v16 = GKGameCenterUIFrameworkBundle();
        v17 = GKGetLocalizedStringFromTableInBundle();
        v24 = [(GKDashboardPlayerCell *)self player];
        v25 = [v24 displayNameWithOptions:1];
        v14 = objc_msgSend(v23, "stringWithFormat:", v17, v25);

LABEL_21:
      }
      else
      {
LABEL_19:
        v16 = GKGameCenterUIFrameworkBundle();
        v14 = GKGetLocalizedStringFromTableInBundle();
      }
      goto LABEL_22;
    case 5u:
      v20 = [v26 localPlayerParticipant];
      v21 = [v26 participants];
      v14 = objc_msgSend(v20, "matchOutcomeStringForLocalPlayer:", objc_msgSend(v21, "count"));

      if ([v14 length]) {
        goto LABEL_23;
      }
LABEL_18:
      v16 = GKGameCenterUIFrameworkBundle();
      uint64_t v22 = GKGetLocalizedStringFromTableInBundle();

      v14 = (void *)v22;
LABEL_22:

LABEL_23:
      [(UILabel *)self->_dateLabel setText:v10];
      [(UILabel *)self->_turnLabel setText:v14];
      [(UIImageView *)self->_actionIndicatorView setHidden:[(GKDashboardTurnCell *)self wantsLocalPlayerAction:v26] ^ 1];

      return;
    default:
      v14 = 0;
      goto LABEL_23;
  }
}

- (void)configureForParticipant:(id)a3 inMatch:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v7 = [v23 player];
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F63788] automatchPlayer];
    v8 = [v7 internal];
    objc_msgSend(v8, "setAutomatchPosition:", -[GKDashboardTurnCell displayIndex](self, "displayIndex"));
  }
  [(GKDashboardPlayerCell *)self setPlayer:v7];
  v9 = [v23 lastTurnDate];
  objc_super v10 = [v9 _gkFormattedWhenStringWithOptions:0];
  id v11 = [v6 currentParticipant];

  if (v11 == v23)
  {
    int v13 = [v6 localPlayerParticipant];
    v14 = GKGameCenterUIFrameworkBundle();
    GKGetLocalizedStringFromTableInBundle();
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = &stru_1F07B2408;
  }
  if (![(__CFString *)v12 length])
  {
    if ([v23 status] == 5)
    {
      v15 = [v6 participants];
      uint64_t v16 = objc_msgSend(v23, "matchOutcomeString:", -[__CFString count](v15, "count"));

      v12 = v15;
    }
    else
    {
      uint64_t v16 = [v23 matchStatusString];
    }

    v12 = (__CFString *)v16;
  }
  [(UILabel *)self->_dateLabel setText:v10];
  [(UILabel *)self->_turnLabel setText:v12];
  v17 = [(UILabel *)self->_dateLabel text];
  uint64_t v18 = [v17 length];

  double turnToNameConstant = 0.0;
  double dateToNameConstant = 0.0;
  if (v18) {
    double dateToNameConstant = self->_dateToNameConstant;
  }
  [(NSLayoutConstraint *)self->_dateToNameConstraint setConstant:dateToNameConstant];
  v21 = [(UILabel *)self->_turnLabel text];
  uint64_t v22 = [v21 length];

  if (v22) {
    double turnToNameConstant = self->_turnToNameConstant;
  }
  [(NSLayoutConstraint *)self->_turnToNameConstraint setConstant:turnToNameConstant];
}

- (void)setOnDarkBackground:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKDashboardTurnCell;
  -[GKDashboardPlayerCell setOnDarkBackground:](&v7, sel_setOnDarkBackground_);
  if (a3)
  {
    v5 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)self->_dateLabel setTextColor:v5];

    id v6 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)self->_turnLabel setTextColor:v6];
  }
  else
  {
    [(UILabel *)self->_dateLabel setTextColor:self->_dateColor];
    [(UILabel *)self->_turnLabel setTextColor:self->_turnColor];
  }
}

- (int64_t)displayIndex
{
  return self->_displayIndex;
}

- (void)setDisplayIndex:(int64_t)a3
{
  self->_displayIndex = a3;
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  self->_dateLabel = (UILabel *)a3;
}

- (UILabel)turnLabel
{
  return self->_turnLabel;
}

- (void)setTurnLabel:(id)a3
{
  self->_turnLabel = (UILabel *)a3;
}

- (UIImageView)actionIndicatorView
{
  return self->_actionIndicatorView;
}

- (void)setActionIndicatorView:(id)a3
{
  self->_actionIndicatorView = (UIImageView *)a3;
}

- (NSLayoutConstraint)dateToNameConstraint
{
  return self->_dateToNameConstraint;
}

- (void)setDateToNameConstraint:(id)a3
{
  self->_dateToNameConstraint = (NSLayoutConstraint *)a3;
}

- (NSLayoutConstraint)turnToNameConstraint
{
  return self->_turnToNameConstraint;
}

- (void)setTurnToNameConstraint:(id)a3
{
  self->_turnToNameConstraint = (NSLayoutConstraint *)a3;
}

- (UIColor)dateColor
{
  return self->_dateColor;
}

- (void)setDateColor:(id)a3
{
}

- (UIColor)turnColor
{
  return self->_turnColor;
}

- (void)setTurnColor:(id)a3
{
}

- (double)dateToNameConstant
{
  return self->_dateToNameConstant;
}

- (void)setDateToNameConstant:(double)a3
{
  self->_double dateToNameConstant = a3;
}

- (double)turnToNameConstant
{
  return self->_turnToNameConstant;
}

- (void)setTurnToNameConstant:(double)a3
{
  self->_double turnToNameConstant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnColor, 0);

  objc_storeStrong((id *)&self->_dateColor, 0);
}

@end