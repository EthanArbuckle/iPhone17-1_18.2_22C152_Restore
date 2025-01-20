@interface SCATActionItem
+ (id)fromAction:(int64_t)a3;
+ (id)fromSwitch:(id)a3 longPress:(BOOL)a4;
- (NSString)shortcutIdentifier;
- (id)description;
- (int64_t)action;
- (void)setAction:(int64_t)a3;
- (void)setShortcutIdentifier:(id)a3;
@end

@implementation SCATActionItem

+ (id)fromAction:(int64_t)a3
{
  v4 = objc_opt_new();
  [v4 setAction:a3];

  return v4;
}

+ (id)fromSwitch:(id)a3 longPress:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = objc_opt_new();
  if (v4)
  {
    objc_msgSend(v6, "setAction:", objc_msgSend(v5, "longPressAction"));
    [v5 longPressShortcutIdentifier];
  }
  else
  {
    objc_msgSend(v6, "setAction:", objc_msgSend(v5, "action"));
    [v5 shortcutIdentifier];
  v7 = };

  [v6 setShortcutIdentifier:v7];

  return v6;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SCATActionItem;
  v3 = [(SCATActionItem *)&v8 description];
  BOOL v4 = +[NSNumber numberWithInteger:[(SCATActionItem *)self action]];
  id v5 = [(SCATActionItem *)self shortcutIdentifier];
  v6 = +[NSString stringWithFormat:@"%@ action: %@, shortcut: %@", v3, v4, v5];

  return v6;
}

- (int64_t)action
{
  return self->action;
}

- (void)setAction:(int64_t)a3
{
  self->action = a3;
}

- (NSString)shortcutIdentifier
{
  return self->shortcutIdentifier;
}

- (void)setShortcutIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end