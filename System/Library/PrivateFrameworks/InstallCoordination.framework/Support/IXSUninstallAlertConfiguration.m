@interface IXSUninstallAlertConfiguration
- (IXSUninstallAlertConfiguration)initWithTitle:(id)a3 message:(id)a4;
- (NSDictionary)alertParameters;
- (NSMutableArray)actionDefinitions;
- (NSMutableArray)buttonDefinitions;
- (NSString)message;
- (NSString)title;
- (id)actionForButtonAtIndex:(unint64_t)a3;
- (unint64_t)numButtons;
- (void)addButtonDefinition:(id)a3 forAction:(id)a4;
- (void)setActionDefinitions:(id)a3;
- (void)setButtonDefinitions:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation IXSUninstallAlertConfiguration

- (IXSUninstallAlertConfiguration)initWithTitle:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IXSUninstallAlertConfiguration;
  v8 = [(IXSUninstallAlertConfiguration *)&v12 init];
  if (v8)
  {
    v9 = objc_opt_new();
    [(IXSUninstallAlertConfiguration *)v8 setButtonDefinitions:v9];

    v10 = objc_opt_new();
    [(IXSUninstallAlertConfiguration *)v8 setActionDefinitions:v10];

    [(IXSUninstallAlertConfiguration *)v8 setTitle:v6];
    [(IXSUninstallAlertConfiguration *)v8 setMessage:v7];
  }

  return v8;
}

- (void)addButtonDefinition:(id)a3 forAction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 buttonType];
  v8 = [(IXSUninstallAlertConfiguration *)self buttonDefinitions];
  [v8 addObject:v7];

  id v10 = [(IXSUninstallAlertConfiguration *)self actionDefinitions];
  id v9 = objc_retainBlock(v6);

  [v10 addObject:v9];
}

- (id)actionForButtonAtIndex:(unint64_t)a3
{
  v4 = [(IXSUninstallAlertConfiguration *)self actionDefinitions];
  v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (unint64_t)numButtons
{
  v2 = [(IXSUninstallAlertConfiguration *)self buttonDefinitions];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (NSDictionary)alertParameters
{
  id v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = [(IXSUninstallAlertConfiguration *)self buttonDefinitions];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) buttonDefinitionForSB];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }

  v19[0] = kCFUserNotificationAlertHeaderKey;
  id v10 = [(IXSUninstallAlertConfiguration *)self title];
  v20[0] = v10;
  v19[1] = kCFUserNotificationAlertMessageKey;
  v11 = [(IXSUninstallAlertConfiguration *)self message];
  v20[1] = v11;
  v20[2] = &__kCFBooleanTrue;
  v19[2] = SBUserNotificationAllowMenuButtonDismissal;
  v19[3] = SBUserNotificationDismissOnLock;
  v20[3] = &__kCFBooleanTrue;
  v19[4] = SBSUserNotificationButtonDefinitionsKey;
  id v12 = [v3 copy];
  v20[4] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:5];

  return (NSDictionary *)v13;
}

- (NSMutableArray)buttonDefinitions
{
  return self->_buttonDefinitions;
}

- (void)setButtonDefinitions:(id)a3
{
}

- (NSMutableArray)actionDefinitions
{
  return self->_actionDefinitions;
}

- (void)setActionDefinitions:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actionDefinitions, 0);

  objc_storeStrong((id *)&self->_buttonDefinitions, 0);
}

@end