@interface PBAHIDEventController
+ (id)sharedController;
- (BSInvalidatable)eventDispatchAssertion;
- (NSArray)dispatchingRules;
- (PBAHIDEventController)init;
- (void)setDispatchingRules:(id)a3;
- (void)setEventDispatchAssertion:(id)a3;
- (void)startReceivingEvents;
- (void)stopReceivingEvents;
@end

@implementation PBAHIDEventController

+ (id)sharedController
{
  if (qword_100026148 != -1) {
    dispatch_once(&qword_100026148, &stru_10001C648);
  }
  v2 = (void *)qword_100026140;

  return v2;
}

- (PBAHIDEventController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PBAHIDEventController;
  v2 = [(PBAHIDEventController *)&v11 init];
  if (v2)
  {
    v3 = +[BKSHIDEventDispatchingTarget systemTarget];
    v4 = +[BKSMutableHIDEventDiscreteDispatchingPredicate defaultSystemPredicate];
    [v4 setSenderDescriptors:0];
    v5 = +[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:v4 toTarget:v3];
    v6 = +[BKSMutableHIDEventDiscreteDispatchingPredicate defaultFocusPredicate];
    [v6 setSenderDescriptors:0];
    v7 = +[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:v6 toTarget:v3];
    v12[0] = v5;
    v12[1] = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:v12 count:2];
    dispatchingRules = v2->_dispatchingRules;
    v2->_dispatchingRules = (NSArray *)v8;
  }
  return v2;
}

- (void)startReceivingEvents
{
  if (self->_eventDispatchAssertion)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PBAHIDEventController.m" lineNumber:63 description:@"%s called when we're already receiving events" -[PBAHIDEventController startReceivingEvents]];
  }
  id v7 = +[BKSHIDEventDeliveryManager sharedInstance];
  v3 = [v7 dispatchDiscreteEventsForReason:@"PreBoard in the house" withRules:self->_dispatchingRules];
  eventDispatchAssertion = self->_eventDispatchAssertion;
  self->_eventDispatchAssertion = v3;
}

- (void)stopReceivingEvents
{
  [(BSInvalidatable *)self->_eventDispatchAssertion invalidate];
  eventDispatchAssertion = self->_eventDispatchAssertion;
  self->_eventDispatchAssertion = 0;
}

- (BSInvalidatable)eventDispatchAssertion
{
  return self->_eventDispatchAssertion;
}

- (void)setEventDispatchAssertion:(id)a3
{
}

- (NSArray)dispatchingRules
{
  return self->_dispatchingRules;
}

- (void)setDispatchingRules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchingRules, 0);

  objc_storeStrong((id *)&self->_eventDispatchAssertion, 0);
}

@end