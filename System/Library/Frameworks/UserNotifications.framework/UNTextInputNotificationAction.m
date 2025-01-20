@interface UNTextInputNotificationAction
+ (UNTextInputNotificationAction)actionWithIdentifier:(NSString *)identifier title:(NSString *)title options:(UNNotificationActionOptions)options icon:(UNNotificationActionIcon *)icon textInputButtonTitle:(NSString *)textInputButtonTitle textInputPlaceholder:(NSString *)textInputPlaceholder;
+ (UNTextInputNotificationAction)actionWithIdentifier:(NSString *)identifier title:(NSString *)title options:(UNNotificationActionOptions)options textInputButtonTitle:(NSString *)textInputButtonTitle textInputPlaceholder:(NSString *)textInputPlaceholder;
- (BOOL)isEqual:(id)a3;
- (id)description;
@end

@implementation UNTextInputNotificationAction

+ (UNTextInputNotificationAction)actionWithIdentifier:(NSString *)identifier title:(NSString *)title options:(UNNotificationActionOptions)options icon:(UNNotificationActionIcon *)icon textInputButtonTitle:(NSString *)textInputButtonTitle textInputPlaceholder:(NSString *)textInputPlaceholder
{
  v14 = textInputPlaceholder;
  v15 = textInputButtonTitle;
  v16 = icon;
  v17 = title;
  v18 = identifier;
  v19 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v18 title:v17 options:options textInputButtonTitle:v15 textInputPlaceholder:v14 url:0 icon:v16];

  return (UNTextInputNotificationAction *)v19;
}

+ (UNTextInputNotificationAction)actionWithIdentifier:(NSString *)identifier title:(NSString *)title options:(UNNotificationActionOptions)options textInputButtonTitle:(NSString *)textInputButtonTitle textInputPlaceholder:(NSString *)textInputPlaceholder
{
  v12 = textInputPlaceholder;
  v13 = textInputButtonTitle;
  v14 = title;
  v15 = identifier;
  v16 = (void *)[objc_alloc((Class)a1) _initWithIdentifier:v15 title:v14 options:options textInputButtonTitle:v13 textInputPlaceholder:v12 url:0 icon:0];

  return (UNTextInputNotificationAction *)v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UNTextInputNotificationAction;
  if ([(UNNotificationAction *)&v11 isEqual:v4])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(UNNotificationAction *)self textInputButtonTitle];
      v6 = [v4 textInputButtonTitle];
      if (UNEqualObjects(v5, v6))
      {
        v7 = [(UNNotificationAction *)self textInputPlaceholder];
        v8 = [v4 textInputPlaceholder];
        char v9 = UNEqualObjects(v7, v8);
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(UNNotificationAction *)self _description];
  v5 = [(UNNotificationAction *)self textInputButtonTitle];
  v6 = [(UNNotificationAction *)self textInputPlaceholder];
  v7 = [v3 stringWithFormat:@"%@, textInputButtonTitle: %@, textInputPlaceholder: %@>", v4, v5, v6];

  return v7;
}

@end