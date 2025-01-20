@interface INReadAnnouncementIntent
+ (BOOL)supportsSecureCoding;
- (INReadAnnouncementIntent)initWithReadType:(int64_t)a3 startAnnouncementIdentifier:(id)a4 userNotificationType:(int64_t)a5;
- (NSString)startAnnouncementIdentifier;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)readType;
- (int64_t)userNotificationType;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setReadType:(int64_t)a3;
- (void)setStartAnnouncementIdentifier:(id)a3;
- (void)setUserNotificationType:(int64_t)a3;
@end

@implementation INReadAnnouncementIntent

- (id)verb
{
  return @"ReadAnnouncement";
}

- (id)domain
{
  return @"HomeCommunication";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INReadAnnouncementIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13[0] = @"readType";
  int64_t v3 = [(INReadAnnouncementIntent *)self readType];
  v4 = @"unknown";
  if (v3 == 2) {
    v4 = @"repeat";
  }
  if (v3 == 1) {
    v4 = @"read";
  }
  v5 = v4;
  v14[0] = v5;
  v13[1] = @"startAnnouncementIdentifier";
  id v6 = [(INReadAnnouncementIntent *)self startAnnouncementIdentifier];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v7;
  v13[2] = @"userNotificationType";
  int64_t v8 = [(INReadAnnouncementIntent *)self userNotificationType];
  v9 = @"unknown";
  if (v8 == 2) {
    v9 = @"deliveryFailure";
  }
  if (v8 == 1) {
    v9 = @"announcement";
  }
  v10 = v9;
  v14[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  if (!v6) {

  }
  return v11;
}

- (void)setUserNotificationType:(int64_t)a3
{
  if (a3 == 1) {
    unsigned int v3 = 1;
  }
  else {
    unsigned int v3 = 0x7FFFFFFF;
  }
  if (a3 == 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = v3;
  }
  v5 = [(INReadAnnouncementIntent *)self _typedBackingStore];
  id v6 = v5;
  if (v4 == 0x7FFFFFFF) {
    [v5 setHasUserNotificationType:0];
  }
  else {
    [v5 setUserNotificationType:v4];
  }
}

- (int64_t)userNotificationType
{
  unsigned int v3 = [(INReadAnnouncementIntent *)self _typedBackingStore];
  int v4 = [v3 hasUserNotificationType];
  v5 = [(INReadAnnouncementIntent *)self _typedBackingStore];
  int v6 = [v5 userNotificationType];
  uint64_t v7 = 2 * (v6 == 2);
  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)setStartAnnouncementIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INReadAnnouncementIntent *)self _typedBackingStore];
  [v5 setStartAnnouncementIdentifier:v4];
}

- (NSString)startAnnouncementIdentifier
{
  v2 = [(INReadAnnouncementIntent *)self _typedBackingStore];
  unsigned int v3 = [v2 startAnnouncementIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setReadType:(int64_t)a3
{
  if (a3 == 1) {
    unsigned int v3 = 1;
  }
  else {
    unsigned int v3 = 0x7FFFFFFF;
  }
  if (a3 == 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = v3;
  }
  id v5 = [(INReadAnnouncementIntent *)self _typedBackingStore];
  id v6 = v5;
  if (v4 == 0x7FFFFFFF) {
    [v5 setHasReadType:0];
  }
  else {
    [v5 setReadType:v4];
  }
}

- (int64_t)readType
{
  unsigned int v3 = [(INReadAnnouncementIntent *)self _typedBackingStore];
  int v4 = [v3 hasReadType];
  id v5 = [(INReadAnnouncementIntent *)self _typedBackingStore];
  int v6 = [v5 readType];
  uint64_t v7 = 2 * (v6 == 2);
  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (INReadAnnouncementIntent)initWithReadType:(int64_t)a3 startAnnouncementIdentifier:(id)a4 userNotificationType:(int64_t)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INReadAnnouncementIntent;
  v9 = [(INIntent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(INReadAnnouncementIntent *)v9 setReadType:a3];
    [(INReadAnnouncementIntent *)v10 setStartAnnouncementIdentifier:v8];
    [(INReadAnnouncementIntent *)v10 setUserNotificationType:a5];
  }

  return v10;
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
  id v5 = [(INReadAnnouncementIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INReadAnnouncementIntent *)self _typedBackingStore];
  unsigned int v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v3 = v2;
  }
  else {
    unsigned int v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end