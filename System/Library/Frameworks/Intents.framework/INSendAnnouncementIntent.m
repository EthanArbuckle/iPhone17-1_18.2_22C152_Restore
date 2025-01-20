@interface INSendAnnouncementIntent
+ (BOOL)supportsSecureCoding;
- (INAnnouncement)announcement;
- (INSendAnnouncementIntent)initWithAnnouncement:(id)a3 recipients:(id)a4 isReply:(id)a5 sharedUserID:(id)a6;
- (NSArray)recipients;
- (NSNumber)isReply;
- (NSString)sharedUserID;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)_preferredInteractionDirection;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAnnouncement:(id)a3;
- (void)setIsReply:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSharedUserID:(id)a3;
@end

@implementation INSendAnnouncementIntent

- (id)verb
{
  return @"SendAnnouncement";
}

- (id)domain
{
  return @"HomeCommunication";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSendAnnouncementIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"announcement";
  v3 = [(INSendAnnouncementIntent *)self announcement];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"recipients";
  v5 = [(INSendAnnouncementIntent *)self recipients];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"isReply";
  v7 = [(INSendAnnouncementIntent *)self isReply];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (!v7) {

  }
  if (!v5) {
  if (!v3)
  }

  return v9;
}

- (void)setSharedUserID:(id)a3
{
  id v4 = a3;
  id v5 = [(INSendAnnouncementIntent *)self _typedBackingStore];
  [v5 setSharedUserID:v4];
}

- (NSString)sharedUserID
{
  v2 = [(INSendAnnouncementIntent *)self _typedBackingStore];
  v3 = [v2 sharedUserID];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setIsReply:(id)a3
{
  id v5 = a3;
  id v4 = [(INSendAnnouncementIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setIsReply:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasIsReply:0];
  }
}

- (NSNumber)isReply
{
  v3 = [(INSendAnnouncementIntent *)self _typedBackingStore];
  if ([v3 hasIsReply])
  {
    id v4 = NSNumber;
    id v5 = [(INSendAnnouncementIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isReply"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setRecipients:(id)a3
{
  id v4 = a3;
  id v6 = [(INSendAnnouncementIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToHomeFilters(v4);

  [v6 setRecipients:v5];
}

- (NSArray)recipients
{
  v2 = [(INSendAnnouncementIntent *)self _typedBackingStore];
  v3 = [v2 recipients];
  id v4 = INIntentSlotValueTransformFromHomeFilters(v3);

  return (NSArray *)v4;
}

- (void)setAnnouncement:(id)a3
{
  id v4 = a3;
  id v6 = [(INSendAnnouncementIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToAnnouncement(v4);

  [v6 setAnnouncement:v5];
}

- (INAnnouncement)announcement
{
  v2 = [(INSendAnnouncementIntent *)self _typedBackingStore];
  v3 = [v2 announcement];
  id v4 = INIntentSlotValueTransformFromAnnouncement(v3);

  return (INAnnouncement *)v4;
}

- (INSendAnnouncementIntent)initWithAnnouncement:(id)a3 recipients:(id)a4 isReply:(id)a5 sharedUserID:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)INSendAnnouncementIntent;
  v12 = [(INIntent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(INSendAnnouncementIntent *)v12 setAnnouncement:v9];
    [(INSendAnnouncementIntent *)v13 setRecipients:v10];
    [(INSendAnnouncementIntent *)v13 setIsReply:v11];
  }

  return v13;
}

- (int64_t)_preferredInteractionDirection
{
  return 1;
}

- (id)_categoryVerb
{
  return @"Send";
}

- (int64_t)_intentCategory
{
  return 7;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSendAnnouncementIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSendAnnouncementIntent *)self _typedBackingStore];
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

@end