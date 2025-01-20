@interface ASVGestureFeedbackGenerator
- (ASVFeedbackGenerator)snapAwayFromScaleFeedbackGenerator;
- (ASVFeedbackGenerator)snapToScaleFeedbackGenerator;
- (ASVGestureFeedbackGenerator)initWithSnapToGenerator:(id)a3 snapAwayFromGenerator:(id)a4;
- (void)prepare;
- (void)setSnapAwayFromScaleFeedbackGenerator:(id)a3;
- (void)setSnapToScaleFeedbackGenerator:(id)a3;
@end

@implementation ASVGestureFeedbackGenerator

- (ASVGestureFeedbackGenerator)initWithSnapToGenerator:(id)a3 snapAwayFromGenerator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASVGestureFeedbackGenerator;
  v9 = [(ASVGestureFeedbackGenerator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_snapToScaleFeedbackGenerator, a3);
    objc_storeStrong((id *)&v10->_snapAwayFromScaleFeedbackGenerator, a4);
  }

  return v10;
}

- (void)prepare
{
  v3 = [(ASVGestureFeedbackGenerator *)self snapToScaleFeedbackGenerator];
  [v3 prepare];

  id v4 = [(ASVGestureFeedbackGenerator *)self snapAwayFromScaleFeedbackGenerator];
  [v4 prepare];
}

- (ASVFeedbackGenerator)snapToScaleFeedbackGenerator
{
  return self->_snapToScaleFeedbackGenerator;
}

- (void)setSnapToScaleFeedbackGenerator:(id)a3
{
}

- (ASVFeedbackGenerator)snapAwayFromScaleFeedbackGenerator
{
  return self->_snapAwayFromScaleFeedbackGenerator;
}

- (void)setSnapAwayFromScaleFeedbackGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapAwayFromScaleFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_snapToScaleFeedbackGenerator, 0);
}

@end