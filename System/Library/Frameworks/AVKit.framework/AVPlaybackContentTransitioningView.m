@interface AVPlaybackContentTransitioningView
- (AVPlaybackContentContainerView)activeContentView;
- (AVPlaybackContentContainerView)incomingContentView;
- (AVPlaybackContentTransitioningView)initWithFrame:(CGRect)a3 activeContentView:(id)a4;
- (AVPlaybackContentTransitioningViewDelegate)contentTransitioningDelegate;
- (BOOL)_canTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
- (BOOL)_isAdjustingBoundsOrContentSize;
- (BOOL)canShowStatusBarBackgroundGradientWhenStatusBarVisible;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isPlayingOnSecondScreen;
- (BOOL)isTransitionInteractive;
- (CGRect)_frameExcludingActiveContent;
- (CGRect)_frameExcludingTransitioningContent;
- (CGRect)frameForActiveContentView;
- (CGRect)frameForTransitioningContentView;
- (CGRect)videoContentFrame;
- (NSString)stateDescription;
- (NSValue)targetContentOffset;
- (double)transitionProgress;
- (id)_descriptionForState:(int64_t)a3;
- (id)_makeStateDescription;
- (int64_t)boundsOrContentSizeAdjustmentCount;
- (int64_t)transitionDirection;
- (int64_t)transitionState;
- (void)_ensureContentViews;
- (void)_performBoundsOrContentSizeAdjustment:(id)a3;
- (void)_setTransitionState:(id)a3 transitionDirection:(id)a4 transitionProgress:(id)a5;
- (void)_updateSizeAndContentFrame;
- (void)_updateTransitionStateIfPossible;
- (void)performTransition:(int64_t)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBoundsOrContentSizeAdjustmentCount:(int64_t)a3;
- (void)setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:(BOOL)a3;
- (void)setContentTransitioningDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFrameForActiveContentView:(CGRect)a3;
- (void)setFrameForTransitioningContentView:(CGRect)a3;
- (void)setPlayingOnSecondScreen:(BOOL)a3;
- (void)setStateDescription:(id)a3;
- (void)setTargetContentOffset:(id)a3;
- (void)setTransitionInteractive:(BOOL)a3;
- (void)setVideoContentFrame:(CGRect)a3;
- (void)setVideoGravity:(int64_t)a3 removingAllSublayerTransformAnimations:(BOOL)a4;
@end

@implementation AVPlaybackContentTransitioningView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateDescription, 0);
  objc_storeStrong((id *)&self->_targetContentOffset, 0);
  objc_storeStrong((id *)&self->_incomingContentView, 0);
  objc_destroyWeak((id *)&self->_contentTransitioningDelegate);

  objc_storeStrong((id *)&self->_activeContentView, 0);
}

- (void)setBoundsOrContentSizeAdjustmentCount:(int64_t)a3
{
  self->_boundsOrContentSizeAdjustmentCount = a3;
}

- (int64_t)boundsOrContentSizeAdjustmentCount
{
  return self->_boundsOrContentSizeAdjustmentCount;
}

- (void)setFrameForTransitioningContentView:(CGRect)a3
{
  self->_frameForTransitioningContentView = a3;
}

- (CGRect)frameForTransitioningContentView
{
  double x = self->_frameForTransitioningContentView.origin.x;
  double y = self->_frameForTransitioningContentView.origin.y;
  double width = self->_frameForTransitioningContentView.size.width;
  double height = self->_frameForTransitioningContentView.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrameForActiveContentView:(CGRect)a3
{
  self->_frameForActiveContentView = a3;
}

- (CGRect)frameForActiveContentView
{
  double x = self->_frameForActiveContentView.origin.x;
  double y = self->_frameForActiveContentView.origin.y;
  double width = self->_frameForActiveContentView.size.width;
  double height = self->_frameForActiveContentView.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)stateDescription
{
  return self->_stateDescription;
}

- (void)setTargetContentOffset:(id)a3
{
}

- (NSValue)targetContentOffset
{
  return self->_targetContentOffset;
}

- (void)setTransitionInteractive:(BOOL)a3
{
  self->_transitionInteractive = a3;
}

- (BOOL)isTransitionInteractive
{
  return self->_transitionInteractive;
}

- (AVPlaybackContentContainerView)incomingContentView
{
  return self->_incomingContentView;
}

- (void)setContentTransitioningDelegate:(id)a3
{
}

- (AVPlaybackContentTransitioningViewDelegate)contentTransitioningDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentTransitioningDelegate);

  return (AVPlaybackContentTransitioningViewDelegate *)WeakRetained;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (int64_t)transitionDirection
{
  return self->_transitionDirection;
}

- (int64_t)transitionState
{
  return self->_transitionState;
}

- (AVPlaybackContentContainerView)activeContentView
{
  return self->_activeContentView;
}

- (BOOL)isPlayingOnSecondScreen
{
  return self->_playingOnSecondScreen;
}

- (id)_makeStateDescription
{
  v3 = [(AVPlaybackContentTransitioningView *)self _descriptionForState:[(AVPlaybackContentTransitioningView *)self transitionState]];
  unint64_t v4 = [(AVPlaybackContentTransitioningView *)self transitionDirection];
  if (v4 > 3) {
    v5 = 0;
  }
  else {
    v5 = off_1E5FC2EB8[v4];
  }
  v6 = [NSString stringWithFormat:@"%@ %@", v3, v5];

  return v6;
}

- (id)_descriptionForState:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return 0;
  }
  else {
    return off_1E5FC2E78[a3];
  }
}

- (void)setStateDescription:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_stateDescription isEqualToString:v4])
  {
    v5 = (NSString *)[v4 copy];
    stateDescription = self->_stateDescription;
    self->_stateDescription = v5;

    v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_stateDescription;
      [(AVPlaybackContentTransitioningView *)self contentOffset];
      v9 = NSStringFromCGPoint(v23);
      [(AVPlaybackContentTransitioningView *)self frameForActiveContentView];
      v10 = NSStringFromCGPoint(v24);
      [(AVPlaybackContentTransitioningView *)self frameForTransitioningContentView];
      v11 = NSStringFromCGPoint(v25);
      int v12 = 136316162;
      v13 = "-[AVPlaybackContentTransitioningView setStateDescription:]";
      __int16 v14 = 2112;
      v15 = v8;
      __int16 v16 = 2112;
      v17 = v9;
      __int16 v18 = 2112;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ Offset: %@ ActiveOrigin: %@ TransitioningOrigin: %@", (uint8_t *)&v12, 0x34u);
    }
  }
}

- (BOOL)_canTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  switch(a4)
  {
    case 0:
      BOOL v4 = (unint64_t)a3 >= 8;
      unsigned int v5 = 165;
      goto LABEL_10;
    case 1:
      BOOL v7 = a3 == 0;
      goto LABEL_12;
    case 2:
      BOOL v4 = (unint64_t)a3 >= 8;
      unsigned int v5 = 6;
      goto LABEL_10;
    case 3:
      BOOL v4 = (unint64_t)a3 >= 8;
      unsigned int v5 = 90;
      goto LABEL_10;
    case 4:
      BOOL v4 = (unint64_t)a3 >= 8;
      unsigned int v5 = 24;
      goto LABEL_10;
    case 5:
      BOOL v7 = a3 == 4;
      goto LABEL_12;
    case 6:
      BOOL v4 = (unint64_t)a3 >= 8;
      unsigned int v5 = 72;
LABEL_10:
      BOOL v8 = (v5 >> a3) & 1;
      goto LABEL_16;
    case 7:
      BOOL v7 = a3 == 6;
LABEL_12:
      LOBYTE(v8) = v7;
      BOOL v4 = (unint64_t)a3 >= 8;
LABEL_16:
      BOOL result = !v4 && v8;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (CGRect)_frameExcludingTransitioningContent
{
  v3 = (double *)MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(AVPlaybackContentTransitioningView *)self contentSize];
  double v6 = v5;
  double v8 = v7;
  [(AVPlaybackContentTransitioningView *)self frameForTransitioningContentView];
  double Width = CGRectGetWidth(v14);
  [(AVPlaybackContentTransitioningView *)self frameForTransitioningContentView];
  if (CGRectGetMinX(v15) == 0.0)
  {
    [(AVPlaybackContentTransitioningView *)self frameForTransitioningContentView];
    double MaxX = CGRectGetMaxX(v16);
  }
  else
  {
    double MaxX = *v3;
  }
  double v11 = v6 - Width;
  double v12 = v4;
  double v13 = v8;
  result.size.double height = v13;
  result.size.double width = v11;
  result.origin.double y = v12;
  result.origin.double x = MaxX;
  return result;
}

- (CGRect)_frameExcludingActiveContent
{
  v3 = (double *)MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(AVPlaybackContentTransitioningView *)self contentSize];
  double v6 = v5;
  double v8 = v7;
  [(AVPlaybackContentTransitioningView *)self frameForActiveContentView];
  double Width = CGRectGetWidth(v14);
  [(AVPlaybackContentTransitioningView *)self frameForActiveContentView];
  if (CGRectGetMinX(v15) == 0.0)
  {
    [(AVPlaybackContentTransitioningView *)self frameForActiveContentView];
    double MaxX = CGRectGetMaxX(v16);
  }
  else
  {
    double MaxX = *v3;
  }
  double v11 = v6 - Width;
  double v12 = v4;
  double v13 = v8;
  result.size.double height = v13;
  result.size.double width = v11;
  result.origin.double y = v12;
  result.origin.double x = MaxX;
  return result;
}

- (void)_ensureContentViews
{
  v3 = [(AVPlaybackContentTransitioningView *)self activeContentView];
  [(AVPlaybackContentTransitioningView *)self frameForActiveContentView];
  objc_msgSend(v3, "setFrame:");

  double v4 = [(AVPlaybackContentTransitioningView *)self incomingContentView];
  [(AVPlaybackContentTransitioningView *)self frameForTransitioningContentView];
  objc_msgSend(v4, "setFrame:");

  double v5 = [(AVPlaybackContentTransitioningView *)self activeContentView];
  double v6 = [v5 superview];

  if (v6 != self)
  {
    double v7 = [(AVPlaybackContentTransitioningView *)self activeContentView];
    [(AVPlaybackContentTransitioningView *)self addSubview:v7];
  }
  uint64_t v8 = [(AVPlaybackContentTransitioningView *)self incomingContentView];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(AVPlaybackContentTransitioningView *)self incomingContentView];
    double v11 = [v10 superview];

    if (v11 != self)
    {
      id v12 = [(AVPlaybackContentTransitioningView *)self incomingContentView];
      [(AVPlaybackContentTransitioningView *)self addSubview:v12];
    }
  }
}

- (void)_updateSizeAndContentFrame
{
  [(AVPlaybackContentTransitioningView *)self frameForActiveContentView];
  *(void *)v58 = v3;
  *(void *)&v58[8] = v4;
  *(void *)&v58[16] = v5;
  *(void *)&v58[24] = v6;
  [(AVPlaybackContentTransitioningView *)self frameForTransitioningContentView];
  double v8 = v7;
  double v55 = v10;
  double v56 = v9;
  double v54 = v11;
  double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  CGFloat v57 = *MEMORY[0x1E4F1DAD8];
  [(AVPlaybackContentTransitioningView *)self bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = *MEMORY[0x1E4F1DB28];
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  unint64_t v21 = [(AVPlaybackContentTransitioningView *)self transitionState];
  if (v21 <= 6 && ((1 << v21) & 0x58) != 0)
  {
    int64_t v22 = [(AVPlaybackContentTransitioningView *)self transitionDirection];
    if (v22 == 3)
    {
      [(AVPlaybackContentTransitioningView *)self _interpageSpacing];
      double v26 = v25;
      v60.origin.double x = v57;
      v60.origin.double y = v12;
      v60.size.double width = v14;
      v60.size.double height = v16;
      double v18 = v26 + CGRectGetWidth(v60);
      double v20 = v16;
      double v19 = v14;
      double v23 = v12;
      double v24 = v57;
    }
    else if (v22 == 2)
    {
      [(AVPlaybackContentTransitioningView *)self _interpageSpacing];
      double v28 = v27;
      v61.origin.double x = v18;
      v61.origin.double y = v17;
      v61.size.double width = v14;
      v61.size.double height = v16;
      double v24 = v28 + CGRectGetWidth(v61);
      double v20 = v16;
      double v19 = v14;
      double v23 = v12;
    }
    else
    {
      if (v22 == 1)
      {
        double v20 = v54;
        double v19 = v55;
        double v17 = v56;
        double v18 = v8;
        double v16 = *(double *)&v58[24];
        double v14 = *(double *)&v58[16];
        double v23 = *(double *)&v58[8];
      }
      else
      {
        double v23 = v12;
      }
      double v24 = v57;
      if (v22 == 1) {
        double v24 = *(double *)v58;
      }
    }
  }
  else
  {
    double v23 = v12;
    double v24 = v57;
  }
  -[AVPlaybackContentTransitioningView setFrameForActiveContentView:](self, "setFrameForActiveContentView:", v24, v23, v14, v16);
  -[AVPlaybackContentTransitioningView setFrameForTransitioningContentView:](self, "setFrameForTransitioningContentView:", v18, v17, v19, v20);
  [(AVPlaybackContentTransitioningView *)self bounds];
  double v30 = v29;
  double v32 = v31;
  int64_t v33 = [(AVPlaybackContentTransitioningView *)self transitionState];
  if ((unint64_t)(v33 - 3) < 2)
  {
LABEL_16:
    [(AVPlaybackContentTransitioningView *)self bounds];
    double Width = CGRectGetWidth(v62);
    [(AVPlaybackContentTransitioningView *)self _interpageSpacing];
    double v30 = v35 + Width * 2.0;
    goto LABEL_18;
  }
  if (v33 != 7)
  {
    if (v33 != 6) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  *(double *)&v58[16] = v55;
  *(double *)&v58[24] = v54;
  *(double *)v58 = v8;
  *(double *)&v58[8] = v56;
LABEL_18:
  [(AVPlaybackContentTransitioningView *)self contentSize];
  if (v30 != v37 || v32 != v36)
  {
    [(AVPlaybackContentTransitioningView *)self contentOffset];
    double v40 = v39;
    -[AVPlaybackContentTransitioningView setContentSize:](self, "setContentSize:", v30, v32);
    [(AVPlaybackContentTransitioningView *)self bounds];
    if (v30 > CGRectGetWidth(v63))
    {
      [(AVPlaybackContentTransitioningView *)self bounds];
      *(void *)&v58[16] = v41;
      *(void *)&v58[24] = v42;
      *(CGFloat *)v58 = v57;
      *(double *)&v58[8] = v12;
    }
    CGFloat v43 = CGRectGetMinX(*(CGRect *)v58) - v40;
    [(AVPlaybackContentTransitioningView *)self frameForActiveContentView];
    double MinX = CGRectGetMinX(v64);
    [(AVPlaybackContentTransitioningView *)self contentOffset];
    double v46 = MinX - v45;
    [(AVPlaybackContentTransitioningView *)self contentOffset];
    double v48 = v47;
    double v50 = v49 + v46 - v43;
    [(AVPlaybackContentTransitioningView *)self contentOffset];
    if (v50 != v52 || v48 != v51) {
      -[AVPlaybackContentTransitioningView setContentOffset:](self, "setContentOffset:", v50, v48);
    }
  }

  [(AVPlaybackContentTransitioningView *)self _ensureContentViews];
}

- (BOOL)_isAdjustingBoundsOrContentSize
{
  return [(AVPlaybackContentTransitioningView *)self boundsOrContentSizeAdjustmentCount] != 0;
}

- (void)_performBoundsOrContentSizeAdjustment:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  [(AVPlaybackContentTransitioningView *)self setBoundsOrContentSizeAdjustmentCount:[(AVPlaybackContentTransitioningView *)self boundsOrContentSizeAdjustmentCount]+ 1];
  v4[2](v4);

  int64_t v5 = [(AVPlaybackContentTransitioningView *)self boundsOrContentSizeAdjustmentCount]- 1;

  [(AVPlaybackContentTransitioningView *)self setBoundsOrContentSizeAdjustmentCount:v5];
}

- (void)_updateTransitionStateIfPossible
{
  if ([(AVPlaybackContentTransitioningView *)self _isAdjustingBoundsOrContentSize]) {
    return;
  }
  unint64_t v3 = [(AVPlaybackContentTransitioningView *)self transitionState];
  if (v3 <= 7 && ((1 << v3) & 0xA7) != 0)
  {
    if ([(AVPlaybackContentTransitioningView *)self _isHorizontalBouncing])
    {
      uint64_t v4 = &unk_1F0949FE0;
      goto LABEL_14;
    }
    [(AVPlaybackContentTransitioningView *)self contentOffset];
    double v6 = v5;
    double v8 = v7;
    [(AVPlaybackContentTransitioningView *)self frameForActiveContentView];
    if (v6 == v10 && v8 == v9)
    {
      uint64_t v4 = &unk_1F094A028;
      goto LABEL_14;
    }
    double v11 = NSNumber;
    [(AVPlaybackContentTransitioningView *)self contentOffset];
    double v13 = v12;
    [(AVPlaybackContentTransitioningView *)self frameForActiveContentView];
    if (v13 <= CGRectGetMinX(v25)) {
      int64_t v14 = 2;
    }
    else {
      int64_t v14 = 3;
    }
  }
  else
  {
    double v11 = NSNumber;
    int64_t v14 = [(AVPlaybackContentTransitioningView *)self transitionDirection];
  }
  uint64_t v4 = [v11 numberWithInteger:v14];
LABEL_14:
  id v23 = v4;
  [(AVPlaybackContentTransitioningView *)self contentSize];
  double v16 = v15;
  [(AVPlaybackContentTransitioningView *)self frameForActiveContentView];
  double v17 = v16 - CGRectGetWidth(v26);
  if (v17 > 0.0)
  {
    uint64_t v18 = [v23 integerValue];
    if (v18 == 3)
    {
      double v19 = NSNumber;
      [(AVPlaybackContentTransitioningView *)self contentOffset];
      goto LABEL_20;
    }
    if (v18 == 2)
    {
      double v19 = NSNumber;
      [(AVPlaybackContentTransitioningView *)self contentOffset];
      double v21 = v17 - v20;
LABEL_20:
      int64_t v22 = [v19 numberWithDouble:v21 / v17];
      goto LABEL_21;
    }
  }
  int64_t v22 = 0;
LABEL_21:
  [(AVPlaybackContentTransitioningView *)self _setTransitionState:0 transitionDirection:v23 transitionProgress:v22];
}

- (void)performTransition:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(AVPlaybackContentTransitioningView *)self transitionState];
  if ((unint64_t)(v5 - 1) >= 7)
  {
    if (!v5)
    {
      double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (a3 == 2)
      {
        [(AVPlaybackContentTransitioningView *)self bounds];
        double Width = CGRectGetWidth(v21);
        [(AVPlaybackContentTransitioningView *)self _interpageSpacing];
        double v10 = Width + v9;
      }
      else if (a3 == 3)
      {
        [(AVPlaybackContentTransitioningView *)self bounds];
        double v11 = CGRectGetWidth(v22);
        [(AVPlaybackContentTransitioningView *)self _interpageSpacing];
        double v10 = -(v11 + v12);
      }
      else
      {
        double v10 = *MEMORY[0x1E4F1DAD8];
      }
      int64_t v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v10, v7);
      [(AVPlaybackContentTransitioningView *)self setTargetContentOffset:v14];

      -[AVPlaybackContentTransitioningView setContentOffset:animated:](self, "setContentOffset:animated:", 1, v10, v7);
    }
  }
  else
  {
    double v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      double v13 = [(AVPlaybackContentTransitioningView *)self stateDescription];
      int v15 = 138412546;
      double v16 = self;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      _os_log_error_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_ERROR, "Instance %@ attempted content transition while one was already active. Ignoring. %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)_setTransitionState:(id)a3 transitionDirection:(id)a4 transitionProgress:(id)a5
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v161 = v8;
  if ([(AVPlaybackContentTransitioningView *)self _isAdjustingBoundsOrContentSize])
  {
    double v11 = _AVLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_ERROR, "Attempt to transition while adjusting bounds.", buf, 2u);
    }

    id v8 = v161;
  }
  int64_t transitionState = self->_transitionState;
  int64_t transitionDirection = self->_transitionDirection;
  double transitionProgress = self->_transitionProgress;
  unint64_t v15 = transitionState;
  if (v8) {
    unint64_t v15 = [v8 integerValue];
  }
  int64_t v16 = transitionDirection;
  if (v9) {
    int64_t v16 = [v9 integerValue];
  }
  double v17 = transitionProgress;
  if (v10)
  {
    [v10 doubleValue];
    double v17 = v18;
  }
  v160 = v10;
  id v19 = v9;
  if (![(AVPlaybackContentTransitioningView *)self _canTransitionFromState:transitionState toState:v15])
  {
    double v20 = _AVLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v159 = [(AVPlaybackContentTransitioningView *)self _descriptionForState:transitionState];
      v158 = [(AVPlaybackContentTransitioningView *)self _descriptionForState:v15];
      *(_DWORD *)buf = 138412546;
      v164 = v159;
      __int16 v165 = 2112;
      v166 = v158;
      _os_log_error_impl(&dword_1B05B7000, v20, OS_LOG_TYPE_ERROR, "Invalid state transition from %@ to %@.", buf, 0x16u);
    }
  }
  if (v15 <= 7)
  {
    if (((1 << v15) & 0x27) != 0)
    {
      double v17 = 0.0;
    }
    else if (((1 << v15) & 0x58) != 0)
    {
      double v17 = fmin(fmax(v17, 0.0), 1.0);
    }
    else
    {
      double v17 = 1.0;
    }
  }
  self->_int64_t transitionDirection = v16;
  self->_double transitionProgress = v17;
  self->_int64_t transitionState = v15;
  v162[0] = MEMORY[0x1E4F143A8];
  v162[1] = 3221225472;
  v162[2] = __97__AVPlaybackContentTransitioningView__setTransitionState_transitionDirection_transitionProgress___block_invoke;
  v162[3] = &unk_1E5FC36E8;
  v162[5] = v15;
  v162[6] = transitionState;
  v162[4] = self;
  [(AVPlaybackContentTransitioningView *)self _performBoundsOrContentSizeAdjustment:v162];
  CGRect v21 = [(AVPlaybackContentTransitioningView *)self _makeStateDescription];
  [(AVPlaybackContentTransitioningView *)self setStateDescription:v21];

  CGRect v22 = [(AVPlaybackContentTransitioningView *)self contentTransitioningDelegate];
  [v22 contentTransitioningViewDidChangeTransitionStatus:self oldState:transitionState oldTransitionDirection:transitionDirection oldProgress:transitionProgress];

  if (v15 != self->_transitionState)
  {
    id v23 = _AVLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v23, OS_LOG_TYPE_ERROR, "This is where the problem is.", buf, 2u);
    }
  }
  double v24 = v19;
  switch(v15)
  {
    case 0uLL:
      if (v16)
      {
        CGRect v25 = &unk_1F0949FE0;
        goto LABEL_110;
      }
      goto LABEL_112;
    case 1uLL:
      if (!v16)
      {
        CGRect v26 = _AVLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B05B7000, v26, OS_LOG_TYPE_ERROR, "Invalid state transition", buf, 2u);
        }
      }
      double v27 = [(AVPlaybackContentTransitioningView *)self contentTransitioningDelegate];
      int v28 = [v27 contentTransitioningView:self shouldBeginTransitionWithDirection:v16];

      if (v28)
      {
        double v29 = [(AVPlaybackContentTransitioningView *)self contentTransitioningDelegate];
        double v30 = [v29 contentTransitioningPlayerContentViewForTransition:self];
        incomingContentView = self->_incomingContentView;
        self->_incomingContentView = v30;

        double v32 = [(AVPlaybackContentTransitioningView *)self incomingContentView];
        objc_msgSend(v32, "setPlayingOnSecondScreen:", -[AVPlaybackContentTransitioningView isPlayingOnSecondScreen](self, "isPlayingOnSecondScreen"));

        int64_t v33 = [(AVPlaybackContentTransitioningView *)self incomingContentView];
        v34 = [(AVPlaybackContentTransitioningView *)self activeContentView];
        objc_msgSend(v33, "setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:", objc_msgSend(v34, "canShowStatusBarBackgroundGradientWhenStatusBarVisible"));

        double v35 = [(AVPlaybackContentTransitioningView *)self incomingContentView];
        double v36 = [v35 playerLayerView];
        double v37 = [(AVPlaybackContentTransitioningView *)self activeContentView];
        v38 = [v37 playerLayerView];
        objc_msgSend(v36, "setVideoGravity:", objc_msgSend(v38, "videoGravity"));

        goto LABEL_100;
      }
      CGRect v25 = &unk_1F094A010;
      goto LABEL_65;
    case 2uLL:
      double v39 = [(AVPlaybackContentTransitioningView *)self targetContentOffset];

      if (v39)
      {
        [(AVPlaybackContentTransitioningView *)self setTargetContentOffset:0];
        -[AVPlaybackContentTransitioningView setContentOffset:animated:](self, "setContentOffset:animated:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
        goto LABEL_112;
      }
      if (transitionDirection == v16) {
        goto LABEL_112;
      }
      CGRect v25 = &unk_1F094A028;
      goto LABEL_110;
    case 3uLL:
      if (!v16 && transitionState != v15)
      {
        double v40 = _AVLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B05B7000, v40, OS_LOG_TYPE_ERROR, "Invalid state transition", buf, 2u);
        }
      }
      uint64_t v41 = [(AVPlaybackContentTransitioningView *)self targetContentOffset];
      if (v41)
      {
        uint64_t v42 = [(AVPlaybackContentTransitioningView *)self targetContentOffset];
        [v42 CGPointValue];
        [(AVPlaybackContentTransitioningView *)self frameForActiveContentView];
        CGFloat v43 = self;
        UIPointRoundToViewScale();
        double v45 = v44;
        double v47 = v46;
        UIPointRoundToViewScale();
        double v49 = v48;
        double v51 = v50;

        BOOL v52 = v47 == v51 && v45 == v49;
      }
      else
      {
        BOOL v52 = 0;
      }

      v132 = [(AVPlaybackContentTransitioningView *)self targetContentOffset];
      if (v132)
      {
        v133 = [(AVPlaybackContentTransitioningView *)self targetContentOffset];
        [v133 CGPointValue];
        [(AVPlaybackContentTransitioningView *)self frameForTransitioningContentView];
        v134 = self;
        UIPointRoundToViewScale();
        double v136 = v135;
        double v138 = v137;
        UIPointRoundToViewScale();
        double v140 = v139;
        double v142 = v141;

        BOOL v143 = v138 == v142 && v136 == v140;
      }
      else
      {
        BOOL v143 = 0;
      }
      double v24 = v19;

      [(AVPlaybackContentTransitioningView *)self frameForActiveContentView];
      double MinX = CGRectGetMinX(v172);
      [(AVPlaybackContentTransitioningView *)self frameForTransitioningContentView];
      double v145 = CGRectGetMinX(v173);
      [(AVPlaybackContentTransitioningView *)self contentOffset];
      if (v16 == 3)
      {
        if (transitionDirection != 3)
        {
LABEL_104:
          BOOL v147 = v146 >= MinX;
          BOOL v148 = v146 <= v145;
          goto LABEL_106;
        }
LABEL_102:
        BOOL v147 = v146 <= MinX;
        BOOL v148 = v146 >= v145;
        goto LABEL_106;
      }
      if (v16 == 2)
      {
        if (transitionDirection == 2) {
          goto LABEL_104;
        }
        goto LABEL_102;
      }
      if (v16)
      {
        BOOL v148 = 0;
        BOOL v147 = 0;
      }
      else
      {
        BOOL v147 = v146 == MinX;
        BOOL v148 = v146 == v145;
      }
LABEL_106:
      if (v52 || v147)
      {
        CGRect v25 = &unk_1F094A040;
      }
      else
      {
        if (!v143 && !v148) {
          goto LABEL_112;
        }
        CGRect v25 = &unk_1F094A058;
      }
LABEL_110:
      v130 = self;
      v131 = 0;
      v129 = 0;
LABEL_111:
      [(AVPlaybackContentTransitioningView *)v130 _setTransitionState:v25 transitionDirection:v131 transitionProgress:v129];
LABEL_112:

      return;
    case 4uLL:
      if (transitionDirection != v16 && v16)
      {
        v53 = _AVLog();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B05B7000, v53, OS_LOG_TYPE_ERROR, "Invalid state transition", buf, 2u);
        }
      }
      if ([(AVPlaybackContentTransitioningView *)self _isHorizontalBouncing]) {
        goto LABEL_112;
      }
      [(AVPlaybackContentTransitioningView *)self bounds];
      [(AVPlaybackContentTransitioningView *)self _frameExcludingActiveContent];
      double v54 = self;
      UIPointRoundToViewScale();
      CGFloat v56 = v55;
      CGFloat v58 = v57;
      UISizeRoundToViewScale();
      CGFloat v60 = v59;
      CGFloat v62 = v61;
      self = v54;
      UIPointRoundToViewScale();
      CGFloat v64 = v63;
      CGFloat v66 = v65;
      UISizeRoundToViewScale();
      CGFloat v68 = v67;
      CGFloat v70 = v69;

      v168.origin.double x = v56;
      v168.origin.double y = v58;
      v168.size.double width = v60;
      v168.size.double height = v62;
      v174.origin.double x = v64;
      v174.origin.double y = v66;
      v174.size.double width = v68;
      v174.size.double height = v70;
      BOOL v71 = CGRectIntersectsRect(v168, v174);

      if (v71)
      {
        [(AVPlaybackContentTransitioningView *)self frameForActiveContentView];
        [(AVPlaybackContentTransitioningView *)self bounds];
        v72 = self;
        UIPointRoundToViewScale();
        CGFloat v74 = v73;
        CGFloat v76 = v75;
        UISizeRoundToViewScale();
        CGFloat v78 = v77;
        CGFloat v80 = v79;
        v81 = v72;
        UIPointRoundToViewScale();
        CGFloat v83 = v82;
        CGFloat v85 = v84;
        UISizeRoundToViewScale();
        CGFloat v87 = v86;
        CGFloat v89 = v88;

        v169.origin.double x = v74;
        v169.origin.double y = v76;
        v169.size.double width = v78;
        v169.size.double height = v80;
        v175.origin.double x = v83;
        v175.origin.double y = v85;
        v175.size.double width = v87;
        v175.size.double height = v89;
        BOOL v90 = CGRectEqualToRect(v169, v175);
      }
      else
      {
        BOOL v90 = 1;
      }
      v149 = [(AVPlaybackContentTransitioningView *)self targetContentOffset];
      int v150 = (!v149
           || [(AVPlaybackContentTransitioningView *)self isDragging]
           && ([(AVPlaybackContentTransitioningView *)self isDecelerating] & 1) == 0
           && [(AVPlaybackContentTransitioningView *)self isTracking])
          && !v90;

      if (!v90) {
        goto LABEL_99;
      }
      v151 = [(AVPlaybackContentTransitioningView *)self incomingContentView];
      [v151 removeFromSuperview];

      v152 = self->_incomingContentView;
      self->_incomingContentView = 0;

      CGRect v25 = &unk_1F094A088;
      v131 = &unk_1F094A028;
      v129 = &unk_1F094A5E8;
      goto LABEL_98;
    case 5uLL:
      CGRect v25 = &unk_1F094A028;
LABEL_65:
      v129 = &unk_1F094A5E8;
      goto LABEL_66;
    case 6uLL:
      if (transitionDirection != v16 && v16)
      {
        v91 = _AVLog();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B05B7000, v91, OS_LOG_TYPE_ERROR, "Invalid state transition", buf, 2u);
        }
      }
      if ([(AVPlaybackContentTransitioningView *)self _isHorizontalBouncing]) {
        goto LABEL_112;
      }
      [(AVPlaybackContentTransitioningView *)self bounds];
      [(AVPlaybackContentTransitioningView *)self _frameExcludingTransitioningContent];
      v92 = self;
      UIPointRoundToViewScale();
      CGFloat v94 = v93;
      CGFloat v96 = v95;
      UISizeRoundToViewScale();
      CGFloat v98 = v97;
      CGFloat v100 = v99;
      self = v92;
      UIPointRoundToViewScale();
      CGFloat v102 = v101;
      CGFloat v104 = v103;
      UISizeRoundToViewScale();
      CGFloat v106 = v105;
      CGFloat v108 = v107;

      v170.origin.double x = v94;
      v170.origin.double y = v96;
      v170.size.double width = v98;
      v170.size.double height = v100;
      v176.origin.double x = v102;
      v176.origin.double y = v104;
      v176.size.double width = v106;
      v176.size.double height = v108;
      BOOL v109 = CGRectIntersectsRect(v170, v176);

      if (v109)
      {
        [(AVPlaybackContentTransitioningView *)self frameForTransitioningContentView];
        [(AVPlaybackContentTransitioningView *)self bounds];
        v110 = self;
        UIPointRoundToViewScale();
        CGFloat v112 = v111;
        CGFloat v114 = v113;
        UISizeRoundToViewScale();
        CGFloat v116 = v115;
        CGFloat v118 = v117;
        v119 = v110;
        UIPointRoundToViewScale();
        CGFloat v121 = v120;
        CGFloat v123 = v122;
        UISizeRoundToViewScale();
        CGFloat v125 = v124;
        CGFloat v127 = v126;

        v171.origin.double x = v112;
        v171.origin.double y = v114;
        v171.size.double width = v116;
        v171.size.double height = v118;
        v177.origin.double x = v121;
        v177.origin.double y = v123;
        v177.size.double width = v125;
        v177.size.double height = v127;
        BOOL v128 = CGRectEqualToRect(v171, v177);
      }
      else
      {
        BOOL v128 = 1;
      }
      v153 = [(AVPlaybackContentTransitioningView *)self targetContentOffset];
      int v150 = (!v153
           || [(AVPlaybackContentTransitioningView *)self isDragging]
           && ([(AVPlaybackContentTransitioningView *)self isDecelerating] & 1) == 0
           && [(AVPlaybackContentTransitioningView *)self isTracking])
          && !v128;

      if (v128)
      {
        v154 = [(AVPlaybackContentTransitioningView *)self activeContentView];
        [v154 removeFromSuperview];

        v155 = [(AVPlaybackContentTransitioningView *)self incomingContentView];
        activeContentView = self->_activeContentView;
        self->_activeContentView = v155;

        [(AVPlaybackContentContainerView *)self->_activeContentView setPlayingOnSecondScreen:[(AVPlaybackContentTransitioningView *)self isPlayingOnSecondScreen]];
        v157 = self->_incomingContentView;
        self->_incomingContentView = 0;

        CGRect v25 = &unk_1F094A070;
        v131 = &unk_1F094A028;
        v129 = &unk_1F094A5F8;
LABEL_98:
        v130 = self;
        goto LABEL_111;
      }
LABEL_99:
      if (!v150) {
        goto LABEL_112;
      }
LABEL_100:
      CGRect v25 = &unk_1F0949FF8;
      goto LABEL_110;
    case 7uLL:
      CGRect v25 = &unk_1F094A028;
      v129 = &unk_1F094A5F8;
LABEL_66:
      v130 = self;
      v131 = 0;
      goto LABEL_111;
    default:
      goto LABEL_112;
  }
}

uint64_t __97__AVPlaybackContentTransitioningView__setTransitionState_transitionDirection_transitionProgress___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  BOOL v2 = v1 == 6 || v1 == 4;
  if (!v2 && (v1 != 3 || *(void *)(result + 48) == 1)) {
    return [*(id *)(result + 32) _updateSizeAndContentFrame];
  }
  return result;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(AVPlaybackContentTransitioningView *)self setTransitionInteractive:0];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(AVPlaybackContentTransitioningView *)self setTargetContentOffset:0];

  [(AVPlaybackContentTransitioningView *)self setTransitionInteractive:0];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(AVPlaybackContentTransitioningView *)self setTransitionInteractive:1];

  [(AVPlaybackContentTransitioningView *)self setTargetContentOffset:0];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a5->x;
  double y = a5->y;
  [(AVPlaybackContentTransitioningView *)self contentSize];
  double v10 = v9;
  [(AVPlaybackContentTransitioningView *)self bounds];
  if (v10 == CGRectGetWidth(v16)
    || ([(AVPlaybackContentTransitioningView *)self contentSize], x <= v11 * 0.5))
  {
    double v14 = *MEMORY[0x1E4F1DAD8];
    double y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    [(AVPlaybackContentTransitioningView *)self contentSize];
    double v13 = v12;
    [(AVPlaybackContentTransitioningView *)self bounds];
    double v14 = v13 - CGRectGetWidth(v17);
  }
  unint64_t v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v14, y);
  [(AVPlaybackContentTransitioningView *)self setTargetContentOffset:v15];

  a5->double x = v14;
  a5->double y = y;
}

- (BOOL)canShowStatusBarBackgroundGradientWhenStatusBarVisible
{
  BOOL v2 = [(AVPlaybackContentTransitioningView *)self activeContentView];
  char v3 = [v2 canShowStatusBarBackgroundGradientWhenStatusBarVisible];

  return v3;
}

- (void)setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(AVPlaybackContentTransitioningView *)self activeContentView];
  [v5 setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:v3];

  id v6 = [(AVPlaybackContentTransitioningView *)self incomingContentView];
  [v6 setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:v3];
}

- (void)setVideoGravity:(int64_t)a3 removingAllSublayerTransformAnimations:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(AVPlaybackContentTransitioningView *)self activeContentView];
  [v7 setVideoGravity:a3 removingAllSublayerTransformAnimations:v4];

  id v8 = [(AVPlaybackContentTransitioningView *)self incomingContentView];
  [v8 setVideoGravity:a3 removingAllSublayerTransformAnimations:v4];
}

- (void)setVideoContentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(AVPlaybackContentTransitioningView *)self activeContentView];
  objc_msgSend(v8, "setVideoContentFrame:", x, y, width, height);

  id v9 = [(AVPlaybackContentTransitioningView *)self incomingContentView];
  objc_msgSend(v9, "setVideoContentFrame:", x, y, width, height);
}

- (CGRect)videoContentFrame
{
  BOOL v2 = [(AVPlaybackContentTransitioningView *)self activeContentView];
  [v2 videoContentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackContentTransitioningView;
  -[AVPlaybackContentTransitioningView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AVPlaybackContentTransitioningView *)self _updateTransitionStateIfPossible];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVPlaybackContentTransitioningView;
  if ([(AVPlaybackContentTransitioningView *)&v9 gestureRecognizerShouldBegin:v4])
  {
    id v5 = [(AVPlaybackContentTransitioningView *)self panGestureRecognizer];

    if (v5 == v4)
    {
      double v7 = [(AVPlaybackContentTransitioningView *)self contentTransitioningDelegate];
      [v4 locationInView:self];
      char v6 = objc_msgSend(v7, "contentTransitioningViewShouldBeginDragging:locationInView:", self);
    }
    else
    {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlaybackContentTransitioningView;
  [(AVPlaybackContentTransitioningView *)&v3 setDelegate:a3];
}

- (void)setPlayingOnSecondScreen:(BOOL)a3
{
  BOOL v3 = a3;
  self->_playingOnSecondScreen = a3;
  id v5 = [(AVPlaybackContentTransitioningView *)self activeContentView];
  [v5 setPlayingOnSecondScreen:v3];

  id v6 = [(AVPlaybackContentTransitioningView *)self incomingContentView];
  [v6 setPlayingOnSecondScreen:v3];
}

- (AVPlaybackContentTransitioningView)initWithFrame:(CGRect)a3 activeContentView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v9 = (AVPlaybackContentContainerView *)a4;
  v15.receiver = self;
  v15.super_class = (Class)AVPlaybackContentTransitioningView;
  double v10 = -[AVPlaybackContentTransitioningView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    double v11 = *MEMORY[0x1E4F1DAD8];
    double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v13 = v9;
    if (!v9) {
      double v13 = -[AVPlaybackContentContainerView initWithFrame:activeContentView:]([AVPlaybackContentContainerView alloc], "initWithFrame:activeContentView:", 0, v11, v12, width, height);
    }
    objc_storeStrong((id *)&v10->_activeContentView, v13);
    if (!v9) {

    }
    -[AVPlaybackContentContainerView setFrame:](v10->_activeContentView, "setFrame:", v11, v12, width, height);
    [(AVPlaybackContentTransitioningView *)v10 setContentInsetAdjustmentBehavior:2];
    [(AVPlaybackContentTransitioningView *)v10 setPagingEnabled:1];
    [(AVPlaybackContentTransitioningView *)v10 setDelegate:v10];
    [(AVPlaybackContentTransitioningView *)v10 setShowsHorizontalScrollIndicator:0];
    [(AVPlaybackContentTransitioningView *)v10 setShowsVerticalScrollIndicator:0];
    -[AVPlaybackContentTransitioningView _setInterpageSpacing:](v10, "_setInterpageSpacing:", 24.0, 0.0);
    [(AVPlaybackContentTransitioningView *)v10 setAlwaysBounceHorizontal:1];
    [(AVPlaybackContentTransitioningView *)v10 setDirectionalLockEnabled:1];
  }

  return v10;
}

@end