@interface FigCaptureProprietaryDefaults
+ (void)initialize;
- (FigCaptureProprietaryDefaults)initWithDefaultsChangedHandler:(id)a3;
- (id)objectForKey:(id)a3;
- (id)objectsForWildcardKey:(id)a3;
- (id)setObject:(id)a3 forWildcardKey:(id)a4;
- (void)dealloc;
- (void)observeChangesForKey:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)sendNotificationOfNewTransientValue:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)stopObservingChangesForKey:(id)a3;
@end

@implementation FigCaptureProprietaryDefaults

- (id)objectForKey:(id)a3
{
  if (a3)
  {
    if (self)
    {
      int v5 = [a3 hasPrefix:@"AUVoiceIOClients"];
      uint64_t v6 = 8;
      if (v5) {
        uint64_t v6 = 16;
      }
      v7 = *(Class *)((char *)&self->super.isa + v6);
    }
    else
    {
      v7 = 0;
    }
    return (id)[v7 valueForKey:a3];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

- (void)observeChangesForKey:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    observedKeys = self->_observedKeys;
    if (!observedKeys)
    {
      observedKeys = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      self->_observedKeys = observedKeys;
    }
    [(NSMutableSet *)observedKeys addObject:a3];
    os_unfair_lock_unlock(p_lock);
    int v7 = [a3 hasPrefix:@"AUVoiceIOClients"];
    uint64_t v8 = 8;
    if (v7) {
      uint64_t v8 = 16;
    }
    v9 = *(Class *)((char *)&self->super.isa + v8);
    [v9 addObserver:self forKeyPath:a3 options:3 context:0];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    self->_changingDefaultsMyself = 1;
    int v8 = [a4 hasPrefix:@"AUVoiceIOClients"];
    uint64_t v9 = 8;
    if (v8) {
      uint64_t v9 = 16;
    }
    [*(id *)((char *)&self->super.isa + v9) setObject:a3 forKey:a4];
    self->_changingDefaultsMyself = 0;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (FigCaptureProprietaryDefaults)initWithDefaultsChangedHandler:(id)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Need a non-nil defaultsChangedHandler" userInfo:0]);
  }
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureProprietaryDefaults;
  v4 = [(FigCaptureProprietaryDefaults *)&v6 init];
  if (v4)
  {
    v4->_videoUserDefaults = (NSUserDefaults *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.cameracapture"];
    v4->_audioUserDefaults = (NSUserDefaults *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.coreaudio"];
    v4->_defaultsChangedHandler = (id)[a3 copy];
    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

+ (void)initialize
{
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_msgSend((id)-[NSMutableSet allObjects](self->_observedKeys, "allObjects"), "copy");
  os_unfair_lock_unlock(p_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 hasPrefix:@"AUVoiceIOClients"]) {
          uint64_t v10 = 16;
        }
        else {
          uint64_t v10 = 8;
        }
        [*(id *)((char *)&self->super.isa + v10) removeObserver:self forKeyPath:v9 context:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v11.receiver = self;
  v11.super_class = (Class)FigCaptureProprietaryDefaults;
  [(FigCaptureProprietaryDefaults *)&v11 dealloc];
}

- (id)objectsForWildcardKey:(id)a3
{
  if (a3)
  {
    if (self)
    {
      int v5 = [a3 hasPrefix:@"AUVoiceIOClients"];
      uint64_t v6 = 8;
      if (v5) {
        uint64_t v6 = 16;
      }
      uint64_t v7 = *(Class *)((char *)&self->super.isa + v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v8 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    uint64_t v9 = (void *)[v7 dictionaryRepresentation];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__FigCaptureProprietaryDefaults_objectsForWildcardKey___block_invoke;
    v11[3] = &unk_1E5C26250;
    v11[4] = a3;
    v11[5] = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v11];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v8;
}

uint64_t __55__FigCaptureProprietaryDefaults_objectsForWildcardKey___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = fnmatch((const char *)[*(id *)(a1 + 32) UTF8String], (const char *)objc_msgSend(a2, "UTF8String"), 16);
  if (!result)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    return [v7 setObject:a3 forKeyedSubscript:a2];
  }
  return result;
}

- (id)setObject:(id)a3 forWildcardKey:(id)a4
{
  if (a4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    self->_changingDefaultsMyself = 1;
    int v8 = [a4 hasPrefix:@"AUVoiceIOClients"];
    uint64_t v9 = 8;
    if (v8) {
      uint64_t v9 = 16;
    }
    uint64_t v10 = *(Class *)((char *)&self->super.isa + v9);
    objc_super v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    long long v12 = (void *)[v10 dictionaryRepresentation];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__FigCaptureProprietaryDefaults_setObject_forWildcardKey___block_invoke;
    v14[3] = &unk_1E5C26278;
    v14[4] = a4;
    v14[5] = v10;
    v14[6] = a3;
    v14[7] = v11;
    [v12 enumerateKeysAndObjectsUsingBlock:v14];
    if (![v11 count] && (objc_msgSend(a4, "containsString:", @"*") & 1) == 0)
    {
      [v10 setObject:a3 forKey:a4];
      [v11 addObject:a4];
    }
    self->_changingDefaultsMyself = 0;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v11;
}

uint64_t __58__FigCaptureProprietaryDefaults_setObject_forWildcardKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = fnmatch((const char *)[*(id *)(a1 + 32) UTF8String], (const char *)objc_msgSend(a2, "UTF8String"), 16);
  if (!result)
  {
    [*(id *)(a1 + 40) setObject:*(void *)(a1 + 48) forKey:a2];
    int v5 = *(void **)(a1 + 56);
    return [v5 addObject:a2];
  }
  return result;
}

- (void)stopObservingChangesForKey:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    int v6 = [(NSMutableSet *)self->_observedKeys containsObject:a3];
    [(NSMutableSet *)self->_observedKeys removeObject:a3];
    os_unfair_lock_unlock(p_lock);
    if (v6)
    {
      int v7 = [a3 hasPrefix:@"AUVoiceIOClients"];
      uint64_t v8 = 8;
      if (v7) {
        uint64_t v8 = 16;
      }
      uint64_t v9 = *(Class *)((char *)&self->super.isa + v8);
      [v9 removeObserver:self forKeyPath:a3 context:0];
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (!self->_changingDefaultsMyself)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    int v10 = [(NSMutableSet *)self->_observedKeys containsObject:a3];
    os_unfair_lock_unlock(p_lock);
    if (v10)
    {
      [a5 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
      [a5 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
      objc_super v11 = (void (*)(void))*((void *)self->_defaultsChangedHandler + 2);
      v11();
    }
  }
}

- (void)sendNotificationOfNewTransientValue:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    (*((void (**)(void))self->_defaultsChangedHandler + 2))();
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

@end