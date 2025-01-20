@interface ARCoachingStateDeactivating
- (BOOL)isViewActiveForState;
- (id)doAction:(int64_t)a3;
- (void)enter;
@end

@implementation ARCoachingStateDeactivating

- (BOOL)isViewActiveForState
{
  return 0;
}

- (void)enter
{
  v3 = [(ARCoachingState *)self view];
  v4 = [v3 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(ARCoachingState *)self view];
    v7 = [v6 delegate];
    v8 = [(ARCoachingState *)self view];
    [v7 coachingOverlayViewWillDeactivate:v8];
  }
  v9 = [(ARCoachingState *)self view];
  [v9 fadeOut];

  v10 = [ARCoachingStateHidden alloc];
  id v13 = [(ARCoachingState *)self view];
  v11 = [(ARCoachingState *)v10 initWithView:v13];
  nextState = self->_nextState;
  self->_nextState = v11;
}

- (id)doAction:(int64_t)a3
{
  v3 = 0;
  switch(a3)
  {
    case 0:
      char v5 = [ARCoachingStateHidden alloc];
      v6 = [(ARCoachingState *)self view];
      v3 = [(ARCoachingState *)v5 initWithView:v6];

      goto LABEL_13;
    case 1:
      v7 = ARCoachingStateActivated;
      goto LABEL_11;
    case 2:
      v7 = ARCoachingStateHidden;
      goto LABEL_11;
    case 3:
      v8 = [(ARCoachingState *)self view];
      if ([v8 isUIAnimating])
      {

LABEL_12:
        v3 = 0;
        goto LABEL_13;
      }
      nextState = self->_nextState;

      if (!nextState) {
        goto LABEL_12;
      }
      v9 = self->_nextState;
LABEL_18:
      v3 = v9;
LABEL_13:
      return v3;
    case 5:
      v7 = ARCoachingStateRelocalizing;
      goto LABEL_11;
    case 6:
      v9 = self->_nextState;
      if (!v9) {
        goto LABEL_12;
      }
      goto LABEL_18;
    case 7:
      v7 = ARCoachingStateSessionFailed;
LABEL_11:
      id v10 = [v7 alloc];
      v11 = [(ARCoachingState *)self view];
      v12 = (ARCoachingState *)[v10 initWithView:v11];
      id v13 = self->_nextState;
      self->_nextState = v12;

      goto LABEL_12;
    default:
      goto LABEL_13;
  }
}

- (void).cxx_destruct
{
}

@end