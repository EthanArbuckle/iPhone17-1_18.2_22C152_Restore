@interface SecureClock
@end

@implementation SecureClock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastServerDate, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end