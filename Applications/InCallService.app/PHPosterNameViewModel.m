@interface PHPosterNameViewModel
- (BOOL)isVisible;
- (BOOL)shouldUpdateForCall:(id)a3;
- (PHPosterNameViewModel)initWithCall:(id)a3 posterNameTextView:(id)a4;
- (PHPosterNameViewModel)initWithCall:(id)a3 posterNameTextView:(id)a4 priorityPosterNameTextView:(id)a5;
- (PRIncomingCallTextViewAdapterWrapper)posterNameTextView;
- (PRIncomingCallTextViewAdapterWrapper)priorityPosterNameTextView;
- (TUCall)call;
- (void)removeFromSuperview;
- (void)transitionCallToActiveStateAnimated:(BOOL)a3;
- (void)updatePosterNameAlpha:(double)a3;
- (void)updateStatus:(id)a3;
- (void)updateStatusFromParticipantsView:(id)a3;
- (void)updateViewModelForParticipantsView:(id)a3;
@end

@implementation PHPosterNameViewModel

- (PHPosterNameViewModel)initWithCall:(id)a3 posterNameTextView:(id)a4 priorityPosterNameTextView:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PHPosterNameViewModel;
  v12 = [(PHPosterNameViewModel *)&v18 init];
  if (v12)
  {
    v13 = [v10 titleText];
    id v14 = [v13 length];

    if (!v14)
    {
      v15 = [v9 handle];
      v16 = [v15 value];
      [v10 setTitleText:v16];
    }
    objc_storeStrong((id *)&v12->_call, a3);
    objc_storeStrong((id *)&v12->_posterNameTextView, a4);
    objc_storeStrong((id *)&v12->_priorityPosterNameTextView, a5);
  }

  return v12;
}

- (PHPosterNameViewModel)initWithCall:(id)a3 posterNameTextView:(id)a4
{
  return [(PHPosterNameViewModel *)self initWithCall:a3 posterNameTextView:a4 priorityPosterNameTextView:0];
}

- (BOOL)isVisible
{
  v3 = [(PHPosterNameViewModel *)self priorityPosterNameTextView];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PHPosterNameViewModel *)self posterNameTextView];
  }
  v6 = v5;

  v7 = [v6 viewController];
  v8 = [v7 view];
  [v8 alpha];
  BOOL v10 = v9 > 0.0;

  return v10;
}

- (void)removeFromSuperview
{
  v3 = [(PHPosterNameViewModel *)self posterNameTextView];
  v4 = [v3 viewController];
  id v5 = [v4 view];
  [v5 removeFromSuperview];

  v6 = [(PHPosterNameViewModel *)self posterNameTextView];
  v7 = [v6 emojiViewController];
  v8 = [v7 view];
  [v8 removeFromSuperview];

  double v9 = [(PHPosterNameViewModel *)self priorityPosterNameTextView];

  if (v9)
  {
    BOOL v10 = [(PHPosterNameViewModel *)self priorityPosterNameTextView];
    id v11 = [v10 viewController];
    v12 = [v11 view];
    [v12 removeFromSuperview];

    id v15 = [(PHPosterNameViewModel *)self priorityPosterNameTextView];
    v13 = [v15 emojiViewController];
    id v14 = [v13 view];
    [v14 removeFromSuperview];
  }
}

- (void)transitionCallToActiveStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PHPosterNameViewModel *)self posterNameTextView];
  [v5 transitionCallToActiveStateAnimated:v3];

  v6 = [(PHPosterNameViewModel *)self priorityPosterNameTextView];

  if (v6)
  {
    id v7 = [(PHPosterNameViewModel *)self priorityPosterNameTextView];
    [v7 transitionCallToActiveStateAnimated:v3];
  }
}

- (void)updateStatus:(id)a3
{
  id v7 = a3;
  v4 = [(PHPosterNameViewModel *)self posterNameTextView];
  [v4 setStatusText:v7];

  id v5 = [(PHPosterNameViewModel *)self priorityPosterNameTextView];

  if (v5)
  {
    v6 = [(PHPosterNameViewModel *)self priorityPosterNameTextView];
    [v6 setStatusText:v7];
  }
}

- (void)updateViewModelForParticipantsView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 currentCall];
  unsigned int v6 = [(PHPosterNameViewModel *)self shouldUpdateForCall:v5];

  id v8 = [v4 singleCallLabelView];

  if (v6) {
    id v7 = self;
  }
  else {
    id v7 = 0;
  }
  [v8 setPosterNameViewModel:v7];
}

- (void)updatePosterNameAlpha:(double)a3
{
  id v5 = [(PHPosterNameViewModel *)self posterNameTextView];
  unsigned int v6 = [v5 viewController];
  id v7 = [v6 view];
  [v7 setAlpha:a3];

  id v8 = [(PHPosterNameViewModel *)self posterNameTextView];
  double v9 = [v8 emojiViewController];
  BOOL v10 = [v9 view];
  [v10 setAlpha:a3];

  id v11 = [(PHPosterNameViewModel *)self priorityPosterNameTextView];

  if (v11)
  {
    v12 = [(PHPosterNameViewModel *)self priorityPosterNameTextView];
    v13 = [v12 viewController];
    id v14 = [v13 view];
    [v14 setAlpha:a3];

    id v17 = [(PHPosterNameViewModel *)self priorityPosterNameTextView];
    id v15 = [v17 emojiViewController];
    v16 = [v15 view];
    [v16 setAlpha:a3];
  }
}

- (void)updateStatusFromParticipantsView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 singleCallLabelView];
  unsigned int v6 = [v5 statusLabel];
  id v9 = [v6 text];

  id v7 = [v4 currentCall];

  LOBYTE(v4) = [(PHPosterNameViewModel *)self shouldUpdateForCall:v7];
  if (v4)
  {
    id v8 = v9;
  }
  else
  {

    id v8 = 0;
  }
  id v10 = v8;
  [(PHPosterNameViewModel *)self updateStatus:v8];
}

- (BOOL)shouldUpdateForCall:(id)a3
{
  id v4 = a3;
  id v5 = [(PHPosterNameViewModel *)self call];

  unsigned __int8 v6 = 1;
  if (v4 && v5)
  {
    id v7 = [(PHPosterNameViewModel *)self call];
    id v8 = [v7 uniqueProxyIdentifier];
    id v9 = [v4 uniqueProxyIdentifier];
    unsigned __int8 v6 = [v8 isEqualToString:v9];
  }
  return v6;
}

- (TUCall)call
{
  return self->_call;
}

- (PRIncomingCallTextViewAdapterWrapper)posterNameTextView
{
  return self->_posterNameTextView;
}

- (PRIncomingCallTextViewAdapterWrapper)priorityPosterNameTextView
{
  return self->_priorityPosterNameTextView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityPosterNameTextView, 0);
  objc_storeStrong((id *)&self->_posterNameTextView, 0);

  objc_storeStrong((id *)&self->_call, 0);
}

@end