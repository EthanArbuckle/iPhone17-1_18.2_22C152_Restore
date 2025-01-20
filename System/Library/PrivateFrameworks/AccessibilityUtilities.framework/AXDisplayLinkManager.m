@interface AXDisplayLinkManager
+ (id)currentDisplayLinkManager;
+ (void)_releaseCurrentDisplayLinkManager;
- (AXDisplayLinkManager)init;
- (BOOL)hasUpdatedTargetActions;
- (BOOL)isHandlingDisplayRefresh;
- (BOOL)isPaused;
- (BOOL)isWarmUpModeEnabled;
- (CADisplayLink)displayLink;
- (CADisplayLink)storedDisplayLink;
- (NSMutableSet)activeTargetActions;
- (NSMutableSet)updatedTargetActions;
- (double)duration;
- (double)timestamp;
- (id)_prepareUpdatedTargetActionsForModification;
- (unint64_t)warmUpModeRequirementsCount;
- (void)_didAddFirstTargetAction;
- (void)_didRemoveLastTargetAction;
- (void)_displayDidRefresh:(id)a3;
- (void)addTarget:(id)a3 selector:(SEL)a4;
- (void)beginRequiringWarmUpMode;
- (void)endRequiringWarmUpMode;
- (void)removeTarget:(id)a3 selector:(SEL)a4;
- (void)setActiveTargetActions:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setHandlingDisplayRefresh:(BOOL)a3;
- (void)setHasUpdatedTargetActions:(BOOL)a3;
- (void)setStoredDisplayLink:(id)a3;
- (void)setUpdatedTargetActions:(id)a3;
- (void)setWarmUpModeRequirementsCount:(unint64_t)a3;
@end

@implementation AXDisplayLinkManager

+ (id)currentDisplayLinkManager
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F29060] currentThread];
    v5 = [v4 threadDictionary];

    v6 = [v5 objectForKey:v3];
    if (!v6)
    {
      v6 = objc_opt_new();
      if (v6) {
        [v5 setObject:v6 forKey:v3];
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_releaseCurrentDisplayLinkManager
{
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v3 = [MEMORY[0x1E4F29060] currentThread];
    v4 = [v3 threadDictionary];

    [v4 removeObjectForKey:v5];
  }
}

- (AXDisplayLinkManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXDisplayLinkManager;
  v2 = [(AXDisplayLinkManager *)&v8 init];
  if (v2)
  {
    v3 = objc_opt_new();
    uint64_t v4 = objc_opt_new();
    id v5 = (void *)v4;
    if (v3) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {

      v2 = 0;
    }
    else
    {
      [(AXDisplayLinkManager *)v2 setActiveTargetActions:v3];
      [(AXDisplayLinkManager *)v2 setUpdatedTargetActions:v5];
    }
  }
  return v2;
}

- (BOOL)isPaused
{
  v2 = [(AXDisplayLinkManager *)self storedDisplayLink];
  char v3 = [v2 isPaused];

  return v3;
}

- (double)duration
{
  v2 = [(AXDisplayLinkManager *)self storedDisplayLink];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (double)timestamp
{
  v2 = [(AXDisplayLinkManager *)self storedDisplayLink];
  [v2 timestamp];
  double v4 = v3;

  return v4;
}

- (CADisplayLink)displayLink
{
  double v3 = [(AXDisplayLinkManager *)self storedDisplayLink];
  if (!v3)
  {
    double v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayDidRefresh_];
    double v4 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v3 addToRunLoop:v4 forMode:*MEMORY[0x1E4F1C3A0]];

    [v3 setPaused:1];
    [(AXDisplayLinkManager *)self setStoredDisplayLink:v3];
  }

  return (CADisplayLink *)v3;
}

- (void)setDisplayLink:(id)a3
{
  id v5 = a3;
  id v4 = [(AXDisplayLinkManager *)self storedDisplayLink];
  if (v4 != v5)
  {
    [v4 invalidate];
    [(AXDisplayLinkManager *)self setStoredDisplayLink:v5];
  }
}

- (void)addTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v9 = [[AXDisplayLinkManagerTargetAction alloc] initWithTarget:v6 actionSelector:a4];

  if ([(AXDisplayLinkManager *)self isHandlingDisplayRefresh])
  {
    v7 = [(AXDisplayLinkManager *)self _prepareUpdatedTargetActionsForModification];
    [v7 addObject:v9];
  }
  else
  {
    v7 = [(AXDisplayLinkManager *)self activeTargetActions];
    uint64_t v8 = [v7 count];
    [v7 addObject:v9];
    if (!v8) {
      [(AXDisplayLinkManager *)self _didAddFirstTargetAction];
    }
  }
}

- (void)removeTarget:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v9 = [[AXDisplayLinkManagerTargetAction alloc] initWithTarget:v6 actionSelector:a4];

  if ([(AXDisplayLinkManager *)self isHandlingDisplayRefresh])
  {
    v7 = [(AXDisplayLinkManager *)self _prepareUpdatedTargetActionsForModification];
    [v7 removeObject:v9];
  }
  else
  {
    v7 = [(AXDisplayLinkManager *)self activeTargetActions];
    uint64_t v8 = [v7 count];
    [v7 removeObject:v9];
    if (v8 && ![v7 count]) {
      [(AXDisplayLinkManager *)self _didRemoveLastTargetAction];
    }
  }
}

- (id)_prepareUpdatedTargetActionsForModification
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = [(AXDisplayLinkManager *)self updatedTargetActions];
  if (![(AXDisplayLinkManager *)self hasUpdatedTargetActions])
  {
    id v4 = [(AXDisplayLinkManager *)self activeTargetActions];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
    [(AXDisplayLinkManager *)self setHasUpdatedTargetActions:1];
  }

  return v3;
}

- (void)_didAddFirstTargetAction
{
  id v2 = [(AXDisplayLinkManager *)self displayLink];
  [v2 setPaused:0];
}

- (void)_didRemoveLastTargetAction
{
  double v3 = [(AXDisplayLinkManager *)self storedDisplayLink];
  [v3 setPaused:1];

  if (![(AXDisplayLinkManager *)self isWarmUpModeEnabled])
  {
    [(AXDisplayLinkManager *)self setDisplayLink:0];
    id v4 = objc_opt_class();
    [v4 _releaseCurrentDisplayLinkManager];
  }
}

- (BOOL)isWarmUpModeEnabled
{
  return [(AXDisplayLinkManager *)self warmUpModeRequirementsCount] != 0;
}

- (void)beginRequiringWarmUpMode
{
  unint64_t v3 = [(AXDisplayLinkManager *)self warmUpModeRequirementsCount];
  [(AXDisplayLinkManager *)self setWarmUpModeRequirementsCount:v3 + 1];
  if (!v3 && ![(AXDisplayLinkManager *)self isHandlingDisplayRefresh])
  {
    if ([(AXDisplayLinkManager *)self hasUpdatedTargetActions]) {
      _AXAssert();
    }
    id v4 = [(AXDisplayLinkManager *)self activeTargetActions];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      uint64_t v6 = [(AXDisplayLinkManager *)self displayLink];
    }
  }
}

- (void)endRequiringWarmUpMode
{
  unint64_t v3 = [(AXDisplayLinkManager *)self warmUpModeRequirementsCount] - 1;
  [(AXDisplayLinkManager *)self setWarmUpModeRequirementsCount:v3];
  if (!v3 && ![(AXDisplayLinkManager *)self isHandlingDisplayRefresh])
  {
    if ([(AXDisplayLinkManager *)self hasUpdatedTargetActions]) {
      _AXAssert();
    }
    id v4 = [(AXDisplayLinkManager *)self activeTargetActions];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      [(AXDisplayLinkManager *)self _didRemoveLastTargetAction];
    }
  }
}

- (void)_displayDidRefresh:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(AXDisplayLinkManager *)self isHandlingDisplayRefresh];
  [(AXDisplayLinkManager *)self setHandlingDisplayRefresh:1];
  [(AXDisplayLinkManager *)self activeTargetActions];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9++), "displayDidRefresh:", self, (void)v13);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(AXDisplayLinkManager *)self setHandlingDisplayRefresh:v4];
  if (v4 || ![(AXDisplayLinkManager *)self hasUpdatedTargetActions])
  {
    id v11 = v5;
  }
  else
  {
    [v5 removeAllObjects];
    long long v10 = [(AXDisplayLinkManager *)self updatedTargetActions];
    [(AXDisplayLinkManager *)self setUpdatedTargetActions:v5];
    [(AXDisplayLinkManager *)self setActiveTargetActions:v10];
    [(AXDisplayLinkManager *)self setHasUpdatedTargetActions:0];
    id v11 = v10;

    uint64_t v12 = [v11 count];
    if (!v12) {
      [(AXDisplayLinkManager *)self _didRemoveLastTargetAction];
    }
  }
}

- (CADisplayLink)storedDisplayLink
{
  return self->_storedDisplayLink;
}

- (void)setStoredDisplayLink:(id)a3
{
}

- (NSMutableSet)activeTargetActions
{
  return self->_activeTargetActions;
}

- (void)setActiveTargetActions:(id)a3
{
}

- (NSMutableSet)updatedTargetActions
{
  return self->_updatedTargetActions;
}

- (void)setUpdatedTargetActions:(id)a3
{
}

- (BOOL)hasUpdatedTargetActions
{
  return self->_hasUpdatedTargetActions;
}

- (void)setHasUpdatedTargetActions:(BOOL)a3
{
  self->_hasUpdatedTargetActions = a3;
}

- (BOOL)isHandlingDisplayRefresh
{
  return self->_handlingDisplayRefresh;
}

- (void)setHandlingDisplayRefresh:(BOOL)a3
{
  self->_handlingDisplayRefresh = a3;
}

- (unint64_t)warmUpModeRequirementsCount
{
  return self->_warmUpModeRequirementsCount;
}

- (void)setWarmUpModeRequirementsCount:(unint64_t)a3
{
  self->_warmUpModeRequirementsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedTargetActions, 0);
  objc_storeStrong((id *)&self->_activeTargetActions, 0);

  objc_storeStrong((id *)&self->_storedDisplayLink, 0);
}

@end