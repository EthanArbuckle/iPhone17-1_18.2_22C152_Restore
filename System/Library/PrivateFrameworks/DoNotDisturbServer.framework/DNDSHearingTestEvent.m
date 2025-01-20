@interface DNDSHearingTestEvent
- (BOOL)isHearingTestActive;
- (DNDSHearingTestEvent)initWithIsHearingTestActive:(BOOL)a3;
@end

@implementation DNDSHearingTestEvent

- (DNDSHearingTestEvent)initWithIsHearingTestActive:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DNDSHearingTestEvent;
  result = [(DNDSHearingTestEvent *)&v5 init];
  if (result) {
    result->_hearingTestActive = a3;
  }
  return result;
}

- (BOOL)isHearingTestActive
{
  return self->_hearingTestActive;
}

@end