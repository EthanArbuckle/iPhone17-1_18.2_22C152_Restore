@interface INPlayAnnouncementSoundIntent
+ (BOOL)supportsSecureCoding;
- (INPlayAnnouncementSoundIntent)initWithSoundType:(int64_t)a3;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)soundType;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setSoundType:(int64_t)a3;
@end

@implementation INPlayAnnouncementSoundIntent

- (id)verb
{
  return @"PlayAnnouncementSound";
}

- (id)domain
{
  return @"HomeCommunication";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INPlayAnnouncementSoundIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"soundType";
  int64_t v2 = [(INPlayAnnouncementSoundIntent *)self soundType];
  v3 = @"unknown";
  if (v2 == 1) {
    v3 = @"announcementSent";
  }
  v4 = v3;
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (void)setSoundType:(int64_t)a3
{
  v4 = [(INPlayAnnouncementSoundIntent *)self _typedBackingStore];
  id v5 = v4;
  if (a3 == 1) {
    [v4 setSoundType:1];
  }
  else {
    [v4 setHasSoundType:0];
  }
}

- (int64_t)soundType
{
  v3 = [(INPlayAnnouncementSoundIntent *)self _typedBackingStore];
  LODWORD(v4) = [v3 hasSoundType];
  id v5 = [(INPlayAnnouncementSoundIntent *)self _typedBackingStore];
  if ([v5 soundType] == 1) {
    int64_t v4 = v4;
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (INPlayAnnouncementSoundIntent)initWithSoundType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)INPlayAnnouncementSoundIntent;
  int64_t v4 = [(INIntent *)&v7 init];
  id v5 = v4;
  if (v4) {
    [(INPlayAnnouncementSoundIntent *)v4 setSoundType:a3];
  }
  return v5;
}

- (id)_categoryVerb
{
  return @"Play";
}

- (int64_t)_intentCategory
{
  return 2;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INPlayAnnouncementSoundIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  int64_t v2 = [(INPlayAnnouncementSoundIntent *)self _typedBackingStore];
  v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  int64_t v2 = [(INIntent *)self backingStore];
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

@end