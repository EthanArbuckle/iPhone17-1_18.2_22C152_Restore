@interface PassbookUIServiceApplication
+ (BOOL)shouldBackgroundMainThreadOnSuspendedLaunch;
- (NSNumber)statusBarHeightOverride;
- (double)statusBarHeight;
- (void)setStatusBarHeightOverride:(id)a3;
@end

@implementation PassbookUIServiceApplication

- (double)statusBarHeight
{
  if (self->_statusBarHeightOverride)
  {
    [(NSNumber *)self->_statusBarHeightOverride floatValue];
    return v2;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)PassbookUIServiceApplication;
    [(PassbookUIServiceApplication *)&v4 statusBarHeight];
  }
  return result;
}

+ (BOOL)shouldBackgroundMainThreadOnSuspendedLaunch
{
  return 0;
}

- (NSNumber)statusBarHeightOverride
{
  return self->_statusBarHeightOverride;
}

- (void)setStatusBarHeightOverride:(id)a3
{
}

- (void).cxx_destruct
{
}

@end