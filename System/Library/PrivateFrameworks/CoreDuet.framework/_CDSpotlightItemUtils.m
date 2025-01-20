@interface _CDSpotlightItemUtils
+ (BOOL)contentTypeTree:(id)a3 conformsToUTIType:(id)a4;
+ (BOOL)isLocationBasedItem:(uint64_t)a1;
+ (BOOL)uncachedUtType:(void *)a3 conformsTo:;
+ (_CDContact)_contactForPerson:(uint64_t)a1;
+ (id)_contactsForHandles:(void *)a3 emailAddresses:(void *)a4 names:;
+ (id)_contactsForPersons:(uint64_t)a1;
+ (id)_locationMetadataForSearchableItem:(id)a3 userAction:(id)a4;
+ (id)_metadataForSearchableItem:(void *)a3 userAction:;
+ (id)contextDictionaryForSearchableItem:(id)a3 userAction:(id)a4;
+ (id)expectedSupportedUTIs;
+ (id)expectedUTIsForMechanism:(int64_t)a3;
+ (id)interactionForSearchableItem:(id)a3 nsUserName:(id)a4;
+ (id)interactionUUIDForSearchableItemWithUID:(id)a3 bundleID:(id)a4;
+ (id)knowledgeEventsForSearchableItem:(id)a3 userAction:(id)a4;
+ (id)mechanismUtiMap;
+ (id)messageContextDictionaryForSendMessageIntent:(id)a3;
+ (id)policies;
+ (id)querySpotlightItemsWithStartDate:(id)a3 endDate:(id)a4 getMail:(BOOL)a5 getMessages:(BOOL)a6;
+ (id)utiConformCache;
+ (int64_t)getInteractionMechanismForContentUTI:(id)a3 typeTree:(id)a4;
+ (uint64_t)contentTypeTree:(void *)a3 conformsToUTITypes:;
+ (uint64_t)isAllowedSearchableItem:(uint64_t)a1;
+ (uint64_t)isSearchableItemInSubscribedCalendar:(uint64_t)a1;
+ (uint64_t)shouldFilterEmailAddress:(uint64_t)a1;
+ (uint64_t)utType:(void *)a3 conformsTo:;
@end

@implementation _CDSpotlightItemUtils

+ (uint64_t)utType:(void *)a3 conformsTo:
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  if (v5)
  {
    uint64_t v7 = v6;
    v8 = +[_CDSpotlightItemUtils utiConformCache]();
    v16[0] = v4;
    v16[1] = v5;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    id v10 = v8;
    objc_sync_enter(v10);
    v11 = [v10 objectForKeyedSubscript:v9];
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 BOOLValue];
    }
    else
    {
      uint64_t v13 = +[_CDSpotlightItemUtils uncachedUtType:conformsTo:](v7, v4, v5);
      v14 = [NSNumber numberWithBool:v13];
      [v10 setObject:v14 forKeyedSubscript:v9];
    }
    objc_sync_exit(v10);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (BOOL)uncachedUtType:(void *)a3 conformsTo:
{
  id v4 = a2;
  id v5 = a3;
  self;
  if (v5) {
    BOOL v6 = ([v4 isEqualToString:v5] & 1) != 0
  }
      || cd_UTTypeConformsTo((uint64_t)v4, (uint64_t)v5) != 0;
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)interactionUUIDForSearchableItemWithUID:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x192FB2F20]();
  v8 = NSString;
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  id v10 = [v8 stringWithFormat:@"%@:%@", v9, v5];

  return v10;
}

+ (id)_contactsForPersons:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45___CDSpotlightItemUtils__contactsForPersons___block_invoke;
  v6[3] = &__block_descriptor_40_e30____CDContact_16__0__CSPerson_8l;
  v6[4] = v3;
  id v4 = objc_msgSend(v2, "_pas_mappedArrayWithTransform:", v6);

  return v4;
}

+ (_CDContact)_contactForPerson:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [v2 handles];
  id v4 = [v3 firstObject];
  id v5 = +[_CDSpotlightContactResolver resolveContactIfPossibleFromContactIdentifierString:v4];

  uint64_t v6 = [v5 identifier];
  if (v6
    && (uint64_t v7 = (void *)v6,
        [v5 identifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        v7,
        (isKindOfClass & 1) == 0))
  {
    v11 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      +[_CDSpotlightItemUtils _contactForPerson:]();
    }

    id v10 = 0;
  }
  else
  {
    id v10 = [v5 identifier];
  }
  if (![v10 length])
  {
    uint64_t v12 = [v2 contactIdentifier];
    if (v12
      && (uint64_t v13 = (void *)v12,
          [v2 contactIdentifier],
          v14 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v15 = objc_opt_isKindOfClass(),
          v14,
          v13,
          (v15 & 1) == 0))
    {
      v18 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        +[_CDSpotlightItemUtils _contactForPerson:]();
      }
    }
    else
    {
      v16 = [v2 contactIdentifier];
      uint64_t v17 = [v16 length];

      if (!v17) {
        goto LABEL_15;
      }
      [v2 contactIdentifier];
      id v10 = v18 = v10;
    }
  }
LABEL_15:
  if (v10) {
    uint64_t v19 = 3;
  }
  else {
    uint64_t v19 = 0;
  }
  v20 = [v2 handleIdentifier];
  unint64_t v21 = +[_CDContact typeFromString:v20];

  v22 = [v2 handles];
  v23 = [v22 firstObject];
  v24 = +[_CDContactResolver normalizedStringFromContactString:v23];

  v25 = [_CDContact alloc];
  v26 = [v2 displayName];
  v27 = [(_CDContact *)v25 initWithIdentifier:v24 type:v21 customIdentifier:0 displayName:v26 displayType:0 personId:v10 personIdType:v19];

  return v27;
}

+ (uint64_t)isSearchableItemInSubscribedCalendar:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [v2 attributeSet];
  id v4 = [v3 attributeForKey:@"com_apple_mobilecal_calendarIsSubscribedCalendar"];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v6 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[_CDSpotlightItemUtils isSearchableItemInSubscribedCalendar:v6];
    }

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v4 BOOLValue];
  }

  return v5;
}

+ (uint64_t)isAllowedSearchableItem:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  id v4 = [v2 domainIdentifier];
  if (![v4 isEqualToString:@"attachmentDomain"])
  {
    uint64_t v5 = [v2 domainIdentifier];
    char v6 = [v5 isEqualToString:@"chatDomain"];

    if (v6) {
      goto LABEL_4;
    }
    v8 = +[_CDConstants mobileCalendarBundleId]();
    v9 = [v2 bundleID];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_10;
    }
    v11 = [v2 attributeSet];
    uint64_t v12 = [v11 contentType];
    uint64_t v13 = [v2 attributeSet];
    v14 = [v13 contentTypeTree];
    int64_t v15 = +[_CDSpotlightItemUtils getInteractionMechanismForContentUTI:v12 typeTree:v14];

    if (v15 != 5)
    {
LABEL_10:
      uint64_t v7 = 1;
LABEL_16:

      goto LABEL_17;
    }
    v16 = [v2 attributeSet];
    uint64_t v17 = [v16 calendarDelegateIdentifier];

    if (v17)
    {
      v18 = +[_CDLogging interactionChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        +[_CDSpotlightItemUtils isAllowedSearchableItem:]();
      }
    }
    else
    {
      int v19 = +[_CDSpotlightItemUtils isSearchableItemInSubscribedCalendar:](v3, v2);
      v18 = +[_CDLogging interactionChannel];
      BOOL v20 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
      if (!v19)
      {
        if (v20) {
          +[_CDSpotlightItemUtils isAllowedSearchableItem:]();
        }
        uint64_t v7 = 1;
        goto LABEL_15;
      }
      if (v20) {
        +[_CDSpotlightItemUtils isAllowedSearchableItem:]();
      }
    }
    uint64_t v7 = 0;
LABEL_15:

    goto LABEL_16;
  }

LABEL_4:
  uint64_t v7 = 0;
LABEL_17:

  return v7;
}

+ (id)_contactsForHandles:(void *)a3 emailAddresses:(void *)a4 names:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  self;
  unint64_t v9 = [v6 count];
  unint64_t v10 = [v7 count];
  unint64_t v11 = [v8 count];
  if (v10 <= v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  if (v9 <= v12) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v9;
  }
  if ([v7 count] < v13)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C978], "_pas_proxyArrayWithObject:repetitions:", &stru_1EDDE58B8, v13);

    id v7 = (id)v14;
  }
  if ([v6 count] < v13)
  {
    id v15 = v7;

    id v6 = v15;
  }
  if (objc_msgSend(v8, "count", v6) < v13)
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C978], "_pas_proxyArrayWithObject:repetitions:", &stru_1EDDE58B8, v13);

    id v8 = (id)v16;
  }
  id v32 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v13];
  if (v13)
  {
    uint64_t v17 = 0;
    id v18 = v8;
    unint64_t v19 = v13;
    while (1)
    {
      BOOL v20 = [v7 objectAtIndexedSubscript:v17];
      uint64_t v21 = [v20 length];

      if (v21) {
        break;
      }
      v26 = [v31 objectAtIndexedSubscript:v17];
      uint64_t v23 = [v26 length];

      if (v23)
      {
        v22 = [v31 objectAtIndexedSubscript:v17];
        if ([v22 containsString:@"@"]) {
          goto LABEL_17;
        }
        uint64_t v23 = [v22 rangeOfString:@"^\\+[-0-9]+$" options:1024] != 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v22 = 0;
      }
LABEL_18:
      v24 = [v8 objectAtIndexedSubscript:v17];
      if ([v24 length])
      {
        if (!v22) {
          goto LABEL_25;
        }
      }
      else
      {

        v24 = 0;
        if (!v22)
        {
LABEL_25:
          v25 = 0;
          goto LABEL_26;
        }
      }
      v25 = +[_CDSpotlightContactResolver resolveContactIfPossibleFromContactIdentifierString:v22];
LABEL_26:
      v27 = [v25 identifier];
      if (v27) {
        uint64_t v28 = 3;
      }
      else {
        uint64_t v28 = 0;
      }
      v29 = [[_CDContact alloc] initWithIdentifier:v22 type:v23 displayName:v24 personId:v27 personIdType:v28];
      [v32 addObject:v29];

      ++v17;
      id v8 = v18;
      if (v19 == v17) {
        goto LABEL_32;
      }
    }
    v22 = [v7 objectAtIndexedSubscript:v17];
LABEL_17:
    uint64_t v23 = 2;
    goto LABEL_18;
  }
LABEL_32:

  return v32;
}

+ (id)policies
{
  self;
  if (policies_onceToken != -1) {
    dispatch_once(&policies_onceToken, &__block_literal_global_28);
  }
  v0 = (void *)policies_policies;
  return v0;
}

+ (id)interactionForSearchableItem:(id)a3 nsUserName:(id)a4
{
  v201[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v158 = a4;
  v159 = v6;
  if (+[_CDSpotlightItemUtils isAllowedSearchableItem:]((uint64_t)a1, v6))
  {
    v161 = objc_alloc_init(_CDInteraction);
    id v7 = [v6 attributeSet];
    v155 = [v7 contentType];
    v154 = [v7 contentTypeTree];
    id v8 = +[_CDLogging interactionChannel];
    v160 = v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[_CDSpotlightItemUtils interactionForSearchableItem:nsUserName:].cold.5();
    }

    -[_CDInteraction setMechanism:](v161, "setMechanism:", [a1 getInteractionMechanismForContentUTI:v155 typeTree:v154]);
    if ([(_CDInteraction *)v161 mechanism] == 7)
    {
      unint64_t v9 = 0;
LABEL_143:

      goto LABEL_152;
    }
    if ([(_CDInteraction *)v161 mechanism] == 1)
    {
      unint64_t v10 = getCSMailboxInbox();
      v201[0] = v10;
      unint64_t v11 = getCSMailboxSent();
      v201[1] = v11;
      unint64_t v12 = getCSMailboxArchive();
      v201[2] = v12;
      v153 = [MEMORY[0x1E4F1C978] arrayWithObjects:v201 count:3];

      id v13 = [v7 mailboxIdentifiers];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v200 = v13;
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v200 count:1];

        id v13 = (id)v14;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_19:

          goto LABEL_138;
        }
      }
      long long v191 = 0u;
      long long v192 = 0u;
      long long v189 = 0u;
      long long v190 = 0u;
      id v13 = v13;
      uint64_t v15 = [v13 countByEnumeratingWithState:&v189 objects:v199 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v190;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v190 != v16) {
              objc_enumerationMutation(v13);
            }
            if ([v153 containsObject:*(void *)(*((void *)&v189 + 1) + 8 * i)])
            {

              id v7 = v160;
              goto LABEL_21;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v189 objects:v199 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      goto LABEL_19;
    }
LABEL_21:
    id v18 = [v7 startDate];
    [(_CDInteraction *)v161 setStartDate:v18];

    unint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
    [(_CDInteraction *)v161 setUpdateDate:v19];

    BOOL v20 = [v160 endDate];
    [(_CDInteraction *)v161 setEndDate:v20];

    uint64_t v21 = [(_CDInteraction *)v161 startDate];
    LODWORD(v20) = v21 == 0;

    if (v20)
    {
      v22 = [v160 contentCreationDate];
      [(_CDInteraction *)v161 setStartDate:v22];
    }
    uint64_t v23 = [(_CDInteraction *)v161 endDate];
    if (!v23) {
      goto LABEL_25;
    }
    v24 = [(_CDInteraction *)v161 endDate];
    v25 = [(_CDInteraction *)v161 startDate];
    [v24 timeIntervalSinceDate:v25];
    BOOL v27 = v26 < 0.0;

    if (v27)
    {
LABEL_25:
      uint64_t v28 = [(_CDInteraction *)v161 startDate];
      [(_CDInteraction *)v161 setEndDate:v28];
    }
    v153 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    if (([v153 BOOLForKey:@"com.apple.coreduetd.recordpastevents"] & 1) == 0)
    {
      v29 = +[_CDSpotlightItemUtils policies]();
      v30 = objc_msgSend(v29, "dateOfOldestAllowedInteractionForMechanism:", -[_CDInteraction mechanism](v161, "mechanism"));
      v31 = [(_CDInteraction *)v161 startDate];
      [v31 timeIntervalSinceReferenceDate];
      double v33 = v32;
      [v30 timeIntervalSinceReferenceDate];
      BOOL v35 = v33 >= v34;

      if (!v35) {
        goto LABEL_138;
      }
    }
    v36 = [v160 accountIdentifier];
    [(_CDInteraction *)v161 setAccount:v36];

    v37 = [v159 bundleID];
    [(_CDInteraction *)v161 setBundleId:v37];

    v38 = [v159 domainIdentifier];
    [(_CDInteraction *)v161 setDomainIdentifier:v38];

    v39 = [v159 uniqueIdentifier];
    v40 = [v159 bundleID];
    v41 = [a1 interactionUUIDForSearchableItemWithUID:v39 bundleID:v40];
    [(_CDInteraction *)v161 setUuid:v41];

    v42 = [(_CDInteraction *)v161 bundleId];
    v43 = +[_CDConstants mobileMessagesBundleId]();
    LODWORD(v41) = [v42 isEqualToString:v43];

    if (v41)
    {
      v44 = [(_CDInteraction *)v161 domainIdentifier];
      v45 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
      v46 = [v44 stringByAddingPercentEncodingWithAllowedCharacters:v45];
      [(_CDInteraction *)v161 setDerivedIntentIdentifier:v46];

      v47 = [v160 customAttributeDictionary];
      v48 = [v47 objectForKeyedSubscript:@"com_apple_mobilesms_groupPhotoPath"];

      v49 = v160;
      if (v48)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v50 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v48];
          [(_CDInteraction *)v161 setContentURL:v50];

          v49 = v160;
        }
      }
      v51 = [v49 customAttributeDictionary];
      v52 = [v51 objectForKeyedSubscript:@"com_apple_mobilesms_chatUniqueIdentifier"];

      if (v52)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(_CDInteraction *)v161 setAccount:v52];
        }
      }
    }
    v151 = (void *)MEMORY[0x192FB2F20]([(_CDInteraction *)v161 setNsUserName:v158]);
    v53 = [v160 accountHandles];
    v54 = objc_opt_new();
    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    id v55 = v53;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v185 objects:v198 count:16];
    if (v56)
    {
      uint64_t v57 = *(void *)v186;
      do
      {
        for (uint64_t j = 0; j != v56; ++j)
        {
          if (*(void *)v186 != v57) {
            objc_enumerationMutation(v55);
          }
          v59 = +[_CDContactResolver normalizedStringFromContactString:*(void *)(*((void *)&v185 + 1) + 8 * j)];
          [v54 addObject:v59];
        }
        uint64_t v56 = [v55 countByEnumeratingWithState:&v185 objects:v198 count:16];
      }
      while (v56);
    }

    if ([(_CDInteraction *)v161 mechanism] == 5)
    {
      v60 = [v160 attributeForKey:@"com_apple_mobilecal_recipientParticipationStatuses"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v61 = v60;
        if ([v61 indexOfObjectPassingTest:&__block_literal_global_669] == 0x7FFFFFFFFFFFFFFFLL) {
          id v62 = v61;
        }
        else {
          id v62 = 0;
        }
      }
      else
      {
        id v62 = 0;
      }
    }
    else
    {
      id v62 = 0;
    }
    id v63 = v62;

    v64 = [v160 authors];
    BOOL v65 = [v64 count] == 0;

    if (v65)
    {
      v66 = [v160 authorAddresses];
      v67 = [v160 authorEmailAddresses];
      v68 = [v160 authorNames];
      +[_CDSpotlightItemUtils _contactsForHandles:emailAddresses:names:]((uint64_t)a1, v66, v67, v68);
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v66 = [v160 authors];
      +[_CDSpotlightItemUtils _contactsForPersons:]((uint64_t)a1, v66);
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    }

    v69 = [v160 primaryRecipients];
    v183[0] = MEMORY[0x1E4F143A8];
    v183[1] = 3221225472;
    v183[2] = __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_2;
    v183[3] = &unk_1E560E7D0;
    id v150 = v63;
    id v184 = v150;
    v70 = objc_msgSend(v69, "_pas_mappedArrayWithIndexedTransform:", v183);
    v71 = (void *)[v70 mutableCopy];

    long long v181 = 0u;
    long long v182 = 0u;
    long long v179 = 0u;
    long long v180 = 0u;
    uint64_t v72 = [v160 additionalRecipients];
    v73 = (void *)v72;
    uint64_t v74 = MEMORY[0x1E4F1CBF0];
    if (v72) {
      uint64_t v75 = v72;
    }
    else {
      uint64_t v75 = MEMORY[0x1E4F1CBF0];
    }
    v196[0] = v75;
    uint64_t v76 = [v160 hiddenAdditionalRecipients];
    v77 = (void *)v76;
    if (v76) {
      uint64_t v78 = v76;
    }
    else {
      uint64_t v78 = v74;
    }
    v196[1] = v78;
    v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:2];

    uint64_t v80 = [v79 countByEnumeratingWithState:&v179 objects:v197 count:16];
    if (v80)
    {
      uint64_t v81 = *(void *)v180;
      do
      {
        for (uint64_t k = 0; k != v80; ++k)
        {
          if (*(void *)v180 != v81) {
            objc_enumerationMutation(v79);
          }
          v83 = objc_msgSend(*(id *)(*((void *)&v179 + 1) + 8 * k), "_pas_mappedArrayWithTransform:", &__block_literal_global_674);
          [v71 addObjectsFromArray:v83];
        }
        uint64_t v80 = [v79 countByEnumeratingWithState:&v179 objects:v197 count:16];
      }
      while (v80);
    }

    if ([v71 count])
    {
      v176[0] = MEMORY[0x1E4F143A8];
      v176[1] = 3221225472;
      v176[2] = __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_4;
      v176[3] = &unk_1E560E818;
      id v178 = a1;
      id v177 = obj;
      v84 = objc_msgSend(v71, "_pas_mappedArrayWithTransform:", v176);
      v85 = v177;
    }
    else
    {
      v85 = [v160 recipientAddresses];
      v86 = [v160 recipientEmailAddresses];
      v87 = [v160 recipientNames];
      v84 = +[_CDSpotlightItemUtils _contactsForHandles:emailAddresses:names:]((uint64_t)a1, v85, v86, v87);
    }
    long long v174 = 0u;
    long long v175 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    id obja = obj;
    uint64_t v88 = [obja countByEnumeratingWithState:&v172 objects:v195 count:16];
    if (v88)
    {
      uint64_t v89 = *(void *)v173;
LABEL_73:
      uint64_t v90 = 0;
      while (1)
      {
        if (*(void *)v173 != v89) {
          objc_enumerationMutation(obja);
        }
        v91 = *(void **)(*((void *)&v172 + 1) + 8 * v90);
        v92 = [v91 identifier];
        char v93 = [v54 containsObject:v92];

        if (v93) {
          break;
        }
        if (v88 == ++v90)
        {
          uint64_t v88 = [obja countByEnumeratingWithState:&v172 objects:v195 count:16];
          if (v88) {
            goto LABEL_73;
          }
          goto LABEL_79;
        }
      }
      id v152 = v91;

      v170[0] = MEMORY[0x1E4F143A8];
      v170[1] = 3221225472;
      v170[2] = __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_5;
      v170[3] = &unk_1E560E840;
      id v171 = v54;
      uint64_t v95 = objc_msgSend(v84, "_pas_filteredArrayWithTest:", v170);

      if (v152)
      {
        -[_CDInteraction setSender:](v161, "setSender:");
        unsigned int v94 = 1;
        v96 = (void *)v95;
        goto LABEL_86;
      }
      unsigned int v94 = 1;
      v84 = (void *)v95;
    }
    else
    {
LABEL_79:

      unsigned int v94 = 0;
    }
    if ([obja count])
    {
      v97 = [obja firstObject];
      [(_CDInteraction *)v161 setSender:v97];
    }
    id v152 = 0;
    v96 = v84;
LABEL_86:
    v149 = v96;
    -[_CDInteraction setRecipients:](v161, "setRecipients:");
    v98 = [v160 displayName];
    [(_CDInteraction *)v161 setGroupName:v98];

    v99 = [(_CDInteraction *)v161 bundleId];
    v100 = +[_CDConstants mobileMessagesBundleId]();
    LODWORD(v98) = [v99 isEqual:v100];

    if (v98)
    {
      v101 = [(_CDInteraction *)v161 groupName];
      if (v101)
      {
LABEL_88:

        goto LABEL_89;
      }
      v106 = [(_CDInteraction *)v161 recipients];
      BOOL v107 = (unint64_t)[v106 count] > 1;

      if (v107)
      {
        v108 = [(_CDInteraction *)v161 domainIdentifier];
        v101 = sIMSPIGetDisplayNameAndParticipantsForChatWithGUID(v108);

        if ([v101 count])
        {
          v109 = [v101 firstObject];
          char v110 = objc_opt_respondsToSelector();

          if (v110)
          {
            v111 = [v101 firstObject];
            v112 = [v111 displayName];
            [(_CDInteraction *)v161 setGroupName:v112];
          }
          else
          {
            v111 = +[_CDLogging interactionChannel];
            if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR)) {
              +[_CDSpotlightItemUtils interactionForSearchableItem:nsUserName:].cold.4(v111);
            }
          }

          v142 = [(_CDInteraction *)v161 groupName];
          BOOL v143 = v142 == 0;

          if (!v143)
          {
            v144 = +[_CDLogging interactionChannel];
            if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG))
            {
              [(_CDInteraction *)v161 groupName];
              objc_claimAutoreleasedReturnValue();
              [v159 uniqueIdentifier];
              objc_claimAutoreleasedReturnValue();
              +[_CDSpotlightItemUtils interactionForSearchableItem:nsUserName:]();
            }
          }
        }
        goto LABEL_88;
      }
    }
LABEL_89:
    uint64_t v148 = v94;
    -[_CDInteraction setDirection:](v161, "setDirection:");
    v102 = [v160 isExistingThread];

    if (v102)
    {
      v103 = [v160 isExistingThread];
      -[_CDInteraction setIsResponse:](v161, "setIsResponse:", [v103 BOOLValue]);
    }
    else
    {
      if ([(_CDInteraction *)v161 mechanism] != 1) {
        goto LABEL_101;
      }
      v104 = [v160 emailHeaders];
      v103 = v104;
      if (v104)
      {
        v105 = [v104 objectForKeyedSubscript:@"references"];
        [(_CDInteraction *)v161 setIsResponse:v105 != 0];
      }
      else
      {
        v105 = [v160 displayName];
        -[_CDInteraction setIsResponse:](v161, "setIsResponse:", [v105 hasPrefix:@"Re:"]);
      }
    }
LABEL_101:
    if ([(_CDInteraction *)v161 mechanism] == 5)
    {
      context = (void *)MEMORY[0x192FB2F20]();
      v147 = [v160 title];
      v113 = +[_CDStringTokenizer extractNormalizedKeywords:v147];
      v114 = [v113 allObjects];
      [(_CDInteraction *)v161 setKeywords:v114];

      v115 = [(_CDInteraction *)v161 sender];
      if (v115)
      {
        v116 = [(_CDInteraction *)v161 sender];
        BOOL v117 = [v116 participantStatus] == 0;

        if (v117)
        {
          v118 = [(_CDInteraction *)v161 sender];
          [v118 setParticipantStatus:2];
        }
      }
      if (v94)
      {
        v119 = [(_CDInteraction *)v161 sender];
        -[_CDInteraction setSelfParticipantStatus:](v161, "setSelfParticipantStatus:", [v119 participantStatus]);
      }
      else
      {
        long long v168 = 0u;
        long long v169 = 0u;
        long long v166 = 0u;
        long long v167 = 0u;
        v119 = [(_CDInteraction *)v161 recipients];
        uint64_t v120 = [v119 countByEnumeratingWithState:&v166 objects:v194 count:16];
        if (v120)
        {
          uint64_t v121 = *(void *)v167;
          while (2)
          {
            for (uint64_t m = 0; m != v120; ++m)
            {
              if (*(void *)v167 != v121) {
                objc_enumerationMutation(v119);
              }
              v123 = *(void **)(*((void *)&v166 + 1) + 8 * m);
              if ([v123 participantStatus])
              {
                v124 = [v123 identifier];
                int v125 = [v54 containsObject:v124];

                if (v125)
                {
                  -[_CDInteraction setSelfParticipantStatus:](v161, "setSelfParticipantStatus:", [v123 participantStatus]);
                  goto LABEL_118;
                }
              }
            }
            uint64_t v120 = [v119 countByEnumeratingWithState:&v166 objects:v194 count:16];
            if (v120) {
              continue;
            }
            break;
          }
        }
      }
LABEL_118:

      [(_CDInteraction *)v161 setDirection:v148];
    }
    if ([(_CDInteraction *)v161 mechanism] == 1)
    {
      v126 = [(_CDInteraction *)v161 sender];
      int v127 = __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_681((uint64_t)v126, v126);

      if (v127) {
        [(_CDInteraction *)v161 setSender:0];
      }
      v128 = (void *)MEMORY[0x1E4F1CA48];
      v129 = [(_CDInteraction *)v161 recipients];
      v130 = objc_msgSend(v128, "arrayWithCapacity:", objc_msgSend(v129, "count"));

      long long v164 = 0u;
      long long v165 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      v131 = [(_CDInteraction *)v161 recipients];
      uint64_t v132 = [v131 countByEnumeratingWithState:&v162 objects:v193 count:16];
      uint64_t v133 = v132;
      if (v132)
      {
        uint64_t v134 = *(void *)v163;
        do
        {
          uint64_t v135 = 0;
          do
          {
            if (*(void *)v163 != v134) {
              objc_enumerationMutation(v131);
            }
            v136 = *(void **)(*((void *)&v162 + 1) + 8 * v135);
            uint64_t v132 = __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_681(v132, v136);
            if ((v132 & 1) == 0) {
              uint64_t v132 = [v130 addObject:v136];
            }
            ++v135;
          }
          while (v133 != v135);
          uint64_t v132 = [v131 countByEnumeratingWithState:&v162 objects:v193 count:16];
          uint64_t v133 = v132;
        }
        while (v132);
      }

      [(_CDInteraction *)v161 setRecipients:v130];
    }
    v137 = [(_CDInteraction *)v161 sender];
    if (v137)
    {
      char v138 = 0;
    }
    else
    {
      v139 = [(_CDInteraction *)v161 recipients];
      BOOL v140 = [v139 count] == 0;

      if (!v140)
      {
        char v138 = 0;
LABEL_137:

        if ((v138 & 1) == 0)
        {
          v141 = +[_CDLogging interactionChannel];
          if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG)) {
            +[_CDSpotlightItemUtils interactionForSearchableItem:nsUserName:]();
          }

          unint64_t v9 = v161;
          v161 = v9;
          goto LABEL_142;
        }
LABEL_138:
        unint64_t v9 = 0;
LABEL_142:

        goto LABEL_143;
      }
      char v138 = 1;
      v137 = v161;
      v161 = 0;
    }

    goto LABEL_137;
  }
  unint64_t v9 = 0;
LABEL_152:

  return v9;
}

+ (uint64_t)shouldFilterEmailAddress:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (shouldFilterEmailAddress__onceToken != -1) {
    dispatch_once(&shouldFilterEmailAddress__onceToken, &__block_literal_global_715);
  }
  uint64_t v3 = [v2 componentsSeparatedByString:@"@"];

  if ((unint64_t)[v3 count] < 2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    uint64_t v5 = [(id)shouldFilterEmailAddress___localPartBlackList containsObject:v4];
  }
  return v5;
}

+ (id)_metadataForSearchableItem:(void *)a3 userAction:
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  id v6 = objc_opt_new();
  id v7 = [v5 uaIdentifier];
  id v8 = [v7 UUIDString];
  unint64_t v9 = +[_DKApplicationActivityMetadataKey userActivityUUID];
  [v6 setObject:v8 forKeyedSubscript:v9];

  unint64_t v10 = [v4 attributeSet];
  unint64_t v11 = [v10 contentDescription];

  if (v11)
  {
    unint64_t v12 = [v4 attributeSet];
    id v13 = [v12 contentDescription];
    uint64_t v14 = +[_DKApplicationActivityMetadataKey contentDescription];
    [v6 setObject:v13 forKeyedSubscript:v14];
  }
  uint64_t v15 = [v4 attributeSet];
  uint64_t v16 = [v15 suggestedInvocationPhrase];

  if (v16)
  {
    uint64_t v17 = [v4 attributeSet];
    id v18 = [v17 suggestedInvocationPhrase];
    unint64_t v19 = +[_DKApplicationActivityMetadataKey suggestedInvocationPhrase];
    [v6 setObject:v18 forKeyedSubscript:v19];
  }
  BOOL v20 = [v4 attributeSet];
  uint64_t v21 = [v20 attributeDictionary];
  v22 = [v21 objectForKeyedSubscript:@"kMDItemRelatedUniqueIdentifier"];

  if (v22)
  {
    uint64_t v23 = +[_DKApplicationActivityMetadataKey itemRelatedUniqueIdentifier];
    [v6 setObject:v22 forKey:v23];
  }
  v24 = [v4 attributeSet];
  v25 = [v24 attributeDictionary];
  uint64_t v26 = [v25 objectForKeyedSubscript:@"kMDItemContentURL"];

  if (v26)
  {
    BOOL v27 = +[_DKApplicationActivityMetadataKey itemRelatedContentURL];
    [v6 setObject:v26 forKeyedSubscript:v27];
  }
  v68 = (void *)v26;
  uint64_t v28 = [v4 attributeSet];
  v29 = [v28 shortcutAvailability];

  if (v29)
  {
    v30 = [v4 attributeSet];
    v31 = [v30 shortcutAvailability];
    double v32 = +[_DKApplicationActivityMetadataKey shortcutAvailability];
    [v6 setObject:v31 forKeyedSubscript:v32];
  }
  unint64_t v33 = [v5 eligibility];
  double v34 = [NSNumber numberWithBool:(v33 >> 2) & 1];
  BOOL v35 = +[_DKApplicationActivityMetadataKey isPubliclyIndexable];
  [v6 setObject:v34 forKey:v35];

  unint64_t v36 = [v5 eligibility];
  v37 = [NSNumber numberWithBool:(v36 >> 3) & 1];
  v38 = +[_DKApplicationActivityMetadataKey isEligibleForPrediction];
  [v6 setObject:v37 forKeyedSubscript:v38];

  v39 = [v4 attributeSet];
  v40 = [v39 userActivityType];

  if (v40)
  {
    v41 = [v4 attributeSet];
    v42 = [v41 userActivityType];
    v43 = +[_DKApplicationActivityMetadataKey activityType];
    [v6 setObject:v42 forKey:v43];

    v44 = [v4 attributeSet];
    v45 = [v44 attributeDictionary];
    v46 = [v45 objectForKeyedSubscript:@"_kMDItemUserActivityRequiredString"];

    if (v46)
    {
      v67 = v22;
      v47 = (void *)[v46 copy];
      v48 = +[_DKApplicationActivityMetadataKey userActivityRequiredString];
      [v6 setObject:v47 forKeyedSubscript:v48];

      v66 = v46;
      v49 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) _initWithUserActivityStrings:v46 secondaryString:0 optionalData:0];
      v50 = v49;
      if (v49)
      {
        v51 = [v49 userInfo];

        if (v51)
        {
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          uint64_t v52 = [&unk_1EDE1E518 countByEnumeratingWithState:&v69 objects:v73 count:16];
          if (v52)
          {
            uint64_t v53 = v52;
            uint64_t v54 = *(void *)v70;
            do
            {
              for (uint64_t i = 0; i != v53; ++i)
              {
                if (*(void *)v70 != v54) {
                  objc_enumerationMutation(&unk_1EDE1E518);
                }
                uint64_t v56 = *(void *)(*((void *)&v69 + 1) + 8 * i);
                uint64_t v57 = [v50 userInfo];
                v58 = [v57 objectForKeyedSubscript:v56];

                if (v58) {
                  [v6 setObject:v58 forKeyedSubscript:v56];
                }
              }
              uint64_t v53 = [&unk_1EDE1E518 countByEnumeratingWithState:&v69 objects:v73 count:16];
            }
            while (v53);
          }
        }
      }

      v22 = v67;
      v46 = v66;
    }
  }
  v59 = [v4 expirationDate];

  if (v59)
  {
    v60 = [v4 expirationDate];
    id v61 = +[_DKApplicationActivityMetadataKey expirationDate];
    [v6 setObject:v60 forKey:v61];
  }
  id v62 = [v5 itemIdentifier];

  if (v62)
  {
    id v63 = [v5 itemIdentifier];
    v64 = +[_DKApplicationActivityMetadataKey itemIdentifier];
    [v6 setObject:v63 forKey:v64];
  }
  return v6;
}

+ (id)_locationMetadataForSearchableItem:(id)a3 userAction:(id)a4
{
  id v5 = a3;
  id v6 = +[_CDSpotlightItemUtils _metadataForSearchableItem:userAction:]((uint64_t)_CDSpotlightItemUtils, v5, a4);
  id v7 = (void *)[v6 mutableCopy];

  id v8 = [v5 attributeSet];
  unint64_t v9 = [v8 namedLocation];

  if (v9)
  {
    unint64_t v10 = [v5 attributeSet];
    unint64_t v11 = [v10 namedLocation];
    unint64_t v12 = +[_DKLocationApplicationActivityMetadataKey locationName];
    [v7 setObject:v11 forKeyedSubscript:v12];
  }
  id v13 = [v5 attributeSet];
  uint64_t v14 = [v13 latitude];

  if (v14)
  {
    uint64_t v15 = [v5 attributeSet];
    uint64_t v16 = [v15 latitude];
    uint64_t v17 = +[_DKLocationApplicationActivityMetadataKey latitude];
    [v7 setObject:v16 forKeyedSubscript:v17];
  }
  id v18 = [v5 attributeSet];
  unint64_t v19 = [v18 longitude];

  if (v19)
  {
    BOOL v20 = [v5 attributeSet];
    uint64_t v21 = [v20 longitude];
    v22 = +[_DKLocationApplicationActivityMetadataKey longitude];
    [v7 setObject:v21 forKeyedSubscript:v22];
  }
  uint64_t v23 = [v5 attributeSet];
  v24 = [v23 city];

  if (v24)
  {
    v25 = [v5 attributeSet];
    uint64_t v26 = [v25 city];
    BOOL v27 = +[_DKLocationApplicationActivityMetadataKey city];
    [v7 setObject:v26 forKeyedSubscript:v27];
  }
  uint64_t v28 = [v5 attributeSet];
  v29 = [v28 stateOrProvince];

  if (v29)
  {
    v30 = [v5 attributeSet];
    v31 = [v30 stateOrProvince];
    double v32 = +[_DKLocationApplicationActivityMetadataKey stateOrProvince];
    [v7 setObject:v31 forKeyedSubscript:v32];
  }
  unint64_t v33 = [v5 attributeSet];
  double v34 = [v33 country];

  if (v34)
  {
    BOOL v35 = [v5 attributeSet];
    unint64_t v36 = [v35 country];
    v37 = +[_DKLocationApplicationActivityMetadataKey country];
    [v7 setObject:v36 forKeyedSubscript:v37];
  }
  v38 = [v5 attributeSet];
  v39 = [v38 thoroughfare];

  if (v39)
  {
    v40 = [v5 attributeSet];
    v41 = [v40 thoroughfare];
    v42 = +[_DKLocationApplicationActivityMetadataKey thoroughfare];
    [v7 setObject:v41 forKeyedSubscript:v42];
  }
  v43 = [v5 attributeSet];
  v44 = [v43 fullyFormattedAddress];

  if (v44)
  {
    v45 = [v5 attributeSet];
    v46 = [v45 fullyFormattedAddress];
    v47 = +[_DKLocationApplicationActivityMetadataKey fullyFormattedAddress];
    [v7 setObject:v46 forKeyedSubscript:v47];
  }
  v48 = [v5 attributeSet];
  v49 = [v48 subThoroughfare];

  if (v49)
  {
    v50 = [v5 attributeSet];
    v51 = [v50 subThoroughfare];
    uint64_t v52 = +[_DKLocationApplicationActivityMetadataKey subThoroughfare];
    [v7 setObject:v51 forKeyedSubscript:v52];
  }
  uint64_t v53 = [v5 attributeSet];
  uint64_t v54 = [v53 postalCode];

  if (v54)
  {
    id v55 = [v5 attributeSet];
    uint64_t v56 = [v55 postalCode];
    uint64_t v57 = +[_DKLocationApplicationActivityMetadataKey postalCode];
    [v7 setObject:v56 forKeyedSubscript:v57];
  }
  v58 = [v5 attributeSet];
  v59 = [v58 phoneNumbers];

  if (v59)
  {
    v60 = [v5 attributeSet];
    id v61 = [v60 phoneNumbers];
    id v62 = +[_DKLocationApplicationActivityMetadataKey phoneNumbers];
    [v7 setObject:v61 forKeyedSubscript:v62];
  }
  id v63 = [v5 attributeSet];
  v64 = [v63 displayName];

  if (v64)
  {
    BOOL v65 = [v5 attributeSet];
    v66 = [v65 displayName];
    v67 = +[_DKLocationApplicationActivityMetadataKey displayName];
    [v7 setObject:v66 forKeyedSubscript:v67];
  }
  v68 = [v5 attributeSet];
  long long v69 = [v68 URL];

  if (v69)
  {
    long long v70 = [v5 attributeSet];
    long long v71 = [v70 URL];
    long long v72 = [v71 absoluteString];
    v73 = +[_DKLocationApplicationActivityMetadataKey URL];
    [v7 setObject:v72 forKeyedSubscript:v73];
  }
  uint64_t v74 = (void *)[v7 copy];

  return v74;
}

+ (BOOL)isLocationBasedItem:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = [v2 attributeSet];
  id v4 = [v3 namedLocation];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [v2 attributeSet];
    id v7 = [v6 city];
    if (v7)
    {
      BOOL v5 = 1;
    }
    else
    {
      id v8 = [v2 attributeSet];
      unint64_t v9 = [v8 stateOrProvince];
      if (v9)
      {
        BOOL v5 = 1;
      }
      else
      {
        unint64_t v10 = [v2 attributeSet];
        unint64_t v11 = [v10 country];
        if (v11)
        {
          BOOL v5 = 1;
        }
        else
        {
          unint64_t v12 = [v2 attributeSet];
          id v13 = [v12 latitude];
          v25 = v12;
          if (v13)
          {
            BOOL v5 = 1;
          }
          else
          {
            v24 = [v2 attributeSet];
            uint64_t v14 = [v24 longitude];
            if (v14)
            {
              BOOL v5 = 1;
            }
            else
            {
              uint64_t v23 = [v2 attributeSet];
              uint64_t v15 = [v23 thoroughfare];
              if (v15)
              {
                BOOL v5 = 1;
              }
              else
              {
                v22 = [v2 attributeSet];
                uint64_t v16 = [v22 subThoroughfare];
                if (v16)
                {
                  BOOL v5 = 1;
                }
                else
                {
                  uint64_t v21 = [v2 attributeSet];
                  uint64_t v17 = [v21 fullyFormattedAddress];
                  if (v17)
                  {
                    BOOL v5 = 1;
                  }
                  else
                  {
                    BOOL v20 = [v2 attributeSet];
                    id v18 = [v20 postalCode];
                    BOOL v5 = v18 != 0;

                    uint64_t v17 = 0;
                  }

                  uint64_t v16 = 0;
                }

                uint64_t v15 = 0;
              }

              uint64_t v14 = 0;
            }

            id v13 = 0;
          }
        }
      }
    }
  }

  return v5;
}

+ (id)knowledgeEventsForSearchableItem:(id)a3 userAction:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v5 = a4;
  v40 = objc_opt_new();
  id v6 = [v5 madeCurrentDates];
  v37 = [v6 sortedArrayUsingSelector:sel_compare_];

  v41 = v5;
  id v7 = [v5 sentToIndexerDates];
  id v8 = [v7 sortedArrayUsingSelector:sel_compare_];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v8;
  uint64_t v38 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v38)
  {
    uint64_t v36 = *(void *)v46;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v46 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v45 + 1) + 8 * v9);
        uint64_t v43 = v9;
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __69___CDSpotlightItemUtils_knowledgeEventsForSearchableItem_userAction___block_invoke;
        v44[3] = &unk_1E560E868;
        v44[4] = v10;
        v44[5] = 0x4000000000000000;
        uint64_t v11 = [v37 indexOfObjectPassingTest:v44];
        unint64_t v12 = [v42 bundleID];
        id v13 = +[_DKSource sourceForSearchableItem:v42 bundleID:v12];

        uint64_t v14 = +[_CDSpotlightItemUtils _metadataForSearchableItem:userAction:]((uint64_t)a1, v42, v41);
        uint64_t v15 = (void *)[v14 mutableCopy];

        BOOL v16 = v11 != 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v17 = [NSNumber numberWithInt:v16];
        id v18 = +[_DKApplicationActivityMetadataKey beginningOfActivity];
        [v15 setObject:v17 forKeyedSubscript:v18];

        unint64_t v19 = +[_DKSystemEventStreams appActivityStream];
        BOOL v20 = [v42 bundleID];
        uint64_t v21 = +[_DKBundleIdentifier withBundle:v20];
        v22 = (void *)[v15 copy];
        uint64_t v23 = +[_DKEvent eventWithStream:v19 source:v13 startDate:v10 endDate:v10 value:v21 confidence:v22 metadata:1.0];
        [v40 addObject:v23];

        if (+[_CDSpotlightItemUtils isLocationBasedItem:]((uint64_t)_CDSpotlightItemUtils, v42))
        {
          v24 = [a1 _locationMetadataForSearchableItem:v42 userAction:v41];
          v25 = (void *)[v24 mutableCopy];

          uint64_t v26 = [NSNumber numberWithInt:v16];
          BOOL v27 = +[_DKApplicationActivityMetadataKey beginningOfActivity];
          [v25 setObject:v26 forKeyedSubscript:v27];

          uint64_t v28 = +[_DKSystemEventStreams appLocationActivityStream];
          v29 = [v42 bundleID];
          v30 = +[_DKBundleIdentifier withBundle:v29];
          v31 = (void *)[v25 copy];
          double v32 = +[_DKEvent eventWithStream:v28 source:v13 startDate:v10 endDate:v10 value:v30 confidence:v31 metadata:1.0];
          [v40 addObject:v32];
        }
        ++v9;
      }
      while (v38 != v43 + 1);
      uint64_t v38 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v38);
  }

  unint64_t v33 = (void *)[v40 copy];
  return v33;
}

+ (id)contextDictionaryForSearchableItem:(id)a3 userAction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = [v6 uaIdentifier];
  uint64_t v9 = [v8 UUIDString];
  uint64_t v10 = [get_CDContextQueriesClass() userActivityUUID];
  [v7 setObject:v9 forKeyedSubscript:v10];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "eligibility"));
  unint64_t v12 = [get_CDContextQueriesClass() eligibility];
  [v7 setObject:v11 forKeyedSubscript:v12];

  id v13 = [v5 attributeSet];
  uint64_t v14 = [v13 title];

  if (v14)
  {
    uint64_t v15 = [v5 attributeSet];
    BOOL v16 = [v15 title];
    uint64_t v17 = [get_CDContextQueriesClass() title];
    [v7 setObject:v16 forKeyedSubscript:v17];
  }
  id v18 = [v5 attributeSet];
  unint64_t v19 = [v18 userActivityType];

  if (v19)
  {
    BOOL v20 = [v5 attributeSet];
    uint64_t v21 = [v20 userActivityType];
    v22 = [get_CDContextQueriesClass() userActivityType];
    [v7 setObject:v21 forKeyedSubscript:v22];
  }
  uint64_t v23 = [v6 itemIdentifier];

  if (v23)
  {
    v24 = [v6 itemIdentifier];
    v25 = [get_CDContextQueriesClass() itemIdentifier];
    [v7 setObject:v24 forKeyedSubscript:v25];
  }
  uint64_t v26 = [v5 attributeSet];
  BOOL v27 = [v26 attributeDictionary];
  uint64_t v28 = [v27 objectForKeyedSubscript:@"_kMDItemUserActivityRequiredString"];

  if (v28)
  {
    v29 = [v5 attributeSet];
    v30 = [v29 attributeDictionary];
    v31 = [v30 objectForKeyedSubscript:@"_kMDItemUserActivityRequiredString"];
    double v32 = [get_CDContextQueriesClass() userActivityRequiredString];
    [v7 setObject:v31 forKeyedSubscript:v32];
  }
  return v7;
}

+ (id)messageContextDictionaryForSendMessageIntent:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [get_CDContextQueriesClass() incomingKey];
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v5];

  uint64_t v6 = [v3 conversationIdentifier];
  if (v6)
  {
    id v7 = [get_CDContextQueriesClass() conversationIdentifierKey];
    [v4 setObject:v6 forKeyedSubscript:v7];
  }
  id v8 = [v3 sender];
  uint64_t v9 = [v8 handle];

  if (v9)
  {
    v41[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  BOOL v35 = (void *)v6;
  uint64_t v11 = [get_CDContextQueriesClass() senderHandlesKey];
  [v4 setObject:v10 forKeyedSubscript:v11];

  if (v9) {
  double v34 = (void *)v9;
  }
  unint64_t v12 = [v3 sender];
  uint64_t v13 = [v12 contactIdentifier];

  if (v13)
  {
    uint64_t v14 = [get_CDContextQueriesClass() senderContactIDKey];
    [v4 setObject:v13 forKeyedSubscript:v14];
  }
  unint64_t v33 = (void *)v13;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v17 = [v3 recipients];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v23 = [v22 handle];
        if (v23) {
          [v15 addObject:v23];
        }
        v24 = [v22 contactIdentifier];
        if (v24) {
          [v16 addObject:v24];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v19);
  }

  v25 = [v15 allObjects];
  uint64_t v26 = [get_CDContextQueriesClass() recipientsKey];
  [v4 setObject:v25 forKeyedSubscript:v26];

  BOOL v27 = [v16 allObjects];
  uint64_t v28 = [get_CDContextQueriesClass() recipientContactIDsKey];
  [v4 setObject:v27 forKeyedSubscript:v28];

  v29 = [v3 content];
  if (v29)
  {
    v30 = [get_CDContextQueriesClass() contentKey];
    [v4 setObject:v29 forKeyedSubscript:v30];
  }
  v31 = (void *)[v4 copy];

  return v31;
}

+ (id)querySpotlightItemsWithStartDate:(id)a3 endDate:(id)a4 getMail:(BOOL)a5 getMessages:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v18[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (v7 && v6)
  {
    uint64_t v11 = +[_CDSpotlightQuerier queryStringForMail]();
    v18[0] = v11;
    unint64_t v12 = +[_CDSpotlightQuerier queryStringForMessages]();
    v18[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v14 = +[_CDSpotlightQuerier orQueryStrings:]((uint64_t)_CDSpotlightQuerier, v13);

    if (!v14) {
      goto LABEL_11;
    }
LABEL_10:
    id v16 = +[_CDSpotlightQuerier querySpotlightForPredicateString:startDate:endDate:]((uint64_t)_CDSpotlightQuerier, v14, v9, v10);

    goto LABEL_12;
  }
  if (v7)
  {
    uint64_t v15 = +[_CDSpotlightQuerier queryStringForMail]();
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    uint64_t v15 = +[_CDSpotlightQuerier queryStringForMessages]();
  }
  uint64_t v14 = (void *)v15;
  if (v15) {
    goto LABEL_10;
  }
LABEL_11:
  id v16 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_12:

  return v16;
}

+ (id)expectedSupportedUTIs
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___CDSpotlightItemUtils_UTI__expectedSupportedUTIs__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (expectedSupportedUTIs_token != -1) {
    dispatch_once(&expectedSupportedUTIs_token, block);
  }
  id v2 = (void *)expectedSupportedUTIs_hardCodedUTIs;
  return v2;
}

+ (id)mechanismUtiMap
{
  self;
  if (mechanismUtiMap_onceToken != -1) {
    dispatch_once(&mechanismUtiMap_onceToken, &__block_literal_global_38);
  }
  v0 = (void *)mechanismUtiMap_mechanismUtiMap;
  return v0;
}

+ (id)expectedUTIsForMechanism:(int64_t)a3
{
  id v4 = +[_CDSpotlightItemUtils mechanismUtiMap]();
  id v5 = [NSNumber numberWithInteger:a3];
  BOOL v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  return v8;
}

+ (BOOL)contentTypeTree:(id)a3 conformsToUTIType:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (+[_CDSpotlightItemUtils utType:conformsTo:]((uint64_t)a1, *(void **)(*((void *)&v15 + 1) + 8 * i), v7))
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

+ (uint64_t)contentTypeTree:(void *)a3 conformsToUTITypes:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = self;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(v6, "contentTypeTree:conformsToUTIType:", v4, *(void *)(*((void *)&v14 + 1) + 8 * v11), (void)v14))
        {
          uint64_t v12 = 1;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_11:

  return v12;
}

+ (id)utiConformCache
{
  self;
  if (utiConformCache_onceToken != -1) {
    dispatch_once(&utiConformCache_onceToken, &__block_literal_global_521);
  }
  v0 = (void *)utiConformCache_utiConformCache;
  return v0;
}

+ (int64_t)getInteractionMechanismForContentUTI:(id)a3 typeTree:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v9 = v8;
  if (v6)
  {
    [v8 addObject:v6];
    if (v7) {
      [v9 addObjectsFromArray:v7];
    }
    id v22 = v7;
    uint64_t v10 = +[_CDSpotlightItemUtils mechanismUtiMap]();
    uint64_t v11 = [v10 allKeys];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      while (2)
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          int64_t v17 = [*(id *)(*((void *)&v23 + 1) + 8 * v16) integerValue];
          long long v18 = [a1 expectedUTIsForMechanism:v17];
          char v19 = +[_CDSpotlightItemUtils contentTypeTree:conformsToUTITypes:]((uint64_t)a1, v9, v18);

          if (v19)
          {
            uint64_t v20 = v12;
            goto LABEL_16;
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    uint64_t v20 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[_CDSpotlightItemUtils(UTI) getInteractionMechanismForContentUTI:typeTree:]((uint64_t)v6, v20);
    }
    int64_t v17 = 7;
LABEL_16:
    id v7 = v22;
  }
  else
  {
    uint64_t v12 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[_CDSpotlightItemUtils(UTI) getInteractionMechanismForContentUTI:typeTree:](v12);
    }
    int64_t v17 = 7;
  }

  return v17;
}

+ (void)_contactForPerson:.cold.1()
{
  OUTLINED_FUNCTION_20();
  v1 = [v0 contactIdentifier];
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_11(&dword_18ECEB000, v4, v5, "person.contactIdentifier is %@ instead of NSString. CSPerson: %@", v6, v7, v8, v9, v10);
}

+ (void)_contactForPerson:.cold.2()
{
  OUTLINED_FUNCTION_20();
  id v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_11(&dword_18ECEB000, v2, v3, "contact.identifier is %@ instead of NSString. CNContact: %@", v4, v5, v6, v7, v8);
}

+ (void)isSearchableItemInSubscribedCalendar:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_opt_class();
  id v7 = v6;
  uint8_t v8 = [a2 uniqueIdentifier];
  int v9 = 138543875;
  uint8_t v10 = v6;
  __int16 v11 = 2113;
  uint64_t v12 = v8;
  __int16 v13 = 2113;
  uint64_t v14 = a1;
  _os_log_fault_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_FAULT, "isSearchableItemInSubscribedCalendar: Unexpected attribute value type %{public}@ (uid: %{private}@, value: %{private}@)", (uint8_t *)&v9, 0x20u);
}

+ (void)isAllowedSearchableItem:.cold.1()
{
  OUTLINED_FUNCTION_20();
  uint64_t v2 = [v1 uniqueIdentifier];
  uint64_t v3 = [v0 attributeSet];
  uint64_t v4 = [v3 containerDisplayName];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_45(&dword_18ECEB000, v5, v6, "isAllowedSearchableItem: Ignoring calendar item %@ in subscribed calendar %{private}@: %{sensitive}@", v7, v8, v9, v10, 3u);
}

+ (void)isAllowedSearchableItem:.cold.2()
{
  OUTLINED_FUNCTION_20();
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [v2 uniqueIdentifier];
  OUTLINED_FUNCTION_1();
  __int16 v5 = 2117;
  uint64_t v6 = v1;
  _os_log_debug_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_DEBUG, "isAllowedSearchableItem: Allowing calendar item %@: %{sensitive}@", v4, 0x16u);
}

+ (void)isAllowedSearchableItem:.cold.3()
{
  OUTLINED_FUNCTION_20();
  id v2 = [v1 uniqueIdentifier];
  uint64_t v3 = [v0 attributeSet];
  uint64_t v4 = [v3 calendarDelegateIdentifier];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_45(&dword_18ECEB000, v5, v6, "isAllowedSearchableItem: Ignoring calendar item %@ with calendar delegate identifier %@: %{sensitive}@", v7, v8, v9, v10, 3u);
}

+ (void)interactionForSearchableItem:nsUserName:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_DEBUG, "Recording iteraction: %{sensitive}@", v1, 0xCu);
}

+ (void)interactionForSearchableItem:nsUserName:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_FAULT, "While converting CSSearchableItem into _CDInteraction: %@", v1, 0xCu);
}

+ (void)interactionForSearchableItem:nsUserName:.cold.3()
{
  OUTLINED_FUNCTION_20();
  *(_DWORD *)uint64_t v2 = 138412546;
  *(void *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2112;
  *(void *)(v2 + 14) = v4;
  _os_log_debug_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_DEBUG, "Group name %@ not found on CSSi Id %@", v5, 0x16u);
}

+ (void)interactionForSearchableItem:(os_log_t)log nsUserName:.cold.4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "IMCoreSPI result does not respond to selector displayName", v1, 2u);
}

+ (void)interactionForSearchableItem:nsUserName:.cold.5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_DEBUG, "Converting searchable item: %@", v1, 0xCu);
}

@end