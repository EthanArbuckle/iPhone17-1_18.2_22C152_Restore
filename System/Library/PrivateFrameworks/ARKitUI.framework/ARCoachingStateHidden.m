@interface ARCoachingStateHidden
- (BOOL)isViewActiveForState;
- (id)doAction:(int64_t)a3;
- (void)enter;
- (void)exit;
@end

@implementation ARCoachingStateHidden

- (BOOL)isViewActiveForState
{
  return 0;
}

- (void)enter
{
  v3 = [(ARCoachingState *)self view];
  int v4 = [v3 wasEverActivated];

  v5 = [(ARCoachingState *)self view];
  [v5 setHidden:1];

  v6 = [(ARCoachingState *)self view];
  [v6 teardown];

  if (v4)
  {
    v7 = [(ARCoachingState *)self view];
    v8 = [v7 delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v10 = [(ARCoachingState *)self view];
      v11 = [v10 delegate];
      v12 = [(ARCoachingState *)self view];
      [v11 coachingOverlayViewDidDeactivate:v12];
    }
  }
  self->_autoActivateTime = -1.0;
  self->_minimumWaitComplete = 0;
}

- (void)exit
{
  v3 = [(ARCoachingState *)self view];
  int v4 = [v3 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v8 = [(ARCoachingState *)self view];
    v6 = [v8 delegate];
    v7 = [(ARCoachingState *)self view];
    [v6 coachingOverlayViewWillActivate:v7];
  }
}

- (id)doAction:(int64_t)a3
{
  v3 = 0;
  switch(a3)
  {
    case 1:
      goto LABEL_2;
    case 4:
      v6 = [(ARCoachingState *)self view];
      int v7 = [v6 checkActivationHeuristics];

      if (!v7) {
        goto LABEL_7;
      }
      id v8 = [(ARCoachingState *)self view];
      char v9 = [v8 session];
      v10 = [v9 currentFrame];
      [v10 timestamp];
      double v12 = v11;

      double autoActivateTime = self->_autoActivateTime;
      if (autoActivateTime < 0.0)
      {
        v14 = [(ARCoachingState *)self view];
        self->_double autoActivateTime = v12 + ARCoachingMinimumActivationDelay([v14 goal]);
LABEL_6:

LABEL_10:
        v3 = 0;
        goto LABEL_15;
      }
      if (v12 < autoActivateTime) {
        goto LABEL_10;
      }
      if (!self->_minimumWaitComplete)
      {
        self->_minimumWaitComplete = 1;
        v14 = [(ARCoachingState *)self view];
        uint64_t v20 = [v14 goal];
        v21 = [(ARCoachingState *)self view];
        self->_double autoActivateTime = v12 + ARCoachingAdditionalActivationDelay(v20, [v21 isRelocalizing]);

        goto LABEL_6;
      }
      v15 = [(ARCoachingState *)self view];
      int v16 = [v15 isRelocalizing];

      if (v16) {
LABEL_13:
      }
        char v5 = ARCoachingStateRelocalizing;
      else {
LABEL_2:
      }
        char v5 = ARCoachingStateActivated;
LABEL_14:
      id v17 = [v5 alloc];
      v18 = [(ARCoachingState *)self view];
      v3 = (void *)[v17 initWithView:v18];

LABEL_15:
      return v3;
    case 5:
      goto LABEL_13;
    case 7:
      char v5 = ARCoachingStateSessionFailed;
      goto LABEL_14;
    case 8:
LABEL_7:
      v3 = 0;
      self->_double autoActivateTime = -1.0;
      goto LABEL_15;
    default:
      goto LABEL_15;
  }
}

@end