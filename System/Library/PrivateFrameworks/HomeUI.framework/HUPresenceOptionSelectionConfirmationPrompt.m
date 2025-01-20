@interface HUPresenceOptionSelectionConfirmationPrompt
- (BOOL)resetLocationToHomeOnConfirmation;
- (HUPresenceOptionSelectionConfirmationPrompt)init;
- (HUPresenceOptionSelectionConfirmationPrompt)initWithAlertTitle:(id)a3 alertBody:(id)a4 resetLocationToHomeOnConfirmation:(BOOL)a5;
- (NSString)alertBody;
- (NSString)alertTitle;
@end

@implementation HUPresenceOptionSelectionConfirmationPrompt

- (HUPresenceOptionSelectionConfirmationPrompt)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithAlertTitle_alertBody_resetLocationToHomeOnConfirmation_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPresenceUserPickerItemModule.m", 585, @"%s is unavailable; use %@ instead",
    "-[HUPresenceOptionSelectionConfirmationPrompt init]",
    v5);

  return 0;
}

- (HUPresenceOptionSelectionConfirmationPrompt)initWithAlertTitle:(id)a3 alertBody:(id)a4 resetLocationToHomeOnConfirmation:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUPresenceOptionSelectionConfirmationPrompt;
  v11 = [(HUPresenceOptionSelectionConfirmationPrompt *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_alertTitle, a3);
    objc_storeStrong((id *)&v12->_alertBody, a4);
    v12->_resetLocationToHomeOnConfirmation = a5;
  }

  return v12;
}

- (NSString)alertTitle
{
  return self->_alertTitle;
}

- (NSString)alertBody
{
  return self->_alertBody;
}

- (BOOL)resetLocationToHomeOnConfirmation
{
  return self->_resetLocationToHomeOnConfirmation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertBody, 0);

  objc_storeStrong((id *)&self->_alertTitle, 0);
}

@end