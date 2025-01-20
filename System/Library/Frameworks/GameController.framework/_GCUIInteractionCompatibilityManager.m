@interface _GCUIInteractionCompatibilityManager
+ (id)sharedInstance;
- (BOOL)isEnabled;
- (_GCUIInteractionCompatibilityManager)init;
- (id)_init;
- (void)_installInteractionOnWindow:(id)a3;
- (void)_windowDidBecomeKey:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation _GCUIInteractionCompatibilityManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_28);
  }
  v2 = (void *)sharedInstance_SharedInstance;

  return v2;
}

- (id)_init
{
  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)_GCUIInteractionCompatibilityManager;
    return objc_msgSendSuper2(&v1, sel_init);
  }
  return result;
}

- (_GCUIInteractionCompatibilityManager)init
{
  return 0;
}

- (BOOL)isEnabled
{
  return self->_installedInteractions != 0;
}

- (void)setEnabled:(BOOL)a3
{
  installedInteractions = self->_installedInteractions;
  if (a3)
  {
    if (!installedInteractions)
    {
      v5 = (NSMutableSet *)objc_opt_new();
      v6 = self->_installedInteractions;
      self->_installedInteractions = v5;

      v7 = +[NSNotificationCenter defaultCenter];
      [v7 addObserver:self selector:sel__windowDidBecomeKey_ name:UIWindowDidBecomeKeyNotification object:0];

      v8 = +[UIWindow _applicationKeyWindow];
      if (v8)
      {
        v18 = v8;
        [(_GCUIInteractionCompatibilityManager *)self _installInteractionOnWindow:v8];
        v8 = v18;
      }
    }
  }
  else if (installedInteractions)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v9 = installedInteractions;
    uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v15 = [v14 view];
          [v15 removeInteraction:v14];
        }
        uint64_t v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    v16 = self->_installedInteractions;
    self->_installedInteractions = 0;

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 removeObserver:self name:UIWindowDidBecomeKeyNotification object:0];
  }
}

- (void)_installInteractionOnWindow:(id)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v16 = a3;
  v4 = [v16 interactions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v12 = [(NSMutableSet *)self->_installedInteractions containsObject:v11];
          id v13 = v11;
          if (v12) {
            v14 = (void *)v8;
          }
          else {
            v14 = (void *)v7;
          }
          if (v12) {
            unint64_t v8 = (unint64_t)v13;
          }
          else {
            unint64_t v7 = (unint64_t)v13;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
    unint64_t v8 = 0;
  }

  if (!(v8 | v7))
  {
    v15 = objc_opt_new();
    [v15 setHandledEventTypes:1];
    [(NSMutableSet *)self->_installedInteractions addObject:v15];
    [v16 addInteraction:v15];
  }
}

- (void)_windowDidBecomeKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(_GCUIInteractionCompatibilityManager *)self _installInteractionOnWindow:v5];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v6 = self->_installedInteractions;
    uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v7)
    {
      uint64_t v9 = v6;
      goto LABEL_16;
    }
    uint64_t v8 = v7;
    v14 = self;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [v12 view];

        if (!v13)
        {
          if (!v9)
          {
            uint64_t v9 = +[NSMutableSet set];
          }
          [v9 addObject:v12];
        }
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);

    if (v9)
    {
      [(NSMutableSet *)v14->_installedInteractions minusSet:v9];
LABEL_16:
    }
  }
}

- (void).cxx_destruct
{
}

@end