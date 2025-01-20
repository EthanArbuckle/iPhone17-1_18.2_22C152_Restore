@interface FMAlert
+ (BOOL)supportsSecureCoding;
- (BOOL)dismissMsgOnLock;
- (BOOL)dismissMsgOnUnlock;
- (BOOL)showMsgInLockScreen;
- (FMAlert)init;
- (FMAlert)initWithCoder:(id)a3;
- (NSDictionary)additionalSettings;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)msgText;
- (NSString)msgTitle;
- (NSUUID)alertId;
- (double)timeout;
- (id)alternateButtonAction;
- (id)defaultButtonAction;
- (id)description;
- (unint64_t)category;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalSettings:(id)a3;
- (void)setAlertId:(id)a3;
- (void)setAlternateButtonAction:(id)a3;
- (void)setAlternateButtonTitle:(id)a3;
- (void)setCategory:(unint64_t)a3;
- (void)setDefaultButtonAction:(id)a3;
- (void)setDefaultButtonTitle:(id)a3;
- (void)setDismissMsgOnLock:(BOOL)a3;
- (void)setDismissMsgOnUnlock:(BOOL)a3;
- (void)setMsgText:(id)a3;
- (void)setMsgTitle:(id)a3;
- (void)setShowMsgInLockScreen:(BOOL)a3;
- (void)setTimeout:(double)a3;
@end

@implementation FMAlert

- (FMAlert)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMAlert;
  v2 = [(FMAlert *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    [(FMAlert *)v2 setAlertId:v3];
  }
  return v2;
}

- (FMAlert)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMAlert;
  objc_super v5 = [(FMAlert *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertId"];
    [(FMAlert *)v5 setAlertId:v6];

    -[FMAlert setCategory:](v5, "setCategory:", [v4 decodeIntegerForKey:@"category"]);
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"msgTitle"];
    [(FMAlert *)v5 setMsgTitle:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"msgText"];
    [(FMAlert *)v5 setMsgText:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultButtonTitle"];
    [(FMAlert *)v5 setDefaultButtonTitle:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternateButtonTitle"];
    [(FMAlert *)v5 setAlternateButtonTitle:v10];

    [v4 decodeDoubleForKey:@"timeout"];
    [(FMAlert *)v5 setTimeout:"setTimeout:"];
    -[FMAlert setShowMsgInLockScreen:](v5, "setShowMsgInLockScreen:", [v4 decodeBoolForKey:@"showMsgInLockScreen"]);
    -[FMAlert setDismissMsgOnUnlock:](v5, "setDismissMsgOnUnlock:", [v4 decodeBoolForKey:@"dismissMsgOnUnlock"]);
    -[FMAlert setDismissMsgOnLock:](v5, "setDismissMsgOnLock:", [v4 decodeBoolForKey:@"dismissMsgOnLock"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(FMAlert *)self alertId];
  [v9 encodeObject:v4 forKey:@"alertId"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[FMAlert category](self, "category"), @"category");
  objc_super v5 = [(FMAlert *)self msgTitle];
  [v9 encodeObject:v5 forKey:@"msgTitle"];

  v6 = [(FMAlert *)self msgText];
  [v9 encodeObject:v6 forKey:@"msgText"];

  v7 = [(FMAlert *)self defaultButtonTitle];
  [v9 encodeObject:v7 forKey:@"defaultButtonTitle"];

  v8 = [(FMAlert *)self alternateButtonTitle];
  [v9 encodeObject:v8 forKey:@"alternateButtonTitle"];

  [(FMAlert *)self timeout];
  objc_msgSend(v9, "encodeDouble:forKey:", @"timeout");
  objc_msgSend(v9, "encodeBool:forKey:", -[FMAlert showMsgInLockScreen](self, "showMsgInLockScreen"), @"showMsgInLockScreen");
  objc_msgSend(v9, "encodeBool:forKey:", -[FMAlert dismissMsgOnUnlock](self, "dismissMsgOnUnlock"), @"dismissMsgOnUnlock");
  objc_msgSend(v9, "encodeBool:forKey:", -[FMAlert dismissMsgOnLock](self, "dismissMsgOnLock"), @"dismissMsgOnLock");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v16 = NSString;
  v3 = [(FMAlert *)self alertId];
  unint64_t v15 = [(FMAlert *)self category];
  id v4 = [(FMAlert *)self msgTitle];
  objc_super v5 = [(FMAlert *)self msgText];
  v6 = [(FMAlert *)self defaultButtonTitle];
  v7 = [(FMAlert *)self alternateButtonTitle];
  [(FMAlert *)self timeout];
  uint64_t v9 = v8;
  if ([(FMAlert *)self showMsgInLockScreen]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  if ([(FMAlert *)self dismissMsgOnUnlock]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  if ([(FMAlert *)self dismissMsgOnLock]) {
    objc_super v12 = @"YES";
  }
  else {
    objc_super v12 = @"NO";
  }
  v13 = [v16 stringWithFormat:@"FMAlert(0x%lx) %@,%lu,%@,%@,%@,%@,%f,%@,%@,%@", self, v3, v15, v4, v5, v6, v7, v9, v10, v11, v12];

  return v13;
}

- (NSUUID)alertId
{
  return self->_alertId;
}

- (void)setAlertId:(id)a3
{
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (NSString)msgTitle
{
  return self->_msgTitle;
}

- (void)setMsgTitle:(id)a3
{
}

- (NSString)msgText
{
  return self->_msgText;
}

- (void)setMsgText:(id)a3
{
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (BOOL)showMsgInLockScreen
{
  return self->_showMsgInLockScreen;
}

- (void)setShowMsgInLockScreen:(BOOL)a3
{
  self->_showMsgInLockScreen = a3;
}

- (BOOL)dismissMsgOnUnlock
{
  return self->_dismissMsgOnUnlock;
}

- (void)setDismissMsgOnUnlock:(BOOL)a3
{
  self->_dismissMsgOnUnlock = a3;
}

- (BOOL)dismissMsgOnLock
{
  return self->_dismissMsgOnLock;
}

- (void)setDismissMsgOnLock:(BOOL)a3
{
  self->_dismissMsgOnLock = a3;
}

- (NSDictionary)additionalSettings
{
  return self->_additionalSettings;
}

- (void)setAdditionalSettings:(id)a3
{
}

- (id)defaultButtonAction
{
  return self->_defaultButtonAction;
}

- (void)setDefaultButtonAction:(id)a3
{
}

- (id)alternateButtonAction
{
  return self->_alternateButtonAction;
}

- (void)setAlternateButtonAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_alternateButtonAction, 0);
  objc_storeStrong(&self->_defaultButtonAction, 0);
  objc_storeStrong((id *)&self->_additionalSettings, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_msgText, 0);
  objc_storeStrong((id *)&self->_msgTitle, 0);
  objc_storeStrong((id *)&self->_alertId, 0);
}

@end