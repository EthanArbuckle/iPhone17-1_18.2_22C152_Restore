@interface AVAudioUnitComponentManager
+ (AVAudioUnitComponentManager)allocWithZone:(_NSZone *)a3;
+ (AVAudioUnitComponentManager)sharedAudioUnitComponentManager;
+ (void)privateAllocInitSingleton;
- (AVAudioUnitComponentManager)init;
- (NSArray)componentsMatchingDescription:(AudioComponentDescription *)desc;
- (NSArray)componentsMatchingPredicate:(NSPredicate *)predicate;
- (NSArray)componentsPassingTest:(void *)testHandler;
- (NSArray)standardLocalizedTagNames;
- (NSArray)tagNames;
- (void)localeChanged:(id)a3;
- (void)registrationsChanged:(id)a3;
@end

@implementation AVAudioUnitComponentManager

+ (AVAudioUnitComponentManager)allocWithZone:(_NSZone *)a3
{
  return (AVAudioUnitComponentManager *)objc_claimAutoreleasedReturnValue();
}

+ (void)privateAllocInitSingleton
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___AVAudioUnitComponentManager;
  uint64_t v2 = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "init");
  v3 = (void *)gAVAudioUnitComponentManager;
  gAVAudioUnitComponentManager = v2;
}

+ (AVAudioUnitComponentManager)sharedAudioUnitComponentManager
{
  pthread_once(&gAVAudioUnitComponentManagerInitOnce, (void (*)(void))AVAudioUnitComponentManagerInitOnce);
  uint64_t v2 = (void *)gAVAudioUnitComponentManager;

  return (AVAudioUnitComponentManager *)v2;
}

- (NSArray)componentsMatchingDescription:(AudioComponentDescription *)desc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = (std::mutex *)((char *)self->_impl + 32);
  std::mutex::lock(v5);
  id v6 = *((id *)self->_impl + 1);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v15 = *(_OWORD *)&desc->componentType;
        UInt32 componentFlagsMask = desc->componentFlagsMask;
        if ([v12 isComponentDescriptionMatch:&v15]) {
          [v7 addObject:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v13 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];

  std::mutex::unlock(v5);

  return (NSArray *)v13;
}

- (NSArray)componentsPassingTest:(void *)testHandler
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v4 = testHandler;
  v5 = (std::mutex *)((char *)self->_impl + 32);
  std::mutex::lock(v5);
  id v6 = *((id *)self->_impl + 1);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v19 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v8);
      }
      uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
      if (v4[2](v4, v12, &v19)) {
        objc_msgSend(v7, "addObject:", v12, (void)v15);
      }
      if (v19) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v13 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];

  std::mutex::unlock(v5);

  return (NSArray *)v13;
}

- (NSArray)componentsMatchingPredicate:(NSPredicate *)predicate
{
  objc_super v4 = predicate;
  v5 = (std::mutex *)((char *)self->_impl + 32);
  std::mutex::lock(v5);
  id v6 = [*((id *)self->_impl + 1) filteredArrayUsingPredicate:v4];
  std::mutex::unlock(v5);

  return (NSArray *)v6;
}

- (NSArray)standardLocalizedTagNames
{
  impl = self->_impl;
  v3 = (void *)*((void *)impl + 3);
  if (!v3)
  {
    objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&standardTagNamesKeys count:22];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = (void *)*((void *)impl + 3);
    *((void *)impl + 3) = v5;

    id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.audio.units.Components"];
    if (v7)
    {
      for (unint64_t i = 0; [v4 count] > i; ++i)
      {
        uint64_t v9 = [v4 objectAtIndex:i];
        uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_1EEFA9548 table:@"AudioUnitTags"];
        [*((id *)impl + 3) addObject:v10];
      }
    }

    v3 = (void *)*((void *)impl + 3);
  }
  id v11 = v3;
  uint64_t v12 = (void *)[v11 copy];

  return (NSArray *)v12;
}

- (NSArray)tagNames
{
  uint64_t v2 = (void *)[*((id *)self->_impl + 2) copy];

  return (NSArray *)v2;
}

- (void)registrationsChanged:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  impl = (char *)self->_impl;
  objc_super v4 = [MEMORY[0x1E4F1CA48] arrayWithArray:*((void *)impl + 1)];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v23 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  memset(&inDesc, 0, sizeof(inDesc));
  for (unint64_t i = AudioComponentFindNext(0, &inDesc); i; unint64_t i = AudioComponentFindNext(i, &inDesc))
  {
    memset(&outDesc, 0, sizeof(outDesc));
    AudioComponentGetDescription(i, &outDesc);
    if (HIWORD(outDesc.componentType) == 24949)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v32;
        while (2)
        {
          for (uint64_t j = 0; j != v8; ++j)
          {
            if (*(void *)v32 != v9) {
              objc_enumerationMutation(v7);
            }
            id v11 = *(void **)(*((void *)&v31 + 1) + 8 * j);
            if ((OpaqueAudioComponent *)[v11 audioComponent] == i)
            {
              if (v11)
              {
                [v11 audioComponentDescription];
              }
              else
              {
                long long v28 = 0uLL;
                int v29 = 0;
              }
              *(_OWORD *)&v30.componentType = v28;
              long long v27 = *(_OWORD *)&outDesc.componentType;
              if ((void)v28 == *(void *)&outDesc.componentType
                && DWORD2(v28) == (unint64_t)outDesc.componentManufacturer)
              {
                [v23 removeObject:v11];
                v14 = v11;

                goto LABEL_20;
              }
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      v13 = [AVAudioUnitComponent alloc];
      AudioComponentDescription v30 = outDesc;
      v14 = [(AVAudioUnitComponent *)v13 initWithComponentDescription:&v30 withAVAUManagerImpl:impl];
      [v22 addObject:v14];
LABEL_20:
      long long v15 = (void *)MEMORY[0x1E4F1CAD0];
      long long v16 = [(AVAudioUnitComponent *)v14 allTagNames];
      long long v17 = [v15 setWithArray:v16];

      [v5 unionSet:v17];
    }
  }
  if ([v22 count] || objc_msgSend(v23, "count"))
  {
    [v4 removeObjectsInArray:v23];
    [v4 addObjectsFromArray:v22];
    long long v18 = (std::mutex *)(impl + 32);
    std::mutex::lock((std::mutex *)(impl + 32));
    [*((id *)impl + 1) removeAllObjects];
    [*((id *)impl + 1) addObjectsFromArray:v4];
    [*((id *)impl + 2) removeAllObjects];
    char v19 = (void *)*((void *)impl + 2);
    long long v20 = [v5 allObjects];
    [v19 addObjectsFromArray:v20];

    std::mutex::unlock(v18);
  }

  id v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v24 postNotificationName:@"AVAudioUnitComponentManagerRegistrationsChangedNotification" object:self];
}

- (void)localeChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (std::mutex *)((char *)self->_impl + 32);
  std::mutex::lock(v4);
  id v5 = *((id *)self->_impl + 1);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "localeChanged", (void)v10);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  std::mutex::unlock(v4);
}

- (AVAudioUnitComponentManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVAudioUnitComponentManager;
  if ([(AVAudioUnitComponentManager *)&v3 init]) {
    operator new();
  }
  return 0;
}

@end