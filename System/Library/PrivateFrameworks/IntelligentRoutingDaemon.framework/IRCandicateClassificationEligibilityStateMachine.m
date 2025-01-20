@interface IRCandicateClassificationEligibilityStateMachine
+ (int64_t)_classificationFromEligibility:(int64_t)a3;
- (int64_t)eligibilityState;
- (unint64_t)downRankCounter;
- (unint64_t)downRankDismissAndRejectRankCounter;
- (unint64_t)upRankCounter;
- (void)_downRankDismissAndRejectRankCounterIncrementAndTransitionToState:(int64_t)a3 ifThresholdCrossed:(unint64_t)a4;
- (void)_downRankDismissAndRejectRankCounterReset;
- (void)_downrankCounterIncrementAndTransitionToState:(int64_t)a3 ifThresholdCrossed:(unint64_t)a4;
- (void)_downrankCounterReset;
- (void)_transitionToState:(int64_t)a3;
- (void)_uprankCounterIncrementAndTransitionToState:(int64_t)a3 ifThresholdCrossed:(unint64_t)a4;
- (void)_uprankCounterReset;
- (void)runWithEventType:(int64_t)a3 smSettings:(id)a4;
- (void)setDownRankCounter:(unint64_t)a3;
- (void)setDownRankDismissAndRejectRankCounter:(unint64_t)a3;
- (void)setEligibilityState:(int64_t)a3;
- (void)setUpRankCounter:(unint64_t)a3;
@end

@implementation IRCandicateClassificationEligibilityStateMachine

- (void)runWithEventType:(int64_t)a3 smSettings:(id)a4
{
  id v12 = a4;
  int64_t v6 = [(IRCandicateClassificationEligibilityStateMachine *)self eligibilityState];
  switch(v6)
  {
    case 2:
      if ((unint64_t)(a3 - 2) >= 2)
      {
        if (a3 == 4)
        {
          [(IRCandicateClassificationEligibilityStateMachine *)self _downrankCounterReset];
          break;
        }
        if (a3 != 5) {
          break;
        }
      }
      v7 = [v12 downrankToOneTapThr];
      -[IRCandicateClassificationEligibilityStateMachine _downrankCounterIncrementAndTransitionToState:ifThresholdCrossed:](self, "_downrankCounterIncrementAndTransitionToState:ifThresholdCrossed:", 1, [v7 unsignedIntValue]);
LABEL_18:

      break;
    case 1:
      switch(a3)
      {
        case 1:
          [(IRCandicateClassificationEligibilityStateMachine *)self _downrankCounterReset];
          [(IRCandicateClassificationEligibilityStateMachine *)self _downRankDismissAndRejectRankCounterReset];
          goto LABEL_19;
        case 2:
          v8 = [v12 downrankToNoneThr];
          -[IRCandicateClassificationEligibilityStateMachine _downrankCounterIncrementAndTransitionToState:ifThresholdCrossed:](self, "_downrankCounterIncrementAndTransitionToState:ifThresholdCrossed:", 0, [v8 unsignedIntValue]);

          goto LABEL_14;
        case 4:
          v7 = [v12 uprankToAutorouteThr];
          uint64_t v9 = [v7 unsignedIntValue];
          v10 = self;
          uint64_t v11 = 2;
LABEL_17:
          [(IRCandicateClassificationEligibilityStateMachine *)v10 _uprankCounterIncrementAndTransitionToState:v11 ifThresholdCrossed:v9];
          goto LABEL_18;
        case 5:
LABEL_14:
          v7 = [v12 downrankToNoneWithIgnoringThr];
          -[IRCandicateClassificationEligibilityStateMachine _downRankDismissAndRejectRankCounterIncrementAndTransitionToState:ifThresholdCrossed:](self, "_downRankDismissAndRejectRankCounterIncrementAndTransitionToState:ifThresholdCrossed:", 0, [v7 unsignedIntValue]);
          goto LABEL_18;
        default:
          goto LABEL_19;
      }
    case 0:
      switch(a3)
      {
        case 1:
          v7 = [v12 upRankToOneTapThr];
          uint64_t v9 = [v7 unsignedIntValue];
          v10 = self;
          uint64_t v11 = 1;
          goto LABEL_17;
        case 2:
        case 3:
          [(IRCandicateClassificationEligibilityStateMachine *)self _uprankCounterReset];
          goto LABEL_19;
        case 6:
          if ([v12 useBrokeredScanForMain]) {
            goto LABEL_25;
          }
          goto LABEL_19;
        case 7:
          if ([v12 useBrokeredScanForSecondary]) {
LABEL_25:
          }
            [(IRCandicateClassificationEligibilityStateMachine *)self _transitionToState:1];
          break;
        default:
          goto LABEL_19;
      }
      break;
  }
LABEL_19:
}

- (void)_transitionToState:(int64_t)a3
{
  [(IRCandicateClassificationEligibilityStateMachine *)self _downrankCounterReset];
  [(IRCandicateClassificationEligibilityStateMachine *)self _uprankCounterReset];
  [(IRCandicateClassificationEligibilityStateMachine *)self _downRankDismissAndRejectRankCounterReset];

  [(IRCandicateClassificationEligibilityStateMachine *)self setEligibilityState:a3];
}

- (void)_uprankCounterIncrementAndTransitionToState:(int64_t)a3 ifThresholdCrossed:(unint64_t)a4
{
  [(IRCandicateClassificationEligibilityStateMachine *)self setUpRankCounter:[(IRCandicateClassificationEligibilityStateMachine *)self upRankCounter] + 1];
  [(IRCandicateClassificationEligibilityStateMachine *)self _downrankCounterReset];
  [(IRCandicateClassificationEligibilityStateMachine *)self _downRankDismissAndRejectRankCounterReset];
  if ([(IRCandicateClassificationEligibilityStateMachine *)self upRankCounter] >= a4)
  {
    [(IRCandicateClassificationEligibilityStateMachine *)self _transitionToState:a3];
  }
}

- (void)_downrankCounterIncrementAndTransitionToState:(int64_t)a3 ifThresholdCrossed:(unint64_t)a4
{
  [(IRCandicateClassificationEligibilityStateMachine *)self setDownRankCounter:[(IRCandicateClassificationEligibilityStateMachine *)self downRankCounter] + 1];
  [(IRCandicateClassificationEligibilityStateMachine *)self _uprankCounterReset];
  if ([(IRCandicateClassificationEligibilityStateMachine *)self downRankCounter] >= a4)
  {
    [(IRCandicateClassificationEligibilityStateMachine *)self _transitionToState:a3];
  }
}

- (void)_downRankDismissAndRejectRankCounterIncrementAndTransitionToState:(int64_t)a3 ifThresholdCrossed:(unint64_t)a4
{
  [(IRCandicateClassificationEligibilityStateMachine *)self setDownRankDismissAndRejectRankCounter:[(IRCandicateClassificationEligibilityStateMachine *)self downRankDismissAndRejectRankCounter]+ 1];
  [(IRCandicateClassificationEligibilityStateMachine *)self _uprankCounterReset];
  if ([(IRCandicateClassificationEligibilityStateMachine *)self downRankDismissAndRejectRankCounter] >= a4)
  {
    [(IRCandicateClassificationEligibilityStateMachine *)self _transitionToState:a3];
  }
}

- (void)_downrankCounterReset
{
}

- (void)_uprankCounterReset
{
}

- (void)_downRankDismissAndRejectRankCounterReset
{
}

+ (int64_t)_classificationFromEligibility:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    return a3 + 2;
  }
  else {
    return 2;
  }
}

- (int64_t)eligibilityState
{
  return self->_eligibilityState;
}

- (void)setEligibilityState:(int64_t)a3
{
  self->_eligibilityState = a3;
}

- (unint64_t)upRankCounter
{
  return self->_upRankCounter;
}

- (void)setUpRankCounter:(unint64_t)a3
{
  self->_upRankCounter = a3;
}

- (unint64_t)downRankCounter
{
  return self->_downRankCounter;
}

- (void)setDownRankCounter:(unint64_t)a3
{
  self->_downRankCounter = a3;
}

- (unint64_t)downRankDismissAndRejectRankCounter
{
  return self->_downRankDismissAndRejectRankCounter;
}

- (void)setDownRankDismissAndRejectRankCounter:(unint64_t)a3
{
  self->_downRankDismissAndRejectRankCounter = a3;
}

@end