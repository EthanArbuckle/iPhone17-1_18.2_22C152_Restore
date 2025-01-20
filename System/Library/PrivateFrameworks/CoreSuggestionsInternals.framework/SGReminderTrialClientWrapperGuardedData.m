@interface SGReminderTrialClientWrapperGuardedData
@end

@implementation SGReminderTrialClientWrapperGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderOutputMapping, 0);
  objc_storeStrong((id *)&self->_reminderInputMapping, 0);
  objc_storeStrong((id *)&self->_reminderEnrichments, 0);
  objc_storeStrong((id *)&self->_reminderOverrides, 0);
  objc_storeStrong((id *)&self->_messagesBannerLimit, 0);
}

@end