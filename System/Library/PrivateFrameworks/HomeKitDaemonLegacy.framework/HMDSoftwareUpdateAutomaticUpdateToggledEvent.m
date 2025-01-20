@interface HMDSoftwareUpdateAutomaticUpdateToggledEvent
+ (id)eventWithAutomaticUpdateEnabled:(BOOL)a3;
- (BOOL)isEnabled;
- (void)setEnabled:(BOOL)a3;
@end

@implementation HMDSoftwareUpdateAutomaticUpdateToggledEvent

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

+ (id)eventWithAutomaticUpdateEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = objc_alloc_init(HMDSoftwareUpdateAutomaticUpdateToggledEvent);
  [(HMDSoftwareUpdateAutomaticUpdateToggledEvent *)v4 setEnabled:v3];
  return v4;
}

@end