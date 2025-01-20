@interface ARCoachingStateRelocalizing
- (ARCoachingStateRelocalizing)initWithView:(id)a3;
- (id)doAction:(int64_t)a3;
- (int64_t)requirements;
- (void)enter;
@end

@implementation ARCoachingStateRelocalizing

- (ARCoachingStateRelocalizing)initWithView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ARCoachingStateRelocalizing;
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
  return 16;
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
  objc_super v7 = [[ARCoachingHeuristicDelay alloc] initWithDuration:1.0];
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

      goto LABEL_22;
    case 1:
      objc_super v7 = ARCoachingStateActivated;
      goto LABEL_15;
    case 2:
      objc_super v7 = ARCoachingStateDeactivating;
      goto LABEL_15;
    case 3:
      v8 = [(ARCoachingState *)self view];
      if ([(ARCoachingFrame *)v8 isUIAnimating]) {
        goto LABEL_20;
      }
      nextState = self->_nextState;

      if (!nextState) {
        goto LABEL_21;
      }
      v10 = self->_nextState;
LABEL_13:
      v6 = v10;
      goto LABEL_22;
    case 4:
      if (self->_nextState) {
        goto LABEL_21;
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

      v18 = [(ARCoachingState *)self view];
      LODWORD(v16) = [v18 checkDeactivationHeuristics];

      if (v16)
      {
        v19 = ARCoachingStateDeactivating;
LABEL_19:
        id v27 = [v19 alloc];
        v28 = [(ARCoachingState *)self view];
        v29 = (ARCoachingState *)[v27 initWithView:v28];
        v30 = self->_nextState;
        self->_nextState = v29;

        goto LABEL_20;
      }
      if ([(ARCoachingHeuristic *)self->_heuristics satisfied])
      {
        v25 = [(ARCoachingState *)self view];
        char v26 = [v25 isRelocalizing];

        if ((v26 & 1) == 0)
        {
          v19 = ARCoachingStateActivated;
          goto LABEL_19;
        }
      }
LABEL_20:

LABEL_21:
      v6 = 0;
LABEL_22:
      return v6;
    case 5:
      v20 = self->_nextState;
      self->_nextState = 0;

      goto LABEL_21;
    case 6:
      v10 = self->_nextState;
      if (v10) {
        goto LABEL_13;
      }
      goto LABEL_21;
    case 7:
      objc_super v7 = ARCoachingStateSessionFailed;
LABEL_15:
      id v21 = [v7 alloc];
      v22 = [(ARCoachingState *)self view];
      v23 = (ARCoachingState *)[v21 initWithView:v22];
      v24 = self->_nextState;
      self->_nextState = v23;

      goto LABEL_21;
    default:
      goto LABEL_21;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heuristics, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

@end