@interface MRUSlider
- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3;
- (BOOL)fluidTrackHidden;
- (BOOL)isDimmed;
- (BOOL)isEqualizing;
- (BOOL)minimumTrackVisible;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)hitRect;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (MRUSlider)init;
- (MRUSlider)initWithStyle:(unint64_t)a3;
- (MRUSliderDelegate)delegate;
- (MRUVisualStylingProvider)stylingProvider;
- (NSHashTable)observers;
- (UIEdgeInsets)hitRectInset;
- (UIView)maximumValueView;
- (UIView)minimumValueView;
- (_UISliderFluidConfiguration)configuration;
- (double)expansionFactor;
- (double)stretchLimit;
- (id)animations;
- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4;
- (void)_sliderFluidInteractionWillContinue:(id)a3 withLocation:(CGPoint)a4;
- (void)_sliderFluidInteractionWillEnd:(id)a3;
- (void)_sliderFluidInteractionWillExtend:(id)a3 insets:(UIEdgeInsets)a4;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAnimations:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setEqualizing:(BOOL)a3;
- (void)setExpansionFactor:(double)a3;
- (void)setFluidTrackHidden:(BOOL)a3;
- (void)setHitRectInset:(UIEdgeInsets)a3;
- (void)setMaximumValueView:(id)a3;
- (void)setMinimumTrackVisible:(BOOL)a3;
- (void)setMinimumValueView:(id)a3;
- (void)setObservers:(id)a3;
- (void)setStretchLimit:(double)a3;
- (void)setStylingProvider:(id)a3;
- (void)updateVisualStyling;
@end

@implementation MRUSlider

- (MRUSlider)initWithStyle:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)MRUSlider;
  v4 = [(MRUSlider *)&v16 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v4->_observers;
    v4->_observers = (NSHashTable *)v5;

    [(MRUSlider *)v4 setMinimumValue:0.0];
    LODWORD(v7) = 1.0;
    [(MRUSlider *)v4 setMaximumValue:v7];
    v4->_minimumTrackVisible = 1;
    BOOL v8 = +[MRUFeatureFlagProvider isNewVolumeControlsMediaControlsEnabled];
    if (a3) {
      uint64_t v9 = 111;
    }
    else {
      uint64_t v9 = 110;
    }
    if (v8) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 110;
    }
    [(MRUSlider *)v4 _setSliderStyle:v10];
    v11 = (_UISliderFluidConfiguration *)objc_alloc_init(MEMORY[0x1E4FB22B8]);
    configuration = v4->_configuration;
    v4->_configuration = v11;

    [(_UISliderFluidConfiguration *)v4->_configuration setDelegate:v4];
    [(MRUSlider *)v4 _setSliderConfiguration:v4->_configuration];
  }
  v13 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
  id v14 = (id)[(MRUSlider *)v4 registerForTraitChanges:v13 withAction:sel_colorAffectingTraitsChanged];

  return v4;
}

- (MRUSlider)init
{
  return [(MRUSlider *)self initWithStyle:0];
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  v8.receiver = self;
  v8.super_class = (Class)MRUSlider;
  -[MRUSlider trackRectForBounds:](&v8, sel_trackRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width);
  double v6 = 0.0;
  double v7 = height;
  result.size.CGFloat height = v7;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    double v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUSlider *)self updateVisualStyling];
    double v5 = v7;
  }
}

- (double)expansionFactor
{
  v2 = [(MRUSlider *)self configuration];
  [v2 expansionFactor];
  double v4 = v3;

  return v4;
}

- (void)setExpansionFactor:(double)a3
{
  id v5 = [(MRUSlider *)self configuration];
  [v5 setExpansionFactor:a3];
  [(MRUSlider *)self _setSliderConfiguration:v5];
}

- (double)stretchLimit
{
  v2 = [(MRUSlider *)self configuration];
  [v2 stretchLimit];
  double v4 = v3;

  return v4;
}

- (void)setStretchLimit:(double)a3
{
  id v5 = [(MRUSlider *)self configuration];
  [v5 setStretchLimit:a3];
  [(MRUSlider *)self _setSliderConfiguration:v5];
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    [(MRUSlider *)self updateVisualStyling];
  }
}

- (void)setMinimumTrackVisible:(BOOL)a3
{
  if (self->_minimumTrackVisible != a3)
  {
    self->_minimumTrackVisible = a3;
    -[MRUSlider _setMinimumTrackVisible:withDuration:](self, "_setMinimumTrackVisible:withDuration:", 0.0);
  }
}

- (void)setEqualizing:(BOOL)a3
{
  if (self->_equalizing != a3)
  {
    self->_equalizing = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __27__MRUSlider_setEqualizing___block_invoke;
    v3[3] = &unk_1E5F0D7F8;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v3 options:0 animations:0.25 completion:0.0];
  }
}

uint64_t __27__MRUSlider_setEqualizing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisualStyling];
}

- (UIView)minimumValueView
{
  v2 = [(MRUSlider *)self configuration];
  double v3 = [v2 minimumValueView];

  return (UIView *)v3;
}

- (void)setMinimumValueView:(id)a3
{
  id v4 = a3;
  id v5 = [(MRUSlider *)self configuration];
  [v5 setMinimumValueView:v4];

  [(MRUSlider *)self _setSliderConfiguration:v5];
  [(MRUSlider *)self updateVisualStyling];
}

- (UIView)maximumValueView
{
  v2 = [(MRUSlider *)self configuration];
  double v3 = [v2 maximumValueView];

  return (UIView *)v3;
}

- (void)setMaximumValueView:(id)a3
{
  id v4 = a3;
  id v5 = [(MRUSlider *)self configuration];
  [v5 setMaximumValueView:v4];

  [(MRUSlider *)self _setSliderConfiguration:v5];
  [(MRUSlider *)self updateVisualStyling];
}

- (BOOL)fluidTrackHidden
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(MRUSlider *)self _fluidTrackHidden];
}

- (void)setFluidTrackHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(MRUSlider *)self _setFluidTrackHidden:v3];
    [(MRUSlider *)self updateVisualStyling];
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(MRUSlider *)self sendActionsForControlEvents:1];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v7 = self->_observers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "sliderInteractionWillBegin:withLocation:", self, x, y);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__MRUSlider__sliderFluidInteractionWillBegin_withLocation___block_invoke;
  v13[3] = &unk_1E5F0D7F8;
  v13[4] = self;
  [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDuration:2 delay:v13 options:0 mass:1.0 stiffness:0.0 damping:1.0 initialVelocity:288.0 animations:26.5 completion:0.0];
}

uint64_t __59__MRUSlider__sliderFluidInteractionWillBegin_withLocation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) animations];

  if (v2)
  {
    BOOL v3 = [*(id *)(a1 + 32) animations];
    v3[2](v3, 1);
  }
  id v4 = *(void **)(a1 + 32);

  return [v4 updateVisualStyling];
}

- (void)_sliderFluidInteractionWillContinue:(id)a3 withLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v7 = self->_observers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "sliderInteractionWillContinue:withLocation:", self, x, y, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_sliderFluidInteractionWillExtend:(id)a3 insets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = self->_observers;
  uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v14, "sliderInteractionWillExtend:insets:", self, top, left, bottom, right, (void)v15);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)_sliderFluidInteractionWillEnd:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(MRUSlider *)self sendActionsForControlEvents:64];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_observers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 sliderInteractionWillEnd:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__MRUSlider__sliderFluidInteractionWillEnd___block_invoke;
  v10[3] = &unk_1E5F0D7F8;
  v10[4] = self;
  [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDuration:2 delay:v10 options:0 mass:1.0 stiffness:0.0 damping:2.0 initialVelocity:500.0 animations:40.0 completion:0.0];
}

uint64_t __44__MRUSlider__sliderFluidInteractionWillEnd___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) animations];

  if (v2)
  {
    BOOL v3 = [*(id *)(a1 + 32) animations];
    v3[2](v3, 0);
  }
  id v4 = *(void **)(a1 + 32);

  return [v4 updateVisualStyling];
}

- (CGRect)hitRect
{
  v13.receiver = self;
  v13.super_class = (Class)MRUSlider;
  [(MRUSlider *)&v13 hitRect];
  double top = self->_hitRectInset.top;
  double left = self->_hitRectInset.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_hitRectInset.right);
  double v12 = v11 - (top + self->_hitRectInset.bottom);
  result.size.CGFloat height = v12;
  result.size.width = v10;
  result.origin.double y = v8;
  result.origin.double x = v6;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MRUSlider *)self hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3
{
  return 1;
}

- (void)updateVisualStyling
{
  [(MRUVisualStylingProvider *)self->_stylingProvider applyBlendModeToView:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (id v4 = WeakRetained,
        id v5 = objc_loadWeakRetained((id *)&self->_delegate),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v8 = [v7 minimumTrackStyleForSlider:self];
  }
  else if (([(MRUSlider *)self isTracking] & 1) != 0 || [(MRUSlider *)self isEqualizing])
  {
    uint64_t v8 = 0;
  }
  else if (self->_dimmed)
  {
    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v8 = 1;
  }
  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v9
    && (CGFloat v10 = v9,
        id v11 = objc_loadWeakRetained((id *)&self->_delegate),
        char v12 = objc_opt_respondsToSelector(),
        v11,
        v10,
        (v12 & 1) != 0))
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v14 = [v13 maximumTrackStyleForSlider:self];
  }
  else
  {
    uint64_t v14 = 3;
  }
  long long v15 = [(MRUSlider *)self traitCollection];
  id v28 = [v15 _traitCollectionByRemovingTrait:objc_opt_class()];

  uint64_t v16 = [(MRUVisualStylingProvider *)self->_stylingProvider blendColorForStyle:v8];
  long long v17 = [v16 resolvedColorWithTraitCollection:v28];

  long long v18 = [(MRUVisualStylingProvider *)self->_stylingProvider blendColorForStyle:v14];
  uint64_t v19 = [v18 resolvedColorWithTraitCollection:v28];

  [(MRUSlider *)self setMinimumTrackTintColor:v17];
  [(MRUSlider *)self setMaximumTrackTintColor:v19];
  uint64_t v20 = [(MRUSlider *)self minimumValueView];

  if (v20)
  {
    stylingProvider = self->_stylingProvider;
    v22 = [(MRUSlider *)self minimumValueView];
    [(MRUVisualStylingProvider *)stylingProvider applyBlendModeToView:v22];

    v23 = [(MRUSlider *)self minimumValueView];
    [v23 setTintColor:v17];
  }
  v24 = [(MRUSlider *)self maximumValueView];

  if (v24)
  {
    v25 = self->_stylingProvider;
    v26 = [(MRUSlider *)self maximumValueView];
    [(MRUVisualStylingProvider *)v25 applyBlendModeToView:v26];

    v27 = [(MRUSlider *)self maximumValueView];
    [v27 setTintColor:v19];
  }
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIEdgeInsets)hitRectInset
{
  double top = self->_hitRectInset.top;
  double left = self->_hitRectInset.left;
  double bottom = self->_hitRectInset.bottom;
  double right = self->_hitRectInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setHitRectInset:(UIEdgeInsets)a3
{
  self->_hitRectInset = a3;
}

- (BOOL)minimumTrackVisible
{
  return self->_minimumTrackVisible;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (BOOL)isEqualizing
{
  return self->_equalizing;
}

- (id)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
}

- (MRUSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUSliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UISliderFluidConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_animations, 0);

  objc_storeStrong((id *)&self->_stylingProvider, 0);
}

@end