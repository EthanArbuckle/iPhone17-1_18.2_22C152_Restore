@interface GAXVerificationEventObject
- (NSString)eventName;
- (double)delay;
- (id)completion;
- (unint64_t)event;
- (void)setCompletion:(id)a3;
- (void)setDelay:(double)a3;
- (void)setEvent:(unint64_t)a3;
@end

@implementation GAXVerificationEventObject

- (NSString)eventName
{
  v3 = [(GAXVerificationEventObject *)self event];
  switch((unint64_t)v3)
  {
    case 0uLL:
      [(GAXVerificationEventObject *)self event];
      _AXAssert();
      v3 = 0;
      break;
    case 1uLL:
      v4 = GAXVerificationEventRelaunchAppForGuidedAccessInitObject;
      goto LABEL_22;
    case 2uLL:
      v4 = GAXVerificationEventRelaunchAppForSingleAppModeInitObject;
      goto LABEL_22;
    case 3uLL:
      v4 = GAXVerificationEventWaitForSpringboardToRelaunchObject;
      goto LABEL_22;
    case 4uLL:
      v4 = GAXVerificationEventSpringboardDiedForGuidedAccessObject;
      goto LABEL_22;
    case 5uLL:
      v4 = GAXVerificationEventSpringboardDiedForSingleAppModeObject;
      goto LABEL_22;
    case 6uLL:
      v4 = GAXVerificationEventScreenWasUnlockedObject;
      goto LABEL_22;
    case 7uLL:
      v4 = GAXVerificationEventAppWentInvalidObject;
      goto LABEL_22;
    case 8uLL:
      v4 = GAXVerificationEventNonRelaunchingAppWentInvalidObject;
      goto LABEL_22;
    case 9uLL:
      v4 = GAXVerificationEventPurpleBuddyDidFinishObject;
      goto LABEL_22;
    case 0xAuLL:
      v4 = GAXVerificationEventDidEnableSystemAppAccessObject;
      goto LABEL_22;
    case 0xBuLL:
      v4 = GAXVerificationEventPreBoardDidFinishObject;
      goto LABEL_22;
    case 0xCuLL:
      v4 = GAXVerificationEventCheckerBoardDidFinishObject;
      goto LABEL_22;
    case 0xDuLL:
      v4 = GAXVerificationEventDidEnterSingleAppModeObject;
      goto LABEL_22;
    case 0xEuLL:
      v4 = GAXVerificationEventSingleAppModeAppDidChangeObject;
      goto LABEL_22;
    case 0xFuLL:
      v4 = GAXVerificationEventSubstantialTransitionDidOccurObject;
      goto LABEL_22;
    case 0x10uLL:
      v4 = GAXVerificationEventDidKillNonSingleAppModeAppObject;
      goto LABEL_22;
    case 0x11uLL:
      v4 = GAXVerificationEventLostModeDidChangeObject;
      goto LABEL_22;
    case 0x12uLL:
      v4 = GAXVerificationEventApplicationWasInstalledObject;
      goto LABEL_22;
    case 0x13uLL:
      v4 = GAXVerificationEventDidStartAutonomousSingleAppModeObject;
LABEL_22:
      v3 = v4;
      break;
    default:
      break;
  }

  return (NSString *)v3;
}

- (unint64_t)event
{
  return self->_event;
}

- (void)setEvent:(unint64_t)a3
{
  self->_event = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end