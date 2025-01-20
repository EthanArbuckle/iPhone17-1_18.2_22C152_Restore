@interface HFMediaSystemBuilder
+ (Class)homeKitRepresentationClass;
- (BOOL)hasSetRoom;
- (BOOL)isCreatingMediaSystem;
- (BOOL)isFavorite;
- (BOOL)shouldAllowAddingAccessory:(id)a3;
- (BOOL)showInHomeDashboard;
- (BOOL)stereoPairVersionMatchesForAccessory:(id)a3;
- (BOOL)supportsFavoriting;
- (BOOL)swapRoles;
- (HFAppleMusicAccountArbitrator)accountArbitrator;
- (HFIconDescriptor)iconDescriptor;
- (HFMediaSystemBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (HFNamingComponents)namingComponent;
- (HFRoomBuilder)room;
- (HFRoomBuilder)roomBuilder;
- (HMAccessory)firstSetupSourceAccessory;
- (HMMediaSystemBuilder)homeKitMediaSystemBuilder;
- (HMUser)preferredMediaUser;
- (NSSet)accessories;
- (NSString)description;
- (NSString)name;
- (NSString)originalName;
- (id)_arbitrateMusicAccount;
- (id)_commitChangesToMediaSystemBuilder;
- (id)_defaultName;
- (id)_firstUnpopulatedRole;
- (id)_rooms;
- (id)_setHomeTheaterSource:(id)a3 toDestination:(id)a4;
- (id)_updateAssistantAccessControl;
- (id)_updateAudioAnalysisSoundNotificationSettings;
- (id)_updatePreferredMediaUser;
- (id)_updateRoom;
- (id)_updateSiriLanguageOptionsManager;
- (id)_updateValueForContextType:(unint64_t)a3;
- (id)accessoryForRole:(id)a3;
- (id)commitItem;
- (id)mediaProfileContainers;
- (id)removeItemFromHome;
- (id)roleForAccessory:(id)a3;
- (void)addAccessory:(id)a3;
- (void)addAccessory:(id)a3 role:(id)a4;
- (void)removeAccessory:(id)a3;
- (void)setAccountArbitrator:(id)a3;
- (void)setHasSetRoom:(BOOL)a3;
- (void)setHomeKitMediaSystemBuilder:(id)a3;
- (void)setIconDescriptor:(id)a3;
- (void)setIsCreatingMediaSystem:(BOOL)a3;
- (void)setIsFavorite:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNamingComponent:(id)a3;
- (void)setPreferredMediaUser:(id)a3;
- (void)setRoom:(id)a3;
- (void)setRoomBuilder:(id)a3;
- (void)setShowInHomeDashboard:(BOOL)a3;
@end

@implementation HFMediaSystemBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFMediaSystemBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    v11 = v9;
    if (v10) {
      goto LABEL_8;
    }
    v12 = [MEMORY[0x263F08690] currentHandler];
    v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v12 handleFailureInFunction:v13, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
  }
  v11 = 0;
LABEL_8:

  v17.receiver = self;
  v17.super_class = (Class)HFMediaSystemBuilder;
  v14 = [(HFItemBuilder *)&v17 initWithExistingObject:v11 inHome:v7];

  if (v14)
  {
    v15 = +[HFNamingComponents namingComponentFromMediaSystem:v11];
    [(HFMediaSystemBuilder *)v14 setNamingComponent:v15];

    v14->_isCreatingMediaSystem = v11 == 0;
    v14->_showInHomeDashboard = objc_msgSend(v11, "hf_effectiveShowInHomeDashboard");
    v14->_isFavorite = objc_msgSend(v11, "hf_effectiveIsFavorite");
  }

  return v14;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = (id)[v3 appendSuper];
  v5 = [(HFMediaSystemBuilder *)self mediaSystem];
  id v6 = objc_msgSend(v5, "hf_prettyDescription");
  id v7 = (id)[v3 appendObject:v6 withName:@"existingMediaSystem"];

  uint64_t v8 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
  id v9 = [v8 components];
  id v10 = (id)[v3 appendObject:v9 withName:@"components"];

  v11 = [MEMORY[0x263F0E560] leftRole];
  v12 = [(HFMediaSystemBuilder *)self accessoryForRole:v11];
  id v13 = (id)[v3 appendObject:v12 withName:@"lefty" skipIfNil:1];

  v14 = [MEMORY[0x263F0E560] rightRole];
  v15 = [(HFMediaSystemBuilder *)self accessoryForRole:v14];
  id v16 = (id)[v3 appendObject:v15 withName:@"righty" skipIfNil:1];

  objc_super v17 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
  v18 = [v17 name];
  id v19 = (id)[v3 appendObject:v18 withName:@"name"];

  v20 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
  v21 = objc_msgSend(v20, "hf_prettyDescription");
  id v22 = (id)[v3 appendObject:v21 withName:@"room"];

  v23 = [v3 build];

  return (NSString *)v23;
}

- (HMMediaSystemBuilder)homeKitMediaSystemBuilder
{
  homeKitMediaSystemBuilder = self->_homeKitMediaSystemBuilder;
  if (!homeKitMediaSystemBuilder)
  {
    id v4 = [(HFMediaSystemBuilder *)self mediaSystem];

    id v5 = objc_alloc(MEMORY[0x263F0E540]);
    if (v4)
    {
      id v6 = [(HFMediaSystemBuilder *)self mediaSystem];
      id v7 = (HMMediaSystemBuilder *)[v5 initWithMediaSystem:v6];
    }
    else
    {
      id v6 = [(HFItemBuilder *)self home];
      id v7 = (HMMediaSystemBuilder *)[v5 initWithHome:v6];
    }
    uint64_t v8 = self->_homeKitMediaSystemBuilder;
    self->_homeKitMediaSystemBuilder = v7;

    homeKitMediaSystemBuilder = self->_homeKitMediaSystemBuilder;
  }
  return homeKitMediaSystemBuilder;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
  [v5 setConfiguredName:v4];
}

- (NSString)name
{
  v3 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
  id v4 = [v3 configuredName];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(HFMediaSystemBuilder *)self namingComponent];
    id v6 = [v7 name];
  }
  return (NSString *)v6;
}

- (void)addAccessory:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(HFMediaSystemBuilder *)self shouldAllowAddingAccessory:v5])
  {
    id v6 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_msgSend(v5, "hf_prettyDescription");
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Request to add an accessory that is not supported in this media system pair. We'll allow this to proceed (because there are no API restriction of what services can go into a pair; we just want to enforce restrictions in our "
        "UI). Accessory: %@",
        (uint8_t *)&v9,
        0xCu);
    }
  }
  uint64_t v8 = [(HFMediaSystemBuilder *)self _firstUnpopulatedRole];
  [(HFMediaSystemBuilder *)self addAccessory:v5 role:v8];

  if (!self->_firstSetupSourceAccessory && [(HFMediaSystemBuilder *)self isCreatingMediaSystem]) {
    objc_storeStrong((id *)&self->_firstSetupSourceAccessory, a3);
  }
}

- (void)addAccessory:(id)a3 role:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  int v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"HFMediaSystemBuilder.m", 150, @"Invalid parameter not satisfying: %@", @"accessory" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v32 = [MEMORY[0x263F08690] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"HFMediaSystemBuilder.m", 151, @"Invalid parameter not satisfying: %@", @"role" object file lineNumber description];

LABEL_3:
  if (![(HFMediaSystemBuilder *)self shouldAllowAddingAccessory:v7])
  {
    id v10 = HFLogForCategory(0x29uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_msgSend(v7, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      v34 = v11;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Request to add an accessory that is not supported in this media system pair. We'll allow this to proceed (because there are no API restriction of what services can go into a pair; we just want to enforce restrictions in our "
        "UI). Accessory: %@",
        buf,
        0xCu);
    }
  }
  v12 = [(HFMediaSystemBuilder *)self roleForAccessory:v7];
  char v13 = [v12 isEqual:v9];

  if ((v13 & 1) == 0)
  {
    [(HFMediaSystemBuilder *)self removeAccessory:v7];
    v14 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
    v15 = [v14 components];
    id v16 = (void *)[v15 mutableCopy];
    objc_super v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = (id)objc_opt_new();
    }
    id v19 = v18;

    id v20 = objc_alloc(MEMORY[0x263F0E550]);
    v21 = [v7 mediaProfile];
    id v22 = (void *)[v20 initWithMediaProfile:v21 role:v9];

    [v19 addObject:v22];
    v23 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
    [v23 setComponents:v19];

    v24 = [(HFMediaSystemBuilder *)self room];
    v25 = [v24 room];

    if (!v25)
    {
      v26 = [HFRoomBuilder alloc];
      v27 = [v7 room];
      v28 = [v7 home];
      v29 = [(HFRoomBuilder *)v26 initWithExistingObject:v27 inHome:v28];
      [(HFMediaSystemBuilder *)self setRoom:v29];
    }
    v30 = [(HFMediaSystemBuilder *)self mediaSystem];
    if (v30)
    {
    }
    else if (objc_msgSend(v7, "hf_showInHomeDashboard"))
    {
      -[HFMediaSystemBuilder setShowInHomeDashboard:](self, "setShowInHomeDashboard:", objc_msgSend(v7, "hf_showInHomeDashboard"));
      -[HFMediaSystemBuilder setIsFavorite:](self, "setIsFavorite:", objc_msgSend(v7, "hf_isFavorite"));
    }
  }
}

- (void)removeAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(HFMediaSystemBuilder *)self accessories];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
    id v8 = [v7 components];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __40__HFMediaSystemBuilder_removeAccessory___block_invoke;
    v11[3] = &unk_264092038;
    id v12 = v4;
    int v9 = objc_msgSend(v8, "na_filter:", v11);
    id v10 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
    [v10 setComponents:v9];
  }
}

uint64_t __40__HFMediaSystemBuilder_removeAccessory___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 mediaProfile];
  id v4 = [v3 accessory];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)] ^ 1;

  return v5;
}

- (id)accessoryForRole:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
  int v6 = [v5 components];

  id v7 = (void *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 role];
        if ([v11 isEqual:v4])
        {
          id v12 = [v10 mediaProfile];
          id v7 = [v12 accessory];

          goto LABEL_11;
        }
      }
      id v7 = (void *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)roleForAccessory:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
  int v6 = [v5 components];

  id v7 = (void *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 mediaProfile];
        id v12 = [v11 accessory];
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v7 = [v10 role];
          goto LABEL_11;
        }
      }
      id v7 = (void *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (NSSet)accessories
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
  id v4 = [v3 components];
  uint64_t v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_98);
  int v6 = [v2 setWithArray:v5];

  return (NSSet *)v6;
}

id __35__HFMediaSystemBuilder_accessories__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 mediaProfile];
  v3 = [v2 accessory];

  return v3;
}

- (id)mediaProfileContainers
{
  return 0;
}

- (id)removeItemFromHome
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = [(HFMediaSystemBuilder *)self mediaSystem];
  v3 = [v2 home];
  id v4 = HFLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v2;
    __int16 v22 = 2112;
    v23 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Removing mediasystem '%@' from home '%@'", buf, 0x16u);
  }

  if (v2)
  {
    uint64_t v5 = (void *)MEMORY[0x263F58190];
    if (v3)
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke;
      v18[3] = &unk_26408CD50;
      id v6 = v2;
      id v19 = v6;
      id v7 = [v5 futureWithErrorOnlyHandlerAdapterBlock:v18];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke_2;
      v15[3] = &unk_2640945A0;
      id v16 = v3;
      id v8 = v6;
      id v17 = v8;
      int v9 = [v7 flatMap:v15];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke_4;
      v13[3] = &unk_26408F1C0;
      id v14 = v8;
      id v10 = [v9 recover:v13];
    }
    else
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:descriptionFormat:", 30, @"Home not found for media system: %@", v2);
      id v10 = [v5 futureWithError:v11];
    }
  }
  else
  {
    id v10 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v10;
}

void __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 home];
  [v5 removeMediaSystem:*(void *)(a1 + 32) completionHandler:v4];
}

id __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke_2(uint64_t a1)
{
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  id v7 = __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke_3;
  id v8 = &unk_26408D8F0;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  [v2 dispatchHomeObserverMessage:&v5 sender:0];

  v3 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", v5, v6, v7, v8);

  return v3;
}

void __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 home:*(void *)(a1 + 32) didRemoveMediaSystem:*(void *)(a1 + 40)];
  }
}

id __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke_4(uint64_t a1, void *a2)
{
  v13[2] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 name];
  uint64_t v5 = (void *)v4;
  uint64_t v6 = &stru_26C081158;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  id v7 = v6;

  v12[0] = @"HFErrorHandlerOptionFailedItemName";
  v12[1] = @"HFErrorUserInfoOperationKey";
  v13[0] = v7;
  v13[1] = @"HFOperationRemoveMediaSystem";
  id v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v9 = objc_msgSend(v3, "hf_errorWithAddedUserInfo:", v8);

  id v10 = [MEMORY[0x263F58190] futureWithError:v9];

  return v10;
}

- (BOOL)shouldAllowAddingAccessory:(id)a3
{
  id v4 = a3;
  char v5 = objc_msgSend(v4, "hf_isHomePod");
  uint64_t v6 = [(HFItemBuilder *)self home];
  id v7 = objc_msgSend(v6, "hf_mediaSystemForAccessory:", v4);

  if (v7) {
    return 0;
  }
  else {
    return v5;
  }
}

- (BOOL)stereoPairVersionMatchesForAccessory:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!objc_msgSend(v5, "hf_isHomePod")) {
    goto LABEL_22;
  }
  uint64_t v6 = [v5 supportedStereoPairVersions];
  if (!v6)
  {
    long long v18 = HFLogForCategory(0);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_21:

LABEL_22:
      BOOL v17 = 0;
      goto LABEL_23;
    }
    id v19 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v28 = self;
    __int16 v29 = 2112;
    v30 = v19;
    __int16 v31 = 2112;
    id v32 = v5;
    _os_log_error_impl(&dword_20B986000, v18, OS_LOG_TYPE_ERROR, "%@:%@ Found no stereo pairing versions in accessory: %@", buf, 0x20u);
LABEL_25:

    goto LABEL_21;
  }
  uint64_t v7 = v6;
  id v8 = [(HFMediaSystemBuilder *)self accessories];
  if ([v8 count]) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = [(HFMediaSystemBuilder *)self accessories];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [*(id *)(*((void *)&v22 + 1) + 8 * i) supportedStereoPairVersions];
        if (v9) {
          uint64_t v16 = v9;
        }
        else {
          uint64_t v16 = -1;
        }
        uint64_t v9 = v15 & v16;
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  if (!v9)
  {
    long long v18 = HFLogForCategory(0);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    id v19 = NSStringFromSelector(a2);
    v21 = [(HFMediaSystemBuilder *)self accessories];
    *(_DWORD *)buf = 138412802;
    v28 = self;
    __int16 v29 = 2112;
    v30 = v19;
    __int16 v31 = 2112;
    id v32 = v21;
    _os_log_error_impl(&dword_20B986000, v18, OS_LOG_TYPE_ERROR, "%@:%@ Found no stereo pairing versions in accessories: %@", buf, 0x20u);

    goto LABEL_25;
  }
  BOOL v17 = (v9 & v7) != 0;
LABEL_23:

  return v17;
}

- (BOOL)swapRoles
{
  id v3 = [MEMORY[0x263F0E560] leftRole];
  id v4 = [(HFMediaSystemBuilder *)self accessoryForRole:v3];

  id v5 = [MEMORY[0x263F0E560] rightRole];
  uint64_t v6 = [(HFMediaSystemBuilder *)self accessoryForRole:v5];

  if (v4) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = !v7;
  if (!v7)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    id v14 = __33__HFMediaSystemBuilder_swapRoles__block_invoke;
    uint64_t v15 = &unk_264094AF8;
    id v16 = v6;
    id v17 = v4;
    uint64_t v9 = __33__HFMediaSystemBuilder_swapRoles__block_invoke((uint64_t)&v12);
    id v10 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
    [v10 setComponents:v9];
  }
  return v8;
}

id __33__HFMediaSystemBuilder_swapRoles__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  id v3 = objc_alloc(MEMORY[0x263F0E550]);
  id v4 = [*(id *)(a1 + 32) mediaProfile];
  id v5 = [MEMORY[0x263F0E560] leftRole];
  uint64_t v6 = (void *)[v3 initWithMediaProfile:v4 role:v5];
  [v2 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x263F0E550]);
  BOOL v8 = [*(id *)(a1 + 40) mediaProfile];
  uint64_t v9 = [MEMORY[0x263F0E560] rightRole];
  id v10 = (void *)[v7 initWithMediaProfile:v8 role:v9];
  [v2 addObject:v10];

  return v2;
}

- (id)commitItem
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = [(HFItemBuilder *)self home];
  char v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if (v5)
  {
    uint64_t v6 = [(HFMediaSystemBuilder *)self mediaSystem];
    id v7 = HFOperationEditMediaSystem;
    if (!v6) {
      id v7 = HFOperationAddMediaSystem;
    }
    BOOL v8 = *v7;

    long long v22 = [(HFMediaSystemBuilder *)self _updateRoom];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke;
    v33[3] = &unk_26408CDC8;
    v33[4] = self;
    v21 = [v22 flatMap:v33];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_2;
    v32[3] = &unk_26408E838;
    v32[4] = self;
    v32[5] = a2;
    uint64_t v9 = [v21 flatMap:v32];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_58;
    v31[3] = &unk_26408E838;
    v31[4] = self;
    v31[5] = a2;
    id v10 = [v9 flatMap:v31];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_60;
    v30[3] = &unk_26408E838;
    v30[4] = self;
    v30[5] = a2;
    uint64_t v11 = [v10 flatMap:v30];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_61;
    v29[3] = &unk_26408E838;
    v29[4] = self;
    v29[5] = a2;
    uint64_t v12 = [v11 flatMap:v29];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_62;
    v28[3] = &unk_26408E838;
    v28[4] = self;
    v28[5] = a2;
    uint64_t v13 = [v12 flatMap:v28];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_67;
    v27[3] = &unk_26408E838;
    v27[4] = self;
    v27[5] = a2;
    id v14 = [v13 flatMap:v27];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_68;
    v26[3] = &unk_26408E838;
    v26[4] = self;
    v26[5] = a2;
    uint64_t v15 = [v14 flatMap:v26];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_69;
    v23[3] = &unk_264094B20;
    long long v24 = v8;
    SEL v25 = a2;
    v23[4] = self;
    id v16 = v8;
    id v17 = [v15 recover:v23];
  }
  else
  {
    long long v18 = HFLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = self;
      __int16 v36 = 2112;
      v37 = v20;
      _os_log_error_impl(&dword_20B986000, v18, OS_LOG_TYPE_ERROR, "%@:%@ : Can't commit, user is NOT admin", buf, 0x16u);
    }
    id v17 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v17;
}

uint64_t __34__HFMediaSystemBuilder_commitItem__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _arbitrateMusicAccount];
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_debug_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEBUG, "%@:%@ : account arbitrator future succeeded... on to next", (uint8_t *)&v7, 0x16u);
  }
  id v3 = [*(id *)(a1 + 32) _commitChangesToMediaSystemBuilder];
  return v3;
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_58(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    __int16 v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_debug_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEBUG, "%@:%@ : commit changes future succeeded... on to next", buf, 0x16u);
  }
  id v3 = [*(id *)(a1 + 32) _updateValueForContextType:2];
  id v4 = objc_msgSend(*(id *)(a1 + 32), "_updateValueForContextType:", 3, v3);
  v10[1] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  uint64_t v6 = [MEMORY[0x263F58190] combineAllFutures:v5];

  return v6;
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_60(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_debug_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEBUG, "%@:%@ : update favorite future succeeded... on to next", (uint8_t *)&v7, 0x16u);
  }
  id v3 = [*(id *)(a1 + 32) _updateAssistantAccessControl];
  return v3;
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_61(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_debug_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEBUG, "%@:%@ : update assistant access control succeeded... on to next", (uint8_t *)&v7, 0x16u);
  }
  id v3 = [*(id *)(a1 + 32) _updatePreferredMediaUser];
  return v3;
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_62(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) accessories];
  int v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_66_2);

  id v4 = HFLogForCategory(0);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v12 = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ : update audio analysis notification settings... on to next", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v8 = [*(id *)(a1 + 32) _updateAudioAnalysisSoundNotificationSettings];
  }
  else
  {
    if (v5)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v12 = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ : audio analysis not supported. Skipping step... on to next", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v8 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v8;
}

uint64_t __34__HFMediaSystemBuilder_commitItem__block_invoke_2_63(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAudioAnalysisSupportedDevice");
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_67(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_debug_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEBUG, "%@:%@ : update preferred media user succeeded... on to next", (uint8_t *)&v7, 0x16u);
  }
  int v3 = [*(id *)(a1 + 32) _updateSiriLanguageOptionsManager];
  return v3;
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_68(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = HFLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    int v12 = v8;
    _os_log_debug_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEBUG, "%@:%@ : update siri language options manager succeeded... on to next", (uint8_t *)&v9, 0x16u);
  }
  int v3 = (void *)MEMORY[0x263F58190];
  id v4 = [*(id *)(a1 + 32) mediaSystem];
  uint64_t v5 = [v3 futureWithResult:v4];

  return v5;
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "%@:%@ : One of the commit futures failed with error %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v5 = (void *)MEMORY[0x263F58190];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = [*(id *)(a1 + 32) name];
  uint64_t v8 = objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", v6, v7);
  int v9 = [v5 futureWithError:v8];

  return v9;
}

- (id)_commitChangesToMediaSystemBuilder
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = [(HFMediaSystemBuilder *)self mediaSystem];
  BOOL v5 = v4 == 0;

  if (v4)
  {
    uint64_t v6 = [(HFMediaSystemBuilder *)self mediaSystem];
    uint64_t v7 = [v6 components];
    uint64_t v8 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
    int v9 = [v8 components];
    int v10 = [v7 isEqual:v9] ^ 1;

    uint64_t v11 = [(HFMediaSystemBuilder *)self mediaSystem];
    int v12 = [v11 configuredName];
    int v13 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
    uint64_t v14 = [v13 configuredName];
    id v15 = v12;
    id v16 = v14;
    if (v15 == v16)
    {
      int v17 = 0;
    }
    else if (v15)
    {
      int v17 = [v15 isEqual:v16] ^ 1;
    }
    else
    {
      int v17 = 1;
    }

    int v18 = v17;
  }
  else
  {
    int v18 = 0;
    int v10 = 0;
    int v17 = 1;
  }
  uint64_t v19 = HFLogForCategory(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v20 = v4 == 0;
    v21 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413314;
    v34 = self;
    __int16 v35 = 2112;
    __int16 v36 = v21;
    __int16 v37 = 1024;
    BOOL v38 = v20;
    __int16 v39 = 1024;
    int v40 = v10;
    __int16 v41 = 1024;
    int v42 = v18;
    _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "%@:%@ : Creating New Media System: %{BOOL}d / Existing Media System: updating components %{BOOL}d/ updating name %{BOOL}d", buf, 0x28u);
  }
  if ((v17 | v10))
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke;
    v32[3] = &unk_26408E4E0;
    v32[4] = self;
    long long v22 = [MEMORY[0x263F58190] futureWithBlock:v32];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_3;
    v30[3] = &unk_264094B70;
    v30[4] = self;
    v30[5] = a2;
    BOOL v31 = v5;
    long long v23 = [v22 addFailureBlock:v30];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_80;
    v26[3] = &unk_264094BC0;
    v26[4] = self;
    v26[5] = a2;
    char v27 = v10;
    char v28 = v18;
    BOOL v29 = v5;
    long long v24 = [v23 addSuccessBlock:v26];
  }
  else
  {
    long long v24 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v24;
}

void __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) homeKitMediaSystemBuilder];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_2;
  v7[3] = &unk_264094B48;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  [v4 commitWithCompletionHandler:v7];
}

void __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v7 = v5;
  if (a2)
  {
    [*(id *)(a1 + 32) finishWithError:a2];
  }
  else
  {
    [*(id *)(a1 + 40) setMediaSystem:v5];
    id v6 = (void *)[objc_alloc(MEMORY[0x263F0E540]) initWithMediaSystem:v7];
    [*(id *)(a1 + 40) setHomeKitMediaSystemBuilder:v6];

    [*(id *)(a1 + 32) finishWithResult:v7];
  }
}

void __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v10 = 138412802;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    int v13 = v6;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ : Commit Future FAILED with error %@", (uint8_t *)&v10, 0x20u);
  }
  id v7 = +[HFErrorHandler sharedHandler];
  id v8 = v7;
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v9 = @"HFMediaSystemBuilder.createMediaSystem";
  }
  else {
    uint64_t v9 = @"HFMediaSystemBuilder.updateMediaSystem";
  }
  [v7 logError:v3 operationDescription:v9];
}

void __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_80(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  id v7 = HFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412802;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ : Commit Future SUCCEED: %@", buf, 0x20u);
  }
  if (*(unsigned char *)(a1 + 48))
  {
    int v10 = +[HFHomeKitDispatcher sharedDispatcher];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_81;
    v15[3] = &unk_264094B98;
    void v15[4] = *(void *)(a1 + 32);
    [v10 dispatchMediaObjectObserverMessage:v15 sender:0];
  }
  if (*(unsigned char *)(a1 + 49))
  {
    uint64_t v11 = +[HFHomeKitDispatcher sharedDispatcher];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_2_85;
    v14[3] = &unk_264094B98;
    v14[4] = *(void *)(a1 + 32);
    [v11 dispatchMediaObjectObserverMessage:v14 sender:0];
  }
  if (*(unsigned char *)(a1 + 50))
  {
    __int16 v12 = +[HFHomeKitDispatcher sharedDispatcher];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_3_88;
    void v13[3] = &unk_26408CDA0;
    void v13[4] = *(void *)(a1 + 32);
    [v12 dispatchHomeObserverMessage:v13 sender:0];
  }
}

void __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_81(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) mediaSystem];
    id v4 = [*(id *)(a1 + 32) mediaSystem];
    uint64_t v5 = [v4 components];
    [v6 mediaSystem:v3 didUpdateComponents:v5];
  }
}

void __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_2_85(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) mediaSystem];
    id v4 = [*(id *)(a1 + 32) mediaSystem];
    uint64_t v5 = [v4 configuredName];
    [v6 mediaSystem:v3 didUpdateName:v5];
  }
}

void __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_3_88(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [*(id *)(a1 + 32) mediaSystem];
    [v5 home:v3 didAddMediaSystem:v4];
  }
}

- (id)_arbitrateMusicAccount
{
  v2 = [(HFMediaSystemBuilder *)self accountArbitrator];
  id v3 = v2;
  if (v2) {
    [v2 pendingArbitrationExecutionFuture];
  }
  else {
  id v4 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v4;
}

- (id)_setHomeTheaterSource:(id)a3 toDestination:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = objc_msgSend(a3, "hf_backingAccessory");
  id v7 = [v6 audioDestinationController];

  uint64_t v8 = HFLogForCategory(0x27uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    long long v24 = "-[HFMediaSystemBuilder _setHomeTheaterSource:toDestination:]";
    __int16 v25 = 2112;
    v26 = v7;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "(%s) setting Apple TV (%@) Home Theater destination to %@", buf, 0x20u);
  }

  uint64_t v9 = (void *)MEMORY[0x263F58190];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __60__HFMediaSystemBuilder__setHomeTheaterSource_toDestination___block_invoke;
  v20[3] = &unk_26408E218;
  id v10 = v7;
  id v21 = v10;
  id v11 = v5;
  id v22 = v11;
  __int16 v12 = [v9 futureWithErrorOnlyHandlerAdapterBlock:v20];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__HFMediaSystemBuilder__setHomeTheaterSource_toDestination___block_invoke_2;
  v17[3] = &unk_26408F238;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = [v12 addCompletionBlock:v17];

  return v15;
}

uint64_t __60__HFMediaSystemBuilder__setHomeTheaterSource_toDestination___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateDestination:*(void *)(a1 + 40) options:2 completionHandler:a2];
}

void __60__HFMediaSystemBuilder__setHomeTheaterSource_toDestination___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HFLogForCategory(0x27uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 136315906;
    uint64_t v9 = "-[HFMediaSystemBuilder _setHomeTheaterSource:toDestination:]_block_invoke_2";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "(%s) After setting Apple TV (%@) Home Theater destination, it is %@ (w/ error %@)", (uint8_t *)&v8, 0x2Au);
  }
}

- (id)_updateValueForContextType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      BOOL v5 = [(HFMediaSystemBuilder *)self isFavorite];
      goto LABEL_6;
    case 1uLL:
      NSLog(&cfstr_IncludeInStatu_0.isa, a2);
      goto LABEL_10;
    case 3uLL:
      BOOL v5 = [(HFMediaSystemBuilder *)self showInHomeDashboard];
LABEL_6:
      BOOL v6 = v5;
      goto LABEL_7;
    default:
      BOOL v6 = 0;
LABEL_7:
      uint64_t v7 = [(HFMediaSystemBuilder *)self mediaSystem];
      if (v6 == objc_msgSend(v7, "hf_isOnForContextType:", a3))
      {
        int v8 = [(HFMediaSystemBuilder *)self mediaSystem];
        int v9 = objc_msgSend(v8, "hf_hasSetForContextType:", a3);

        if (v9)
        {
LABEL_10:
          __int16 v10 = [MEMORY[0x263F58190] futureWithNoResult];
          goto LABEL_12;
        }
      }
      else
      {
      }
      uint64_t v11 = [(HFMediaSystemBuilder *)self mediaSystem];
      __int16 v12 = objc_msgSend(v11, "hf_updateValue:forContextType:", v6, a3);

      id v13 = (id)[v12 addFailureBlock:&__block_literal_global_97_0];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __51__HFMediaSystemBuilder__updateValueForContextType___block_invoke_2;
      v15[3] = &unk_26408CDC8;
      void v15[4] = self;
      __int16 v10 = [v12 flatMap:v15];

LABEL_12:
      return v10;
  }
}

void __51__HFMediaSystemBuilder__updateValueForContextType___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"HFMediaSystemBuilder.updateApplicationDataForContextType"];
}

id __51__HFMediaSystemBuilder__updateValueForContextType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v12 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [*(id *)(a1 + 32) accessories];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        int v9 = +[HFHomeKitDispatcher sharedDispatcher];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __51__HFMediaSystemBuilder__updateValueForContextType___block_invoke_3;
        void v13[3] = &unk_26408C938;
        void v13[4] = v8;
        [v9 dispatchAccessoryObserverMessage:v13 sender:0];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  __int16 v10 = [MEMORY[0x263F58190] futureWithResult:v12];

  return v10;
}

void __51__HFMediaSystemBuilder__updateValueForContextType___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accessoryDidUpdateApplicationData:*(void *)(a1 + 32)];
  }
}

- (id)_updateRoom
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (![(HFMediaSystemBuilder *)self hasSetRoom])
  {
    id v3 = [HFRoomBuilder alloc];
    uint64_t v4 = [(HFMediaSystemBuilder *)self mediaSystem];
    uint64_t v5 = objc_msgSend(v4, "hf_parentRoom");
    uint64_t v6 = [(HFMediaSystemBuilder *)self mediaSystem];
    uint64_t v7 = objc_msgSend(v6, "hf_home");
    uint64_t v8 = [(HFRoomBuilder *)v3 initWithExistingObject:v5 inHome:v7];
    [(HFMediaSystemBuilder *)self setRoomBuilder:v8];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v9 = [(HFMediaSystemBuilder *)self accessories];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
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
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = [(HFMediaSystemBuilder *)self room];
        [v15 addAccessory:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  long long v16 = [(HFMediaSystemBuilder *)self room];
  long long v17 = [v16 commitItem];

  return v17;
}

- (id)_updateAssistantAccessControl
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HFMediaSystemBuilder *)self isCreatingMediaSystem];
  id v4 = [MEMORY[0x263F58190] futureWithNoResult];
  if (v3)
  {
    uint64_t v5 = [(HFItemBuilder *)self home];
    uint64_t v6 = [v5 currentUser];
    uint64_t v7 = [(HFItemBuilder *)self home];
    uint64_t v8 = [v6 assistantAccessControlForHome:v7];
    int v9 = (void *)[v8 mutableCopy];

    uint64_t v10 = [v9 accessories];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      uint64_t v12 = [v9 accessories];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke;
      v32[3] = &unk_26408D968;
      v32[4] = self;
      id v13 = objc_msgSend(v12, "na_filter:", v32);

      uint64_t v14 = [v9 accessories];
      uint64_t v15 = [v14 count];
      uint64_t v16 = [v13 count];

      long long v17 = [(HFMediaSystemBuilder *)self accessories];
      uint64_t v18 = [v17 count];

      if (v15 == v16 || v15 - v16 != v18)
      {
        long long v19 = HFLogForCategory(0);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          long long v20 = [(HFMediaSystemBuilder *)self mediaSystem];
          *(_DWORD *)buf = 138412290;
          v34 = v20;
          _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "Mismatch between Personal Requests options for the media system %@", buf, 0xCu);
        }
        [v9 setAccessories:v13];
        long long v21 = (void *)MEMORY[0x263F58190];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke_104;
        v29[3] = &unk_26408E218;
        id v22 = v9;
        id v30 = v22;
        BOOL v31 = self;
        long long v23 = [v21 futureWithErrorOnlyHandlerAdapterBlock:v29];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke_105;
        v27[3] = &unk_2640911C8;
        v27[4] = self;
        id v28 = v22;
        uint64_t v24 = [v23 addSuccessBlock:v27];
        uint64_t v25 = [v24 addFailureBlock:&__block_literal_global_110];

        id v4 = (id)v25;
      }
      id v4 = v4;
    }
    else
    {
      id v4 = v4;
    }
  }
  return v4;
}

uint64_t __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 accessories];
  int v5 = [v4 containsObject:v3];

  return v5 ^ 1u;
}

void __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke_104(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) mediaSystem];
    int v11 = 138412546;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Updating Personal Requests %@ for media system %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v7 = [*(id *)(a1 + 40) home];
  uint64_t v8 = [v7 currentUser];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = [*(id *)(a1 + 40) home];
  [v8 updateAssistantAccessControl:v9 forHome:v10 completionHandler:v3];
}

void __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke_105(uint64_t a1)
{
  id v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke_2;
  v4[3] = &unk_2640921B0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 dispatchUserObserverMessage:v4 sender:0];
}

void __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [v3 currentUser];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) home];
    [v7 user:v4 didUpdateAssistantAccessControl:v5 forHome:v6];
  }
}

void __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HFErrorHandler sharedHandler];
  [v3 logError:v2 operationDescription:@"HFMediaSystemBuilder.updateAssistantAccessControl"];
}

- (id)_updateSiriLanguageOptionsManager
{
  if ([(HFMediaSystemBuilder *)self isCreatingMediaSystem])
  {
    id v3 = [(HFMediaSystemBuilder *)self mediaSystem];
    id v4 = (id)objc_msgSend(v3, "hf_siriLanguageOptionsManager");
  }
  uint64_t v5 = (void *)MEMORY[0x263F58190];
  return (id)[v5 futureWithNoResult];
}

- (id)_updatePreferredMediaUser
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(HFMediaSystemBuilder *)self isCreatingMediaSystem])
  {
    id v3 = objc_opt_new();
    id v4 = [(HFMediaSystemBuilder *)self preferredMediaUser];
    BOOL v5 = v4 != 0;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [(HFMediaSystemBuilder *)self accessories];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v11 supportsPreferredMediaUser])
          {
            v15[0] = MEMORY[0x263EF8330];
            v15[1] = 3221225472;
            v15[2] = __49__HFMediaSystemBuilder__updatePreferredMediaUser__block_invoke;
            v15[3] = &unk_264094BE8;
            void v15[5] = self;
            v15[6] = v5;
            void v15[4] = v11;
            uint64_t v12 = [MEMORY[0x263F58190] futureWithBlock:v15];
            [v3 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    __int16 v13 = [MEMORY[0x263F58190] combineAllFutures:v3];
  }
  else
  {
    __int16 v13 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v13;
}

void __49__HFMediaSystemBuilder__updatePreferredMediaUser__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  BOOL v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) preferredMediaUser];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__HFMediaSystemBuilder__updatePreferredMediaUser__block_invoke_2;
  v8[3] = &unk_26408C8C8;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v7 = v3;
  [v5 updatePreferredMediaUserSelectionType:v4 user:v6 completionHandler:v8];
}

void __49__HFMediaSystemBuilder__updatePreferredMediaUser__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory(0x35uLL);
  BOOL v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Failed to update primary user for accessory %@ with error %@", (uint8_t *)&v8, 0x16u);
    }

    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated primary user setting for accessory %@", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 40) finishWithNoResult];
  }
}

- (id)_updateAudioAnalysisSoundNotificationSettings
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (![(HFMediaSystemBuilder *)self isCreatingMediaSystem])
  {
    uint64_t v9 = [MEMORY[0x263F58190] futureWithNoResult];
    goto LABEL_29;
  }
  id v3 = [MEMORY[0x263F0E560] leftRole];
  uint64_t v4 = [(HFMediaSystemBuilder *)self accessoryForRole:v3];

  BOOL v5 = [MEMORY[0x263F0E560] rightRole];
  uint64_t v6 = [(HFMediaSystemBuilder *)self accessoryForRole:v5];

  if (v4) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    int v8 = HFLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33[0]) = 0;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Unable to find accessories in media system", (uint8_t *)v33, 2u);
    }

    uint64_t v9 = [MEMORY[0x263F58190] futureWithNoResult];
    goto LABEL_28;
  }
  id v10 = v4;
  if ([v10 conformsToProtocol:&unk_26C132C58]) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  id v14 = v6;
  if ([v14 conformsToProtocol:&unk_26C132C58]) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  long long v17 = objc_msgSend(v13, "hf_userNotificationSettings");
  long long v18 = (void *)[v17 mutableCopy];

  long long v19 = objc_msgSend(v16, "hf_userNotificationSettings");
  long long v20 = (void *)[v19 mutableCopy];

  int v21 = [v18 areNotificationsEnabled];
  int v22 = [v20 areNotificationsEnabled];
  long long v23 = HFLogForCategory(0);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v33[0] = 67109376;
    v33[1] = v21;
    __int16 v34 = 1024;
    int v35 = v22;
    _os_log_impl(&dword_20B986000, v23, OS_LOG_TYPE_DEFAULT, "Is left notification settings enabled? %{BOOL}d Is right notification settings enabled? %{BOOL}d", (uint8_t *)v33, 0xEu);
  }

  if (v21)
  {
    uint64_t v24 = [v18 notificationCondition];
    uint64_t v25 = +[HFConditionCollection conditionCollectionForPredicate:v24];

    v26 = [v25 predicate];
    [v20 setNotificationCondition:v26];

    [v20 setNotificationsEnabled:1];
    __int16 v27 = v16;
    id v28 = v20;
  }
  else
  {
    if (!v22)
    {
      BOOL v31 = HFLogForCategory(0);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v33[0]) = 0;
        _os_log_impl(&dword_20B986000, v31, OS_LOG_TYPE_DEFAULT, "Neither accessory has notification settings enabled. No action needed.", (uint8_t *)v33, 2u);
      }

      uint64_t v9 = [MEMORY[0x263F58190] futureWithNoResult];
      goto LABEL_27;
    }
    uint64_t v29 = [v20 notificationCondition];
    uint64_t v25 = +[HFConditionCollection conditionCollectionForPredicate:v29];

    id v30 = [v25 predicate];
    [v18 setNotificationCondition:v30];

    [v18 setNotificationsEnabled:1];
    __int16 v27 = v13;
    id v28 = v18;
  }
  uint64_t v9 = objc_msgSend(v27, "hf_updateUserNotificationSettings:", v28);

LABEL_27:
LABEL_28:

LABEL_29:
  return v9;
}

- (id)_rooms
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F08760] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(HFMediaSystemBuilder *)self accessories];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) room];
        objc_msgSend(v3, "na_safeAddObject:", v9);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSString)originalName
{
  id v3 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
  uint64_t v4 = [v3 configuredName];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(HFMediaSystemBuilder *)self _defaultName];
  }
  uint64_t v7 = v6;

  return (NSString *)v7;
}

- (id)_defaultName
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(HFMediaSystemBuilder *)self accessories];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "hf_isHomePod"))
        {
          id v10 = +[HFNamingComponents namingComponentFromAccessory:v8];
          uint64_t v9 = [v10 defaultName];

          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v3 = [(HFMediaSystemBuilder *)self mediaSystem];
  uint64_t v9 = [v3 name];
LABEL_11:

  return v9;
}

- (BOOL)supportsFavoriting
{
  return 1;
}

- (HFRoomBuilder)room
{
  roomBuilder = self->_roomBuilder;
  if (!roomBuilder)
  {
    uint64_t v4 = [HFRoomBuilder alloc];
    uint64_t v5 = [(HFItemBuilder *)self home];
    uint64_t v6 = [(HFItemBuilder *)v4 initWithHome:v5];
    uint64_t v7 = self->_roomBuilder;
    self->_roomBuilder = v6;

    roomBuilder = self->_roomBuilder;
  }
  return roomBuilder;
}

- (void)setRoom:(id)a3
{
  uint64_t v4 = (HFRoomBuilder *)a3;
  [(HFMediaSystemBuilder *)self setHasSetRoom:1];
  roomBuilder = self->_roomBuilder;
  self->_roomBuilder = v4;
}

- (id)_firstUnpopulatedRole
{
  v23[2] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [(HFMediaSystemBuilder *)self homeKitMediaSystemBuilder];
  uint64_t v4 = [v3 components];
  uint64_t v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_173_0);
  uint64_t v6 = [v2 orderedSetWithArray:v5];

  uint64_t v7 = (void *)MEMORY[0x263EFF9D8];
  int v8 = [MEMORY[0x263F0E560] leftRole];
  v23[0] = v8;
  uint64_t v9 = [MEMORY[0x263F0E560] rightRole];
  v23[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  long long v11 = [v7 orderedSetWithArray:v10];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v11;
  id v13 = (id)[v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (!objc_msgSend(v6, "containsObject:", v16, (void)v18))
        {
          id v13 = v16;
          goto LABEL_11;
        }
      }
      id v13 = (id)[v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v13;
}

uint64_t __45__HFMediaSystemBuilder__firstUnpopulatedRole__block_invoke(uint64_t a1, void *a2)
{
  return [a2 role];
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (BOOL)showInHomeDashboard
{
  return self->_showInHomeDashboard;
}

- (void)setShowInHomeDashboard:(BOOL)a3
{
  self->_showInHomeDashboard = a3;
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
}

- (HFAppleMusicAccountArbitrator)accountArbitrator
{
  return self->_accountArbitrator;
}

- (void)setAccountArbitrator:(id)a3
{
}

- (HMUser)preferredMediaUser
{
  return self->_preferredMediaUser;
}

- (void)setPreferredMediaUser:(id)a3
{
}

- (HMAccessory)firstSetupSourceAccessory
{
  return self->_firstSetupSourceAccessory;
}

- (void)setHomeKitMediaSystemBuilder:(id)a3
{
}

- (HFNamingComponents)namingComponent
{
  return self->_namingComponent;
}

- (void)setNamingComponent:(id)a3
{
}

- (HFRoomBuilder)roomBuilder
{
  return self->_roomBuilder;
}

- (void)setRoomBuilder:(id)a3
{
}

- (BOOL)hasSetRoom
{
  return self->_hasSetRoom;
}

- (void)setHasSetRoom:(BOOL)a3
{
  self->_hasSetRoom = a3;
}

- (BOOL)isCreatingMediaSystem
{
  return self->_isCreatingMediaSystem;
}

- (void)setIsCreatingMediaSystem:(BOOL)a3
{
  self->_isCreatingMediaSystem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomBuilder, 0);
  objc_storeStrong((id *)&self->_namingComponent, 0);
  objc_storeStrong((id *)&self->_homeKitMediaSystemBuilder, 0);
  objc_storeStrong((id *)&self->_firstSetupSourceAccessory, 0);
  objc_storeStrong((id *)&self->_preferredMediaUser, 0);
  objc_storeStrong((id *)&self->_accountArbitrator, 0);
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
}

@end