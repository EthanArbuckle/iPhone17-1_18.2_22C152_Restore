@interface ARCoachingStateActivated
- (id)doAction:(int64_t)a3;
- (void)enter;
@end

@implementation ARCoachingStateActivated

- (void)enter
{
  v3 = [(ARCoachingState *)self view];
  [v3 startup];

  v4 = [(ARCoachingState *)self view];
  [v4 fadeInWithButton:0];

  id v5 = [(ARCoachingState *)self view];
  [v5 setHidden:0];
}

- (id)doAction:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v4 = [ARCoachingStateHidden alloc];
      id v5 = [(ARCoachingState *)self view];
      v6 = [(ARCoachingState *)v4 initWithView:v5];

      goto LABEL_17;
    case 1:
      nextState = self->_nextState;
      self->_nextState = 0;

      goto LABEL_16;
    case 2:
      v8 = ARCoachingStateDeactivating;
      goto LABEL_14;
    case 3:
      v9 = [(ARCoachingState *)self view];
      if ([v9 isUIAnimating])
      {

        goto LABEL_16;
      }
      v19 = self->_nextState;

      if (!v19) {
        goto LABEL_16;
      }
      v13 = self->_nextState;
LABEL_22:
      v6 = v13;
      goto LABEL_17;
    case 4:
      if (self->_nextState) {
        goto LABEL_16;
      }
      v10 = [(ARCoachingState *)self view];
      int v11 = [v10 checkDeactivationHeuristics];

      if (v11)
      {
        v12 = ARCoachingStateDeactivating;
      }
      else
      {
        v20 = [(ARCoachingState *)self view];
        int v21 = [v20 isRelocalizing];

        if (!v21) {
          goto LABEL_16;
        }
        v12 = ARCoachingStateRelocalizing;
      }
      id v22 = [v12 alloc];
      v15 = [(ARCoachingState *)self view];
      v23 = (ARCoachingState *)[v22 initWithView:v15];
      v24 = self->_nextState;
      self->_nextState = v23;

LABEL_15:
LABEL_16:
      v6 = 0;
LABEL_17:
      return v6;
    case 5:
      v8 = ARCoachingStateRelocalizing;
      goto LABEL_14;
    case 6:
      v13 = self->_nextState;
      if (!v13) {
        goto LABEL_16;
      }
      goto LABEL_22;
    case 7:
      v8 = ARCoachingStateSessionFailed;
LABEL_14:
      id v14 = [v8 alloc];
      v15 = [(ARCoachingState *)self view];
      v16 = (ARCoachingState *)[v14 initWithView:v15];
      v17 = self->_nextState;
      self->_nextState = v16;

      goto LABEL_15;
    default:
      goto LABEL_16;
  }
}

- (void).cxx_destruct
{
}

@end