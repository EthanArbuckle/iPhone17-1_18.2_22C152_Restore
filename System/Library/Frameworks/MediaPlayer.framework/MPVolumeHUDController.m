@interface MPVolumeHUDController
+ (MPVolumeHUDController)sharedInstance;
- (MPVolumeHUDController)init;
- (id)mainContext;
- (void)_addCategory:(id)a3;
- (void)_updateVisibility;
- (void)_updateVisibilityForVolumeDisplays:(id)a3 inWindowScene:(id)a4;
- (void)addVolumeDisplay:(id)a3;
- (void)removeVolumeDisplay:(id)a3;
- (void)setNeedsUpdate;
@end

@implementation MPVolumeHUDController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_displays, 0);

  objc_storeStrong((id *)&self->_scenes, 0);
}

- (void)_updateVisibilityForVolumeDisplays:(id)a3 inWindowScene:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v6 = a4;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obj = self->_categories;
  uint64_t v34 = [(NSMutableSet *)obj countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v44;
    *(void *)&long long v7 = 67109634;
    long long v29 = v7;
    id v31 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v10 = v33;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v54 count:16];
        if (!v11)
        {
          uint64_t v18 = 1;
          goto LABEL_23;
        }
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v40;
        while (2)
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v40 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v39 + 1) + 8 * v14);
            if (objc_opt_respondsToSelector())
            {
              if (([v15 isOnScreenForVolumeDisplay] & 1) == 0) {
                goto LABEL_17;
              }
            }
            else if ((objc_opt_respondsToSelector() & 1) != 0 && ![v15 isOnScreen])
            {
              goto LABEL_17;
            }
            v16 = objc_msgSend(v15, "volumeAudioCategory", v29);
            char v17 = [v9 isEqualToString:v16];

            if (v17)
            {
              uint64_t v18 = 0;
              goto LABEL_21;
            }
LABEL_17:
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:v54 count:16];
          if (v12) {
            continue;
          }
          break;
        }
        uint64_t v18 = 1;
LABEL_21:
        id v6 = v31;
LABEL_23:

        if (v6)
        {
          [v6 _setSystemVolumeHUDEnabled:v18 forAudioCategory:v9];
        }
        else
        {
          v19 = MPUIApplication();
          char v20 = [v19 _appAdoptsUISceneLifecycle];

          if (v20)
          {
            v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v22 = v10;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v53 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v36;
              do
              {
                uint64_t v26 = 0;
                do
                {
                  if (*(void *)v36 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  [v21 addObject:objc_opt_class()];
                  ++v26;
                }
                while (v24 != v26);
                uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v53 count:16];
              }
              while (v24);
            }

            v27 = os_log_create("com.apple.amp.mediaplayer", "Volume");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v29;
              int v48 = v18;
              __int16 v49 = 2114;
              v50 = v9;
              __int16 v51 = 2114;
              v52 = v21;
              _os_log_impl(&dword_1952E8000, v27, OS_LOG_TYPE_ERROR, "Attempting to setSystemVolumeHUDEnabled for application that supports UIScene lifecycle (enabled: %{BOOL}u | category: %{public}@ | volumeDisplays: %{public}@)", buf, 0x1Cu);
            }
          }
          else
          {
            v28 = MPUIApplication();
            [v28 setSystemVolumeHUDEnabled:v18 forAudioCategory:v9];
          }
        }
        ++v8;
      }
      while (v8 != v34);
      uint64_t v34 = [(NSMutableSet *)obj countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v34);
  }
}

- (void)_updateVisibility
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v3 = (void *)MEMORY[0x1E4F1CA80];
  v4 = [(NSHashTable *)self->_scenes allObjects];
  uint64_t v34 = [v3 setWithArray:v4];

  id v33 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v5 = [MEMORY[0x1E4F1CA48] array];
  int v6 = [(id)*MEMORY[0x1E4FB2608] _appAdoptsUISceneLifecycle];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v7 = self->_displays;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
  uint64_t v32 = v5;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "volumeAudioCategory", v32);
        [(MPVolumeHUDController *)self _addCategory:v13];

        if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v14 = [v12 windowSceneForVolumeDisplay];
          if (v14)
          {
            v15 = [v33 objectForKey:v14];

            if (!v15)
            {
              v16 = [MEMORY[0x1E4F1CA48] array];
              [v33 setObject:v16 forKey:v14];
            }
            char v17 = [v33 objectForKey:v14];
            [v17 addObject:v12];

            [v34 removeObject:v14];
            v5 = v32;
          }
        }
        else
        {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v9);
  }

  if (v6)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v18 = v33;
    v19 = [v33 keyEnumerator];
    char v20 = [v19 allObjects];

    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v39 + 1) + 8 * j);
          uint64_t v26 = objc_msgSend(v33, "objectForKey:", v25, v32);
          [(MPVolumeHUDController *)self _updateVisibilityForVolumeDisplays:v26 inWindowScene:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v22);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v27 = v34;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v36 != v30) {
            objc_enumerationMutation(v27);
          }
          -[MPVolumeHUDController _updateVisibilityForVolumeDisplays:inWindowScene:](self, "_updateVisibilityForVolumeDisplays:inWindowScene:", 0, *(void *)(*((void *)&v35 + 1) + 8 * k), v32);
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v29);
    }

    v5 = v32;
  }
  else
  {
    [(MPVolumeHUDController *)self _updateVisibilityForVolumeDisplays:v5 inWindowScene:0];
    uint64_t v18 = v33;
  }
}

- (void)_addCategory:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    [(NSMutableSet *)self->_categories addObject:v4];
  }
}

- (id)mainContext
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)setNeedsUpdate
{
  if (!self->_needsUpdate)
  {
    self->_needsUpdate = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__MPVolumeHUDController_setNeedsUpdate__block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __39__MPVolumeHUDController_setNeedsUpdate__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  return [*(id *)(a1 + 32) _updateVisibility];
}

- (void)removeVolumeDisplay:(id)a3
{
  id v8 = a3;
  id v4 = [v8 volumeAudioCategory];
  [(MPVolumeHUDController *)self _addCategory:v4];

  if (objc_opt_respondsToSelector())
  {
    v5 = [v8 windowSceneForVolumeDisplay];

    if (v5)
    {
      scenes = self->_scenes;
      long long v7 = [v8 windowSceneForVolumeDisplay];
      [(NSHashTable *)scenes addObject:v7];
    }
  }
  [(NSMutableSet *)self->_displays removeObject:v8];
  [(MPVolumeHUDController *)self setNeedsUpdate];
}

- (void)addVolumeDisplay:(id)a3
{
  id v8 = a3;
  id v4 = [v8 volumeAudioCategory];
  [(MPVolumeHUDController *)self _addCategory:v4];

  if (objc_opt_respondsToSelector())
  {
    v5 = [v8 windowSceneForVolumeDisplay];

    if (v5)
    {
      scenes = self->_scenes;
      long long v7 = [v8 windowSceneForVolumeDisplay];
      [(NSHashTable *)scenes addObject:v7];
    }
  }
  [(NSMutableSet *)self->_displays addObject:v8];
  [(MPVolumeHUDController *)self setNeedsUpdate];
}

- (MPVolumeHUDController)init
{
  v10.receiver = self;
  v10.super_class = (Class)MPVolumeHUDController;
  v2 = [(MPVolumeHUDController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    scenes = v2->_scenes;
    v2->_scenes = (NSHashTable *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    displays = v2->_displays;
    v2->_displays = v5;

    long long v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    categories = v2->_categories;
    v2->_categories = v7;
  }
  return v2;
}

+ (MPVolumeHUDController)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_30302);
  }
  v2 = (void *)sharedInstance_instance;

  return (MPVolumeHUDController *)v2;
}

void __39__MPVolumeHUDController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MPVolumeHUDController);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;
}

@end