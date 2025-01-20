@interface INListShortcutsIntent
+ (BOOL)supportsSecureCoding;
- (INListShortcutsIntent)initWithOriginDevice:(int64_t)a3 appTitles:(id)a4;
- (NSArray)appTitles;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)originDevice;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAppTitles:(id)a3;
- (void)setOriginDevice:(int64_t)a3;
@end

@implementation INListShortcutsIntent

- (id)verb
{
  return @"ListShortcuts";
}

- (id)domain
{
  return @"VoiceCommands";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INListShortcutsIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"originDevice";
  int64_t v3 = [(INListShortcutsIntent *)self originDevice];
  if ((unint64_t)(v3 - 1) > 6) {
    v4 = @"unknown";
  }
  else {
    v4 = off_1E551EB18[v3 - 1];
  }
  v5 = v4;
  v10[1] = @"appTitles";
  v11[0] = v5;
  id v6 = [(INListShortcutsIntent *)self appTitles];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v6) {

  }
  return v8;
}

- (void)setAppTitles:(id)a3
{
  id v4 = a3;
  id v6 = [(INListShortcutsIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToAppIdentifiers(v4);

  [v6 setAppTitles:v5];
}

- (NSArray)appTitles
{
  v2 = [(INListShortcutsIntent *)self _typedBackingStore];
  int64_t v3 = [v2 appTitles];
  id v4 = INIntentSlotValueTransformFromAppIdentifiers(v3);

  return (NSArray *)v4;
}

- (void)setOriginDevice:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INListShortcutsIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 6) {
    [v4 setHasOriginDevice:0];
  }
  else {
    objc_msgSend(v4, "setOriginDevice:");
  }
}

- (int64_t)originDevice
{
  unint64_t v3 = [(INListShortcutsIntent *)self _typedBackingStore];
  int v4 = [v3 hasOriginDevice];
  id v5 = [(INListShortcutsIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 originDevice] - 1;
  if (v6 <= 6) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (INListShortcutsIntent)initWithOriginDevice:(int64_t)a3 appTitles:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)INListShortcutsIntent;
  int64_t v7 = [(INIntent *)&v10 init];
  int64_t v8 = v7;
  if (v7)
  {
    [(INListShortcutsIntent *)v7 setOriginDevice:a3];
    [(INListShortcutsIntent *)v8 setAppTitles:v6];
  }

  return v8;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INListShortcutsIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INListShortcutsIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end