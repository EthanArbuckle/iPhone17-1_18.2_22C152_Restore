@interface SGRTCLoggingGuardedData
@end

@implementation SGRTCLoggingGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggedInteractionsSummary, 0);
  objc_storeStrong((id *)&self->_loggedInteractions, 0);
  objc_storeStrong((id *)&self->_loggedExtractions, 0);
}

@end