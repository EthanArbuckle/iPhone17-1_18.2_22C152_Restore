@interface DMCAlert
- (BOOL)destructive;
- (BOOL)dismissOnLock;
- (BOOL)displayOnLockScreen;
- (NSString)alternateButtonText;
- (NSString)defaultButtonText;
- (NSString)message;
- (NSString)otherButtonText;
- (NSString)summary;
- (NSString)title;
- (double)dismissAfterTimeInterval;
- (id)completionBlock;
- (id)notification;
- (id)notificationParametersOutFlags:(unint64_t *)a3;
- (void)setAlternateButtonText:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDefaultButtonText:(id)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setDismissAfterTimeInterval:(double)a3;
- (void)setDismissOnLock:(BOOL)a3;
- (void)setDisplayOnLockScreen:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setNotification:(id)a3;
- (void)setOtherButtonText:(id)a3;
- (void)setSummary:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation DMCAlert

- (NSString)summary
{
  v3 = NSString;
  v4 = [(DMCAlert *)self title];
  v5 = [(DMCAlert *)self message];
  v6 = [(DMCAlert *)self defaultButtonText];
  v7 = [(DMCAlert *)self alternateButtonText];
  v8 = [(DMCAlert *)self otherButtonText];
  v9 = [v3 stringWithFormat:@"%@ - %@ [%@] [%@] [%@]", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (id)notificationParametersOutFlags:(unint64_t *)a3
{
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:DMCSBUserNotificationDontDismissOnUnlock()];
  v6 = [(DMCAlert *)self title];

  if (v6)
  {
    v7 = [(DMCAlert *)self title];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F1D990]];
  }
  v8 = [(DMCAlert *)self message];

  if (v8)
  {
    v9 = [(DMCAlert *)self message];
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];
  }
  v10 = [(DMCAlert *)self defaultButtonText];

  if (v10)
  {
    v11 = [(DMCAlert *)self defaultButtonText];
    [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
  }
  v12 = [(DMCAlert *)self alternateButtonText];

  if (v12)
  {
    v13 = [(DMCAlert *)self alternateButtonText];
    [v5 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];
  }
  v14 = [(DMCAlert *)self otherButtonText];

  if (v14)
  {
    v15 = [(DMCAlert *)self otherButtonText];
    [v5 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F1DA10]];
  }
  if ([(DMCAlert *)self destructive]) {
    [v5 setObject:&unk_1EFD88718 forKeyedSubscript:@"SBUserNotificationAlternateButtonPresentationStyle"];
  }
  if ([(DMCAlert *)self displayOnLockScreen]) {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F1D9B8]];
  }
  if ([(DMCAlert *)self dismissOnLock]) {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:DMCSBUserNotificationDismissOnLock()];
  }
  *a3 = 0;
  uint64_t v16 = [(DMCAlert *)self defaultButtonText];
  if (v16)
  {
    v17 = (void *)v16;
    uint64_t v18 = [(DMCAlert *)self alternateButtonText];
    if (v18)
    {
      v19 = (void *)v18;
      v20 = [(DMCAlert *)self otherButtonText];

      if (v20) {
        *a3 |= 0x20uLL;
      }
    }
    else
    {
    }
  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)defaultButtonText
{
  return self->_defaultButtonText;
}

- (void)setDefaultButtonText:(id)a3
{
}

- (NSString)alternateButtonText
{
  return self->_alternateButtonText;
}

- (void)setAlternateButtonText:(id)a3
{
}

- (NSString)otherButtonText
{
  return self->_otherButtonText;
}

- (void)setOtherButtonText:(id)a3
{
}

- (BOOL)destructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (BOOL)displayOnLockScreen
{
  return self->_displayOnLockScreen;
}

- (void)setDisplayOnLockScreen:(BOOL)a3
{
  self->_displayOnLockScreen = a3;
}

- (BOOL)dismissOnLock
{
  return self->_dismissOnLock;
}

- (void)setDismissOnLock:(BOOL)a3
{
  self->_dismissOnLock = a3;
}

- (double)dismissAfterTimeInterval
{
  return self->_dismissAfterTimeInterval;
}

- (void)setDismissAfterTimeInterval:(double)a3
{
  self->_dismissAfterTimeInterval = a3;
}

- (id)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void)setSummary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_notification, 0);
  objc_storeStrong((id *)&self->_otherButtonText, 0);
  objc_storeStrong((id *)&self->_alternateButtonText, 0);
  objc_storeStrong((id *)&self->_defaultButtonText, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end