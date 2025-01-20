@interface DDCallKitAudioAction
+ (BOOL)facetimeAvailable;
+ (BOOL)isAvailable;
+ (BOOL)providerIsValid:(id)a3 forHandleType:(int64_t)a4;
+ (BOOL)video;
+ (id)_callKitProvidersForHandleType:(uint64_t)a1;
+ (id)actionsWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
+ (id)actionsWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5 defaultAppsOnly:(BOOL)a6;
+ (id)defaultActionWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
+ (id)facetimeScheme;
+ (id)matchingSchemes;
+ (id)patchedSchemeForScheme:(id)a3;
+ (id)providersIfHandleIsEmergency:(id)a3;
- (id)_serviceIdentifier;
- (id)callProvider;
- (id)defaultAction;
- (id)dialRequest;
- (id)dialRequestWithProvider:(void *)a1;
- (id)localizedName;
- (id)menuName;
- (id)notificationIconBundleIdentifier;
- (id)serviceName;
- (id)subtitle;
- (int64_t)TTYType;
@end

@implementation DDCallKitAudioAction

- (id)notificationIconBundleIdentifier
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->super._preferNonDefaultApp)
  {
    v3 = [(TUCallProvider *)self->_provider identifier];
    char v4 = [v3 isEqualToString:@"com.apple.coretelephony"];

    v5 = @"com.apple.mobilephone";
    if ((v4 & 1) == 0)
    {
      uint64_t v6 = [(TUCallProvider *)self->_provider displayAppBundleIdentifier];
      v7 = (void *)v6;
      if (v6) {
        v8 = (__CFString *)v6;
      }
      else {
        v8 = @"com.apple.mobilephone";
      }
      v5 = v8;
    }
  }
  else
  {
    if (dd_isLSTrusted())
    {
      v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      id v18 = 0;
      v10 = [v9 defaultApplicationForCategory:4 error:&v18];
      id v11 = v18;

      if (v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v12 = [MEMORY[0x1E4F28B50] mainBundle];
        v13 = [v12 bundleIdentifier];
        *(_DWORD *)buf = 138412546;
        v20 = v13;
        __int16 v21 = 2112;
        id v22 = v11;
        _os_log_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Couldn't get default phone app from %@. Error: %@", buf, 0x16u);
      }
    }
    else
    {
      id v11 = 0;
      v10 = 0;
    }
    uint64_t v14 = [v10 bundleIdentifier];
    v15 = (void *)v14;
    v16 = @"com.apple.mobilephone";
    if (v14) {
      v16 = (__CFString *)v14;
    }
    v5 = v16;
  }
  return v5;
}

- (id)defaultAction
{
  v9.receiver = self;
  v9.super_class = (Class)DDCallKitAudioAction;
  uint64_t v3 = [(DDCallAction *)&v9 defaultAction];
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)(v3 + 168), self->_provider);
  objc_storeStrong((id *)(v4 + 176), self->_senderIdentity);
  v5 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v5 userInterfaceIdiom] != 1)
  {
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v6 = [(TUCallProvider *)self->_provider identifier];
  if (![v6 isEqualToString:@"com.apple.coretelephony"]
    || !self->super._preferNonDefaultApp)
  {

    goto LABEL_8;
  }
  uint64_t v7 = [(DDCallKitAudioAction *)self TTYType];

  if (v7 <= 1) {
    *(unsigned char *)(v4 + 160) = 0;
  }
LABEL_9:
  return (id)v4;
}

+ (id)_callKitProvidersForHandleType:(uint64_t)a1
{
  uint64_t v3 = self;
  if (dd_isDeviceLocked())
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FADAB0]);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__DDCallKitAudioAction__callKitProvidersForHandleType___block_invoke;
    v7[3] = &__block_descriptor_48_e24_B16__0__TUCallProvider_8l;
    v7[4] = v3;
    v7[5] = a2;
    uint64_t v4 = [v5 sortedProvidersPassingTest:v7];
  }
  return v4;
}

uint64_t __55__DDCallKitAudioAction__callKitProvidersForHandleType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) providerIsValid:a2 forHandleType:*(void *)(a1 + 40)];
}

+ (BOOL)providerIsValid:(id)a3 forHandleType:(int64_t)a4
{
  id v5 = a3;
  if ([v5 supportsAudioOnly]) {
    char v6 = [v5 supportsHandleType:a4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isAvailable
{
  return 1;
}

+ (id)facetimeScheme
{
  return @"facetime-audio";
}

+ (id)defaultActionWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v5 = [a1 actionsWithURL:a3 result:a4 context:a5 defaultAppsOnly:0];
  char v6 = [v5 firstObject];
  uint64_t v7 = [v6 defaultAction];

  return v7;
}

+ (id)actionsWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  return (id)[a1 actionsWithURL:a3 result:a4 context:a5 defaultAppsOnly:0];
}

+ (id)providersIfHandleIsEmergency:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 type] != 3)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FADAB0]);
    uint64_t v7 = [v6 telephonyProvider];
    if (v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4FADC88]);
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      objc_super v9 = [v7 prioritizedSenderIdentities];
      id v5 = (void *)[v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v5)
      {
        id v17 = v6;
        uint64_t v10 = *(void *)v19;
        while (2)
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v9);
            }
            v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            v13 = [v4 value];
            uint64_t v14 = [v12 UUID];
            int v15 = [v8 isEmergencyNumberForDigits:v13 senderIdentityUUID:v14];

            if (v15)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                +[DDCallKitAudioAction providersIfHandleIsEmergency:]();
              }
              id v22 = v7;
              id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
              goto LABEL_17;
            }
          }
          id v5 = (void *)[v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
          if (v5) {
            continue;
          }
          break;
        }
LABEL_17:
        id v6 = v17;
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)actionsWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5 defaultAppsOnly:(BOOL)a6
{
  BOOL v41 = a6;
  id v9 = a3;
  id v10 = a5;
  id v11 = [(DDTelephoneNumberAction *)[DDCallAction alloc] initWithURL:v9 result:a4 context:v10];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v45 = v11;
  uint64_t v14 = v11->super._phoneNumber;
  int v15 = v14;
  if (v14)
  {
    v42 = v13;
    id v43 = v12;
    id v44 = v10;
    if ([(NSString *)v14 containsString:@"@"]) {
      uint64_t v16 = 3;
    }
    else {
      uint64_t v16 = 2;
    }
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4FADBD8]) initWithType:v16 value:v15];
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x2020000000;
    char v60 = 0;
    long long v18 = [v9 scheme];
    long long v19 = [v18 lowercaseString];
    long long v20 = [a1 facetimeScheme];
    char v21 = [v19 isEqualToString:v20];

    char v60 = v21;
    id obj = v17;
    id v22 = [a1 providersIfHandleIsEmergency:v17];
    if (v22)
    {
      if ([a1 video])
      {

        _Block_object_dispose(&v57, 8);
        id v23 = 0;
        id v12 = v43;
        id v10 = v44;
        id v13 = v42;
        goto LABEL_23;
      }
      char v24 = 0;
      v27 = v22;
      v26 = v43;
      v25 = v44;
    }
    else
    {
      char v24 = dd_hostApplicationCanListCallProviders();
      +[DDCallKitAudioAction _callKitProvidersForHandleType:]((uint64_t)a1, v16);
      v26 = v43;
      v27 = v25 = v44;
    }
    BOOL v28 = v22 != 0;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __70__DDCallKitAudioAction_actionsWithURL_result_context_defaultAppsOnly___block_invoke;
    v46[3] = &unk_1E5A86008;
    id v53 = a1;
    id v29 = v9;
    id v47 = v29;
    v54 = a4;
    id v30 = v25;
    id v48 = v30;
    id v39 = obj;
    id v49 = v39;
    char v55 = v24;
    BOOL v56 = v28;
    id v31 = v42;
    id v50 = v31;
    v52 = &v57;
    id v32 = v26;
    id v51 = v32;
    [v27 enumerateObjectsUsingBlock:v46];
    if (*((unsigned char *)v58 + 24)) {
      char v33 = v24;
    }
    else {
      char v33 = 1;
    }
    if ((v33 & 1) == 0 && [a1 facetimeAvailable])
    {
      id v38 = objc_alloc_init(MEMORY[0x1E4FADAB0]);
      v34 = [v38 faceTimeProvider];
      if (v34)
      {
        uint64_t v35 = [a1 actionWithURL:v29 result:a4 context:v30];
        objc_storeStrong((id *)(v35 + 152), obj);
        objc_storeStrong((id *)(v35 + 168), v34);
        *(unsigned char *)(v35 + 160) = 1;
        [v32 insertObject:v35 atIndex:0];
      }
    }
    if (v41 && (unint64_t)[v32 count] >= 2)
    {
      v36 = [v32 firstObject];
      [v32 removeAllObjects];
      [v32 addObject:v36];
    }
    [v32 addObjectsFromArray:v31];

    _Block_object_dispose(&v57, 8);
    id v12 = v43;
    id v10 = v44;
    id v13 = v42;
  }
  id v23 = v12;
LABEL_23:

  return v23;
}

void __70__DDCallKitAudioAction_actionsWithURL_result_context_defaultAppsOnly___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  int v5 = [v4 isEqualToString:@"com.apple.coretelephony"];

  id v6 = [v3 bundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.facetime"];

  if (v7)
  {
    if (([*(id *)(a1 + 80) facetimeAvailable] & 1) == 0) {
      goto LABEL_30;
    }
    goto LABEL_16;
  }
  if (!v5) {
    goto LABEL_16;
  }
  int v26 = v5;
  id v27 = v3;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v48[0] = objc_opt_class();
  v48[1] = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if ([v13 isAvailable])
        {
          uint64_t v14 = [v13 actionWithURL:*(void *)(a1 + 32) result:*(void *)(a1 + 88) context:*(void *)(a1 + 40)];
          objc_storeStrong((id *)(v14 + 152), *(id *)(a1 + 48));
          *(unsigned char *)(v14 + 160) = 1;
          [*(id *)(a1 + 56) addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v10);
  }

  id v3 = v27;
  int v5 = v26;
  if (!*(unsigned char *)(a1 + 96) || +[DDCallAction isAvailable])
  {
LABEL_16:
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __70__DDCallKitAudioAction_actionsWithURL_result_context_defaultAppsOnly___block_invoke_2;
    v33[3] = &unk_1E5A85FE0;
    uint64_t v39 = *(void *)(a1 + 80);
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 88);
    id v34 = v15;
    uint64_t v40 = v16;
    id v35 = *(id *)(a1 + 40);
    id v36 = *(id *)(a1 + 48);
    id v17 = v3;
    id v37 = v17;
    __int16 v41 = *(_WORD *)(a1 + 96);
    char v42 = v7;
    long long v28 = *(_OWORD *)(a1 + 64);
    id v18 = (id)v28;
    long long v38 = v28;
    long long v19 = (void (**)(void, void))MEMORY[0x1A6236DA0](v33);
    if (v5)
    {
      long long v20 = [v17 prioritizedSenderIdentities];
    }
    else
    {
      long long v20 = 0;
    }
    if ((unint64_t)[v20 count] < 2)
    {
      v19[2](v19, 0);
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v47 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v30 != v24) {
              objc_enumerationMutation(v21);
            }
            v19[2](v19, *(void *)(*((void *)&v29 + 1) + 8 * j));
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v47 count:16];
        }
        while (v23);
      }
    }
  }
LABEL_30:
}

void __70__DDCallKitAudioAction_actionsWithURL_result_context_defaultAppsOnly___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v4 = [*(id *)(a1 + 80) actionWithURL:*(void *)(a1 + 32) result:*(void *)(a1 + 88) context:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(v4 + 152), *(id *)(a1 + 48));
  objc_storeStrong((id *)(v4 + 168), *(id *)(a1 + 56));
  if (*(unsigned char *)(a1 + 96)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = *(unsigned char *)(a1 + 97) != 0;
  }
  *(unsigned char *)(v4 + 160) = v5;
  objc_storeStrong((id *)(v4 + 176), a2);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) && *(unsigned char *)(a1 + 98))
  {
    [*(id *)(a1 + 64) insertObject:v4 atIndex:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
  else
  {
    [*(id *)(a1 + 64) addObject:v4];
  }
}

- (id)callProvider
{
  return self->_provider;
}

- (int64_t)TTYType
{
  return 1;
}

- (id)localizedName
{
  uint64_t v3 = [(DDCallKitAudioAction *)self serviceName];
  if (!v3) {
    goto LABEL_10;
  }
  uint64_t v4 = (void *)v3;
  if (self->super.super.super._disambiguatedTitle)
  {
    BOOL v5 = [(NSDictionary *)self->super.super.super._context objectForKeyedSubscript:@"HeyBarcodeSheet"];
    char v6 = [v5 BOOLValue];

    if (v6)
    {
      uint64_t v7 = [(DDCallKitAudioAction *)self menuName];
    }
    else
    {
      int v8 = [(id)objc_opt_class() video];
      uint64_t v9 = NSString;
      uint64_t v10 = v8 ? @"Video (%@)" : @"Call (%@)";
      uint64_t v11 = DDLocalizedString(v10);
      uint64_t v7 = objc_msgSend(v9, "stringWithFormat:", v11, v4);

      uint64_t v4 = (void *)v11;
    }

    uint64_t v4 = (void *)v7;
    if (!v7)
    {
LABEL_10:
      v13.receiver = self;
      v13.super_class = (Class)DDCallKitAudioAction;
      uint64_t v4 = [(DDCallAction *)&v13 localizedName];
    }
  }
  return v4;
}

- (id)subtitle
{
  return 0;
}

- (id)dialRequest
{
  uint64_t v3 = [(DDCallKitAudioAction *)self callProvider];
  uint64_t v4 = -[DDCallKitAudioAction dialRequestWithProvider:](self, (uint64_t)v3);

  return v4;
}

- (id)dialRequestWithProvider:(void *)a1
{
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)DDCallKitAudioAction;
    uint64_t v3 = objc_msgSendSuper2(&v7, sel_dialRequestWithProvider_, a2);
    objc_msgSend(v3, "setVideo:", objc_msgSend((id)objc_opt_class(), "video"));
    uint64_t v4 = (void *)a1[22];
    if (v4)
    {
      BOOL v5 = [v4 accountUUID];
      [v3 setLocalSenderIdentityAccountUUID:v5];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

+ (BOOL)facetimeAvailable
{
  return [MEMORY[0x1E4FADA88] supportsFaceTimeAudioCalls];
}

+ (BOOL)video
{
  return 0;
}

- (id)menuName
{
  uint64_t v3 = [(DDTelephoneNumberAction *)self bizItem];

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)DDCallKitAudioAction;
    uint64_t v4 = [(DDCallAction *)&v6 localizedName];
  }
  else
  {
    uint64_t v4 = DDLocalizedStringWithDefaultValue(@"AUDIO_CALL", 0, 0, @"Call");
  }
  return v4;
}

- (id)serviceName
{
  uint64_t v3 = [(DDCallKitAudioAction *)self callProvider];
  uint64_t v4 = [v3 identifier];
  int v5 = [v4 isEqualToString:@"com.apple.coretelephony"];

  if (v5)
  {
    objc_super v6 = DDLocalizedString(@"Phone");
  }
  else
  {
    objc_super v7 = [(DDCallKitAudioAction *)self callProvider];
    objc_super v6 = [v7 localizedName];
  }
  if (self->_senderIdentity)
  {
    int v8 = NSString;
    uint64_t v9 = DDLocalizedStringWithDefaultValue(@"CALL_EXT_SERVICE_NAME_FORMAT", 0, 0, @"%@ (%@)");
    uint64_t v10 = [(TUSenderIdentity *)self->_senderIdentity localizedName];
    uint64_t v11 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v6, v10);

    objc_super v6 = (void *)v11;
  }
  return v6;
}

- (id)_serviceIdentifier
{
  senderIdentity = self->_senderIdentity;
  uint64_t v4 = [(DDCallKitAudioAction *)self callProvider];
  int v5 = [v4 identifier];
  if (senderIdentity)
  {
    objc_super v6 = [(TUSenderIdentity *)self->_senderIdentity accountUUID];
    uint64_t v7 = [v5 stringByAppendingFormat:@"+%@", v6];

    int v5 = (void *)v7;
  }

  return v5;
}

+ (id)matchingSchemes
{
  return &unk_1EF510D28;
}

+ (id)patchedSchemeForScheme:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"facetime"])
  {
    objc_super v6 = @"facetime-audio";
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"facetime-prompt"])
  {
    objc_super v6 = @"facetime-audio-prompt";
    goto LABEL_9;
  }
  uint64_t v7 = [a1 matchingSchemes];
  int v8 = [v7 containsObject:v5];

  if (v8) {
    objc_super v6 = v5;
  }
  else {
LABEL_8:
  }
    objc_super v6 = 0;
LABEL_9:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderIdentity, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

+ (void)providersIfHandleIsEmergency:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Dealing with an emergency number, falling back to onboard telephony", v0, 2u);
}

@end