@interface VOCommandContext
+ (id)commandCategoryContextWithCategory:(id)a3 commandManager:(id)a4 resolver:(id)a5;
+ (id)commandContextWithCommand:(id)a3 commandManager:(id)a4 resolver:(id)a5;
+ (id)genericContextWithCommandManager:(id)a3 command:(id)a4 resolver:(id)a5;
+ (id)genericContextWithCommandManager:(id)a3 resolver:(id)a4;
+ (id)gestureContextWithGesture:(id)a3 commandManager:(id)a4 resolver:(id)a5;
+ (id)keyboardShortcutContextWithKeyChord:(id)a3 commandManager:(id)a4 resolver:(id)a5;
+ (id)quickNavShortcutContextWithKeyChord:(id)a3 commandManager:(id)a4 resolver:(id)a5;
- (AXSSKeyChord)keyChord;
- (NSNumber)bindingAvailability;
- (VOSCommand)command;
- (VOSCommandCategory)commandCategory;
- (VOSCommandManager)commandManager;
- (VOSCommandResolver)resolver;
- (VOSGesture)gesture;
- (id)description;
- (id)gestureDescription:(id)a3;
- (int64_t)itemType;
- (void)setBindingAvailability:(id)a3;
- (void)setCommand:(id)a3;
- (void)setCommandCategory:(id)a3;
- (void)setCommandManager:(id)a3;
- (void)setGesture:(id)a3;
- (void)setItemType:(int64_t)a3;
- (void)setKeyChord:(id)a3;
- (void)setResolver:(id)a3;
@end

@implementation VOCommandContext

+ (id)genericContextWithCommandManager:(id)a3 resolver:(id)a4
{
  return +[VOCommandContext genericContextWithCommandManager:a3 command:0 resolver:a4];
}

+ (id)genericContextWithCommandManager:(id)a3 command:(id)a4 resolver:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(VOCommandContext);
  [(VOCommandContext *)v10 setItemType:5];
  [(VOCommandContext *)v10 setCommandManager:v9];

  [(VOCommandContext *)v10 setCommand:v8];
  [(VOCommandContext *)v10 setResolver:v7];

  return v10;
}

+ (id)commandCategoryContextWithCategory:(id)a3 commandManager:(id)a4 resolver:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(VOCommandContext);
  [(VOCommandContext *)v10 setItemType:1];
  [(VOCommandContext *)v10 setCommandCategory:v9];

  [(VOCommandContext *)v10 setCommandManager:v8];
  [(VOCommandContext *)v10 setResolver:v7];

  return v10;
}

+ (id)commandContextWithCommand:(id)a3 commandManager:(id)a4 resolver:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(VOCommandContext);
  [(VOCommandContext *)v10 setItemType:1];
  [(VOCommandContext *)v10 setCommand:v9];

  [(VOCommandContext *)v10 setCommandManager:v8];
  [(VOCommandContext *)v10 setResolver:v7];

  return v10;
}

+ (id)gestureContextWithGesture:(id)a3 commandManager:(id)a4 resolver:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(VOCommandContext);
  [(VOCommandContext *)v10 setItemType:2];
  [(VOCommandContext *)v10 setGesture:v9];

  [(VOCommandContext *)v10 setCommandManager:v8];
  [(VOCommandContext *)v10 setResolver:v7];

  return v10;
}

+ (id)keyboardShortcutContextWithKeyChord:(id)a3 commandManager:(id)a4 resolver:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(VOCommandContext);
  [(VOCommandContext *)v10 setItemType:3];
  [(VOCommandContext *)v10 setKeyChord:v9];

  [(VOCommandContext *)v10 setCommandManager:v8];
  [(VOCommandContext *)v10 setResolver:v7];

  return v10;
}

+ (id)quickNavShortcutContextWithKeyChord:(id)a3 commandManager:(id)a4 resolver:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(VOCommandContext);
  [(VOCommandContext *)v10 setItemType:4];
  [(VOCommandContext *)v10 setKeyChord:v9];

  [(VOCommandContext *)v10 setCommandManager:v8];
  [(VOCommandContext *)v10 setResolver:v7];

  return v10;
}

- (id)gestureDescription:(id)a3
{
  v4 = objc_opt_new();
  v5 = [(VOCommandContext *)self command];

  if (v5)
  {
    v6 = [(VOCommandContext *)self commandManager];
    id v7 = [(VOCommandContext *)self command];
    id v8 = [(VOCommandContext *)self resolver];
    id v9 = [v6 gestureBindingsForCommand:v7 withResolver:v8];
    v10 = [v9 allObjects];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "localizedName", (void)v19);
          if ([v16 length]) {
            [v4 addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
  v17 = +[NSListFormatter localizedStringByJoiningStrings:](NSListFormatter, "localizedStringByJoiningStrings:", v4, (void)v19);

  return v17;
}

- (id)description
{
  int64_t v3 = [(VOCommandContext *)self itemType];
  v4 = [(VOCommandContext *)self commandManager];
  v5 = [(VOCommandContext *)self command];
  v6 = [(VOCommandContext *)self gesture];
  id v7 = [(VOCommandContext *)self keyChord];
  id v8 = [(VOCommandContext *)self resolver];
  id v9 = +[NSString stringWithFormat:@"VOCommandContext<%p> type:%ld commandManager:%@ command:%@ gesture:%@ keyChord:%@ resolver:%@", self, v3, v4, v5, v6, v7, v8];

  return v9;
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(int64_t)a3
{
  self->_itemType = a3;
}

- (VOSCommandManager)commandManager
{
  return self->_commandManager;
}

- (void)setCommandManager:(id)a3
{
}

- (VOSCommandCategory)commandCategory
{
  return self->_commandCategory;
}

- (void)setCommandCategory:(id)a3
{
}

- (VOSCommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (VOSGesture)gesture
{
  return self->_gesture;
}

- (void)setGesture:(id)a3
{
}

- (AXSSKeyChord)keyChord
{
  return self->_keyChord;
}

- (void)setKeyChord:(id)a3
{
}

- (VOSCommandResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
}

- (NSNumber)bindingAvailability
{
  return self->_bindingAvailability;
}

- (void)setBindingAvailability:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bindingAvailability, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_keyChord, 0);
  objc_storeStrong((id *)&self->_gesture, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_commandCategory, 0);

  objc_storeStrong((id *)&self->_commandManager, 0);
}

@end