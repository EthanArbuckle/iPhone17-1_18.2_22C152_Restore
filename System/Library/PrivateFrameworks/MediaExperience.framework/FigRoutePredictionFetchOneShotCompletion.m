@interface FigRoutePredictionFetchOneShotCompletion
- (FigRoutePredictionFetchOneShotCompletion)init;
- (FigRoutePredictionFetchOneShotCompletion)initWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)invokeWithRoutePredictions:(id)a3 predictionContext:(id)a4;
@end

@implementation FigRoutePredictionFetchOneShotCompletion

- (FigRoutePredictionFetchOneShotCompletion)init
{
  return [(FigRoutePredictionFetchOneShotCompletion *)self initWithCompletionHandler:0];
}

- (FigRoutePredictionFetchOneShotCompletion)initWithCompletionHandler:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FigRoutePredictionFetchOneShotCompletion;
  v4 = [(FigRoutePredictionFetchOneShotCompletion *)&v8 init];
  if (v4 && (uint64_t v5 = [a3 copy], (v4->_completionHandler = (id)v5) != 0)) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigRoutePredictionFetchOneShotCompletion;
  [(FigRoutePredictionFetchOneShotCompletion *)&v3 dealloc];
}

- (void)invokeWithRoutePredictions:(id)a3 predictionContext:(id)a4
{
  completionHandler = (void (**)(id, id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a3, a4);

    self->_completionHandler = 0;
  }
}

@end