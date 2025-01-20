@interface GKCollectionViewPlaceholderView
- (GKCollectionViewPlaceholderView)initWithFrame:(CGRect)a3;
- (GKPlaceholderContentStateMachine)loadingMachine;
- (GKPlaceholderView)placeholderView;
- (NSArray)cachedConstraints;
- (NSString)errorMessage;
- (NSString)errorTitle;
- (NSString)loadingState;
- (NSString)noContentButtonTitle;
- (NSString)noContentMessage;
- (NSString)noContentTitle;
- (SEL)noContentButtonAction;
- (UIActivityIndicatorView)loadingIndicatorView;
- (id)noContentButtonTarget;
- (int64_t)alignment;
- (void)buttonPressed;
- (void)dealloc;
- (void)delayedShowLoadingIndicator;
- (void)didEnterErrorState;
- (void)didEnterLoadingState;
- (void)didEnterNoContentState;
- (void)didExitErrorState;
- (void)didExitLoadingState;
- (void)didExitNoContentState;
- (void)setAlignment:(int64_t)a3;
- (void)setCachedConstraints:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setErrorTitle:(id)a3;
- (void)setLoadingIndicatorView:(id)a3;
- (void)setLoadingMachine:(id)a3;
- (void)setLoadingState:(id)a3;
- (void)setNoContentButtonAction:(SEL)a3;
- (void)setNoContentButtonTarget:(id)a3;
- (void)setNoContentButtonTitle:(id)a3;
- (void)setNoContentMessage:(id)a3;
- (void)setNoContentTitle:(id)a3;
- (void)setPlaceholderView:(id)a3;
- (void)updateConstraints;
@end

@implementation GKCollectionViewPlaceholderView

- (GKCollectionViewPlaceholderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v28.receiver = self;
  v28.super_class = (Class)GKCollectionViewPlaceholderView;
  v7 = -[GKCollectionViewPlaceholderView initWithFrame:](&v28, sel_initWithFrame_);
  if (v7)
  {
    v8 = [MEMORY[0x1E4F639B0] sharedPalette];
    v9 = [v8 viewBackgroundColor];
    [(GKCollectionViewPlaceholderView *)v7 setBackgroundColor:v9];

    v10 = objc_alloc_init(GKPlaceholderContentStateMachine);
    loadingMachine = v7->_loadingMachine;
    v7->_loadingMachine = v10;

    [(_GKStateMachine *)v7->_loadingMachine setDelegate:v7];
    v12 = GKGameCenterUIFrameworkBundle();
    v13 = GKGetLocalizedStringFromTableInBundle();
    [(GKCollectionViewPlaceholderView *)v7 setNoContentTitle:v13];

    [(GKCollectionViewPlaceholderView *)v7 setNoContentMessage:0];
    v14 = GKGameCenterUIFrameworkBundle();
    v15 = GKGetLocalizedStringFromTableInBundle();
    [(GKCollectionViewPlaceholderView *)v7 setErrorTitle:v15];

    v16 = GKGameCenterUIFrameworkBundle();
    v17 = GKGetLocalizedStringFromTableInBundle();
    [(GKCollectionViewPlaceholderView *)v7 setErrorMessage:v17];

    v18 = +[GKPlaceholderView placeholderViewWithTitle:message:frame:](GKPlaceholderView, "placeholderViewWithTitle:message:frame:", v7->_noContentTitle, v7->_noContentTitle, x, y, width, height);
    [(GKCollectionViewPlaceholderView *)v7 setPlaceholderView:v18];

    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__9;
    v26[4] = __Block_byref_object_dispose__9;
    v19 = v7;
    v27 = v19;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __49__GKCollectionViewPlaceholderView_initWithFrame___block_invoke;
    v25[3] = &unk_1E5F632D8;
    v25[4] = v26;
    [v19[61] setButtonAction:v25];
    [v19[61] setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1400]), "initWithFrame:", x, y, width, height);
    id v21 = v19[70];
    v19[70] = (id)v20;

    [v19[70] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v19 addSubview:v19[70]];
    [v19[61] setAlpha:0.0];
    [v19[70] setActivityIndicatorViewStyle:101];
    v22 = [MEMORY[0x1E4F639B0] sharedPalette];
    v23 = [v22 activityIndicatorColor];
    [v19[70] setColor:v23];

    [v19[70] setAlpha:0.0];
    [v19 addSubview:v19[61]];
    [v19 setAlignment:2];
    _Block_object_dispose(v26, 8);
  }
  return v7;
}

uint64_t __49__GKCollectionViewPlaceholderView_initWithFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) buttonPressed];
}

- (void)dealloc
{
  [(UIActivityIndicatorView *)self->_loadingIndicatorView stopAnimating];
  v3.receiver = self;
  v3.super_class = (Class)GKCollectionViewPlaceholderView;
  [(GKCollectionViewPlaceholderView *)&v3 dealloc];
}

- (void)buttonPressed
{
  id noContentButtonTarget = self->_noContentButtonTarget;
  if (noContentButtonTarget)
  {
    SEL noContentButtonAction = self->_noContentButtonAction;
    if (noContentButtonAction) {
      objc_msgSend(noContentButtonTarget, "_gkPerformSelector:withObject:", noContentButtonAction);
    }
  }
}

- (void)setAlignment:(int64_t)a3
{
  if (self->_alignment != a3)
  {
    self->_alignment = a3;
    [(GKCollectionViewPlaceholderView *)self setNeedsUpdateConstraints];
  }
}

- (void)updateConstraints
{
  v16.receiver = self;
  v16.super_class = (Class)GKCollectionViewPlaceholderView;
  [(GKCollectionViewPlaceholderView *)&v16 updateConstraints];
  objc_super v3 = [(GKCollectionViewPlaceholderView *)self cachedConstraints];
  if (v3) {
    [(GKCollectionViewPlaceholderView *)self removeConstraints:v3];
  }
  v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:32];
  int64_t alignment = self->_alignment;
  if (alignment == 1)
  {
    v12 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:self->_placeholderView centeredXInView:self];
    [v4 addObject:v12];

    v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_placeholderView attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:20.0];
    [v4 addObject:v13];

    v14 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:self->_loadingIndicatorView centeredXInView:self->_placeholderView];
    [v4 addObject:v14];

    v11 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:self->_loadingIndicatorView centeredYInView:self->_placeholderView];
    [v4 addObject:v11];
    goto LABEL_7;
  }
  if (alignment == 2)
  {
    double v6 = *MEMORY[0x1E4FB2848];
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    v10 = objc_msgSend(MEMORY[0x1E4F28DC8], "_gkConstraintsForView:withinView:insets:", self->_placeholderView, self, *MEMORY[0x1E4FB2848], v7, v8, v9);
    [v4 addObjectsFromArray:v10];

    v11 = objc_msgSend(MEMORY[0x1E4F28DC8], "_gkConstraintsForView:withinView:insets:", self->_loadingIndicatorView, self, v6, v7, v8, v9);
    [v4 addObjectsFromArray:v11];
LABEL_7:
  }
  v15 = [MEMORY[0x1E4F28DC8] _gkConstraintForView:self->_placeholderView withWidthDerivedFromView:self insetBy:0.0];
  [v4 addObject:v15];

  [(GKCollectionViewPlaceholderView *)self setCachedConstraints:v4];
  [(GKCollectionViewPlaceholderView *)self addConstraints:v4];
}

- (void)setLoadingState:(id)a3
{
  loadingMachine = self->_loadingMachine;
  id v5 = a3;
  [(_GKStateMachine *)loadingMachine setCurrentState:@"Initial"];
  [(_GKStateMachine *)self->_loadingMachine setCurrentState:v5];
}

- (NSString)loadingState
{
  return [(_GKStateMachine *)self->_loadingMachine currentState];
}

- (void)delayedShowLoadingIndicator
{
  objc_super v3 = [(_GKStateMachine *)self->_loadingMachine currentState];

  loadingIndicatorView = self->_loadingIndicatorView;
  if (v3 == @"LoadingState")
  {
    [(UIActivityIndicatorView *)loadingIndicatorView startAnimating];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__GKCollectionViewPlaceholderView_delayedShowLoadingIndicator__block_invoke;
    v5[3] = &unk_1E5F62EB0;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.15];
  }
  else
  {
    [(UIActivityIndicatorView *)loadingIndicatorView setAlpha:0.0];
  }
}

uint64_t __62__GKCollectionViewPlaceholderView_delayedShowLoadingIndicator__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 560) setAlpha:1.0];
}

- (void)didEnterLoadingState
{
}

- (void)didExitLoadingState
{
  [(UIActivityIndicatorView *)self->_loadingIndicatorView stopAnimating];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__GKCollectionViewPlaceholderView_didExitLoadingState__block_invoke;
  v3[3] = &unk_1E5F62EB0;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:0.25];
}

uint64_t __54__GKCollectionViewPlaceholderView_didExitLoadingState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 560) setAlpha:0.0];
}

- (void)didEnterNoContentState
{
  [(_UIContentUnavailableView *)self->_placeholderView setTitle:self->_noContentTitle];
  [(_UIContentUnavailableView *)self->_placeholderView setMessage:self->_noContentMessage];
  [(_UIContentUnavailableView *)self->_placeholderView setButtonTitle:self->_noContentButtonTitle];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__GKCollectionViewPlaceholderView_didEnterNoContentState__block_invoke;
  v3[3] = &unk_1E5F62EB0;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:0.15];
}

uint64_t __57__GKCollectionViewPlaceholderView_didEnterNoContentState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 488) setAlpha:1.0];
}

- (void)didExitNoContentState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __56__GKCollectionViewPlaceholderView_didExitNoContentState__block_invoke;
  v2[3] = &unk_1E5F62EB0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v2 animations:0.15];
}

uint64_t __56__GKCollectionViewPlaceholderView_didExitNoContentState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 488) setAlpha:0.0];
}

- (void)didEnterErrorState
{
  [(_UIContentUnavailableView *)self->_placeholderView setTitle:self->_errorTitle];
  [(_UIContentUnavailableView *)self->_placeholderView setMessage:self->_errorMessage];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__GKCollectionViewPlaceholderView_didEnterErrorState__block_invoke;
  v3[3] = &unk_1E5F62EB0;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:0.15];
}

uint64_t __53__GKCollectionViewPlaceholderView_didEnterErrorState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 488) setAlpha:1.0];
}

- (void)didExitErrorState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__GKCollectionViewPlaceholderView_didExitErrorState__block_invoke;
  v2[3] = &unk_1E5F62EB0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v2 animations:0.15];
}

uint64_t __52__GKCollectionViewPlaceholderView_didExitErrorState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 488) setAlpha:0.0];
}

- (GKPlaceholderView)placeholderView
{
  return self->_placeholderView;
}

- (void)setPlaceholderView:(id)a3
{
}

- (NSString)noContentTitle
{
  return self->_noContentTitle;
}

- (void)setNoContentTitle:(id)a3
{
}

- (NSString)noContentMessage
{
  return self->_noContentMessage;
}

- (void)setNoContentMessage:(id)a3
{
}

- (NSString)noContentButtonTitle
{
  return self->_noContentButtonTitle;
}

- (void)setNoContentButtonTitle:(id)a3
{
}

- (id)noContentButtonTarget
{
  return self->_noContentButtonTarget;
}

- (void)setNoContentButtonTarget:(id)a3
{
  self->_id noContentButtonTarget = a3;
}

- (SEL)noContentButtonAction
{
  if (self->_noContentButtonAction) {
    return self->_noContentButtonAction;
  }
  else {
    return 0;
  }
}

- (void)setNoContentButtonAction:(SEL)a3
{
  if (a3) {
    objc_super v3 = a3;
  }
  else {
    objc_super v3 = 0;
  }
  self->_SEL noContentButtonAction = v3;
}

- (NSString)errorTitle
{
  return self->_errorTitle;
}

- (void)setErrorTitle:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (UIActivityIndicatorView)loadingIndicatorView
{
  return self->_loadingIndicatorView;
}

- (void)setLoadingIndicatorView:(id)a3
{
}

- (GKPlaceholderContentStateMachine)loadingMachine
{
  return self->_loadingMachine;
}

- (void)setLoadingMachine:(id)a3
{
}

- (NSArray)cachedConstraints
{
  return self->_cachedConstraints;
}

- (void)setCachedConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConstraints, 0);
  objc_storeStrong((id *)&self->_loadingMachine, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorTitle, 0);
  objc_storeStrong((id *)&self->_noContentButtonTitle, 0);
  objc_storeStrong((id *)&self->_noContentMessage, 0);
  objc_storeStrong((id *)&self->_noContentTitle, 0);

  objc_storeStrong((id *)&self->_placeholderView, 0);
}

@end