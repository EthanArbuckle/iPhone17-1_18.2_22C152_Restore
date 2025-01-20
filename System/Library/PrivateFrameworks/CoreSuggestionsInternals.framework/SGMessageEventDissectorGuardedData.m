@interface SGMessageEventDissectorGuardedData
@end

@implementation SGMessageEventDissectorGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventClassifierModel, 0);
  objc_storeStrong((id *)&self->_currentAllowedMessageCount, 0);
  objc_storeStrong((id *)&self->_lastWindowStartTime, 0);
}

@end