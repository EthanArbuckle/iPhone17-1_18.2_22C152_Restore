@interface MediaControlsTransportStackView
- (BOOL)isEmpty;
- (BOOL)shouldShowTVRemoteButton;
- (CGSize)sizeThatFits:(CGSize)result;
- (MPCPlayerResponse)response;
- (MTVisualStylingProvider)visualStylingProvider;
- (MediaControlsActionsDelegate)actionsDelegate;
- (MediaControlsTransportButton)languageOptionsButton;
- (MediaControlsTransportButton)leftButton;
- (MediaControlsTransportButton)middleButton;
- (MediaControlsTransportButton)rightButton;
- (MediaControlsTransportButton)tvRemoteButton;
- (MediaControlsTransportStackView)initWithFrame:(CGRect)a3;
- (id)_createTransportButton;
- (int64_t)style;
- (void)_resetTransportButton:(id)a3;
- (void)_updateButtonConfiguration;
- (void)_updateButtonLayout;
- (void)_updateButtonVisualStyling:(id)a3;
- (void)_updateVisualStylingForButtons;
- (void)buttonHoldBegan:(id)a3;
- (void)buttonHoldReleased:(id)a3;
- (void)layoutSubviews;
- (void)setActionsDelegate:(id)a3;
- (void)setEmpty:(BOOL)a3;
- (void)setLanguageOptionsButton:(id)a3;
- (void)setLeftButton:(id)a3;
- (void)setMiddleButton:(id)a3;
- (void)setResponse:(id)a3;
- (void)setRightButton:(id)a3;
- (void)setShouldShowTVRemoteButton:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTvRemoteButton:(id)a3;
- (void)setVisualStylingProvider:(id)a3;
- (void)touchUpInsideCaptionsButton:(id)a3;
- (void)touchUpInsideHangdogButton:(id)a3;
- (void)touchUpInsideLeftButton:(id)a3;
- (void)touchUpInsideMiddleButton:(id)a3;
- (void)touchUpInsideRightButton:(id)a3;
- (void)updateOnRouteChange;
@end

@implementation MediaControlsTransportStackView

- (MediaControlsTransportStackView)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)MediaControlsTransportStackView;
  v3 = -[MediaControlsTransportStackView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(MediaControlsTransportStackView *)v3 _createTransportButton];
    tvRemoteButton = v4->_tvRemoteButton;
    v4->_tvRemoteButton = (MediaControlsTransportButton *)v5;

    uint64_t v7 = [(MediaControlsTransportStackView *)v4 _createTransportButton];
    leftButton = v4->_leftButton;
    v4->_leftButton = (MediaControlsTransportButton *)v7;

    uint64_t v9 = [(MediaControlsTransportStackView *)v4 _createTransportButton];
    middleButton = v4->_middleButton;
    v4->_middleButton = (MediaControlsTransportButton *)v9;

    uint64_t v11 = [(MediaControlsTransportStackView *)v4 _createTransportButton];
    rightButton = v4->_rightButton;
    v4->_rightButton = (MediaControlsTransportButton *)v11;

    uint64_t v13 = [(MediaControlsTransportStackView *)v4 _createTransportButton];
    languageOptionsButton = v4->_languageOptionsButton;
    v4->_languageOptionsButton = (MediaControlsTransportButton *)v13;

    [(MediaControlsTransportStackView *)v4 _updateButtonConfiguration];
    v15 = v4->_tvRemoteButton;
    v16 = +[MediaControlsTheme appleTVRemote];
    [(MediaControlsTransportButton *)v15 setImage:v16 forState:0];

    v17 = v4->_leftButton;
    v18 = +[MediaControlsTheme backwardImage];
    [(MediaControlsTransportButton *)v17 setImage:v18 forState:0];

    v19 = v4->_middleButton;
    v20 = +[MediaControlsTheme playImage];
    [(MediaControlsTransportButton *)v19 setImage:v20 forState:0];

    v21 = v4->_rightButton;
    v22 = +[MediaControlsTheme forwardImage];
    [(MediaControlsTransportButton *)v21 setImage:v22 forState:0];

    v23 = v4->_languageOptionsButton;
    v24 = +[MediaControlsTheme captionsImage];
    [(MediaControlsTransportButton *)v23 setImage:v24 forState:0];

    [(MediaControlsTransportButton *)v4->_tvRemoteButton addTarget:v4 action:sel_touchUpInsideHangdogButton_ forControlEvents:64];
    [(MediaControlsTransportButton *)v4->_leftButton addTarget:v4 action:sel_touchUpInsideLeftButton_ forControlEvents:64];
    [(MediaControlsTransportButton *)v4->_middleButton addTarget:v4 action:sel_touchUpInsideMiddleButton_ forControlEvents:64];
    [(MediaControlsTransportButton *)v4->_rightButton addTarget:v4 action:sel_touchUpInsideRightButton_ forControlEvents:64];
    [(MediaControlsTransportButton *)v4->_languageOptionsButton addTarget:v4 action:sel_touchUpInsideCaptionsButton_ forControlEvents:64];
    [(MediaControlsTransportButton *)v4->_leftButton addTarget:v4 action:sel_buttonHoldBegan_ forControlEvents:0x1000000];
    [(MediaControlsTransportButton *)v4->_leftButton addTarget:v4 action:sel_buttonHoldReleased_ forControlEvents:0x2000000];
    [(MediaControlsTransportButton *)v4->_rightButton addTarget:v4 action:sel_buttonHoldBegan_ forControlEvents:0x1000000];
    [(MediaControlsTransportButton *)v4->_rightButton addTarget:v4 action:sel_buttonHoldReleased_ forControlEvents:0x2000000];
  }
  return v4;
}

- (void)layoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)MediaControlsTransportStackView;
  [(MediaControlsTransportStackView *)&v54 layoutSubviews];
  if (self->_style == 1 || !self->_shouldShowTVRemoteButton)
  {
    [(MediaControlsTransportStackView *)self bounds];
    CGFloat x = v64.origin.x;
    CGFloat y = v64.origin.y;
    CGFloat width = v64.size.width;
    CGFloat height = v64.size.height;
    CGRectGetWidth(v64);
    UIRoundToViewScale();
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = y;
    v65.size.CGFloat width = width;
    v65.size.CGFloat height = height;
    CGRectGetMinX(v65);
    v66.origin.CGFloat x = x;
    v66.origin.CGFloat y = y;
    v66.size.CGFloat width = width;
    v66.size.CGFloat height = height;
    CGRectGetMinY(v66);
    UIRectCenteredYInRect();
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    -[MediaControlsTransportButton setFrame:](self->_tvRemoteButton, "setFrame:");
    v67.origin.CGFloat x = v22;
    v67.origin.CGFloat y = v24;
    v67.size.CGFloat width = v26;
    v67.size.CGFloat height = v28;
    CGRectGetMaxX(v67);
    v68.origin.CGFloat x = x;
    v68.origin.CGFloat y = y;
    v68.size.CGFloat width = width;
    v68.size.CGFloat height = height;
    CGRectGetMinY(v68);
    UIRectCenteredYInRect();
    -[MediaControlsTransportButton setFrame:](self->_leftButton, "setFrame:");
    UIRectCenteredRect();
    UIRectCenteredRect();
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    -[MediaControlsTransportButton setFrame:](self->_middleButton, "setFrame:");
    v69.origin.CGFloat x = v30;
    v69.origin.CGFloat y = v32;
    v69.size.CGFloat width = v34;
    v69.size.CGFloat height = v36;
    CGRectGetMaxX(v69);
    v70.origin.CGFloat x = x;
    v70.origin.CGFloat y = y;
    v70.size.CGFloat width = width;
    v70.size.CGFloat height = height;
    CGRectGetMinY(v70);
    UIRectCenteredYInRect();
    -[MediaControlsTransportButton setFrame:](self->_rightButton, "setFrame:");
    v71.origin.CGFloat x = x;
    v71.origin.CGFloat y = y;
    v71.size.CGFloat width = width;
    v71.size.CGFloat height = height;
    CGRectGetMaxX(v71);
  }
  else
  {
    [(MediaControlsTransportStackView *)self bounds];
    UIRectInset();
    CGFloat x = v55.origin.x;
    CGFloat y = v55.origin.y;
    CGFloat width = v55.size.width;
    CGFloat height = v55.size.height;
    CGRectGetWidth(v55);
    UIRoundToViewScale();
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    CGRectGetMinX(v56);
    v57.origin.CGFloat x = x;
    v57.origin.CGFloat y = y;
    v57.size.CGFloat width = width;
    v57.size.CGFloat height = height;
    CGRectGetMinY(v57);
    UIRectCenteredYInRect();
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat rect = v13;
    -[MediaControlsTransportButton setFrame:](self->_tvRemoteButton, "setFrame:");
    v58.origin.CGFloat x = v8;
    v58.origin.CGFloat y = v10;
    v58.size.CGFloat width = v12;
    v58.size.CGFloat height = rect;
    CGRectGetMaxX(v58);
    v59.origin.CGFloat x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    CGRectGetMinY(v59);
    UIRectCenteredYInRect();
    -[MediaControlsTransportButton setFrame:](self->_leftButton, "setFrame:");
    v60.origin.CGFloat x = x;
    v60.origin.CGFloat y = y;
    v60.size.CGFloat width = width;
    v60.size.CGFloat height = height;
    CGRectGetMinY(v60);
    UIRectCenteredRect();
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat recta = v20;
    -[MediaControlsTransportButton setFrame:](self->_middleButton, "setFrame:");
    v61.origin.CGFloat x = v15;
    v61.origin.CGFloat y = v17;
    v61.size.CGFloat width = v19;
    v61.size.CGFloat height = recta;
    CGRectGetMaxX(v61);
    v62.origin.CGFloat x = x;
    v62.origin.CGFloat y = y;
    v62.size.CGFloat width = width;
    v62.size.CGFloat height = height;
    CGRectGetMinY(v62);
    UIRectCenteredYInRect();
    -[MediaControlsTransportButton setFrame:](self->_rightButton, "setFrame:");
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = width;
    v63.size.CGFloat height = height;
    CGRectGetMaxX(v63);
  }
  v72.origin.CGFloat x = x;
  v72.origin.CGFloat y = y;
  v72.size.CGFloat width = width;
  v72.size.CGFloat height = height;
  CGRectGetMinY(v72);
  UIRectCenteredYInRect();
  -[MediaControlsTransportButton setFrame:](self->_languageOptionsButton, "setFrame:");
  v37 = [(MediaControlsTransportStackView *)self leftButton];
  [v37 frame];
  CGRectGetMaxX(v73);
  v38 = [(MediaControlsTransportStackView *)self middleButton];
  [v38 frame];
  CGRectGetMinX(v74);

  UIEdgeInsetsMakeWithEdges();
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  v47 = [(MediaControlsTransportStackView *)self tvRemoteButton];
  objc_msgSend(v47, "setHitRectInsets:", v40, v42, v44, v46);

  v48 = [(MediaControlsTransportStackView *)self leftButton];
  objc_msgSend(v48, "setHitRectInsets:", v40, v42, v44, v46);

  v49 = [(MediaControlsTransportStackView *)self middleButton];
  objc_msgSend(v49, "setHitRectInsets:", v40, v42, v44, v46);

  v50 = [(MediaControlsTransportStackView *)self rightButton];
  objc_msgSend(v50, "setHitRectInsets:", v40, v42, v44, v46);

  v51 = [(MediaControlsTransportStackView *)self languageOptionsButton];
  objc_msgSend(v51, "setHitRectInsets:", v40, v42, v44, v46);

  [(MediaControlsTransportStackView *)self _updateVisualStylingForButtons];
}

- (void)touchUpInsideHangdogButton:(id)a3
{
  id v3 = [(MediaControlsTransportStackView *)self actionsDelegate];
  [v3 presentTVRemote];
}

- (void)touchUpInsideLeftButton:(id)a3
{
  id v15 = a3;
  v4 = [(MediaControlsTransportStackView *)self leftButton];
  int v5 = [v4 shouldPresentActionSheet];

  if (v5)
  {
    v6 = [(MediaControlsTransportStackView *)self actionsDelegate];
    if (v6)
    {
      double v7 = [(MPCPlayerResponse *)self->_response tracklist];
      CGFloat v8 = [v7 playingItemIndexPath];

      if (v8)
      {
        double v9 = [(MPCPlayerResponse *)self->_response tracklist];
        CGFloat v10 = [v9 items];
        double v11 = [v10 itemAtIndexPath:v8];

        [v6 presentRatingActionSheet:v11 sourceView:v15];
      }
    }
  }
  else
  {
    CGFloat v12 = [(MediaControlsTransportStackView *)self leftButton];
    char v13 = [v12 isHolding];

    if (v13) {
      goto LABEL_9;
    }
    double v14 = (void *)MEMORY[0x1E4F76E88];
    v6 = [v15 touchUpInsideCommandRequest];
    [v14 performRequest:v6 completion:0];
  }

LABEL_9:
}

- (void)touchUpInsideMiddleButton:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F76E88];
  id v4 = [a3 touchUpInsideCommandRequest];
  [v3 performRequest:v4 completion:0];
}

- (void)touchUpInsideRightButton:(id)a3
{
  id v8 = a3;
  id v4 = [(MediaControlsTransportStackView *)self rightButton];
  char v5 = [v4 isHolding];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E4F76E88];
    double v7 = [v8 touchUpInsideCommandRequest];
    [v6 performRequest:v7 completion:0];
  }
}

- (void)touchUpInsideCaptionsButton:(id)a3
{
  id v3 = [(MediaControlsTransportStackView *)self actionsDelegate];
  [v3 presentLanguageOptions];
}

- (void)buttonHoldBegan:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F76E88];
  id v4 = [a3 holdBeginCommandRequest];
  [v3 performRequest:v4 completion:0];
}

- (void)buttonHoldReleased:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F76E88];
  id v4 = [a3 holdEndCommandRequest];
  [v3 performRequest:v4 completion:0];
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(MediaControlsTransportStackView *)self _updateButtonLayout];
  }
}

- (void)setResponse:(id)a3
{
  char v5 = (MPCPlayerResponse *)a3;
  p_response = &self->_response;
  if (self->_response != v5)
  {
    objc_storeStrong((id *)&self->_response, a3);
    double v7 = [(MediaControlsTransportStackView *)self tvRemoteButton];
    [(MediaControlsTransportStackView *)self _resetTransportButton:v7];

    id v8 = [(MediaControlsTransportStackView *)self leftButton];
    [(MediaControlsTransportStackView *)self _resetTransportButton:v8];

    double v9 = [(MediaControlsTransportStackView *)self middleButton];
    [(MediaControlsTransportStackView *)self _resetTransportButton:v9];

    CGFloat v10 = [(MediaControlsTransportStackView *)self rightButton];
    [(MediaControlsTransportStackView *)self _resetTransportButton:v10];

    double v11 = [(MediaControlsTransportStackView *)self languageOptionsButton];
    [(MediaControlsTransportStackView *)self _resetTransportButton:v11];

    CGFloat v12 = [(MPCPlayerResponse *)v5 tracklist];
    char v13 = [v12 playingItemIndexPath];

    if (v13)
    {
      double v14 = [(MPCPlayerResponse *)v5 tracklist];
      id v15 = [v14 items];
      double v16 = [v15 itemAtIndexPath:v13];
    }
    else
    {
      double v16 = 0;
    }
    uint64_t v17 = [(MPCPlayerResponse *)*p_response play];
    uint64_t v18 = [(MPCPlayerResponse *)*p_response pause];
    CGFloat v19 = [(MPCPlayerResponse *)*p_response stop];
    double v20 = [(MediaControlsTransportStackView *)self middleButton];
    [v20 setUserInteractionEnabled:1];

    v95 = (void *)v17;
    if (v19 && v16 && ([v16 duration], v97))
    {
      double v21 = [(MediaControlsTransportStackView *)self middleButton];
      CGFloat v22 = +[MediaControlsTheme stopImage];
      [v21 setImage:v22 forState:0];

      double v23 = [(MediaControlsTransportStackView *)self middleButton];
      CGFloat v24 = v23;
      double v25 = v19;
    }
    else if (v18)
    {
      CGFloat v26 = [(MediaControlsTransportStackView *)self middleButton];
      double v27 = +[MediaControlsTheme pauseImage];
      [v26 setImage:v27 forState:0];

      double v23 = [(MediaControlsTransportStackView *)self middleButton];
      CGFloat v24 = v23;
      double v25 = (void *)v18;
    }
    else
    {
      if (!v17)
      {
        unsigned int v93 = 0;
LABEL_14:
        CGFloat v30 = [(MPCPlayerResponse *)*p_response tracklist];
        double v31 = [v30 changeItemCommand];
        v96 = [v31 previousItem];

        CGFloat v32 = [v16 likeCommand];
        v94 = (void *)v18;
        if ([v32 presentationStyle] == 3)
        {
LABEL_17:

LABEL_18:
          CGFloat v34 = [(MediaControlsTransportStackView *)self leftButton];
          double v35 = +[MediaControlsTheme hamburgerImage];
          [v34 setImage:v35 forState:0];

          CGFloat v36 = [(MediaControlsTransportStackView *)self leftButton];
          [v36 setTouchUpInsideCommandRequest:0];
LABEL_19:
          uint64_t v37 = 1;
LABEL_20:

          uint64_t v38 = 1;
          goto LABEL_21;
        }
        double v33 = [v16 dislikeCommand];
        if ([v33 presentationStyle] == 3)
        {

          goto LABEL_17;
        }
        CGRect v66 = [v16 wishlistCommand];
        uint64_t v67 = [v66 presentationStyle];

        if (v67 == 3) {
          goto LABEL_18;
        }
        CGRect v68 = [v16 seekCommand];
        CGRect v69 = [v68 preferredBackwardJumpIntervals];
        uint64_t v70 = [v69 count];

        if (v70)
        {
          CGRect v71 = [v16 seekCommand];
          CGRect v72 = [v71 preferredBackwardJumpIntervals];
          CGRect v73 = [v72 firstObject];
          [v73 doubleValue];
          double v75 = v74;

          v76 = [v16 seekCommand];
          CGFloat v36 = [v76 jumpByInterval:v75];

          v77 = +[MediaControlsTheme goBackwardImageForTimeInterval:v75];
          v78 = [(MediaControlsTransportStackView *)self leftButton];
          [v78 setImage:v77 forState:0];

          v79 = [(MediaControlsTransportStackView *)self leftButton];
          [v79 setTouchUpInsideCommandRequest:v36];

LABEL_35:
          uint64_t v37 = 0;
          goto LABEL_20;
        }
        v80 = [v16 likeCommand];
        if (v80)
        {
        }
        else
        {
          v81 = [v16 dislikeCommand];

          if (!v81)
          {
            v85 = [(MediaControlsTransportStackView *)self leftButton];
            v86 = +[MediaControlsTheme backwardImage];
            [v85 setImage:v86 forState:0];

            if (!v96)
            {
              uint64_t v37 = 0;
              uint64_t v38 = 0;
LABEL_21:
              double v39 = [(MediaControlsTransportStackView *)self leftButton];
              [v39 setShouldPresentActionSheet:v37];

              double v40 = [(MPCPlayerResponse *)*p_response tracklist];
              double v41 = [v40 changeItemCommand];
              double v42 = [v41 nextItem];

              double v43 = [v16 seekCommand];
              double v44 = [v43 preferredForwardJumpIntervals];
              uint64_t v45 = [v44 count];

              if (v45)
              {
                double v46 = [v16 seekCommand];
                v47 = [v46 preferredForwardJumpIntervals];
                v48 = [v47 firstObject];
                [v48 doubleValue];
                double v50 = v49;

                v51 = [v16 seekCommand];
                v52 = [v51 jumpByInterval:v50];

                v53 = +[MediaControlsTheme goForwardImageForTimeInterval:v50];
                objc_super v54 = [(MediaControlsTransportStackView *)self rightButton];
                [v54 setImage:v53 forState:0];

                CGRect v55 = [(MediaControlsTransportStackView *)self rightButton];
                [v55 setTouchUpInsideCommandRequest:v52];
              }
              else
              {
                CGRect v60 = [(MediaControlsTransportStackView *)self rightButton];
                CGRect v61 = +[MediaControlsTheme forwardImage];
                [v60 setImage:v61 forState:0];

                if (!v42)
                {
                  uint64_t v56 = 0;
                  goto LABEL_25;
                }
                CGRect v62 = [(MediaControlsTransportStackView *)self rightButton];
                [v62 setTouchUpInsideCommandRequest:v42];

                CGRect v63 = [v16 seekCommand];
                v52 = [v63 beginSeekWithDirection:1];

                CGRect v64 = [v16 seekCommand];
                v53 = [v64 endSeek];

                if (v52)
                {
                  CGRect v65 = [(MediaControlsTransportStackView *)self rightButton];
                  [v65 setHoldBeginCommandRequest:v52];
                }
                if (!v53)
                {
LABEL_24:

                  uint64_t v56 = 1;
LABEL_25:
                  CGRect v57 = [(MediaControlsTransportStackView *)self leftButton];
                  [v57 setUserInteractionEnabled:v38];

                  CGRect v58 = [(MediaControlsTransportStackView *)self middleButton];
                  [v58 setUserInteractionEnabled:v93];

                  CGRect v59 = [(MediaControlsTransportStackView *)self rightButton];
                  [v59 setUserInteractionEnabled:v56];

                  [(MediaControlsTransportStackView *)self _updateButtonLayout];
                  [(MediaControlsTransportStackView *)self _updateVisualStylingForButtons];
                  [(MediaControlsTransportStackView *)self setNeedsLayout];

                  goto LABEL_26;
                }
                CGRect v55 = [(MediaControlsTransportStackView *)self rightButton];
                [v55 setHoldEndCommandRequest:v53];
              }

              goto LABEL_24;
            }
            v87 = [(MediaControlsTransportStackView *)self leftButton];
            [v87 setTouchUpInsideCommandRequest:v96];

            v88 = [v16 seekCommand];
            CGFloat v36 = [v88 beginSeekWithDirection:-1];

            v89 = [v16 seekCommand];
            v90 = [v89 endSeek];

            if (v36)
            {
              v91 = [(MediaControlsTransportStackView *)self leftButton];
              [v91 setHoldBeginCommandRequest:v36];
            }
            if (v90)
            {
              v92 = [(MediaControlsTransportStackView *)self leftButton];
              [v92 setHoldEndCommandRequest:v90];
            }
            goto LABEL_35;
          }
        }
        v82 = [v16 likeCommand];
        if ([v82 value]) {
          +[MediaControlsTheme starFillImage];
        }
        else {
        CGFloat v36 = +[MediaControlsTheme starImage];
        }

        v83 = [(MediaControlsTransportStackView *)self leftButton];
        [v83 setImage:v36 forState:0];

        v84 = [(MediaControlsTransportStackView *)self leftButton];
        [v84 setTouchUpInsideCommandRequest:0];

        goto LABEL_19;
      }
      CGFloat v28 = [(MediaControlsTransportStackView *)self middleButton];
      double v29 = +[MediaControlsTheme playImage];
      [v28 setImage:v29 forState:0];

      double v23 = [(MediaControlsTransportStackView *)self middleButton];
      CGFloat v24 = v23;
      double v25 = (void *)v17;
    }
    [v23 setTouchUpInsideCommandRequest:v25];

    unsigned int v93 = 1;
    goto LABEL_14;
  }
LABEL_26:
}

- (void)updateOnRouteChange
{
  [(MediaControlsTransportStackView *)self _updateButtonLayout];

  [(MediaControlsTransportStackView *)self _updateVisualStylingForButtons];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 44.0;
  result.CGFloat height = v3;
  return result;
}

- (void)setVisualStylingProvider:(id)a3
{
  char v5 = (MTVisualStylingProvider *)a3;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    double v7 = v5;
    [(MTVisualStylingProvider *)visualStylingProvider _removeObserver:self];
    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    [(MTVisualStylingProvider *)self->_visualStylingProvider _addObserver:self];
    [(MediaControlsTransportStackView *)self _updateVisualStylingForButtons];
    char v5 = v7;
  }
}

- (void)_updateVisualStylingForButtons
{
  double v3 = [(MediaControlsTransportStackView *)self tvRemoteButton];
  [(MediaControlsTransportStackView *)self _updateButtonVisualStyling:v3];

  id v4 = [(MediaControlsTransportStackView *)self leftButton];
  [(MediaControlsTransportStackView *)self _updateButtonVisualStyling:v4];

  char v5 = [(MediaControlsTransportStackView *)self middleButton];
  [(MediaControlsTransportStackView *)self _updateButtonVisualStyling:v5];

  v6 = [(MediaControlsTransportStackView *)self rightButton];
  [(MediaControlsTransportStackView *)self _updateButtonVisualStyling:v6];

  id v7 = [(MediaControlsTransportStackView *)self languageOptionsButton];
  [(MediaControlsTransportStackView *)self _updateButtonVisualStyling:v7];
}

- (void)_updateButtonVisualStyling:(id)a3
{
  id v12 = a3;
  int v4 = [v12 isUserInteractionEnabled];
  visualStylingProvider = self->_visualStylingProvider;
  if (v4)
  {
    if (visualStylingProvider)
    {
      v6 = [v12 imageView];
      id v7 = self->_visualStylingProvider;
      uint64_t v8 = 0;
LABEL_6:
      double v9 = [(MTVisualStylingProvider *)v7 _visualStylingForStyle:v8];
      objc_msgSend(v6, "mt_replaceVisualStyling:", v9);
      goto LABEL_10;
    }
  }
  else if (visualStylingProvider)
  {
    v6 = [v12 imageView];
    id v7 = self->_visualStylingProvider;
    uint64_t v8 = 2;
    goto LABEL_6;
  }
  int v10 = [v12 isUserInteractionEnabled];
  v6 = [(MediaControlsTransportStackView *)self tintColor];
  if (v10)
  {
    [v12 setTintColor:v6];
    goto LABEL_11;
  }
  double v9 = [(MediaControlsTransportStackView *)self traitCollection];
  double v11 = objc_msgSend(v6, "tertiaryColorForInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));
  [v12 setTintColor:v11];

LABEL_10:
LABEL_11:
}

- (id)_createTransportButton
{
  double v3 = +[MPButton easyTouchButtonWithType:0];
  [v3 setUserInteractionEnabled:0];
  int v4 = [v3 imageView];
  [v4 setContentMode:1];

  [(MediaControlsTransportStackView *)self addSubview:v3];

  return v3;
}

- (void)_resetTransportButton:(id)a3
{
  id v3 = a3;
  [v3 setTouchUpInsideCommandRequest:0];
  [v3 setHoldBeginCommandRequest:0];
  [v3 setHoldEndCommandRequest:0];
  [v3 setShouldPresentActionSheet:0];
}

- (void)_updateButtonLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionsDelegate);
  uint64_t v4 = [WeakRetained shouldShowTVRemoteButton];

  char v5 = [(MediaControlsTransportStackView *)self tvRemoteButton];
  [v5 setHidden:v4 ^ 1];

  v6 = [(MediaControlsTransportStackView *)self tvRemoteButton];
  [v6 setUserInteractionEnabled:v4];

  id v7 = [(MPCPlayerResponse *)self->_response tracklist];
  uint64_t v8 = [v7 playingItem];
  id v12 = [v8 languageOptionGroups];

  if ([v12 count]) {
    BOOL v9 = [v12 indexOfObjectPassingTest:&__block_literal_global_31] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v9 = 0;
  }
  int v10 = [(MediaControlsTransportStackView *)self languageOptionsButton];
  [v10 setHidden:v4 ^ 1];

  double v11 = [(MediaControlsTransportStackView *)self languageOptionsButton];
  [v11 setUserInteractionEnabled:v9];

  [(MediaControlsTransportStackView *)self _updateButtonConfiguration];
  self->_shouldShowTVRemoteButton = v4;
  [(MediaControlsTransportStackView *)self setNeedsLayout];
}

BOOL __54__MediaControlsTransportStackView__updateButtonLayout__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 numberOfOptions] > 1;
}

- (void)_updateButtonConfiguration
{
  tvRemoteButton = self->_tvRemoteButton;
  if (self->_style == 1)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:20.0];
    [(MediaControlsTransportButton *)tvRemoteButton setPreferredSymbolConfiguration:v4 forImageInState:0];

    p_leftButton = &self->_leftButton;
    leftButton = self->_leftButton;
    id v7 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:20.0];
    [(MediaControlsTransportButton *)leftButton setPreferredSymbolConfiguration:v7 forImageInState:0];

    p_middleButton = &self->_middleButton;
    middleButton = self->_middleButton;
    int v10 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:3 scale:20.0];
    [(MediaControlsTransportButton *)middleButton setPreferredSymbolConfiguration:v10 forImageInState:0];

    p_rightButton = &self->_rightButton;
    rightButton = self->_rightButton;
    char v13 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:20.0];
    [(MediaControlsTransportButton *)rightButton setPreferredSymbolConfiguration:v13 forImageInState:0];

    p_languageOptionsButton = &self->_languageOptionsButton;
    languageOptionsButton = self->_languageOptionsButton;
    double v16 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:20.0];
    [(MediaControlsTransportButton *)languageOptionsButton setPreferredSymbolConfiguration:v16 forImageInState:0];
    double v17 = 0.86459;
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:32.0];
    [(MediaControlsTransportButton *)tvRemoteButton setPreferredSymbolConfiguration:v18 forImageInState:0];

    p_leftButton = &self->_leftButton;
    CGFloat v19 = self->_leftButton;
    double v20 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:32.0];
    [(MediaControlsTransportButton *)v19 setPreferredSymbolConfiguration:v20 forImageInState:0];

    p_middleButton = &self->_middleButton;
    double v21 = self->_middleButton;
    CGFloat v22 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:3 scale:32.0];
    [(MediaControlsTransportButton *)v21 setPreferredSymbolConfiguration:v22 forImageInState:0];

    p_rightButton = &self->_rightButton;
    double v23 = self->_rightButton;
    CGFloat v24 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:32.0];
    [(MediaControlsTransportButton *)v23 setPreferredSymbolConfiguration:v24 forImageInState:0];

    p_languageOptionsButton = &self->_languageOptionsButton;
    double v25 = self->_languageOptionsButton;
    double v16 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:32.0];
    [(MediaControlsTransportButton *)v25 setPreferredSymbolConfiguration:v16 forImageInState:0];
    double v17 = 1.4;
  }

  [(MediaControlsTransportButton *)self->_tvRemoteButton setCursorScale:v17];
  [(MediaControlsTransportButton *)*p_leftButton setCursorScale:v17];
  [(MediaControlsTransportButton *)*p_middleButton setCursorScale:v17];
  [(MediaControlsTransportButton *)*p_rightButton setCursorScale:v17];
  CGFloat v26 = *p_languageOptionsButton;

  [(MediaControlsTransportButton *)v26 setCursorScale:v17];
}

- (int64_t)style
{
  return self->_style;
}

- (MPCPlayerResponse)response
{
  return self->_response;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (void)setEmpty:(BOOL)a3
{
  self->_emptCGFloat y = a3;
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (MediaControlsActionsDelegate)actionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionsDelegate);

  return (MediaControlsActionsDelegate *)WeakRetained;
}

- (void)setActionsDelegate:(id)a3
{
}

- (MediaControlsTransportButton)tvRemoteButton
{
  return self->_tvRemoteButton;
}

- (void)setTvRemoteButton:(id)a3
{
}

- (MediaControlsTransportButton)leftButton
{
  return self->_leftButton;
}

- (void)setLeftButton:(id)a3
{
}

- (MediaControlsTransportButton)middleButton
{
  return self->_middleButton;
}

- (void)setMiddleButton:(id)a3
{
}

- (MediaControlsTransportButton)rightButton
{
  return self->_rightButton;
}

- (void)setRightButton:(id)a3
{
}

- (MediaControlsTransportButton)languageOptionsButton
{
  return self->_languageOptionsButton;
}

- (void)setLanguageOptionsButton:(id)a3
{
}

- (BOOL)shouldShowTVRemoteButton
{
  return self->_shouldShowTVRemoteButton;
}

- (void)setShouldShowTVRemoteButton:(BOOL)a3
{
  self->_shouldShowTVRemoteButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageOptionsButton, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_middleButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_tvRemoteButton, 0);
  objc_destroyWeak((id *)&self->_actionsDelegate);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);

  objc_storeStrong((id *)&self->_response, 0);
}

@end