@interface SGReminderDissector
+ (BOOL)isReminderDueDateComponentsInPast:(id)a3 givenReferenceDate:(id)a4 allDay:(BOOL)a5;
+ (id)enrichedTaggedCharacterRangesFromEntity:(id)a3 forMessage:(id)a4;
+ (id)enrichedTaggedCharacterRangesFromTaggedCharacterRanges:(id)a3 messageIsSent:(BOOL)a4;
+ (id)getContactIdentifierForName:(id)a3 andEmail:(id)a4 ifMatchingPredicate:(id)a5;
+ (id)sharedInstance;
- (BOOL)_isTestMessage:(id)a3;
- (BOOL)isAllDay:(id)a3;
- (BOOL)isValidTextMessageForProcessing:(id)a3;
- (BOOL)mailAddressIsAccountOwner:(id)a3;
- (SGReminderDissector)init;
- (SGReminderDissector)initWithConversations:(id)a3 rtRoutineManager:(id)a4;
- (id)_detectedReminderEnrichmentFromReminderMessage:(id)a3 parentEntity:(id)a4 language:(id)a5 parentMessage:(id)a6 startTimeProcessing:(unint64_t)a7;
- (id)_reminderEnrichmentWithTitle:(id)a3 dueDateComponents:(id)a4 dueLocationType:(unsigned __int8)a5 dueLocation:(id)a6 dueLocationTrigger:(unsigned __int8)a7 sourceURL:(id)a8 reminderStatus:(unsigned __int8)a9 parentEntity:(id)a10 parentMessage:(id)a11 allDay:(BOOL)a12;
- (id)_reminderMessageForTextMessage:(id)a3 withEntity:(id)a4 extractionModel:(id)a5 processingLanguage:(id)a6 preprocessing:(BOOL)a7;
- (id)_testReminder:(id)a3 entity:(id)a4;
- (id)_validateDueDateComponents:(id)a3 dueLocation:(id)a4 forReminderMessages:(id)a5;
- (id)conversations;
- (id)defaultDueDateComponentsFromMessages:(id)a3;
- (id)dueDateComponentsFromMessages:(id)a3;
- (id)dueLocationFromMessages:(id)a3;
- (id)extractReminderFromMailMessage:(id)a3 entity:(id)a4;
- (id)extractReminderFromOwnedMailMessage:(id)a3 entity:(id)a4;
- (id)extractReminderFromTextMessage:(id)a3 entity:(id)a4 store:(id)a5;
- (id)fetchLocationOfInterestByType:(int64_t)a3 name:(id)a4;
- (id)processingLanguageForContent:(id)a3;
- (id)reminderTitleForContent:(id)a3;
- (id)reminderTitleFromMessages:(id)a3 forLanguage:(id)a4;
- (id)storageLocationFromDueLocation:(id)a3;
- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5;
- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5;
@end

@implementation SGReminderDissector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtRoutineManager, 0);
  objc_storeStrong((id *)&self->_conversations, 0);
}

- (id)fetchLocationOfInterestByType:(int64_t)a3 name:(id)a4
{
  id v6 = a4;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  rtRoutineManager = self->_rtRoutineManager;
  if (rtRoutineManager)
  {
    *(void *)buf = 0;
    v38 = buf;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__1828;
    v41 = __Block_byref_object_dispose__1829;
    id v42 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __58__SGReminderDissector_fetchLocationOfInterestByType_name___block_invoke;
    v32[3] = &unk_1E65B5890;
    int64_t v36 = a3;
    id v33 = v6;
    v35 = buf;
    v9 = v7;
    v34 = v9;
    [(RTRoutineManager *)rtRoutineManager fetchLocationsOfInterestOfType:a3 withHandler:v32];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if (*((void *)v38 + 5))
    {
      v10 = [SGStorageLocation alloc];
      v30 = [*((id *)v38 + 5) preferredName];
      v31 = [*((id *)v38 + 5) mapItem];
      v11 = [v31 location];
      [v11 latitude];
      double v13 = v12;
      v14 = [*((id *)v38 + 5) mapItem];
      v15 = [v14 location];
      [v15 longitude];
      double v17 = v16;
      v18 = [*((id *)v38 + 5) mapItem];
      v19 = [v18 location];
      [v19 horizontalUncertainty];
      double v21 = v20;
      [*((id *)v38 + 5) confidence];
      double v23 = v22;
      v24 = [*((id *)v38 + 5) mapItem];
      v25 = [v24 geoMapItemHandle];
      v26 = [(SGStorageLocation *)v10 initWithType:1 label:v30 address:0 airportCode:0 latitude:v25 longitude:v13 accuracy:v17 quality:v21 handle:v23];
    }
    else
    {
      v26 = 0;
    }
    v27 = v26;

    _Block_object_dispose(buf, 8);
    v28 = v27;
  }
  else
  {
    v27 = sgRemindersLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v27, OS_LOG_TYPE_ERROR, "Unable to load RTRoutineManager", buf, 2u);
    }
    v28 = 0;
  }

  return v28;
}

void __58__SGReminderDissector_fetchLocationOfInterestByType_name___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    dispatch_semaphore_t v7 = sgRemindersLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v6;
      _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "Unable to get LocationsOfInterest: %@", buf, 0xCu);
    }
  }
  if (*(void *)(a1 + 56) != -1)
  {
    if ([v5 count] == 1)
    {
      uint64_t v8 = [v5 firstObject];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id v10 = *(id *)(v9 + 40);
      *(void *)(v9 + 40) = v8;
LABEL_31:

      goto LABEL_32;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = v5;
    uint64_t v19 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (!v19) {
      goto LABEL_31;
    }
    uint64_t v20 = v19;
    id v28 = v6;
    unint64_t v21 = 0;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v10);
        }
        v24 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v25 = [v24 visits];
        unint64_t v26 = [v25 count];

        if (v26 > v21)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v24);
          v27 = [v24 visits];
          unint64_t v21 = [v27 count];
        }
      }
      uint64_t v20 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v20);
LABEL_30:
    id v6 = v28;
    goto LABEL_31;
  }
  if ([*(id *)(a1 + 32) length])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (!v11) {
      goto LABEL_31;
    }
    uint64_t v12 = v11;
    id v28 = v6;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        double v16 = [v15 preferredName];
        if ([v16 length])
        {
          double v17 = [v15 preferredName];
          uint64_t v18 = [v17 caseInsensitiveCompare:*(void *)(a1 + 32)];

          if (!v18)
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v15);
            goto LABEL_30;
          }
        }
        else
        {
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v12);
    goto LABEL_30;
  }
LABEL_32:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)storageLocationFromDueLocation:(id)a3
{
  id v4 = a3;
  int v5 = [v4 locationType];
  id v6 = 0;
  uint64_t v7 = 0;
  switch(v5)
  {
    case 0:
      goto LABEL_9;
    case 1:
      goto LABEL_7;
    case 2:
      id v6 = 0;
      uint64_t v7 = 1;
      goto LABEL_7;
    case 3:
      id v6 = 0;
      uint64_t v7 = 2;
      goto LABEL_7;
    case 4:
      uint64_t v8 = objc_msgSend(v4, "name", 0);
      id v6 = v8;
      if (!v8) {
        goto LABEL_8;
      }
      uint64_t v7 = -1;
LABEL_7:
      uint64_t v8 = [(SGReminderDissector *)self fetchLocationOfInterestByType:v7 name:v6];
LABEL_8:
      id v9 = v8;

      id v6 = v9;
LABEL_9:

      return v6;
    default:
      uint64_t v8 = 0;
      goto LABEL_8;
  }
}

- (id)_reminderEnrichmentWithTitle:(id)a3 dueDateComponents:(id)a4 dueLocationType:(unsigned __int8)a5 dueLocation:(id)a6 dueLocationTrigger:(unsigned __int8)a7 sourceURL:(id)a8 reminderStatus:(unsigned __int8)a9 parentEntity:(id)a10 parentMessage:(id)a11 allDay:(BOOL)a12
{
  unsigned int v72 = a7;
  unsigned int v73 = a5;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  unint64_t v16 = (unint64_t)a4;
  unint64_t v17 = (unint64_t)a6;
  id v18 = a8;
  id v19 = a10;
  id v20 = a11;
  v74 = v20;
  if (v16 | v17)
  {
    unint64_t v21 = v20;
    id v71 = v18;
    if (v16)
    {
      uint64_t v22 = [v20 date];
      if (v22)
      {
        double v23 = (void *)v22;
        v24 = objc_opt_class();
        v25 = [v21 date];
        if ([v24 isReminderDueDateComponentsInPast:v16 givenReferenceDate:v25 allDay:a12])
        {
          char v26 = [MEMORY[0x1E4F5DAF0] showPastEvents];

          id v18 = v71;
          if ((v26 & 1) == 0)
          {
            v27 = sgRemindersLogHandle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA650000, v27, OS_LOG_TYPE_DEFAULT, "SGReminderDissector: DueDate in past, bailing", buf, 2u);
            }
          }
        }
        else
        {

          id v18 = v71;
        }
      }
    }
    long long v30 = sgRemindersLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138740483;
      id v79 = v15;
      __int16 v80 = 2117;
      unint64_t v81 = v16;
      __int16 v82 = 2117;
      unint64_t v83 = v17;
      _os_log_debug_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEBUG, "Creating enrichment for Reminder: %{sensitive}@, dueTime: %{sensitive}@, dueLocation: %{sensitive}@", buf, 0x20u);
    }

    long long v31 = sgRemindersLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v31, OS_LOG_TYPE_INFO, "Creating Reminder enrichment", buf, 2u);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v32 = v21;
      if ([v32 isSent])
      {
        long long v33 = [v32 recipients];
        long long v34 = [v33 firstObject];
        long long v35 = [v34 contactIdentifier];

        id v18 = v71;
      }
      else
      {
        long long v33 = [v32 sender];
        long long v35 = [v33 contactIdentifier];
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v39 = sgRemindersLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA650000, v39, OS_LOG_TYPE_ERROR, "SGReminderDissector - Unknown object encountered while resolving contactId", buf, 2u);
        }

LABEL_29:
        long long v36 = sgRemindersLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA650000, v36, OS_LOG_TYPE_DEFAULT, "SGReminderDissector - Could not resolve Contact. Nil contactIdentifier", buf, 2u);
        }
        id v28 = 0;
        long long v35 = &stru_1F24EEF20;
        goto LABEL_32;
      }
      long long v36 = v21;
      v37 = [v36 from];
      v38 = [v37 asCSPerson];
      long long v35 = [v38 contactIdentifier];

      if (v35)
      {
        id v28 = v35;
        id v18 = v71;
LABEL_32:

LABEL_33:
        unint64_t v70 = v17;
        v45 = (void *)[[NSString alloc] initWithFormat:@"%@", v15];
        if (!v45)
        {
          v57 = sgRemindersLogHandle();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v79 = v19;
            _os_log_error_impl(&dword_1CA650000, v57, OS_LOG_TYPE_ERROR, "No groupId found for entity %@", buf, 0xCu);
          }
          long long v29 = 0;
          goto LABEL_48;
        }
        [v19 creationTimestamp];
        double v47 = v46;
        v48 = [v19 duplicateKey];
        uint64_t v49 = +[SGDuplicateKey duplicateKeyForPseudoReminderWithGroupId:v45 withCreationTime:v48 parentKey:v47];

        v67 = v49;
        v68 = v19;
        long long v29 = [[SGPipelineEnrichment alloc] initWithDuplicateKey:v49 title:v15 parent:v19];
        id v69 = v15;
        if (v16)
        {
          v50 = (void *)MEMORY[0x1E4F5DB40];
          v51 = [(id)v16 date];
          v52 = [(id)v16 timeZone];
          v53 = [(id)v16 date];
          v54 = [(id)v16 timeZone];
          v55 = [v50 rangeWithStartDate:v51 startTimeZone:v52 endDate:v53 endTimeZone:v54];
          [(SGEntity *)v29 setTimeRange:v55];

          uint64_t v56 = v72;
        }
        else
        {
          uint64_t v56 = v72;
          if (!v70 || !v72) {
            goto LABEL_43;
          }
          id v58 = objc_alloc(MEMORY[0x1E4F1CA80]);
          unint64_t v77 = v70;
          v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
          v52 = (void *)[v58 initWithArray:v51];
          [(SGEntity *)v29 setLocations:v52];
        }

LABEL_43:
        v59 = (void *)MEMORY[0x1E4F5D9F0];
        v75[0] = *MEMORY[0x1E4F5DEB0];
        v60 = [NSNumber numberWithUnsignedChar:a9];
        v76[0] = v60;
        v75[1] = *MEMORY[0x1E4F5DEA0];
        v61 = [NSNumber numberWithUnsignedChar:v56];
        v76[1] = v61;
        v75[2] = *MEMORY[0x1E4F5DEA8];
        v62 = [NSNumber numberWithUnsignedChar:v73];
        v75[3] = *MEMORY[0x1E4F5DE98];
        v76[2] = v62;
        v76[3] = v35;
        v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:4];
        v64 = [v59 reminderMetadata:v63];

        id v19 = v68;
        [v68 creationTimestamp];
        -[SGPipelineEnrichment setCreationTimestamp:](v29, "setCreationTimestamp:");
        if (v64) {
          [(SGEntity *)v29 addTag:v64];
        }
        id v18 = v71;
        if (a12)
        {
          v65 = [MEMORY[0x1E4F5D9F0] allDay];
          [(SGEntity *)v29 addTag:v65];
        }
        id v15 = v69;
        v57 = v67;
LABEL_48:

        unint64_t v17 = v70;
        goto LABEL_49;
      }
      id v40 = objc_opt_class();
      uint64_t v41 = [v36 from];
      id v42 = [v41 name];
      v43 = [v36 from];
      v44 = [v43 emailAddress];
      long long v33 = [v40 getContactIdentifierForName:v42 andEmail:v44 ifMatchingPredicate:&__block_literal_global_114];

      long long v35 = [v33 identifier];
      id v18 = v71;
      unint64_t v21 = v74;
    }

    id v28 = v35;
    if (v35) {
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  id v28 = sgRemindersLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v28, OS_LOG_TYPE_DEBUG, "No dueLocation or dueDate, bailing", buf, 2u);
  }
  long long v29 = 0;
LABEL_49:

  return v29;
}

uint64_t __176__SGReminderDissector__reminderEnrichmentWithTitle_dueDateComponents_dueLocationType_dueLocation_dueLocationTrigger_sourceURL_reminderStatus_parentEntity_parentMessage_allDay___block_invoke()
{
  return 1;
}

- (id)_testReminder:(id)a3 entity:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9A8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 currentCalendar];
  id v10 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  uint64_t v11 = objc_opt_new();
  uint64_t v12 = [v11 dateByAddingTimeInterval:172800.0];
  uint64_t v13 = [v9 componentsInTimeZone:v10 fromDate:v12];

  v14 = [(SGReminderDissector *)self fetchLocationOfInterestByType:0 name:0];
  id v15 = (void *)MEMORY[0x1E4F5D9D8];
  unint64_t v16 = [v8 uniqueIdentifier];
  unint64_t v17 = [v15 urlForEKEventFromTextMessageWithUniqueIdentifier:v16];
  LOBYTE(v21) = 0;
  LOBYTE(v20) = 2;
  id v18 = [(SGReminderDissector *)self _reminderEnrichmentWithTitle:@"TEST REMINDER" dueDateComponents:v13 dueLocationType:1 dueLocation:v14 dueLocationTrigger:1 sourceURL:v17 reminderStatus:v20 parentEntity:v7 parentMessage:v8 allDay:v21];

  return v18;
}

- (BOOL)_isTestMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 textContent];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [v3 textContent];
    char v7 = [v6 isEqualToString:@"SG_QA_REMINDER_TEST"];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)conversations
{
  return self->_conversations;
}

- (id)_reminderMessageForTextMessage:(id)a3 withEntity:(id)a4 extractionModel:(id)a5 processingLanguage:(id)a6 preprocessing:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  unint64_t v16 = v15;
  if (!v14)
  {
    uint64_t v21 = sgRemindersLogHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
LABEL_12:

      double v23 = 0;
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    uint64_t v22 = "SGReminderDissector: ExtractionModel is nil";
LABEL_21:
    _os_log_debug_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEBUG, v22, buf, 2u);
    goto LABEL_12;
  }
  if (!v15)
  {
    uint64_t v21 = sgRemindersLogHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    uint64_t v22 = "SGReminderDissector: Processinglanguage is nil";
    goto LABEL_21;
  }
  *(void *)buf = 0;
  long long v35 = buf;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__1828;
  v38 = __Block_byref_object_dispose__1829;
  id v39 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __114__SGReminderDissector__reminderMessageForTextMessage_withEntity_extractionModel_processingLanguage_preprocessing___block_invoke;
  v28[3] = &unk_1E65B8580;
  id v17 = v13;
  id v29 = v17;
  id v18 = v12;
  id v30 = v18;
  id v32 = self;
  long long v33 = buf;
  id v31 = v16;
  [v17 runWithDissectorLock:v28];
  if ([*((id *)v35 + 5) count])
  {
    id v19 = [v14 modelInferences:*((void *)v35 + 5)];
    if (v19 || a7)
    {
      v25 = [SGReminderMessage alloc];
      double v23 = [(SGReminderMessage *)v25 initWithMessage:v18 entity:v17 enrichedTaggedCharacterRanges:*((void *)v35 + 5) modelOutput:v19];
      goto LABEL_16;
    }
    uint64_t v20 = sgRemindersLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_error_impl(&dword_1CA650000, v20, OS_LOG_TYPE_ERROR, "SGReminderDissector: No model output, bailing", v27, 2u);
    }

    id v19 = 0;
  }
  else
  {
    conversations = self->_conversations;
    id v19 = [v18 conversationIdentifier];
    [(NSMutableDictionary *)conversations removeObjectForKey:v19];
  }
  double v23 = 0;
LABEL_16:

  _Block_object_dispose(buf, 8);
LABEL_17:

  return v23;
}

uint64_t __114__SGReminderDissector__reminderMessageForTextMessage_withEntity_extractionModel_processingLanguage_preprocessing___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[SGPOSTagger sharedInstance];
  id v4 = [*(id *)(a1 + 40) textContent];
  uint64_t v5 = [v3 tokenizeTextContent:v4 languageHint:*(void *)(a1 + 48)];
  [v2 addTaggedCharacterRanges:v5];

  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [(id)objc_opt_class() enrichedTaggedCharacterRangesFromEntity:*(void *)(a1 + 32) forMessage:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (id)_validateDueDateComponents:(id)a3 dueLocation:(id)a4 forReminderMessages:(id)a5
{
  uint64_t v8 = (uint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  if (!(v8 | v9))
  {
    uint64_t v8 = [(SGReminderDissector *)self defaultDueDateComponentsFromMessages:v10];
    uint64_t v11 = +[SGReminderTrialClientWrapper sharedInstance];
    id v12 = v11;
    if (!v8)
    {
      if ([v11 triggerOptional])
      {
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v8 = +[SGExtractionDocument allDayDateComponentsFromDate:v13];
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
  }
  if (v8)
  {
    id v14 = objc_opt_class();
    id v15 = [MEMORY[0x1E4F1C9C8] date];
    if (objc_msgSend(v14, "isReminderDueDateComponentsInPast:givenReferenceDate:allDay:", v8, v15, -[SGReminderDissector isAllDay:](self, "isAllDay:", v8)))
    {
      char v16 = [MEMORY[0x1E4F5DAF0] showPastEvents];

      if ((v16 & 1) == 0)
      {
        id v17 = sgRemindersLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v19 = 0;
          _os_log_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEFAULT, "SGReminderDissector: Date is in the past, skipping", v19, 2u);
        }

        uint64_t v8 = 0;
      }
    }
    else
    {
    }
  }

  return (id)v8;
}

- (BOOL)isAllDay:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  BOOL v5 = v3
    && [v3 hour] == 0x7FFFFFFFFFFFFFFFLL
    && [v4 minute] == 0x7FFFFFFFFFFFFFFFLL
    && [v4 second] == 0x7FFFFFFFFFFFFFFFLL
    && [v4 nanosecond] == 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (id)defaultDueDateComponentsFromMessages:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  id v4 = (void *)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    int v5 = 0;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasTrigger", (void)v11))
        {
          id v4 = 0;
          goto LABEL_12;
        }
        v5 |= [v8 isTriggerOptional];
      }
      id v4 = (void *)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }

    if (v5)
    {
      unint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
      id v4 = +[SGExtractionDocument allDayDateComponentsFromDate:v9];
      goto LABEL_13;
    }
    id v4 = 0;
  }
  else
  {
LABEL_12:
    unint64_t v9 = v3;
LABEL_13:
  }
  return v4;
}

- (id)dueLocationFromMessages:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dueLocation", (void)v14);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if ([v4 count] == 1)
  {
    uint64_t v11 = [v4 anyObject];
LABEL_14:
    long long v12 = (void *)v11;
    goto LABEL_16;
  }
  if ((unint64_t)[v4 count] >= 2)
  {
    uint64_t v11 = +[SGReminderDueLocation mergeDueLocations:v4];
    goto LABEL_14;
  }
  long long v12 = 0;
LABEL_16:

  return v12;
}

- (id)dueDateComponentsFromMessages:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    char v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dueDateDataDetectorMatches];
        long long v13 = [v12 first];

        if (v13)
        {
          long long v14 = [v12 first];
          [v5 addObjectsFromArray:v14];

          long long v15 = [v12 second];
          char v16 = [v15 BOOLValue];

          v10 &= v16 ^ 1;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }
  else
  {
    char v10 = 1;
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v5;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    uint64_t v21 = v10 & 1;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        double v23 = +[SGExtractionDocument dateComponentsFromDataDetectorMatch:inferDates:approximateTime:partialDate:useEndForDurations:](SGExtractionDocument, "dateComponentsFromDataDetectorMatch:inferDates:approximateTime:partialDate:useEndForDurations:", *(void *)(*((void *)&v27 + 1) + 8 * j), v21, 1, 1, 0, (void)v27);
        if (v23) {
          [v4 addObject:v23];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }

  if ([v4 count] == 1)
  {
    v24 = [v4 anyObject];
  }
  else if ((unint64_t)[v4 count] < 2)
  {
    v24 = 0;
  }
  else
  {
    v25 = [v4 allObjects];
    v24 = +[SGExtractionDocument mergeDetectedDateComponents:v25];
  }
  return v24;
}

- (id)reminderTitleFromMessages:(id)a3 forLanguage:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "detectedTitleForLanguage:", v6, (void)v16);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  if ([v7 count] == 1)
  {
    long long v14 = [v7 firstObject];
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

- (BOOL)mailAddressIsAccountOwner:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[SGContactStoreFactory contactStore];
  id v5 = +[SGCuratedContactMatcher fetchMeContactFromContactStore:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(v5, "emailAddresses", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v3 emailAddress];
        long long v12 = SGNormalizeEmailAddress();
        LOBYTE(v10) = [v10 isEqualToString:v12];

        if (v10)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)processingLanguageForContent:(id)a3
{
  id v3 = [MEMORY[0x1E4F5DFA0] detectLanguageFromText:a3];
  id v4 = [MEMORY[0x1E4F5DFA0] defaultLanguage];
  int v5 = [v3 isEqual:v4];
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6 || v5 == 0) {
    id v8 = 0;
  }
  else {
    id v8 = v3;
  }

  return v8;
}

- (BOOL)isValidTextMessageForProcessing:(id)a3
{
  id v3 = a3;
  id v4 = [v3 textContent];
  if (![v4 length]) {
    goto LABEL_4;
  }
  int v5 = [v3 textContent];
  if ((unint64_t)[v5 length] >= 0x3E9)
  {

LABEL_4:
LABEL_5:
    BOOL v6 = sgRemindersLogHandle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    long long v12 = "SGReminderDissector: Message too short or too long to process or missing conversationIdentifier, bailing";
    long long v13 = buf;
LABEL_14:
    _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, v12, v13, 2u);
    goto LABEL_6;
  }
  uint64_t v9 = [v3 conversationIdentifier];

  if (!v9) {
    goto LABEL_5;
  }
  uint64_t v10 = [v3 recipients];
  unint64_t v11 = [v10 count];

  if (v11 < 3)
  {
    BOOL v7 = 1;
    goto LABEL_7;
  }
  BOOL v6 = sgRemindersLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __int16 v14 = 0;
    long long v12 = "SGReminderDissector: Message is a group chat, bailing";
    long long v13 = (uint8_t *)&v14;
    goto LABEL_14;
  }
LABEL_6:

  BOOL v7 = 0;
LABEL_7:

  return v7;
}

- (id)extractReminderFromTextMessage:(id)a3 entity:(id)a4 store:(id)a5
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v117 = a5;
  uint64_t v10 = sgRemindersLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_INFO, "Dissecting Text Message to find reminder", (uint8_t *)&buf, 2u);
  }

  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x2020000000;
  char v131 = 0;
  conversations = self->_conversations;
  long long v12 = [v8 conversationIdentifier];
  long long v13 = [(NSMutableDictionary *)conversations objectForKeyedSubscript:v12];

  if ([(SGReminderDissector *)self _isTestMessage:v8])
  {
    __int16 v14 = [(SGReminderDissector *)self _testReminder:v8 entity:v9];
    goto LABEL_69;
  }
  long long v15 = [v9 duplicateKey];
  v116 = [v15 entityKey];

  long long v16 = [v116 source];
  int v17 = [v16 isEqualToString:@"suggest_tool_preprocess"];

  if (v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F5DFA0] defaultLanguage];
    goto LABEL_7;
  }
  if (![(SGReminderDissector *)self isValidTextMessageForProcessing:v8])
  {
    long long v34 = [v8 conversationIdentifier];

    if (!v34) {
      goto LABEL_39;
    }
    goto LABEL_65;
  }
  if (![v8 isSent])
  {
    uint64_t v41 = +[SGReminderExtractionModel sharedInstance];
    id v42 = [v8 textContent];
    int v43 = [v41 hasWhitelistedVerbInContent:v42];

    if (v43)
    {
      v44 = [[SGReminderMessage alloc] initWithMessage:v8 entity:v9 enrichedTaggedCharacterRanges:0 modelOutput:0];
      v45 = self->_conversations;
      double v46 = [v8 conversationIdentifier];
      [(NSMutableDictionary *)v45 setObject:v44 forKeyedSubscript:v46];

      double v47 = [v8 textContent];
      LODWORD(v44) = +[SGReminderMessage isConfirmationOptionalForContent:v47];

      if (!v44) {
        goto LABEL_39;
      }
      id v37 = [v8 sender];
      if (objc_msgSend(v37, "sg_isSignificantWithStore:", v117))
      {
        uint64_t v48 = mach_absolute_time();
        uint64_t v49 = [v8 textContent];
        v113 = [(SGReminderDissector *)self processingLanguageForContent:v49];

        v50 = +[SGReminderExtractionModel sharedInstance];
        v51 = [(SGReminderDissector *)self _reminderMessageForTextMessage:v8 withEntity:v9 extractionModel:v50 processingLanguage:v113 preprocessing:0];

        if (v51)
        {
          v52 = self->_conversations;
          v53 = [v8 conversationIdentifier];
          [(NSMutableDictionary *)v52 setObject:v51 forKeyedSubscript:v53];

          __int16 v14 = [(SGReminderDissector *)self _detectedReminderEnrichmentFromReminderMessage:v51 parentEntity:v9 language:v113 parentMessage:v8 startTimeProcessing:v48];
          if (v14)
          {
            v54 = self->_conversations;
            v55 = [v8 conversationIdentifier];
            uint64_t v56 = [(NSMutableDictionary *)v54 objectForKeyedSubscript:v55];
            v57 = [v14 duplicateKey];
            [v56 setExtractedReminderDuplicateKey:v57];

            id v58 = v14;
          }

          id v37 = v14;
        }
        else
        {
          __int16 v14 = 0;
        }
        goto LABEL_64;
      }
LABEL_66:
      __int16 v14 = 0;
      goto LABEL_67;
    }
LABEL_65:
    unsigned int v73 = self->_conversations;
    id v37 = [v8 conversationIdentifier];
    [(NSMutableDictionary *)v73 removeObjectForKey:v37];
    goto LABEL_66;
  }
  if (v13)
  {
    id v28 = [NSString alloc];
    long long v29 = [v13 message];
    long long v30 = [v29 textContent];
    long long v31 = [v8 textContent];
    long long v32 = (void *)[v28 initWithFormat:@"%@ %@", v30, v31];

    uint64_t v33 = [(SGReminderDissector *)self processingLanguageForContent:v32];

    uint64_t v18 = v33;
    if (v33)
    {
LABEL_7:
      uint64_t v19 = sgRemindersLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v18;
        _os_log_debug_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEBUG, "SGReminderDissector: ProcessingLanguage: %@", (uint8_t *)&buf, 0xCu);
      }
      v113 = (void *)v18;

      v127[2] = 0;
      v127[0] = @"ReminderDissector full extraction";
      uint64_t v109 = mach_absolute_time();
      v127[1] = v109;
      v112 = +[SGReminderExtractionModel sharedInstance];
      v115 = -[SGReminderDissector _reminderMessageForTextMessage:withEntity:extractionModel:processingLanguage:preprocessing:](self, "_reminderMessageForTextMessage:withEntity:extractionModel:processingLanguage:preprocessing:", v8, v9);
      if (!v115)
      {
        long long v35 = self->_conversations;
        uint64_t v36 = [v8 conversationIdentifier];
        [(NSMutableDictionary *)v35 removeObjectForKey:v36];

        id v37 = 0;
LABEL_63:

        SGRecordMeasurementState(v127);
        __int16 v14 = v37;
LABEL_64:

LABEL_67:
        goto LABEL_68;
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v136 = 0x3032000000;
      v137 = __Block_byref_object_copy__1828;
      v138 = __Block_byref_object_dispose__1829;
      id v139 = 0;
      if (v13)
      {
        if ([v115 isConfirmation]
          && ([v13 extractedReminderDuplicateKey],
              uint64_t v20 = objc_claimAutoreleasedReturnValue(),
              BOOL v21 = v20 == 0,
              v20,
              v21))
        {
          v75 = sgRemindersLogHandle();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v132 = 0;
            _os_log_debug_impl(&dword_1CA650000, v75, OS_LOG_TYPE_DEBUG, "SGReminderDissector: Message with confirmation found", v132, 2u);
          }

          v76 = [v13 modelOutput];
          BOOL v77 = v76 == 0;

          if (v77)
          {
            v78 = [v13 entity];
            [v78 acquireDissectorLock];

            id v79 = [v13 entity];
            v111 = +[SGPOSTagger sharedInstance];
            __int16 v80 = [v13 message];
            unint64_t v81 = [v80 textContent];
            __int16 v82 = [v111 tokenizeTextContent:v81 languageHint:v113];
            [v79 addTaggedCharacterRanges:v82];

            unint64_t v83 = objc_opt_class();
            uint64_t v84 = [v13 entity];
            v85 = [v13 message];
            v110 = [v83 enrichedTaggedCharacterRangesFromEntity:v84 forMessage:v85];

            v86 = [v13 entity];
            [v86 releaseDissectorLock];

            v87 = [v112 modelInferences:v110];
            if (!v87)
            {
              uint64_t v40 = sgRemindersLogHandle();
              if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v132 = 0;
                _os_log_error_impl(&dword_1CA650000, (os_log_t)v40, OS_LOG_TYPE_ERROR, "SGReminderDissector: No modelOutput for previousMessage", v132, 2u);
              }
              id v37 = 0;
              goto LABEL_62;
            }
            [v13 setEnrichedTaggedCharacterRanges:v110];
            [v13 setModelOutput:v87];
          }
          if ([v13 isProposal])
          {
            v88 = sgRemindersLogHandle();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v132 = 0;
              _os_log_debug_impl(&dword_1CA650000, v88, OS_LOG_TYPE_DEBUG, "SGReminderDissector: Previous message has proposal and question", v132, 2u);
            }

            v134[0] = v13;
            v134[1] = v115;
            uint64_t v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:2];
            double v108 = [(SGReminderDissector *)self reminderTitleFromMessages:v89 forLanguage:v113];
            v107 = (void *)v89;
            if (v108 == 0.0)
            {
              v100 = *(void **)(*((void *)&buf + 1) + 40);
              *(void *)(*((void *)&buf + 1) + 40) = @"No title found for message";

              id v39 = 0;
              v110 = 0;
              uint64_t v40 = 0;
              *((unsigned char *)v129 + 24) = 5;
            }
            else
            {
              v90 = sgRemindersLogHandle();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v132 = 138739971;
                double v133 = v108;
                _os_log_debug_impl(&dword_1CA650000, v90, OS_LOG_TYPE_DEBUG, "SGReminderDissector: Found title for reminder %{sensitive}@", v132, 0xCu);
              }

              v91 = [(SGReminderDissector *)self dueDateComponentsFromMessages:v89];
              v110 = [(SGReminderDissector *)self dueLocationFromMessages:v89];
              uint64_t v92 = -[SGReminderDissector storageLocationFromDueLocation:](self, "storageLocationFromDueLocation:");
              uint64_t v40 = [(SGReminderDissector *)self _validateDueDateComponents:v91 dueLocation:v92 forReminderMessages:v89];
              v106 = (void *)v92;

              if (v40 | v92)
              {
                v93 = (void *)MEMORY[0x1E4F5D9D8];
                v94 = [v13 message];
                v95 = [v94 uniqueIdentifier];
                v105 = [v93 urlForEKEventFromTextMessageWithUniqueIdentifier:v95];

                uint64_t v96 = [v110 locationType];
                uint64_t v97 = [v110 trigger];
                LOBYTE(v104) = [(SGReminderDissector *)self isAllDay:v40];
                LOBYTE(v103) = 2;
                id v39 = [(SGReminderDissector *)self _reminderEnrichmentWithTitle:*(void *)&v108 dueDateComponents:v40 dueLocationType:v96 dueLocation:v106 dueLocationTrigger:v97 sourceURL:v105 reminderStatus:v103 parentEntity:v9 parentMessage:v8 allDay:v104];
                *((unsigned char *)v129 + 24) = 1;
              }
              else
              {
                v101 = *(void **)(*((void *)&buf + 1) + 40);
                *(void *)(*((void *)&buf + 1) + 40) = @"No dueDate nor dueLocation found in message";

                id v39 = 0;
                *((unsigned char *)v129 + 24) = 4;
              }
            }
            goto LABEL_42;
          }
          v98 = *(void **)(*((void *)&buf + 1) + 40);
          *(void *)(*((void *)&buf + 1) + 40) = @"No proposal found";

          id v39 = 0;
          v110 = 0;
          uint64_t v40 = 0;
          v60 = v129;
          char v61 = 2;
        }
        else
        {
          if ([v115 isRejection])
          {
            uint64_t v22 = [v13 extractedReminderDuplicateKey];
            BOOL v23 = v22 == 0;

            if (!v23)
            {
              v24 = [v13 extractedReminderDuplicateKey];
              id v126 = 0;
              char v25 = [v117 rejectReminderByKey:v24 error:&v126];
              double v26 = COERCE_DOUBLE(v126);

              if ((v25 & 1) == 0)
              {
                long long v27 = sgRemindersLogHandle();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v132 = 138412290;
                  double v133 = v26;
                  _os_log_error_impl(&dword_1CA650000, v27, OS_LOG_TYPE_ERROR, "SGReminderDissector: Couldn't reject reminder: %@", v132, 0xCu);
                }
              }
LABEL_31:
              id v39 = 0;
              v110 = 0;
              uint64_t v40 = 0;
LABEL_42:
              if (*(void *)(*((void *)&buf + 1) + 40))
              {
                v62 = sgRemindersLogHandle();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
                {
                  double v99 = *(double *)(*((void *)&buf + 1) + 40);
                  *(_DWORD *)v132 = 138412290;
                  double v133 = v99;
                  _os_log_debug_impl(&dword_1CA650000, v62, OS_LOG_TYPE_DEBUG, "SGReminderDissector: %@", v132, 0xCu);
                }
              }
              v63 = [v116 source];
              int v64 = [v63 hasPrefix:@"suggest_tool"];

              if (v64)
              {
                if (v17 && ([v8 isSent] & 1) == 0)
                {
                  v65 = self->_conversations;
                  v66 = [v8 conversationIdentifier];
                  [(NSMutableDictionary *)v65 setObject:v115 forKeyedSubscript:v66];
                }
                v118[0] = MEMORY[0x1E4F143A8];
                v118[1] = 3221225472;
                v118[2] = __67__SGReminderDissector_extractReminderFromTextMessage_entity_store___block_invoke;
                v118[3] = &unk_1E65B5868;
                id v119 = v9;
                id v120 = v115;
                p_long long buf = &buf;
                id v121 = v13;
                v125 = &v128;
                id v122 = v112;
                id v123 = v113;
                [v119 runWithDissectorLock:v118];

                id v67 = v119;
              }
              else
              {
                if (([v8 isSent] & 1) == 0)
                {
                  v102 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v102 handleFailureInMethod:a2, self, @"SGReminderDissector.m", 648, @"Invalid parameter not satisfying: %@", @"textMessage.isSent" object file lineNumber description];
                }
                v68 = self->_conversations;
                id v67 = [v8 conversationIdentifier];
                [(NSMutableDictionary *)v68 removeObjectForKey:v67];
              }

              uint64_t v69 = mach_absolute_time() - v109;
              if (SGMachTimeToNanoseconds_onceToken != -1) {
                dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_16442);
              }
              double v70 = (double)(v69
                           * SGMachTimeToNanoseconds_machTimebaseInfo
                           / *(unsigned int *)algn_1EB9F00D4)
                  * 0.000001;
              if (v39 || *(void *)(*((void *)&buf + 1) + 40))
              {
                id v71 = +[SGRTCLogging defaultLogger];
                [v71 logReminderExtractionFromEntity:v9 interface:0 actionType:0 dueLocation:v110 dueDateComponents:v40 extractionStatus:*((unsigned __int8 *)v129 + 24) timingProcessing:v70];
              }
              unsigned int v72 = sgRemindersLogHandle();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v132 = 134217984;
                double v133 = v70;
                _os_log_debug_impl(&dword_1CA650000, v72, OS_LOG_TYPE_DEBUG, "SGReminderDissector: timing(ms): %f", v132, 0xCu);
              }

              id v37 = v39;
LABEL_62:

              _Block_object_dispose(&buf, 8);
              goto LABEL_63;
            }
          }
          v59 = *(void **)(*((void *)&buf + 1) + 40);
          *(void *)(*((void *)&buf + 1) + 40) = @"No confirmation found";

          id v39 = 0;
          v110 = 0;
          uint64_t v40 = 0;
          v60 = v129;
          char v61 = 3;
        }
        *((unsigned char *)v60 + 24) = v61;
        goto LABEL_42;
      }
      v38 = sgRemindersLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v132 = 0;
        _os_log_debug_impl(&dword_1CA650000, v38, OS_LOG_TYPE_DEBUG, "SGReminderDissector: No previous message", v132, 2u);
      }

      goto LABEL_31;
    }
  }
LABEL_39:
  __int16 v14 = 0;
LABEL_68:

LABEL_69:
  _Block_object_dispose(&v128, 8);

  return v14;
}

void __67__SGReminderDissector_extractReminderFromTextMessage_entity_store___block_invoke(uint64_t a1)
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) modelOutput];
  id v4 = [*(id *)(a1 + 40) enrichedTaggedCharacterRanges];
  int v5 = +[SGReminderExtractionModel enrichTaggedCharacterRangesWithModelOutput:v3 usingInputCharacterRanges:v4];
  [v2 addTaggedCharacterRanges:v5];

  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    v26[0] = *(void *)(a1 + 48);
    v26[1] = v6;
    BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    id v23 = 0;
    BOOL v8 = +[SGReminderMessage validModelOutput:v7 error:&v23];
    id v9 = v23;

    if (!v8)
    {
      if (v9)
      {
        uint64_t v10 = [v9 userInfo];
        uint64_t v11 = [v10 description];
        uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
        long long v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 6;
    }
  }
  __int16 v14 = [*(id *)(a1 + 56) modelDescription];
  long long v15 = (void *)MEMORY[0x1E4F5D9F0];
  v24[0] = @"extractionStatus";
  uint64_t v16 = +[SGRTCLogging describeReminderExtractionStatus:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
  int v17 = (void *)v16;
  v24[1] = @"errorMessage";
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v19 = *(__CFString **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (!v19) {
    uint64_t v19 = &stru_1F24EEF20;
  }
  v25[0] = v16;
  v25[1] = v19;
  v24[2] = @"processingLanguage";
  v24[3] = @"modelDescription";
  if (v14) {
    uint64_t v20 = v14;
  }
  else {
    uint64_t v20 = &stru_1F24EEF20;
  }
  v25[2] = v18;
  v25[3] = v20;
  BOOL v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  uint64_t v22 = [v15 reminderMetadata:v21];

  if (v22) {
    [*(id *)(a1 + 32) addTag:v22];
  }
}

- (id)_detectedReminderEnrichmentFromReminderMessage:(id)a3 parentEntity:(id)a4 language:(id)a5 parentMessage:(id)a6 startTimeProcessing:(unint64_t)a7
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (!a5)
  {
    id v25 = 0;
    goto LABEL_31;
  }
  long long v15 = [v12 detectedTitleForLanguage:a5];
  uint64_t v16 = +[SGReminderTrialClientWrapper sharedInstance];
  uint64_t v48 = v16;
  if ([v12 isProposal]
    && (([v12 hasTrigger] & 1) != 0
     || ([v12 isTriggerOptional] & 1) != 0
     || [v16 triggerOptional])
    && v15)
  {
    int v17 = [v12 detectedDueDateComponents];
    double v47 = v17;
    if ([v17 count] == 1)
    {
      uint64_t v18 = [v17 firstObject];
    }
    else
    {
      if ((unint64_t)[v17 count] < 2)
      {
        double v26 = 0;
        goto LABEL_21;
      }
      uint64_t v18 = +[SGExtractionDocument mergeDetectedDateComponents:v17];
    }
    double v26 = (void *)v18;
LABEL_21:
    uint64_t v21 = [v12 dueLocation];
    uint64_t v27 = [(SGReminderDissector *)self storageLocationFromDueLocation:v21];
    v49[0] = v12;
    id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    double v46 = (void *)v27;
    uint64_t v22 = [(SGReminderDissector *)self _validateDueDateComponents:v26 dueLocation:v27 forReminderMessages:v28];

    if (v22 | v21)
    {
      long long v29 = [v12 message];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      v44 = (void *)MEMORY[0x1E4F5D9D8];
      if (isKindOfClass)
      {
        long long v31 = [v12 message];
        long long v32 = [v31 uniqueIdentifier];
        v45 = [v44 urlForEKEventFromTextMessageWithUniqueIdentifier:v32];
      }
      else
      {
        int v43 = [v13 duplicateKey];
        long long v32 = [v43 emailKey];
        long long v34 = [v32 messageId];
        v45 = [v44 urlForMailMessageWithId:v34];

        long long v31 = v43;
      }

      uint64_t v35 = [(id)v21 locationType];
      uint64_t v36 = [(id)v21 trigger];
      LOBYTE(v42) = [(SGReminderDissector *)self isAllDay:v22];
      LOBYTE(v41) = 2;
      uint64_t v37 = v35;
      uint64_t v33 = v46;
      v24 = [(SGReminderDissector *)self _reminderEnrichmentWithTitle:v15 dueDateComponents:v22 dueLocationType:v37 dueLocation:v46 dueLocationTrigger:v36 sourceURL:v45 reminderStatus:v41 parentEntity:v13 parentMessage:v14 allDay:v42];

      uint64_t v23 = 1;
    }
    else
    {
      v24 = 0;
      uint64_t v23 = 4;
      uint64_t v33 = v46;
    }

    goto LABEL_28;
  }
  int v19 = [v12 isProposal];
  if (v15) {
    unsigned int v20 = 0;
  }
  else {
    unsigned int v20 = 5;
  }
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  if (v19) {
    uint64_t v23 = v20;
  }
  else {
    uint64_t v23 = 2;
  }
  v24 = 0;
LABEL_28:
  v38 = +[SGRTCLogging defaultLogger];
  uint64_t v39 = mach_absolute_time() - a7;
  if (SGMachTimeToNanoseconds_onceToken != -1) {
    dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_16442);
  }
  [v38 logReminderExtractionFromEntity:v13 interface:0 actionType:0 dueLocation:v21 dueDateComponents:v22 extractionStatus:v23 timingProcessing:(double)(v39 * SGMachTimeToNanoseconds_machTimebaseInfo / *(unsigned int *)algn_1EB9F00D4 / 0xF4240)];
  id v25 = v24;

LABEL_31:
  return v25;
}

- (id)extractReminderFromOwnedMailMessage:(id)a3 entity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__1828;
  long long v30 = __Block_byref_object_dispose__1829;
  id v31 = 0;
  uint64_t v8 = mach_absolute_time();
  id v9 = +[SGReminderExtractionModel sharedInstance];
  uint64_t v10 = [v6 textContent];
  uint64_t v11 = [v9 whitelistedRangesInContent:v10];

  id v12 = [v6 textContent];
  id v13 = [(SGReminderDissector *)self processingLanguageForContent:v12];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__SGReminderDissector_extractReminderFromOwnedMailMessage_entity___block_invoke;
  v19[3] = &unk_1E65B5840;
  id v14 = v7;
  id v20 = v14;
  id v15 = v6;
  id v21 = v15;
  id v16 = v13;
  id v22 = v16;
  uint64_t v23 = self;
  v24 = &v26;
  uint64_t v25 = v8;
  [v11 enumerateRangesUsingBlock:v19];
  id v17 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __66__SGReminderDissector_extractReminderFromOwnedMailMessage_entity___block_invoke(uint64_t a1, NSUInteger a2, NSUInteger a3, unsigned char *a4)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  double v70 = objc_opt_new();
  uint64_t v67 = a1;
  id v7 = [*(id *)(a1 + 32) taggedCharacterRanges];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v76 objects:v87 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v77;
    NSUInteger length = a3;
    NSUInteger location = a2;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v77 != v10) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        v93.NSUInteger location = [v14 range];
        v93.NSUInteger length = v15;
        v89.NSUInteger location = a2;
        v89.NSUInteger length = a3;
        if (NSIntersectionRange(v89, v93).length)
        {
          v94.NSUInteger location = [v14 range];
          v94.NSUInteger length = v16;
          v90.NSUInteger location = location;
          v90.NSUInteger length = length;
          NSRange v17 = NSUnionRange(v90, v94);
          NSUInteger location = v17.location;
          NSUInteger length = v17.length;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v76 objects:v87 count:16];
    }
    while (v9);
  }
  else
  {
    NSUInteger length = a3;
    NSUInteger location = a2;
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v7;
  uint64_t v18 = [obj countByEnumeratingWithState:&v72 objects:v86 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v73;
    NSUInteger v68 = length;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v73 != v20) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(void **)(*((void *)&v72 + 1) + 8 * j);
        v95.NSUInteger location = [v22 range];
        v95.NSUInteger length = v23;
        v91.NSUInteger location = location;
        v91.NSUInteger length = length;
        NSUInteger v24 = NSIntersectionRange(v91, v95).length;
        v96.NSUInteger location = [v22 range];
        v96.NSUInteger length = v25;
        v92.NSUInteger location = location;
        v92.NSUInteger length = length;
        NSRange v26 = NSUnionRange(v92, v96);
        if (v24) {
          BOOL v27 = v26.location == location;
        }
        else {
          BOOL v27 = 0;
        }
        if (v27 && v26.length == length)
        {
          long long v29 = [SGTaggedCharacterRange alloc];
          uint64_t v30 = [v22 annotationType];
          [v22 tags];
          v32 = uint64_t v31 = v19;
          NSUInteger v33 = [v22 range] - location;
          [v22 range];
          uint64_t v35 = v34;
          uint64_t v36 = [v22 text];
          uint64_t v37 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v29, "initWithAnnotationType:tags:range:text:", v30, v32, v33, v35, v36);

          uint64_t v19 = v31;
          NSUInteger length = v68;
          [v70 addObject:v37];
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v72 objects:v86 count:16];
    }
    while (v19);
  }

  v38 = [*(id *)(v67 + 40) quotedRegions];
  if (objc_msgSend(v38, "intersectsIndexesInRange:", location, length)) {
    goto LABEL_31;
  }
  uint64_t v39 = [*(id *)(v67 + 40) htmlParser];
  uint64_t v40 = [v39 tabularRegions];
  if (objc_msgSend(v40, "intersectsIndexesInRange:", location, length))
  {

LABEL_31:
    goto LABEL_32;
  }
  uint64_t v42 = [*(id *)(v67 + 40) htmlParser];
  int v43 = [v42 signatureRegions];
  char v44 = objc_msgSend(v43, "intersectsIndexesInRange:", location, length);

  if (v44)
  {
LABEL_32:
    uint64_t v41 = sgRemindersLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA650000, v41, OS_LOG_TYPE_INFO, "SGReminderDissector: Skipping parts of content that are identified as not plain text", buf, 2u);
    }
    goto LABEL_46;
  }
  v45 = (void *)MEMORY[0x1CB79B230]();
  double v46 = [*(id *)(v67 + 40) textContent];
  uint64_t v41 = objc_msgSend(v46, "substringWithRange:", location, length);

  double v47 = [*(id *)(v67 + 40) date];
  uint64_t v48 = +[SGDataDetectorMatch detectionsInPlainText:v41 baseDate:v47];

  uint64_t v49 = +[SGPOSTagger sharedInstance];
  v50 = [v49 tokenizeTextContent:v41 languageHint:*(void *)(v67 + 48)];
  [v70 addObjectsFromArray:v50];

  v51 = [(id)objc_opt_class() enrichedTaggedCharacterRangesFromTaggedCharacterRanges:v70 messageIsSent:0];
  if ([v51 count])
  {
    v52 = +[SGReminderExtractionModel sharedInstance];
    v53 = [v52 modelInferences:v51];
    if (v53)
    {
      v65 = v52;
      v54 = [SGMessage alloc];
      v84[0] = @"isSent";
      v55 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(v67 + 40), "isSent"));
      v84[1] = @"body";
      v85[0] = v55;
      v85[1] = v41;
      uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
      v57 = [(SGMessage *)v54 initWithMessageDictionary:v56];

      uint64_t v69 = v48;
      id v58 = [[SGReminderMessage alloc] initWithMessage:v57 plainTextDetectedData:v48 enrichedTaggedCharacterRanges:v51 modelOutput:v53];
      uint64_t v59 = [*(id *)(v67 + 56) _detectedReminderEnrichmentFromReminderMessage:v58 parentEntity:*(void *)(v67 + 32) language:*(void *)(v67 + 48) parentMessage:*(void *)(v67 + 40) startTimeProcessing:*(void *)(v67 + 72)];
      uint64_t v60 = *(void *)(*(void *)(v67 + 64) + 8);
      char v61 = *(void **)(v60 + 40);
      *(void *)(v60 + 40) = v59;

      v62 = sgRemindersLogHandle();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = [*(id *)(v67 + 32) loggingIdentifier];
        int v64 = [*(id *)(*(void *)(*(void *)(v67 + 64) + 8) + 40) loggingIdentifier];
        *(_DWORD *)long long buf = 138543618;
        unint64_t v81 = v63;
        __int16 v82 = 2114;
        unint64_t v83 = v64;
        _os_log_impl(&dword_1CA650000, v62, OS_LOG_TYPE_DEFAULT, "SGEntity: %{public}@ -> SGPipelineEnrichment: %{public}@", buf, 0x16u);
      }
      if (*(void *)(*(void *)(*(void *)(v67 + 64) + 8) + 40)) {
        *a4 = 1;
      }

      uint64_t v48 = v69;
      v52 = v65;
    }
    else
    {
      v57 = sgRemindersLogHandle();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_1CA650000, v57, OS_LOG_TYPE_ERROR, "SGReminderDissector: Not model output, bailing", buf, 2u);
      }
    }
  }
LABEL_46:
}

- (id)extractReminderFromMailMessage:(id)a3 entity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  NSRange v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__1828;
  uint64_t v20 = __Block_byref_object_dispose__1829;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__SGReminderDissector_extractReminderFromMailMessage_entity___block_invoke;
  v12[3] = &unk_1E65BE418;
  NSUInteger v15 = &v16;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  [v9 runWithDissectorLock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __61__SGReminderDissector_extractReminderFromMailMessage_entity___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) extractReminderFromOwnedMailMessage:*(void *)(a1 + 40) entity:*(void *)(a1 + 48)];
  return MEMORY[0x1F41817F8]();
}

- (id)reminderTitleForContent:(id)a3
{
  id v4 = a3;
  int v5 = [(SGReminderDissector *)self processingLanguageForContent:v4];
  if (v4 && (unint64_t)[v4 length] <= 0x3E8)
  {
    id v6 = 0;
    if ([v4 length] && v5)
    {
      id v8 = +[SGPOSTagger sharedInstance];
      id v9 = [v8 tokenizeTextContent:v4 languageHint:v5];

      id v10 = [(id)objc_opt_class() enrichedTaggedCharacterRangesFromTaggedCharacterRanges:v9 messageIsSent:0];
      if ([v10 count])
      {
        uint64_t v11 = +[SGReminderExtractionModel sharedInstance];
        id v12 = [v11 modelInferences:v10];
        if (v12)
        {
          id v6 = +[SGReminderMessage detectedTitleInModelOutput:v12 enrichedTaggedCharacterRanges:v10 textContent:v4 language:v5];
        }
        else
        {
          id v6 = 0;
        }
      }
      else
      {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1CB79B230]();
  if (([MEMORY[0x1E4F5DAF0] detectReminders] & 1) == 0)
  {
    id v12 = sgRemindersLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      id v13 = "SGReminderDissector: detectReminders is OFF";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if ([v9 hasEventEnrichment])
  {
    id v12 = sgRemindersLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      id v13 = "SGReminderDissector: Not processing since PseudoEvent found";
LABEL_7:
      _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v23, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v14 = +[SGAsset localeAsset];
  uint64_t v15 = [v14 assetVersion];

  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = sgRemindersLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v9 loggingIdentifier];
      int v23 = 138543362;
      NSUInteger v24 = v16;
      _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, "SGReminderDissector: Not processing due to a missing localeAsset. [SGEntity (%{public}@)]", (uint8_t *)&v23, 0xCu);
    }
    goto LABEL_8;
  }
  [v9 releaseDissectorLock];
  NSRange v17 = self;
  uint64_t v18 = objc_sync_enter(v17);
  uint64_t v19 = (void *)MEMORY[0x1CB79B230](v18);
  uint64_t v20 = [v10 serviceContext];
  id v21 = [v20 store];
  id v22 = [(SGReminderDissector *)v17 extractReminderFromTextMessage:v8 entity:v9 store:v21];

  objc_sync_exit(v17);

  [v9 acquireDissectorLock];
  if (v22) {
    [v9 addEnrichment:v22];
  }

LABEL_9:
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1CB79B230]();
  if (([MEMORY[0x1E4F5DAF0] detectReminders] & 1) == 0)
  {
    id v14 = sgRemindersLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      uint64_t v16 = "SGReminderDissector: detectReminders is OFF";
LABEL_10:
      _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v33, 2u);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (([MEMORY[0x1E4F5DAF0] detectRemindersInMail] & 1) == 0)
  {
    id v14 = sgRemindersLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      uint64_t v16 = "SGReminderDissector: Reminder detection for mail is off";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v12 = +[SGAsset localeAsset];
  uint64_t v13 = [v12 assetVersion];

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = sgRemindersLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v9 loggingIdentifier];
      int v33 = 138543362;
      uint64_t v34 = v15;
      _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, "SGReminderDissector: Not processing due to a missing localeAsset. [SGEntity (%{public}@)]", (uint8_t *)&v33, 0xCu);
    }
    goto LABEL_11;
  }
  if ([v9 hasEventEnrichment])
  {
    id v14 = sgRemindersLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v33) = 0;
    uint64_t v16 = "SGReminderDissector: Not processing since PseudoEvent found";
    goto LABEL_10;
  }
  NSRange v17 = [v8 allRecipients];
  unint64_t v18 = [v17 count];

  if (v18 >= 2)
  {
    id v14 = sgRemindersLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v33) = 0;
    uint64_t v16 = "SGReminderDissector: Mail has multiple recipients, skipping";
    goto LABEL_10;
  }
  if ([v9 isInhuman])
  {
    id v14 = sgRemindersLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v33) = 0;
    uint64_t v16 = "SGReminderDissector: Mail is inhuman, skipping";
    goto LABEL_10;
  }
  uint64_t v19 = [v8 mailingList];

  if (v19)
  {
    id v14 = sgRemindersLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v33) = 0;
    uint64_t v16 = "SGReminderDissector: Mail is from mailing list, skipping";
    goto LABEL_10;
  }
  if ([v8 isPartiallyDownloaded])
  {
    id v14 = sgRemindersLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v33) = 0;
    uint64_t v16 = "SGReminderDissector: Mail is partially downloaded, skipping";
    goto LABEL_10;
  }
  if ([v8 isSent])
  {
    id v14 = sgRemindersLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v33) = 0;
    uint64_t v16 = "SGReminderDissector: Mail is sent, skipping";
    goto LABEL_10;
  }
  uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
  id v21 = [v8 date];
  [v20 timeIntervalSinceDate:v21];
  double v23 = v22;

  if (v23 > 604800.0)
  {
    id v14 = sgRemindersLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v33) = 0;
    uint64_t v16 = "SGReminderDissector: Mail is older than one week, skipping";
    goto LABEL_10;
  }
  NSUInteger v24 = [v8 from];
  uint64_t v25 = [v24 asCSPerson];
  NSRange v26 = [v10 serviceContext];
  BOOL v27 = [v26 store];
  char v28 = objc_msgSend(v25, "sg_isSignificantWithStore:", v27);

  if ((v28 & 1) == 0)
  {
    id v14 = sgRemindersLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v33) = 0;
    uint64_t v16 = "SGReminderDissector: Mail is from insignificant sender, skipping";
    goto LABEL_10;
  }
  [v9 releaseDissectorLock];
  long long v29 = self;
  uint64_t v30 = objc_sync_enter(v29);
  uint64_t v31 = (void *)MEMORY[0x1CB79B230](v30);
  long long v32 = [(SGReminderDissector *)v29 extractReminderFromMailMessage:v8 entity:v9];
  objc_sync_exit(v29);

  [v9 acquireDissectorLock];
  if (v32) {
    [v9 addEnrichment:v32];
  }

LABEL_12:
}

- (SGReminderDissector)initWithConversations:(id)a3 rtRoutineManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGReminderDissector;
  id v9 = [(SGReminderDissector *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conversations, a3);
    objc_storeStrong((id *)&v10->_rtRoutineManager, a4);
  }

  return v10;
}

- (SGReminderDissector)init
{
  id v3 = objc_opt_new();
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v4 = (void *)getRTRoutineManagerClass_softClass;
  uint64_t v15 = getRTRoutineManagerClass_softClass;
  if (!getRTRoutineManagerClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getRTRoutineManagerClass_block_invoke;
    v11[3] = &unk_1E65C0148;
    v11[4] = &v12;
    __getRTRoutineManagerClass_block_invoke((uint64_t)v11);
    id v4 = (void *)v13[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v12, 8);
  if (v5)
  {
    SEL v6 = NSSelectorFromString((NSString *)@"defaultManager");
    id v7 = ((void (*)(id, SEL))[v5 methodForSelector:v6])(v5, v6);
  }
  else
  {
    id v8 = sgRemindersLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "Suggestions failed to dlopen CoreRoutine.", (uint8_t *)v11, 2u);
    }

    id v7 = 0;
  }
  id v9 = [(SGReminderDissector *)self initWithConversations:v3 rtRoutineManager:v7];

  return v9;
}

+ (id)getContactIdentifierForName:(id)a3 andEmail:(id)a4 ifMatchingPredicate:(id)a5
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_opt_new();
  uint64_t v11 = +[SGContactStoreFactory contactStore];
  uint64_t v12 = *MEMORY[0x1E4F1ADC8];
  v54[0] = *MEMORY[0x1E4F1AE08];
  v54[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  id v51 = 0;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __80__SGReminderDissector_getContactIdentifierForName_andEmail_ifMatchingPredicate___block_invoke;
  v48[3] = &unk_1E65BC028;
  id v36 = v9;
  id v50 = v36;
  id v14 = v10;
  id v49 = v14;
  uint64_t v39 = v7;
  uint64_t v37 = (void *)v11;
  +[SGContactsInterface enumerateContactsMatchingName:v7 withKeysToFetch:v13 usingContactStore:v11 error:&v51 usingBlock:v48];
  id v35 = v51;

  uint64_t v15 = [v14 array];
  v38 = v8;
  uint64_t v16 = SGNormalizeEmailAddress();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v17 = v15;
  uint64_t v33 = [v17 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v33)
  {
    uint64_t v18 = *(void *)v45;
    uint64_t v31 = *(void *)v45;
    id v32 = v14;
    uint64_t v34 = v17;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v17);
        }
        uint64_t v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v21 = [v20 emailAddresses];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v52 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v41;
          while (2)
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v41 != v24) {
                objc_enumerationMutation(v21);
              }
              NSRange v26 = [*(id *)(*((void *)&v40 + 1) + 8 * j) value];
              BOOL v27 = SGNormalizeEmailAddress();
              char v28 = [v16 isEqualToString:v27];

              if (v28)
              {
                id v29 = v20;

                id v14 = v32;
                id v17 = v34;
                goto LABEL_19;
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v52 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }

        id v17 = v34;
        uint64_t v18 = v31;
      }
      id v29 = 0;
      id v14 = v32;
      uint64_t v33 = [v34 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v33);
  }
  else
  {
    id v29 = 0;
  }
LABEL_19:

  return v29;
}

void __80__SGReminderDissector_getContactIdentifierForName_andEmail_ifMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

+ (BOOL)isReminderDueDateComponentsInPast:(id)a3 givenReferenceDate:(id)a4 allDay:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  [a4 timeIntervalSinceReferenceDate];
  double v9 = v8;
  id v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v11 = [v10 dateFromComponents:v7];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  if (v5)
  {
    id v14 = (void *)[v7 copy];
    [v14 setHour:23];
    [v14 setMinute:59];
    [v14 setSecond:59];
    uint64_t v15 = [v14 timeZone];

    if (!v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      [v14 setTimeZone:v16];
    }
    id v17 = [v14 date];
    [v17 timeIntervalSinceReferenceDate];
    double v13 = v18;
  }
  return v9 > v13;
}

+ (id)enrichedTaggedCharacterRangesFromEntity:(id)a3 forMessage:(id)a4
{
  id v6 = a4;
  id v7 = [a3 taggedCharacterRanges];
  uint64_t v8 = [v6 isSent];

  double v9 = [a1 enrichedTaggedCharacterRangesFromTaggedCharacterRanges:v7 messageIsSent:v8];

  return v9;
}

+ (id)enrichedTaggedCharacterRangesFromTaggedCharacterRanges:(id)a3 messageIsSent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)[a3 mutableCopy];
  id v6 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([v12 annotationType] == 3) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v9);
  }

  double v13 = +[SGReminderExtractionModel sharedInstance];
  id v14 = [v13 enrichments];

  if (v14)
  {
    uint64_t v15 = [v14 objectForKeyedSubscript:@"polarityEmojisMapping"];
    uint64_t v16 = v15;
    if (v15)
    {
      uint64_t v42 = v15;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
      double v18 = +[SGTaggedCharacterRange enrichAndFilterTaggedCharacterRanges:v6 usingMapping:v17 withAnnotationType:3];

      uint64_t v19 = [v14 objectForKeyedSubscript:@"verbsMapping"];
      uint64_t v20 = (void *)v19;
      if (v19)
      {
        uint64_t v41 = v19;
        id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
        uint64_t v33 = +[SGTaggedCharacterRange enrichAndFilterTaggedCharacterRanges:v6 usingMapping:v21 withAnnotationType:7];

        [v7 addObjectsFromArray:v18];
        [v7 addObjectsFromArray:v33];
        uint64_t v22 = @"CONTACT";
        if (v4) {
          uint64_t v22 = @"ACCOUNT_OWNER";
        }
        uint64_t v23 = v22;
        uint64_t v24 = [SGTaggedCharacterRange alloc];
        uint64_t v25 = (void *)[[NSString alloc] initWithFormat:@"IS_%@", v23];

        uint64_t v39 = v25;
        NSRange v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
        BOOL v27 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v24, "initWithAnnotationType:tags:range:text:", 5, v26, 0, 0, &stru_1F24EEF20);
        long long v40 = v27;
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
        v29 = char v28 = v18;

        uint64_t v30 = +[SGTaggedCharacterRange mergeTaggedCharacterRanges:v7 usingBaseTaggedCharacterRanges:v6 extraTags:v29 tagOverrides:0 alignWithGroundTruth:0];

        double v18 = v28;
        uint64_t v31 = v33;
      }
      else
      {
        uint64_t v31 = sgRemindersLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl(&dword_1CA650000, v31, OS_LOG_TYPE_ERROR, "SGReminderDissector: Unable to load verb mapping", buf, 2u);
        }
        uint64_t v30 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      double v18 = sgRemindersLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_1CA650000, v18, OS_LOG_TYPE_ERROR, "SGReminderDissector: Unable to load emoji assets", buf, 2u);
      }
      uint64_t v30 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v16 = sgRemindersLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v16, OS_LOG_TYPE_ERROR, "SGReminderDissector: Unable to load model assets", buf, 2u);
    }
    uint64_t v30 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v30;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken4 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken4, &__block_literal_global_1931);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;
  return v2;
}

void __37__SGReminderDissector_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

@end