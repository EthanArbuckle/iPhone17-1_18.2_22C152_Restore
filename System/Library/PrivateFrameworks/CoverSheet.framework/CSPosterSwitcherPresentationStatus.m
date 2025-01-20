@interface CSPosterSwitcherPresentationStatus
- (BOOL)shouldProvideNotReadyFeedback;
- (CSPosterSwitcherPresentationStatus)initWithState:(unint64_t)a3 notReadyReason:(unint64_t)a4;
- (unint64_t)notReadyReason;
- (unint64_t)state;
@end

@implementation CSPosterSwitcherPresentationStatus

- (CSPosterSwitcherPresentationStatus)initWithState:(unint64_t)a3 notReadyReason:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CSPosterSwitcherPresentationStatus;
  result = [(CSPosterSwitcherPresentationStatus *)&v7 init];
  if (result)
  {
    result->_state = a3;
    result->_notReadyReason = a4;
  }
  return result;
}

- (BOOL)shouldProvideNotReadyFeedback
{
  return !self->_state && ((self->_notReadyReason - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)notReadyReason
{
  return self->_notReadyReason;
}

@end