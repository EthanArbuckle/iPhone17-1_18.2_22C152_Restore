@interface ASCompetitionGizmoDetailView
- (ASCompetitionGizmoDetailView)initWithDetailViewType:(int64_t)a3;
- (BOOL)isInteractionEnabled;
- (BOOL)supportsSmackTalkReply;
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)layoutForWidth:(double)a3;
- (void)layoutSubviews;
- (void)setFriend:(id)a3 competition:(id)a4;
- (void)setIsInteractionEnabled:(BOOL)a3;
@end

@implementation ASCompetitionGizmoDetailView

- (ASCompetitionGizmoDetailView)initWithDetailViewType:(int64_t)a3
{
  v32.receiver = self;
  v32.super_class = (Class)ASCompetitionGizmoDetailView;
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = -[ASCompetitionGizmoDetailView initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x263F001A8], v5, v6, v7);
  if (!v8) {
    return v8;
  }
  v9 = _BackgroundColorForDetailViewType((void *)a3);
  [(ASCompetitionGizmoDetailView *)v8 setBackgroundColor:v9];

  v10 = [(ASCompetitionGizmoDetailView *)v8 layer];
  [v10 setCornerRadius:6.0];

  v8->_type = a3;
  if ((unint64_t)(a3 - 1) > 5) {
    uint64_t v11 = 29;
  }
  else {
    uint64_t v11 = qword_234E0DF48[a3 - 1];
  }
  v8->_int64_t modules = v11;
  v12 = +[ASCompetitionScoreViewConfiguration gizmoTotalScoreConfiguration];
  v13 = [[ASCompetitionScoreView alloc] initWithConfiguration:v12];
  totalScoreView = v8->_totalScoreView;
  v8->_totalScoreView = v13;

  [(ASCompetitionGizmoDetailView *)v8 addSubview:v8->_totalScoreView];
  int64_t modules = v8->_modules;
  if ((modules & 2) != 0)
  {
    uint64_t v19 = +[ASCompetitionGraphView gizmoGraph];
    graphView = v8->_graphView;
    v8->_graphView = (ASCompetitionGraphView *)v19;

    v21 = v8->_graphView;
    v22 = [MEMORY[0x263F825C8] clearColor];
    [(ASCompetitionGraphView *)v21 setBackgroundColor:v22];

    [(ASCompetitionGizmoDetailView *)v8 addSubview:v8->_graphView];
    int64_t modules = v8->_modules;
    if ((modules & 4) == 0)
    {
LABEL_7:
      if ((modules & 8) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      if ((modules & 4) != 0)
      {
        uint64_t v28 = _CreateSeparatorView();
        timeRemainingSeparator = v8->_timeRemainingSeparator;
        v8->_timeRemainingSeparator = (UIView *)v28;

        [(ASCompetitionGizmoDetailView *)v8 addSubview:v8->_timeRemainingSeparator];
      }
      v30 = -[ASCompetitionTimeRemainingLabel initWithFrame:]([ASCompetitionTimeRemainingLabel alloc], "initWithFrame:", v4, v5, v6, v7);
      timeRemainingLabel = v8->_timeRemainingLabel;
      v8->_timeRemainingLabel = v30;

      [(ASCompetitionGizmoDetailView *)v8 addSubview:v8->_timeRemainingLabel];
      if ((v8->_modules & 0x10) != 0) {
        goto LABEL_9;
      }
      return v8;
    }
  }
  else if ((modules & 4) == 0)
  {
    goto LABEL_7;
  }
  uint64_t v23 = _CreateSeparatorView();
  totalWinsSeparator = v8->_totalWinsSeparator;
  v8->_totalWinsSeparator = (UIView *)v23;

  [(ASCompetitionGizmoDetailView *)v8 addSubview:v8->_totalWinsSeparator];
  v25 = +[ASCompetitionScoreViewConfiguration gizmoTotalWinsConfiguration];
  v26 = [[ASCompetitionScoreView alloc] initWithConfiguration:v25];
  totalWinsScoreView = v8->_totalWinsScoreView;
  v8->_totalWinsScoreView = v26;

  [(ASCompetitionGizmoDetailView *)v8 addSubview:v8->_totalWinsScoreView];
  int64_t modules = v8->_modules;
  if ((modules & 8) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((modules & 0x10) != 0)
  {
LABEL_9:
    v16 = -[ASCompetitionMessageBubbleView initWithFrame:]([ASCompetitionMessageBubbleView alloc], "initWithFrame:", v4, v5, v6, v7);
    messageBubbleView = v8->_messageBubbleView;
    v8->_messageBubbleView = v16;

    [(ASCompetitionGizmoDetailView *)v8 addSubview:v8->_messageBubbleView];
  }
  return v8;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)ASCompetitionGizmoDetailView;
  [(ASCompetitionGizmoDetailView *)&v4 layoutSubviews];
  [(ASCompetitionGizmoDetailView *)self bounds];
  [(ASCompetitionGizmoDetailView *)self layoutForWidth:v3];
}

- (void)layoutForWidth:(double)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  previousLayoutdouble Width = self->_previousLayoutWidth;
  if (!previousLayoutWidth
    || ([(NSNumber *)previousLayoutWidth floatValue], vabdd_f64(v6, a3) >= 0.00000011920929))
  {
    [(ASCompetitionScoreView *)self->_totalScoreView sizeToFit];
    [(ASCompetitionScoreView *)self->_totalWinsScoreView sizeToFit];
    [(ASCompetitionTimeRemainingLabel *)self->_timeRemainingLabel sizeToFit];
    [(ASCompetitionMessageBubbleView *)self->_messageBubbleView sizeToFit];
    [(ASCompetitionScoreView *)self->_totalWinsScoreView sizeToFit];
    [(ASCompetitionScoreView *)self->_totalScoreView bounds];
    -[ASCompetitionScoreView setFrame:](self->_totalScoreView, "setFrame:", 0.0, 0.0, a3, CGRectGetHeight(v46));
    [(ASCompetitionScoreView *)self->_totalScoreView lastBaselineY];
    graphView = self->_graphView;
    if (graphView)
    {
      double v9 = v7 + 10.0;
      [(ASCompetitionGraphView *)graphView preferredHeight];
      -[ASCompetitionGraphView setFrame:](self->_graphView, "setFrame:", 0.0, v9, a3, v10);
      [(ASCompetitionGraphView *)self->_graphView frame];
      double MinY = CGRectGetMinY(v47);
      [(ASCompetitionGraphView *)self->_graphView lastBaselineY];
      double v7 = MinY + v12;
    }
    if (self->_totalWinsScoreView)
    {
      double v13 = 6.5;
      if (!self->_graphView) {
        double v13 = 10.0;
      }
      -[UIView setFrame:](self->_totalWinsSeparator, "setFrame:", 2.0, v7 + v13, a3 + -4.0, 1.5);
      [(UIView *)self->_totalWinsSeparator frame];
      double MaxY = CGRectGetMaxY(v48);
      [(ASCompetitionScoreView *)self->_totalWinsScoreView bounds];
      -[ASCompetitionScoreView setFrame:](self->_totalWinsScoreView, "setFrame:", 0.0, MaxY, a3, CGRectGetHeight(v49));
      [(ASCompetitionScoreView *)self->_totalWinsScoreView frame];
      double v15 = CGRectGetMinY(v50);
      [(ASCompetitionScoreView *)self->_totalWinsScoreView lastBaselineY];
      double v7 = v15 + v16;
    }
    timeRemainingSeparator = self->_timeRemainingSeparator;
    if (timeRemainingSeparator)
    {
      double v18 = 10.0;
      if (!self->_totalWinsScoreView) {
        double v18 = 6.5;
      }
      -[UIView setFrame:](timeRemainingSeparator, "setFrame:", 2.0, v7 + v18, a3 + -4.0, 1.5);
      [(UIView *)self->_timeRemainingSeparator frame];
      double v7 = CGRectGetMaxY(v51);
    }
    if (self->_timeRemainingLabel)
    {
      messageBubbleView = self->_messageBubbleView;
      if (messageBubbleView)
      {
        double v20 = 5.0;
        if (!self->_timeRemainingSeparator) {
          double v20 = 13.0;
        }
        -[ASCompetitionMessageBubbleView setFrame:](messageBubbleView, "setFrame:", a3 + -5.0 + -30.0, v7 + v20, 30.0, 30.0);
        [(ASCompetitionTimeRemainingLabel *)self->_timeRemainingLabel bounds];
        double Height = CGRectGetHeight(v52);
        [(ASCompetitionMessageBubbleView *)self->_messageBubbleView frame];
        CGFloat v22 = CGRectGetMidY(v53) + Height * -0.5;
        [(ASCompetitionMessageBubbleView *)self->_messageBubbleView frame];
        double v23 = CGRectGetMinX(v54) + -5.0 + -4.0;
        [(ASCompetitionTimeRemainingLabel *)self->_timeRemainingLabel frame];
        -[ASCompetitionTimeRemainingLabel setFrame:](self->_timeRemainingLabel, "setFrame:", 5.0, v22, fmin(CGRectGetWidth(v55), v23), Height);
        if ([MEMORY[0x263F82E00] userInterfaceLayoutDirectionForSemanticContentAttribute:0] == 1)
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          timeRemainingLabel = self->_timeRemainingLabel;
          v43[0] = self->_messageBubbleView;
          v43[1] = timeRemainingLabel;
          v25 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v43, 2, 0);
          uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v44 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v27; ++i)
              {
                if (*(void *)v40 != v28) {
                  objc_enumerationMutation(v25);
                }
                v30 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                [v30 frame];
                double v31 = a3 - CGRectGetWidth(v56);
                [v30 frame];
                double v32 = v31 - CGRectGetMinX(v57);
                [v30 frame];
                double v33 = CGRectGetMinY(v58);
                [v30 frame];
                double Width = CGRectGetWidth(v59);
                [v30 frame];
                objc_msgSend(v30, "setFrame:", v32, v33, Width, CGRectGetHeight(v60));
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v44 count:16];
            }
            while (v27);
          }
        }
      }
      else
      {
        double v35 = 18.5;
        if (self->_graphView) {
          double v35 = 19.0;
        }
        double v36 = v7 + v35;
        [(ASCompetitionTimeRemainingLabel *)self->_timeRemainingLabel bounds];
        -[ASCompetitionTimeRemainingLabel setFrame:](self->_timeRemainingLabel, "setFrame:", 5.0, 0.0, a3 + -10.0, CGRectGetHeight(v61));
        [(ASCompetitionTimeRemainingLabel *)self->_timeRemainingLabel _setLastLineBaselineFrameOriginY:v36];
      }
    }
    v37 = [NSNumber numberWithDouble:a3];
    v38 = self->_previousLayoutWidth;
    self->_previousLayoutdouble Width = v37;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[ASCompetitionGizmoDetailView layoutForWidth:](self, "layoutForWidth:", a3.width, a3.height);
  timeRemainingLabel = self->_timeRemainingLabel;
  if (timeRemainingLabel)
  {
    if (self->_messageBubbleView)
    {
      [(ASCompetitionMessageBubbleView *)self->_messageBubbleView frame];
      double MaxY = CGRectGetMaxY(v16);
      double v7 = 5.0;
    }
    else
    {
      [(ASCompetitionTimeRemainingLabel *)timeRemainingLabel _lastLineBaselineFrameOriginY];
      double v7 = 10.5;
    }
  }
  else
  {
    uint64_t v8 = 416;
    totalWinsScoreView = self->_totalWinsScoreView;
    if (!totalWinsScoreView)
    {
      graphView = self->_graphView;
      if (graphView)
      {
        [(ASCompetitionGraphView *)graphView frame];
        double v12 = CGRectGetMaxY(v18);
        goto LABEL_8;
      }
      uint64_t v8 = 408;
      totalWinsScoreView = self->_totalScoreView;
    }
    [(ASCompetitionScoreView *)totalWinsScoreView frame];
    double MinY = CGRectGetMinY(v17);
    [*(id *)((char *)&self->super.super.super.isa + v8) lastBaselineY];
    double MaxY = MinY + v11;
    double v7 = 10.0;
  }
  double v12 = MaxY + v7;
LABEL_8:
  double v13 = width;
  result.height = v12;
  result.CGFloat width = v13;
  return result;
}

- (void)setFriend:(id)a3 competition:(id)a4
{
  id v10 = a3;
  totalScoreView = self->_totalScoreView;
  id v7 = a4;
  [(ASCompetitionScoreView *)totalScoreView setFriend:v10 competition:v7];
  [(ASCompetitionScoreView *)self->_totalWinsScoreView setFriend:v10 competition:v7];
  [(ASCompetitionGraphView *)self->_graphView setCompetition:v7];

  if (self->_timeRemainingLabel)
  {
    uint64_t v8 = objc_msgSend(v10, "as_competitionStageString");
    double v9 = [v8 localizedUppercaseString];
    [(ASCompetitionTimeRemainingLabel *)self->_timeRemainingLabel setText:v9];
  }
  [(ASCompetitionGizmoDetailView *)self setNeedsLayout];
}

- (BOOL)supportsSmackTalkReply
{
  return self->_messageBubbleView != 0;
}

- (BOOL)isInteractionEnabled
{
  return self->_isInteractionEnabled;
}

- (void)setIsInteractionEnabled:(BOOL)a3
{
  self->_isInteractionEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousLayoutWidth, 0);
  objc_storeStrong((id *)&self->_totalWinsSeparator, 0);
  objc_storeStrong((id *)&self->_timeRemainingSeparator, 0);
  objc_storeStrong((id *)&self->_messageBubbleView, 0);
  objc_storeStrong((id *)&self->_timeRemainingLabel, 0);
  objc_storeStrong((id *)&self->_graphView, 0);
  objc_storeStrong((id *)&self->_totalWinsScoreView, 0);
  objc_storeStrong((id *)&self->_totalScoreView, 0);
}

@end