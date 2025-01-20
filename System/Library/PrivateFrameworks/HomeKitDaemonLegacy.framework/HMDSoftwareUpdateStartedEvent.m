@interface HMDSoftwareUpdateStartedEvent
+ (id)eventUpdateStartedWithAutomaticUpdateEnabled:(BOOL)a3;
- (BOOL)isAutomaticUpdateEnabled;
- (void)setAutomaticUpdateEnabled:(BOOL)a3;
@end

@implementation HMDSoftwareUpdateStartedEvent

- (void)setAutomaticUpdateEnabled:(BOOL)a3
{
  self->_automaticUpdateEnabled = a3;
}

- (BOOL)isAutomaticUpdateEnabled
{
  return self->_automaticUpdateEnabled;
}

+ (id)eventUpdateStartedWithAutomaticUpdateEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = objc_alloc_init(HMDSoftwareUpdateStartedEvent);
  [(HMDSoftwareUpdateStartedEvent *)v4 setAutomaticUpdateEnabled:v3];
  return v4;
}

@end