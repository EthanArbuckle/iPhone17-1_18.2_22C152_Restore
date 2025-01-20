@interface INSearchForMessagesIntent
+ (BOOL)supportsSecureCoding;
- (INConditionalOperator)conversationIdentifiersOperator;
- (INConditionalOperator)groupNamesOperator;
- (INConditionalOperator)identifiersOperator;
- (INConditionalOperator)notificationIdentifiersOperator;
- (INConditionalOperator)recipientsOperator;
- (INConditionalOperator)searchTermsOperator;
- (INConditionalOperator)sendersOperator;
- (INConditionalOperator)speakableGroupNamesOperator;
- (INDateComponentsRange)dateTimeRange;
- (INMessageAttributeOptions)attributes;
- (INSearchForMessagesIntent)initWithRecipients:(NSArray *)recipients senders:(NSArray *)senders searchTerms:(NSArray *)searchTerms attributes:(INMessageAttributeOptions)attributes dateTimeRange:(INDateComponentsRange *)dateTimeRange identifiers:(NSArray *)identifiers notificationIdentifiers:(NSArray *)notificationIdentifiers groupNames:(NSArray *)groupNames;
- (INSearchForMessagesIntent)initWithRecipients:(NSArray *)recipients senders:(NSArray *)senders searchTerms:(NSArray *)searchTerms attributes:(INMessageAttributeOptions)attributes dateTimeRange:(INDateComponentsRange *)dateTimeRange identifiers:(NSArray *)identifiers notificationIdentifiers:(NSArray *)notificationIdentifiers speakableGroupNames:(NSArray *)speakableGroupNames;
- (INSearchForMessagesIntent)initWithRecipients:(NSArray *)recipients senders:(NSArray *)senders searchTerms:(NSArray *)searchTerms attributes:(INMessageAttributeOptions)attributes dateTimeRange:(INDateComponentsRange *)dateTimeRange identifiers:(NSArray *)identifiers notificationIdentifiers:(NSArray *)notificationIdentifiers speakableGroupNames:(NSArray *)speakableGroupNames conversationIdentifiers:(NSArray *)conversationIdentifiers;
- (INSearchForMessagesIntent)initWithRecipients:(id)a3 senders:(id)a4 contents:(id)a5 attributes:(unint64_t)a6 dateTimeRange:(id)a7 identifiers:(id)a8;
- (INSearchForMessagesIntent)initWithRecipients:(id)a3 senders:(id)a4 contents:(id)a5 attributes:(unint64_t)a6 dateTimeRange:(id)a7 identifiers:(id)a8 notificationIdentifiers:(id)a9;
- (NSArray)conversationIdentifiers;
- (NSArray)groupNames;
- (NSArray)identifiers;
- (NSArray)notificationIdentifiers;
- (NSArray)recipients;
- (NSArray)searchTerms;
- (NSArray)senders;
- (NSArray)speakableGroupNames;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)attributeSet;
- (id)contentPredicate;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)contentsOperator;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAttributes:(unint64_t)a3;
- (void)setConversationIdentifiers:(id)a3;
- (void)setDateTimeRange:(id)a3;
- (void)setGroupNames:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setNotificationIdentifiers:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSearchTerms:(id)a3;
- (void)setSenders:(id)a3;
- (void)setSpeakableGroupNames:(id)a3;
@end

@implementation INSearchForMessagesIntent

- (void)setRecipients:(id)a3
{
  id v8 = a3;
  v4 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  v5 = [v4 recipient];

  if (!v5)
  {
    v5 = objc_alloc_init(_INPBContactList);
    v6 = [(INSearchForMessagesIntent *)self _typedBackingStore];
    [v6 setRecipient:v5];
  }
  v7 = INIntentSlotValueTransformToContacts(v8);
  [(_INPBContactList *)v5 setContacts:v7];
}

- (NSArray)senders
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  v3 = [v2 sender];

  v4 = [v3 contacts];
  v5 = INIntentSlotValueTransformFromContacts(v4);

  return (NSArray *)v5;
}

- (INSearchForMessagesIntent)initWithRecipients:(NSArray *)recipients senders:(NSArray *)senders searchTerms:(NSArray *)searchTerms attributes:(INMessageAttributeOptions)attributes dateTimeRange:(INDateComponentsRange *)dateTimeRange identifiers:(NSArray *)identifiers notificationIdentifiers:(NSArray *)notificationIdentifiers speakableGroupNames:(NSArray *)speakableGroupNames conversationIdentifiers:(NSArray *)conversationIdentifiers
{
  v17 = recipients;
  v18 = senders;
  v19 = searchTerms;
  v20 = dateTimeRange;
  v21 = identifiers;
  v22 = notificationIdentifiers;
  v23 = speakableGroupNames;
  v24 = conversationIdentifiers;
  v28.receiver = self;
  v28.super_class = (Class)INSearchForMessagesIntent;
  v25 = [(INIntent *)&v28 init];
  v26 = v25;
  if (v25)
  {
    [(INSearchForMessagesIntent *)v25 setRecipients:v17];
    [(INSearchForMessagesIntent *)v26 setSenders:v18];
    [(INSearchForMessagesIntent *)v26 setSearchTerms:v19];
    [(INSearchForMessagesIntent *)v26 setAttributes:attributes];
    [(INSearchForMessagesIntent *)v26 setDateTimeRange:v20];
    [(INSearchForMessagesIntent *)v26 setIdentifiers:v21];
    [(INSearchForMessagesIntent *)v26 setNotificationIdentifiers:v22];
    [(INSearchForMessagesIntent *)v26 setSpeakableGroupNames:v23];
    [(INSearchForMessagesIntent *)v26 setConversationIdentifiers:v24];
  }

  return v26;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)attributeSet
{
  return 0;
}

- (id)contentPredicate
{
  return 0;
}

- (int64_t)contentsOperator
{
  return 0;
}

- (INSearchForMessagesIntent)initWithRecipients:(id)a3 senders:(id)a4 contents:(id)a5 attributes:(unint64_t)a6 dateTimeRange:(id)a7 identifiers:(id)a8 notificationIdentifiers:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = [[INDateComponentsRange alloc] initWithDateInterval:v18 onCalendar:0 inTimeZone:0];

  v23 = [(INSearchForMessagesIntent *)self initWithRecipients:v21 senders:v20 searchTerms:v19 attributes:a6 dateTimeRange:v22 identifiers:v17 notificationIdentifiers:v16 speakableGroupNames:0];
  return v23;
}

- (INSearchForMessagesIntent)initWithRecipients:(id)a3 senders:(id)a4 contents:(id)a5 attributes:(unint64_t)a6 dateTimeRange:(id)a7 identifiers:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [[INDateComponentsRange alloc] initWithDateInterval:v15 onCalendar:0 inTimeZone:0];

  id v20 = [(INSearchForMessagesIntent *)self initWithRecipients:v18 senders:v17 searchTerms:v16 attributes:a6 dateTimeRange:v19 identifiers:v14 notificationIdentifiers:0 speakableGroupNames:0];
  return v20;
}

- (INConditionalOperator)groupNamesOperator
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  v3 = [v2 speakableGroupName];

  id v4 = [v3 conditionType];
  INConditionalOperator v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (void)setGroupNames:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  INConditionalOperator v5 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        v12 = [INSpeakableString alloc];
        v13 = -[INSpeakableString initWithSpokenPhrase:](v12, "initWithSpokenPhrase:", v11, (void)v17);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v14 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  id v15 = INIntentSlotValueTransformToDataStringList(v5);
  id v16 = (void *)[v15 mutableCopy];
  [v14 setSpeakableGroupName:v16];
}

- (NSArray)groupNames
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  v3 = [v2 speakableGroupName];
  id v4 = INIntentSlotValueTransformFromDataStringList(v3);

  INConditionalOperator v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "spokenPhrase", (void)v14);
        v12 = (void *)[v11 copy];

        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return (NSArray *)v5;
}

- (INSearchForMessagesIntent)initWithRecipients:(NSArray *)recipients senders:(NSArray *)senders searchTerms:(NSArray *)searchTerms attributes:(INMessageAttributeOptions)attributes dateTimeRange:(INDateComponentsRange *)dateTimeRange identifiers:(NSArray *)identifiers notificationIdentifiers:(NSArray *)notificationIdentifiers speakableGroupNames:(NSArray *)speakableGroupNames
{
  return [(INSearchForMessagesIntent *)self initWithRecipients:recipients senders:senders searchTerms:searchTerms attributes:attributes dateTimeRange:dateTimeRange identifiers:identifiers notificationIdentifiers:notificationIdentifiers speakableGroupNames:speakableGroupNames conversationIdentifiers:0];
}

- (INSearchForMessagesIntent)initWithRecipients:(NSArray *)recipients senders:(NSArray *)senders searchTerms:(NSArray *)searchTerms attributes:(INMessageAttributeOptions)attributes dateTimeRange:(INDateComponentsRange *)dateTimeRange identifiers:(NSArray *)identifiers notificationIdentifiers:(NSArray *)notificationIdentifiers groupNames:(NSArray *)groupNames
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v32 = recipients;
  v31 = senders;
  v30 = searchTerms;
  long long v14 = dateTimeRange;
  long long v15 = identifiers;
  long long v16 = notificationIdentifiers;
  long long v17 = groupNames;
  long long v18 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v19 = v17;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = [[INSpeakableString alloc] initWithSpokenPhrase:*(void *)(*((void *)&v33 + 1) + 8 * v23)];
        [v18 addObject:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v21);
  }

  v25 = (void *)[v18 copy];
  v26 = [(INSearchForMessagesIntent *)self initWithRecipients:v32 senders:v31 searchTerms:v30 attributes:attributes dateTimeRange:v14 identifiers:v15 notificationIdentifiers:v16 speakableGroupNames:v25];

  return v26;
}

- (id)verb
{
  return @"SearchForMessages";
}

- (id)domain
{
  return @"Messages";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  id v31 = v6;
  v26 = v7;
  uint64_t v8 = (void *)[v7 copy];
  v29 = [v8 recipient];
  uint64_t v9 = [v29 contacts];
  objc_super v28 = INIntentSlotValueRedactedContactsFromContacts(v9, a3, v31);

  [v29 setContacts:v28];
  uint64_t v10 = [v8 sender];
  uint64_t v11 = [v10 contacts];
  v27 = INIntentSlotValueRedactedContactsFromContacts(v11, a3, v31);

  [v10 setContacts:v27];
  v12 = [v8 searchTerm];
  v13 = [v12 dataStrings];
  v25 = INIntentSlotValueRedactedStringsFromStrings(v13, a3, v31);

  [v12 setDataStrings:v25];
  long long v14 = [v7 dateTimeRange];
  long long v15 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v14, a3);
  [v8 setDateTimeRange:v15];

  long long v16 = [v8 identifier];
  long long v17 = [v16 dataStrings];
  long long v18 = INIntentSlotValueRedactedStringsFromStrings(v17, a3, v31);

  [v16 setDataStrings:v18];
  uint64_t v19 = [v8 notificationIdentifier];
  uint64_t v20 = [v19 dataStrings];
  uint64_t v21 = INIntentSlotValueRedactedStringsFromStrings(v20, a3, v31);

  [v19 setDataStrings:v21];
  uint64_t v22 = [v8 conversationIdentifier];
  uint64_t v23 = [v22 dataStrings];
  v24 = INIntentSlotValueRedactedStringsFromStrings(v23, a3, v31);

  [v22 setDataStrings:v24];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v32[9] = *MEMORY[0x1E4F143B8];
  v31[0] = @"recipients";
  uint64_t v3 = [(INSearchForMessagesIntent *)self recipients];
  id v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v3;
  v32[0] = v3;
  v31[1] = @"senders";
  uint64_t v5 = [(INSearchForMessagesIntent *)self senders];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v5;
  v32[1] = v5;
  v31[2] = @"searchTerms";
  uint64_t v7 = [(INSearchForMessagesIntent *)self searchTerms];
  uint64_t v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v7;
  v32[2] = v7;
  v31[3] = @"attributes";
  uint64_t v9 = INMessageAttributeOptionsGetNames([(INSearchForMessagesIntent *)self attributes]);
  uint64_t v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v9;
  v32[3] = v9;
  v31[4] = @"dateTimeRange";
  uint64_t v11 = [(INSearchForMessagesIntent *)self dateTimeRange];
  v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = v4;
  uint64_t v23 = (void *)v11;
  v32[4] = v11;
  v31[5] = @"identifiers";
  uint64_t v13 = [(INSearchForMessagesIntent *)self identifiers];
  long long v14 = (void *)v13;
  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = v6;
  uint64_t v22 = (void *)v13;
  v32[5] = v13;
  v31[6] = @"notificationIdentifiers";
  long long v15 = [(INSearchForMessagesIntent *)self notificationIdentifiers];
  long long v16 = v15;
  if (!v15)
  {
    long long v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[6] = v16;
  v31[7] = @"speakableGroupNames";
  long long v17 = [(INSearchForMessagesIntent *)self speakableGroupNames];
  long long v18 = v17;
  if (!v17)
  {
    long long v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[7] = v18;
  v31[8] = @"conversationIdentifiers";
  uint64_t v19 = [(INSearchForMessagesIntent *)self conversationIdentifiers];
  uint64_t v20 = v19;
  if (!v19)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v32[8] = v20;
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:9];
  if (!v19) {

  }
  if (!v17) {
  if (!v15)
  }

  if (!v14) {
  if (!v12)
  }

  if (!v10) {
  if (!v8)
  }

  if (!v29) {
  if (!v30)
  }

  return v28;
}

- (void)setConversationIdentifiers:(id)a3
{
  id v8 = a3;
  id v4 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  uint64_t v5 = [v4 conversationIdentifier];

  if (!v5)
  {
    uint64_t v5 = objc_alloc_init(_INPBStringList);
    id v6 = [(INSearchForMessagesIntent *)self _typedBackingStore];
    [v6 setConversationIdentifier:v5];
  }
  uint64_t v7 = INIntentSlotValueTransformToStrings(v8);
  [(_INPBStringList *)v5 setDataStrings:v7];
}

- (INConditionalOperator)conversationIdentifiersOperator
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 conversationIdentifier];

  id v4 = [v3 conditionType];
  INConditionalOperator v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (NSArray)conversationIdentifiers
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 conversationIdentifier];

  id v4 = [v3 dataStrings];
  INConditionalOperator v5 = INIntentSlotValueTransformFromStrings(v4);

  return (NSArray *)v5;
}

- (void)setSpeakableGroupNames:(id)a3
{
  id v8 = a3;
  id v4 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  INConditionalOperator v5 = [v4 speakableGroupName];

  if (!v5)
  {
    INConditionalOperator v5 = objc_alloc_init(_INPBDataStringList);
    id v6 = [(INSearchForMessagesIntent *)self _typedBackingStore];
    [v6 setSpeakableGroupName:v5];
  }
  uint64_t v7 = INIntentSlotValueTransformToDataStrings(v8);
  [(_INPBDataStringList *)v5 setDataStrings:v7];
}

- (INConditionalOperator)speakableGroupNamesOperator
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 speakableGroupName];

  id v4 = [v3 conditionType];
  INConditionalOperator v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (NSArray)speakableGroupNames
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 speakableGroupName];

  id v4 = [v3 dataStrings];
  INConditionalOperator v5 = INIntentSlotValueTransformFromDataStrings(v4);

  return (NSArray *)v5;
}

- (void)setNotificationIdentifiers:(id)a3
{
  id v8 = a3;
  id v4 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  INConditionalOperator v5 = [v4 notificationIdentifier];

  if (!v5)
  {
    INConditionalOperator v5 = objc_alloc_init(_INPBStringList);
    id v6 = [(INSearchForMessagesIntent *)self _typedBackingStore];
    [v6 setNotificationIdentifier:v5];
  }
  uint64_t v7 = INIntentSlotValueTransformToStrings(v8);
  [(_INPBStringList *)v5 setDataStrings:v7];
}

- (INConditionalOperator)notificationIdentifiersOperator
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 notificationIdentifier];

  id v4 = [v3 conditionType];
  INConditionalOperator v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (NSArray)notificationIdentifiers
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 notificationIdentifier];

  id v4 = [v3 dataStrings];
  INConditionalOperator v5 = INIntentSlotValueTransformFromStrings(v4);

  return (NSArray *)v5;
}

- (void)setIdentifiers:(id)a3
{
  id v8 = a3;
  id v4 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  INConditionalOperator v5 = [v4 identifier];

  if (!v5)
  {
    INConditionalOperator v5 = objc_alloc_init(_INPBStringList);
    id v6 = [(INSearchForMessagesIntent *)self _typedBackingStore];
    [v6 setIdentifier:v5];
  }
  uint64_t v7 = INIntentSlotValueTransformToStrings(v8);
  [(_INPBStringList *)v5 setDataStrings:v7];
}

- (INConditionalOperator)identifiersOperator
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 identifier];

  id v4 = [v3 conditionType];
  INConditionalOperator v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (NSArray)identifiers
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 identifier];

  id v4 = [v3 dataStrings];
  INConditionalOperator v5 = INIntentSlotValueTransformFromStrings(v4);

  return (NSArray *)v5;
}

- (void)setDateTimeRange:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  INConditionalOperator v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setDateTimeRange:v5];
}

- (INDateComponentsRange)dateTimeRange
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 dateTimeRange];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setAttributes:(unint64_t)a3
{
  INConditionalOperator v5 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  [v5 clearAttributes];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__INSearchForMessagesIntent_setAttributes___block_invoke;
  v6[3] = &unk_1E5520C28;
  v6[4] = self;
  INMessageAttributeOptionsEnumerateBackingTypes(a3, v6);
}

void __43__INSearchForMessagesIntent_setAttributes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _typedBackingStore];
  [v3 addAttribute:a2];
}

- (INMessageAttributeOptions)attributes
{
  id v3 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  uint64_t v4 = [v3 attributesCount];

  INMessageAttributeOptions v5 = 0;
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v7 = [(INSearchForMessagesIntent *)self _typedBackingStore];
      switch([v7 attributeAtIndex:i])
      {
        case 1u:
          v5 |= 1uLL;
          break;
        case 2u:
          v5 |= 2uLL;
          break;
        case 3u:
          v5 |= 4uLL;
          break;
        case 4u:
          v5 |= 8uLL;
          break;
        case 5u:
          v5 |= 0x10uLL;
          break;
        default:
          break;
      }
    }
  }
  return v5;
}

- (void)setSearchTerms:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  INMessageAttributeOptions v5 = [v4 searchTerm];

  if (!v5)
  {
    INMessageAttributeOptions v5 = objc_alloc_init(_INPBStringList);
    id v6 = [(INSearchForMessagesIntent *)self _typedBackingStore];
    [v6 setSearchTerm:v5];
  }
  uint64_t v7 = INIntentSlotValueTransformToStrings(v8);
  [(_INPBStringList *)v5 setDataStrings:v7];
}

- (INConditionalOperator)searchTermsOperator
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  id v3 = [v2 searchTerm];

  uint64_t v4 = [v3 conditionType];
  INConditionalOperator v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (NSArray)searchTerms
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  id v3 = [v2 searchTerm];

  uint64_t v4 = [v3 dataStrings];
  INConditionalOperator v5 = INIntentSlotValueTransformFromStrings(v4);

  return (NSArray *)v5;
}

- (void)setSenders:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  INConditionalOperator v5 = [v4 sender];

  if (!v5)
  {
    INConditionalOperator v5 = objc_alloc_init(_INPBContactList);
    id v6 = [(INSearchForMessagesIntent *)self _typedBackingStore];
    [v6 setSender:v5];
  }
  uint64_t v7 = INIntentSlotValueTransformToContacts(v8);
  [(_INPBContactList *)v5 setContacts:v7];
}

- (INConditionalOperator)sendersOperator
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  id v3 = [v2 sender];

  uint64_t v4 = [v3 condition];
  INConditionalOperator v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (INConditionalOperator)recipientsOperator
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  id v3 = [v2 recipient];

  uint64_t v4 = [v3 condition];
  INConditionalOperator v5 = INIntentSlotValueTransformFromCondition(v4);

  return v5;
}

- (NSArray)recipients
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  id v3 = [v2 recipient];

  uint64_t v4 = [v3 contacts];
  INConditionalOperator v5 = INIntentSlotValueTransformFromContacts(v4);

  return (NSArray *)v5;
}

- (id)_categoryVerb
{
  return @"Search";
}

- (int64_t)_intentCategory
{
  return 9;
}

- (id)_metadata
{
  v2 = [(INSearchForMessagesIntent *)self _typedBackingStore];
  id v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end