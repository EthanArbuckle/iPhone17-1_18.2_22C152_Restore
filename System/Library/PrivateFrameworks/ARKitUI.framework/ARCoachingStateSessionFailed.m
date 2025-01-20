@interface ARCoachingStateSessionFailed
- (ARCoachingStateSessionFailed)initWithView:(id)a3;
- (id)doAction:(int64_t)a3;
- (int64_t)requirements;
- (void)enter;
@end

@implementation ARCoachingStateSessionFailed

- (ARCoachingStateSessionFailed)initWithView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ARCoachingStateSessionFailed;
  v3 = [(ARCoachingState *)&v7 initWithView:a3];
  if (v3)
  {
    v4 = objc_alloc_init(ARCoachingHeuristicCollection);
    heuristics = v3->_heuristics;
    v3->_heuristics = v4;
  }
  return v3;
}

- (int64_t)requirements
{
  return 64;
}

- (void)enter
{
  v3 = [(ARCoachingState *)self view];
  [v3 startup];

  v4 = [(ARCoachingState *)self view];
  [v4 fadeInWithButton:1];

  v5 = [(ARCoachingState *)self view];
  [v5 setHidden:0];

  [(ARCoachingHeuristicCollection *)self->_heuristics clear];
  heuristics = self->_heuristics;
  objc_super v7 = objc_alloc_init(ARCoachingHeuristicHasActiveFrames);
  [(ARCoachingHeuristicCollection *)heuristics addHeuristic:v7];
}

- (id)doAction:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v4 = [ARCoachingStateHidden alloc];
      v5 = [(ARCoachingState *)self view];
      v6 = [(ARCoachingState *)v4 initWithView:v5];

      break;
    case 1:
      objc_super v7 = ARCoachingStateActivated;
      goto LABEL_13;
    case 2:
      objc_super v7 = ARCoachingStateDeactivating;
      goto LABEL_13;
    case 3:
      v8 = [(ARCoachingState *)self view];
      if ([(ARCoachingFrame *)v8 isUIAnimating]) {
        goto LABEL_21;
      }
      nextState = self->_nextState;

      if (!nextState) {
        goto LABEL_22;
      }
      v10 = self->_nextState;
LABEL_15:
      v6 = v10;
      break;
    case 4:
      if (self->_nextState) {
        goto LABEL_22;
      }
      v11 = [ARCoachingFrame alloc];
      v12 = [(ARCoachingState *)self view];
      v13 = [v12 session];
      v14 = [v13 currentFrame];
      v8 = [(ARCoachingFrame *)v11 initWithFrame:v14];

      heuristics = self->_heuristics;
      v16 = [(ARCoachingState *)self view];
      v17 = [v16 coachingSessionCache];
      [(ARCoachingHeuristicCollection *)heuristics updateWithFrame:v8 cache:v17];

      if ([(ARCoachingHeuristic *)self->_heuristics satisfied])
      {
        v18 = [(ARCoachingState *)self view];
        int v19 = [v18 activatesAutomatically];

        if (v19)
        {
          v20 = ARCoachingStateDeactivating;
        }
        else
        {
          v26 = [(ARCoachingState *)self view];
          int v27 = [v26 isRelocalizing];

          if (v27) {
            v20 = ARCoachingStateRelocalizing;
          }
          else {
            v20 = ARCoachingStateActivated;
          }
        }
        id v28 = [v20 alloc];
        v29 = [(ARCoachingState *)self view];
        v30 = (ARCoachingState *)[v28 initWithView:v29];
        v31 = self->_nextState;
        self->_nextState = v30;
      }
LABEL_21:

      goto LABEL_22;
    case 5:
      objc_super v7 = ARCoachingStateRelocalizing;
LABEL_13:
      id v21 = [v7 alloc];
      v22 = [(ARCoachingState *)self view];
      v23 = (ARCoachingState *)[v21 initWithView:v22];
      v24 = self->_nextState;
      self->_nextState = v23;

      goto LABEL_22;
    case 6:
      v10 = self->_nextState;
      if (v10) {
        goto LABEL_15;
      }
      goto LABEL_22;
    case 7:
      v25 = self->_nextState;
      self->_nextState = 0;

      goto LABEL_22;
    default:
LABEL_22:
      v6 = 0;
      break;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristics, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

@end