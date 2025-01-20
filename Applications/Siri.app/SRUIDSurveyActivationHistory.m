@interface SRUIDSurveyActivationHistory
- (SRUIDSurveyActivationHistory)initWithCountOfIntended:(unint64_t)a3 countOfUnintended:(unint64_t)a4 countOfUnintendedActivationSinceLastIntended:(unint64_t)a5 days:(unint64_t)a6;
- (unint64_t)countOfIntendedActivations;
- (unint64_t)countOfTotalActivations;
- (unint64_t)countOfUnintendedActivations;
- (unint64_t)countOfUnintendedActivationsSinceLastIntendedActivation;
- (unint64_t)days;
@end

@implementation SRUIDSurveyActivationHistory

- (SRUIDSurveyActivationHistory)initWithCountOfIntended:(unint64_t)a3 countOfUnintended:(unint64_t)a4 countOfUnintendedActivationSinceLastIntended:(unint64_t)a5 days:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)SRUIDSurveyActivationHistory;
  result = [(SRUIDSurveyActivationHistory *)&v11 init];
  if (result)
  {
    result->_countOfUnintendedActivations = a4;
    result->_countOfIntendedActivations = a3;
    result->_countOfTotalActivations = a4 + a3;
    result->_countOfUnintendedActivationsSinceLastIntendedActivation = a5;
    result->_days = a6;
  }
  return result;
}

- (unint64_t)countOfUnintendedActivations
{
  return self->_countOfUnintendedActivations;
}

- (unint64_t)countOfIntendedActivations
{
  return self->_countOfIntendedActivations;
}

- (unint64_t)countOfTotalActivations
{
  return self->_countOfTotalActivations;
}

- (unint64_t)countOfUnintendedActivationsSinceLastIntendedActivation
{
  return self->_countOfUnintendedActivationsSinceLastIntendedActivation;
}

- (unint64_t)days
{
  return self->_days;
}

@end