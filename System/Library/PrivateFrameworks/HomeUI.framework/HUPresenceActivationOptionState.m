@interface HUPresenceActivationOptionState
- (BOOL)isExpanded;
- (BOOL)isSelected;
- (HFTransformItemProvider)userOptionItemProvider;
- (HUPresenceActivationOptionItem)activationOptionItem;
- (HUPresenceActivationOptionState)init;
- (HUPresenceActivationOptionState)initWithUserOptionItemProvider:(id)a3 activationOptionItem:(id)a4;
- (unint64_t)activationGranularity;
- (void)setExpanded:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation HUPresenceActivationOptionState

- (HUPresenceActivationOptionState)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithUserOptionItemProvider_activationOptionItem_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPresenceUserPickerItemModule.m", 533, @"%s is unavailable; use %@ instead",
    "-[HUPresenceActivationOptionState init]",
    v5);

  return 0;
}

- (HUPresenceActivationOptionState)initWithUserOptionItemProvider:(id)a3 activationOptionItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUPresenceActivationOptionState;
  v9 = [(HUPresenceActivationOptionState *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userOptionItemProvider, a3);
    objc_storeStrong((id *)&v10->_activationOptionItem, a4);
  }

  return v10;
}

- (unint64_t)activationGranularity
{
  v2 = [(HUPresenceActivationOptionState *)self activationOptionItem];
  unint64_t v3 = [v2 activationGranularity];

  return v3;
}

- (BOOL)isSelected
{
  v2 = [(HUPresenceActivationOptionState *)self activationOptionItem];
  char v3 = [v2 isSelected];

  return v3;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUPresenceActivationOptionState *)self activationOptionItem];
  [v4 setSelected:v3];
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (HFTransformItemProvider)userOptionItemProvider
{
  return self->_userOptionItemProvider;
}

- (HUPresenceActivationOptionItem)activationOptionItem
{
  return self->_activationOptionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationOptionItem, 0);

  objc_storeStrong((id *)&self->_userOptionItemProvider, 0);
}

@end