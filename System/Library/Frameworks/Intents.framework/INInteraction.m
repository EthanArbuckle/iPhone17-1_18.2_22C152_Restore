@interface INInteraction
+ (BOOL)supportsSecureCoding;
+ (unint64_t)_searchableItemVersion;
+ (void)deleteAllInteractionsWithCompletion:(void *)completion;
+ (void)deleteInteractionsWithGroupIdentifier:(NSString *)groupIdentifier completion:(void *)completion;
+ (void)deleteInteractionsWithIdentifiers:(NSArray *)identifiers completion:(void *)completion;
+ (void)initialize;
- (BOOL)_donatedBySiri;
- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CSSearchableItem)_searchableItem;
- (INImage)_keyImage;
- (INIntent)intent;
- (INIntentHandlingStatus)intentHandlingStatus;
- (INIntentResponse)intentResponse;
- (INInteraction)initWithCoder:(id)a3;
- (INInteraction)initWithIntent:(INIntent *)intent response:(INIntentResponse *)response;
- (INInteractionDirection)direction;
- (NSDate)date;
- (NSDateInterval)dateInterval;
- (NSString)description;
- (NSString)groupIdentifier;
- (NSString)identifier;
- (NSUUID)_contextExtensionUUID;
- (SAUISnippet)_snippet;
- (double)duration;
- (id)_dictionaryRepresentation;
- (id)_init;
- (id)_initWithIntent:(id)a3 response:(id)a4;
- (id)_searchableItemIncludingData:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)parameterValueForParameter:(INParameter *)parameter;
- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4;
- (int64_t)_indexingHash;
- (unint64_t)hash;
- (void)_commonInit;
- (void)_donateInteractionWithBundleId:(id)a3 completion:(id)a4;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)_setContextExtensionUUID:(id)a3;
- (void)_setDonatedBySiri:(BOOL)a3;
- (void)_setIntent:(id)a3;
- (void)_setIntentResponse:(id)a3;
- (void)_setSnippet:(id)a3;
- (void)donateInteractionWithCompletion:(void *)completion;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateInterval:(NSDateInterval *)dateInterval;
- (void)setDirection:(INInteractionDirection)direction;
- (void)setDuration:(double)a3;
- (void)setGroupIdentifier:(NSString *)groupIdentifier;
- (void)setIdentifier:(NSString *)identifier;
- (void)setIntentHandlingStatus:(int64_t)a3;
@end

@implementation INInteraction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INInteraction)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(INInteraction *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
    intent = v5->_intent;
    v5->_intent = (INIntent *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentResponse"];
    intentResponse = v5->_intentResponse;
    v5->_intentResponse = (INIntentResponse *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contextExtensionUUID"];
    contextExtensionUUID = v5->_contextExtensionUUID;
    v5->_contextExtensionUUID = (NSUUID *)v10;

    v5->_direction = [v4 decodeIntegerForKey:@"direction"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v16;

    v5->_intentHandlingStatus = [v4 decodeIntegerForKey:@"intentHandlingStatus"];
    v5->_donatedBySiri = [v4 decodeBoolForKey:@"_donatedBySiri"];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v18 = (void *)getSAUISnippetClass_softClass;
    uint64_t v27 = getSAUISnippetClass_softClass;
    if (!getSAUISnippetClass_softClass)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __getSAUISnippetClass_block_invoke;
      v23[3] = &unk_1E5520EB8;
      v23[4] = &v24;
      __getSAUISnippetClass_block_invoke((uint64_t)v23);
      v18 = (void *)v25[3];
    }
    id v19 = v18;
    _Block_object_dispose(&v24, 8);
    if (v19)
    {
      uint64_t v20 = [v4 decodeObjectOfClass:v19 forKey:@"_snippet"];
      snippet = v5->_snippet;
      v5->_snippet = (SAUISnippet *)v20;
    }
  }

  return v5;
}

- (id)_init
{
  return [(INInteraction *)self _initWithIntent:0 response:0];
}

- (INInteraction)initWithIntent:(INIntent *)intent response:(INIntentResponse *)response
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = intent;
  v7 = response;
  v16.receiver = self;
  v16.super_class = (Class)INInteraction;
  uint64_t v8 = [(INInteraction *)&v16 init];
  v9 = v8;
  if (v8)
  {
    [(INInteraction *)v8 _commonInit];
    uint64_t v10 = [(INIntent *)v6 copy];
    v11 = v9->_intent;
    v9->_intent = (INIntent *)v10;

    uint64_t v12 = [(INIntentResponse *)v7 copy];
    intentResponse = v9->_intentResponse;
    v9->_intentResponse = (INIntentResponse *)v12;

    v9->_intentHandlingStatus = [(INIntentResponse *)v7 _intentHandlingStatus];
    if (!v6)
    {
      uint64_t v14 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[INInteraction initWithIntent:response:]";
        __int16 v19 = 2112;
        uint64_t v20 = v9;
        _os_log_fault_impl(&dword_18CB2F000, v14, OS_LOG_TYPE_FAULT, "%s No intent was provided in the interaction: %@", buf, 0x16u);
      }
    }
  }

  return v9;
}

- (id)_initWithIntent:(id)a3 response:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INInteraction;
  v9 = [(INInteraction *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    [(INInteraction *)v9 _commonInit];
    objc_storeStrong((id *)&v10->_intent, a3);
    objc_storeStrong((id *)&v10->_intentResponse, a4);
    v10->_intentHandlingStatus = [v8 _intentHandlingStatus];
  }

  return v10;
}

- (void)_commonInit
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = (NSDateInterval *)[v3 initWithStartDate:v4 duration:0.0];
  dateInterval = self->_dateInterval;
  self->_dateInterval = v5;

  id v7 = [MEMORY[0x1E4F29128] UUID];
  id v8 = [v7 UUIDString];
  identifier = self->_identifier;
  self->_identifier = v8;

  self->_donatedBySiri = 0;
}

- (void)_donateInteractionWithBundleId:(id)a3 completion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [getCSSearchableIndexClass() defaultSearchableIndex];
  if (!self->_donatedBySiri) {
    self->_donatedBySiri = INThisProcessIsDonatingBySiri();
  }
  v9 = INInteractionWithTypedInteraction(self);
  if (![v9 direction])
  {
    uint64_t v10 = [v9 intent];
    objc_msgSend(v9, "setDirection:", objc_msgSend(v10, "_preferredInteractionDirection"));
  }
  v11 = [v9 intent];
  objc_super v12 = [v11 _className];

  v13 = [v9 _contextExtensionUUID];

  if (!v13)
  {
    uint64_t v14 = +[INIntent _sharedExtensionContextUUIDForIntentClassName:v12];
    [v9 _setContextExtensionUUID:v14];
  }
  v15 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    objc_super v16 = v15;
    BOOL v17 = [(INInteraction *)self _donatedBySiri];
    v18 = @"NO";
    v34 = "-[INInteraction _donateInteractionWithBundleId:completion:]";
    *(_DWORD *)buf = 136315650;
    if (v17) {
      v18 = @"YES";
    }
    __int16 v35 = 2114;
    v36 = v18;
    __int16 v37 = 2112;
    v38 = v9;
    _os_log_impl(&dword_18CB2F000, v16, OS_LOG_TYPE_INFO, "%s Donating on behalf of Siri: %{public}@ for %@", buf, 0x20u);
  }
  __int16 v19 = [v9 intent];
  objc_msgSend(v19, "_intents_preferredScaledImageSize");
  double v21 = v20;
  double v23 = v22;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __59__INInteraction__donateInteractionWithBundleId_completion___block_invoke;
  v28[3] = &unk_1E5516650;
  v28[4] = self;
  id v29 = v12;
  id v30 = v6;
  id v31 = v8;
  id v32 = v7;
  id v24 = v7;
  id v25 = v8;
  id v26 = v6;
  id v27 = v12;
  INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler(v9, 0x15u, 0, 1, 0, v28, v21, v23);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(INInteraction *)self intent];
  id v7 = [(INInteraction *)self intentResponse];
  id v8 = (unsigned char *)[v5 initWithIntent:v6 response:v7];

  if (v8)
  {
    v9 = [(INInteraction *)self identifier];
    [v8 setIdentifier:v9];

    uint64_t v10 = [(INInteraction *)self dateInterval];
    [v8 setDateInterval:v10];

    v11 = [(INInteraction *)self groupIdentifier];
    [v8 setGroupIdentifier:v11];

    objc_msgSend(v8, "setDirection:", -[INInteraction direction](self, "direction"));
    objc_msgSend(v8, "setIntentHandlingStatus:", -[INInteraction intentHandlingStatus](self, "intentHandlingStatus"));
    v8[24] = [(INInteraction *)self _donatedBySiri];
    objc_super v12 = [(INInteraction *)self _contextExtensionUUID];
    [v8 _setContextExtensionUUID:v12];

    v13 = [(INInteraction *)self _snippet];
    uint64_t v14 = (void *)[v13 copyWithZone:a3];
    [v8 _setSnippet:v14];
  }
  return v8;
}

- (void)setIdentifier:(NSString *)identifier
{
}

- (void)setDirection:(INInteractionDirection)direction
{
  self->_direction = direction;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (INInteractionDirection)direction
{
  return self->_direction;
}

- (void)_setContextExtensionUUID:(id)a3
{
}

- (NSUUID)_contextExtensionUUID
{
  return self->_contextExtensionUUID;
}

- (void)setIntentHandlingStatus:(int64_t)a3
{
  self->_intentHandlingStatus = a3;
}

- (void)setGroupIdentifier:(NSString *)groupIdentifier
{
}

- (void)setDateInterval:(NSDateInterval *)dateInterval
{
}

- (INIntentHandlingStatus)intentHandlingStatus
{
  return self->_intentHandlingStatus;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (SAUISnippet)_snippet
{
  return self->_snippet;
}

- (void)_setSnippet:(id)a3
{
}

- (BOOL)_donatedBySiri
{
  return self->_donatedBySiri;
}

- (INIntentResponse)intentResponse
{
  return self->_intentResponse;
}

void __49__INInteraction_donateInteractionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) intent];
  unint64_t v3 = [v2 _type];

  id v4 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    if (v3 > 3) {
      v5 = 0;
    }
    else {
      v5 = off_1E55166A0[v3];
    }
    id v6 = *(void **)(a1 + 32);
    id v7 = v4;
    id v8 = [v6 intent];
    v9 = [v8 _className];
    *(_DWORD *)buf = 136315650;
    v110 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
    __int16 v111 = 2114;
    v112 = v5;
    __int16 v113 = 2114;
    v114 = v9;
    _os_log_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_INFO, "%s Donate interaction for %{public}@ intent: %{public}@", buf, 0x20u);
  }
  uint64_t v10 = [*(id *)(a1 + 32) identifier];

  if (!v10)
  {
    if (!*(void *)(a1 + 40)) {
      return;
    }
    double v21 = [NSString stringWithFormat:@"Cannot donate interaction with nil identifier: %@", *(void *)(a1 + 32)];
    double v23 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v110 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_18CB2F000, v23, OS_LOG_TYPE_ERROR, "%s Cannot donate interaction with nil identifier", buf, 0xCu);
    }
    uint64_t v24 = *(void *)(a1 + 40);
    id v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v107 = *MEMORY[0x1E4F28568];
    v108 = v21;
    id v26 = (void *)MEMORY[0x1E4F1C9E8];
    id v27 = &v108;
    v28 = &v107;
LABEL_18:
    id v29 = [v26 dictionaryWithObjects:v27 forKeys:v28 count:1];
    id v30 = [v25 errorWithDomain:@"IntentsErrorDomain" code:1901 userInfo:v29];
    (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v30);

LABEL_19:
    return;
  }
  if (v3 == 3) {
    goto LABEL_39;
  }
  v11 = [*(id *)(a1 + 32) intent];
  objc_super v12 = [v11 _validParameterCombinations];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    if (v3 == 2)
    {
      uint64_t v14 = [*(id *)(a1 + 32) intent];
      v15 = [v14 _codableDescription];
      int v16 = [v15 isDeprecated];

      if (v16)
      {
        BOOL v17 = NSString;
        v18 = *(void **)(a1 + 32);
        __int16 v19 = [v18 intent];
        double v20 = [v19 _className];
        double v21 = [v17 stringWithFormat:@"Cannot donate interaction (%@) because intent (%@) has been deprecated", v18, v20];

        double v22 = (void *)INSiriLogContextIntents;
        if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          if (!v21) {
            goto LABEL_39;
          }
          goto LABEL_37;
        }
        v86 = *(void **)(a1 + 32);
        v47 = v22;
        v87 = [v86 intent];
        v88 = [v87 _className];
        *(_DWORD *)buf = 136315394;
        v110 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
        __int16 v111 = 2112;
        v112 = v88;
        _os_log_error_impl(&dword_18CB2F000, v47, OS_LOG_TYPE_ERROR, "%s Cannot donate interaction because intent (%@) has been deprecated", buf, 0x16u);
      }
      else
      {
        v43 = [*(id *)(a1 + 32) intent];
        char v44 = [v43 _hasTitle];

        if (v44) {
          goto LABEL_39;
        }
        v45 = [*(id *)(a1 + 32) intent];
        v46 = [v45 _nonNilParameters];
        v47 = [v46 mutableCopy];

        v48 = [*(id *)(a1 + 32) intent];
        v49 = [(id)objc_opt_class() _ignoredParameters];
        [v47 minusSet:v49];

        if ([v47 count])
        {
          v50 = [v47 allObjects];
          v51 = [v50 componentsJoinedByString:@", "];
        }
        else
        {
          v51 = @"(No Parameters)";
        }
        v52 = NSString;
        v53 = *(void **)(a1 + 32);
        v54 = [v53 intent];
        v55 = [v54 _className];
        double v21 = [v52 stringWithFormat:@"Cannot donate interaction because intent title is empty: %@ Please make sure that your intent definition includes the following shortcut type for %@: %@.", v53, v55, v51];

        v56 = (void *)INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          v89 = *(void **)(a1 + 32);
          v90 = v56;
          v91 = [v89 intent];
          v92 = [v91 _className];
          *(_DWORD *)buf = 136315650;
          v110 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
          __int16 v111 = 2114;
          v112 = v92;
          __int16 v113 = 2112;
          v114 = v51;
          _os_log_error_impl(&dword_18CB2F000, v90, OS_LOG_TYPE_ERROR, "%s Cannot donate interaction (%{public}@) because intent title is empty. Missing parameter combination: %@", buf, 0x20u);
        }
      }

      if (v21)
      {
LABEL_37:
        uint64_t v24 = *(void *)(a1 + 40);
        if (!v24) {
          goto LABEL_19;
        }
        id v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v103 = *MEMORY[0x1E4F28568];
        v104 = v21;
        id v26 = (void *)MEMORY[0x1E4F1C9E8];
        id v27 = &v104;
        v28 = &v103;
        goto LABEL_18;
      }
    }
LABEL_39:
    v57 = [*(id *)(a1 + 32) intent];
    v58 = objc_msgSend(v57, "_intents_launchIdForCurrentPlatform");
    id v100 = 0;
    INExtractAppInfoFromSiriLaunchId(v58, &v100, 0);
    id v59 = v100;

    v60 = [*(id *)(a1 + 32) intent];
    v61 = [v60 _intentInstanceDescription];
    v62 = NSStringFromClass((Class)[v61 facadeClass]);

    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __49__INInteraction_donateInteractionWithCompletion___block_invoke_66;
    v97[3] = &unk_1E5516600;
    v97[4] = *(void *)(a1 + 32);
    id v63 = v59;
    id v98 = v63;
    id v99 = *(id *)(a1 + 40);
    v64 = (void (**)(void, void, void))MEMORY[0x192F984C0](v97);
    if (INThisProcessIsDonatingBySiri()) {
      goto LABEL_44;
    }
    if (INThisProcessIsSystemProcess_onceToken != -1) {
      dispatch_once(&INThisProcessIsSystemProcess_onceToken, &__block_literal_global_48);
    }
    if (INThisProcessIsSystemProcess_isSystemProcess
      || INThisProcessHasEntitlement(@"com.apple.private.corespotlight.internal", 0))
    {
LABEL_44:
      v64[2](v64, 1, 1);
LABEL_45:

      return;
    }
    if (v62)
    {
      v65 = [MEMORY[0x1E4F223F0] bundleProxyForCurrentProcess];
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
      v67 = [v65 bundleType];
      uint64_t v68 = [v67 isEqualToString:*MEMORY[0x1E4F22368]] & isKindOfClass ^ 1;

      if (isKindOfClass)
      {
        id v69 = v65;
        uint64_t v70 = 1;
        v71 = [v69 objectForInfoDictionaryKey:*MEMORY[0x1E4F914E8] ofClass:objc_opt_class() inScope:1];
        if ((objc_msgSend(v69, "if_isWatchKitAppExtension") & 1) == 0)
        {
          uint64_t v70 = v68;
          if ([v71 isEqualToString:@"com.apple.intents-service"])
          {
            uint64_t v72 = *(void *)(a1 + 40);
            if (v72) {
              (*(void (**)(uint64_t, void))(v72 + 16))(v72, 0);
            }

            goto LABEL_45;
          }
        }

        uint64_t v68 = v70;
      }
      uint64_t CanDonateIntent = INBundleProxyCanDonateIntent(v65, v62);
      v64[2](v64, CanDonateIntent, v68);
    }
    else
    {
      if (!*(void *)(a1 + 40)) {
        goto LABEL_45;
      }
      v73 = NSString;
      v74 = [*(id *)(a1 + 32) intent];
      v75 = [v74 _className];
      v65 = [v73 stringWithFormat:@"Donating intent '%@' is not supported.", v75];

      v76 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        v93 = *(void **)(a1 + 32);
        v94 = v76;
        v95 = [v93 intent];
        v96 = [v95 _className];
        *(_DWORD *)buf = 136315394;
        v110 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
        __int16 v111 = 2114;
        v112 = v96;
        _os_log_error_impl(&dword_18CB2F000, v94, OS_LOG_TYPE_ERROR, "%s Donating %{public}@ is not supported", buf, 0x16u);
      }
      uint64_t v77 = *(void *)(a1 + 40);
      v78 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v101 = *MEMORY[0x1E4F28568];
      v102 = v65;
      v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
      v80 = [v78 errorWithDomain:@"IntentsErrorDomain" code:1901 userInfo:v79];
      (*(void (**)(uint64_t, void *))(v77 + 16))(v77, v80);
    }
    goto LABEL_45;
  }
  id v31 = INSiriLogContextIntents;
  if (v3 == 1)
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      id v32 = *(__CFString **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v110 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
      __int16 v111 = 2112;
      v112 = v32;
      _os_log_impl(&dword_18CB2F000, v31, OS_LOG_TYPE_INFO, "%s Not donating system intent because it does not have any valid parameter combinations: %@", buf, 0x16u);
    }
    uint64_t v33 = *(void *)(a1 + 40);
    if (v33) {
      (*(void (**)(uint64_t, void))(v33 + 16))(v33, 0);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v82 = *(void **)(a1 + 32);
      v83 = v31;
      v84 = [v82 intent];
      v85 = [v84 _className];
      *(_DWORD *)buf = 136315394;
      v110 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
      __int16 v111 = 2114;
      v112 = v85;
      _os_log_error_impl(&dword_18CB2F000, v83, OS_LOG_TYPE_ERROR, "%s Cannot donate interaction with %{public}@ that has no valid shortcut types", buf, 0x16u);
    }
    if (*(void *)(a1 + 40))
    {
      double v21 = (void *)[*(id *)(a1 + 32) copy];
      v34 = objc_alloc_init(INIntent);
      [v21 _setIntent:v34];

      __int16 v35 = NSString;
      v36 = [*(id *)(a1 + 32) intent];
      __int16 v37 = [v36 description];
      v38 = [v35 stringWithFormat:@"Cannot donate interaction with intent that has no valid shortcut types: %@ for intent %@", v21, v37];

      uint64_t v39 = *(void *)(a1 + 40);
      v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v105 = *MEMORY[0x1E4F28568];
      v106 = v38;
      v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
      v42 = [v40 errorWithDomain:@"IntentsErrorDomain" code:1901 userInfo:v41];
      (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v42);

      goto LABEL_19;
    }
  }
}

- (INIntent)intent
{
  return self->_intent;
}

void __49__INInteraction_donateInteractionWithCompletion___block_invoke_66(uint64_t a1, int a2, int a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    if (*(void *)(a1 + 48))
    {
      uint64_t v10 = @"extension";
      if (a3) {
        uint64_t v10 = @"app";
      }
      v11 = NSString;
      objc_super v12 = *(void **)(a1 + 32);
      uint64_t v13 = v10;
      uint64_t v14 = [v12 intent];
      v15 = (objc_class *)objc_opt_class();
      int v16 = NSStringFromClass(v15);
      BOOL v17 = [v11 stringWithFormat:@"Donating intent '%@' is not supported by this %@. Please make sure that you declare the intents that your %@ supports by including the NSUserActivityTypes key in its Info.plist or your %@ contains an Intents extension that supports this intent.", v16, v13, @"app", @"app"];

      v18 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = *(void **)(a1 + 32);
        id v25 = v18;
        id v26 = [v24 intent];
        id v27 = [v26 _className];
        uint64_t v28 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        v34 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
        __int16 v35 = 2114;
        v36 = v27;
        __int16 v37 = 2114;
        uint64_t v38 = v28;
        _os_log_error_impl(&dword_18CB2F000, v25, OS_LOG_TYPE_ERROR, "%s Can NOT donate %{public}@ for %{public}@", buf, 0x20u);
      }
      uint64_t v19 = *(void *)(a1 + 48);
      double v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      id v32 = v17;
      double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      double v22 = [v20 errorWithDomain:@"IntentsErrorDomain" code:1901 userInfo:v21];
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v22);
    }
    else
    {
      double v23 = (void *)INSiriLogContextIntents;
      if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)) {
        return;
      }
      id v29 = *(void **)(a1 + 32);
      BOOL v17 = v23;
      double v22 = [v29 intent];
      double v21 = [v22 _className];
      uint64_t v30 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v34 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
      __int16 v35 = 2114;
      v36 = v21;
      __int16 v37 = 2114;
      uint64_t v38 = v30;
      _os_log_error_impl(&dword_18CB2F000, v17, OS_LOG_TYPE_ERROR, "%s Can NOT donate %{public}@ for %{public}@", buf, 0x20u);
    }

    return;
  }
  id v4 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 intent];
    id v8 = [v7 _className];
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    v34 = "-[INInteraction donateInteractionWithCompletion:]_block_invoke";
    __int16 v35 = 2114;
    v36 = v8;
    __int16 v37 = 2114;
    uint64_t v38 = v9;
    _os_log_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_INFO, "%s Can donate %{public}@ for %{public}@", buf, 0x20u);
  }
  [*(id *)(a1 + 32) _donateInteractionWithBundleId:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(INInteraction *)self intent];
  uint64_t v9 = [(INInteraction *)self intentResponse];
  uint64_t v10 = (void *)[(INInteraction *)self copy];
  id v11 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  objc_super v12 = INImageProxyInjectionQueue();
  [v11 setUnderlyingQueue:v12];

  [v11 setMaxConcurrentOperationCount:1];
  [v11 setSuspended:1];
  uint64_t v13 = (void *)MEMORY[0x1E4F28B48];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__INInteraction__injectProxiesForImages_completion___block_invoke;
  v20[3] = &unk_1E551F740;
  id v14 = v7;
  v20[4] = v10;
  id v21 = v14;
  v15 = [v13 blockOperationWithBlock:v20];
  if (v8)
  {
    int v16 = objc_alloc_init(INImageProxyInjectionOperation);
    [(INImageProxyInjectionOperation *)v16 setInjector:v8];
    [(INImageProxyInjectionOperation *)v16 setImageProxyRequestBlock:v6];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __52__INInteraction__injectProxiesForImages_completion___block_invoke_2;
    v19[3] = &unk_1E551E178;
    v19[4] = v10;
    [(INImageProxyInjectionOperation *)v16 setCopyReturnBlock:v19];
    [v15 addDependency:v16];
    [v11 addOperation:v16];
  }
  if (v9)
  {
    BOOL v17 = objc_alloc_init(INImageProxyInjectionOperation);
    [(INImageProxyInjectionOperation *)v17 setInjector:v9];
    [(INImageProxyInjectionOperation *)v17 setImageProxyRequestBlock:v6];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__INInteraction__injectProxiesForImages_completion___block_invoke_3;
    v18[3] = &unk_1E551E178;
    v18[4] = v10;
    [(INImageProxyInjectionOperation *)v17 setCopyReturnBlock:v18];
    [v15 addDependency:v17];
    [v11 addOperation:v17];
  }
  [v11 addOperation:v15];
  [v11 setSuspended:0];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_contextExtensionUUID, 0);
  objc_storeStrong((id *)&self->_snippet, 0);
  objc_storeStrong((id *)&self->_intentResponse, 0);

  objc_storeStrong((id *)&self->_intent, 0);
}

- (void)donateInteractionWithCompletion:(void *)completion
{
  id v4 = completion;
  if (_INInteractionDonationQueue_onceToken != -1) {
    dispatch_once(&_INInteractionDonationQueue_onceToken, &__block_literal_global_4464);
  }
  v5 = _INInteractionDonationQueue_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__INInteraction_donateInteractionWithCompletion___block_invoke;
  v7[3] = &unk_1E551F740;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__INInteraction__donateInteractionWithBundleId_completion___block_invoke_92(uint64_t a1, void *a2)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4)
  {
    if (v3)
    {
      v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28A50];
      v23[0] = v3;
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      id v7 = [v5 errorWithDomain:@"IntentsErrorDomain" code:1901 userInfo:v6];

      uint64_t v4 = *(void *)(a1 + 56);
    }
    else
    {
      id v7 = 0;
    }
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
  }
  if (v3)
  {
    id v8 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      int v14 = 136315906;
      v15 = "-[INInteraction _donateInteractionWithBundleId:completion:]_block_invoke";
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      __int16 v20 = 2114;
      id v21 = v3;
      _os_log_error_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_ERROR, "%s Error donating interaction (%{public}@) for %{public}@: %{public}@", (uint8_t *)&v14, 0x2Au);
    }
  }
  else
  {
    if (INIsReservationInteraction(*(void **)(a1 + 32))) {
      INValidateReservationInteraction(*(void **)(a1 + 32));
    }
    id v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      int v14 = 136315650;
      v15 = "-[INInteraction _donateInteractionWithBundleId:completion:]_block_invoke";
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      _os_log_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_INFO, "%s Successfully donated interaction (%{public}@) for %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  ADClientAddValueForScalarKey();
}

uint64_t __52__INInteraction__injectProxiesForImages_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _setIntent:a2];
  }
  return result;
}

- (void)_setIntent:(id)a3
{
}

- (void)setDuration:(double)a3
{
  v5 = [(INInteraction *)self dateInterval];
  id v6 = [v5 startDate];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v10 = v8;

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v10 duration:a3];
  [(INInteraction *)self setDateInterval:v9];
}

- (double)duration
{
  v2 = [(INInteraction *)self dateInterval];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (void)setDate:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x1E4F28C18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(INInteraction *)self dateInterval];
  [v7 duration];
  id v8 = (id)objc_msgSend(v6, "initWithStartDate:duration:", v5);

  [(INInteraction *)self setDateInterval:v8];
}

- (NSDate)date
{
  v2 = [(INInteraction *)self dateInterval];
  double v3 = [v2 startDate];

  return (NSDate *)v3;
}

- (void)_setIntentResponse:(id)a3
{
}

- (id)parameterValueForParameter:(INParameter *)parameter
{
  double v4 = parameter;
  [(INParameter *)v4 parameterClass];
  id v5 = [(INInteraction *)self intent];
  id v6 = [(INInteraction *)self intentResponse];
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [(INInteraction *)self intent];
  }
  else
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    uint64_t v7 = [(INInteraction *)self intentResponse];
  }
  id v8 = (void *)v7;
  if (v7)
  {
    uint64_t v9 = [(INParameter *)v4 _parameterValueForParameterizedObject:v7];

    goto LABEL_8;
  }
LABEL_7:
  uint64_t v9 = 0;
LABEL_8:

  return v9;
}

- (int64_t)_indexingHash
{
  v2 = [(INInteraction *)self intent];
  int64_t v3 = [v2 _indexingHash];

  return v3;
}

- (id)_searchableItemIncludingData:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(INInteraction *)self intent];
  if ([v5 isGenericIntent] & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = [(INInteraction *)self intentResponse];
    if ((unint64_t)([v7 _intentResponseCode] - 5) >= 2)
    {
      uint64_t v28 = 0;
      id v29 = &v28;
      uint64_t v30 = 0x2050000000;
      id v8 = (void *)getCSSearchableItemAttributeSetClass_softClass;
      uint64_t v31 = getCSSearchableItemAttributeSetClass_softClass;
      if (!getCSSearchableItemAttributeSetClass_softClass)
      {
        uint64_t v23 = MEMORY[0x1E4F143A8];
        uint64_t v24 = 3221225472;
        id v25 = __getCSSearchableItemAttributeSetClass_block_invoke;
        id v26 = &unk_1E5520EB8;
        id v27 = &v28;
        __getCSSearchableItemAttributeSetClass_block_invoke((uint64_t)&v23);
        id v8 = (void *)v29[3];
      }
      uint64_t v9 = v8;
      _Block_object_dispose(&v28, 8);
      id v10 = [v9 alloc];
      id v11 = [(id)*MEMORY[0x1E4F44408] identifier];
      uint64_t v12 = (void *)[v10 initWithItemContentType:v11];

      if ([v5 configureAttributeSet:v12 includingData:v3])
      {
        uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
        [v12 setContentCreationDate:v13];

        int v14 = [(INInteraction *)self groupIdentifier];
        [v12 setIdentifier:v14];

        v15 = [(INInteraction *)self dateInterval];
        __int16 v16 = [v15 startDate];
        [v12 setStartDate:v16];

        uint64_t v17 = [v15 endDate];
        [v12 setEndDate:v17];

        __int16 v18 = [v12 uniqueIdentifier];
        uint64_t v19 = [@"com.apple.siri.interaction." stringByAppendingString:v18];

        uint64_t v28 = 0;
        id v29 = &v28;
        uint64_t v30 = 0x2050000000;
        __int16 v20 = (void *)getCSSearchableItemClass_softClass;
        uint64_t v31 = getCSSearchableItemClass_softClass;
        if (!getCSSearchableItemClass_softClass)
        {
          uint64_t v23 = MEMORY[0x1E4F143A8];
          uint64_t v24 = 3221225472;
          id v25 = __getCSSearchableItemClass_block_invoke;
          id v26 = &unk_1E5520EB8;
          id v27 = &v28;
          __getCSSearchableItemClass_block_invoke((uint64_t)&v23);
          __int16 v20 = (void *)v29[3];
        }
        id v21 = v20;
        _Block_object_dispose(&v28, 8);
        id v6 = (void *)[[v21 alloc] initWithUniqueIdentifier:v19 domainIdentifier:@"com.apple.siri.interactions" attributeSet:v12];
      }
      else
      {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (CSSearchableItem)_searchableItem
{
  return (CSSearchableItem *)[(INInteraction *)self _searchableItemIncludingData:0];
}

- (id)_dictionaryRepresentation
{
  v26[7] = *MEMORY[0x1E4F143B8];
  uint64_t intent = (uint64_t)self->_intent;
  uint64_t v24 = intent;
  v25[0] = @"intent";
  if (!intent)
  {
    uint64_t intent = [MEMORY[0x1E4F1CA98] null];
  }
  id v21 = (void *)intent;
  v26[0] = intent;
  v25[1] = @"intentResponse";
  intentResponse = self->_intentResponse;
  uint64_t v5 = (uint64_t)intentResponse;
  if (!intentResponse)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  __int16 v20 = (void *)v5;
  v26[1] = v5;
  v25[2] = @"intentHandlingStatus";
  INIntentHandlingStatus v6 = [(INInteraction *)self intentHandlingStatus];
  unint64_t v7 = v6;
  if ((unint64_t)v6 <= INIntentHandlingStatusUserConfirmationRequired)
  {
    id v8 = off_1E55166C0[v6];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v23 = v8;
  v26[2] = v8;
  v25[3] = @"direction";
  INInteractionDirection v9 = [(INInteraction *)self direction];
  unint64_t v10 = v9;
  if ((unint64_t)v9 <= INInteractionDirectionIncoming)
  {
    id v11 = off_1E55166F8[v9];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v22 = v11;
  v26[3] = v11;
  v25[4] = @"dateInterval";
  dateInterval = self->_dateInterval;
  uint64_t v13 = dateInterval;
  if (!dateInterval)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[4] = v13;
  v25[5] = @"identifier";
  identifier = self->_identifier;
  v15 = identifier;
  if (!identifier)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[5] = v15;
  v25[6] = @"groupIdentifier";
  groupIdentifier = self->_groupIdentifier;
  uint64_t v17 = groupIdentifier;
  if (!groupIdentifier)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[6] = v17;
  __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:7];
  if (groupIdentifier)
  {
    if (identifier) {
      goto LABEL_19;
    }
LABEL_32:

    if (dateInterval) {
      goto LABEL_20;
    }
    goto LABEL_33;
  }

  if (!identifier) {
    goto LABEL_32;
  }
LABEL_19:
  if (dateInterval) {
    goto LABEL_20;
  }
LABEL_33:

LABEL_20:
  if (v10 >= 3) {

  }
  if (v7 >= 7) {
  if (!intentResponse)
  }

  if (!v24) {

  }
  return v18;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INInteraction;
  INIntentHandlingStatus v6 = [(INInteraction *)&v11 description];
  unint64_t v7 = [(INInteraction *)self _dictionaryRepresentation];
  id v8 = [v7 descriptionAtIndent:a3];
  INInteractionDirection v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INInteraction *)self descriptionAtIndent:0];
}

- (unint64_t)hash
{
  unint64_t v3 = [(INIntent *)self->_intent hash];
  uint64_t v4 = [(INIntentResponse *)self->_intentResponse hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_identifier hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDateInterval *)self->_dateInterval hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_groupIdentifier hash];
  id v8 = [NSNumber numberWithInteger:self->_direction];
  uint64_t v9 = [v8 hash];
  unint64_t v10 = [NSNumber numberWithInteger:self->_intentHandlingStatus];
  uint64_t v11 = v7 ^ v9 ^ [v10 hash];
  uint64_t v12 = [(NSUUID *)self->_contextExtensionUUID hash];
  uint64_t v13 = v12 ^ [(SAUISnippet *)self->_snippet hash];
  int v14 = [NSNumber numberWithBool:self->_donatedBySiri];
  unint64_t v15 = v11 ^ v13 ^ [v14 hash];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (INInteraction *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      identifier = self->_identifier;
      BOOL v13 = 0;
      if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
      {
        uint64_t intent = self->_intent;
        if (intent == v5->_intent || -[INIntent isEqual:](intent, "isEqual:"))
        {
          intentResponse = self->_intentResponse;
          if (intentResponse == v5->_intentResponse
            || -[INIntentResponse isEqual:](intentResponse, "isEqual:"))
          {
            dateInterval = self->_dateInterval;
            if (dateInterval == v5->_dateInterval || -[NSDateInterval isEqual:](dateInterval, "isEqual:"))
            {
              groupIdentifier = self->_groupIdentifier;
              if ((groupIdentifier == v5->_groupIdentifier
                 || -[NSString isEqual:](groupIdentifier, "isEqual:"))
                && self->_direction == v5->_direction
                && self->_donatedBySiri == v5->_donatedBySiri)
              {
                contextExtensionUUID = self->_contextExtensionUUID;
                if (contextExtensionUUID == v5->_contextExtensionUUID
                  || -[NSUUID isEqual:](contextExtensionUUID, "isEqual:"))
                {
                  snippet = self->_snippet;
                  if (snippet == v5->_snippet || -[SAUISnippet isEqual:](snippet, "isEqual:")) {
                    BOOL v13 = 1;
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  NSUInteger v7 = [v5 _keyImage];
  id v8 = [v6 _keyImage];

  if (v7 && v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = -1;
    }
  }
  else
  {
    if (v8) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v7) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = v10;
    }
  }

  return v9;
}

- (INImage)_keyImage
{
  unint64_t v3 = [(INInteraction *)self intentResponse];
  uint64_t v4 = [v3 _keyImage];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    NSUInteger v7 = [(INInteraction *)self intent];
    id v6 = [v7 _keyImage];
  }

  return (INImage *)v6;
}

uint64_t __52__INInteraction__injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __52__INInteraction__injectProxiesForImages_completion___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _setIntentResponse:a2];
  }
  return result;
}

void __59__INInteraction__donateInteractionWithBundleId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  NSUInteger v7 = INSiriLogContextIntents;
  if (v6 && os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v21 = "-[INInteraction _donateInteractionWithBundleId:completion:]_block_invoke";
    __int16 v22 = 2112;
    uint64_t v23 = v14;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, "%s Error injecting image proxies into %{publc}@: %{public}@", buf, 0x20u);
    NSUInteger v7 = INSiriLogContextIntents;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int64_t v9 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    id v21 = "-[INInteraction _donateInteractionWithBundleId:completion:]_block_invoke";
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    __int16 v24 = 2114;
    id v25 = v9;
    _os_log_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_INFO, "%s Adding interaction (%@) to searchable index for %{public}@", buf, 0x20u);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v10 = *(void **)(a1 + 56);
  uint64_t v12 = *MEMORY[0x1E4F28358];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__INInteraction__donateInteractionWithBundleId_completion___block_invoke_92;
  v15[3] = &unk_1E5516628;
  id v19 = *(id *)(a1 + 64);
  id v16 = v5;
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  id v13 = v5;
  [v10 addInteraction:v13 bundleID:v11 protectionClass:v12 completionHandler:v15];
}

- (void)_setDonatedBySiri:(BOOL)a3
{
  if (INThisProcessIsSystemProcess_onceToken != -1) {
    dispatch_once(&INThisProcessIsSystemProcess_onceToken, &__block_literal_global_48);
  }
  if (INThisProcessIsSystemProcess_isSystemProcess) {
    BOOL v5 = a3;
  }
  else {
    BOOL v5 = 0;
  }
  self->_donatedBySiri = v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t intent = self->_intent;
  id v5 = a3;
  [v5 encodeObject:intent forKey:@"intent"];
  [v5 encodeObject:self->_intentResponse forKey:@"intentResponse"];
  [v5 encodeObject:self->_contextExtensionUUID forKey:@"_contextExtensionUUID"];
  [v5 encodeInteger:self->_direction forKey:@"direction"];
  [v5 encodeObject:self->_dateInterval forKey:@"dateInterval"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_groupIdentifier forKey:@"groupIdentifier"];
  [v5 encodeInteger:self->_intentHandlingStatus forKey:@"intentHandlingStatus"];
  [v5 encodeBool:self->_donatedBySiri forKey:@"_donatedBySiri"];
  [v5 encodeObject:self->_snippet forKey:@"_snippet"];
}

+ (unint64_t)_searchableItemVersion
{
  return 7;
}

+ (void)deleteInteractionsWithGroupIdentifier:(NSString *)groupIdentifier completion:(void *)completion
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = completion;
  id v6 = groupIdentifier;
  NSUInteger v7 = [getCSSearchableIndexClass() defaultSearchableIndex];
  v12[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__INInteraction_deleteInteractionsWithGroupIdentifier_completion___block_invoke;
  v10[3] = &unk_1E551AD18;
  id v11 = v5;
  id v9 = v5;
  [v7 deleteInteractionsWithGroupIdentifiers:v8 completionHandler:v10];
}

void __66__INInteraction_deleteInteractionsWithGroupIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F28A50];
      v10[0] = v3;
      NSUInteger v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      uint64_t v8 = [v6 errorWithDomain:@"IntentsErrorDomain" code:1904 userInfo:v7];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
    }
    else
    {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
}

+ (void)deleteInteractionsWithIdentifiers:(NSArray *)identifiers completion:(void *)completion
{
  uint64_t v5 = completion;
  id v6 = identifiers;
  NSUInteger v7 = [getCSSearchableIndexClass() defaultSearchableIndex];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__INInteraction_deleteInteractionsWithIdentifiers_completion___block_invoke;
  v9[3] = &unk_1E551AD18;
  id v10 = v5;
  id v8 = v5;
  [v7 deleteInteractionsWithIdentifiers:v6 completionHandler:v9];
}

void __62__INInteraction_deleteInteractionsWithIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F28A50];
      v10[0] = v3;
      NSUInteger v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      id v8 = [v6 errorWithDomain:@"IntentsErrorDomain" code:1903 userInfo:v7];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
    }
    else
    {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
}

+ (void)deleteAllInteractionsWithCompletion:(void *)completion
{
  id v3 = completion;
  uint64_t v4 = [getCSSearchableIndexClass() defaultSearchableIndex];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__INInteraction_deleteAllInteractionsWithCompletion___block_invoke;
  v6[3] = &unk_1E551AD18;
  id v7 = v3;
  id v5 = v3;
  [v4 deleteAllInteractionsWithCompletionHandler:v6];
}

void __53__INInteraction_deleteAllInteractionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    if (v3)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F28A50];
      v10[0] = v3;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      id v8 = [v6 errorWithDomain:@"IntentsErrorDomain" code:1902 userInfo:v7];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
    }
    else
    {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
}

- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(INInteraction *)self intent];
  char v8 = objc_msgSend(v7, "_intents_enumerateObjectsOfClass:withBlock:", a3, v6);

  uint64_t v9 = [(INInteraction *)self intentResponse];
  LOBYTE(a3) = objc_msgSend(v9, "_intents_enumerateObjectsOfClass:withBlock:", a3, v6);

  return v8 | a3;
}

@end