@interface HPSSpatialProfileEarPillContainerView
- (BOOL)fillPillsAroundAngle:(double)a3;
- (BOOL)fillPillsAroundAngle:(double)a3 forTutorial:(BOOL)a4;
- (BOOL)unstashPillStatesIfNeededAnimated:(BOOL)a3;
- (CGPoint)enrollViewCenter;
- (HPSSpatialProfileEarPillContainerView)init;
- (double)percentOfPillsCompleted;
- (double)radius;
- (id)unfilledDirections;
- (int)state;
- (int64_t)_indexForPillAtAngle:(double)a3;
- (unint64_t)_numberOfVisiblePillViews;
- (void)_animateToFinishedCompletion:(id)a3;
- (void)animateToState:(int)a3 completion:(id)a4;
- (void)dealloc;
- (void)fillCentralPillsWithCompletion:(id)a3;
- (void)fillLeftPillsWithCompletion:(id)a3;
- (void)fillRightPillsWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)resetPillsAnimated:(BOOL)a3;
- (void)setAllPillState:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setEnrollViewCenter:(CGPoint)a3;
- (void)setRadius:(double)a3 center:(CGPoint)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setState:(int)a3;
- (void)stashPillStates;
- (void)traitCollectionDidChange:(id)a3;
- (void)unstashPillStatesAnimated:(BOOL)a3;
@end

@implementation HPSSpatialProfileEarPillContainerView

- (HPSSpatialProfileEarPillContainerView)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)HPSSpatialProfileEarPillContainerView;
  v2 = [(HPSSpatialProfileEarPillContainerView *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:11];
    pillViews = v2->_pillViews;
    v2->_pillViews = (NSMutableArray *)v3;

    unint64_t v5 = 0;
    *(void *)&long long v6 = 134217984;
    long long v12 = v6;
    do
    {
      v7 = sharedBluetoothSettingsLogComponent();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v12;
        unint64_t v15 = v5;
        _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: Ear Pill: init: %lu", buf, 0xCu);
      }

      v8 = objc_opt_new();
      [v8 setRadius:0.0];
      [v8 setPillCornerRadius:2.0];
      [v8 setNumberOfPills:11.0];
      [v8 setRingHeight:3.5];
      if (v5 <= 0xA && ((1 << v5) & 0x421) != 0)
      {
        double v9 = 25.0;
        double v10 = 20.0;
      }
      else
      {
        double v9 = 15.0;
        double v10 = 10.0;
      }
      objc_msgSend(v8, "setPillInitialHeight:", v10, v12);
      [v8 setPillCompletedHeight:v9];
      [(NSMutableArray *)v2->_pillViews addObject:v8];
      [(HPSSpatialProfileEarPillContainerView *)v2 addSubview:v8];

      ++v5;
    }
    while (v5 != 11);
    v2->_clockwise = 0;
    v2->_counterwise = 0;
    v2->_lastAngle = 0;
    [(HPSSpatialProfileEarPillContainerView *)v2 resetPillsAnimated:0];
  }
  return v2;
}

- (unint64_t)_numberOfVisiblePillViews
{
  unsigned int state = self->_state;
  if (state > 0xA) {
    goto LABEL_6;
  }
  int v3 = 1 << state;
  if ((v3 & 0x5E6) == 0)
  {
    if ((v3 & 0x208) != 0)
    {
      int64_t numberOfVisiblePillViews = self->_numberOfVisiblePillViews;
      goto LABEL_7;
    }
LABEL_6:
    int64_t numberOfVisiblePillViews = 0;
    goto LABEL_7;
  }
  int64_t numberOfVisiblePillViews = 11;
LABEL_7:
  self->_int64_t numberOfVisiblePillViews = numberOfVisiblePillViews;
  return numberOfVisiblePillViews;
}

- (void)layoutSubviews
{
  if ([(NSMutableArray *)self->_pillViews count])
  {
    unint64_t v3 = 0;
    do
    {
      v4 = [(NSMutableArray *)self->_pillViews objectAtIndexedSubscript:v3];
      [(HPSSpatialProfileEarPillContainerView *)self bounds];
      objc_msgSend(v4, "setFrame:");
      memset(&v12, 0, sizeof(v12));
      CGAffineTransformMakeRotation(&v12, 3.14159265);
      memset(&v11, 0, sizeof(v11));
      uint64_t v5 = [(NSMutableArray *)self->_pillViews count];
      if (v5 >= 0) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = v5 + 1;
      }
      CGAffineTransformMakeTranslation(&v11, (double)(uint64_t)(v3 - (v6 >> 1)) * 13.0, 0.0);
      CGAffineTransform t1 = v12;
      CGAffineTransform t2 = v11;
      CGAffineTransformConcat(&v10, &t1, &t2);
      CGAffineTransform v7 = v10;
      [v4 setTransform:&v7];
      objc_msgSend(v4, "setNumberOfPills:", (double)(unint64_t)-[NSMutableArray count](self->_pillViews, "count"));

      ++v3;
    }
    while (v3 < [(NSMutableArray *)self->_pillViews count]);
  }
}

- (void)_animateToFinishedCompletion:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  dispatch_block_t block = a3;
  v4 = [(NSMutableArray *)self->_pillViews firstObject];
  [v4 ringHeight];
  double v6 = v5;

  CGAffineTransform v7 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E4F72FB8]);
  successAnimation = self->_successAnimation;
  self->_successAnimation = v7;

  double v9 = self->_successAnimation;
  CGAffineTransform v10 = [MEMORY[0x1E4FB1618] systemGreenColor];
  [(LAUICheckmarkLayer *)v9 setPrimaryColor:v10 animated:0];

  CGAffineTransform v11 = [(HPSSpatialProfileEarPillContainerView *)self layer];
  [v11 addSublayer:self->_successAnimation];

  CGAffineTransform v12 = self->_successAnimation;
  objc_super v13 = [(HPSSpatialProfileEarPillContainerView *)self layer];
  double v14 = 34.7999992 - v6;
  [v13 contentsScale];
  [(LAUICheckmarkLayer *)v12 defaultSizeForCircleWithDiameter:v14 + v14 scale:v15];
  double v17 = v16;
  double v19 = v18;

  -[LAUICheckmarkLayer setFrame:](self->_successAnimation, "setFrame:", 0.0, 0.0, v17, v19);
  v20 = self->_successAnimation;
  [(HPSSpatialProfileEarPillContainerView *)self bounds];
  double v22 = v21 * 0.5;
  [(HPSSpatialProfileEarPillContainerView *)self enrollViewCenter];
  [(LAUICheckmarkLayer *)v20 setPosition:v22];
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v24 = dispatch_group_create();
  dispatch_group_enter(v24);
  id location = 0;
  objc_initWeak(&location, self);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __70__HPSSpatialProfileEarPillContainerView__animateToFinishedCompletion___block_invoke;
  v43[3] = &unk_1E6EA8A10;
  v32 = &v45;
  objc_copyWeak(&v45, &location);
  BOOL v46 = IsReduceMotionEnabled;
  v25 = v24;
  v44 = v25;
  [(HPSSpatialProfileEarPillContainerView *)self setAllPillState:5 animated:!IsReduceMotionEnabled completion:v43];
  if (IsReduceMotionEnabled) {
    double v26 = 0.0;
  }
  else {
    double v26 = 0.5;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obj = self->_pillViews;
  uint64_t v27 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v40;
    uint64_t v29 = MEMORY[0x1E4F143A8];
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        dispatch_group_enter(v25);
        id from = 0;
        objc_initWeak(&from, v31);
        v35[0] = v29;
        v35[1] = 3221225472;
        v35[2] = __70__HPSSpatialProfileEarPillContainerView__animateToFinishedCompletion___block_invoke_2;
        v35[3] = &unk_1E6EA8A38;
        objc_copyWeak(v37, &from);
        v37[1] = *(id *)&v14;
        v37[2] = *(id *)&v26;
        v36 = v25;
        objc_msgSend(v31, "setRadius:animationDuration:completion:", v35, v14 * 0.899999976, v26 * 0.7, v32);

        objc_destroyWeak(v37);
        objc_destroyWeak(&from);
      }
      uint64_t v27 = [(NSMutableArray *)obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v27);
  }

  if (block) {
    dispatch_group_notify(v25, MEMORY[0x1E4F14428], block);
  }

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
}

void __70__HPSSpatialProfileEarPillContainerView__animateToFinishedCompletion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained[52] setRevealed:1 animated:*(unsigned char *)(a1 + 48) == 0];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __70__HPSSpatialProfileEarPillContainerView__animateToFinishedCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56) * 0.3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__HPSSpatialProfileEarPillContainerView__animateToFinishedCompletion___block_invoke_3;
  v5[3] = &unk_1E6EA82F0;
  id v6 = *(id *)(a1 + 32);
  [WeakRetained setRadius:v5 animationDuration:v3 completion:v4];
}

void __70__HPSSpatialProfileEarPillContainerView__animateToFinishedCompletion___block_invoke_3(uint64_t a1)
{
}

- (double)percentOfPillsCompleted
{
  unint64_t v3 = [(HPSSpatialProfileEarPillContainerView *)self _numberOfVisiblePillViews];
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
        v18[2] = __77__HPSSpatialProfileEarPillContainerView_setAllPillState_animated_completion___block_invoke;
        v18[3] = &unk_1E6EA82F0;
        double v19 = v8;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __77__HPSSpatialProfileEarPillContainerView_setAllPillState_animated_completion___block_invoke_2;
        v16[3] = &unk_1E6EA82F0;
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

void __77__HPSSpatialProfileEarPillContainerView_setAllPillState_animated_completion___block_invoke(uint64_t a1)
{
}

void __77__HPSSpatialProfileEarPillContainerView_setAllPillState_animated_completion___block_invoke_2(uint64_t a1)
{
}

- (void)stashPillStates
{
  __assert_rtn("-[HPSSpatialProfileEarPillContainerView stashPillStates]", "HPSSpatialProfileEarPillContainerView.m", 216, "_stashedPillStates[i] == BKUIPearlPillStateNone");
}

- (void)unstashPillStatesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = 0;
  stashedPillStates = self->_stashedPillStates;
  do
  {
    if (!stashedPillStates[v5]) {
      -[HPSSpatialProfileEarPillContainerView unstashPillStatesAnimated:]();
    }
    if (v5 < [(NSMutableArray *)self->_pillViews count])
    {
      unint64_t v7 = stashedPillStates[v5];
      double v8 = [(NSMutableArray *)self->_pillViews objectAtIndexedSubscript:v5];
      [v8 setState:v7 animated:v3 animationDelay:0 completion:0 failure:0.0];
    }
    stashedPillStates[v5++] = 0;
  }
  while (v5 != 11);
  self->_hasPillStateStash = 0;
}

- (BOOL)unstashPillStatesIfNeededAnimated:(BOOL)a3
{
  BOOL hasPillStateStash = self->_hasPillStateStash;
  if (self->_hasPillStateStash) {
    [(HPSSpatialProfileEarPillContainerView *)self unstashPillStatesAnimated:a3];
  }
  return hasPillStateStash;
}

- (void)resetPillsAnimated:(BOOL)a3
{
}

- (int64_t)_indexForPillAtAngle:(double)a3
{
  unint64_t v4 = [(HPSSpatialProfileEarPillContainerView *)self _numberOfVisiblePillViews];
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
  unint64_t v8 = [(HPSSpatialProfileEarPillContainerView *)self _numberOfVisiblePillViews];
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
  unint64_t v12 = -[HPSSpatialProfileEarPillContainerView _indexForPillAtAngle:](self, "_indexForPillAtAngle:");
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
  v3.super_class = (Class)HPSSpatialProfileEarPillContainerView;
  [(HPSSpatialProfileEarPillContainerView *)&v3 dealloc];
}

- (BOOL)fillPillsAroundAngle:(double)a3
{
  return [(HPSSpatialProfileEarPillContainerView *)self fillPillsAroundAngle:0 forTutorial:a3];
}

- (id)unfilledDirections
{
  v2 = objc_opt_new();

  return v2;
}

- (void)setRadius:(double)a3 center:(CGPoint)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  double y = a4.y;
  double x = a4.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  -[HPSSpatialProfileEarPillContainerView setEnrollViewCenter:](self, "setEnrollViewCenter:", x, y);
  [(HPSSpatialProfileEarPillContainerView *)self setNeedsLayout];
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
  float v14 = self->_pillViews;
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
        v20[2] = __78__HPSSpatialProfileEarPillContainerView_setRadius_center_animated_completion___block_invoke;
        v20[3] = &unk_1E6EA82F0;
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

void __78__HPSSpatialProfileEarPillContainerView_setRadius_center_animated_completion___block_invoke(uint64_t a1)
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
    double v9 = v6;
    v6[2](v6);
  }
  else
  {
    double v9 = v6;
    if (state == 10) {
      [(LAUICheckmarkLayer *)self->_successAnimation setRevealed:0 animated:0];
    }
    self->_int state = a3;
    [(HPSSpatialProfileEarPillContainerView *)self setNeedsLayout];
    int v8 = self->_state;
    if ((v8 - 6) >= 3 && v8 == 10)
    {
      [(HPSSpatialProfileEarPillContainerView *)self _animateToFinishedCompletion:v9];
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

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HPSSpatialProfileEarPillContainerView;
  [(HPSSpatialProfileEarPillContainerView *)&v4 traitCollectionDidChange:a3];
  [(HPSSpatialProfileEarPillContainerView *)self layoutSubviews];
}

- (void)fillLeftPillsWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  objc_super v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillLeftPills", buf, 2u);
  }

  unint64_t v5 = dispatch_group_create();
  for (uint64_t i = 0; i != 4; ++i)
  {
    dispatch_group_enter(v5);
    uint64_t v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = i;
      _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillLeftPills filling: %lu", buf, 0xCu);
    }

    int v8 = [(NSMutableArray *)self->_pillViews objectAtIndexedSubscript:i];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__HPSSpatialProfileEarPillContainerView_fillLeftPillsWithCompletion___block_invoke;
    v14[3] = &unk_1E6EA82F0;
    double v9 = v5;
    uint64_t v15 = v9;
    [v8 setState:3 animated:1 animationDelay:v14 completion:0 failure:0.0];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HPSSpatialProfileEarPillContainerView_fillLeftPillsWithCompletion___block_invoke_2;
  block[3] = &unk_1E6EA8278;
  id v13 = v11;
  id v10 = v11;
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);
}

void __69__HPSSpatialProfileEarPillContainerView_fillLeftPillsWithCompletion___block_invoke(uint64_t a1)
{
}

uint64_t __69__HPSSpatialProfileEarPillContainerView_fillLeftPillsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fillCentralPillsWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v5, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillCentralPills", buf, 2u);
  }

  BOOL v6 = dispatch_group_create();
  uint64_t v7 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = 5;
    _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillCentralPills filling: %lu", buf, 0xCu);
  }

  dispatch_group_enter(v6);
  int v8 = [(NSMutableArray *)self->_pillViews objectAtIndexedSubscript:5];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke;
  v23[3] = &unk_1E6EA82F0;
  double v9 = v6;
  long long v24 = v9;
  [v8 setState:3 animated:1 animationDelay:v23 completion:0 failure:0.0];

  id v10 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = 6;
    _os_log_impl(&dword_1E4BFE000, v10, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillCentralPills filling: %lu", buf, 0xCu);
  }

  dispatch_group_enter(v9);
  id v11 = [(NSMutableArray *)self->_pillViews objectAtIndexedSubscript:6];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke_13;
  v21[3] = &unk_1E6EA82F0;
  double v12 = v9;
  long long v22 = v12;
  [v11 setState:3 animated:1 animationDelay:v21 completion:0 failure:0.0];

  id v13 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = 4;
    _os_log_impl(&dword_1E4BFE000, v13, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillCentralPills filling: %lu", buf, 0xCu);
  }

  dispatch_group_enter(v12);
  float v14 = [(NSMutableArray *)self->_pillViews objectAtIndexedSubscript:4];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke_14;
  v19[3] = &unk_1E6EA82F0;
  char v20 = v12;
  uint64_t v15 = v12;
  [v14 setState:3 animated:1 animationDelay:v19 completion:0 failure:0.0];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke_2;
  v17[3] = &unk_1E6EA8278;
  id v18 = v4;
  id v16 = v4;
  dispatch_group_notify(v15, MEMORY[0x1E4F14428], v17);
}

void __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke(uint64_t a1)
{
}

void __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke_13(uint64_t a1)
{
}

void __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke_14(uint64_t a1)
{
}

uint64_t __72__HPSSpatialProfileEarPillContainerView_fillCentralPillsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fillRightPillsWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v4 = sharedBluetoothSettingsLogComponent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4BFE000, v4, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillRightPills", buf, 2u);
  }

  unint64_t v5 = dispatch_group_create();
  for (unint64_t i = 10; i > 6; --i)
  {
    uint64_t v7 = sharedBluetoothSettingsLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v17 = i;
      _os_log_impl(&dword_1E4BFE000, v7, OS_LOG_TYPE_DEFAULT, "Spatial Profile: fillRightPills filling: %lu", buf, 0xCu);
    }

    dispatch_group_enter(v5);
    int v8 = [(NSMutableArray *)self->_pillViews objectAtIndexedSubscript:i];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__HPSSpatialProfileEarPillContainerView_fillRightPillsWithCompletion___block_invoke;
    v14[3] = &unk_1E6EA82F0;
    double v9 = v5;
    uint64_t v15 = v9;
    [v8 setState:3 animated:1 animationDelay:v14 completion:0 failure:0.0];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__HPSSpatialProfileEarPillContainerView_fillRightPillsWithCompletion___block_invoke_2;
  block[3] = &unk_1E6EA8278;
  id v13 = v11;
  id v10 = v11;
  dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);
}

void __70__HPSSpatialProfileEarPillContainerView_fillRightPillsWithCompletion___block_invoke(uint64_t a1)
{
}

uint64_t __70__HPSSpatialProfileEarPillContainerView_fillRightPillsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (double)radius
{
  return self->_radius;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successAnimation, 0);

  objc_storeStrong((id *)&self->_pillViews, 0);
}

- (void)unstashPillStatesAnimated:.cold.1()
{
  __assert_rtn("-[HPSSpatialProfileEarPillContainerView unstashPillStatesAnimated:]", "HPSSpatialProfileEarPillContainerView.m", 225, "_stashedPillStates[i] != BKUIPearlPillStateNone");
}

@end