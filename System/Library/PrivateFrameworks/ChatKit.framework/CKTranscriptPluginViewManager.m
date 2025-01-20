@interface CKTranscriptPluginViewManager
+ (id)sharedInstance;
- (BOOL)_objectSupportsPluginViewReuse:(id)a3;
- (CKTranscriptPluginViewManager)init;
- (id)_pointerKeyForPluginView:(id)a3;
- (id)dequeuePluginViewForBalloonController:(id)a3;
- (void)_registerPluginView:(id)a3 withReuseDelegate:(id)a4;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)enqueuePluginViewForReuse:(id)a3;
- (void)resetState;
@end

@implementation CKTranscriptPluginViewManager

+ (id)sharedInstance
{
  if (sharedInstance_creation_2 != -1) {
    dispatch_once(&sharedInstance_creation_2, &__block_literal_global_253);
  }
  v2 = (void *)sharedInstance_sInstance_5;

  return v2;
}

void __47__CKTranscriptPluginViewManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKTranscriptPluginViewManager);
  v1 = (void *)sharedInstance_sInstance_5;
  sharedInstance_sInstance_5 = (uint64_t)v0;
}

- (CKTranscriptPluginViewManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKTranscriptPluginViewManager;
  v2 = [(CKTranscriptPluginViewManager *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_didReceiveMemoryWarning name:*MEMORY[0x1E4F43670] object:0];

    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43670] object:0];

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptPluginViewManager;
  [(CKTranscriptPluginViewManager *)&v4 dealloc];
}

- (void)didReceiveMemoryWarning
{
}

- (void)resetState
{
  [(IMMultiDict *)self->_reusablePluginViewsByClassName removeAllObjects];
  pluginViewToReuseDelegateMap = self->_pluginViewToReuseDelegateMap;

  [(NSMutableDictionary *)pluginViewToReuseDelegateMap removeAllObjects];
}

- (id)dequeuePluginViewForBalloonController:(id)a3
{
  id v4 = a3;
  if ([(CKTranscriptPluginViewManager *)self _objectSupportsPluginViewReuse:v4])
  {
    v5 = NSStringFromClass((Class)[v4 pluginViewClassType]);
    if (v5)
    {
      objc_super v6 = [(IMMultiDict *)self->_reusablePluginViewsByClassName dequeueObjectForKey:v5];
      if (!v6)
      {
        objc_super v6 = [v4 createNewPluginView];
        if ((objc_msgSend((id)objc_opt_class(), "isEqual:", objc_msgSend(v4, "pluginViewClassType")) & 1) == 0)
        {
          v7 = NSString;
          uint64_t v8 = IMFileLocationTrimFileName();
          v9 = [NSString stringWithFormat:&stru_1EDE4CA38];
          v10 = [v7 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"[[pluginView class] isEqual:[balloonController pluginViewClassType]]", "-[CKTranscriptPluginViewManager dequeuePluginViewForBalloonController:]", v8, 58, v9];

          v11 = (void (*)(void *))IMGetAssertionFailureHandler();
          if (v11)
          {
            v11(v10);
          }
          else
          {
            v13 = v10;
            _IMWarn();
          }
        }
      }
      -[CKTranscriptPluginViewManager _registerPluginView:withReuseDelegate:](self, "_registerPluginView:withReuseDelegate:", v6, v4, v13);
    }
    else
    {
      _IMWarn();
      objc_super v6 = 0;
    }
  }
  else
  {
    _IMWarn();
    if (objc_opt_respondsToSelector())
    {
      objc_super v6 = [v4 createNewPluginView];
    }
    else
    {
      objc_super v6 = 0;
    }
  }

  return v6;
}

- (id)_pointerKeyForPluginView:(id)a3
{
  return (id)[MEMORY[0x1E4F29238] valueWithPointer:a3];
}

- (BOOL)_objectSupportsPluginViewReuse:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 allowsReusablePluginViews];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)_registerPluginView:(id)a3 withReuseDelegate:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11 && v6)
  {
    if ([(CKTranscriptPluginViewManager *)self _objectSupportsPluginViewReuse:v6])
    {
      pluginViewToReuseDelegateMap = self->_pluginViewToReuseDelegateMap;
      if (!pluginViewToReuseDelegateMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        v9 = self->_pluginViewToReuseDelegateMap;
        self->_pluginViewToReuseDelegateMap = Mutable;

        pluginViewToReuseDelegateMap = self->_pluginViewToReuseDelegateMap;
      }
      v10 = [(CKTranscriptPluginViewManager *)self _pointerKeyForPluginView:v11];
      [(NSMutableDictionary *)pluginViewToReuseDelegateMap setObject:v6 forKey:v10];
    }
  }
  else
  {
    _IMWarn();
  }
}

- (void)enqueuePluginViewForReuse:(id)a3
{
  id v12 = a3;
  char v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = (void *)v5;
  if (v12 && v5)
  {
    v7 = -[CKTranscriptPluginViewManager _pointerKeyForPluginView:](self, "_pointerKeyForPluginView:");
    uint64_t v8 = [(NSMutableDictionary *)self->_pluginViewToReuseDelegateMap objectForKey:v7];
    if (v8
      && [(CKTranscriptPluginViewManager *)self _objectSupportsPluginViewReuse:v8])
    {
      reusablePluginViewsByClassName = self->_reusablePluginViewsByClassName;
      if (reusablePluginViewsByClassName) {
        v10 = reusablePluginViewsByClassName;
      }
      else {
        v10 = (IMMultiDict *)objc_alloc_init(MEMORY[0x1E4F6C380]);
      }
      id v11 = self->_reusablePluginViewsByClassName;
      self->_reusablePluginViewsByClassName = v10;

      [(IMMultiDict *)self->_reusablePluginViewsByClassName enqueueObject:v12 forKey:v6];
      [v8 pluginViewDidEnterReuseQueue:v12];
      [(NSMutableDictionary *)self->_pluginViewToReuseDelegateMap removeObjectForKey:v7];
    }
  }
  else
  {
    _IMWarn();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginViewToReuseDelegateMap, 0);

  objc_storeStrong((id *)&self->_reusablePluginViewsByClassName, 0);
}

@end