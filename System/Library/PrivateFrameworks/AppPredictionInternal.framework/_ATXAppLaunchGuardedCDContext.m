@interface _ATXAppLaunchGuardedCDContext
@end

@implementation _ATXAppLaunchGuardedCDContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end