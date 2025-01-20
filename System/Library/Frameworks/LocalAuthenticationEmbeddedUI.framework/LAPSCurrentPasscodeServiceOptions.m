@interface LAPSCurrentPasscodeServiceOptions
- (BOOL)skipSuccessNotification;
- (LAPSCurrentPasscodeServiceOptions)init;
- (void)setSkipSuccessNotification:(BOOL)a3;
@end

@implementation LAPSCurrentPasscodeServiceOptions

- (LAPSCurrentPasscodeServiceOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)LAPSCurrentPasscodeServiceOptions;
  result = [(LAPSCurrentPasscodeServiceOptions *)&v3 init];
  if (result) {
    result->_skipSuccessNotification = 1;
  }
  return result;
}

- (BOOL)skipSuccessNotification
{
  return self->_skipSuccessNotification;
}

- (void)setSkipSuccessNotification:(BOOL)a3
{
  self->_skipSuccessNotification = a3;
}

@end