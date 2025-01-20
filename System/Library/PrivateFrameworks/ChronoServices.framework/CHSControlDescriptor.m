@interface CHSControlDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)disablesControlStateCaching;
- (BOOL)hasIntents;
- (BOOL)hiddenControl;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternal;
- (BOOL)matches:(id)a3;
- (BOOL)showsContextualMenu;
- (BOOL)supportsPush;
- (CHSControlActionMetadata)actionMetadata;
- (CHSControlDescriptor)initWithCoder:(id)a3;
- (CHSControlDescriptor)initWithExtensionIdentity:(id)a3 kind:(id)a4 controlType:(unint64_t)a5 intentType:(id)a6;
- (CHSIntentReference)defaultIntentReference;
- (NSString)actionIntentType;
- (NSString)intentType;
- (NSString)kind;
- (id)_intentDescription;
- (id)copyWithoutIntents;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initFromDescriptor:(id)a3 includeIntents:(BOOL)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)visibility;
- (unint64_t)controlType;
- (unint64_t)controlVersion;
- (unint64_t)hash;
- (unint64_t)preferredControlSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSControlDescriptor

- (CHSControlDescriptor)initWithExtensionIdentity:(id)a3 kind:(id)a4 controlType:(unint64_t)a5 intentType:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CHSControlDescriptor;
  v13 = [(CHSBaseDescriptor *)&v20 initWithExtensionIdentity:v10];
  v14 = v13;
  if (v13)
  {
    v13->_controlType = a5;
    uint64_t v15 = [v11 copy];
    kind = v14->_kind;
    v14->_kind = (NSString *)v15;

    uint64_t v17 = [v12 copy];
    intentType = v14->_intentType;
    v14->_intentType = (NSString *)v17;

    v14->_visibility = 0;
    v14->_controlVersion = 1;
  }

  return v14;
}

- (id)initFromDescriptor:(id)a3 includeIntents:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(CHSControlDescriptor *)self initWithExtensionIdentity:*((void *)v6 + 1) kind:*((void *)v6 + 15) controlType:*((void *)v6 + 17) intentType:*((void *)v6 + 16)];
  if (v7)
  {
    uint64_t v8 = [*((id *)v6 + 3) copy];
    displayName = v7->super._displayName;
    v7->super._displayName = (NSString *)v8;

    uint64_t v10 = [*((id *)v6 + 4) copy];
    widgetDescription = v7->super._widgetDescription;
    v7->super._widgetDescription = (NSString *)v10;

    v7->_visibility = *((void *)v6 + 20);
    uint64_t v12 = [*((id *)v6 + 6) copy];
    localeToken = v7->super._localeToken;
    v7->super._localeToken = (NSData *)v12;

    uint64_t v14 = [*((id *)v6 + 5) copy];
    eventMachServiceName = v7->super._eventMachServiceName;
    v7->super._eventMachServiceName = (NSString *)v14;

    objc_storeStrong((id *)&v7->super._sdkVersion, *((id *)v6 + 10));
    uint64_t v16 = [*((id *)v6 + 24) copy];
    actionMetadata = v7->_actionMetadata;
    v7->_actionMetadata = (CHSControlActionMetadata *)v16;

    v7->_hiddenControl = *((unsigned char *)v6 + 168);
    v7->_showsContextualMenu = *((unsigned char *)v6 + 169);
    v7->_disablesControlStateCaching = *((unsigned char *)v6 + 170);
    v7->super._platform = *((void *)v6 + 11);
    v7->super._version = *((void *)v6 + 9);
    if (v4) {
      v18 = (void *)*((void *)v6 + 23);
    }
    else {
      v18 = 0;
    }
    objc_storeStrong((id *)&v7->_defaultIntentReference, v18);
    v7->super._hiddenBySensitiveUI = *((unsigned char *)v6 + 96);
    uint64_t v19 = [*((id *)v6 + 2) copy];
    nativeContainerBundleIdentifier = v7->super._nativeContainerBundleIdentifier;
    v7->super._nativeContainerBundleIdentifier = (NSString *)v19;

    v7->_preferredControlSize = *((void *)v6 + 18);
    v7->_supportsPush = *((unsigned char *)v6 + 152);
    v7->super._promptsForUserConfiguration = *((unsigned char *)v6 + 97);
    v7->super._enablement = *((void *)v6 + 13);
    v7->_controlVersion = *((void *)v6 + 22);
    objc_storeStrong((id *)&v7->super._requiredFeatureFlags, *((id *)v6 + 14));
  }

  return v7;
}

- (CHSControlActionMetadata)actionMetadata
{
  actionMetadata = self->_actionMetadata;
  if (!actionMetadata)
  {
    BOOL v4 = [[CHSControlActionMetadata alloc] initWithIntentType:0];
    v5 = self->_actionMetadata;
    self->_actionMetadata = v4;

    actionMetadata = self->_actionMetadata;
  }
  return actionMetadata;
}

- (NSString)actionIntentType
{
  return [(CHSControlActionMetadata *)self->_actionMetadata intentType];
}

- (BOOL)isInternal
{
  return self->_visibility == 1;
}

- (BOOL)hasIntents
{
  return self->_defaultIntentReference != 0;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  v5 = [(CHSBaseDescriptor *)self extensionIdentity];
  id v6 = [v4 extensionIdentity];
  if (BSEqualObjects())
  {
    v7 = [(CHSControlDescriptor *)self kind];
    uint64_t v8 = [v4 kind];
    char v9 = BSEqualStrings();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CHSControlDescriptor *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CHSControlDescriptor;
  if (![(CHSBaseDescriptor *)&v8 isEqual:v4]) {
    goto LABEL_16;
  }
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    if (BSEqualObjects()
      && self->_controlType == v5->_controlType
      && self->_preferredControlSize == v5->_preferredControlSize
      && self->_supportsPush == v5->_supportsPush
      && self->_controlVersion == v5->_controlVersion
      && BSEqualObjects()
      && BSEqualObjects()
      && self->_hiddenControl == v5->_hiddenControl
      && self->_showsContextualMenu == v5->_showsContextualMenu
      && self->_disablesControlStateCaching == v5->_disablesControlStateCaching
      && self->_visibility == v5->_visibility)
    {
      char v6 = BSEqualObjects();
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
LABEL_16:
    char v6 = 0;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  v19.receiver = self;
  v19.super_class = (Class)CHSControlDescriptor;
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[CHSBaseDescriptor hash](&v19, sel_hash));
  id v5 = (id)[v3 appendUnsignedInteger:self->_controlType];
  id v6 = (id)[v3 appendUnsignedInteger:self->_preferredControlSize];
  id v7 = (id)[v3 appendBool:self->_supportsPush];
  id v8 = (id)[v3 appendString:self->_kind];
  id v9 = (id)[v3 appendString:self->_intentType];
  id v10 = (id)[v3 appendObject:self->_defaultIntentReference];
  id v11 = (id)[v3 appendInt64:self->_controlVersion];
  id v12 = (id)[v3 appendInteger:self->_visibility];
  id v13 = (id)[v3 appendBool:self->_hiddenControl];
  id v14 = (id)[v3 appendBool:self->_showsContextualMenu];
  id v15 = (id)[v3 appendBool:self->_disablesControlStateCaching];
  id v16 = (id)[v3 appendObject:self->_actionMetadata];
  unint64_t v17 = [v3 hash];

  return v17;
}

- (id)description
{
  return [(CHSControlDescriptor *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(CHSControlDescriptor *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CHSControlDescriptor_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E56C81F0;
  id v4 = v3;
  id v8 = v4;
  id v9 = self;
  [v4 appendProem:self block:v7];
  id v5 = v4;

  return v5;
}

void __50__CHSControlDescriptor_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 120) withName:@"kind"];
  id v2 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 136) withName:@"type"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 128) withName:@"intentType"];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(void *)(*(void *)(a1 + 40) + 184) != 0 withName:@"hasDefaultIntent"];
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 192) succinctDescription];
  objc_msgSend(v4, "appendString:withName:");
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(CHSControlDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__CHSControlDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E56C81F0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  id v7 = v6;

  return v7;
}

uint64_t __62__CHSControlDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 72) withName:@"baseVersion"];
  id v3 = (id)[*(id *)(a1 + 32) appendInt64:*(void *)(*(void *)(a1 + 40) + 176) withName:@"controlVersion"];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"extensionIdentity"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 120) withName:@"kind"];
  id v5 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 136) withName:@"type"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 24) withName:@"displayName"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 128) withName:@"intentType"];
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isEnabled"), @"enabled");
  id v7 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 104) withName:@"enablement"];
  id v8 = *(void **)(a1 + 32);
  id v9 = NSStringFromCHSControlSize(*(void *)(*(void *)(a1 + 40) + 144));
  [v8 appendString:v9 withName:@"preferredControlSize"];

  id v10 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 152) withName:@"supportsPush"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 80) withName:@"sdkVersion"];
  id v11 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 168) withName:@"isHidden"];
  id v12 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 169) withName:@"showsContextMenu" ifEqualTo:1];
  id v13 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 170) withName:@"cachingDisabled"];
  id v14 = *(void **)(a1 + 32);
  id v15 = [*(id *)(*(void *)(a1 + 40) + 192) succinctDescription];
  id v16 = (id)[v14 appendObject:v15 withName:@"actionMetadata"];

  id v17 = (id)[*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 88) withName:@"platform"];
  id v18 = (id)[*(id *)(a1 + 32) appendBool:*(void *)(*(void *)(a1 + 40) + 184) != 0 withName:@"hasDefaultIntent"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 32) withName:@"widgetDescription"];
  objc_super v19 = *(void **)(a1 + 32);
  objc_super v20 = CHSDescriptionForWidgetVisibility(*(void *)(*(void *)(a1 + 40) + 160));
  [v19 appendString:v20 withName:@"widgetVisibility"];

  v21 = *(void **)(a1 + 32);
  v22 = [*(id *)(*(void *)(a1 + 40) + 48) base64EncodedStringWithOptions:0];
  [v21 appendString:v22 withName:@"localeToken"];

  v23 = *(void **)(a1 + 32);
  v24 = [*(id *)(*(void *)(a1 + 40) + 40) description];
  [v23 appendString:v24 withName:@"eventMachServiceName"];

  id v25 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 97) withName:@"promptsForUserConfiguration"];
  id v26 = (id)[*(id *)(a1 + 32) appendBool:*(void *)(*(void *)(a1 + 40) + 16) != 0 withName:@"isApple"];
  v27 = *(void **)(a1 + 32);
  uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 112);
  return [v27 appendArraySection:v28 withName:@"requiredFeatureFlags" skipIfEmpty:1];
}

- (id)copyWithoutIntents
{
  id v3 = [CHSControlDescriptor alloc];
  return [(CHSControlDescriptor *)v3 initFromDescriptor:self includeIntents:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CHSMutableControlDescriptor alloc];
  return [(CHSControlDescriptor *)v4 initFromDescriptor:self includeIntents:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CHSControlDescriptor;
  [(CHSBaseDescriptor *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_kind forKey:@"kind"];
  [v4 encodeInteger:self->_controlType forKey:@"type"];
  [v4 encodeInteger:self->_preferredControlSize forKey:@"size"];
  [v4 encodeBool:self->_supportsPush forKey:@"supportsPush"];
  [v4 encodeObject:self->_intentType forKey:@"intentType"];
  [v4 encodeInteger:self->_visibility forKey:@"widgetVisibility"];
  [v4 encodeObject:self->_defaultIntentReference forKey:@"defaultIntentRef"];
  [v4 encodeBool:self->_hiddenControl forKey:@"hiddenControl"];
  [v4 encodeBool:self->_showsContextualMenu forKey:@"showContextualMenu"];
  [v4 encodeBool:self->_disablesControlStateCaching forKey:@"disablesControlStateCaching"];
  [v4 encodeObject:self->_actionMetadata forKey:@"actionMetadata"];
  [v4 encodeInt64:self->_controlVersion forKey:@"controlVersion"];
}

- (CHSControlDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CHSControlDescriptor;
  objc_super v5 = [(CHSBaseDescriptor *)&v27 initWithCoder:v4];
  if (v5)
  {
    id v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentType"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
    uint64_t v25 = [v4 decodeIntegerForKey:@"type"];
    uint64_t v24 = [v4 decodeIntegerForKey:@"size"];
    char v23 = [v4 decodeBoolForKey:@"supportsPush"];
    uint64_t v7 = [v4 decodeIntegerForKey:@"widgetVisibility"];
    char v8 = [v4 decodeBoolForKey:@"hiddenControl"];
    char v9 = [v4 decodeBoolForKey:@"showContextualMenu"];
    char v10 = [v4 decodeBoolForKey:@"disablesControlStateCaching"];
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionMetadata"];
    if (!v11)
    {
      id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIntentType"];
      if (v12)
      {
        id v13 = [(CHSControlActionMetadata *)[CHSMutableControlActionMetadata alloc] initWithIntentType:v12];
        id v11 = (void *)[(CHSMutableControlActionMetadata *)v13 copy];
      }
      else
      {
        id v11 = 0;
      }
    }
    if ([v4 containsValueForKey:@"controlVersion"]) {
      uint64_t v14 = [v4 decodeInt64ForKey:@"controlVersion"];
    }
    else {
      uint64_t v14 = 0;
    }
    if ([v4 containsValueForKey:@"defaultIntentRef"])
    {
      id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultIntentRef"];
    }
    else
    {
      id v15 = 0;
    }
    if (v5->super._extensionIdentity && v6)
    {
      uint64_t v16 = [v26 copy];
      intentType = v5->_intentType;
      v5->_intentType = (NSString *)v16;

      uint64_t v18 = [v6 copy];
      kind = v5->_kind;
      v5->_kind = (NSString *)v18;

      v5->_controlType = v25;
      v5->_preferredControlSize = v24;
      v5->_supportsPush = v23;
      v5->_visibility = v7;
      objc_storeStrong((id *)&v5->_defaultIntentReference, v15);
      v5->_hiddenControl = v8;
      v5->_showsContextualMenu = v9;
      v5->_disablesControlStateCaching = v10;
      uint64_t v20 = [v11 copy];
      actionMetadata = v5->_actionMetadata;
      v5->_actionMetadata = (CHSControlActionMetadata *)v20;

      v5->_controlVersion = v14;
    }
    else
    {

      objc_super v5 = 0;
    }
  }
  return v5;
}

- (id)_intentDescription
{
  id v3 = NSString;
  id v4 = [(CHSExtensionIdentity *)self->super._extensionIdentity extensionBundleIdentifier];
  objc_super v5 = [v3 stringWithFormat:@"[%@ - %@]", v4, self->_intentType];

  return v5;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)intentType
{
  return self->_intentType;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (CHSIntentReference)defaultIntentReference
{
  return self->_defaultIntentReference;
}

- (unint64_t)controlType
{
  return self->_controlType;
}

- (unint64_t)preferredControlSize
{
  return self->_preferredControlSize;
}

- (BOOL)supportsPush
{
  return self->_supportsPush;
}

- (unint64_t)controlVersion
{
  return self->_controlVersion;
}

- (BOOL)showsContextualMenu
{
  return self->_showsContextualMenu;
}

- (BOOL)hiddenControl
{
  return self->_hiddenControl;
}

- (BOOL)disablesControlStateCaching
{
  return self->_disablesControlStateCaching;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMetadata, 0);
  objc_storeStrong((id *)&self->_defaultIntentReference, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

@end