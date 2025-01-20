@interface HKOrganDonationFlowErrorAnalyticEvent
- (BOOL)isEventSubmissionIHAGated;
- (HKOrganDonationFlowErrorAnalyticEvent)initWithErrorType:(int)a3;
- (NSString)eventName;
- (id)createEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HKOrganDonationFlowErrorAnalyticEvent

- (HKOrganDonationFlowErrorAnalyticEvent)initWithErrorType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKOrganDonationFlowErrorAnalyticEvent;
  result = [(HKOrganDonationFlowErrorAnalyticEvent *)&v5 init];
  if (result) {
    result->_errorType = a3;
  }
  return result;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.HealthApp.OrganDonation.Error.Event";
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (id)createEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = HKOrganDonationErrorTypeAsString(self->_errorType);
  [v5 setObject:v6 forKeyedSubscript:@"errorType"];

  return v5;
}

@end