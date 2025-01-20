@interface NTK_PUSelectionFeedbackGenerator
- (NTK_PUSelectionFeedbackGenerator)init;
- (UISelectionFeedbackGenerator)feedbackGenerator;
- (void)performFeedback;
- (void)prepareFeedback;
@end

@implementation NTK_PUSelectionFeedbackGenerator

- (NTK_PUSelectionFeedbackGenerator)init
{
  v9.receiver = self;
  v9.super_class = (Class)NTK_PUSelectionFeedbackGenerator;
  v2 = [(NTK_PUSelectionFeedbackGenerator *)&v9 init];
  if (v2)
  {
    v3 = +[_UISelectionFeedbackGeneratorConfiguration defaultConfiguration];
    v4 = [v3 tweakedConfigurationForCaller:v2 usage:@"photosEditAdjustmentSelection"];

    v5 = +[_UIDiscreteFeedback feedbackWithDictionaryRepresentation:&off_4B9F8];
    [v4 setFeedback:v5];

    v6 = (UISelectionFeedbackGenerator *)[objc_alloc((Class)UISelectionFeedbackGenerator) initWithConfiguration:v4];
    feedbackGenerator = v2->_feedbackGenerator;
    v2->_feedbackGenerator = v6;

    [(UISelectionFeedbackGenerator *)v2->_feedbackGenerator _setOutputMode:5];
  }
  return v2;
}

- (void)prepareFeedback
{
  id v2 = [(NTK_PUSelectionFeedbackGenerator *)self feedbackGenerator];
  [v2 prepare];
}

- (void)performFeedback
{
  id v2 = [(NTK_PUSelectionFeedbackGenerator *)self feedbackGenerator];
  [v2 selectionChanged];
}

- (UISelectionFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void).cxx_destruct
{
}

@end