@interface INSendMessageIntent
+ (BOOL)supportsSecureCoding;
+ (id)_ignoredParameters;
- (BOOL)_isUserConfirmationRequired;
- (BOOL)_isValidSubProducer:(id)a3;
- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4;
- (INOutgoingMessageType)outgoingMessageType;
- (INPerson)sender;
- (INSendMessageIntent)initWithRecipients:(NSArray *)recipients content:(NSString *)content groupName:(NSString *)groupName serviceName:(NSString *)serviceName sender:(INPerson *)sender;
- (INSendMessageIntent)initWithRecipients:(NSArray *)recipients content:(NSString *)content speakableGroupName:(INSpeakableString *)speakableGroupName conversationIdentifier:(NSString *)conversationIdentifier serviceName:(NSString *)serviceName sender:(INPerson *)sender;
- (INSendMessageIntent)initWithRecipients:(NSArray *)recipients outgoingMessageType:(INOutgoingMessageType)outgoingMessageType content:(NSString *)content speakableGroupName:(INSpeakableString *)speakableGroupName conversationIdentifier:(NSString *)conversationIdentifier serviceName:(NSString *)serviceName sender:(INPerson *)sender;
- (INSendMessageIntent)initWithRecipients:(NSArray *)recipients outgoingMessageType:(INOutgoingMessageType)outgoingMessageType content:(NSString *)content speakableGroupName:(INSpeakableString *)speakableGroupName conversationIdentifier:(NSString *)conversationIdentifier serviceName:(NSString *)serviceName sender:(INPerson *)sender attachments:(NSArray *)attachments;
- (INSendMessageIntent)initWithRecipients:(id)a3 content:(id)a4 serviceName:(id)a5 sender:(id)a6;
- (INSpeakableString)speakableGroupName;
- (NSArray)attachments;
- (NSArray)recipients;
- (NSString)alternativeConversationIdentifier;
- (NSString)content;
- (NSString)conversationIdentifier;
- (NSString)groupName;
- (NSString)notificationThreadIdentifier;
- (NSString)serviceName;
- (id)_categoryVerb;
- (id)_currentParameterCombination;
- (id)_dictionaryRepresentation;
- (id)_keyCodableAttributes;
- (id)_metadata;
- (id)_redactedDictionaryRepresentation;
- (id)_spotlightContentType;
- (id)_typedBackingStore;
- (id)_validParameterCombinationsWithSchema:(id)a3;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)_preferredInteractionDirection;
- (int64_t)effect;
- (void)_intents_resolveOutgoingMessageTypeWithCompletionHandler:(id)a3;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAlternativeConversationIdentifier:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setContent:(id)a3;
- (void)setConversationIdentifier:(id)a3;
- (void)setEffect:(int64_t)a3;
- (void)setGroupName:(id)a3;
- (void)setNotificationThreadIdentifier:(id)a3;
- (void)setOutgoingMessageType:(int64_t)a3;
- (void)setRecipients:(id)a3;
- (void)setSender:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setSpeakableGroupName:(id)a3;
@end

@implementation INSendMessageIntent

- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(INSendMessageIntent *)self recipients];
  v8 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = INPersonToCSPerson(*(void **)(*((void *)&v32 + 1) + 8 * i));
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v11);
  }

  [v6 setPrimaryRecipients:v8];
  v15 = NSStringFromSelector(sel_displayName);
  v16 = [v8 valueForKey:v15];
  [v6 setRecipientNames:v16];

  v17 = [v8 valueForKeyPath:@"handles.@distinctUnionOfArrays.self"];
  [v6 setRecipientAddresses:v17];

  v18 = [(INSendMessageIntent *)self content];
  [v6 setTextContent:v18];

  v19 = [(INSendMessageIntent *)self sender];
  v20 = [v19 contactIdentifier];
  if (v20)
  {
    [v6 setAccountIdentifier:v20];
  }
  else
  {
    v21 = [v19 customIdentifier];
    [v6 setAccountIdentifier:v21];
  }
  uint64_t v22 = INPersonToCSPerson(v19);
  v23 = (void *)v22;
  if (v22)
  {
    uint64_t v37 = v22;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    [v6 setAuthors:v24];

    v25 = [v23 handles];
    [v6 setAccountHandles:v25];
  }
  v26 = [(INSendMessageIntent *)self speakableGroupName];
  v27 = [v26 spokenPhrase];

  if ([v27 length])
  {
    v36 = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    [v6 setAlternateNames:v28];
  }
  v31.receiver = self;
  v31.super_class = (Class)INSendMessageIntent;
  BOOL v29 = [(INIntent *)&v31 configureAttributeSet:v6 includingData:v4];

  return v29;
}

- (INSendMessageIntent)initWithRecipients:(id)a3 content:(id)a4 serviceName:(id)a5 sender:(id)a6
{
  return [(INSendMessageIntent *)self initWithRecipients:a3 outgoingMessageType:0 content:a4 speakableGroupName:0 conversationIdentifier:0 serviceName:a5 sender:a6 attachments:0];
}

- (void)setGroupName:(id)a3
{
  id v4 = a3;
  v7 = [[INSpeakableString alloc] initWithSpokenPhrase:v4];

  v5 = [(INSendMessageIntent *)self _typedBackingStore];
  id v6 = INIntentSlotValueTransformToDataString(v7);
  [v5 setSpeakableGroupName:v6];
}

- (NSString)groupName
{
  v2 = [(INSendMessageIntent *)self _typedBackingStore];
  v3 = [v2 speakableGroupName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  v5 = [v4 spokenPhrase];
  id v6 = (void *)[v5 copy];

  return (NSString *)v6;
}

- (INSendMessageIntent)initWithRecipients:(NSArray *)recipients outgoingMessageType:(INOutgoingMessageType)outgoingMessageType content:(NSString *)content speakableGroupName:(INSpeakableString *)speakableGroupName conversationIdentifier:(NSString *)conversationIdentifier serviceName:(NSString *)serviceName sender:(INPerson *)sender
{
  return [(INSendMessageIntent *)self initWithRecipients:recipients outgoingMessageType:outgoingMessageType content:content speakableGroupName:speakableGroupName conversationIdentifier:conversationIdentifier serviceName:serviceName sender:sender attachments:0];
}

- (INSendMessageIntent)initWithRecipients:(NSArray *)recipients content:(NSString *)content speakableGroupName:(INSpeakableString *)speakableGroupName conversationIdentifier:(NSString *)conversationIdentifier serviceName:(NSString *)serviceName sender:(INPerson *)sender
{
  return [(INSendMessageIntent *)self initWithRecipients:recipients outgoingMessageType:0 content:content speakableGroupName:speakableGroupName conversationIdentifier:conversationIdentifier serviceName:serviceName sender:sender];
}

- (INSendMessageIntent)initWithRecipients:(NSArray *)recipients content:(NSString *)content groupName:(NSString *)groupName serviceName:(NSString *)serviceName sender:(INPerson *)sender
{
  uint64_t v12 = recipients;
  v13 = content;
  v14 = groupName;
  v15 = serviceName;
  v16 = sender;
  if (v14) {
    v17 = [[INSpeakableString alloc] initWithSpokenPhrase:v14];
  }
  else {
    v17 = 0;
  }
  v18 = [(INSendMessageIntent *)self initWithRecipients:v12 outgoingMessageType:0 content:v13 speakableGroupName:v17 conversationIdentifier:0 serviceName:v15 sender:v16];

  return v18;
}

+ (id)_ignoredParameters
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"conversationIdentifier", @"serviceName", @"sender", @"effect", @"attachments", @"outgoingMessageType", @"notificationThreadIdentifier", 0);
}

- (BOOL)_isValidSubProducer:(id)a3
{
  id v4 = a3;
  v5 = [(INSendMessageIntent *)self sender];
  char v6 = [v4 isEqual:v5];

  return v6 ^ 1;
}

- (id)_spotlightContentType
{
  v2 = @"com.apple.siri.interaction.message";
  return @"com.apple.siri.interaction.message";
}

- (id)verb
{
  return @"SendMessage";
}

- (id)domain
{
  return @"Messages";
}

- (BOOL)_isUserConfirmationRequired
{
  return 1;
}

- (id)_currentParameterCombination
{
  v3 = [(INIntent *)self _nonNilParameters];
  id v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"serviceName", @"sender", @"effect", @"attachments", @"messageType", 0);
  [v4 minusSet:v5];

  char v6 = [(INIntent *)self _nonNilParameters];
  int v7 = [v6 containsObject:@"conversationIdentifier"];

  if (!v7) {
    goto LABEL_4;
  }
  v8 = [(INIntent *)self _parameterCombinations];
  id v9 = [v8 objectForKey:v4];

  if (!v9)
  {
    [v4 removeObject:@"conversationIdentifier"];
    uint64_t v10 = [(INIntent *)self _parameterCombinations];
    id v9 = [v10 objectForKey:v4];

    if (!v9)
    {
LABEL_4:
      v12.receiver = self;
      v12.super_class = (Class)INSendMessageIntent;
      id v9 = [(INIntent *)&v12 _currentParameterCombination];
    }
  }

  return v9;
}

- (id)_validParameterCombinationsWithSchema:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)INSendMessageIntent;
  id v4 = [(INIntent *)&v27 _validParameterCombinationsWithSchema:a3];
  v5 = [(INIntent *)self _nonNilParameters];
  if ([v5 containsObject:@"speakableGroupName"]
    && [v5 containsObject:@"recipients"])
  {
    char v6 = (objc_class *)MEMORY[0x1E4F1CAD0];
    id v7 = v4;
    id v8 = [v6 alloc];
    id v9 = [v7 allKeys];
    uint64_t v10 = (void *)[v8 initWithArray:v9];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __INCoalesceValidMessagingParameterCombinations_block_invoke;
    v28[3] = &unk_1E551A480;
    id v29 = v10;
    id v11 = v10;
    id v4 = INDictionaryWithObjectsForKeysPassingTest(v7, v28);
  }
  if ([v5 containsObject:@"conversationIdentifier"]
    && (([v5 containsObject:@"speakableGroupName"] & 1) != 0
     || [v5 containsObject:@"recipients"]))
  {
    uint64_t v22 = v5;
    objc_super v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v13 = [v4 allKeys];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (([v18 containsObject:@"speakableGroupName"] & 1) != 0
            || [v18 containsObject:@"recipients"])
          {
            v19 = [v4 objectForKey:v18];
            v20 = [v18 setByAddingObject:@"conversationIdentifier"];
            [v12 setObject:v19 forKey:v20];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v30 count:16];
      }
      while (v15);
    }

    v5 = v22;
  }
  else
  {
    objc_super v12 = v4;
  }

  return v12;
}

- (id)_keyCodableAttributes
{
  v2 = [(INIntent *)self _codableDescription];
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = [v2 attributeByName:@"speakableGroupName"];
  v5 = [v2 keyAttribute];
  char v6 = objc_msgSend(v3, "arrayWithObjects:", v4, v5, 0);

  return v6;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  id v7 = [(INSendMessageIntent *)self _typedBackingStore];
  id v15 = v6;
  id v8 = (void *)[v7 copy];
  id v9 = [v7 recipients];
  uint64_t v10 = INIntentSlotValueRedactedContactsFromContacts(v9, a3, v15);

  [v8 setRecipients:v10];
  id v11 = [v7 content];
  objc_super v12 = INIntentSlotValueRedactedStringFromString(v11, a3, v15);
  [v8 setContent:v12];

  v13 = [v7 sender];
  uint64_t v14 = INIntentSlotValueRedactedContactFromContact(v13, a3, v15);

  [v8 setSender:v14];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v28[8] = *MEMORY[0x1E4F143B8];
  v27[0] = @"recipients";
  uint64_t v3 = [(INSendMessageIntent *)self recipients];
  id v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  long long v24 = (void *)v3;
  v28[0] = v3;
  v27[1] = @"outgoingMessageType";
  INOutgoingMessageType v5 = [(INSendMessageIntent *)self outgoingMessageType];
  id v6 = @"unknown";
  if (v5 == INOutgoingMessageTypeOutgoingMessageAudio) {
    id v6 = @"outgoingMessageAudio";
  }
  if (v5 == INOutgoingMessageTypeOutgoingMessageText) {
    id v6 = @"outgoingMessageText";
  }
  long long v25 = v6;
  v28[1] = v25;
  v27[2] = @"content";
  uint64_t v7 = [(INSendMessageIntent *)self content];
  id v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  long long v23 = (void *)v7;
  v28[2] = v7;
  v27[3] = @"speakableGroupName";
  uint64_t v9 = [(INSendMessageIntent *)self speakableGroupName];
  uint64_t v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v22 = (void *)v9;
  v28[3] = v9;
  v27[4] = @"conversationIdentifier";
  uint64_t v11 = [(INSendMessageIntent *)self conversationIdentifier];
  objc_super v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  void v28[4] = v11;
  v27[5] = @"serviceName";
  v13 = [(INSendMessageIntent *)self serviceName];
  uint64_t v14 = v13;
  if (!v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  long long v26 = v4;
  v28[5] = v14;
  v27[6] = @"sender";
  id v15 = [(INSendMessageIntent *)self sender];
  uint64_t v16 = v15;
  if (!v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[6] = v16;
  v27[7] = @"attachments";
  v17 = [(INSendMessageIntent *)self attachments];
  v18 = v17;
  if (!v17)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[7] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:8];
  if (!v17) {

  }
  if (!v15) {
  if (!v13)
  }

  if (!v12) {
  if (!v10)
  }

  if (!v8) {
  if (!v26)
  }

  return v19;
}

- (id)_redactedDictionaryRepresentation
{
  v2 = [(INSendMessageIntent *)self _dictionaryRepresentation];
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 setObject:@"<redacted>" forKey:@"content"];

  return v3;
}

- (void)setAlternativeConversationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INSendMessageIntent *)self _typedBackingStore];
  [v5 setAlternativeConversationIdentifier:v4];
}

- (NSString)alternativeConversationIdentifier
{
  v2 = [(INSendMessageIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 alternativeConversationIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setNotificationThreadIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INSendMessageIntent *)self _typedBackingStore];
  [v5 setNotificationThreadIdentifier:v4];
}

- (NSString)notificationThreadIdentifier
{
  v2 = [(INSendMessageIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 notificationThreadIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setAttachments:(id)a3
{
  id v4 = a3;
  id v6 = [(INSendMessageIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToSendMessageAttachments(v4);

  [v6 setAttachments:v5];
}

- (NSArray)attachments
{
  v2 = [(INSendMessageIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 attachments];
  id v4 = INIntentSlotValueTransformFromSendMessageAttachments(v3);

  return (NSArray *)v4;
}

- (void)setEffect:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INSendMessageIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 0xC) {
    [v4 setHasEffect:0];
  }
  else {
    objc_msgSend(v4, "setEffect:");
  }
}

- (int64_t)effect
{
  unint64_t v3 = [(INSendMessageIntent *)self _typedBackingStore];
  int v4 = [v3 hasEffect];
  id v5 = [(INSendMessageIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 effect] - 1;
  if (v6 <= 0xC) {
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

- (void)setSender:(id)a3
{
  id v4 = a3;
  id v6 = [(INSendMessageIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToContact(v4);

  [v6 setSender:v5];
}

- (INPerson)sender
{
  v2 = [(INSendMessageIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 sender];
  id v4 = INIntentSlotValueTransformFromContact(v3);

  return (INPerson *)v4;
}

- (void)setServiceName:(id)a3
{
  id v4 = a3;
  id v5 = [(INSendMessageIntent *)self _typedBackingStore];
  [v5 setServiceName:v4];
}

- (NSString)serviceName
{
  v2 = [(INSendMessageIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 serviceName];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setConversationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INSendMessageIntent *)self _typedBackingStore];
  [v5 setConversationIdentifier:v4];
}

- (NSString)conversationIdentifier
{
  v2 = [(INSendMessageIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 conversationIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setSpeakableGroupName:(id)a3
{
  id v4 = a3;
  id v6 = [(INSendMessageIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setSpeakableGroupName:v5];
}

- (INSpeakableString)speakableGroupName
{
  v2 = [(INSendMessageIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 speakableGroupName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setContent:(id)a3
{
  id v4 = a3;
  id v6 = [(INSendMessageIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToString(v4);

  [v6 setContent:v5];
}

- (NSString)content
{
  v2 = [(INSendMessageIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 content];
  id v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (void)setOutgoingMessageType:(int64_t)a3
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
  id v5 = [(INSendMessageIntent *)self _typedBackingStore];
  id v6 = v5;
  if (v4 == 0x7FFFFFFF) {
    [v5 setHasOutgoingMessageType:0];
  }
  else {
    [v5 setOutgoingMessageType:v4];
  }
}

- (INOutgoingMessageType)outgoingMessageType
{
  unsigned int v3 = [(INSendMessageIntent *)self _typedBackingStore];
  int v4 = [v3 hasOutgoingMessageType];
  id v5 = [(INSendMessageIntent *)self _typedBackingStore];
  int v6 = [v5 outgoingMessageType];
  uint64_t v7 = 2 * (v6 == 2);
  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  if (v4) {
    INOutgoingMessageType v8 = v7;
  }
  else {
    INOutgoingMessageType v8 = INOutgoingMessageTypeUnknown;
  }

  return v8;
}

- (void)setRecipients:(id)a3
{
  id v4 = a3;
  id v6 = [(INSendMessageIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToContacts(v4);

  [v6 setRecipients:v5];
}

- (NSArray)recipients
{
  v2 = [(INSendMessageIntent *)self _typedBackingStore];
  unsigned int v3 = [v2 recipients];
  id v4 = INIntentSlotValueTransformFromContacts(v3);

  return (NSArray *)v4;
}

- (INSendMessageIntent)initWithRecipients:(NSArray *)recipients outgoingMessageType:(INOutgoingMessageType)outgoingMessageType content:(NSString *)content speakableGroupName:(INSpeakableString *)speakableGroupName conversationIdentifier:(NSString *)conversationIdentifier serviceName:(NSString *)serviceName sender:(INPerson *)sender attachments:(NSArray *)attachments
{
  uint64_t v16 = recipients;
  v17 = content;
  v18 = speakableGroupName;
  v19 = conversationIdentifier;
  v20 = serviceName;
  v21 = sender;
  uint64_t v22 = attachments;
  v26.receiver = self;
  v26.super_class = (Class)INSendMessageIntent;
  long long v23 = [(INIntent *)&v26 init];
  long long v24 = v23;
  if (v23)
  {
    [(INSendMessageIntent *)v23 setRecipients:v16];
    [(INSendMessageIntent *)v24 setOutgoingMessageType:outgoingMessageType];
    [(INSendMessageIntent *)v24 setContent:v17];
    [(INSendMessageIntent *)v24 setSpeakableGroupName:v18];
    [(INSendMessageIntent *)v24 setConversationIdentifier:v19];
    [(INSendMessageIntent *)v24 setServiceName:v20];
    [(INSendMessageIntent *)v24 setSender:v21];
    [(INSendMessageIntent *)v24 setAttachments:v22];
  }

  return v24;
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
  id v5 = [(INSendMessageIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSendMessageIntent *)self _typedBackingStore];
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

- (void)_intents_resolveOutgoingMessageTypeWithCompletionHandler:(id)a3
{
  INOutgoingMessageType v8 = (void (**)(id, uint64_t))a3;
  INOutgoingMessageType v4 = [(INSendMessageIntent *)self outgoingMessageType];
  if (v4 == INOutgoingMessageTypeOutgoingMessageAudio)
  {
    uint64_t v6 = +[INIntentResolutionResult unsupported];
LABEL_7:
    uint64_t v7 = (void *)v6;
    v8[2](v8, v6);

    goto LABEL_8;
  }
  if (v4 == INOutgoingMessageTypeOutgoingMessageText)
  {
    uint64_t v6 = +[INOutgoingMessageTypeResolutionResult successWithResolvedOutgoingMessageType:1];
    goto LABEL_7;
  }
  id v5 = v8;
  if (v4) {
    goto LABEL_9;
  }
  INOutgoingMessageType v4 = ((uint64_t (*)(id, void))v8[2])(v8, 0);
LABEL_8:
  id v5 = v8;
LABEL_9:

  MEMORY[0x1F41817F8](v4, v5);
}

@end