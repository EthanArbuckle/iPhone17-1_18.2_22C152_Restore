@interface INSkipAnnouncementIntent
+ (BOOL)supportsSecureCoding;
- (INSkipAnnouncementIntent)init;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
@end

@implementation INSkipAnnouncementIntent

- (id)verb
{
  return @"SkipAnnouncement";
}

- (id)domain
{
  return @"HomeCommunication";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSkipAnnouncementIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (INSkipAnnouncementIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)INSkipAnnouncementIntent;
  return [(INIntent *)&v3 init];
}

- (id)_categoryVerb
{
  return @"Next";
}

- (int64_t)_intentCategory
{
  return 2;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSkipAnnouncementIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSkipAnnouncementIntent *)self _typedBackingStore];
  objc_super v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v3 = v2;
  }
  else {
    objc_super v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end