@interface AVVisualAnalysisView
- (AVVisualAnalysisView)initWithFrame:(CGRect)a3;
- (AVVisualAnalysisViewDelegate)delegate;
- (BOOL)hasActiveTextSelection;
- (BOOL)hasProminentText;
- (BOOL)hasSubjectToCopy;
- (BOOL)hasVisualLookupResults;
- (BOOL)highlightsSelectableItems;
- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5;
- (BOOL)isInteractionInProgress;
- (BOOL)wantsAnalysisButtonVisible;
- (VKCImageAnalysis)analysis;
- (VKImageAnalysisInteraction)imageAnalysisInteraction;
- (double)analysisButtonBottomInset;
- (id)_updateInteractionAnalysisTypes;
- (id)_updateInteractionProgressIfNeeded;
- (id)analysisButton;
- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3;
- (unint64_t)analysisTypes;
- (void)_addInteractionIfNeeded;
- (void)_removeInteractionIfNeeded;
- (void)_updateActionInfoViewHiddenStateIfNeeded;
- (void)copySubject;
- (void)imageAnalysisInteraction:(id)a3 didRequestLiveTextButtonSelectedState:(BOOL)a4;
- (void)imageAnalysisInteraction:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4;
- (void)imageAnalysisInteraction:(id)a3 highlightSelectedItemsValueDidChange:(BOOL)a4;
- (void)imageAnalysisInteraction:(id)a3 imageAnalysisButtonPressed:(id)a4;
- (void)imageAnalysisInteraction:(id)a3 liveTextButtonDidChangeToVisible:(BOOL)a4;
- (void)imageAnalysisInteraction:(id)a3 prepareForCalloutAction:(SEL)a4 competion:(id)a5;
- (void)imageAnalysisInteractionDidCompleteSubjectAnalysis:(id)a3;
- (void)resetSelection;
- (void)setAnalysis:(id)a3;
- (void)setAnalysisButtonBottomInset:(double)a3;
- (void)setAnalysisTypes:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHasVisualLookupResults:(BOOL)a3;
- (void)setHighlightsInteractableAreas:(BOOL)a3;
- (void)setImageAnalysisInteraction:(id)a3;
- (void)setInteractionInProgress:(BOOL)a3;
- (void)setWantsAnalysisButtonVisible:(BOOL)a3;
@end

@implementation AVVisualAnalysisView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAnalysisInteraction, 0);
  objc_storeStrong((id *)&self->_analysis, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setImageAnalysisInteraction:(id)a3
{
}

- (unint64_t)analysisTypes
{
  return self->_analysisTypes;
}

- (BOOL)hasVisualLookupResults
{
  return self->_hasVisualLookupResults;
}

- (BOOL)isInteractionInProgress
{
  return self->_interactionInProgress;
}

- (double)analysisButtonBottomInset
{
  return self->_analysisButtonBottomInset;
}

- (BOOL)wantsAnalysisButtonVisible
{
  return self->_wantsAnalysisButtonVisible;
}

- (VKCImageAnalysis)analysis
{
  return self->_analysis;
}

- (void)setDelegate:(id)a3
{
}

- (AVVisualAnalysisViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVVisualAnalysisViewDelegate *)WeakRetained;
}

- (void)copySubject
{
  if ([(AVVisualAnalysisView *)self hasSubjectToCopy])
  {
    imageAnalysisInteraction = self->_imageAnalysisInteraction;
    id v4 = [(VKImageAnalysisInteraction *)imageAnalysisInteraction allSubjectIndexes];
    [(VKImageAnalysisInteraction *)imageAnalysisInteraction loadImageSubjectWithIndexes:v4 completion:&__block_literal_global_20986];
  }
}

void __35__AVVisualAnalysisView_copySubject__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v2 = (void *)MEMORY[0x1E4FB1A78];
    id v3 = a2;
    id v4 = [v2 generalPasteboard];
    [v4 setImage:v3];
  }
}

- (void)resetSelection
{
  if ([(AVVisualAnalysisView *)self hasActiveTextSelection])
  {
    imageAnalysisInteraction = self->_imageAnalysisInteraction;
    [(VKImageAnalysisInteraction *)imageAnalysisInteraction resetSelection];
  }
}

- (BOOL)hasActiveTextSelection
{
  return [(VKImageAnalysisInteraction *)self->_imageAnalysisInteraction hasActiveTextSelection];
}

- (BOOL)highlightsSelectableItems
{
  return [(VKImageAnalysisInteraction *)self->_imageAnalysisInteraction highlightSelectableItems];
}

- (id)analysisButton
{
  return (id)[(VKImageAnalysisInteraction *)self->_imageAnalysisInteraction analysisButton];
}

- (void)setHasVisualLookupResults:(BOOL)a3
{
  if (self->_hasVisualLookupResults != a3)
  {
    self->_hasVisualLookupResults = a3;
    id v4 = [(AVVisualAnalysisView *)self delegate];
    [v4 visualAnalysisViewDidUpdateVisualLookupAvailability:self];
  }
}

- (void)setAnalysisTypes:(unint64_t)a3
{
  if (self->_analysisTypes != a3)
  {
    self->_analysisTypes = a3;
    [(AVVisualAnalysisView *)self setHasVisualLookupResults:[(VKCImageAnalysis *)self->_analysis hasResultsForAnalysisTypes:16]];
    -[AVVisualAnalysisView _updateInteractionAnalysisTypes]((id *)&self->super.super.super.isa);
  }
}

- (id)_updateInteractionAnalysisTypes
{
  if (result)
  {
    v1 = result;
    [result[56] setActiveInteractionTypes:((unint64_t)v1[55] >> 1) & 4 | (8 * (((unint64_t)v1[55] >> 2) & 1)) | (((unint64_t)v1[55] & 0x12) != 0)];
    return -[AVVisualAnalysisView _updateInteractionProgressIfNeeded](v1);
  }
  return result;
}

- (id)_updateInteractionProgressIfNeeded
{
  if (result)
  {
    v1 = result;
    int v2 = [result hasActiveTextSelection];
    int v3 = [v1 highlightsInteractableAreas];
    uint64_t v4 = ((unint64_t)v1[55] >> 3) & 1;
    int v5 = [v1[56] subjectInteractionInProgress];
    uint64_t v6 = v2 | v3 | v4 | v5 | [v1[56] subjectHighlightActive];
    return (id *)[v1 setInteractionInProgress:v6];
  }
  return result;
}

- (void)setInteractionInProgress:(BOOL)a3
{
  if (self->_interactionInProgress != a3)
  {
    BOOL v3 = a3;
    self->_interactionInProgress = a3;
    id v4 = [(AVVisualAnalysisView *)self delegate];
    [v4 visualAnalysisViewDidBeginInteraction:v3];
  }
}

- (BOOL)hasSubjectToCopy
{
  int v3 = [(VKImageAnalysisInteraction *)self->_imageAnalysisInteraction isSubjectAnalysisComplete];
  if (v3)
  {
    [(VKImageAnalysisInteraction *)self->_imageAnalysisInteraction subjectFrame];
    LOBYTE(v3) = !CGRectEqualToRect(v5, *MEMORY[0x1E4F1DB20]);
  }
  return v3;
}

- (BOOL)hasProminentText
{
  return [(VKImageAnalysisInteraction *)self->_imageAnalysisInteraction liveTextButtonVisible];
}

- (void)setHighlightsInteractableAreas:(BOOL)a3
{
  id v3 = [(AVVisualAnalysisView *)self analysisButton];
  [v3 sendActionsForControlEvents:64];
}

- (void)setWantsAnalysisButtonVisible:(BOOL)a3
{
  if (self->_wantsAnalysisButtonVisible != a3)
  {
    self->_wantsAnalysisButtonVisible = a3;
    -[AVVisualAnalysisView _updateActionInfoViewHiddenStateIfNeeded](self);
  }
}

- (void)_updateActionInfoViewHiddenStateIfNeeded
{
  if (a1)
  {
    BOOL v2 = ([a1 highlightsSelectableItems] & 1) == 0 && a1[409] == 0;
    id v3 = [a1 imageAnalysisInteraction];
    [v3 setActionInfoViewHidden:v2];
  }
}

- (void)_removeInteractionIfNeeded
{
  id v3 = [(AVVisualAnalysisView *)self interactions];
  id v4 = [(AVVisualAnalysisView *)self imageAnalysisInteraction];
  int v5 = [v3 containsObject:v4];

  if (v5)
  {
    id v6 = [(AVVisualAnalysisView *)self imageAnalysisInteraction];
    [(AVVisualAnalysisView *)self removeInteraction:v6];
  }
}

- (void)_addInteractionIfNeeded
{
  id v3 = [(AVVisualAnalysisView *)self interactions];
  id v4 = [(AVVisualAnalysisView *)self imageAnalysisInteraction];
  char v5 = [v3 containsObject:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = [(AVVisualAnalysisView *)self imageAnalysisInteraction];
    [(AVVisualAnalysisView *)self addInteraction:v6];
  }
}

- (VKImageAnalysisInteraction)imageAnalysisInteraction
{
  imageAnalysisInteraction = self->_imageAnalysisInteraction;
  if (!imageAnalysisInteraction)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getVKCImageAnalysisInteractionClass_softClass;
    uint64_t v13 = getVKCImageAnalysisInteractionClass_softClass;
    if (!getVKCImageAnalysisInteractionClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getVKCImageAnalysisInteractionClass_block_invoke;
      v9[3] = &unk_1E5FC42C0;
      v9[4] = &v10;
      __getVKCImageAnalysisInteractionClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    char v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = (VKImageAnalysisInteraction *)objc_alloc_init(v5);
    v7 = self->_imageAnalysisInteraction;
    self->_imageAnalysisInteraction = v6;

    [(VKImageAnalysisInteraction *)self->_imageAnalysisInteraction setActionInfoLiveTextButtonDisabled:0];
    [(VKImageAnalysisInteraction *)self->_imageAnalysisInteraction setActionInfoQuickActionsDisabled:0];
    [(VKImageAnalysisInteraction *)self->_imageAnalysisInteraction setActionInfoViewHidden:1];
    [(VKImageAnalysisInteraction *)self->_imageAnalysisInteraction setAnalysisButtonRequiresVisibleContentGating:0];
    [(VKImageAnalysisInteraction *)self->_imageAnalysisInteraction setAutomaticallyShowVisualSearchResults:1];
    [(VKImageAnalysisInteraction *)self->_imageAnalysisInteraction setDelegate:self];
    -[AVVisualAnalysisView _updateInteractionAnalysisTypes]((id *)&self->super.super.super.isa);
    imageAnalysisInteraction = self->_imageAnalysisInteraction;
  }

  return imageAnalysisInteraction;
}

- (void)setAnalysisButtonBottomInset:(double)a3
{
  if (self->_analysisButtonBottomInset != a3)
  {
    self->_analysisButtonBottomInset = a3;
    char v5 = [(AVVisualAnalysisView *)self imageAnalysisInteraction];
    objc_msgSend(v5, "setActionInfoEdgeInsets:", 8.0, 8.0, a3, 8.0);

    id v6 = [(AVVisualAnalysisView *)self imageAnalysisInteraction];
    [v6 updateActionInfoLayout];
  }
}

- (void)setAnalysis:(id)a3
{
  char v5 = (VKCImageAnalysis *)a3;
  p_analysis = &self->_analysis;
  if (self->_analysis != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_analysis, a3);
    [(AVVisualAnalysisView *)self _addInteractionIfNeeded];
    v7 = [(AVVisualAnalysisView *)self imageAnalysisInteraction];
    [v7 setAnalysis:v9];

    -[AVVisualAnalysisView _updateActionInfoViewHiddenStateIfNeeded](self);
    [(VKImageAnalysisInteraction *)self->_imageAnalysisInteraction updateActionInfoLayout];
    [(AVVisualAnalysisView *)self setHasVisualLookupResults:[(VKCImageAnalysis *)*p_analysis hasResultsForAnalysisTypes:16]];
    if ((self->_analysisTypes & 4) != 0 && *p_analysis)
    {
      [(VKImageAnalysisInteraction *)self->_imageAnalysisInteraction beginImageSubjectAnalysisIfNecessary];
    }
    else
    {
      v8 = [(AVVisualAnalysisView *)self delegate];
      [v8 visualAnalysisViewDidUpdateSubjectAvailability:self];
    }
    char v5 = v9;
  }
}

- (AVVisualAnalysisView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVVisualAnalysisView;
  id v3 = -[AVVisualAnalysisView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = +[AVKitGlobalSettings shared];
    v3->_subjectLiftGestureEnabled = [v4 subjectLiftGestureEnabled];
  }
  return v3;
}

- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3
{
  id v4 = [(AVVisualAnalysisView *)self delegate];
  char v5 = [v4 presentingViewControllerForVisualAnalysisView:self];

  return v5;
}

- (void)imageAnalysisInteraction:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  id v5 = [(AVVisualAnalysisView *)self delegate];
  [v5 visualAnalysisViewDidTapVisualLookupIndicator:self];
}

- (void)imageAnalysisInteractionDidCompleteSubjectAnalysis:(id)a3
{
  id v4 = [(AVVisualAnalysisView *)self delegate];
  [v4 visualAnalysisViewDidUpdateSubjectAvailability:self];
}

- (void)imageAnalysisInteraction:(id)a3 highlightSelectedItemsValueDidChange:(BOOL)a4
{
  -[AVVisualAnalysisView _updateActionInfoViewHiddenStateIfNeeded](self);

  -[AVVisualAnalysisView _updateInteractionProgressIfNeeded]((id *)&self->super.super.super.isa);
}

- (void)imageAnalysisInteraction:(id)a3 didRequestLiveTextButtonSelectedState:(BOOL)a4
{
  -[AVVisualAnalysisView _updateActionInfoViewHiddenStateIfNeeded](self);

  -[AVVisualAnalysisView _updateInteractionProgressIfNeeded]((id *)&self->super.super.super.isa);
}

- (void)imageAnalysisInteraction:(id)a3 liveTextButtonDidChangeToVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AVVisualAnalysisView *)self delegate];
  [v6 visualAnalysisView:self didToggleAnalysisButtonVisibilityToVisible:v4];
}

- (void)imageAnalysisInteraction:(id)a3 prepareForCalloutAction:(SEL)a4 competion:(id)a5
{
  id v7 = a5;
  id v8 = [(AVVisualAnalysisView *)self delegate];
  [v8 visualAnalysisView:self prepareForCalloutAction:a4 completion:v7];
}

- (void)imageAnalysisInteraction:(id)a3 imageAnalysisButtonPressed:(id)a4
{
  id v5 = [(AVVisualAnalysisView *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AVVisualAnalysisView *)self delegate];
    [v7 visualAnalysisViewDidPressAnalysisButton:self];
  }
  -[AVVisualAnalysisView _updateActionInfoViewHiddenStateIfNeeded](self);

  -[AVVisualAnalysisView _updateInteractionProgressIfNeeded]((id *)&self->super.super.super.isa);
}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  BOOL v9 = [(AVVisualAnalysisView *)self hasActiveTextSelection];
  char v10 = objc_msgSend(v8, "interactableItemExistsAtPoint:", x, y);
  int v11 = objc_msgSend(v8, "imageSubjectExistsAtPoint:", x, y);

  uint64_t v12 = [(AVVisualAnalysisView *)self delegate];
  int v13 = [v12 shouldBeginTouchInteractionForVisualAnalysisView:self];

  if (v9) {
    [(AVVisualAnalysisView *)self resetSelection];
  }
  BOOL result = v10 | v9;
  if (v11 && (!v13 || !self->_subjectLiftGestureEnabled)) {
    return 0;
  }
  return result;
}

@end