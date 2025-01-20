@interface SVSCardContainerScrollView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (SVSCardContainerScrollView)initWithGestureRecognizerEvaluator:(id)a3;
- (id)recognizerEvaluator;
- (void)setRecognizerEvaluator:(id)a3;
@end

@implementation SVSCardContainerScrollView

- (void).cxx_destruct
{
}

- (void)setRecognizerEvaluator:(id)a3
{
}

- (id)recognizerEvaluator
{
  return self->_recognizerEvaluator;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(SVSCardContainerScrollView *)self panGestureRecognizer];

  if (v5 == v4)
  {
    v7 = [(SVSCardContainerScrollView *)self recognizerEvaluator];
    unsigned __int8 v6 = ((uint64_t (**)(void, id))v7)[2](v7, v4);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SVSCardContainerScrollView;
    unsigned __int8 v6 = [(SVSCardContainerScrollView *)&v9 gestureRecognizerShouldBegin:v4];
  }

  return v6;
}

- (SVSCardContainerScrollView)initWithGestureRecognizerEvaluator:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVSCardContainerScrollView;
  id v5 = [(SVSCardContainerScrollView *)&v9 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id recognizerEvaluator = v5->_recognizerEvaluator;
    v5->_id recognizerEvaluator = v6;
  }
  return v5;
}

@end