@interface HUPresenceUserOptionState
- (BOOL)isLocationAvailable;
- (BOOL)isSelected;
- (HUPresenceUserOptionState)init;
- (HUPresenceUserOptionState)initWithActivationGranularity:(unint64_t)a3 selected:(BOOL)a4 locationAvailable:(BOOL)a5;
- (unint64_t)activationGranularity;
@end

@implementation HUPresenceUserOptionState

- (HUPresenceUserOptionState)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithActivationGranularity_selected_locationAvailable_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPresenceUserPickerItemModule.m", 566, @"%s is unavailable; use %@ instead",
    "-[HUPresenceUserOptionState init]",
    v5);

  return 0;
}

- (HUPresenceUserOptionState)initWithActivationGranularity:(unint64_t)a3 selected:(BOOL)a4 locationAvailable:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HUPresenceUserOptionState;
  result = [(HUPresenceUserOptionState *)&v9 init];
  if (result)
  {
    result->_activationGranularity = a3;
    result->_selected = a4;
    result->_locationAvailable = a5;
  }
  return result;
}

- (unint64_t)activationGranularity
{
  return self->_activationGranularity;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isLocationAvailable
{
  return self->_locationAvailable;
}

@end