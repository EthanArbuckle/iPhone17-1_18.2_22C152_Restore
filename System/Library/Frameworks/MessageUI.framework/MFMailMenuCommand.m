@interface MFMailMenuCommand
+ (id)shortcutWithCommand:(id)a3 menu:(int64_t)a4;
+ (id)shortcutWithInput:(id)a3 flags:(int64_t)a4 repeatable:(BOOL)a5 menu:(int64_t)a6 action:(SEL)a7;
+ (id)shortcutWithInput:(id)a3 flags:(int64_t)a4 repeatable:(BOOL)a5 menu:(int64_t)a6 action:(SEL)a7 title:(id)a8 plist:(id)a9;
- (MFMailMenuCommand)initWithCommand:(id)a3 menu:(int64_t)a4;
- (UICommand)command;
- (int64_t)menu;
@end

@implementation MFMailMenuCommand

- (int64_t)menu
{
  return self->_menu;
}

- (UICommand)command
{
  return self->_command;
}

+ (id)shortcutWithInput:(id)a3 flags:(int64_t)a4 repeatable:(BOOL)a5 menu:(int64_t)a6 action:(SEL)a7
{
  v7 = [a1 shortcutWithInput:a3 flags:a4 repeatable:a5 menu:a6 action:a7 title:0 plist:0];

  return v7;
}

+ (id)shortcutWithInput:(id)a3 flags:(int64_t)a4 repeatable:(BOOL)a5 menu:(int64_t)a6 action:(SEL)a7 title:(id)a8 plist:(id)a9
{
  id v14 = a8;
  v15 = [MEMORY[0x1E4FB18D0] commandWithTitle:v14 image:0 action:a7 input:a3 modifierFlags:a4 propertyList:a9];
  [v15 setDiscoverabilityTitle:v14];
  if (!a5)
  {
    uint64_t v16 = [v15 _nonRepeatableKeyCommand];

    v15 = (void *)v16;
  }
  v17 = +[MFMailMenuCommand shortcutWithCommand:v15 menu:a6];

  return v17;
}

+ (id)shortcutWithCommand:(id)a3 menu:(int64_t)a4
{
  id v5 = a3;
  v6 = [[MFMailMenuCommand alloc] initWithCommand:v5 menu:a4];

  return v6;
}

- (MFMailMenuCommand)initWithCommand:(id)a3 menu:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFMailMenuCommand;
  v8 = [(MFMailMenuCommand *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_command, a3);
    v9->_menu = a4;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end