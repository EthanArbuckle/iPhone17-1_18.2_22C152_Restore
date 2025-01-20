@interface INAppIntent
+ (BOOL)supportsSecureCoding;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (INAppIntent)initWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameters:(id)a5;
- (INAppIntent)initWithAppBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 appIntentIdentifier:(id)a5 serializedParameters:(id)a6;
- (INAppIntent)initWithAppBundleIdentifier:(id)a3 linkAction:(id)a4 linkActionMetadata:(id)a5;
- (INAppIntent)initWithCoder:(id)a3;
- (INAppIntent)initWithJSONDictionary:(id)a3;
- (INVCVoiceShortcutClient)voiceShortcutClient;
- (LNAction)linkAction;
- (NSDictionary)serializedParameters;
- (NSString)appIntentIdentifier;
- (id)_className;
- (id)_dictionaryRepresentation;
- (id)_nonNilParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extensionBundleId;
- (id)launchId;
- (id)valueForKey:(id)a3;
- (id)widgetPlistableRepresentation:(id *)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)_indexingHash;
- (unint64_t)hash;
- (void)_setExtensionBundleId:(id)a3;
- (void)_setLaunchId:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setVoiceShortcutClient:(id)a3;
@end

@implementation INAppIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_appIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_storeStrong((id *)&self->_voiceShortcutClient, 0);
  objc_storeStrong((id *)&self->_linkAction, 0);

  objc_storeStrong((id *)&self->_launchId, 0);
}

- (NSDictionary)serializedParameters
{
  return self->_serializedParameters;
}

- (NSString)appIntentIdentifier
{
  return self->_appIntentIdentifier;
}

- (void)setVoiceShortcutClient:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INAppIntent *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_35:

      goto LABEL_36;
    }
    v7 = [(INAppIntent *)self launchId];
    v8 = [(INAppIntent *)v6 launchId];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_33;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    v16 = [(INAppIntent *)self extensionBundleId];
    v17 = [(INAppIntent *)v6 extensionBundleId];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_32;
      }
      int v21 = [v14 isEqualToString:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    v22 = [(INAppIntent *)self appIntentIdentifier];
    v23 = [(INAppIntent *)v6 appIntentIdentifier];
    id v20 = v22;
    id v24 = v23;
    id v31 = v20;
    v32 = v24;
    if (v20 != v24)
    {
      LOBYTE(v12) = 0;
      if (v20)
      {
        v25 = v24;
        if (v24)
        {
          int v12 = [v20 isEqualToString:v24];

          if (!v12)
          {
            v19 = v32;
LABEL_32:

            goto LABEL_33;
          }
          goto LABEL_24;
        }
      }
      else
      {
        v25 = v24;
      }
LABEL_31:

      id v20 = v31;
      v19 = v32;
      goto LABEL_32;
    }

LABEL_24:
    v26 = [(INAppIntent *)self serializedParameters];
    v27 = [(INAppIntent *)v6 serializedParameters];
    id v28 = v26;
    id v29 = v27;
    v25 = v29;
    if (v28 == v29)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v28 && v29) {
        LOBYTE(v12) = [v28 isEqualToDictionary:v29];
      }
    }

    id v20 = v28;
    goto LABEL_31;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(INAppIntent *)self launchId];
  uint64_t v4 = [v3 hash];
  v5 = [(INAppIntent *)self extensionBundleId];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(INAppIntent *)self appIntentIdentifier];
  uint64_t v8 = [v7 hash];
  id v9 = [(INAppIntent *)self serializedParameters];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (INAppIntent)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"launchId"];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleId"];
  uint64_t v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"appIntentIdentifier"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  id v14 = [v3 decodeObjectOfClasses:v13 forKey:@"serializedParameters"];

  int v15 = 0;
  v16 = (void *)v5;
  if (v4 && v6)
  {
    v17 = self;
    if (v14)
    {
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x2050000000;
      id v18 = (void *)getLNActionClass_softClass;
      uint64_t v28 = getLNActionClass_softClass;
      if (!getLNActionClass_softClass)
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __getLNActionClass_block_invoke;
        v24[3] = &unk_1E5520EB8;
        v24[4] = &v25;
        __getLNActionClass_block_invoke((uint64_t)v24);
        id v18 = (void *)v26[3];
      }
      id v19 = v18;
      _Block_object_dispose(&v25, 8);
      id v20 = [v3 decodeObjectOfClass:v19 forKey:@"linkAction"];
      int v21 = [(INAppIntent *)self initWithAppBundleIdentifier:v4 appIntentIdentifier:v6 serializedParameters:v14];
      v17 = v21;
      if (v21) {
        objc_storeStrong((id *)&v21->_linkAction, v20);
      }
      [(INAppIntent *)v17 _setExtensionBundleId:v16];

      int v15 = v17;
    }
  }
  else
  {
    v17 = self;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(INAppIntent *)self launchId];
  [v6 encodeObject:v4 forKey:@"launchId"];

  uint64_t v5 = [(INAppIntent *)self extensionBundleId];
  [v6 encodeObject:v5 forKey:@"extensionBundleId"];

  [v6 encodeObject:self->_appIntentIdentifier forKey:@"appIntentIdentifier"];
  [v6 encodeObject:self->_serializedParameters forKey:@"serializedParameters"];
  [v6 encodeObject:self->_linkAction forKey:@"linkAction"];
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3, a4);
  id v6 = [(INAppIntent *)self launchId];
  objc_msgSend(v5, "intents_setPlistSafeObject:forKey:", v6, @"launchId");

  v7 = [(INAppIntent *)self extensionBundleId];
  objc_msgSend(v5, "intents_setPlistSafeObject:forKey:", v7, @"extensionBundleId");

  objc_msgSend(v5, "intents_setPlistSafeObject:forKey:", self->_appIntentIdentifier, @"appIntentIdentifier");
  objc_msgSend(v5, "intents_setPlistSafeObject:forKey:", self->_serializedParameters, @"serializedParameters");

  return v5;
}

- (id)widgetPlistableRepresentation:(id *)a3
{
  return [(INAppIntent *)self widgetPlistableRepresentationWithParameters:0 error:a3];
}

- (id)_className
{
  return self->_appIntentIdentifier;
}

- (id)valueForKey:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(INAppIntent *)self serializedParameters];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_nonNilParameters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(INAppIntent *)self serializedParameters];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__INAppIntent__nonNilParameters__block_invoke;
  v7[3] = &unk_1E5520E90;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __32__INAppIntent__nonNilParameters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) addObject:v7];
    }
  }
}

- (INVCVoiceShortcutClient)voiceShortcutClient
{
  voiceShortcutClient = self->_voiceShortcutClient;
  if (!voiceShortcutClient)
  {
    _INVCVoiceShortcutClient();
    id v4 = (INVCVoiceShortcutClient *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_voiceShortcutClient;
    self->_voiceShortcutClient = v4;

    voiceShortcutClient = self->_voiceShortcutClient;
  }

  return voiceShortcutClient;
}

- (LNAction)linkAction
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  linkAction = self->_linkAction;
  if (linkAction)
  {
    id v3 = linkAction;
    goto LABEL_14;
  }
  id v5 = [(INAppIntent *)self voiceShortcutClient];
  if (!v5)
  {
    id v14 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315138;
    id v19 = "-[INAppIntent linkAction]";
    int v15 = "%s No VoiceShortcutClient; completing with nil";
LABEL_18:
    _os_log_error_impl(&dword_18CB2F000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
    goto LABEL_12;
  }
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(INAppIntent *)self launchId];
    id v7 = [(INAppIntent *)self appIntentIdentifier];
    id v8 = [(INAppIntent *)self serializedParameters];
    id v17 = 0;
    uint64_t v9 = [v5 linkActionWithAppBundleIdentifier:v6 appIntentIdentifier:v7 serializedParameterStates:v8 error:&v17];
    id v10 = v17;
    uint64_t v11 = self->_linkAction;
    self->_linkAction = v9;

    uint64_t v12 = self->_linkAction;
    if (!v12)
    {
      v13 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v19 = "-[INAppIntent linkAction]";
        __int16 v20 = 2114;
        id v21 = v10;
        _os_log_error_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_ERROR, "%s No LinkAction; returning nil. Error: %{public}@",
          buf,
          0x16u);
        uint64_t v12 = self->_linkAction;
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    id v3 = v12;

    goto LABEL_13;
  }
  id v14 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v19 = "-[INAppIntent linkAction]";
    int v15 = "%s VoiceShortcutClient didn't implement linkActionWithAppBundleIdentifier yet.";
    goto LABEL_18;
  }
LABEL_12:
  id v3 = 0;
LABEL_13:

LABEL_14:

  return v3;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(INAppIntent *)self _dictionaryRepresentation];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (id)_dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(INAppIntent *)self launchId];
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v4, @"_launchId");

  id v5 = [(INAppIntent *)self extensionBundleId];
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v5, @"_extensionBundleId");

  id v6 = [(INAppIntent *)self appIntentIdentifier];
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v6, @"appIntentIdentifier");

  id v7 = [(INAppIntent *)self serializedParameters];
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v7, @"serializedParameters");

  return v3;
}

- (void)_setExtensionBundleId:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  extensionBundleId = self->_extensionBundleId;
  self->_extensionBundleId = v4;

  MEMORY[0x1F41817F8](v4, extensionBundleId);
}

- (id)extensionBundleId
{
  return self->_extensionBundleId;
}

- (void)_setLaunchId:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  launchId = self->_launchId;
  self->_launchId = v4;

  MEMORY[0x1F41817F8](v4, launchId);
}

- (id)launchId
{
  return self->_launchId;
}

- (int64_t)_indexingHash
{
  int64_t result = self->_indexingHash;
  if (!result)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F70C20]);
    id v5 = [(INAppIntent *)self _dictionaryRepresentation];
    id v6 = (id)[v4 combineContentsOfPropertyListObject:v5];

    self->_indexingHash = [v4 finalize];
    return self->_indexingHash;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(INAppIntent *)self launchId];
  id v6 = [(INAppIntent *)self appIntentIdentifier];
  id v7 = [(INAppIntent *)self serializedParameters];
  id v8 = (id *)[v4 initWithAppBundleIdentifier:v5 appIntentIdentifier:v6 serializedParameters:v7];

  if (v8)
  {
    linkAction = self->_linkAction;
    if (linkAction) {
      objc_storeStrong(v8 + 19, linkAction);
    }
  }
  id v10 = [(INAppIntent *)self extensionBundleId];
  [v8 _setExtensionBundleId:v10];

  return v8;
}

- (INAppIntent)initWithAppBundleIdentifier:(id)a3 linkAction:(id)a4 linkActionMetadata:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 valueForKey:@"identifier"];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  id v14 = [(INAppIntent *)self voiceShortcutClient];
  if (!v14)
  {
    id v19 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v27 = "-[INAppIntent initWithAppBundleIdentifier:linkAction:linkActionMetadata:]";
    __int16 v20 = "%s No VoiceShortcutClient; completing with nil";
LABEL_21:
    _os_log_error_impl(&dword_18CB2F000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);
    goto LABEL_14;
  }
  if (objc_opt_respondsToSelector())
  {
    id v25 = 0;
    int v15 = [v14 serializedParametersForLinkAction:v9 actionMetadata:v10 error:&v25];
    id v16 = v25;
    if (v15)
    {
      id v17 = [(INAppIntent *)self initWithAppBundleIdentifier:v8 appIntentIdentifier:v13 serializedParameters:v15];
      self = v17;
      if (v17)
      {
        objc_storeStrong((id *)&v17->_linkAction, a4);
        self = self;
        id v18 = self;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      id v21 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        v23 = v21;
        id v24 = [v9 identifier];
        *(_DWORD *)buf = 136315650;
        uint64_t v27 = "-[INAppIntent initWithAppBundleIdentifier:linkAction:linkActionMetadata:]";
        __int16 v28 = 2114;
        id v29 = v24;
        __int16 v30 = 2114;
        id v31 = v16;
        _os_log_error_impl(&dword_18CB2F000, v23, OS_LOG_TYPE_ERROR, "%s Unable to get serialized parameters for %{public}@; returning nil. Error: %{public}@",
          buf,
          0x20u);
      }
    }
    id v18 = 0;
    goto LABEL_18;
  }
  id v19 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v27 = "-[INAppIntent initWithAppBundleIdentifier:linkAction:linkActionMetadata:]";
    __int16 v20 = "%s VoiceShortcutClient didn't implement serializedParametersForLinkAction:actionMetadata:error: yet.";
    goto LABEL_21;
  }
LABEL_14:
  id v18 = 0;
LABEL_19:

  return v18;
}

- (INAppIntent)initWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameters:(id)a5
{
  return [(INAppIntent *)self initWithAppBundleIdentifier:a3 extensionBundleIdentifier:0 appIntentIdentifier:a4 serializedParameters:a5];
}

- (INAppIntent)initWithAppBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 appIntentIdentifier:(id)a5 serializedParameters:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [MEMORY[0x1E4F29128] UUID];
  int v15 = [v14 UUIDString];
  v23.receiver = self;
  v23.super_class = (Class)INAppIntent;
  id v16 = [(INIntent *)&v23 initWithIdentifier:v15 backingStore:0];

  if (v16)
  {
    [(INAppIntent *)v16 _setLaunchId:v10];
    [(INAppIntent *)v16 _setExtensionBundleId:v11];
    uint64_t v17 = [v12 copy];
    appIntentIdentifier = v16->_appIntentIdentifier;
    v16->_appIntentIdentifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    serializedParameters = v16->_serializedParameters;
    v16->_serializedParameters = (NSDictionary *)v19;

    id v21 = v16;
  }

  return v16;
}

- (INAppIntent)initWithJSONDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"_launchId"];
  id v6 = [v4 objectForKeyedSubscript:@"_extensionBundleId"];
  id v7 = [v4 objectForKeyedSubscript:@"appIntentIdentifier"];
  id v8 = [v4 objectForKeyedSubscript:@"serializedParameters"];

  id v9 = [(INAppIntent *)self initWithAppBundleIdentifier:v5 extensionBundleIdentifier:v6 appIntentIdentifier:v7 serializedParameters:v8];
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "intents_stringForKey:", @"launchId");
  id v6 = objc_msgSend(v4, "intents_stringForKey:", @"extensionBundleId");
  id v7 = objc_msgSend(v4, "intents_stringForKey:", @"appIntentIdentifier");
  id v8 = objc_msgSend(v4, "intents_safeObjectForKey:ofType:", @"serializedParameters", objc_opt_class());

  id v9 = 0;
  if (v5 && v7 && v8)
  {
    id v9 = [[INAppIntent alloc] initWithAppBundleIdentifier:v5 appIntentIdentifier:v7 serializedParameters:v8];
    [(INAppIntent *)v9 _setExtensionBundleId:v6];
  }

  return v9;
}

@end