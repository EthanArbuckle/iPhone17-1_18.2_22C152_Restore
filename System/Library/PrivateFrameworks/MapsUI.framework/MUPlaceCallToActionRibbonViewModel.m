@interface MUPlaceCallToActionRibbonViewModel
- (BOOL)isTappable;
- (MUPlaceCallToActionAppearance)submissionStatus;
- (MUPlaceCallToActionRibbonViewModel)initWithSubmissionStatus:(id)a3;
- (id)titleStringProvider;
- (id)valueStringProvider;
- (void)_updateInternalState;
- (void)setSubmissionStatus:(id)a3;
@end

@implementation MUPlaceCallToActionRibbonViewModel

- (MUPlaceCallToActionRibbonViewModel)initWithSubmissionStatus:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceCallToActionRibbonViewModel;
  v6 = [(MUPlaceCallToActionRibbonViewModel *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_submissionStatus, a3);
    [(MUPlaceCallToActionRibbonViewModel *)v7 _updateInternalState];
  }

  return v7;
}

- (void)setSubmissionStatus:(id)a3
{
  id v5 = a3;
  submissionStatus = self->_submissionStatus;
  unint64_t v10 = (unint64_t)v5;
  id v7 = submissionStatus;
  v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    char v9 = [(id)v10 isEqual:v7];

    v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_submissionStatus, a3);
      [(MUPlaceCallToActionRibbonViewModel *)self _updateInternalState];
      v8 = (void *)v10;
    }
  }
}

- (void)_updateInternalState
{
  v3 = +[MUPlaceRibbonItemViewModel ratingSubmissionStatusViewModelForRatingState:[(MKUGCCallToActionViewAppearance *)self->_submissionStatus ratingState]];
  callToActionViewModel = self->_callToActionViewModel;
  self->_callToActionViewModel = v3;

  id v5 = [(MUPlaceRibbonItemViewModel *)self updateDelegate];
  [v5 ribbonItemViewModelDidUpdate:self];

  id v6 = [(MUPlaceRibbonItemViewModel *)self->_callToActionViewModel typeStringForAX];
  [(MUPlaceRibbonItemViewModel *)self setTypeStringForAX:v6];
}

- (id)titleStringProvider
{
  v2 = [(MUPlaceRibbonItemViewModel *)self->_callToActionViewModel titleStringProvider];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)valueStringProvider
{
  v2 = [(MUPlaceRibbonItemViewModel *)self->_callToActionViewModel valueStringProvider];
  v3 = (void *)[v2 copy];

  return v3;
}

- (BOOL)isTappable
{
  return [(MUPlaceRibbonItemViewModel *)self->_callToActionViewModel isTappable];
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_callToActionViewModel, 0);
}

@end