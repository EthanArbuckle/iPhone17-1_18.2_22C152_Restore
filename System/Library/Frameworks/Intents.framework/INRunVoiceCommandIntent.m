@interface INRunVoiceCommandIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4;
- (INIntentExecutionResult)executionResult;
- (INRunVoiceCommandIntent)initWithVoiceCommand:(id)a3 originDevice:(id)a4;
- (INRunVoiceCommandIntent)initWithVoiceCommand:(id)a3 originDevice:(id)a4 executionResult:(id)a5;
- (INRunVoiceCommandIntent)initWithVoiceCommand:(id)a3 originDevice:(id)a4 executionResult:(id)a5 previousIntentIdentifier:(id)a6;
- (INSpeakableString)voiceCommand;
- (INVoiceCommandDeviceInformation)originDevice;
- (NSString)previousIntentIdentifier;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setExecutionResult:(id)a3;
- (void)setOriginDevice:(id)a3;
- (void)setPreviousIntentIdentifier:(id)a3;
- (void)setVoiceCommand:(id)a3;
@end

@implementation INRunVoiceCommandIntent

- (id)_dictionaryRepresentation
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"voiceCommand";
  v3 = [(INRunVoiceCommandIntent *)self voiceCommand];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"originDevice";
  v5 = [(INRunVoiceCommandIntent *)self originDevice];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v6;
  v13[2] = @"executionResult";
  v7 = [(INRunVoiceCommandIntent *)self executionResult];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v8;
  v13[3] = @"previousIntentIdentifier";
  v9 = [(INRunVoiceCommandIntent *)self previousIntentIdentifier];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (!v9) {

  }
  if (!v7) {
  if (!v5)
  }

  if (!v3) {

  }
  return v11;
}

- (void)setExecutionResult:(id)a3
{
  id v4 = a3;
  id v6 = [(INRunVoiceCommandIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToIntentExecutionResult(v4);

  [v6 setExecutionResult:v5];
}

- (INIntentExecutionResult)executionResult
{
  v2 = [(INRunVoiceCommandIntent *)self _typedBackingStore];
  v3 = [v2 executionResult];
  id v4 = INIntentSlotValueTransformFromIntentExecutionResult(v3);

  return (INIntentExecutionResult *)v4;
}

- (id)verb
{
  return @"RunVoiceCommand";
}

- (id)domain
{
  return @"VoiceCommands";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INRunVoiceCommandIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (void)setPreviousIntentIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INRunVoiceCommandIntent *)self _typedBackingStore];
  [v5 setPreviousIntentIdentifier:v4];
}

- (NSString)previousIntentIdentifier
{
  v2 = [(INRunVoiceCommandIntent *)self _typedBackingStore];
  v3 = [v2 previousIntentIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setOriginDevice:(id)a3
{
  id v4 = a3;
  id v6 = [(INRunVoiceCommandIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToVoiceCommandDeviceInformation(v4);

  [v6 setOriginDevice:v5];
}

- (INVoiceCommandDeviceInformation)originDevice
{
  v2 = [(INRunVoiceCommandIntent *)self _typedBackingStore];
  v3 = [v2 originDevice];
  id v4 = INIntentSlotValueTransformFromVoiceCommandDeviceInformation(v3);

  return (INVoiceCommandDeviceInformation *)v4;
}

- (void)setVoiceCommand:(id)a3
{
  id v4 = a3;
  id v6 = [(INRunVoiceCommandIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setVoiceCommand:v5];
}

- (INSpeakableString)voiceCommand
{
  v2 = [(INRunVoiceCommandIntent *)self _typedBackingStore];
  v3 = [v2 voiceCommand];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (INRunVoiceCommandIntent)initWithVoiceCommand:(id)a3 originDevice:(id)a4 executionResult:(id)a5
{
  return [(INRunVoiceCommandIntent *)self initWithVoiceCommand:a3 originDevice:a4 executionResult:a5 previousIntentIdentifier:0];
}

- (INRunVoiceCommandIntent)initWithVoiceCommand:(id)a3 originDevice:(id)a4
{
  return [(INRunVoiceCommandIntent *)self initWithVoiceCommand:a3 originDevice:a4 executionResult:0 previousIntentIdentifier:0];
}

- (INRunVoiceCommandIntent)initWithVoiceCommand:(id)a3 originDevice:(id)a4 executionResult:(id)a5 previousIntentIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)INRunVoiceCommandIntent;
  v14 = [(INIntent *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(INRunVoiceCommandIntent *)v14 setVoiceCommand:v10];
    [(INRunVoiceCommandIntent *)v15 setOriginDevice:v11];
    [(INRunVoiceCommandIntent *)v15 setExecutionResult:v12];
    [(INRunVoiceCommandIntent *)v15 setPreviousIntentIdentifier:v13];
  }

  return v15;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INRunVoiceCommandIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INRunVoiceCommandIntent *)self _typedBackingStore];
  v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4
{
  return 0;
}

@end