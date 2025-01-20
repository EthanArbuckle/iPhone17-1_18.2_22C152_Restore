@interface FBSSceneObserver
- (BOOL)isEqual:(id)a3;
- (FBSSceneObserver)initWithComponent:(id)a3;
- (FBSSceneObserver)initWithObserver:(id)a3;
- (id)_matchesActions:(id *)a1;
- (id)component;
- (id)observer;
- (id)scene:(id)a3 handleActions:(id)a4;
- (id)scene:(id)a3 handlePrivateActions:(id)a4;
- (uint64_t)_matchesClientDiff:(uint64_t)a1;
- (uint64_t)_matchesDiff:(uint64_t)a1;
- (unint64_t)hash;
- (void)actionClasses:(id)a3;
- (void)actionHandler:(id)a3;
- (void)actions:(Class)a3;
- (void)clientSettingNames:(id)a3;
- (void)clientSettings:(SEL)a3;
- (void)clientUpdateHandler:(id)a3;
- (void)invalidate;
- (void)invalidationHandler:(id)a3;
- (void)scene:(id)a3 didUpdateClientSettings:(id)a4;
- (void)scene:(id)a3 didUpdateHostHandle:(id)a4;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
- (void)sceneWillInvalidate:(id)a3;
- (void)settingNames:(id)a3;
- (void)settings:(SEL)a3;
- (void)updateHandler:(id)a3;
@end

@implementation FBSSceneObserver

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  v7 = [v6 settingsDiff];
  int v8 = -[FBSSceneObserver _matchesDiff:]((uint64_t)self, v7);

  if (v8)
  {
    settingsHandler = (void (**)(id, id, id))self->_settingsHandler;
    if (settingsHandler)
    {
      settingsHandler[2](settingsHandler, v16, v6);
    }
    else if (self->_respondsToSettings)
    {
      v10 = [(FBSSceneObserver *)self observer];
      [v10 scene:v16 didUpdateSettings:v6];
    }
  }
  v11 = [v6 transitionContext];
  v12 = [v11 actions];
  if ([v12 count])
  {
    v13 = [v11 actions];
    v14 = [(FBSSceneObserver *)self scene:v16 handleActions:v13];

    if ([v14 count])
    {
      v15 = (void *)[v12 mutableCopy];
      [v15 minusSet:v14];
      [v11 setActions:v15];
    }
  }
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [v6 settingsDiff];
  int v8 = -[FBSSceneObserver _matchesClientDiff:]((uint64_t)self, v7);

  if (v8)
  {
    clintSettingsHandler = (void (**)(id, id, id))self->_clintSettingsHandler;
    if (clintSettingsHandler)
    {
      clintSettingsHandler[2](clintSettingsHandler, v11, v6);
    }
    else if (self->_respondsToClientSettings)
    {
      v10 = [(FBSSceneObserver *)self observer];
      [v10 scene:v11 didUpdateClientSettings:v6];
    }
  }
}

- (uint64_t)_matchesClientDiff:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && (*(void *)(a1 + 64) || *(unsigned char *)(a1 + 90)))
  {
    v4 = *(void **)(a1 + 40);
    if (v4)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v11;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v5);
            }
            if (-[FBSSettingsDiff _containsSetting:](v3, *(void **)(*((void *)&v10 + 1) + 8 * i)))
            {
              uint64_t v6 = 1;
              goto LABEL_15;
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)_matchesDiff:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1 && (*(void *)(a1 + 56) || *(unsigned char *)(a1 + 89)))
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v11;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v5);
            }
            if (-[FBSSettingsDiff _containsSetting:](v3, *(void **)(*((void *)&v10 + 1) + 8 * i)))
            {
              uint64_t v6 = 1;
              goto LABEL_15;
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return WeakRetained;
}

- (id)component
{
  return self->_component;
}

- (FBSSceneObserver)initWithComponent:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(FBSSceneObserver *)self initWithObserver:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_component, a3);
    v7->_respondsToPrivateActions = objc_opt_respondsToSelector() & 1;
  }

  return v7;
}

- (FBSSceneObserver)initWithObserver:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSceneObserver initWithObserver:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  id v5 = v4;
  uint64_t v6 = [(FBSSceneObserver *)self init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_observer, v5);
    v7->_observerAddress = (unint64_t)v5;
    v7->_respondsToHostHandle = objc_opt_respondsToSelector() & 1;
    v7->_respondsToSettings = objc_opt_respondsToSelector() & 1;
    v7->_respondsToClientSettings = objc_opt_respondsToSelector() & 1;
    v7->_respondsToActions = objc_opt_respondsToSelector() & 1;
    v7->_respondsToInvalidate = objc_opt_respondsToSelector() & 1;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FBSSceneObserver *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class() && v4->_observerAddress == self->_observerAddress)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v4->_observer);
      id v7 = objc_loadWeakRetained((id *)&self->_observer);
      BOOL v8 = WeakRetained == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong(&self->_clintSettingsHandler, 0);
  objc_storeStrong(&self->_settingsHandler, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_clientSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_component, 0);

  objc_destroyWeak((id *)&self->_observer);
}

- (void)invalidate
{
  [(FBSSceneComponent *)self->_component invalidate];
  component = self->_component;
  self->_component = 0;

  objc_storeWeak((id *)&self->_observer, 0);
  id settingsHandler = self->_settingsHandler;
  self->_id settingsHandler = 0;

  id clintSettingsHandler = self->_clintSettingsHandler;
  self->_id clintSettingsHandler = 0;

  id actionHandler = self->_actionHandler;
  self->_id actionHandler = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  *(_DWORD *)&self->_respondsToSettings = 0;
}

- (id)_matchesActions:(id *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (a1[9] || *((unsigned char *)a1 + 91))
    {
      if (a1[6])
      {
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          id v7 = 0;
          uint64_t v8 = *(void *)v14;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v14 != v8) {
                objc_enumerationMutation(v4);
              }
              uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
              if ([a1[6] containsObject:objc_opt_class()])
              {
                if (!v7)
                {
                  id v7 = [MEMORY[0x1E4F1CA80] set];
                }
                [v7 addObject:v10];
              }
            }
            uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
          }
          while (v6);
        }
        else
        {
          id v7 = 0;
        }
        if ([v7 count]) {
          long long v11 = v7;
        }
        else {
          long long v11 = 0;
        }
        a1 = v11;
      }
      else
      {
        a1 = (id *)v3;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)scene:(id)a3 didUpdateHostHandle:(id)a4
{
  if (self->_respondsToHostHandle)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(FBSSceneObserver *)self observer];
    [v8 scene:v7 didUpdateHostHandle:v6];
  }
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v6 = a3;
  id v7 = -[FBSSceneObserver _matchesActions:]((id *)&self->super.isa, a4);
  if (![v7 count]) {
    goto LABEL_6;
  }
  id actionHandler = (void (**)(id, id, void *))self->_actionHandler;
  if (actionHandler)
  {
    v9 = actionHandler[2](actionHandler, v6, v7);
    goto LABEL_7;
  }
  if (self->_respondsToActions)
  {
    uint64_t v10 = [(FBSSceneObserver *)self observer];
    v9 = [v10 scene:v6 handleActions:v7];
  }
  else
  {
LABEL_6:
    v9 = 0;
  }
LABEL_7:

  return v9;
}

- (void)sceneWillInvalidate:(id)a3
{
  id v4 = a3;
  id invalidationHandler = (uint64_t (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    id v7 = v4;
    id invalidationHandler = (uint64_t (**)(void))invalidationHandler[2]();
  }
  else
  {
    if (!self->_respondsToInvalidate) {
      goto LABEL_6;
    }
    id v7 = v4;
    id v6 = [(FBSSceneObserver *)self observer];
    [v6 sceneWillInvalidate:v7];
  }
  id v4 = v7;
LABEL_6:

  MEMORY[0x1F41817F8](invalidationHandler, v4);
}

- (id)scene:(id)a3 handlePrivateActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  component = self->_component;
  if (component && self->_respondsToPrivateActions)
  {
    uint64_t v9 = [(FBSSceneComponent *)component handlePrivateActions:v7];
  }
  else
  {
    uint64_t v9 = [(FBSSceneObserver *)self scene:v6 handleActions:v7];
  }
  uint64_t v10 = (void *)v9;

  return v10;
}

- (void)settings:(SEL)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  if (a3)
  {
    uint64_t v9 = (SEL *)&v10;
    do
    {
      id v6 = NSStringFromSelector(a3);
      [v5 addObject:v6];

      id v7 = v9++;
      a3 = *v7;
    }
    while (*v7);
  }
  id v8 = [v5 allObjects];
  [(FBSSceneObserver *)self settingNames:v8];
}

- (void)clientSettings:(SEL)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  if (a3)
  {
    uint64_t v9 = (SEL *)&v10;
    do
    {
      id v6 = NSStringFromSelector(a3);
      [v5 addObject:v6];

      id v7 = v9++;
      a3 = *v7;
    }
    while (*v7);
  }
  id v8 = [v5 allObjects];
  [(FBSSceneObserver *)self clientSettingNames:v8];
}

- (void)actions:(Class)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  if (a3)
  {
    id v8 = (Class *)&v9;
    do
    {
      [v5 addObject:a3];
      id v6 = v8++;
      a3 = *v6;
    }
    while (*v6);
  }
  id v7 = [v5 allObjects];
  [(FBSSceneObserver *)self actionClasses:v7];
}

- (void)settingNames:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(NSString **)(*((void *)&v23 + 1) + 8 * i);
        SEL v12 = NSSelectorFromString(v11);
        if (!v12)
        {
          v19 = [NSString stringWithFormat:@"No known selector for setting name: %@", v11];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[FBSSceneObserver settingNames:]();
          }
          [v19 UTF8String];
          _bs_set_crash_log_message();
        }
        SEL v13 = v12;
        long long v14 = objc_opt_class();
        uint64_t v15 = FBSSettingForExtensionSelector(v14, v13);
        if (!v15)
        {
          v20 = NSString;
          v21 = NSStringFromSelector(v13);
          v22 = [v20 stringWithFormat:@"No known setting for selector: %@", v21];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[FBSSceneObserver settingNames:]();
          }
          [v22 UTF8String];
          _bs_set_crash_log_message();
        }
        long long v16 = (void *)v15;
        [v5 addObject:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    v17 = (NSSet *)[v5 copy];
    settings = self->_settings;
    self->_settings = v17;
  }
  else
  {
    settings = self->_settings;
    self->_settings = 0;
  }
}

- (void)clientSettingNames:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(NSString **)(*((void *)&v23 + 1) + 8 * i);
        SEL v12 = NSSelectorFromString(v11);
        if (!v12)
        {
          v19 = [NSString stringWithFormat:@"No known selector for setting name: %@", v11];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[FBSSceneObserver clientSettingNames:]();
          }
          [v19 UTF8String];
          _bs_set_crash_log_message();
        }
        SEL v13 = v12;
        long long v14 = objc_opt_class();
        uint64_t v15 = FBSSettingForExtensionSelector(v14, v13);
        if (!v15)
        {
          v20 = NSString;
          v21 = NSStringFromSelector(v13);
          v22 = [v20 stringWithFormat:@"No known setting for selector: %@", v21];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[FBSSceneObserver clientSettingNames:]();
          }
          [v22 UTF8String];
          _bs_set_crash_log_message();
        }
        long long v16 = (void *)v15;
        [v5 addObject:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    v17 = (NSSet *)[v5 copy];
    clientSettings = self->_clientSettings;
    self->_clientSettings = v17;
  }
  else
  {
    clientSettings = self->_clientSettings;
    self->_clientSettings = 0;
  }
}

- (void)actionClasses:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    id v4 = (NSSet *)[v6 copy];
    actions = self->_actions;
    self->_actions = v4;
  }
  else
  {
    actions = self->_actions;
    self->_actions = 0;
  }
}

- (void)updateHandler:(id)a3
{
  id v4 = (void *)[a3 copy];
  id settingsHandler = self->_settingsHandler;
  self->_id settingsHandler = v4;

  MEMORY[0x1F41817F8](v4, settingsHandler);
}

- (void)clientUpdateHandler:(id)a3
{
  id v4 = (void *)[a3 copy];
  id clintSettingsHandler = self->_clintSettingsHandler;
  self->_id clintSettingsHandler = v4;

  MEMORY[0x1F41817F8](v4, clintSettingsHandler);
}

- (void)actionHandler:(id)a3
{
  id v4 = (void *)[a3 copy];
  id actionHandler = self->_actionHandler;
  self->_id actionHandler = v4;

  MEMORY[0x1F41817F8](v4, actionHandler);
}

- (void)invalidationHandler:(id)a3
{
  id v4 = (void *)[a3 copy];
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = v4;

  MEMORY[0x1F41817F8](v4, invalidationHandler);
}

- (unint64_t)hash
{
  return self->_observerAddress;
}

- (void)initWithObserver:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)settingNames:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)settingNames:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)clientSettingNames:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)clientSettingNames:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end