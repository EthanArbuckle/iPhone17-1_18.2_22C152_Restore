@interface HKOrganDonationFlowImpressionAnalyticEvent
- (BOOL)isEventSubmissionIHAGated;
- (HKOrganDonationFlowImpressionAnalyticEvent)initWithImpressionEvent:(int)a3;
- (NSString)eventName;
- (id)createEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HKOrganDonationFlowImpressionAnalyticEvent

- (HKOrganDonationFlowImpressionAnalyticEvent)initWithImpressionEvent:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKOrganDonationFlowImpressionAnalyticEvent;
  result = [(HKOrganDonationFlowImpressionAnalyticEvent *)&v5 init];
  if (result) {
    result->_impressionEvent = a3;
  }
  return result;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.HealthApp.OrganDonation.FlowImpression.Event";
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (id)createEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = HKOrganDonationFlowImpressionEventAsString(self->_impressionEvent);
  [v5 setObject:v6 forKeyedSubscript:@"sourceOfFlowImpression"];

  return v5;
}

@end