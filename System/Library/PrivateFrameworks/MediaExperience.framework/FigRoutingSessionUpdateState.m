@interface FigRoutingSessionUpdateState
- (ARPPredictionContext)predictionContext;
- (FigRoutingSessionUpdateState)initWithNewSession:(OpaqueFigRoutingSession *)a3;
- (OpaqueFigRoutingSession)newSession;
- (void)dealloc;
- (void)setNewSession:(OpaqueFigRoutingSession *)a3;
- (void)setPredictionContext:(id)a3;
@end

@implementation FigRoutingSessionUpdateState

- (FigRoutingSessionUpdateState)initWithNewSession:(OpaqueFigRoutingSession *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigRoutingSessionUpdateState;
  v4 = [(FigRoutingSessionUpdateState *)&v7 init];
  if (v4)
  {
    if (a3) {
      v5 = (OpaqueFigRoutingSession *)CFRetain(a3);
    }
    else {
      v5 = 0;
    }
    v4->_newSession = v5;
  }
  return v4;
}

- (void)dealloc
{
  newSession = self->_newSession;
  if (newSession) {
    CFRelease(newSession);
  }

  v4.receiver = self;
  v4.super_class = (Class)FigRoutingSessionUpdateState;
  [(FigRoutingSessionUpdateState *)&v4 dealloc];
}

- (OpaqueFigRoutingSession)newSession
{
  return self->_newSession;
}

- (void)setNewSession:(OpaqueFigRoutingSession *)a3
{
}

- (ARPPredictionContext)predictionContext
{
  return self->_predictionContext;
}

- (void)setPredictionContext:(id)a3
{
}

@end