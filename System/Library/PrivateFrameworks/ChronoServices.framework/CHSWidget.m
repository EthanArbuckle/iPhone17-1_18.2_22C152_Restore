@interface CHSWidget
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matches:(id)a3;
- (BOOL)matchesPersonality:(id)a3;
- (CHSExtensionIdentity)extensionIdentity;
- (CHSIntentReference)intentReference;
- (CHSWidget)init;
- (CHSWidget)initWithBSXPCCoder:(id)a3;
- (CHSWidget)initWithCoder:(id)a3;
- (CHSWidget)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 family:(int64_t)a6 intent:(id)a7;
- (CHSWidget)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 family:(int64_t)a6 intent:(id)a7 activityIdentifier:(id)a8;
- (CHSWidget)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 family:(int64_t)a5 intent:(id)a6;
- (CHSWidget)initWithExtensionIdentity:(id)a3 kind:(id)a4 family:(int64_t)a5 intent:(id)a6 activityIdentifier:(id)a7;
- (CHSWidget)initWithExtensionIdentity:(id)a3 kind:(id)a4 family:(int64_t)a5 intentReference:(id)a6 activityIdentifier:(id)a7;
- (CHSWidget)initWithPersonality:(id)a3 family:(int64_t)a4 intent:(id)a5;
- (CHSWidget)initWithWidgetIdentity:(id)a3 family:(int64_t)a4 intent:(id)a5 activityIdentifier:(id)a6;
- (NSString)activityIdentifier;
- (NSString)kind;
- (id)_loggingIdentifierWithMetrics:(id)a3;
- (id)_loggingIdentifierWithMetrics:(id)a3 prefix:(id)a4;
- (id)_loggingIdentifierWithoutMetrics;
- (id)containerBundleIdentifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)extensionBundleIdentifier;
- (id)intent;
- (id)sourceDeviceIdentifier;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)widgetByReplacingIntent:(id)a3;
- (int64_t)family;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidget

- (CHSWidget)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CHSWidget.m" lineNumber:36 description:@"Use initWithExtensionBundleIdentifier:kind:family:intent:"];

  return 0;
}

- (CHSWidget)initWithExtensionIdentity:(id)a3 kind:(id)a4 family:(int64_t)a5 intent:(id)a6 activityIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v14) {
    v16 = [[CHSIntentReference alloc] initWithIntent:v14];
  }
  else {
    v16 = 0;
  }
  v17 = [(CHSWidget *)self initWithExtensionIdentity:v12 kind:v13 family:a5 intentReference:v16 activityIdentifier:v15];

  return v17;
}

- (CHSWidget)initWithExtensionIdentity:(id)a3 kind:(id)a4 family:(int64_t)a5 intentReference:(id)a6 activityIdentifier:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CHSWidget;
  v16 = [(CHSWidget *)&v28 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    extensionIdentity = v16->_extensionIdentity;
    v16->_extensionIdentity = (CHSExtensionIdentity *)v17;

    uint64_t v19 = [v13 copy];
    kind = v16->_kind;
    v16->_kind = (NSString *)v19;

    v16->_family = a5;
    objc_storeStrong((id *)&v16->_intentReference, a6);
    uint64_t v21 = [v15 copy];
    activityIdentifier = v16->_activityIdentifier;
    v16->_activityIdentifier = (NSString *)v21;

    v23 = [(CHSExtensionIdentity *)v16->_extensionIdentity extensionBundleIdentifier];
    if ([v23 length])
    {
      BOOL v24 = [(NSString *)v16->_kind length] == 0;

      if (!v24) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    v25 = CHSLogChronoServices();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      v26 = [(CHSExtensionIdentity *)v16->_extensionIdentity extensionBundleIdentifier];
      -[CHSWidget initWithExtensionIdentity:kind:family:intentReference:activityIdentifier:](v26, (uint64_t *)&v16->_kind, buf, v25);
    }
  }
LABEL_9:

  return v16;
}

- (CHSWidget)initWithWidgetIdentity:(id)a3 family:(int64_t)a4 intent:(id)a5 activityIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 extensionIdentity];
  id v14 = [v10 kind];
  id v15 = [(CHSWidget *)self initWithExtensionIdentity:v13 kind:v14 family:a4 intent:v11 activityIdentifier:v12];

  return v15;
}

- (id)widgetByReplacingIntent:(id)a3
{
  id v4 = a3;
  v5 = [CHSWidget alloc];
  v6 = [(CHSWidget *)self extensionIdentity];
  v7 = [(CHSWidget *)self kind];
  int64_t v8 = [(CHSWidget *)self family];
  v9 = [(CHSWidget *)self activityIdentifier];
  id v10 = [(CHSWidget *)v5 initWithExtensionIdentity:v6 kind:v7 family:v8 intent:v4 activityIdentifier:v9];

  return v10;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  v5 = [(CHSWidget *)self extensionIdentity];
  v6 = [v4 extensionIdentity];
  if (BSEqualObjects())
  {
    v7 = [(CHSWidget *)self kind];
    int64_t v8 = [v4 kind];
    char v9 = BSEqualStrings();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)matchesPersonality:(id)a3
{
  id v4 = a3;
  v5 = [(CHSWidget *)self extensionIdentity];
  v6 = [v5 extensionBundleIdentifier];
  v7 = [v4 extensionBundleIdentifier];
  if (BSEqualStrings())
  {
    int64_t v8 = [(CHSWidget *)self kind];
    char v9 = [v4 kind];
    char v10 = BSEqualStrings();
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      int64_t v8 = v7;
    }
    else {
      int64_t v8 = 0;
    }
  }
  else
  {
    int64_t v8 = 0;
  }
  id v9 = v8;

  char v10 = [(CHSWidget *)self extensionIdentity];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __21__CHSWidget_isEqual___block_invoke;
  v37[3] = &unk_1E56C81C8;
  id v11 = v9;
  id v38 = v11;
  id v12 = (id)[v5 appendObject:v10 counterpart:v37];

  id v13 = [(CHSWidget *)self kind];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __21__CHSWidget_isEqual___block_invoke_2;
  v35[3] = &unk_1E56C8508;
  id v14 = v11;
  id v36 = v14;
  id v15 = (id)[v5 appendString:v13 counterpart:v35];

  int64_t v16 = [(CHSWidget *)self family];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __21__CHSWidget_isEqual___block_invoke_3;
  v33[3] = &unk_1E56C8530;
  id v17 = v14;
  id v34 = v17;
  id v18 = (id)[v5 appendInteger:v16 counterpart:v33];
  int64_t v19 = [(CHSIntentReference *)self->_intentReference stableHash];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __21__CHSWidget_isEqual___block_invoke_4;
  v31[3] = &unk_1E56C8530;
  id v20 = v17;
  id v32 = v20;
  id v21 = (id)[v5 appendInt64:v19 counterpart:v31];
  v22 = [(CHSWidget *)self activityIdentifier];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  objc_super v28 = __21__CHSWidget_isEqual___block_invoke_5;
  v29 = &unk_1E56C8508;
  id v23 = v20;
  id v30 = v23;
  id v24 = (id)[v5 appendString:v22 counterpart:&v26];

  LOBYTE(v22) = objc_msgSend(v5, "isEqual", v26, v27, v28, v29);
  return (char)v22;
}

uint64_t __21__CHSWidget_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) extensionIdentity];
}

uint64_t __21__CHSWidget_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) kind];
}

uint64_t __21__CHSWidget_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) family];
}

uint64_t __21__CHSWidget_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) stableHash];
}

uint64_t __21__CHSWidget_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityIdentifier];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(CHSWidget *)self extensionIdentity];
  id v5 = (id)[v3 appendObject:v4];

  uint64_t v6 = [(CHSWidget *)self activityIdentifier];
  id v7 = (id)[v3 appendString:v6];

  int64_t v8 = [(CHSWidget *)self kind];
  id v9 = (id)[v3 appendString:v8];

  id v10 = (id)objc_msgSend(v3, "appendInteger:", -[CHSWidget family](self, "family"));
  id v11 = (id)objc_msgSend(v3, "appendInt64:", -[CHSIntentReference stableHash](self->_intentReference, "stableHash"));
  unint64_t v12 = [v3 hash];

  return v12;
}

- (id)succinctDescription
{
  v2 = [(CHSWidget *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(CHSWidget *)self extensionIdentity];
  id v5 = (id)[v3 appendObject:v4 withName:@"extensionIdentity"];

  uint64_t v6 = [(CHSWidget *)self kind];
  [v3 appendString:v6 withName:@"kind"];

  id v7 = CHSWidgetFamilyDescription([(CHSWidget *)self family]);
  [v3 appendString:v7 withName:@"family"];

  id v8 = (id)objc_msgSend(v3, "appendInt64:withName:", -[CHSIntentReference stableHash](self->_intentReference, "stableHash"), @"intentHash");
  id v9 = [(CHSWidget *)self activityIdentifier];
  [v3 appendString:v9 withName:@"activityIdentifier"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CHSWidget *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__CHSWidget_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E56C81F0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  return v7;
}

void __51__CHSWidget_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) extensionIdentity];
  id v3 = (id)objc_msgSend(v2, "appendObject:withName:");

  id v4 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) kind];
  objc_msgSend(v4, "appendString:withName:");

  id v5 = *(void **)(a1 + 32);
  CHSWidgetFamilyDescription([*(id *)(a1 + 40) family]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:");

  id v6 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"intent"];
  id v7 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) activityIdentifier];
  objc_msgSend(v7, "appendString:withName:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_extensionIdentity forKey:@"extensionIdentity"];
  [v4 encodeObject:self->_kind forKey:@"kind"];
  [v4 encodeInteger:self->_family forKey:@"family"];
  [v4 encodeObject:self->_intentReference forKey:@"intent2"];
  [v4 encodeObject:self->_activityIdentifier forKey:@"activityIdentifier"];
}

- (CHSWidget)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"extensionIdentity"])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionIdentity"];
  }
  else
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerBundleIdentifier"];
    id v8 = (void *)v7;
    id v5 = 0;
    if (v6 && v7)
    {
      id v9 = [CHSExtensionIdentity alloc];
      id v10 = getDeviceIDFromBundleID(v6);
      id v5 = [(CHSExtensionIdentity *)v9 initWithExtensionBundleIdentifier:v6 containerBundleIdentifier:v8 deviceIdentifier:v10];
    }
  }
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
  unint64_t v12 = [v4 decodeIntegerForKey:@"family"];
  id v13 = 0;
  if (v5 && v11)
  {
    unint64_t v14 = v12;
    if (CHSWidgetFamilyIsValid(v12))
    {
      if ([v4 containsValueForKey:@"intent2"])
      {
        id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent2"];
LABEL_22:
        v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityIdentifier"];
        self = [(CHSWidget *)self initWithExtensionIdentity:v5 kind:v11 family:v14 intentReference:v15 activityIdentifier:v22];

        id v13 = self;
        goto LABEL_23;
      }
      int64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v17 = objc_opt_class();
      id v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
      int64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"intent"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v19 error:0];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v21 = 0;
          goto LABEL_20;
        }
        id v20 = v19;
      }
      id v21 = v20;
      if (v20)
      {
        id v15 = [[CHSIntentReference alloc] initWithIntent:v20];
LABEL_21:

        goto LABEL_22;
      }
LABEL_20:
      id v15 = 0;
      goto LABEL_21;
    }
    id v13 = 0;
  }
LABEL_23:

  return v13;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_extensionIdentity forKey:@"extensionIdentity"];
  [v5 encodeObject:self->_kind forKey:@"kind"];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_family];
  [v5 encodeObject:v4 forKey:@"family"];

  [v5 encodeObject:self->_intentReference forKey:@"intent2"];
  [v5 encodeObject:self->_activityIdentifier forKey:@"activityIdentifier"];
}

- (CHSWidget)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionIdentity"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"family"];
  unint64_t v8 = [v7 integerValue];

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent2"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityIdentifier"];
  id v11 = 0;
  if (v5 && v6)
  {
    if (CHSWidgetFamilyIsValid(v8))
    {
      self = [(CHSWidget *)self initWithExtensionIdentity:v5 kind:v6 family:v8 intentReference:v9 activityIdentifier:v10];
      id v11 = self;
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

- (id)_loggingIdentifierWithoutMetrics
{
  return [(CHSWidget *)self _loggingIdentifierWithMetrics:0];
}

- (id)_loggingIdentifierWithMetrics:(id)a3
{
  id v3 = [(CHSWidget *)self _loggingIdentifierWithMetrics:a3 prefix:0];
  return v3;
}

- (id)_loggingIdentifierWithMetrics:(id)a3 prefix:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  intentReference = self->_intentReference;
  if (intentReference)
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", -[CHSIntentReference stableHash](intentReference, "stableHash"));
    id v10 = [v9 stringValue];
  }
  else
  {
    id v10 = &stru_1EE0A1408;
  }
  if (v6)
  {
    [v6 size];
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    id v15 = NSString;
    [v6 cornerRadius];
    uint64_t v17 = [v15 stringWithFormat:@":%.2f/%.2f/%.2f", v12, v14, v16];
  }
  else
  {
    uint64_t v17 = &stru_1EE0A1408;
  }
  id v18 = NSString;
  if (v7) {
    int64_t v19 = v7;
  }
  else {
    int64_t v19 = &stru_1EE0A1408;
  }
  id v20 = [(CHSExtensionIdentity *)self->_extensionIdentity description];
  kind = self->_kind;
  v22 = CHSWidgetFamilyDescription(self->_family);
  id v23 = [v18 stringWithFormat:@"%@[%@:%@:%@:%@%@:%@]", v19, v20, kind, v22, v10, v17, self->_activityIdentifier];

  return v23;
}

- (CHSWidget)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 family:(int64_t)a5 intent:(id)a6
{
  return [(CHSWidget *)self initWithExtensionBundleIdentifier:a3 containerBundleIdentifier:0 kind:a4 family:a5 intent:a6 activityIdentifier:0];
}

- (CHSWidget)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 family:(int64_t)a6 intent:(id)a7
{
  return [(CHSWidget *)self initWithExtensionBundleIdentifier:a3 containerBundleIdentifier:a4 kind:a5 family:a6 intent:a7 activityIdentifier:0];
}

- (CHSWidget)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 family:(int64_t)a6 intent:(id)a7 activityIdentifier:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  int64_t v19 = [CHSExtensionIdentity alloc];
  id v20 = getDeviceIDFromBundleID(v14);
  id v21 = [(CHSExtensionIdentity *)v19 initWithExtensionBundleIdentifier:v14 containerBundleIdentifier:v15 deviceIdentifier:v20];
  v22 = [(CHSWidget *)self initWithExtensionIdentity:v21 kind:v16 family:a6 intent:v17 activityIdentifier:v18];

  return v22;
}

- (CHSWidget)initWithPersonality:(id)a3 family:(int64_t)a4 intent:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [CHSExtensionIdentity alloc];
  uint64_t v11 = [v8 extensionBundleIdentifier];
  uint64_t v12 = [(CHSExtensionIdentity *)v10 initWithExtensionBundleIdentifier:v11 containerBundleIdentifier:0 deviceIdentifier:0];

  uint64_t v13 = [v8 kind];
  id v14 = [(CHSWidget *)self initWithExtensionIdentity:v12 kind:v13 family:a4 intent:v9 activityIdentifier:0];

  return v14;
}

- (id)extensionBundleIdentifier
{
  return [(CHSExtensionIdentity *)self->_extensionIdentity extensionBundleIdentifier];
}

- (id)containerBundleIdentifier
{
  return [(CHSExtensionIdentity *)self->_extensionIdentity containerBundleIdentifier];
}

- (id)sourceDeviceIdentifier
{
  return [(CHSExtensionIdentity *)self->_extensionIdentity deviceIdentifier];
}

- (id)intent
{
  return [(CHSIntentReference *)self->_intentReference intent];
}

- (CHSExtensionIdentity)extensionIdentity
{
  return self->_extensionIdentity;
}

- (NSString)kind
{
  return self->_kind;
}

- (CHSIntentReference)intentReference
{
  return self->_intentReference;
}

- (int64_t)family
{
  return self->_family;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionIdentity, 0);
  objc_storeStrong((id *)&self->_intentReference, 0);
}

- (void)initWithExtensionIdentity:(uint8_t *)buf kind:(os_log_t)log family:intentReference:activityIdentifier:.cold.1(void *a1, uint64_t *a2, uint8_t *buf, os_log_t log)
{
  uint64_t v5 = *a2;
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = v5;
  _os_log_fault_impl(&dword_190C6F000, log, OS_LOG_TYPE_FAULT, "CHSWidget initialized with bad bundle identifier (%@) or kind (%@)", buf, 0x16u);
}

@end