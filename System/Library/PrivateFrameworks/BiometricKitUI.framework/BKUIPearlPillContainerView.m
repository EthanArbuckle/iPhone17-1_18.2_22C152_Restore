@interface BKUIPearlPillContainerView
- (BKUIPearlPillContainerView)init;
- (BOOL)fillPillsAroundAngle:(double)a3;
- (BOOL)fillPillsAroundAngle:(double)a3 forTutorial:(BOOL)a4;
- (BOOL)squareNeedsPositionLayout;
- (BOOL)unstashPillStatesIfNeededAnimated:(BOOL)a3;
- (CGPoint)enrollViewCenter;
- (UITraitChangeRegistration)traitChangeRegistration;
- (double)percentOfPillsCompleted;
- (double)radius;
- (id)unfilledDirections;
- (int)state;
- (int64_t)_indexForPillAtAngle:(double)a3;
- (unint64_t)_numberOfVisiblePillViews;
- (void)_animateToFinishedCompletion:(id)a3;
- (void)animateToState:(int)a3 completion:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)resetPillsAnimated:(BOOL)a3;
- (void)setAllPillState:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setEnrollViewCenter:(CGPoint)a3;
- (void)setRadius:(double)a3 center:(CGPoint)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setSquareNeedsPositionLayout:(BOOL)a3;
- (void)setState:(int)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)stashPillStates;
- (void)unstashPillStatesAnimated:(BOOL)a3;
@end

@implementation BKUIPearlPillContainerView

- (BKUIPearlPillContainerView)init
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)BKUIPearlPillContainerView;
  v2 = [(BKUIPearlPillContainerView *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:120];
    pillViews = v2->_pillViews;
    v2->_pillViews = (NSMutableArray *)v3;

    uint64_t v5 = 120;
    do
    {
      v6 = objc_opt_new();
      [(NSMutableArray *)v2->_pillViews addObject:v6];
      [(BKUIPearlPillContainerView *)v2 addSubview:v6];
      [v6 setRadius:120.0];
      [v6 setPillCornerRadius:2.0];
      [v6 setNumberOfPills:120.0];
      [v6 setPillInitialHeight:13.0];
      [v6 setPillCompletedHeight:30.0];
      [v6 setRingHeight:3.5];

      --v5;
    }
    while (v5);
    v2->_clockwise = 0;
    v2->_counterwise = 0;
    v2->_lastAngle = 0;
    [(BKUIPearlPillContainerView *)v2 resetPillsAnimated:0];
    objc_initWeak(&location, v2);
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__BKUIPearlPillContainerView_init__block_invoke;
    v10[3] = &unk_1E6EA2070;
    objc_copyWeak(&v11, &location);
    v8 = [(BKUIPearlPillContainerView *)v2 registerForTraitChanges:v7 withHandler:v10];
    [(BKUIPearlPillContainerView *)v2 setTraitChangeRegistration:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __34__BKUIPearlPillContainerView_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained layoutIfNeeded];
}

- (unint64_t)_numberOfVisiblePillViews
{
  unsigned int state = self->_state;
  if (state > 0xA) {
    goto LABEL_8;
  }
  if (((1 << state) & 0x66) != 0)
  {
    int64_t numberOfVisiblePillViews = 64;
    goto LABEL_9;
  }
  if (((1 << state) & 0x580) == 0)
  {
    if (((1 << state) & 0x208) != 0)
    {
      int64_t numberOfVisiblePillViews = self->_numberOfVisiblePillViews;
      goto LABEL_9;
    }
LABEL_8:
    int64_t numberOfVisiblePillViews = 0;
    goto LABEL_9;
  }
  int64_t numberOfVisiblePillViews = 120;
LABEL_9:
  self->_int64_t numberOfVisiblePillViews = numberOfVisiblePillViews;
  return numberOfVisiblePillViews;
}

- (void)layoutSubviews
{
  unint64_t v3 = [(BKUIPearlPillContainerView *)self _numberOfVisiblePillViews];
  if ([(NSMutableArray *)self->_pillViews count])
  {
    unint64_t v4 = 0;
    uint64_t v5 = (_OWORD *)MEMORY[0x1E4F1DAB8];
    do
    {
      v6 = [(NSMutableArray *)self->_pillViews objectAtIndexedSubscript:v4];
      v7 = v6;
      if (v4 >= v3)
      {
        [v6 setAlpha:0.0];
      }
      else
      {
        [v6 setAlpha:1.0];
        long long v8 = v5[1];
        v11[0] = *v5;
        v11[1] = v8;
        v11[2] = v5[2];
        [v7 setTransform:v11];
        [(BKUIPearlPillContainerView *)self bounds];
        objc_msgSend(v7, "setFrame:");
        CGAffineTransformMakeRotation(&v10, (double)v4 / (double)v3 * -2.0 * 3.14159265 + 6.28318531 + -1.57079633);
        CGAffineTransform v9 = v10;
        [v7 setTransform:&v9];
        [v7 setNumberOfPills:(double)v3];
      }

      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_pillViews count]);
  }
}

- (void)_animateToFinishedCompletion:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(BKUIPearlPillContainerView *)self squareNeedsPositionLayout])
  {
    uint64_t v5 = [(NSMutableArray *)self->_pillViews firstObject];
    [v5 ringHeight];
    double v7 = v6;

    long long v8 = [MEMORY[0x1E4F428B8] systemGreenColor];
    CGAffineTransform v9 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E4F72FC0]);
    successAnimation = self->_successAnimation;
    self->_successAnimation = v9;

    id v11 = self->_successAnimation;
    id v33 = v8;
    -[LAUICheckmarkLayer setColor:animated:](v11, "setColor:animated:", [v33 CGColor], 0);
    v12 = [(BKUIPearlPillContainerView *)self layer];
    [v12 addSublayer:self->_successAnimation];

    objc_super v13 = self->_successAnimation;
    v14 = [(BKUIPearlPillContainerView *)self layer];
    double v15 = 34.7999992 - v7;
    [v14 contentsScale];
    [(LAUICheckmarkLayer *)v13 defaultSizeForCircleWithDiameter:v15 + v15 scale:v16];
    double v18 = v17;
    double v20 = v19;

    -[LAUICheckmarkLayer setFrame:](self->_successAnimation, "setFrame:", 0.0, 0.0, v18, v20);
    v21 = self->_successAnimation;
    [(BKUIPearlPillContainerView *)self bounds];
    double v23 = v22 * 0.5;
    [(BKUIPearlPillContainerView *)self enrollViewCenter];
    [(LAUICheckmarkLayer *)v21 setPosition:v23];
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    v25 = dispatch_group_create();
    dispatch_group_enter(v25);
    objc_initWeak(&location, self);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke;
    v43[3] = &unk_1E6EA2958;
    objc_copyWeak(&v45, &location);
    BOOL v46 = IsReduceMotionEnabled;
    v26 = v25;
    v44 = v26;
    [(BKUIPearlPillContainerView *)self setAllPillState:5 animated:!IsReduceMotionEnabled completion:v43];
    if (IsReduceMotionEnabled) {
      double v27 = 0.0;
    }
    else {
      double v27 = 0.5;
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obj = self->_pillViews;
    uint64_t v28 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v40;
      uint64_t v30 = MEMORY[0x1E4F143A8];
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v40 != v29) {
            objc_enumerationMutation(obj);
          }
          v32 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          dispatch_group_enter(v26);
          objc_initWeak(&from, v32);
          v35[0] = v30;
          v35[1] = 3221225472;
          v35[2] = __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_4;
          v35[3] = &unk_1E6EA2980;
          objc_copyWeak(v37, &from);
          v37[1] = *(id *)&v15;
          v37[2] = *(id *)&v27;
          v36 = v26;
          [v32 setRadius:v35 animationDuration:v15 * 0.899999976 completion:v27 * 0.7];

          objc_destroyWeak(v37);
          objc_destroyWeak(&from);
        }
        uint64_t v28 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v28);
    }

    if (v4) {
      dispatch_group_notify(v26, MEMORY[0x1E4F14428], v4);
    }

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }
}

void __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained squareNeedsPositionLayout])
    {
      dispatch_time_t v4 = dispatch_time(0, 1000000000);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_2;
      v5[3] = &unk_1E6EA2858;
      v5[4] = v3;
      char v6 = *(unsigned char *)(a1 + 48);
      dispatch_after(v4, MEMORY[0x1E4F14428], v5);
    }
    else
    {
      [v3[52] setRevealed:1 animated:*(unsigned char *)(a1 + 48) == 0];
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 416);
  unint64_t v3 = (void *)MEMORY[0x1E4F42FF0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_3;
  v5[3] = &unk_1E6EA2858;
  id v6 = v2;
  char v7 = *(unsigned char *)(a1 + 40);
  id v4 = v2;
  [v3 animateWithDuration:v5 animations:0.3];
}

uint64_t __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRevealed:1 animated:*(unsigned char *)(a1 + 40) == 0];
}

void __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56) * 0.3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_5;
  v5[3] = &unk_1E6EA20C0;
  id v6 = *(id *)(a1 + 32);
  [WeakRetained setRadius:v5 animationDuration:v3 completion:v4];
}

void __59__BKUIPearlPillContainerView__animateToFinishedCompletion___block_invoke_5(uint64_t a1)
{
}

- (double)percentOfPillsCompleted
{
  unint64_t v3 = [(BKUIPearlPillContainerView *)self _numberOfVisiblePillViews];
  if (v3)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      id v6 = [(NSMutableArray *)self->_pillViews objectAtIndexedSubscript:v4];
      unsigned int v7 = [v6 isCompleted];

      v5 += v7;
      ++v4;
    }
    while (v3 != v4);
    double v8 = (double)v5;
  }
  else
  {
    double v8 = 0.0;
  }
  return v8 / (double)v3;
}

- (void)setAllPillState:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_block_t block = a5;
  double v8 = dispatch_group_create();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_pillViews;
  uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        objc_super v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        dispatch_group_enter(v8);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __66__BKUIPearlPillContainerView_setAllPillState_animated_completion___block_invoke;
        v18[3] = &unk_1E6EA20C0;
        double v19 = v8;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __66__BKUIPearlPillContainerView_setAllPillState_animated_completion___block_invoke_2;
        v16[3] = &unk_1E6EA20C0;
        double v17 = v19;
        [v13 setState:a3 animated:v5 animationDelay:v18 completion:v16 failure:0.0];
      }
      uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  if (block) {
    dispatch_group_notify(v8, MEMORY[0x1E4F14428], block);
  }
}

void __66__BKUIPearlPillContainerView_setAllPillState_animated_completion___block_invoke(uint64_t a1)
{
}

void __66__BKUIPearlPillContainerView_setAllPillState_animated_completion___block_invoke_2(uint64_t a1)
{
}

- (void)stashPillStates
{
  __assert_rtn("-[BKUIPearlPillContainerView stashPillStates]", "BKUIPearlPillContainerView.m", 237, "_stashedPillStates[i] == BKUIPearlPillStateNone");
}

- (void)unstashPillStatesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = 0;
  stashedPillStates = self->_stashedPillStates;
  do
  {
    if (!stashedPillStates[v5]) {
      -[BKUIPearlPillContainerView unstashPillStatesAnimated:]();
    }
    if (v5 < [(NSMutableArray *)self->_pillViews count])
    {
      unint64_t v7 = stashedPillStates[v5];
      double v8 = [(NSMutableArray *)self->_pillViews objectAtIndexedSubscript:v5];
      [v8 setState:v7 animated:v3 animationDelay:0 completion:0 failure:0.0];
    }
    stashedPillStates[v5++] = 0;
  }
  while (v5 != 120);
  self->_hasPillStateStash = 0;
}

- (BOOL)unstashPillStatesIfNeededAnimated:(BOOL)a3
{
  BOOL hasPillStateStash = self->_hasPillStateStash;
  if (self->_hasPillStateStash) {
    [(BKUIPearlPillContainerView *)self unstashPillStatesAnimated:a3];
  }
  return hasPillStateStash;
}

- (void)resetPillsAnimated:(BOOL)a3
{
}

- (int64_t)_indexForPillAtAngle:(double)a3
{
  unint64_t v4 = [(BKUIPearlPillContainerView *)self _numberOfVisiblePillViews];
  if (v4) {
    return (unint64_t)(a3 / (6.28318531 / (double)v4)) % v4;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (BOOL)fillPillsAroundAngle:(double)a3 forTutorial:(BOOL)a4
{
  if (a4) {
    double v6 = 0.05;
  }
  else {
    double v6 = 0.02;
  }
  if (a4) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 3;
  }
  unint64_t v8 = [(BKUIPearlPillContainerView *)self _numberOfVisiblePillViews];
  double v9 = 6.28318531;
  if (a3 + 0.392699082 >= 0.0) {
    double v9 = 0.0;
  }
  int64_t v10 = (uint64_t)((a3 + 0.392699082 + v9) * 100.0);
  self->_counterwise -= self->_lastAngle < v10;
  if (self->_lastAngle <= v10) {
    int64_t clockwise = self->_clockwise;
  }
  else {
    int64_t clockwise = self->_clockwise + 1;
  }
  self->_int64_t clockwise = clockwise;
  self->_lastAngle = v10;
  unint64_t v12 = -[BKUIPearlPillContainerView _indexForPillAtAngle:](self, "_indexForPillAtAngle:");
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v13 = 0;
    return v13 & 1;
  }
  float v14 = (double)v8 * 0.125;
  unint64_t v15 = vcvtps_u32_f32(v14);
  uint64_t v16 = (uint64_t)((int)(v12 / v15) * v15 - (v15 >> 1)) % (uint64_t)v8;
  unint64_t v17 = (v8 & (v16 >> 63)) + v16;
  unint64_t v18 = v17 + v15;
  if ((self->_counterwise + self->_clockwise < 0) ^ __OFADD__(self->_counterwise, self->_clockwise) | (self->_counterwise + self->_clockwise == 0))
  {
    if (v17 < v18)
    {
      char v13 = 0;
      double v23 = 0.0;
      do
      {
        v24 = [(NSMutableArray *)self->_pillViews objectAtIndexedSubscript:v17 % v8];
        v13 |= [v24 state] != v7;
        [v24 setState:v7 animated:1 animationDelay:0 completion:0 failure:v23];
        double v23 = v6 + v23;

        ++v17;
        --v15;
      }
      while (v15);
      goto LABEL_26;
    }
  }
  else
  {
    unint64_t v19 = v18 - 1;
    if (v18 - 1 >= v17)
    {
      char v20 = 0;
      double v21 = 0.0;
      do
      {
        long long v22 = [(NSMutableArray *)self->_pillViews objectAtIndexedSubscript:v19 % v8];
        if ([v22 state] != v7) {
          char v20 = 1;
        }
        [v22 setState:v7 animated:1 animationDelay:0 completion:0 failure:v21];
        double v21 = v6 + v21;

        --v19;
      }
      while (v19 >= v17);
      char v13 = v20;
      goto LABEL_26;
    }
  }
  char v13 = 0;
LABEL_26:
  int64_t v25 = self->_clockwise;
  uint64_t v26 = self->_counterwise + v25;
  uint64_t v27 = v26 - 2;
  if (v26 <= 2) {
    uint64_t v27 = 0;
  }
  self->_int64_t clockwise = v25 - v27;
  uint64_t v28 = v26 + 2;
  if (v26 >= -2) {
    uint64_t v28 = 0;
  }
  self->_counterwise -= v28;
  return v13 & 1;
}

- (void)dealloc
{
  [(NSMutableArray *)self->_pillViews makeObjectsPerformSelector:sel_tearDownPillView];
  v3.receiver = self;
  v3.super_class = (Class)BKUIPearlPillContainerView;
  [(BKUIPearlPillContainerView *)&v3 dealloc];
}

- (BOOL)fillPillsAroundAngle:(double)a3
{
  return [(BKUIPearlPillContainerView *)self fillPillsAroundAngle:0 forTutorial:a3];
}

- (id)unfilledDirections
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = (id)objc_opt_new();
  unint64_t v3 = [&unk_1F40946C0 count];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [&unk_1F40946C0 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(&unk_1F40946C0);
        }
        unint64_t v8 = [*(id *)(*((void *)&v15 + 1) + 8 * i) integerValue];
        int64_t v9 = [(BKUIPearlPillContainerView *)self _indexForPillAtAngle:6.28318531 / (double)v3 * (double)v8];
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v10 = [(NSMutableArray *)self->_pillViews objectAtIndexedSubscript:v9];
          uint64_t v11 = [v10 state];

          if (v11 == 2)
          {
            unint64_t v12 = [NSNumber numberWithUnsignedInteger:v8];
            [v14 addObject:v12];
          }
        }
      }
      uint64_t v5 = [&unk_1F40946C0 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return v14;
}

- (void)setRadius:(double)a3 center:(CGPoint)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  double y = a4.y;
  double x = a4.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  -[BKUIPearlPillContainerView setEnrollViewCenter:](self, "setEnrollViewCenter:", x, y);
  [(BKUIPearlPillContainerView *)self setNeedsLayout];
  if (v6) {
    double v12 = 0.5;
  }
  else {
    double v12 = 0.0;
  }
  char v13 = dispatch_group_create();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = self->_pillViews;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        unint64_t v19 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
        dispatch_group_enter(v13);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __67__BKUIPearlPillContainerView_setRadius_center_animated_completion___block_invoke;
        v20[3] = &unk_1E6EA20C0;
        double v21 = v13;
        [v19 setRadius:v20 animationDuration:a3 completion:v12];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  if (v11) {
    dispatch_group_notify(v13, MEMORY[0x1E4F14428], v11);
  }
}

void __67__BKUIPearlPillContainerView_setRadius_center_animated_completion___block_invoke(uint64_t a1)
{
}

- (void)animateToState:(int)a3 completion:(id)a4
{
  BOOL v6 = (void (**)(void))a4;
  int state = self->_state;
  if (state == a3)
  {
    if (!v6) {
      goto LABEL_12;
    }
    int64_t v9 = v6;
    v6[2](v6);
  }
  else
  {
    int64_t v9 = v6;
    if (state == 10) {
      [(LAUICheckmarkLayer *)self->_successAnimation setRevealed:0 animated:0];
    }
    self->_int state = a3;
    [(BKUIPearlPillContainerView *)self setNeedsLayout];
    int v8 = self->_state;
    if ((v8 - 6) >= 3 && v8 == 10)
    {
      [(BKUIPearlPillContainerView *)self _animateToFinishedCompletion:v9];
    }
    else
    {
      BOOL v6 = v9;
      if (!v9) {
        goto LABEL_12;
      }
      v9[2](v9);
    }
  }
  BOOL v6 = v9;
LABEL_12:
}

- (double)radius
{
  return self->_radius;
}

- (BOOL)squareNeedsPositionLayout
{
  return self->_squareNeedsPositionLayout;
}

- (void)setSquareNeedsPositionLayout:(BOOL)a3
{
  self->_squareNeedsPositionLayout = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_int state = a3;
}

- (CGPoint)enrollViewCenter
{
  double x = self->_enrollViewCenter.x;
  double y = self->_enrollViewCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setEnrollViewCenter:(CGPoint)a3
{
  self->_enrollViewCenter = a3;
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_successAnimation, 0);

  objc_storeStrong((id *)&self->_pillViews, 0);
}

- (void)unstashPillStatesAnimated:.cold.1()
{
  __assert_rtn("-[BKUIPearlPillContainerView unstashPillStatesAnimated:]", "BKUIPearlPillContainerView.m", 246, "_stashedPillStates[i] != BKUIPearlPillStateNone");
}

@end