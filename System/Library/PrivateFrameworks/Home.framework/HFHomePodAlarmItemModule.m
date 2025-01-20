@interface HFHomePodAlarmItemModule
- (HFHomePodAlarmItemModule)initWithItemUpdater:(id)a3 mediaProfileContainer:(id)a4;
- (HFMediaProfileContainer)mediaProfileContainer;
- (NSSet)itemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)mobileTimerAdapterForAlarmItem:(id)a3;
- (id)mobileTimerAdapterForMediaProfile:(id)a3;
- (void)mobileTimerAdapter:(id)a3 didUpdateAlarms:(id)a4;
- (void)registerForExternalUpdates;
- (void)unregisterForExternalUpdates;
@end

@implementation HFHomePodAlarmItemModule

- (HFHomePodAlarmItemModule)initWithItemUpdater:(id)a3 mediaProfileContainer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HFHomePodAlarmItemModule.m", 28, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)HFHomePodAlarmItemModule;
  v9 = [(HFItemModule *)&v17 initWithItemUpdater:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaProfileContainer, a4);
    v11 = [MEMORY[0x263EFF9C0] set];
    v12 = [[HFHomePodAlarmItemProvider alloc] initWithMediaProfileContainer:v8];
    uint64_t v13 = [MEMORY[0x263EFFA08] setWithObject:v12];
    itemProviders = v10->_itemProviders;
    v10->_itemProviders = (NSSet *)v13;
  }
  return v10;
}

- (id)mobileTimerAdapterForAlarmItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(HFHomePodAlarmItemModule *)self itemProviders];
  v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 items];
        char v11 = [v10 containsObject:v4];

        if (v11)
        {
          v6 = [v9 mobileTimerAdapter];
          goto LABEL_11;
        }
      }
      v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)mobileTimerAdapterForMediaProfile:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(HFHomePodAlarmItemModule *)self itemProviders];
  v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 mediaProfileContainer];
        char v11 = [v10 mediaProfiles];
        char v12 = [v11 containsObject:v4];

        if (v12)
        {
          v6 = [v9 mobileTimerAdapter];
          goto LABEL_11;
        }
      }
      v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v43 = a3;
  v3 = [(HFHomePodAlarmItemModule *)self mediaProfileContainer];
  id v4 = [v3 settings];
  char v5 = [v4 isControllable];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v7 = objc_msgSend(v3, "hf_backingAccessory");
    id v8 = objc_msgSend(v7, "hf_siriEndpointProfile");
    BOOL v6 = v8 == 0;
  }
  uint64_t v9 = [v43 count];
  v10 = (void *)MEMORY[0x263EFFA68];
  if (v9 && !v6)
  {
    v39 = v3;
    v10 = objc_opt_new();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = [(HFHomePodAlarmItemModule *)self itemProviders];
    uint64_t v44 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (!v44) {
      goto LABEL_29;
    }
    uint64_t v41 = *(void *)v52;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v52 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = v11;
        char v12 = *(void **)(*((void *)&v51 + 1) + 8 * v11);
        long long v13 = [(HFHomePodAlarmItemModule *)self itemProviders];
        unint64_t v14 = [v13 count];

        v46 = v12;
        long long v15 = [v12 items];
        long long v16 = objc_msgSend(v15, "na_setByIntersectingWithSet:", v43);
        long long v17 = [v16 allObjects];
        uint64_t v18 = [v17 sortedArrayUsingSelector:sel_compare_];

        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          BOOL v22 = v14 > 1;
          uint64_t v23 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v48 != v23) {
                objc_enumerationMutation(v19);
              }
              v25 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              uint64_t v26 = objc_opt_class();
              id v27 = v25;
              if (!v27) {
                goto LABEL_22;
              }
              if (objc_opt_isKindOfClass()) {
                v28 = v27;
              }
              else {
                v28 = 0;
              }
              v29 = v27;
              if (!v28)
              {
                v30 = [MEMORY[0x263F08690] currentHandler];
                v31 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
                [v30 handleFailureInFunction:v31, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v26, objc_opt_class() file lineNumber description];

LABEL_22:
                v29 = 0;
              }

              v32 = [HFMutableItemSection alloc];
              v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lu", objc_msgSend(v29, "hash"));
              v34 = [(HFItemSection *)v32 initWithIdentifier:v33];

              if (v22)
              {
                v35 = [v46 mediaProfileContainer];
                v36 = objc_msgSend(v35, "hf_displayName");
                [(HFItemSection *)v34 setHeaderTitle:v36];
              }
              id v55 = v27;
              v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v55 count:1];
              [(HFItemSection *)v34 setItems:v37];

              [v10 addObject:v34];
              BOOL v22 = 0;
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v56 count:16];
            BOOL v22 = 0;
          }
          while (v21);
        }

        uint64_t v11 = v45 + 1;
      }
      while (v45 + 1 != v44);
      uint64_t v44 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (!v44)
      {
LABEL_29:

        v3 = v39;
        break;
      }
    }
  }

  return v10;
}

- (void)mobileTimerAdapter:(id)a3 didUpdateAlarms:(id)a4
{
  id v9 = [(HFItemModule *)self itemUpdater];
  BOOL v6 = [(HFHomePodAlarmItemModule *)self itemProviders];
  uint64_t v7 = +[HFItemUpdateRequest requestToReloadItemProviders:v6 senderSelector:a2];
  id v8 = (id)[v9 performItemUpdateRequest:v7];
}

- (void)registerForExternalUpdates
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(HFHomePodAlarmItemModule *)self itemProviders];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) mobileTimerAdapter];
        [v8 addObserver:self];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)unregisterForExternalUpdates
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(HFHomePodAlarmItemModule *)self itemProviders];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) mobileTimerAdapter];
        [v8 removeObserver:self];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end