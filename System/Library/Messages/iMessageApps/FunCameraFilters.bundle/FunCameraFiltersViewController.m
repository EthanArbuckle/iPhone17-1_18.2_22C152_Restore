@interface FunCameraFiltersViewController
- (BOOL)isExpanded;
- (FunCamFilterPickerPresentationDelegate)filterPickerPresentationDelegate;
- (unint64_t)layoutPresentationStyle;
- (void)setFilterPickerPresentationDelegate:(id)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation FunCameraFiltersViewController

- (unint64_t)layoutPresentationStyle
{
  return [(FunCameraFiltersViewController *)self isExpanded];
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FunCameraFiltersViewController;
  -[FunCameraFiltersViewController willTransitionToPresentationStyle:](&v6, "willTransitionToPresentationStyle:");
  [(FunCameraFiltersViewController *)self setIsExpanded:a3 == 1];
  v5 = [(FunCameraFiltersViewController *)self filterPickerPresentationDelegate];
  [v5 filterPickerPresentationModeDidChange];
}

- (FunCamFilterPickerPresentationDelegate)filterPickerPresentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->filterPickerPresentationDelegate);

  return (FunCamFilterPickerPresentationDelegate *)WeakRetained;
}

- (void)setFilterPickerPresentationDelegate:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (void).cxx_destruct
{
}

@end