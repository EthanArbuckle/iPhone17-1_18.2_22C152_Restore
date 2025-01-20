@interface INIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (id)responseFailure;
+ (id)responseSuccess;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromIntentResponseCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
+ (int64_t)_intentHandlingStatusFromCode:(int64_t)a3;
+ (void)initialize;
- (BOOL)_commonInit;
- (BOOL)_enumerateWithValueProcessingBlock:(id)a3;
- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4;
- (BOOL)_isSuccess;
- (BOOL)_isValidKey:(id)a3;
- (BOOL)_requiresAuthentication;
- (BOOL)_requiresProtectedData;
- (BOOL)_shouldForwardIntentToApp;
- (BOOL)_userConfirmationRequired;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (INCodableDescription)_codableDescription;
- (INImage)_keyImage;
- (INIntentResponse)init;
- (INIntentResponse)initWithBackingStore:(id)a3;
- (INIntentResponse)initWithCoder:(id)a3;
- (INIntentResponse)initWithPropertiesByName:(id)a3;
- (INIntentResponseCodableCode)_intentResponseCodableCode;
- (INIntentResponseDescription)_instanceDescription;
- (NSDictionary)_JSONDictionaryRepresentation;
- (NSDictionary)propertiesByName;
- (NSString)_className;
- (NSString)_payloadResponseTypeName;
- (NSString)description;
- (NSUserActivity)userActivity;
- (PBCodable)_responseMessagePBRepresentation;
- (_INPBIntentResponse)backingStore;
- (id)_dictionaryRepresentation;
- (id)_inCodable;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)_intents_cacheableObjects;
- (id)_originatingBundleIdentifier;
- (id)_payloadResponseMessageData;
- (id)_propertiesByNameForLanguage:(id)a3;
- (id)_propertiesByNameWithLocalizer:(id)a3;
- (id)_querySchemaWithBlock:(id)a3;
- (id)_renderedResponseForLanguage:(id)a3 requiresSiriCompatibility:(BOOL)a4;
- (id)_renderedResponseWithLocalizer:(id)a3 requiresSiriCompatibility:(BOOL)a4;
- (id)_responseTemplateForLanguage:(id)a3;
- (id)_responseTemplateForLanguage:(id)a3 requiresSiriCompatibility:(BOOL)a4;
- (id)_responseTemplateWithLocalizer:(id)a3;
- (id)_responseTemplateWithLocalizer:(id)a3 requiresSiriCompatibility:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)intentSlotDescriptions;
- (id)localizeValueOfSlotDescription:(id)a3 withLocalizer:(id)a4;
- (id)valueForKey:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)_code;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4;
- (int64_t)_intentHandlingStatus;
- (int64_t)_intentResponseCode;
- (int64_t)_intents_toggleState;
- (int64_t)_stage;
- (int64_t)_stageWithName:(id)a3;
- (int64_t)_type;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)_setCode:(int64_t)a3;
- (void)_setPayloadResponseMessageData:(id)a3;
- (void)_setPayloadResponseTypeName:(id)a3;
- (void)_setRequiresAuthentication:(BOOL)a3;
- (void)_setRequiresProtectedData:(BOOL)a3;
- (void)_setResponseMessagePBRepresentation:(id)a3;
- (void)_setStage:(int64_t)a3;
- (void)_updateWithJSONDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPropertiesByName:(id)a3;
- (void)setUserActivity:(NSUserActivity *)userActivity;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation INIntentResponse

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
}

- (id)localizeValueOfSlotDescription:(id)a3 withLocalizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 facadePropertyName];
  v9 = [(INIntentResponse *)self valueForKey:v8];
  v10 = [v7 localizeValue:v9 withLocalizer:v6];

  return v10;
}

- (id)intentSlotDescriptions
{
  v2 = (objc_class *)objc_opt_class();
  v3 = INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v2);
  v4 = [v3 slotsByName];
  v5 = [v4 allValues];

  return v5;
}

- (int64_t)_intents_toggleState
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(INIntentResponse *)self _instanceDescription];
  v4 = [v3 slotsByName];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        v10 = [(INIntentResponse *)self _instanceDescription];
        v11 = [v10 slotsByName];
        v12 = [v11 objectForKey:v9];

        if ([v12 valueType] == 204)
        {
          v14 = [(INIntentResponse *)self valueForKey:v9];
          int64_t v13 = [v14 integerValue];

          goto LABEL_11;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  int64_t v13 = 0;
LABEL_11:

  return v13;
}

- (id)_renderedResponseWithLocalizer:(id)a3 requiresSiriCompatibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(INIntentResponse *)self _responseTemplateWithLocalizer:v6 requiresSiriCompatibility:v4];
  uint64_t v8 = [(INIntentResponse *)self _propertiesByNameWithLocalizer:v6];
  uint64_t v9 = 0;
  if ([v7 length] && v8)
  {
    if ([(INIntentResponse *)self _type] == 2)
    {
      v10 = [(INIntentResponse *)self _responseMessagePBRepresentation];
      uint64_t v9 = INReplaceVariablesInFormatStringFromCodable(v7, v6, v10, 0, 0);
    }
    else
    {
      uint64_t v9 = INReplaceVariablesInFormatStringFromSlotComposing(v7, v6, self);
    }
  }

  return v9;
}

- (id)_renderedResponseForLanguage:(id)a3 requiresSiriCompatibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[INStringLocalizer localizerForLanguage:a3];
  uint64_t v7 = [(INIntentResponse *)self _renderedResponseWithLocalizer:v6 requiresSiriCompatibility:v4];

  return v7;
}

- (id)_propertiesByNameWithLocalizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = [(INIntentResponse *)self propertiesByName];
  uint64_t v7 = objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));

  uint64_t v8 = [(INIntentResponse *)self propertiesByName];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __59__INIntentResponse_Custom___propertiesByNameWithLocalizer___block_invoke;
  long long v16 = &unk_1E551B7C8;
  id v17 = v7;
  id v18 = v4;
  id v9 = v4;
  id v10 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:&v13];

  v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16);

  return v11;
}

void __59__INIntentResponse_Custom___propertiesByNameWithLocalizer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  objc_msgSend(a3, "_intents_localizedCopyWithLocalizer:", v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v7 forKey:v6];
}

- (id)_propertiesByNameForLanguage:(id)a3
{
  id v4 = +[INStringLocalizer localizerForLanguage:a3];
  uint64_t v5 = [(INIntentResponse *)self _propertiesByNameWithLocalizer:v4];

  return v5;
}

- (id)_responseTemplateWithLocalizer:(id)a3 requiresSiriCompatibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(INIntentResponse *)self _type] == 2)
  {
    id v7 = [(INIntentResponse *)self _intentResponseCodableCode];
    uint64_t v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
    id v9 = [(INIntentResponse *)self _originatingBundleIdentifier];
    id v10 = (__CFBundle *)[v6 bundleWithIdentifier:v9 fileURL:0];

    if (!v10)
    {
      id v11 = _INVCIntentDefinitionManagerClass();
      v12 = [(INIntentResponse *)self _originatingBundleIdentifier];
      uint64_t v13 = [v11 intentDefinitionURLsForBundleID:v12];
      uint64_t v14 = [v13 firstObject];
      v15 = [v14 URLByDeletingLastPathComponent];

      long long v16 = [(INIntentResponse *)self _originatingBundleIdentifier];
      id v10 = (__CFBundle *)[v6 bundleWithIdentifier:v16 fileURL:v15];

      if (!v10) {
        goto LABEL_26;
      }
    }
    if (!v4 || [v6 matchesBundleLocalizations:v10])
    {
      uint64_t v17 = [v7 conciseFormatStringLocID];
      uint64_t v18 = [v7 formatStringLocID];
      long long v19 = [v7 conciseFormatString];
      uint64_t v20 = [v7 formatString];
      uint64_t v21 = (void *)v20;
      v35 = (void *)v18;
      v36 = (void *)v17;
      if (v18) {
        v22 = (void *)v18;
      }
      else {
        v22 = (void *)v17;
      }
      if (v17) {
        v23 = (void *)v17;
      }
      else {
        v23 = (void *)v18;
      }
      if (v20) {
        v24 = (void *)v20;
      }
      else {
        v24 = v19;
      }
      if (v19) {
        v25 = v19;
      }
      else {
        v25 = (void *)v20;
      }
      v38 = v6;
      if (v4) {
        v26 = v22;
      }
      else {
        v26 = v23;
      }
      if (v4) {
        v27 = v24;
      }
      else {
        v27 = v25;
      }
      id v28 = v27;
      id v29 = v26;
      [v8 _objectDescription];
      v30 = v37 = v7;
      v31 = [v30 _localizationTable];
      v32 = [v31 tableName];
      v33 = INLocalizedFormatStringFromCodable(v29, v28, v32, v10, v38, v8, 0, 0, 0);

      id v6 = v38;
      id v7 = v37;
    }
    else
    {
LABEL_26:
      v33 = 0;
    }
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)_responseTemplateWithLocalizer:(id)a3
{
  return [(INIntentResponse *)self _responseTemplateWithLocalizer:a3 requiresSiriCompatibility:0];
}

- (id)_responseTemplateForLanguage:(id)a3 requiresSiriCompatibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[INStringLocalizer localizerForLanguage:a3];
  id v7 = [(INIntentResponse *)self _responseTemplateWithLocalizer:v6 requiresSiriCompatibility:v4];

  return v7;
}

- (id)_responseTemplateForLanguage:(id)a3
{
  BOOL v4 = +[INStringLocalizer localizerForLanguage:a3];
  uint64_t v5 = [(INIntentResponse *)self _responseTemplateWithLocalizer:v4];

  return v5;
}

- (BOOL)_isSuccess
{
  return [(INIntentResponse *)self _intentResponseCode] != 5
      && [(INIntentResponse *)self _intentResponseCode] != 6;
}

- (id)_originatingBundleIdentifier
{
  v3 = [(INIntentResponse *)self _payloadResponseTypeName];
  int v4 = [v3 hasPrefix:@"sirikit.intents.custom."];

  if (v4)
  {
    uint64_t v5 = [(INIntentResponse *)self _payloadResponseTypeName];
    id v6 = [v5 substringFromIndex:objc_msgSend(@"sirikit.intents.custom.", "length")];
    id v7 = [v6 componentsSeparatedByString:@"."];

    uint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", 0, objc_msgSend(v7, "count") - 1);
    id v9 = [v8 componentsJoinedByString:@"."];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v5);
  id v7 = [v6 slotsByName];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__INIntentResponse_INCacheSupport___intents_updateContainerWithCache___block_invoke;
  v9[3] = &unk_1E551C6F8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

void __70__INIntentResponse_INCacheSupport___intents_updateContainerWithCache___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  id v17 = v4;
  id v6 = [v4 facadePropertyName];
  id v7 = [v5 valueForKeyPath:v6];

  if (v7)
  {
    if ([v7 conformsToProtocol:&unk_1EDBB1EE8])
    {
      objc_msgSend(v7, "_intents_updateContainerWithCache:", *(void *)(a1 + 40));
      id v8 = *(void **)(a1 + 32);
      id v9 = [v17 facadePropertyName];
      [v8 setValue:v7 forKeyPath:v9];
LABEL_4:

      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = *(void **)(a1 + 40);
      id v11 = [v7 _identifier];
      v12 = [v10 cacheableObjectForIdentifier:v11];

      if (v12)
      {
        uint64_t v13 = *(void **)(a1 + 40);
        uint64_t v14 = [v7 _identifier];
        id v9 = [v13 cacheableObjectForIdentifier:v14];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v9 _imageSize];
          objc_msgSend(v7, "_setImageSize:");
          v15 = *(void **)(a1 + 32);
          long long v16 = [v17 facadePropertyName];
          [v15 setValue:v7 forKeyPath:v16];
        }
        goto LABEL_4;
      }
    }
  }
LABEL_9:
}

- (id)_intents_cacheableObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v4);
  id v6 = [v5 slotsByName];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __61__INIntentResponse_INCacheSupport___intents_cacheableObjects__block_invoke;
  v15 = &unk_1E551C6F8;
  long long v16 = self;
  id v7 = v3;
  id v17 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:&v12];

  id v8 = [(INIntentResponse *)self userActivity];
  if (v8) {
    [v7 addObject:v8];
  }
  if ([v7 count]) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  return v10;
}

uint64_t __61__INIntentResponse_INCacheSupport___intents_cacheableObjects__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [a3 facadePropertyName];
  id v10 = [v4 valueForKeyPath:v5];

  id v7 = v10;
  if (v10)
  {
    if ([v10 conformsToProtocol:&unk_1EDBCF518]) {
      [*(id *)(a1 + 40) addObject:v10];
    }
    uint64_t v6 = [v10 conformsToProtocol:&unk_1EDBB1EE8];
    id v7 = v10;
    if (v6)
    {
      id v8 = objc_msgSend(v10, "_intents_cacheableObjects");
      if ([v8 count]) {
        [*(id *)(a1 + 40) unionSet:v8];
      }

      id v7 = v10;
    }
  }

  return MEMORY[0x1F41817F8](v6, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_codableDescription, 0);
  objc_storeStrong((id *)&self->_responseMessagePBRepresentation, 0);

  objc_storeStrong((id *)&self->_backingStore, 0);
}

- (BOOL)_userConfirmationRequired
{
  return self->__userConfirmationRequired;
}

- (void)_setStage:(int64_t)a3
{
  self->__stage = a3;
}

- (int64_t)_stage
{
  return self->__stage;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  return 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(INIntentResponse *)self _inCodable];
  id v9 = v8;
  if (v8)
  {
    if ([v8 isValidKey:v7])
    {
      [v9 setValue:v6 forPropertyNamed:v7];
      id v10 = [v9 data];
      [(INIntentResponse *)self _setPayloadResponseMessageData:v10];
    }
    else
    {
      id v11 = (void *)INSiriLogContextIntents;
      if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT)) {
        goto LABEL_7;
      }
      id v10 = v11;
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 136315650;
      long long v16 = "-[INIntentResponse setValue:forUndefinedKey:]";
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      _os_log_fault_impl(&dword_18CB2F000, v10, OS_LOG_TYPE_FAULT, "%s '%@' is an invalid parameter for '%@'. Please make sure that your intent definition file is valid.", buf, 0x20u);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)INIntentResponse;
    [(INIntentResponse *)&v14 setValue:v6 forUndefinedKey:v7];
  }
LABEL_7:
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _inCodable];
  id v6 = v5;
  if (!v5)
  {
    v14.receiver = self;
    v14.super_class = (Class)INIntentResponse;
    uint64_t v7 = [(INIntentResponse *)&v14 valueForUndefinedKey:v4];
    goto LABEL_5;
  }
  if ([v5 isValidKey:v4])
  {
    uint64_t v7 = [v6 valueForPropertyNamed:v4];
LABEL_5:
    id v8 = (void *)v7;
    goto LABEL_9;
  }
  id v9 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
  {
    id v11 = v9;
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 136315650;
    long long v16 = "-[INIntentResponse valueForUndefinedKey:]";
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    _os_log_fault_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_FAULT, "%s '%@' is an invalid parameter for '%@'. Please make sure that your intent definition file is valid.", buf, 0x20u);
  }
  id v8 = 0;
LABEL_9:

  return v8;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _inCodable];
  id v6 = v5;
  if (v5 && [v5 isValidKey:v4])
  {
    uint64_t v7 = [v6 valueForPropertyNamed:v4];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)INIntentResponse;
    uint64_t v7 = [(INIntentResponse *)&v10 valueForKey:v4];
  }
  id v8 = (void *)v7;

  return v8;
}

- (id)_inCodable
{
  id v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_querySchemaWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(_INPBIntentResponse *)self->_backingStore payloadSuccess];
  id v6 = [v5 responseTypeName];
  uint64_t v14 = 0;
  id v15 = 0;
  uint64_t v7 = INSchemaWithTypeName(v6, &v15, &v14);
  id v8 = v15;

  uint64_t v9 = v4[2](v4, v7);
  if (v9)
  {
    objc_super v10 = (void *)v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v12 = +[INSchema _defaultSchemaForBundle:v11];

    objc_super v10 = v4[2](v4, (void *)v12);
    uint64_t v7 = (void *)v12;
  }

  return v10;
}

- (BOOL)_isValidKey:(id)a3
{
  id v4 = (NSString *)a3;
  uint64_t v5 = [(INIntentResponse *)self _inCodable];
  id v6 = v5;
  if (v5)
  {
    char v7 = [v5 isValidKey:v4];
  }
  else
  {
    NSSelectorFromString(v4);

    char v7 = objc_opt_respondsToSelector();
  }

  return v7 & 1;
}

- (void)_setResponseMessagePBRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_responseMessagePBRepresentation, a3);
  id v5 = a3;
  id v6 = [v5 data];

  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (PBCodable)_responseMessagePBRepresentation
{
  responseMessagePBRepresentation = self->_responseMessagePBRepresentation;
  if (!responseMessagePBRepresentation)
  {
    id v4 = [(INIntentResponse *)self _payloadResponseMessageData];
    switch([(INIntentResponse *)self _type])
    {
      case 0:
      case 3:
        id v5 = (objc_class *)_INPBGenericIntentResponse;
        if (!v4) {
          goto LABEL_6;
        }
        goto LABEL_4;
      case 1:
        char v7 = (objc_class *)objc_opt_class();
        id v8 = INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v7);
        uint64_t v9 = [v8 dataClass];

        id v5 = (objc_class *)v9;
        if (v4) {
LABEL_4:
        }
          id v6 = (PBCodable *)[[v5 alloc] initWithData:v4];
        else {
LABEL_6:
        }
          id v6 = (PBCodable *)objc_alloc_init(v5);
        goto LABEL_11;
      case 2:
        objc_super v10 = [INCodable alloc];
        if (v4) {
          id v11 = v4;
        }
        else {
          id v11 = 0;
        }
        id v6 = [(INCodable *)v10 initWithCodableDescription:self->_codableDescription data:v11];
LABEL_11:
        uint64_t v12 = self->_responseMessagePBRepresentation;
        self->_responseMessagePBRepresentation = v6;

        break;
      default:
        break;
    }

    responseMessagePBRepresentation = self->_responseMessagePBRepresentation;
  }

  return responseMessagePBRepresentation;
}

- (int64_t)_codeWithName:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(INIntentResponse *)self _className];
  id v6 = [v5 stringByAppendingString:@"CodeUnspecified"];
  char v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    int64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [v5 stringByAppendingString:@"CodeReady"];
    char v10 = [v4 isEqualToString:v9];

    if (v10)
    {
      int64_t v8 = 1;
    }
    else
    {
      id v11 = [v5 stringByAppendingString:@"CodeInProgress"];
      char v12 = [v4 isEqualToString:v11];

      if (v12)
      {
        int64_t v8 = 3;
      }
      else
      {
        uint64_t v13 = [v5 stringByAppendingString:@"CodeSuccess"];
        char v14 = [v4 isEqualToString:v13];

        if (v14)
        {
          int64_t v8 = 4;
        }
        else
        {
          id v15 = [v5 stringByAppendingString:@"CodeFailure"];
          char v16 = [v4 isEqualToString:v15];

          if (v16)
          {
            int64_t v8 = 5;
          }
          else
          {
            __int16 v17 = [v5 stringByAppendingString:@"CodeContinueInApp"];
            char v18 = [v4 isEqualToString:v17];

            if (v18)
            {
              int64_t v8 = 2;
            }
            else
            {
              __int16 v19 = [v5 stringByAppendingString:@"CodeFailureRequiringAppLaunch"];
              char v20 = [v4 isEqualToString:v19];

              if (v20)
              {
                int64_t v8 = 6;
              }
              else
              {
                uint64_t v21 = [v5 stringByAppendingString:@"CodeUserConfirmationRequired"];
                char v22 = [v4 isEqualToString:v21];

                if (v22)
                {
                  int64_t v8 = 8;
                }
                else
                {
                  v23 = [v5 stringByAppendingString:@"CodeHandleInApp"];
                  int v24 = [v4 isEqualToString:v23];

                  if (v24) {
                    int64_t v8 = 7;
                  }
                  else {
                    int64_t v8 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v25 = [(INIntentResponse *)self _inCodable];

  if (v25)
  {
    v26 = [(INIntentResponse *)self _inCodable];
    v27 = [v26 _objectDescription];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = [v27 responseCodes];
    uint64_t v28 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      v41 = v27;
      v42 = v26;
      int64_t v40 = v8;
      v44 = v5;
      uint64_t v30 = *(void *)v46;
      while (2)
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v46 != v30) {
            objc_enumerationMutation(obj);
          }
          v32 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v33 = [v32 name];
          v34 = NSString;
          v35 = [v33 substringToIndex:1];
          v36 = [v35 uppercaseString];
          v37 = [v33 substringFromIndex:1];
          v38 = [v34 stringWithFormat:@"%@Code%@%@", v44, v36, v37];

          if ([v4 isEqualToString:v38])
          {
            int64_t v8 = [v32 value];

            id v5 = v44;
            goto LABEL_31;
          }
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
        if (v29) {
          continue;
        }
        break;
      }
      id v5 = v44;
      int64_t v8 = v40;
LABEL_31:
      v27 = v41;
      v26 = v42;
    }
  }
  return v8;
}

- (int64_t)_stageWithName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Confirm"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Handle"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setPropertiesByName:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v7 = v5;
    int64_t v8 = objc_msgSend([v6 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__INIntentResponse_setPropertiesByName___block_invoke;
    v11[3] = &unk_1E551D838;
    id v12 = v8;
    id v9 = v8;
    [v4 enumerateKeysAndObjectsUsingBlock:v11];
    [v7 setProperties:v9];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __40__INIntentResponse_setPropertiesByName___block_invoke_2;
      v10[3] = &unk_1E551D838;
      v10[4] = self;
      [v4 enumerateKeysAndObjectsUsingBlock:v10];
    }
  }
}

void __40__INIntentResponse_setPropertiesByName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  INIntentSlotValueTransformToProperty(a3, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

uint64_t __40__INIntentResponse_setPropertiesByName___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forUndefinedKey:a2];
}

- (NSDictionary)propertiesByName
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 properties];
    if ([v3 count]) {
      id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
    }
    else {
      id v4 = 0;
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "role", (void)v15);
          if (v12)
          {
            uint64_t v13 = INIntentSlotValueTransformFromProperty(v11);
            [v4 setObject:v13 forKeyedSubscript:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    id v5 = (void *)[v4 copy];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v2 _dictionaryRepresentationWithNullValues:0];
    }
    else
    {
      id v5 = 0;
    }
  }

  return (NSDictionary *)v5;
}

- (INIntentResponse)initWithPropertiesByName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_INPBIntentResponse);
  id v6 = [(INIntentResponse *)self initWithBackingStore:v5];

  if (v6) {
    [(INIntentResponse *)v6 setPropertiesByName:v4];
  }

  return v6;
}

- (INCodableDescription)_codableDescription
{
  codableDescription = self->_codableDescription;
  if (!codableDescription)
  {
    id v4 = [(INIntentResponse *)self _inCodable];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 _objectDescription];
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __39__INIntentResponse__codableDescription__block_invoke;
      v9[3] = &unk_1E551D810;
      v9[4] = self;
      id v6 = [(INIntentResponse *)self _querySchemaWithBlock:v9];
    }
    uint64_t v7 = self->_codableDescription;
    self->_codableDescription = v6;

    codableDescription = self->_codableDescription;
  }

  return codableDescription;
}

id __39__INIntentResponse__codableDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _className];
  id v5 = [v3 intentResponseCodableDescriptionWithIntentResponseClassName:v4];

  return v5;
}

- (id)_dictionaryRepresentation
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(INIntentResponse *)self _className];
  unint64_t v4 = [(INIntentResponse *)self code];
  id v5 = v3;
  id v6 = v5;
  if (v4 > 8)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v5 stringByAppendingString:off_1E551D858[v4]];
  }

  if (v7)
  {
    int v8 = 0;
    v26[0] = @"code";
LABEL_6:
    uint64_t v9 = v7;
    goto LABEL_13;
  }
  if ([(INIntentResponse *)self _type] == 2
    && ([(INIntentResponse *)self _intentResponseCodableCode],
        char v10 = objc_claimAutoreleasedReturnValue(),
        [v10 name],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    id v12 = NSString;
    uint64_t v13 = [(INIntentResponse *)self _className];
    char v14 = [v11 substringToIndex:1];
    long long v15 = [v14 uppercaseString];
    long long v16 = [v11 substringFromIndex:1];
    uint64_t v7 = [v12 stringWithFormat:@"%@Code%@%@", v13, v15, v16];

    v26[0] = @"code";
    if (v7)
    {
      int v8 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v26[0] = @"code";
  }
  uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v7 = 0;
  int v8 = 1;
LABEL_13:
  v26[1] = @"userActivity";
  v27[0] = v9;
  long long v17 = [(INIntentResponse *)self userActivity];
  long long v18 = v17;
  if (!v17)
  {
    long long v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[1] = v18;
  __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  if (!v17) {

  }
  if (v8) {
  uint64_t v20 = [(INIntentResponse *)self _inCodable];
  }

  if (v20)
  {
    uint64_t v21 = (void *)[v19 mutableCopy];
    char v22 = [(INIntentResponse *)self _inCodable];
    v23 = [v22 dictionaryRepresentation];
    [v21 addEntriesFromDictionary:v23];

    uint64_t v24 = [v21 copy];
    __int16 v19 = (void *)v24;
  }

  return v19;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INIntentResponse;
  id v6 = [(INIntentResponse *)&v11 description];
  uint64_t v7 = [(INIntentResponse *)self _redactedDictionaryRepresentation];
  int v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INIntentResponse *)self descriptionAtIndent:0];
}

- (void)_updateWithJSONDictionary:(id)a3
{
  id v31 = a3;
  unint64_t v4 = [v31 objectForKeyedSubscript:@"properties"];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = NSString;
  int v8 = [(INIntentResponse *)self _className];
  uint64_t v9 = [v31 objectForKeyedSubscript:@"status"];
  char v10 = [v7 stringWithFormat:@"%@Code%@", v8, v9];
  [(INIntentResponse *)self _setCode:[(INIntentResponse *)self _codeWithName:v10]];

  objc_super v11 = [v31 objectForKeyedSubscript:@"stage"];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  id v13 = v12;

  int64_t v14 = [(INIntentResponse *)self _stageWithName:v13];
  [(INIntentResponse *)self _setStage:v14];
  long long v15 = objc_alloc_init(INJSONDecoder);
  long long v16 = [(INIntentResponse *)self _codableDescription];
  [(INJSONDecoder *)v15 decodeObject:self withCodableDescription:v16 from:v6];

  uint64_t v17 = objc_opt_class();
  long long v18 = [v31 objectForKeyedSubscript:@"userActivity"];
  __int16 v19 = [(INJSONDecoder *)v15 decodeObjectOfClass:v17 from:v18];
  [(INIntentResponse *)self setUserActivity:v19];

  uint64_t v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  uint64_t v22 = [v21 rangeOfString:@"Response" options:4];
  if (v22 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v23 = 0;
  }
  else
  {
    v23 = [v21 substringToIndex:v22];
  }

  uint64_t v24 = [(INIntentResponse *)self _codableDescription];
  if (v24)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v25 = v24;
    }
    else {
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
  }
  id v26 = v25;

  v27 = objc_msgSend(v26, "_nullable_schema");
  uint64_t v28 = [v27 _types];
  [v26 _reestablishReferencedCodableDescriptionsUsingTypes:v28];

  uint64_t v29 = [v27 intentCodableDescriptionWithIntentClassName:v23];
  uint64_t v30 = [v27 _types];
  [v29 _reestablishReferencedCodableDescriptionsUsingTypes:v30 intentResponseCodableDescription:v26];
}

- (NSDictionary)_JSONDictionaryRepresentation
{
  id v3 = [INJSONEncoder alloc];
  unint64_t v4 = objc_alloc_init(INJSONEncoderConfiguration);
  id v5 = +[INPreferences siriLanguageCode];
  [(INJSONEncoderConfiguration *)v4 setLanguageCode:v5];

  id v6 = [(INJSONEncoder *)v3 initWithConfiguration:v4];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v8 = [(INIntentResponse *)self _dictionaryRepresentation];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"code"];
  char v10 = [(INIntentResponse *)self _className];
  objc_super v11 = [v10 stringByAppendingString:@"Code"];
  id v12 = objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v11, "length"));
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"status");

  id v13 = [(INIntentResponse *)self _payloadResponseTypeName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"typeName");

  int64_t v14 = [(INIntentResponse *)self _codableDescription];
  long long v15 = [(INJSONEncoder *)v6 encodeObject:self withCodableDescription:v14];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"properties");

  long long v16 = [(INIntentResponse *)self userActivity];
  uint64_t v17 = [(INJSONEncoder *)v6 encodeObject:v16];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, @"userActivity");

  return (NSDictionary *)v7;
}

- (void)_setRequiresProtectedData:(BOOL)a3
{
}

- (BOOL)_requiresProtectedData
{
  return [(_INPBIntentResponse *)self->_backingStore requiresProtectedData];
}

- (void)_setRequiresAuthentication:(BOOL)a3
{
}

- (BOOL)_requiresAuthentication
{
  return [(_INPBIntentResponse *)self->_backingStore requiresAuthentication];
}

- (int64_t)_type
{
  id v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v3);
  id v5 = [v4 type];

  if (v5) {
    return 1;
  }
  id v7 = [(INIntentResponse *)self _payloadResponseTypeName];
  uint64_t v8 = [v7 hasPrefix:@"sirikit.intents.custom."];

  if (v8) {
    return 2;
  }
  uint64_t v9 = objc_opt_class();
  if (v9 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

- (NSString)_className
{
  v2 = [(INIntentResponse *)self _payloadResponseTypeName];
  if ([v2 hasPrefix:@"sirikit.intents.custom."])
  {
    id v3 = [v2 componentsSeparatedByString:@"."];
    unint64_t v4 = [v3 lastObject];
  }
  else
  {
    id v5 = (objc_class *)objc_opt_class();
    unint64_t v4 = NSStringFromClass(v5);
  }

  return (NSString *)v4;
}

- (BOOL)_shouldForwardIntentToApp
{
  return [(INIntentResponse *)self _type] != 1
      && [(INIntentResponse *)self _intentResponseCode] == 7;
}

- (INIntentResponseDescription)_instanceDescription
{
  if ([(INIntentResponse *)self _type] == 2)
  {
    id v3 = [INIntentResponseDescription alloc];
    unint64_t v4 = [(INIntentResponse *)self _className];
    id v5 = [(INIntentResponse *)self _className];
    Class v6 = NSClassFromString(v5);
    id v7 = [(INIntentResponse *)self _payloadResponseTypeName];
    uint64_t v8 = [(INIntentResponse *)self _inCodable];
    uint64_t v9 = INIntentSlotDescriptionsWithCodable(v8);
    char v10 = [(INIntentResponseDescription *)v3 initWithName:v4 facadeClass:v6 dataClass:0 type:v7 isPrivate:0 slotsByName:v9];
  }
  else
  {
    objc_super v11 = (objc_class *)objc_opt_class();
    INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v11);
    char v10 = (INIntentResponseDescription *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (INIntentResponseCodableCode)_intentResponseCodableCode
{
  if ([(INIntentResponse *)self _type] == 2)
  {
    id v3 = [(INIntentResponse *)self _inCodable];
    unint64_t v4 = [v3 _objectDescription];
    id v5 = objc_msgSend(v4, "intentResponseCodeWithCode:", -[INIntentResponse code](self, "code"));
  }
  else
  {
    id v5 = 0;
  }

  return (INIntentResponseCodableCode *)v5;
}

- (int64_t)_intentResponseCode
{
  int64_t v3 = [(INIntentResponse *)self code];
  if ([(INIntentResponse *)self _type] == 2)
  {
    unint64_t v4 = [(INIntentResponse *)self _intentResponseCodableCode];
    if ([(INIntentResponse *)self code] >= 100)
    {
      if ([(INIntentResponse *)self _stage] == 1) {
        int64_t v3 = 1;
      }
      else {
        int64_t v3 = 4;
      }
      if (![v4 isSuccess]) {
        int64_t v3 = 5;
      }
    }
  }
  return v3;
}

- (int64_t)_intentHandlingStatus
{
  int64_t v2 = [(INIntentResponse *)self _intentResponseCode];
  if ((unint64_t)(v2 - 1) > 7) {
    return 0;
  }
  else {
    return qword_18CFC4C90[v2 - 1];
  }
}

- (void)_setPayloadResponseTypeName:(id)a3
{
  backingStore = self->_backingStore;
  id v4 = a3;
  id v5 = [(_INPBIntentResponse *)backingStore payloadSuccess];
  [v5 setResponseTypeName:v4];
}

- (NSString)_payloadResponseTypeName
{
  int64_t v2 = [(_INPBIntentResponse *)self->_backingStore payloadSuccess];
  int64_t v3 = [v2 responseTypeName];

  return (NSString *)v3;
}

- (void)_setPayloadResponseMessageData:(id)a3
{
  backingStore = self->_backingStore;
  id v4 = a3;
  id v5 = [(_INPBIntentResponse *)backingStore payloadSuccess];
  [v5 setResponseMessageData:v4];
}

- (id)_payloadResponseMessageData
{
  int64_t v2 = [(_INPBIntentResponse *)self->_backingStore payloadSuccess];
  int64_t v3 = [v2 responseMessageData];

  return v3;
}

- (INIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  Class v6 = [v4 decodeObjectOfClasses:v5 forKey:@"backingStore"];

  uint64_t v7 = [v4 decodeIntegerForKey:@"code"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivityData"];
  uint64_t v9 = INUserActivityDeserializeFromData(v8);

  char v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codableDescriptionData"];
  if (v10)
  {
    id v18 = 0;
    objc_super v11 = objc_msgSend(MEMORY[0x1E4F28DC0], "_in_safeUnarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v18);
    id v12 = v18;
    if (v12)
    {
      id v13 = v12;
      [v4 failWithError:v12];

LABEL_9:
      long long v15 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    objc_super v11 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)INIntentResponse;
  int64_t v14 = [(INIntentResponse *)&v17 init];
  self = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_backingStore, v6);
    objc_storeStrong((id *)&self->_userActivity, v9);
    objc_storeStrong((id *)&self->_codableDescription, v11);
    if (![(INIntentResponse *)self _commonInit]) {
      goto LABEL_9;
    }
    [(INIntentResponse *)self _setCode:v7];
    [(INIntentResponse *)self setCode:v7];
  }
  self = self;
  long long v15 = self;
LABEL_10:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[INIntentResponse code](self, "code"), @"code");
  id v5 = INUserActivitySerializeToData(self->_userActivity);
  [v4 encodeObject:v5 forKey:@"userActivityData"];

  Class v6 = [(INIntentResponse *)self backingStore];
  [v4 encodeObject:v6 forKey:@"backingStore"];

  uint64_t v7 = [(INIntentResponse *)self _inCodable];
  uint64_t v8 = [v7 _objectDescription];

  if (v8)
  {
    id v11 = 0;
    uint64_t v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v11];
    id v10 = v11;
    if (v10) {
      [v4 failWithError:v10];
    }
    else {
      [v4 encodeObject:v9 forKey:@"codableDescriptionData"];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(INIntentResponse *)self backingStore];
  Class v6 = (id *)[v4 initWithBackingStore:v5];

  if (v6)
  {
    objc_storeStrong(v6 + 5, self->_codableDescription);
    objc_msgSend(v6, "setCode:", -[INIntentResponse code](self, "code"));
  }
  return v6;
}

- (void)setUserActivity:(NSUserActivity *)userActivity
{
  id v4 = userActivity;
  id v5 = [(NSUserActivity *)v4 _intents_copy];
  Class v6 = self->_userActivity;
  self->_userActivity = v5;

  backingStore = self->_backingStore;
  INUserActivitySerializeToBackingStore(v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [(_INPBIntentResponse *)backingStore setUserActivity:v8];
}

- (_INPBIntentResponse)backingStore
{
  if ([(INIntentResponse *)self _type] == 2
    && ([(INIntentResponse *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    [(INIntentResponse *)self _setCode:[(INIntentResponse *)self code]];
  }
  backingStore = self->_backingStore;

  return backingStore;
}

- (int64_t)_code
{
  uint64_t code = self->_code;
  if (code) {
    return code;
  }
  if ([(INIntentResponse *)self _type] == 2)
  {
    id v5 = [(INIntentResponse *)self _inCodable];
    Class v6 = [v5 valueForPropertyNamed:@"_code"];
    uint64_t code = [v6 integerValue];

    if (code > 99) {
      return code;
    }
  }
  if ([(_INPBIntentResponse *)self->_backingStore hasType]) {
    uint64_t v7 = [(_INPBIntentResponse *)self->_backingStore type];
  }
  else {
    uint64_t v7 = 3;
  }
  if ([(_INPBIntentResponse *)self->_backingStore hasPayloadFailure])
  {
    id v8 = [(_INPBIntentResponse *)self->_backingStore payloadFailure];
    if ([v8 hasErrorCode]) {
      uint64_t v9 = [v8 errorCode];
    }
    else {
      uint64_t v9 = 0x7FFFFFFFLL;
    }
    if ([v8 hasAppLaunchRequested]) {
      uint64_t v10 = [v8 appLaunchRequested];
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0x7FFFFFFFLL;
  }
  id v11 = objc_opt_class();

  return [v11 _codeFromType:v7 errorCode:v9 appLaunchRequested:v10];
}

- (void)_setCode:(int64_t)a3
{
  self->_uint64_t code = a3;
  if ([(INIntentResponse *)self _type] == 2)
  {
    id v5 = [(INIntentResponse *)self _inCodable];
    if (a3 < 100)
    {
      Class v6 = 0;
    }
    else
    {
      Class v6 = [NSNumber numberWithInteger:a3];
    }
    if ([v5 isValidKey:@"_code"]) {
      [v5 setValue:v6 forPropertyNamed:@"_code"];
    }
    [(INIntentResponse *)self _setResponseMessagePBRepresentation:v5];
  }
  int64_t v7 = [(INIntentResponse *)self _type];
  if (a3 < 100 || v7 != 2)
  {
    -[_INPBIntentResponse setType:](self->_backingStore, "setType:", [(id)objc_opt_class() _typeFromCode:a3]);
    uint64_t v8 = [(id)objc_opt_class() _errorCodeFromCode:a3];
    if (v8 != 0x7FFFFFFF)
    {
      uint64_t v9 = v8;
      uint64_t v10 = [(_INPBIntentResponse *)self->_backingStore payloadFailure];
      [v10 setErrorCode:v9];
    }
    if ([(id)objc_opt_class() _appLaunchRequestedFromCode:a3])
    {
      id v11 = [(_INPBIntentResponse *)self->_backingStore payloadFailure];
      [v11 setAppLaunchRequested:1];
    }
  }
}

- (BOOL)_commonInit
{
  int64_t v3 = [(_INPBIntentResponse *)self->_backingStore payloadSuccess];
  id v4 = [v3 responseTypeName];
  id v17 = 0;
  id v18 = 0;
  id v5 = INSchemaWithTypeName(v4, &v18, &v17);
  id v6 = v18;
  id v7 = v17;

  if (v5)
  {
    uint64_t v8 = [v5 intentResponseCodableDescriptionWithIntentResponseClassName:v6];
    if (!v8)
    {
      NSLog((NSString *)@"Unable to initialize '%@'. Please make sure that your intent definition file is valid.", v6);
      BOOL v15 = 0;
      goto LABEL_9;
    }
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [INCodable alloc];
    id v11 = [(_INPBIntentResponse *)self->_backingStore payloadSuccess];
    id v12 = [v11 responseMessageData];
    id v13 = [(INCodable *)v10 initWithCodableDescription:v9 data:v12];

    [(INIntentResponse *)self _setResponseMessagePBRepresentation:v13];
    if (([(INIntentResponse *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      int64_t v14 = [(INIntentResponse *)self code];
      if (v14 != [(INIntentResponse *)self _code]) {
        [(INIntentResponse *)self setCode:[(INIntentResponse *)self _code]];
      }
    }
  }
  BOOL v15 = 1;
LABEL_9:

  return v15;
}

- (INIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)INIntentResponse;
  id v5 = [(INIntentResponse *)&v19 init];
  if (!v5) {
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 userActivity];
    uint64_t v7 = INUserActivityDeserializeFromBackingStore(v6);
    userActivity = v5->_userActivity;
    v5->_userActivity = (NSUserActivity *)v7;

    uint64_t v9 = (_INPBIntentResponse *)[v4 copy];
  }
  else
  {
    uint64_t v9 = objc_alloc_init(_INPBIntentResponse);
  }
  backingStore = v5->_backingStore;
  v5->_backingStore = v9;

  if (![(_INPBIntentResponse *)v5->_backingStore hasType]) {
    [(_INPBIntentResponse *)v5->_backingStore setType:3];
  }
  if (![(_INPBIntentResponse *)v5->_backingStore hasPayloadSuccess])
  {
    id v11 = objc_alloc_init(_INPBIntentResponsePayloadSuccess);
    id v12 = (objc_class *)objc_opt_class();
    id v13 = INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v12);
    int64_t v14 = [v13 type];
    [(_INPBIntentResponsePayloadSuccess *)v11 setResponseTypeName:v14];

    [(_INPBIntentResponse *)v5->_backingStore setPayloadSuccess:v11];
  }
  if (![(_INPBIntentResponse *)v5->_backingStore hasPayloadFailure])
  {
    BOOL v15 = v5->_backingStore;
    long long v16 = objc_alloc_init(_INPBIntentResponsePayloadFailure);
    [(_INPBIntentResponse *)v15 setPayloadFailure:v16];
  }
  if (![(INIntentResponse *)v5 _commonInit]) {
    id v17 = 0;
  }
  else {
LABEL_12:
  }
    id v17 = v5;

  return v17;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)INIntentResponse;
  uint64_t v8 = [(INIntentResponse *)&v22 init];
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userActivity, a4);
    uint64_t v10 = objc_alloc_init(_INPBIntentResponse);
    id v11 = p_isa[3];
    p_isa[3] = v10;

    id v12 = objc_alloc_init(_INPBIntentResponsePayloadSuccess);
    id v13 = (objc_class *)objc_opt_class();
    int64_t v14 = INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v13);
    BOOL v15 = [v14 type];
    [(_INPBIntentResponsePayloadSuccess *)v12 setResponseTypeName:v15];

    [p_isa[3] setPayloadSuccess:v12];
    id v16 = p_isa[3];
    id v17 = objc_alloc_init(_INPBIntentResponsePayloadFailure);
    [v16 setPayloadFailure:v17];

    if (v7)
    {
      id v18 = p_isa[3];
      objc_super v19 = INUserActivitySerializeToBackingStore(v7);
      [v18 setUserActivity:v19];
    }
    if (![p_isa _commonInit])
    {

      uint64_t v20 = 0;
      goto LABEL_8;
    }
    [p_isa setCode:a3];
  }
  uint64_t v20 = p_isa;
LABEL_8:

  return v20;
}

- (INIntentResponse)init
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = [(INIntentResponse *)self _initWithCode:0 userActivity:0];
  if (!v2) {
    goto LABEL_20;
  }
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class()) {
    goto LABEL_20;
  }
  id v4 = objc_opt_class();
  if (![v4 isSubclassOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  id v5 = (objc_class *)objc_opt_class();
  id v6 = INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v5);
  id v7 = [v6 type];

  if (v7) {
    goto LABEL_20;
  }
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 bundleIdentifier];
  uint64_t v10 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  id v11 = objc_msgSend(v10, "if_containingAppRecord");
  id v12 = v11;
  if (v11)
  {
    id v13 = (void *)MEMORY[0x1E4F1CAD0];
    int64_t v14 = [v11 intentDefinitionURLs];
    BOOL v15 = [v14 allKeys];
    id v16 = [v13 setWithArray:v15];

    id v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    uint64_t v19 = [v18 rangeOfString:@"Response" options:4];
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {

      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v20 = [v18 substringToIndex:v19];

      if (v20 && [v16 containsObject:v20])
      {
        uint64_t v25 = [v12 bundleIdentifier];

        uint64_t v9 = (void *)v25;
LABEL_16:

        goto LABEL_17;
      }
    }
    id v26 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "-[INIntentResponse init]";
      __int16 v36 = 2112;
      v37 = v12;
      __int16 v38 = 2112;
      v39 = v20;
      _os_log_error_impl(&dword_18CB2F000, v26, OS_LOG_TYPE_ERROR, "%s App bundle record <%@> doesn't contain intent %@, falling back to current bundle", buf, 0x20u);
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = [v10 URL];
    objc_super v22 = [v8 bundleURL];
    int v23 = objc_msgSend(v21, "if_isContainedByDirectoryAtURL:", v22);

    if (v23)
    {
      uint64_t v24 = [v10 bundleIdentifier];

      uint64_t v9 = (void *)v24;
    }
  }
LABEL_17:
  if (!v9)
  {
    v27 = [v8 bundlePath];
    uint64_t v9 = [v27 lastPathComponent];
  }
  uint64_t v28 = (objc_class *)objc_opt_class();
  uint64_t v29 = NSStringFromClass(v28);
  uint64_t v30 = [NSString stringWithFormat:@"%@%@.%@", @"sirikit.intents.custom.", v9, v29];
  [v2 _setPayloadResponseTypeName:v30];
  int v31 = [v2 _commonInit];

  if (!v31)
  {
    v32 = 0;
    goto LABEL_21;
  }
LABEL_20:
  v32 = (INIntentResponse *)v2;
LABEL_21:

  return v32;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return INResolveInstanceMethod(a3, (objc_class *)a1);
}

+ (int64_t)_intentHandlingStatusFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return qword_18CFC4CF0[a3 - 1];
  }
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 6;
}

+ (int64_t)_codeFromIntentResponseCode:(int64_t)a3
{
  uint64_t v4 = [a1 _typeFromCode:a3];

  return [a1 _codeFromType:v4 errorCode:0 appLaunchRequested:0];
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return 3;
  }
  else {
    return dword_18CFC4CD0[a3 - 1];
  }
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result = 0;
  switch(a3)
  {
    case 0:
      int64_t result = 4;
      break;
    case 1:
      if (a5) {
        int64_t result = 6;
      }
      else {
        int64_t result = 5;
      }
      break;
    case 2:
      int64_t result = 3;
      break;
    case 4:
      int64_t result = 2;
      break;
    case 5:
      int64_t result = 1;
      break;
    default:
      return result;
  }
  return result;
}

+ (id)responseFailure
{
  id v2 = (void *)[objc_alloc((Class)a1) _initWithCode:0 userActivity:0];

  return v2;
}

+ (id)responseSuccess
{
  id v2 = (void *)[objc_alloc((Class)a1) _initWithCode:4 userActivity:0];

  return v2;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  return 0x7FFFFFFF;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_enumerateWithValueProcessingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (INEnumerateObjectsInCodable(v5, v4))
    {
      id v6 = [v5 data];
      [(INIntentResponse *)self _setPayloadResponseMessageData:v6];

      char v7 = 1;
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {

    char v7 = INEnumerateObjectsInIntentSlotComposing(self, v4);
    id v5 = 0;
  }

  return v7;
}

- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4
{
  id v5 = _INEnumerableValueProcessingBlock((uint64_t)a3, a4);
  LOBYTE(self) = [(INIntentResponse *)self _enumerateWithValueProcessingBlock:v5];

  return (char)self;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

- (INImage)_keyImage
{
  uint64_t v3 = INKeyImageUtilitiesSortedSubProducersForSlotComposingProducer(self);
  id v4 = [v3 firstObject];

  id v5 = [v4 valueForSlotComposer:self];
  if ([v5 conformsToProtocol:&unk_1EDBB1E40])
  {
    id v6 = [v5 _keyImage];
  }
  else
  {
    id v6 = 0;
  }

  return (INImage *)v6;
}

@end