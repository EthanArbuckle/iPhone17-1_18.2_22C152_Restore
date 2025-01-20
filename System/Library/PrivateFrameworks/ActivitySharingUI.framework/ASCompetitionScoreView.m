@interface ASCompetitionScoreView
+ (double)preferredHeightForConfiguration:(id)a3 friend:(id)a4;
- (ASCompetitionScoreView)initWithConfiguration:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)lastBaselineY;
- (double)participantScoreViewWidthForParticipant:(int64_t)a3 maximumWidth:(double)a4;
- (void)layoutForWidth:(double)a3;
- (void)layoutSubviews;
- (void)setFriend:(id)a3 competition:(id)a4;
@end

@implementation ASCompetitionScoreView

- (ASCompetitionScoreView)initWithConfiguration:(id)a3
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ASCompetitionScoreView;
  double v7 = *MEMORY[0x263F001A8];
  double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
  v11 = -[ASCompetitionScoreView initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x263F001A8], v8, v9, v10);
  v12 = v11;
  if (!v11) {
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v11->_configuration, a3);
  v12->_isRTLLayout = [MEMORY[0x263F82E00] userInterfaceLayoutDirectionForSemanticContentAttribute:0] == 1;
  v13 = [[ASCompetitionParticipantScoreView alloc] initWithConfiguration:v6];
  myScoreView = v12->_myScoreView;
  v12->_myScoreView = v13;

  [(ASCompetitionScoreView *)v12 addSubview:v12->_myScoreView];
  v15 = [[ASCompetitionParticipantScoreView alloc] initWithConfiguration:v6];
  opponentScoreView = v12->_opponentScoreView;
  v12->_opponentScoreView = v15;

  [(ASCompetitionScoreView *)v12 addSubview:v12->_opponentScoreView];
  if ([v6 showsScoreTypeHeader])
  {
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v7, v8, v9, v10);
    scoreTypeHeaderLabel = v12->_scoreTypeHeaderLabel;
    v12->_scoreTypeHeaderLabel = (UILabel *)v17;

    v19 = [v6 headerFont];
    [(UILabel *)v12->_scoreTypeHeaderLabel setFont:v19];

    uint64_t v20 = [v6 primaryScoreSource];
    if (v20 == 2)
    {
      v21 = ActivitySharingBundle();
      v22 = v21;
      v23 = @"COMPETITION_TOTAL_WINS_HEADER";
    }
    else if (v20 == 1)
    {
      v21 = ActivitySharingBundle();
      v22 = v21;
      v23 = @"COMPETITION_TODAY_SCORE_HEADER";
    }
    else
    {
      if (v20)
      {
LABEL_10:
        v24 = [v3 localizedUppercaseString];
        [(UILabel *)v12->_scoreTypeHeaderLabel setText:v24];

        v25 = [MEMORY[0x263F825C8] whiteColor];
        [(UILabel *)v12->_scoreTypeHeaderLabel setTextColor:v25];

        [(UILabel *)v12->_scoreTypeHeaderLabel setTextAlignment:1];
        [(ASCompetitionScoreView *)v12 addSubview:v12->_scoreTypeHeaderLabel];
        goto LABEL_11;
      }
      v21 = ActivitySharingBundle();
      v22 = v21;
      v23 = @"COMPETITION_TOTAL_SCORE_HEADER";
    }
    v3 = [v21 localizedStringForKey:v23 value:&stru_26E8035F0 table:@"Localizable"];

    goto LABEL_10;
  }
LABEL_11:
  if ([v6 showsAchievementThumbnail])
  {
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v7, v8, v9, v10);
    achievementThumbnailView = v12->_achievementThumbnailView;
    v12->_achievementThumbnailView = (UIImageView *)v26;

    [(UIImageView *)v12->_achievementThumbnailView setContentMode:2];
    [(UIImageView *)v12->_achievementThumbnailView setClipsToBounds:0];
    [(ASCompetitionScoreView *)v12 addSubview:v12->_achievementThumbnailView];
    if (![v6 achievementThumbnailAlignment])
    {
      [v6 achievementThumbnailSize];
      double v29 = v28 * 0.5;
      [(ASCompetitionParticipantScoreView *)v12->_myScoreView setScoreLeftMargin:v28 * 0.5];
      [(ASCompetitionParticipantScoreView *)v12->_opponentScoreView setScoreRightMargin:v29];
    }
  }
LABEL_14:

  return v12;
}

- (double)participantScoreViewWidthForParticipant:(int64_t)a3 maximumWidth:(double)a4
{
  [(ASCompetitionScoreViewConfiguration *)self->_configuration sideMargin];
  double v8 = a4 + v7 * -2.0;
  [(ASCompetitionScoreViewConfiguration *)self->_configuration minimumMiddleMargin];
  double v10 = v8 - v9;
  int64_t v11 = [(ASCompetitionScoreViewConfiguration *)self->_configuration division];
  if (v11)
  {
    if (v11 == 2)
    {
      [(ASCompetitionScoreViewConfiguration *)self->_configuration minimumMiddleMargin];
      double v15 = (v10 + v14) * 0.5;
      [(ASCompetitionScoreViewConfiguration *)self->_configuration minimumMiddleMargin];
      double result = (v10 - v16) * 0.5;
      if (a3)
      {
        if (self->_isRTLLayout) {
          return v15;
        }
      }
      else if (!self->_isRTLLayout)
      {
        return v15;
      }
    }
    else if (v11 == 1)
    {
      return v10 * 0.5;
    }
  }
  else
  {
    BOOL isRTLLayout = self->_isRTLLayout;
    [(ASCompetitionScoreViewConfiguration *)self->_configuration opponentScoreViewWidth];
    if (a3)
    {
      if (isRTLLayout) {
        return v10 - result;
      }
    }
    else if (!isRTLLayout)
    {
      return v10 - result;
    }
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(ASCompetitionScoreView *)self layoutForWidth:"layoutForWidth:"];
  -[ASCompetitionParticipantScoreView sizeThatFits:](self->_myScoreView, "sizeThatFits:", width, height);
  double v7 = v6;
  [(ASCompetitionScoreViewConfiguration *)self->_configuration bottomMargin];
  double v9 = v7 + v8;
  if ([(ASCompetitionScoreViewConfiguration *)self->_configuration showsScoreTypeHeader])
  {
    [(UILabel *)self->_scoreTypeHeaderLabel _lastLineBaselineFrameOriginY];
    double v9 = v9 + v10;
  }
  double v11 = width;
  double v12 = v9;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)ASCompetitionScoreView;
  [(ASCompetitionScoreView *)&v4 layoutSubviews];
  [(ASCompetitionScoreView *)self bounds];
  [(ASCompetitionScoreView *)self layoutForWidth:v3];
}

- (void)layoutForWidth:(double)a3
{
  scoreTypeHeaderLabel = self->_scoreTypeHeaderLabel;
  if (scoreTypeHeaderLabel)
  {
    [(UILabel *)scoreTypeHeaderLabel sizeToFit];
    [(UILabel *)self->_scoreTypeHeaderLabel bounds];
    -[UILabel setFrame:](self->_scoreTypeHeaderLabel, "setFrame:", 0.0, 0.0, a3, CGRectGetHeight(v51));
    [(ASCompetitionScoreViewConfiguration *)self->_configuration headerBaselineOffset];
    -[UILabel _setFirstLineBaselineFrameOriginY:](self->_scoreTypeHeaderLabel, "_setFirstLineBaselineFrameOriginY:");
  }
  [(ASCompetitionScoreViewConfiguration *)self->_configuration sideMargin];
  double v7 = v6;
  [(UILabel *)self->_scoreTypeHeaderLabel _lastLineBaselineFrameOriginY];
  double v9 = v8;
  [(ASCompetitionScoreView *)self participantScoreViewWidthForParticipant:1 maximumWidth:a3];
  double v11 = v10;
  [(ASCompetitionScoreView *)self participantScoreViewWidthForParticipant:0 maximumWidth:a3];
  double v13 = v12;
  -[ASCompetitionParticipantScoreView sizeThatFits:](self->_opponentScoreView, "sizeThatFits:", a3, 1.79769313e308);
  double v15 = v14;
  -[ASCompetitionParticipantScoreView setFrame:](self->_opponentScoreView, "setFrame:", v7, v9, v11, v14);
  [(ASCompetitionParticipantScoreView *)self->_opponentScoreView frame];
  double MaxX = CGRectGetMaxX(v52);
  [(ASCompetitionScoreViewConfiguration *)self->_configuration minimumMiddleMargin];
  -[ASCompetitionParticipantScoreView setFrame:](self->_myScoreView, "setFrame:", MaxX + v17, v9, v13, v15);
  if (self->_isRTLLayout)
  {
    [(ASCompetitionParticipantScoreView *)self->_opponentScoreView frame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    [(ASCompetitionParticipantScoreView *)self->_myScoreView frame];
    -[ASCompetitionParticipantScoreView setFrame:](self->_opponentScoreView, "setFrame:");
    -[ASCompetitionParticipantScoreView setFrame:](self->_myScoreView, "setFrame:", v19, v21, v23, v25);
  }
  if (self->_achievementThumbnailView)
  {
    [(ASCompetitionScoreViewConfiguration *)self->_configuration achievementThumbnailSize];
    double v27 = v26;
    [(ASCompetitionScoreViewConfiguration *)self->_configuration achievementThumbnailSize];
    double v29 = v28;
    int64_t v30 = [(ASCompetitionScoreViewConfiguration *)self->_configuration achievementThumbnailAlignment];
    if (v30 == 1)
    {
      [(ASCompetitionParticipantScoreView *)self->_myScoreView frame];
      double v34 = CGRectGetMaxY(v53) - v29 + 2.5;
      double v37 = 0.0;
      if (!self->_isRTLLayout)
      {
        [(ASCompetitionScoreViewConfiguration *)self->_configuration achievementThumbnailSize];
        double v37 = a3 - v38;
      }
    }
    else
    {
      if (v30) {
        goto LABEL_14;
      }
      [(UILabel *)self->_scoreTypeHeaderLabel _lastLineBaselineFrameOriginY];
      double v32 = v31;
      [(ASCompetitionScoreViewConfiguration *)self->_configuration achievementThumbnailTopMargin];
      double v34 = v32 + v33;
      if ([(ASCompetitionScoreViewConfiguration *)self->_configuration showsNames])
      {
        [(ASCompetitionParticipantScoreView *)self->_myScoreView nameBaselineY];
        double v34 = v34 + v35;
      }
      [(ASCompetitionScoreViewConfiguration *)self->_configuration achievementThumbnailSize];
      double v37 = (a3 - v36) * 0.5;
    }
    -[UIImageView setFrame:](self->_achievementThumbnailView, "setFrame:", v37, v34, v27, v29);
  }
LABEL_14:
  [(ASCompetitionParticipantScoreView *)self->_myScoreView computeNameFontSizeReductionForWidth:v13];
  double v40 = v39;
  [(ASCompetitionParticipantScoreView *)self->_opponentScoreView computeNameFontSizeReductionForWidth:v11];
  float v41 = v40;
  *(float *)&double v42 = v42;
  double v43 = fmaxf(v41, *(float *)&v42);
  [(ASCompetitionParticipantScoreView *)self->_myScoreView setNameFontSizeReduction:v43];
  [(ASCompetitionParticipantScoreView *)self->_opponentScoreView setNameFontSizeReduction:v43];
  [(ASCompetitionParticipantScoreView *)self->_myScoreView computePrimaryScoreFontSizeReductionForWidth:v13];
  double v45 = v44;
  [(ASCompetitionParticipantScoreView *)self->_opponentScoreView computePrimaryScoreFontSizeReductionForWidth:v11];
  float v46 = v45;
  *(float *)&double v47 = v47;
  double v48 = fmaxf(v46, *(float *)&v47);
  [(ASCompetitionParticipantScoreView *)self->_myScoreView setPrimaryScoreFontSizeReduction:v48];
  opponentScoreView = self->_opponentScoreView;
  [(ASCompetitionParticipantScoreView *)opponentScoreView setPrimaryScoreFontSizeReduction:v48];
}

- (double)lastBaselineY
{
  [(ASCompetitionParticipantScoreView *)self->_myScoreView frame];
  return CGRectGetMaxY(*(CGRect *)&v2);
}

- (void)setFriend:(id)a3 competition:(id)a4
{
  id v37 = a3;
  id v6 = a4;
  if (v6)
  {
    double v7 = objc_msgSend(MEMORY[0x263F825C8], "as_colorForParticipant:competition:", 1, v6);
    [(ASCompetitionParticipantScoreView *)self->_opponentScoreView setScoreColor:v7];

    uint64_t v8 = objc_msgSend(MEMORY[0x263F825C8], "as_colorForParticipant:competition:", 0, v6);
LABEL_5:
    double v12 = (void *)v8;
    goto LABEL_6;
  }
  unint64_t v9 = [v37 numberOfCompetitionWinsByMe];
  unint64_t v10 = [v37 numberOfCompetitionWinsAgainstMe];
  if (v9 > v10)
  {
    double v11 = objc_msgSend(MEMORY[0x263F825C8], "as_darkCompetitionGold");
    [(ASCompetitionParticipantScoreView *)self->_opponentScoreView setScoreColor:v11];

    uint64_t v8 = objc_msgSend(MEMORY[0x263F825C8], "as_lightCompetitionGold");
    goto LABEL_5;
  }
  unint64_t v35 = v10;
  double v36 = objc_msgSend(MEMORY[0x263F825C8], "as_lightCompetitionGold");
  [(ASCompetitionParticipantScoreView *)self->_opponentScoreView setScoreColor:v36];

  if (v35 <= v9) {
    objc_msgSend(MEMORY[0x263F825C8], "as_lightCompetitionGold");
  }
  else {
  double v12 = objc_msgSend(MEMORY[0x263F825C8], "as_darkCompetitionGold");
  }
LABEL_6:
  [(ASCompetitionParticipantScoreView *)self->_myScoreView setScoreColor:v12];

  BOOL v13 = [(ASCompetitionScoreViewConfiguration *)self->_configuration uppercaseNames];
  double v14 = [v37 displayName];
  double v15 = v14;
  if (v13)
  {
    uint64_t v16 = [v14 uppercaseString];

    double v15 = (void *)v16;
  }
  BOOL v17 = [(ASCompetitionScoreViewConfiguration *)self->_configuration uppercaseNames];
  double v18 = ActivitySharingBundle();
  double v19 = v18;
  if (v17) {
    double v20 = @"UPPERCASE_ME";
  }
  else {
    double v20 = @"ME";
  }
  double v21 = [v18 localizedStringForKey:v20 value:&stru_26E8035F0 table:@"Localizable"];

  [(ASCompetitionParticipantScoreView *)self->_opponentScoreView setName:v15];
  [(ASCompetitionParticipantScoreView *)self->_myScoreView setName:v21];
  double v22 = [MEMORY[0x263EFF910] date];
  uint64_t v23 = [v6 dailyScoreForParticipant:0 onDate:v22];

  double v24 = [MEMORY[0x263EFF910] date];
  uint64_t v25 = [v6 dailyScoreForParticipant:1 onDate:v24];

  int64_t v26 = [(ASCompetitionScoreViewConfiguration *)self->_configuration primaryScoreSource];
  switch(v26)
  {
    case 2:
      -[ASCompetitionParticipantScoreView setPrimaryScore:](self->_opponentScoreView, "setPrimaryScore:", [v37 numberOfCompetitionWinsAgainstMe]);
      uint64_t v27 = [v37 numberOfCompetitionWinsByMe];
      myScoreView = self->_myScoreView;
LABEL_18:
      [(ASCompetitionParticipantScoreView *)myScoreView setPrimaryScore:v27];
      break;
    case 1:
      [(ASCompetitionParticipantScoreView *)self->_opponentScoreView setPrimaryScore:v25];
      myScoreView = self->_myScoreView;
      uint64_t v27 = v23;
      goto LABEL_18;
    case 0:
      -[ASCompetitionParticipantScoreView setPrimaryScore:](self->_opponentScoreView, "setPrimaryScore:", [v6 opponentTotalScore]);
      -[ASCompetitionParticipantScoreView setPrimaryScore:](self->_myScoreView, "setPrimaryScore:", [v6 myTotalScore]);
      if ([(ASCompetitionScoreViewConfiguration *)self->_configuration showsTodaySecondaryScore])
      {
        -[ASCompetitionParticipantScoreView setSecondaryScoreEnabled:](self->_opponentScoreView, "setSecondaryScoreEnabled:", [v37 hasCompletedFirstDayOfCurrentCompetition]);
        -[ASCompetitionParticipantScoreView setSecondaryScoreEnabled:](self->_myScoreView, "setSecondaryScoreEnabled:", [v37 hasCompletedFirstDayOfCurrentCompetition]);
        [(ASCompetitionParticipantScoreView *)self->_opponentScoreView setSecondaryScore:v25];
        [(ASCompetitionParticipantScoreView *)self->_myScoreView setSecondaryScore:v23];
      }
      break;
  }
  if (v6)
  {
    id v29 = v6;
  }
  else
  {
    id v29 = [v37 currentOrMostRecentCompetition];
  }
  int64_t v30 = v29;
  achievementThumbnailView = self->_achievementThumbnailView;
  if (achievementThumbnailView && v30)
  {
    [v30 victoryBadgeStyle];
    [(ASCompetitionScoreViewConfiguration *)self->_configuration achievementThumbnailQuality];
    double v32 = ASAchievementThumbnailPathForStyle();
    double v33 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v32 options:0 error:0];
    double v34 = [MEMORY[0x263F827E8] imageWithData:v33];
    [(UIImageView *)self->_achievementThumbnailView setImage:v34];
  }
  else
  {
    [(UIImageView *)achievementThumbnailView setImage:0];
  }
  [(ASCompetitionScoreView *)self setNeedsLayout];
}

+ (double)preferredHeightForConfiguration:(id)a3 friend:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 bottomMargin];
  double v8 = v7;
  if ([v5 wantsScaledBaselineAlignment])
  {
    unint64_t v9 = [v5 primaryScoreFont];
    [v5 primaryScoreBaselineOffset];
    objc_msgSend(v9, "_scaledValueForValue:");
    double v11 = v10;
  }
  else
  {
    [v5 primaryScoreBaselineOffset];
    double v11 = v12;
  }
  double v13 = v8 + v11;
  if ([v5 showsNames])
  {
    if ([v5 wantsScaledBaselineAlignment])
    {
      double v14 = [v5 nameFont];
      [v5 nameBaselineOffset];
      objc_msgSend(v14, "_scaledValueForValue:");
      double v13 = v13 + v15;
    }
    else
    {
      [v5 nameBaselineOffset];
      double v13 = v13 + v16;
    }
  }
  if ([v5 showsTodaySecondaryScore]
    && [v6 hasCompletedFirstDayOfCurrentCompetition])
  {
    BOOL v17 = [v5 secondaryScoreFont];
    [v5 secondaryScoreBaselineOffset];
    objc_msgSend(v17, "_scaledValueForValue:");
    double v13 = v13 + v18;
  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreTypeHeaderLabel, 0);
  objc_storeStrong((id *)&self->_achievementThumbnailView, 0);
  objc_storeStrong((id *)&self->_opponentScoreView, 0);
  objc_storeStrong((id *)&self->_myScoreView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end