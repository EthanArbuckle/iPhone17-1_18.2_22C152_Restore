@interface SGStructuredEventDissector
+ (BOOL)eventEnrichmentContainsReverseMappedTags:(id)a3;
+ (id)addressDictionaryForAddressComponents:(id)a3;
+ (id)annotateContent:(id)a3 withLabel:(id)a4 forMatchingString:(id)a5;
+ (id)annotationMatchingStringsForSubject:(id)a3;
+ (id)eventEnrichmentFromEntity:(id)a3;
+ (id)jsMessageLogsDictionaryForMailMessage:(id)a3;
+ (id)jsMessageLogsDictionaryForPrivacyAwareLogs:(id)a3;
+ (id)labelsWithMatchingStringsForMailMessage:(id)a3;
+ (id)mergeFallbackSchema:(id)a3 parentEntity:(id)a4;
+ (id)nilEntities:(id)a3;
+ (id)outputLogsForClassification:(id)a3;
+ (id)plainTextStringsByLabelInTaggedCharacterRanges:(id)a3 inPlainText:(id)a4;
+ (id)preprocessDomParserResult:(id)a3 subject:(id)a4 epoch:(double)a5 category:(id)a6 labelsWithMatchingStrings:(id)a7;
+ (id)preprocessWithoutXPCForHTML:(id)a3 subject:(id)a4 epoch:(double)a5 category:(id)a6 labelsWithMatchingStrings:(id)a7;
+ (id)schemaOrgAndMissingEntitiesForDUFoundInEvent:(id)a3 eventClassification:(id)a4 fromSuggestTool:(BOOL)a5;
+ (id)schemaOrgAndMissingEntitiesForPreprocessed:(id)a3 eventClassification:(id)a4 fromSuggestTool:(BOOL)a5;
+ (id)schemaOrgAndMissingEntitiesForPreprocessed:(id)a3 eventClassification:(id)a4 fromSuggestTool:(BOOL)a5 addressThreshold:(unint64_t)a6 pflTrainable:(BOOL)a7 hasEvent:(BOOL)a8;
+ (id)schemaPostalAddressForPostalAddressExtraction:(id)a3 addressThreshold:(unint64_t)a4;
+ (id)schemaStringForDateComponents:(id)a3;
+ (id)schemaStringForEventStatus:(unsigned __int8)a3;
+ (id)schemaStringForReservationStatus:(unsigned __int8)a3;
+ (id)sharedInstance;
+ (id)tupleWithEntity:(id)a3 label:(id)a4;
+ (id)tupleWithError:(id)a3 label:(id)a4;
+ (unint64_t)tokenCount:(id)a3;
+ (unint64_t)tokenCountForPostalAddressComponents:(id)a3;
+ (void)addSchemaAsEnrichment:(id)a3 inMessage:(id)a4 parentEntity:(id)a5 eventClassification:(id)a6 mlDefaultExtraction:(BOOL)a7;
+ (void)logFailedExtractionWithClassification:(id)a3 missingEntities:(id)a4 mlSummary:(id)a5 shadowExtraction:(BOOL)a6 timingProcessingInMs:(unint64_t)a7 forMessage:(id)a8 parentEntity:(id)a9;
+ (void)logMLExtractionForSchema:(id)a3 mergedSchemaAndDiff:(id)a4 parentEntity:(id)a5 timingProcessingInMs:(unint64_t)a6 eventClassification:(id)a7 mailMessage:(id)a8 shadowExtraction:(BOOL)a9 mlDefaultExtraction:(BOOL)a10;
+ (void)logMLInteractions:(id)a3 context:(id)a4 mlDefaultExtraction:(BOOL)a5;
- (id)preprocessHTML:(id)a3 subject:(id)a4 epoch:(double)a5 category:(id)a6 labelsWithMatchingStrings:(id)a7;
- (id)tagsWithModelOutputFromEnrichedTaggedCharacterRanges:(id)a3;
- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5;
@end

@implementation SGStructuredEventDissector

- (id)tagsWithModelOutputFromEnrichedTaggedCharacterRanges:(id)a3
{
  id v3 = a3;
  v4 = +[SGStructuredEventExtractionModel sharedInstance];
  v5 = [v4 modelInferences:v3];

  if (v5)
  {
    v6 = +[SGExtractionModel enrichTaggedCharacterRangesWithModelOutput:v5 usingInputCharacterRanges:v3];
  }
  else
  {
    v7 = sgEventsLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: no extraction model inferences.", v9, 2u);
    }

    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)preprocessHTML:(id)a3 subject:(id)a4 epoch:(double)a5 category:(id)a6 labelsWithMatchingStrings:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = objc_opt_new();
  v16 = [v15 parseHTML:v14];

  v17 = [(id)objc_opt_class() preprocessDomParserResult:v16 subject:v13 epoch:v12 category:v11 labelsWithMatchingStrings:a5];

  return v17;
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  context = (void *)MEMORY[0x1CB79B230]();
  v79 = (void *)mach_absolute_time();
  v10 = [v7 from];
  id v11 = [v10 emailAddress];

  if (v11)
  {
    id v12 = +[SGStructuredEventExtractionModel sharedInstance];
    int v13 = [MEMORY[0x1E4F5DAF0] detectStructuredEventsML];
    id v14 = [v7 from];
    v15 = [v14 emailAddress];
    int v16 = [v12 isSenderSupportedForExtraction:v15];

    v17 = [v7 from];
    v18 = [v17 emailAddress];
    LODWORD(v15) = [v12 isSenderSupportedForShadowExtraction:v18];

    v19 = [v7 from];
    v20 = [v19 emailAddress];
    unsigned int v78 = [v12 isSenderSupportedForMLDefaultExtraction:v20];

    v21 = [v7 from];
    v22 = [v21 emailAddress];
    uint64_t v23 = [v12 isSenderSupportedForPFLTraining:v22];

    v24 = sgEventsLogHandle();
    uint64_t v25 = v15 & (v13 ^ 1);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v26 = @"NO";
      if (v16) {
        v27 = @"YES";
      }
      else {
        v27 = @"NO";
      }
      if (v25) {
        v28 = @"YES";
      }
      else {
        v28 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v28;
      if (v23) {
        v26 = @"YES";
      }
      *(_WORD *)&buf[22] = 2112;
      v87 = (uint64_t (*)(uint64_t, uint64_t))v26;
      _os_log_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: extractionSupported: %@, shadowExtraction: %@, pflTraining: %@", buf, 0x20u);
    }

    if ((v13 | v16 | v25))
    {
      if (+[SGExtractionDissector emailIsForwardOrReply:v7])
      {
        v29 = sgEventsLogHandle();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
LABEL_20:

          goto LABEL_21;
        }
        *(_WORD *)buf = 0;
        v30 = "SGStructuredEventDissector: ignoring Forwarded / Reply email";
LABEL_16:
        _os_log_impl(&dword_1CA650000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
        goto LABEL_20;
      }
      v31 = [v7 htmlBody];
      BOOL v32 = v31 == 0;

      if (v32)
      {
        v29 = sgEventsLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA650000, v29, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: Entity has no content", buf, 2u);
        }
        goto LABEL_20;
      }
      if (([v8 hasEventEnrichment] ^ 1 | v78 | v25))
      {
        if ([v9 backpressureHazard] == 1) {
          int v33 = v25;
        }
        else {
          int v33 = 0;
        }
        if (v33 == 1)
        {
          v29 = sgEventsLogHandle();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_20;
          }
          *(_WORD *)buf = 0;
          v30 = "SGStructuredEventDissector: skipping shadowLogging extraction for realtime dissection";
          goto LABEL_16;
        }
        v35 = [v8 sourceKey];
        unsigned int v76 = [v35 isEqualToString:@"suggest_tool"];

        if (v76)
        {
          v36 = objc_opt_new();
          v29 = [v36 eventClassificationWithoutXPCForMailMessage:v7];
        }
        else
        {
          v37 = (void *)MEMORY[0x1CB79B230]();
          v38 = objc_opt_new();
          v29 = [v38 eventClassificationForMailMessage:v7];
        }
        if (!v29)
        {
          v39 = sgEventsLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA650000, v39, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: eventClassification is nil, bailing", buf, 2u);
          }
          goto LABEL_80;
        }
        if (![v29 useCase]
          || [v29 useCase] == 1)
        {
          v39 = sgEventsLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA650000, v39, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: Not classified as event, bailing", buf, 2u);
          }
          goto LABEL_80;
        }
        v40 = sgEventsLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v29;
          _os_log_debug_impl(&dword_1CA650000, v40, OS_LOG_TYPE_DEBUG, "SGStructuredEventDissector eventClassification: %@", buf, 0xCu);
        }

        uint64_t v75 = +[SGStructuredEventClassification describeCategory:[v29 category]];
        if (_os_feature_enabled_impl())
        {
          v41 = [SGSimpleMailMessage alloc];
          v42 = [(SGSimpleMailMessage *)v41 convertMailMessageToBMMailMessage:v7];

          v72 = [v42 encodeAsProto];
          v43 = objc_opt_new();
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v87 = __Block_byref_object_copy__16008;
          v88 = __Block_byref_object_dispose__16009;
          id v89 = 0;
          v83[0] = MEMORY[0x1E4F143A8];
          v83[1] = 3221225472;
          v83[2] = __64__SGStructuredEventDissector_dissectMailMessage_entity_context___block_invoke;
          v83[3] = &unk_1E65BB168;
          v83[4] = buf;
          uint64_t v44 = [v43 foundInEventResultWithSerializedDocument:v72 documentType:0 completion:v83];
          if (*(void *)(*(void *)&buf[8] + 40))
          {
            v45 = (void *)MEMORY[0x1CB79B230](v44);
            v77 = [(id)objc_opt_class() schemaOrgAndMissingEntitiesForDUFoundInEvent:*(void *)(*(void *)&buf[8] + 40) eventClassification:v29 fromSuggestTool:v76];
            v46 = [v77 objectForKeyedSubscript:@"schema"];
          }
          else
          {
            v77 = 0;
            v46 = 0;
          }
          _Block_object_dispose(buf, 8);
        }
        else
        {
          if (v76)
          {
            v47 = objc_opt_class();
            v73 = [v7 htmlBody];
            v48 = [v7 subject];
            [v8 creationTimestamp];
            double v50 = v49;
            v51 = [(id)objc_opt_class() labelsWithMatchingStringsForMailMessage:v7];
            v42 = [v47 preprocessWithoutXPCForHTML:v73 subject:v48 epoch:v75 category:v51 labelsWithMatchingStrings:v50];
          }
          else
          {
            v70 = (void *)MEMORY[0x1CB79B230]();
            v74 = [v7 htmlBody];
            v52 = [v7 subject];
            [v8 creationTimestamp];
            double v54 = v53;
            v55 = [(id)objc_opt_class() labelsWithMatchingStringsForMailMessage:v7];
            v42 = [(SGStructuredEventDissector *)self preprocessHTML:v74 subject:v52 epoch:v75 category:v55 labelsWithMatchingStrings:v54];
          }
          if (!v42)
          {
            v67 = sgEventsLogHandle();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CA650000, v67, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: Preprocessed document is nil", buf, 2u);
            }

            goto LABEL_79;
          }
          v72 = [v42 objectForKeyedSubscript:@"crossTags"];
          if (![v72 count])
          {
            v68 = sgEventsLogHandle();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CA650000, v68, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: Empty enrichedTaggedCharacterRanges", buf, 2u);
            }

            goto LABEL_79;
          }
          [v8 releaseDissectorLock];
          uint64_t v56 = [v8 hasEventEnrichment];
          if ((v23 & v56) == 1) {
            uint64_t v23 = [(id)objc_opt_class() eventEnrichmentContainsReverseMappedTags:v8];
          }
          v71 = (void *)MEMORY[0x1CB79B230]();
          v77 = objc_msgSend((id)objc_opt_class(), "schemaOrgAndMissingEntitiesForPreprocessed:eventClassification:fromSuggestTool:addressThreshold:pflTrainable:hasEvent:", v42, v29, v76, -[NSObject addressComponentThreshold](v12, "addressComponentThreshold"), v23, v56);
          v46 = [v77 objectForKeyedSubscript:@"schema"];
        }

        [v8 acquireDissectorLock];
        uint64_t v57 = mach_absolute_time();
        unint64_t v58 = SGMachTimeToNanoseconds(v57 - (void)v79);
        v80 = (void *)MEMORY[0x1CB79B230]();
        unint64_t v59 = v58 / 0xF4240;
        if (v46)
        {
          v84[0] = @"mergedSchema";
          v84[1] = @"diff";
          v85[0] = v46;
          v85[1] = &stru_1F24EEF20;
          v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
          v61 = sgEventsLogHandle();
          BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
          if (v25)
          {
            if (v62)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA650000, v61, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: Event found, adding shadow log", buf, 2u);
            }

            BYTE1(v69) = v78;
            LOBYTE(v69) = 1;
            objc_msgSend((id)objc_opt_class(), "logMLExtractionForSchema:mergedSchemaAndDiff:parentEntity:timingProcessingInMs:eventClassification:mailMessage:shadowExtraction:mlDefaultExtraction:", v46, v60, v8, v59, v29, v7, v69);
          }
          else
          {
            if (v62)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1CA650000, v61, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: Event found, adding ML log and enrichment", buf, 2u);
            }

            if (v78)
            {
              uint64_t v66 = [(id)objc_opt_class() mergeFallbackSchema:v46 parentEntity:v8];

              v60 = (void *)v66;
            }
            BYTE1(v69) = v78;
            LOBYTE(v69) = 0;
            objc_msgSend((id)objc_opt_class(), "logMLExtractionForSchema:mergedSchemaAndDiff:parentEntity:timingProcessingInMs:eventClassification:mailMessage:shadowExtraction:mlDefaultExtraction:", v46, v60, v8, v59, v29, v7, v69);
            [(id)objc_opt_class() addSchemaAsEnrichment:v60 inMessage:v7 parentEntity:v8 eventClassification:v29 mlDefaultExtraction:v78];
            [(id)objc_opt_class() logMLInteractions:v8 context:v9 mlDefaultExtraction:v78];
          }
        }
        else
        {
          v63 = objc_opt_class();
          v64 = [v77 objectForKeyedSubscript:@"missingEntities"];
          v65 = [v77 objectForKeyedSubscript:@"ml_summary"];
          [v63 logFailedExtractionWithClassification:v29 missingEntities:v64 mlSummary:v65 shadowExtraction:v25 timingProcessingInMs:v59 forMessage:v7 parentEntity:v8];
        }
LABEL_79:
        v39 = v75;
LABEL_80:

        goto LABEL_20;
      }
      v29 = sgEventsLogHandle();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      v34 = "SGStructuredEventDissector: Previous dissector found event, bailing";
    }
    else
    {
      v29 = sgEventsLogHandle();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      v34 = "SGStructuredEventDissector: Skipping reverse template dissector: detectStructuredEventsML is OFF and provide"
            "r is not in whitelist";
    }
    _os_log_debug_impl(&dword_1CA650000, v29, OS_LOG_TYPE_DEBUG, v34, buf, 2u);
    goto LABEL_20;
  }
  id v12 = sgEventsLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: No sender for mailMessage, bailing", buf, 2u);
  }
LABEL_21:
}

void __64__SGStructuredEventDissector_dissectMailMessage_entity_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    v6 = sgEventsLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "SGStructuredEventsDissector: FoundInEvents DU XPC call error", v9, 2u);
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

+ (void)logMLInteractions:(id)a3 context:(id)a4 mlDefaultExtraction:(BOOL)a5
{
  BOOL v22 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = [v6 enrichments];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v14 = (void *)MEMORY[0x1CB79B230]();
        v15 = [v13 duplicateKey];
        [v15 entityType];
        if (SGEntityTypeIsEvent())
        {
          char v16 = [v13 isNaturalLanguageEvent];

          if (v16) {
            goto LABEL_18;
          }
          int v17 = [v7 backpressureHazard];
          if (v17 == 1) {
            unsigned int v18 = 12;
          }
          else {
            unsigned int v18 = 0;
          }
          if (v17) {
            uint64_t v19 = v18;
          }
          else {
            uint64_t v19 = 13;
          }
          if (v22)
          {
            v20 = +[SGRTCLogging defaultLogger];
            [v20 resetInteractionsLogs];

            v21 = +[SGRTCLogging defaultLogger];
            [v21 resetInteractionsSummaryLogs];
          }
          v15 = +[SGRTCLogging defaultLogger];
          [v15 logEventInteractionForEntity:v13 interface:0 actionType:v19];
        }

LABEL_18:
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
}

+ (id)outputLogsForClassification:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"category";
  id v3 = a3;
  v4 = +[SGStructuredEventClassification describeCategory:](SGStructuredEventClassification, "describeCategory:", [v3 category]);
  v10[1] = @"usecase";
  v11[0] = v4;
  uint64_t v5 = [v3 useCase];

  id v6 = +[SGStructuredEventClassification describeUseCase:v5];
  v11[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  id v8 = (void *)[v7 mutableCopy];

  return v8;
}

+ (id)jsMessageLogsDictionaryForPrivacyAwareLogs:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = [v4 privacyAwareLogsForMLExtractions:v3];

  id v6 = (void *)[v5 mutableCopy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SGStructuredEventDissector_jsMessageLogsDictionaryForPrivacyAwareLogs___block_invoke;
  v9[3] = &unk_1E65B87D8;
  id v7 = v6;
  id v10 = v7;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __73__SGStructuredEventDissector_jsMessageLogsDictionaryForPrivacyAwareLogs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((os_variant_has_internal_diagnostics() & 1) == 0
    && [v3 rangeOfString:@"privacyAwareSubject"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 32) removeObjectForKey:v3];
  }
}

+ (id)jsMessageLogsDictionaryForMailMessage:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"domain";
  id v3 = [a3 from];
  v4 = [v3 emailAddress];
  uint64_t v5 = emailAddressDomain(v4);
  v13[0] = v5;
  v12[1] = @"assetVersion";
  id v6 = NSNumber;
  id v7 = +[SGAsset localeAsset];
  id v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "assetVersion"));
  v13[1] = v8;
  v12[2] = @"assetIdentifier";
  uint64_t v9 = +[SGAsset localeAssetIdentifier];
  v13[2] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

+ (void)logFailedExtractionWithClassification:(id)a3 missingEntities:(id)a4 mlSummary:(id)a5 shadowExtraction:(BOOL)a6 timingProcessingInMs:(unint64_t)a7 forMessage:(id)a8 parentEntity:(id)a9
{
  BOOL v41 = a6;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v39 = a4;
  id v14 = a5;
  id v43 = a8;
  id v44 = a9;
  v42 = [a1 jsMessageLogsDictionaryForMailMessage:v43];
  id v40 = v13;
  v15 = [a1 outputLogsForClassification:v13];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v52 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        BOOL v22 = [v16 objectForKeyedSubscript:v21];
        long long v23 = (void *)[[NSString alloc] initWithFormat:@"M_%@", v21];
        [v15 setObject:v22 forKeyedSubscript:v23];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v18);
  }

  long long v24 = [NSNumber numberWithBool:v41];
  [v15 setObject:v24 forKeyedSubscript:@"shadowExtraction"];

  long long v25 = [a1 eventEnrichmentFromEntity:v44];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v26 = [v25 tags];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v48;
LABEL_10:
    uint64_t v30 = 0;
    while (1)
    {
      if (*(void *)v48 != v29) {
        objc_enumerationMutation(v26);
      }
      v31 = *(void **)(*((void *)&v47 + 1) + 8 * v30);
      if ([v31 isTemplateName]) {
        break;
      }
      if (v28 == ++v30)
      {
        uint64_t v28 = [v26 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v28) {
          goto LABEL_10;
        }
        goto LABEL_16;
      }
    }
    BOOL v32 = [v31 value];

    v34 = v39;
    int v33 = v40;
    unint64_t v35 = a7;
    if (!v32) {
      goto LABEL_22;
    }
    [v15 setObject:v32 forKeyedSubscript:@"extractionTemplate"];
    v36 = [a1 jsMessageLogsDictionaryForPrivacyAwareLogs:v43];
    if (v36)
    {
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __156__SGStructuredEventDissector_logFailedExtractionWithClassification_missingEntities_mlSummary_shadowExtraction_timingProcessingInMs_forMessage_parentEntity___block_invoke;
      v45[3] = &unk_1E65B87D8;
      id v46 = v15;
      [v36 enumerateKeysAndObjectsUsingBlock:v45];
    }
  }
  else
  {
LABEL_16:
    BOOL v32 = v26;
    v34 = v39;
    int v33 = v40;
    unint64_t v35 = a7;
  }

LABEL_22:
  v37 = +[SGRTCLogging defaultLogger];
  [v37 logEventExtractionForTemplateName:@"ML" extractionStatus:3 outputExceptions:v34 outputInfos:MEMORY[0x1E4F1CBF0] jsMessageLogs:v42 jsOutputLogs:v15 timingProcessing:v35];
}

uint64_t __156__SGStructuredEventDissector_logFailedExtractionWithClassification_missingEntities_mlSummary_shadowExtraction_timingProcessingInMs_forMessage_parentEntity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

+ (void)logMLExtractionForSchema:(id)a3 mergedSchemaAndDiff:(id)a4 parentEntity:(id)a5 timingProcessingInMs:(unint64_t)a6 eventClassification:(id)a7 mailMessage:(id)a8 shadowExtraction:(BOOL)a9 mlDefaultExtraction:(BOOL)a10
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = [a1 jsMessageLogsDictionaryForMailMessage:v18];
  v20 = [a1 outputLogsForClassification:v17];
  uint64_t v21 = v20;
  BOOL v22 = @"fallbackExtraction";
  if (a10) {
    BOOL v22 = @"mlDefaultExtraction";
  }
  if (a9) {
    long long v23 = @"shadowExtraction";
  }
  else {
    long long v23 = v22;
  }
  [v20 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v23];
  long long v24 = [a1 jsMessageLogsDictionaryForPrivacyAwareLogs:v18];
  if (v24)
  {
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __178__SGStructuredEventDissector_logMLExtractionForSchema_mergedSchemaAndDiff_parentEntity_timingProcessingInMs_eventClassification_mailMessage_shadowExtraction_mlDefaultExtraction___block_invoke;
    v97[3] = &unk_1E65B87D8;
    id v98 = v21;
    [v24 enumerateKeysAndObjectsUsingBlock:v97];
  }
  unsigned int v78 = v24;
  long long v25 = v16;
  long long v26 = [a1 eventEnrichmentFromEntity:v16];
  v77 = v26;
  if (!v26)
  {
    v63 = v21;
    v64 = [v16 tags];
    v65 = [MEMORY[0x1E4F5D9F0] templateException];
    int v66 = [v64 containsObject:v65];

    uint64_t v29 = v80;
    if (v66) {
      v67 = @"Exception";
    }
    else {
      v67 = @"No Event";
    }
    v68 = v63;
    [v63 setObject:v67 forKeyedSubscript:@"templateExtractionOutput"];
    goto LABEL_53;
  }
  v83 = v21;
  unsigned int v76 = v19;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v27 = [v26 tags];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v93 objects:v103 count:16];
  uint64_t v29 = v80;
  if (!v28)
  {
    v31 = 0;
    BOOL v32 = 0;
    goto LABEL_51;
  }
  uint64_t v30 = v28;
  id v73 = v18;
  id v74 = v17;
  v31 = 0;
  BOOL v32 = 0;
  uint64_t v33 = *(void *)v94;
  do
  {
    for (uint64_t i = 0; i != v30; ++i)
    {
      if (*(void *)v94 != v33) {
        objc_enumerationMutation(v27);
      }
      unint64_t v35 = *(void **)(*((void *)&v93 + 1) + 8 * i);
      if ([v35 isSchemaOrg])
      {
        uint64_t v36 = [v35 value];
        v37 = v31;
        v31 = (void *)v36;
      }
      else
      {
        if (![v35 isTemplateName]) {
          continue;
        }
        uint64_t v38 = [v35 value];
        v37 = v32;
        BOOL v32 = (void *)v38;
      }
    }
    uint64_t v30 = [v27 countByEnumeratingWithState:&v93 objects:v103 count:16];
  }
  while (v30);

  if (v32) {
    [v83 setObject:v32 forKeyedSubscript:@"extractionTemplate"];
  }
  id v18 = v73;
  id v17 = v74;
  if (v31)
  {
    id v39 = (void *)MEMORY[0x1E4F28D90];
    id v40 = [v31 dataUsingEncoding:4];
    id v92 = 0;
    BOOL v41 = [v39 JSONObjectWithData:v40 options:0 error:&v92];
    id v27 = v92;

    if (v41 && [v41 count])
    {
      v72 = v15;
      uint64_t v42 = objc_opt_new();
      id v43 = v41;
      id v44 = (void *)v42;
      v71 = v43;
      v45 = [v43 firstObject];
      v102 = v45;
      id v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
      id v101 = v80;
      long long v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
      long long v48 = [v44 diffSchemas:v46 withExpectedSchemas:v47];

      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      v70 = v48;
      obuint64_t j = [v48 allKeys];
      uint64_t v49 = [obj countByEnumeratingWithState:&v88 objects:v100 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v89;
        uint64_t v52 = MEMORY[0x1E4F1CC38];
        do
        {
          for (uint64_t j = 0; j != v50; ++j)
          {
            if (*(void *)v89 != v51) {
              objc_enumerationMutation(obj);
            }
            long long v54 = (void *)[[NSString alloc] initWithFormat:@"schemaDiff_%@", *(void *)(*((void *)&v88 + 1) + 8 * j)];
            [v83 setObject:v52 forKeyedSubscript:v54];
          }
          uint64_t v50 = [obj countByEnumeratingWithState:&v88 objects:v100 count:16];
        }
        while (v50);
      }

      if (a10)
      {
        v55 = [v72 objectForKeyedSubscript:@"diff"];

        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        uint64_t v75 = v55;
        id obja = [v55 allKeys];
        uint64_t v56 = [obja countByEnumeratingWithState:&v84 objects:v99 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v58 = *(void *)v85;
          uint64_t v59 = MEMORY[0x1E4F1CC38];
          do
          {
            for (uint64_t k = 0; k != v57; ++k)
            {
              if (*(void *)v85 != v58) {
                objc_enumerationMutation(obja);
              }
              v61 = (void *)[[NSString alloc] initWithFormat:@"schemaFromTemplate_%@", *(void *)(*((void *)&v84 + 1) + 8 * k)];
              [v83 setObject:v59 forKeyedSubscript:v61];
            }
            uint64_t v57 = [obja countByEnumeratingWithState:&v84 objects:v99 count:16];
          }
          while (v57);
        }

        BOOL v62 = v75;
        uint64_t v29 = v80;
      }
      else
      {
        uint64_t v29 = v80;
        BOOL v62 = v70;
      }

      id v15 = v72;
      id v18 = v73;
      id v17 = v74;
      BOOL v41 = v71;
    }

LABEL_51:
    uint64_t v19 = v76;
  }
  else
  {
    uint64_t v19 = v76;
  }

  v68 = v83;
LABEL_53:
  uint64_t v69 = +[SGRTCLogging defaultLogger];
  [v69 logEventExtractionForTemplateName:@"ML" extractionStatus:0 outputExceptions:MEMORY[0x1E4F1CBF0] outputInfos:MEMORY[0x1E4F1CBF0] jsMessageLogs:v19 jsOutputLogs:v68 timingProcessing:a6];
}

uint64_t __178__SGStructuredEventDissector_logMLExtractionForSchema_mergedSchemaAndDiff_parentEntity_timingProcessingInMs_eventClassification_mailMessage_shadowExtraction_mlDefaultExtraction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

+ (BOOL)eventEnrichmentContainsReverseMappedTags:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 eventEnrichmentFromEntity:a3];
  if (v3)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v26 = v3;
    v4 = [v3 tags];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      char v7 = 0;
      uint64_t v28 = 0;
      char v27 = 0;
      char v8 = 0;
      uint64_t v9 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v4);
          }
          uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ([v11 isFieldReverseMapped]
            && ([v11 value],
                id v12 = objc_claimAutoreleasedReturnValue(),
                char v13 = [v12 isEqualToString:@"reverseMapped_EVENT_TIME__START_DATETIME"],
                v12,
                (v13 & 1) != 0))
          {
            char v7 = 1;
          }
          else if ([v11 isFieldReverseMapped] {
                 && ([v11 value],
          }
                     id v14 = objc_claimAutoreleasedReturnValue(),
                     char v15 = [v14 isEqualToString:@"reverseMapped_EVENT_LOCATION__START_ADDRESS"],
                     v14,
                     (v15 & 1) != 0))
          {
            BYTE4(v28) = 1;
          }
          else if ([v11 isFieldReverseMapped] {
                 && ([v11 value],
          }
                     id v16 = objc_claimAutoreleasedReturnValue(),
                     char v17 = [v16 isEqualToString:@"reverseMapped_EVENT_LOCATION__START_PLACE"],
                     v16,
                     (v17 & 1) != 0))
          {
            LOBYTE(v28) = 1;
          }
          else if ([v11 isFieldReverseMapped] {
                 && ([v11 value],
          }
                     id v18 = objc_claimAutoreleasedReturnValue(),
                     char v19 = [v18 isEqualToString:@"reverseMapped_TITLE__HOTEL_RESTAURANT_NAME"],
                     v18,
                     (v19 & 1) != 0))
          {
            char v27 = 1;
          }
          else if ([v11 isFieldReverseMapped])
          {
            v20 = [v11 value];
            int v21 = [v20 isEqualToString:@"reverseMapped_TITLE__MOVIE_TICKET_NAME"];

            if (v21) {
              char v8 = 1;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v6);
    }
    else
    {
      char v7 = 0;
      uint64_t v28 = 0;
      char v27 = 0;
      char v8 = 0;
    }

    if ((v28 & 0x100000000) != 0) {
      char v23 = v7 & 1;
    }
    else {
      char v23 = v27 | v8;
    }
    if (v28) {
      char v24 = v7 & 1;
    }
    else {
      char v24 = v23;
    }
    if (v7) {
      char v22 = v24;
    }
    else {
      char v22 = v7 & 1;
    }
    id v3 = v26;
  }
  else
  {
    char v22 = 0;
  }

  return v22 & 1;
}

+ (id)eventEnrichmentFromEntity:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(a3, "enrichments", 0);
  id v4 = (id)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        char v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        char v8 = [v7 duplicateKey];
        [v8 entityType];
        int IsEvent = SGEntityTypeIsEvent();

        if (IsEvent)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)addressDictionaryForAddressComponents:(id)a3
{
  v21[6] = *MEMORY[0x1E4F143B8];
  v21[0] = @"http://schema.org/PostalAddress";
  v20[0] = @"@type";
  v20[1] = @"streetAddress";
  id v3 = a3;
  uint64_t v4 = [v3 street];
  uint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = &stru_1F24EEF20;
  }
  v21[1] = v6;
  v20[2] = @"addressLocality";
  uint64_t v7 = [v3 city];
  char v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = &stru_1F24EEF20;
  }
  v21[2] = v9;
  v20[3] = @"addressRegion";
  uint64_t v10 = [v3 state];
  long long v11 = (void *)v10;
  if (v10) {
    long long v12 = (__CFString *)v10;
  }
  else {
    long long v12 = &stru_1F24EEF20;
  }
  v21[3] = v12;
  v20[4] = @"postalCode";
  uint64_t v13 = [v3 postalCode];
  long long v14 = (void *)v13;
  if (v13) {
    char v15 = (__CFString *)v13;
  }
  else {
    char v15 = &stru_1F24EEF20;
  }
  v21[4] = v15;
  v20[5] = @"addressCountry";
  uint64_t v16 = [v3 country];

  if (v16) {
    char v17 = v16;
  }
  else {
    char v17 = &stru_1F24EEF20;
  }
  v21[5] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];

  return v18;
}

+ (unint64_t)tokenCount:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = +[SGPOSTagger sharedInstance];
    uint64_t v5 = [v4 tokenizeTextContent:v3 languageHint:0];

    if ([v5 count])
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        char v8 = [v5 objectAtIndexedSubscript:v6];
        uint64_t v9 = [v8 annotationType];

        if (v9 == 3) {
          ++v7;
        }
        ++v6;
      }
      while ([v5 count] > v6);
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (unint64_t)tokenCountForPostalAddressComponents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 street];

  if (v5)
  {
    unint64_t v6 = [v4 street];
    uint64_t v5 = (char *)[a1 tokenCount:v6];
  }
  unint64_t v7 = [v4 city];

  if (v7)
  {
    char v8 = [v4 city];
    v5 += [a1 tokenCount:v8];
  }
  uint64_t v9 = [v4 state];

  if (v9)
  {
    uint64_t v10 = [v4 state];
    v5 += [a1 tokenCount:v10];
  }
  long long v11 = [v4 postalCode];

  if (v11)
  {
    long long v12 = [v4 postalCode];
    v5 += [a1 tokenCount:v12];
  }
  uint64_t v13 = [v4 country];

  if (v13)
  {
    long long v14 = [v4 country];
    v5 += [a1 tokenCount:v14];
  }
  return (unint64_t)v5;
}

+ (id)schemaPostalAddressForPostalAddressExtraction:(id)a3 addressThreshold:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 components];

  char v8 = [v6 plainText];

  if (v7)
  {
    if (!v8) {
      goto LABEL_4;
    }
    uint64_t v9 = [v6 components];
    unint64_t v10 = [a1 tokenCountForPostalAddressComponents:v9];

    long long v11 = [v6 plainText];
    unint64_t v12 = [a1 tokenCount:v11];

    uint64_t v13 = [NSNumber numberWithDouble:(double)a4 / 100.0 * (double)v12];
    LODWORD(v11) = [v13 intValue];

    if (v10 >= (int)v11)
    {
LABEL_4:
      long long v14 = [v6 components];
      char v15 = [a1 addressDictionaryForAddressComponents:v14];

      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    char v15 = [v6 plainText];
    goto LABEL_8;
  }
  char v15 = &stru_1F24EEF20;
LABEL_8:

  return v15;
}

+ (id)schemaStringForEventStatus:(unsigned __int8)a3
{
  int v3 = a3;
  id v4 = [NSString alloc];
  uint64_t v5 = @"Cancelled";
  if (!v3) {
    uint64_t v5 = @"Confirmed";
  }
  id v6 = (void *)[v4 initWithFormat:@"%@%@", @"http://schema.org/Event", v5];
  return v6;
}

+ (id)schemaStringForReservationStatus:(unsigned __int8)a3
{
  int v3 = a3;
  id v4 = [NSString alloc];
  uint64_t v5 = @"Cancelled";
  if (!v3) {
    uint64_t v5 = @"Confirmed";
  }
  id v6 = (void *)[v4 initWithFormat:@"%@%@", @"http://schema.org/Reservation", v5];
  return v6;
}

+ (id)schemaStringForDateComponents:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 date], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [v4 timeZone];

    if (v6)
    {
      unint64_t v7 = objc_opt_new();
      char v8 = [v4 timeZone];
      [v7 setTimeZone:v8];
    }
    else
    {
      unint64_t v7 = objc_opt_new();
      if ([v4 hour] == 0x7FFFFFFFFFFFFFFFLL
        && [v4 minute] == 0x7FFFFFFFFFFFFFFFLL
        && [v4 second] == 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v10 = @"yyyy-MM-dd";
      }
      else
      {
        unint64_t v10 = @"yyyy-MM-dd'T'HH:mm:ss";
      }
      [v7 setDateFormat:v10];
    }
    long long v11 = [v4 date];
    uint64_t v9 = [v7 stringFromDate:v11];
  }
  else
  {
    uint64_t v9 = &stru_1F24EEF20;
  }

  return v9;
}

+ (id)plainTextStringsByLabelInTaggedCharacterRanges:(id)a3 inPlainText:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v25 = a4;
  id v6 = objc_opt_new();
  if ([v5 count])
  {
    uint64_t v7 = 0;
    id v26 = v5;
    do
    {
      uint64_t v27 = v7;
      char v8 = [v5 objectAtIndexedSubscript:v7];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v9 = [v8 tags];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            id v15 = [NSString alloc];
            uint64_t v16 = [v8 annotationTypeUniqueIdentifier];
            char v17 = (void *)[v15 initWithFormat:@"%@_%@", v16, v14];

            id v18 = [v6 objectForKeyedSubscript:v17];

            if (!v18)
            {
              char v19 = objc_opt_new();
              [v6 setObject:v19 forKeyedSubscript:v17];
            }
            v20 = [v6 objectForKeyedSubscript:v17];
            uint64_t v21 = [v8 range];
            objc_msgSend(v20, "addIndexesInRange:", v21, v22);
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v11);
      }

      id v5 = v26;
      uint64_t v7 = v27 + 1;
    }
    while ([v26 count] > (unint64_t)(v27 + 1));
  }
  char v23 = +[SGExtractionDocument candidatesForLabelsWithPlainTextIndexSets:v6 inPlainText:v25];

  return v23;
}

+ (id)annotateContent:(id)a3 withLabel:(id)a4 forMatchingString:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_new();
  if (![v7 length] || !objc_msgSend(v9, "length"))
  {
    char v23 = sgEventsLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v26 = 0;
      id v25 = "SGStructuredEventDissector: annotateContent: empty content or string passed";
      goto LABEL_21;
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!v8)
  {
    char v23 = sgEventsLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v26 = 0;
      id v25 = "SGStructuredEventDissector: annotateContent: nil label passed";
LABEL_21:
      _os_log_error_impl(&dword_1CA650000, v23, OS_LOG_TYPE_ERROR, v25, v26, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  uint64_t v11 = objc_msgSend(v7, "rangeOfString:options:range:", v9, 1, 0, objc_msgSend(v7, "length"));
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = v11;
    uint64_t v14 = v12;
    do
    {
      id v15 = [SGTaggedCharacterRange alloc];
      v27[0] = v8;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      char v17 = objc_msgSend(v7, "substringWithRange:", v13, v14);
      id v18 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v15, "initWithAnnotationType:tags:range:text:", 6, v16, v13, v14, v17);

      if (v18)
      {
        [v10 addObject:v18];
      }
      else
      {
        char v19 = sgEventsLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v26 = 0;
          _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: annotateContent: Unable to create taggedCharacterRange from result", v26, 2u);
        }
      }
      uint64_t v20 = v13 + v14;
      uint64_t v21 = [v7 length] - (v13 + v14);

      uint64_t v13 = objc_msgSend(v7, "rangeOfString:options:range:", v9, 1, v20, v21);
      uint64_t v14 = v22;
    }
    while (v13 != 0x7FFFFFFFFFFFFFFFLL);
  }
LABEL_15:

  return v10;
}

+ (id)labelsWithMatchingStringsForMailMessage:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [v4 from];
  id v7 = [v6 name];

  if (v7)
  {
    id v8 = [v6 name];
    v32[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    [v5 setObject:v9 forKeyedSubscript:@"is_sender_name"];
  }
  uint64_t v10 = [v6 emailAddress];

  if (v10)
  {
    uint64_t v11 = [v6 emailAddress];
    long long v31 = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    [v5 setObject:v12 forKeyedSubscript:@"is_sender_email"];

    uint64_t v13 = [v6 emailAddress];
    uint64_t v14 = emailAddressDomain(v13);

    if (v14)
    {
      long long v30 = v14;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
      [v5 setObject:v15 forKeyedSubscript:@"is_sender_domain"];
    }
  }
  uint64_t v16 = [v4 to];
  char v17 = [v16 firstObject];

  id v18 = [v17 name];

  if (v18)
  {
    char v19 = [v17 name];
    long long v29 = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    [v5 setObject:v20 forKeyedSubscript:@"is_recipient_name"];
  }
  uint64_t v21 = [v17 emailAddress];

  if (v21)
  {
    uint64_t v22 = [v17 emailAddress];
    long long v28 = v22;
    char v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    [v5 setObject:v23 forKeyedSubscript:@"is_recipient_email"];
  }
  char v24 = [v4 subject];

  if (v24)
  {
    id v25 = [v4 subject];
    id v26 = [a1 annotationMatchingStringsForSubject:v25];

    if ([v26 count]) {
      [v5 setObject:v26 forKeyedSubscript:@"is_present_in_subject"];
    }
  }
  return v5;
}

+ (id)annotationMatchingStringsForSubject:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = +[SGPOSTagger sharedInstance];
  id v6 = [v5 tokenizeTextContent:v3 languageHint:0];

  id v7 = objc_opt_new();
  if ([v6 count])
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = [v6 objectAtIndexedSubscript:v8];
      uint64_t v10 = [v9 annotationType];

      if (v10 == 2)
      {
        uint64_t v11 = [v6 objectAtIndexedSubscript:v8];
        uint64_t v12 = [v11 tags];
        uint64_t v13 = [v12 firstObject];

        if (v13
          && (([v13 isEqualToString:@"NN"] & 1) != 0
           || [v13 isEqualToString:@"NNP"]))
        {
          [v7 addIndex:v8];
        }
      }
      ++v8;
    }
    while ([v6 count] > v8);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__SGStructuredEventDissector_annotationMatchingStringsForSubject___block_invoke;
  v20[3] = &unk_1E65BEAA0;
  id v21 = v6;
  id v22 = v3;
  id v14 = v4;
  id v23 = v14;
  id v15 = v3;
  id v16 = v6;
  [v7 enumerateRangesUsingBlock:v20];
  char v17 = v23;
  id v18 = v14;

  return v18;
}

uint64_t __66__SGStructuredEventDissector_annotationMatchingStringsForSubject___block_invoke(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (a3 >= 2)
  {
    uint64_t v4 = result;
    uint64_t v5 = +[SGExtractionDocument textRangeForIndexRange:inTaggedCharacterRanges:](SGExtractionDocument, "textRangeForIndexRange:inTaggedCharacterRanges:", a2, a3, *(void *)(result + 32));
    uint64_t v7 = objc_msgSend(*(id *)(v4 + 40), "substringWithRange:", v5, v6);
    if (v7) {
      [*(id *)(v4 + 48) addObject:v7];
    }
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (id)tupleWithError:(id)a3 label:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F93BB8];
  id v6 = a4;
  id v7 = [v5 alloc];
  if (a3) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CC38];
  }
  id v9 = (void *)[v7 initWithFirst:v8 second:v6];

  return v9;
}

+ (id)tupleWithEntity:(id)a3 label:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F93BB8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[[v5 alloc] initWithFirst:v7 second:v6];

  return v8;
}

+ (id)nilEntities:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v17 = (id)objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = [v9 first];
        if (!v10) {
          goto LABEL_9;
        }
        uint64_t v11 = v10;
        uint64_t v12 = [v9 first];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v9 first];
          char v14 = [v13 hasExtraction];

          if (v14) {
            continue;
          }
LABEL_9:
          id v15 = [v9 second];

          if (v15)
          {
            uint64_t v11 = [v9 second];
            [v17 addObject:v11];
          }
          else
          {
            uint64_t v11 = sgEventsLogHandle();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: No name for missing entity", buf, 2u);
            }
          }
          goto LABEL_14;
        }

LABEL_14:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  return v17;
}

+ (id)preprocessWithoutXPCForHTML:(id)a3 subject:(id)a4 epoch:(double)a5 category:(id)a6 labelsWithMatchingStrings:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_opt_new();
  id v17 = [v16 parseHTML:v15];

  id v18 = [a1 preprocessDomParserResult:v17 subject:v14 epoch:v13 category:v12 labelsWithMatchingStrings:a5];

  return v18;
}

+ (id)preprocessDomParserResult:(id)a3 subject:(id)a4 epoch:(double)a5 category:(id)a6 labelsWithMatchingStrings:(id)a7
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = v14;
  if (v11)
  {
    v70 = v14;
    id v71 = v13;
    id v68 = v12;
    [v11 insertSubject:v12];
    id v16 = [v11 plainText];
    id v17 = objc_opt_new();
    id v69 = v11;
    id v18 = [v11 taggedCharacterRanges];
    [v17 addObjectsFromArray:v18];

    uint64_t v19 = [MEMORY[0x1E4F5DFA0] detectLanguageFromText:v16];
    long long v20 = +[SGPOSTagger sharedInstance];
    long long v21 = +[SGStructuredEventExtractionModel sharedInstance];
    long long v22 = [v21 gazetteer];
    v67 = (void *)v19;
    uint64_t v23 = [v20 tokenizeTextContent:v16 languageHint:v19 gazetteer:v22];

    context = v17;
    int v66 = (void *)v23;
    [v17 addObjectsFromArray:v23];
    uint64_t v24 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:a5];
    id v25 = +[SGDataDetectorMatch detectionsInPlainText:v16 baseDate:v24];

    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    obuint64_t j = v25;
    uint64_t v26 = [obj countByEnumeratingWithState:&v91 objects:v104 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      id v75 = *(id *)v92;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(id *)v92 != v75) {
            objc_enumerationMutation(obj);
          }
          long long v29 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          long long v30 = (void *)MEMORY[0x1CB79B230]();
          uint64_t v31 = [v29 valueRange];
          uint64_t v33 = -[NSObject substringWithRange:](v16, "substringWithRange:", v31, v32);
          uint64_t v34 = [SGTaggedCharacterRange alloc];
          unsigned int v35 = [v29 matchType];
          uint64_t v36 = @"SGDDMatchOther";
          if (v35 <= 8) {
            uint64_t v36 = off_1E65B96D8[v35];
          }
          v37 = v36;
          v103 = v37;
          uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
          uint64_t v39 = [v29 valueRange];
          BOOL v41 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v34, "initWithAnnotationType:tags:range:text:", 1, v38, v39, v40, v33);

          [context addObject:v41];
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v91 objects:v104 count:16];
      }
      while (v27);
    }

    uint64_t v42 = objc_opt_new();
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v43 = context;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v87 objects:v102 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v88 != v46) {
            objc_enumerationMutation(v43);
          }
          long long v48 = *(void **)(*((void *)&v87 + 1) + 8 * j);
          if ([v48 annotationType] == 3) {
            [v42 addObject:v48];
          }
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v87 objects:v102 count:16];
      }
      while (v45);
    }
    v65 = v42;

    uint64_t v49 = [SGTaggedCharacterRange alloc];
    uint64_t v50 = (void *)[[NSString alloc] initWithFormat:@"cat_%@", v71];
    v100 = v50;
    uint64_t v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
    uint64_t v52 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v49, "initWithAnnotationType:tags:range:text:", 5, v51, 0, 0, &stru_1F24EEF20);
    id v101 = v52;
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v76 = v70;
    uint64_t v74 = [v76 countByEnumeratingWithState:&v83 objects:v99 count:16];
    if (v74)
    {
      uint64_t v73 = *(void *)v84;
      do
      {
        for (uint64_t k = 0; k != v74; ++k)
        {
          if (*(void *)v84 != v73) {
            objc_enumerationMutation(v76);
          }
          uint64_t v54 = *(void *)(*((void *)&v83 + 1) + 8 * k);
          contexta = (void *)MEMORY[0x1CB79B230]();
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          v55 = [v76 objectForKeyedSubscript:v54];
          uint64_t v56 = [v55 countByEnumeratingWithState:&v79 objects:v98 count:16];
          if (v56)
          {
            uint64_t v57 = v56;
            uint64_t v58 = *(void *)v80;
            do
            {
              for (uint64_t m = 0; m != v57; ++m)
              {
                if (*(void *)v80 != v58) {
                  objc_enumerationMutation(v55);
                }
                v60 = [(id)objc_opt_class() annotateContent:v16 withLabel:v54 forMatchingString:*(void *)(*((void *)&v79 + 1) + 8 * m)];
                if ([v60 count]) {
                  [v43 addObjectsFromArray:v60];
                }
              }
              uint64_t v57 = [v55 countByEnumeratingWithState:&v79 objects:v98 count:16];
            }
            while (v57);
          }
        }
        uint64_t v74 = [v76 countByEnumeratingWithState:&v83 objects:v99 count:16];
      }
      while (v74);
    }

    v61 = +[SGTaggedCharacterRange mergeTaggedCharacterRanges:v43 usingBaseTaggedCharacterRanges:v65 extraTags:v64 tagOverrides:0 alignWithGroundTruth:0];
    v96[0] = @"plainText";
    v96[1] = @"crossTags";
    v97[0] = v16;
    v97[1] = v61;
    v96[2] = @"tags";
    v96[3] = @"ddSGDetections";
    v97[2] = v43;
    v97[3] = obj;
    BOOL v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:4];

    id v12 = v68;
    id v11 = v69;
    id v15 = v70;
    id v13 = v71;
  }
  else
  {
    id v16 = sgEventsLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v16, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: nil domParserResult", buf, 2u);
    }
    BOOL v62 = 0;
  }

  return v62;
}

+ (id)schemaOrgAndMissingEntitiesForPreprocessed:(id)a3 eventClassification:(id)a4 fromSuggestTool:(BOOL)a5 addressThreshold:(unint64_t)a6 pflTrainable:(BOOL)a7 hasEvent:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a5;
  v207[6] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a3;
  id v14 = [v13 objectForKeyedSubscript:@"crossTags"];
  id v15 = +[SGStructuredEventExtractionModel sharedInstance];
  id v16 = [v15 modelInferences:v14 pflTraining:v9 hasEvent:v8];

  id v17 = objc_opt_new();
  id v18 = [SGStructuredEventDocument alloc];
  uint64_t v19 = [v13 objectForKeyedSubscript:@"plainText"];
  long long v20 = v12;
  uint64_t v21 = [v12 category];
  long long v22 = [v13 objectForKeyedSubscript:@"ddSGDetections"];

  uint64_t v23 = v18;
  BOOL v24 = v10;
  id v25 = [(SGStructuredEventDocument *)v23 initWithPlainText:v19 category:v21 dataDetectorMatches:v22 enrichedTaggedCharacterRanges:v14 modelOutput:v16 fromSuggestTool:v10];

  if (![(SGStructuredEventDocument *)v25 detectedEventPolarity])
  {
    [v17 setObject:&unk_1F2536938 forKeyedSubscript:@"missingEntities"];
    unsigned int v35 = [(SGStructuredEventDocument *)v25 modelOutputSummary];
    [v17 setObject:v35 forKeyedSubscript:@"ml_summary"];

    long long v29 = v20;
    goto LABEL_115;
  }
  id v171 = 0;
  uint64_t v26 = [(SGStructuredEventDocument *)v25 detectedReservationIdWithError:&v171];
  id v27 = v171;
  uint64_t v28 = [(SGStructuredEventDocument *)v25 detectedEventName];
  id v170 = 0;
  uint64_t v153 = [(SGStructuredEventDocument *)v25 detectedStartAddressWithError:&v170];
  id v162 = v170;
  id v169 = 0;
  v154 = [(SGStructuredEventDocument *)v25 detectedStartPlaceWithError:&v169];
  id v155 = v169;
  v166 = [(SGStructuredEventDocument *)v25 detectedStartDateComponents];
  v152 = (void *)v26;
  v163 = (void *)v28;
  long long v29 = v20;
  id v151 = v27;
  switch([(SGStructuredEventDocument *)v25 category])
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 9u:
      id v30 = [NSString alloc];
      uint64_t v31 = +[SGStructuredEventClassification describeCategory:[(SGStructuredEventDocument *)v25 category]];
      uint64_t v32 = (void *)[v30 initWithFormat:@"Unsupported category: %@", v31];
      v172 = v32;
      uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v172 count:1];

      uint64_t v34 = 0;
      goto LABEL_87;
    case 4u:
      v149 = v16;
      BOOL v147 = v24;
      v143 = [(SGStructuredEventDocument *)v25 detectedEndDateComponents];
      if ([v20 isCancelled] && v28)
      {
        if (v26) {
          goto LABEL_44;
        }
        v37 = [v166 date];

        if (v37) {
          goto LABEL_44;
        }
      }
      else if (!v28)
      {
        goto LABEL_78;
      }
      uint64_t v51 = [v166 date];
      if (v51)
      {
        uint64_t v52 = (void *)v51;
        long long v53 = [v143 date];

        if (v53)
        {
          if (!v27 && !v162)
          {
LABEL_44:
            v199[0] = @"@context";
            v199[1] = @"@type";
            v200[0] = @"http://schema.org";
            v200[1] = @"http://schema.org/LodgingReservation";
            v199[2] = @"checkinTime";
            v137 = [a1 schemaStringForDateComponents:v166];
            v200[2] = v137;
            v199[3] = @"checkoutTime";
            uint64_t v54 = (uint64_t)v143;
            v140 = [a1 schemaStringForDateComponents:v143];
            v200[3] = v140;
            v199[4] = @"reservationStatus";
            uint64_t v55 = objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v20, "isCancelled"));
            uint64_t v56 = v55;
            uint64_t v57 = &stru_1F24EEF20;
            if (v26) {
              uint64_t v57 = (__CFString *)v26;
            }
            v200[4] = v55;
            v200[5] = v57;
            v199[5] = @"reservationId";
            v199[6] = @"reservationFor";
            v197[0] = @"@type";
            v197[1] = @"name";
            v198[0] = @"http://schema.org/LodgingBusiness";
            v198[1] = v163;
            v197[2] = @"address";
            uint64_t v36 = (void *)v153;
            uint64_t v58 = [a1 schemaPostalAddressForPostalAddressExtraction:v153 addressThreshold:a6];
            v198[2] = v58;
            uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v198 forKeys:v197 count:3];
            v200[6] = v59;
            uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v200 forKeys:v199 count:7];

            goto LABEL_69;
          }
        }
      }
LABEL_78:
      v157 = [a1 tupleWithError:v27 label:@"reservationId"];
      v196[0] = v157;
      v141 = [a1 tupleWithEntity:v163 label:@"reservationName"];
      v196[1] = v141;
      v138 = [a1 tupleWithError:v162 label:@"address"];
      v196[2] = v138;
      v136 = [v166 date];
      v77 = [a1 tupleWithEntity:v136 label:@"startDate"];
      v196[3] = v77;
      unsigned int v78 = [v143 date];
      long long v79 = [a1 tupleWithEntity:v78 label:@"endDate"];
      v196[4] = v79;
      long long v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:5];
      uint64_t v33 = [a1 nilEntities:v80];

      long long v81 = sgEventsLogHandle();
      if (!os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
        goto LABEL_81;
      }
      long long v82 = objc_msgSend(v33, "_pas_componentsJoinedByString:", @", ");
      *(_DWORD *)buf = 138412290;
      v202 = v82;
      long long v83 = "SGStructuredEventDissector: Missing entities for hotel extraction: %@";
      goto LABEL_119;
    case 5u:
      v150 = v16;
      BOOL v148 = v24;
      v144 = [(SGStructuredEventDocument *)v25 detectedEndDateComponents];
      id v168 = 0;
      v140 = [(SGStructuredEventDocument *)v25 detectedEndAddressWithError:&v168];
      id v38 = v168;
      id v167 = 0;
      uint64_t v133 = [(SGStructuredEventDocument *)v25 detectedEndPlaceWithError:&v167];
      id v134 = v167;
      v137 = v38;
      if (![v20 isCancelled]) {
        goto LABEL_15;
      }
      uint64_t v39 = [v20 providerName];
      if (!v39) {
        goto LABEL_15;
      }
      uint64_t v40 = v39;
      if (v27)
      {
        BOOL v41 = [v166 date];

        if (!v41)
        {
LABEL_15:
          uint64_t v42 = [v20 providerName];
          if (v42)
          {
            id v43 = (void *)v42;
            uint64_t v44 = [v166 date];
            if (v44)
            {
              uint64_t v45 = (void *)v44;
              uint64_t v46 = [v144 date];

              long long v29 = v20;
              if (!v46 || v27 || v162 || v155 || v134 || v38) {
                goto LABEL_89;
              }
              goto LABEL_93;
            }

            long long v29 = v20;
          }
LABEL_89:
          v161 = [a1 tupleWithError:v27 label:@"reservationId"];
          v180[0] = v161;
          v131 = [a1 tupleWithError:v162 label:@"address"];
          v180[1] = v131;
          v129 = [a1 tupleWithError:v38 label:@"endAddress"];
          v180[2] = v129;
          v127 = [a1 tupleWithError:v155 label:@"place"];
          v180[3] = v127;
          v125 = [a1 tupleWithError:v134 label:@"endPlace"];
          v180[4] = v125;
          v123 = [v166 date];
          v121 = [a1 tupleWithEntity:v123 label:@"startDate"];
          v180[5] = v121;
          v120 = [v144 date];
          v102 = [a1 tupleWithEntity:v120 label:@"endDate"];
          v180[6] = v102;
          v103 = [v29 providerName];
          uint64_t v104 = [a1 tupleWithEntity:v103 label:@"providerName"];
          v180[7] = v104;
          uint64_t v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:8];
          uint64_t v33 = [a1 nilEntities:v105];

          v106 = sgEventsLogHandle();
          v132 = v106;
          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
          {
            v119 = objc_msgSend(v33, "_pas_componentsJoinedByString:", @", ");
            *(_DWORD *)buf = 138412290;
            v202 = v119;
            _os_log_error_impl(&dword_1CA650000, v106, OS_LOG_TYPE_ERROR, "SGStructuredEventDissector: Missing entities for car extraction: %@", buf, 0xCu);
          }
          uint64_t v34 = 0;
          BOOL v24 = v148;
          long long v29 = v20;
          v67 = v144;
          v107 = (void *)v133;
          goto LABEL_106;
        }
      }
      else
      {
      }
LABEL_93:
      v187[0] = @"@context";
      v187[1] = @"@type";
      v188[0] = @"http://schema.org";
      v188[1] = @"http://schema.org/RentalCarReservation";
      if (v26) {
        v108 = (__CFString *)v26;
      }
      else {
        v108 = &stru_1F24EEF20;
      }
      v188[2] = v108;
      v187[2] = @"reservationId";
      v187[3] = @"reservationStatus";
      v132 = objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v29, "isCancelled"));
      v188[3] = v132;
      v187[4] = @"pickupTime";
      v130 = [a1 schemaStringForDateComponents:v166];
      v188[4] = v130;
      v187[5] = @"pickupLocation";
      v186[0] = @"http://schema.org/Place";
      v185[0] = @"@type";
      v185[1] = @"address";
      uint64_t v109 = [a1 schemaPostalAddressForPostalAddressExtraction:v153 addressThreshold:a6];
      v185[2] = @"name";
      v110 = v154;
      if (!v154) {
        v110 = &stru_1F24EEF20;
      }
      v128 = (void *)v109;
      v186[1] = v109;
      v186[2] = v110;
      v126 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v186 forKeys:v185 count:3];
      v188[5] = v126;
      v187[6] = @"dropoffTime";
      v124 = [a1 schemaStringForDateComponents:v144];
      v188[6] = v124;
      v187[7] = @"dropoffLocation";
      v184[0] = @"http://schema.org/Place";
      v183[0] = @"@type";
      v183[1] = @"address";
      int v122 = [v140 hasExtraction];
      if (v122)
      {
        v111 = [a1 schemaPostalAddressForPostalAddressExtraction:v140 addressThreshold:a6];
        v112 = &stru_1F24EEF20;
      }
      else
      {
        v112 = &stru_1F24EEF20;
        v111 = &stru_1F24EEF20;
      }
      v183[2] = @"name";
      v107 = (void *)v133;
      if (v133) {
        v112 = (__CFString *)v133;
      }
      v184[1] = v111;
      v184[2] = v112;
      v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v184 forKeys:v183 count:3];
      v188[7] = v113;
      v187[8] = @"provider";
      v182[0] = @"http://schema.org/Organization";
      v181[0] = @"type";
      v181[1] = @"name";
      v114 = [v20 providerName];
      v182[1] = v114;
      v115 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v182 forKeys:v181 count:2];
      v188[8] = v115;
      uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v188 forKeys:v187 count:9];

      if (v122) {
      uint64_t v33 = 0;
      }
      BOOL v24 = v148;
      long long v29 = v20;
      v67 = v144;
LABEL_106:

      id v16 = v150;
      uint64_t v36 = (void *)v153;
      id v68 = v134;
LABEL_107:

      if (v34) {
        [v17 setObject:v34 forKeyedSubscript:@"schema"];
      }
      goto LABEL_109;
    case 6u:
      v149 = v16;
      v143 = [(SGStructuredEventDocument *)v25 detectedEndDateComponents];
      BOOL v147 = v24;
      if ([v20 isCancelled] && v28)
      {
        if (!v27
          || ([v166 date], long long v47 = objc_claimAutoreleasedReturnValue(), v47, v47))
        {
LABEL_52:
          v194[0] = @"@context";
          v194[1] = @"@type";
          v195[0] = @"http://schema.org";
          v195[1] = @"http://schema.org/EventReservation";
          v194[2] = @"reservationStatus";
          uint64_t v61 = objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v20, "isCancelled"));
          if (v26) {
            BOOL v62 = (__CFString *)v26;
          }
          else {
            BOOL v62 = &stru_1F24EEF20;
          }
          v137 = (void *)v61;
          v195[2] = v61;
          v195[3] = v62;
          v194[3] = @"reservationId";
          v194[4] = @"reservationFor";
          v192[0] = @"@type";
          v192[1] = @"name";
          v193[0] = @"http://schema.org/Event";
          v193[1] = v163;
          v192[2] = @"startDate";
          v140 = [a1 schemaStringForDateComponents:v166];
          v193[2] = v140;
          v192[3] = @"endDate";
          uint64_t v135 = [a1 schemaStringForDateComponents:v143];
          v193[3] = v135;
          v192[4] = @"location";
          v190[0] = @"@type";
          v190[1] = @"name";
          v63 = v154;
          if (!v154) {
            v63 = &stru_1F24EEF20;
          }
          v191[0] = @"http://schema.org/Place";
          v191[1] = v63;
          v190[2] = @"address";
          uint64_t v36 = (void *)v153;
          v64 = [a1 schemaPostalAddressForPostalAddressExtraction:v153 addressThreshold:a6];
          v191[2] = v64;
          v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v191 forKeys:v190 count:3];
          v193[4] = v65;
          int v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v193 forKeys:v192 count:5];
          v195[4] = v66;
          uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v195 forKeys:v194 count:5];

          v67 = v143;
          id v68 = (void *)v135;
          goto LABEL_70;
        }
      }
      else if (!v28)
      {
        goto LABEL_80;
      }
      v60 = [v166 date];

      if (v60 && !v27 && !v162 && !v155) {
        goto LABEL_52;
      }
LABEL_80:
      v158 = [a1 tupleWithError:v27 label:@"reservationId"];
      v189[0] = v158;
      v142 = [a1 tupleWithEntity:v163 label:@"reservationName"];
      v189[1] = v142;
      long long v84 = [a1 tupleWithError:v155 label:@"place"];
      v189[2] = v84;
      v139 = [a1 tupleWithError:v162 label:@"address"];
      v189[3] = v139;
      long long v85 = [v166 date];
      long long v86 = [a1 tupleWithEntity:v85 label:@"startDate"];
      v189[4] = v86;
      long long v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:5];
      uint64_t v33 = [a1 nilEntities:v87];

      long long v81 = sgEventsLogHandle();
      if (!os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
        goto LABEL_81;
      }
      long long v82 = objc_msgSend(v33, "_pas_componentsJoinedByString:", @", ");
      *(_DWORD *)buf = 138412290;
      v202 = v82;
      long long v83 = "SGStructuredEventDissector: Missing entities for ticket extraction: %@";
LABEL_119:
      _os_log_error_impl(&dword_1CA650000, v81, OS_LOG_TYPE_ERROR, v83, buf, 0xCu);

LABEL_81:
      BOOL v24 = v147;
      long long v29 = v20;

      uint64_t v34 = 0;
      goto LABEL_86;
    case 7u:
      v149 = v16;
      BOOL v147 = v24;
      if ([v20 isCancelled] && v28)
      {
        id v48 = a1;
        if (!v27
          || ([v166 date], uint64_t v49 = objc_claimAutoreleasedReturnValue(), v49, v49))
        {
LABEL_63:
          v178[0] = @"@context";
          v178[1] = @"@type";
          v179[0] = @"http://schema.org";
          v179[1] = @"http://schema.org/EventReservation";
          if (v26) {
            v70 = (__CFString *)v26;
          }
          else {
            v70 = &stru_1F24EEF20;
          }
          v179[2] = v70;
          v178[2] = @"reservationId";
          v178[3] = @"reservationStatus";
          objc_msgSend(v48, "schemaStringForEventStatus:", objc_msgSend(v20, "isCancelled"));
          uint64_t v54 = v71 = v48;
          v179[3] = v54;
          v178[4] = @"reservationFor";
          v176[0] = @"@type";
          v176[1] = @"name";
          v177[0] = @"http://schema.org/ScreeningEvent";
          v177[1] = v163;
          v176[2] = @"startDate";
          v137 = [v71 schemaStringForDateComponents:v166];
          v177[2] = v137;
          v176[3] = @"location";
          v174[0] = @"@type";
          v174[1] = @"name";
          v72 = v154;
          if (!v154) {
            v72 = &stru_1F24EEF20;
          }
          v175[0] = @"http://schema.org/Place";
          v175[1] = v72;
          v174[2] = @"address";
          uint64_t v73 = v71;
          uint64_t v36 = (void *)v153;
          v140 = [v73 schemaPostalAddressForPostalAddressExtraction:v153 addressThreshold:a6];
          v175[2] = v140;
          uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v175 forKeys:v174 count:3];
          v177[3] = v56;
          uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v177 forKeys:v176 count:4];
          v179[4] = v58;
          uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v179 forKeys:v178 count:5];
LABEL_69:

          id v68 = (void *)v56;
          v67 = (void *)v54;
LABEL_70:
          uint64_t v33 = 0;
          BOOL v24 = v147;
          id v16 = v149;
          goto LABEL_107;
        }
      }
      else
      {
        id v48 = a1;
        if (!v28) {
          goto LABEL_82;
        }
      }
      id v69 = [v166 date];

      if (v69 && !v27 && !v162 && !v155) {
        goto LABEL_63;
      }
LABEL_82:
      uint64_t v88 = objc_opt_class();
      id v89 = v27;
      long long v90 = (void *)v88;
      v165 = [v48 tupleWithError:v89 label:@"reservationId"];
      v173[0] = v165;
      v159 = [v48 tupleWithEntity:v163 label:@"reservationName"];
      v173[1] = v159;
      v145 = [v48 tupleWithError:v162 label:@"address"];
      v173[2] = v145;
      long long v91 = [v48 tupleWithError:v155 label:@"place"];
      v173[3] = v91;
      long long v92 = [v166 date];
      long long v93 = [v48 tupleWithEntity:v92 label:@"startDate"];
      v173[4] = v93;
      long long v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:v173 count:5];
      uint64_t v33 = [v90 nilEntities:v94];

      long long v95 = sgEventsLogHandle();
      if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      long long v96 = objc_msgSend(v33, "_pas_componentsJoinedByString:", @", ");
      *(_DWORD *)buf = 138412290;
      v202 = v96;
      v97 = "SGStructuredEventDissector: Missing entities for movie extraction: %@";
      goto LABEL_121;
    case 8u:
      if ([v20 isCancelled] && v28)
      {
        if (v26) {
          goto LABEL_75;
        }
        uint64_t v50 = [v166 date];

        if (v50) {
          goto LABEL_75;
        }
      }
      else if (!v28)
      {
        goto LABEL_84;
      }
      uint64_t v74 = [v166 date];

      if (v74 && !v27 && !v162)
      {
LABEL_75:
        v206[0] = @"@context";
        v206[1] = @"@type";
        v207[0] = @"http://schema.org";
        v207[1] = @"http://schema.org/FoodEstablishmentReservation";
        id v75 = &stru_1F24EEF20;
        if (v26) {
          id v75 = (__CFString *)v26;
        }
        v207[2] = v75;
        v206[2] = @"reservationId";
        v206[3] = @"reservationStatus";
        v67 = objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v20, "isCancelled"));
        v207[3] = v67;
        v206[4] = @"reservationFor";
        v204[0] = @"@type";
        v204[1] = @"name";
        v205[0] = @"http://schema.org/FoodEstablishment";
        v205[1] = v163;
        v204[2] = @"address";
        uint64_t v36 = (void *)v153;
        v137 = [a1 schemaPostalAddressForPostalAddressExtraction:v153 addressThreshold:a6];
        v205[2] = v137;
        v140 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v205 forKeys:v204 count:3];
        v207[4] = v140;
        v206[5] = @"startTime";
        uint64_t v76 = [a1 schemaStringForDateComponents:v166];
        v207[5] = v76;
        uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v207 forKeys:v206 count:6];
        id v68 = (void *)v76;
        uint64_t v33 = 0;
        goto LABEL_107;
      }
LABEL_84:
      v149 = v16;
      BOOL v147 = v24;
      v160 = [a1 tupleWithEntity:v163 label:@"reservationName"];
      v203[0] = v160;
      v146 = [a1 tupleWithError:v162 label:@"address"];
      v203[1] = v146;
      id v98 = [a1 tupleWithError:v27 label:@"reservationId"];
      v203[2] = v98;
      v99 = [v166 date];
      v100 = [a1 tupleWithEntity:v99 label:@"startDate"];
      v203[3] = v100;
      id v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v203 count:4];
      uint64_t v33 = [a1 nilEntities:v101];

      long long v95 = sgEventsLogHandle();
      if (!os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
        goto LABEL_85;
      }
      long long v96 = objc_msgSend(v33, "_pas_componentsJoinedByString:", @", ");
      *(_DWORD *)buf = 138412290;
      v202 = v96;
      v97 = "SGStructuredEventDissector: Missing entities for restaurant extraction: %@";
LABEL_121:
      _os_log_error_impl(&dword_1CA650000, v95, OS_LOG_TYPE_ERROR, v97, buf, 0xCu);

LABEL_85:
      uint64_t v34 = 0;
      BOOL v24 = v147;
      long long v29 = v20;
LABEL_86:
      id v16 = v149;
LABEL_87:
      uint64_t v36 = (void *)v153;
LABEL_109:
      if (v33)
      {
        [v17 setObject:v33 forKeyedSubscript:@"missingEntities"];
      }
      id v27 = v151;
LABEL_112:
      v116 = [(SGStructuredEventDocument *)v25 modelOutputSummary];
      [v17 setObject:v116 forKeyedSubscript:@"ml_summary"];

      if (v24)
      {
        v117 = [(SGStructuredEventDocument *)v25 predictedStringsFromModelOutput];
        [v17 setObject:v117 forKeyedSubscript:@"ml_plaintext_prediction"];
      }
LABEL_115:

      return v17;
    default:
      uint64_t v34 = 0;
      long long v29 = v20;
      uint64_t v36 = (void *)v153;
      goto LABEL_112;
  }
}

+ (id)schemaOrgAndMissingEntitiesForDUFoundInEvent:(id)a3 eventClassification:(id)a4 fromSuggestTool:(BOOL)a5
{
  v174[7] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = objc_opt_new();
  if (([v7 detectedEventPolarity] & 1) == 0)
  {
    [v9 setObject:&unk_1F2536920 forKeyedSubscript:@"missingEntities"];
    goto LABEL_151;
  }
  v128 = [v7 reservationIdError];
  uint64_t v10 = [v7 reservationId];
  uint64_t v11 = [v7 hotelName];
  id v12 = [v7 movieName];
  v127 = [v7 startAddressError];
  id v13 = [v7 startAddressComponents];
  id v14 = [v7 startAddress];
  v121 = [v7 endAddressError];
  v120 = [v7 endAddressComponents];
  v119 = [v7 endAddress];
  uint64_t v15 = [v7 startPlaceError];
  v124 = [v7 startPlace];
  int v122 = [v7 endPlaceError];
  v118 = [v7 endPlace];
  uint64_t v129 = [v7 startDate];
  v126 = [v7 endDate];
  v125 = [v7 guestName];
  v117 = (void *)v11;
  v123 = (void *)v15;
  uint64_t v116 = v10;
  switch([v8 category])
  {
    case 4u:
      v114 = v12;
      v115 = v13;
      if ([v8 isCancelled] && v11 && v10 | v129 || v11 && v129 && v126 && !v128 && !v127)
      {
        v164[0] = @"@context";
        v164[1] = @"@type";
        v165[0] = @"http://schema.org";
        v165[1] = @"http://schema.org/LodgingReservation";
        id v16 = (__CFString *)v129;
        if (!v129) {
          id v16 = &stru_1F24EEF20;
        }
        v164[2] = @"checkinTime";
        v164[3] = @"checkoutTime";
        id v17 = v126;
        if (!v126) {
          id v17 = &stru_1F24EEF20;
        }
        v165[2] = v16;
        v165[3] = v17;
        v164[4] = @"reservationStatus";
        uint64_t v18 = objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v8, "isCancelled"));
        uint64_t v19 = (void *)v18;
        if (v10) {
          long long v20 = (__CFString *)v10;
        }
        else {
          long long v20 = &stru_1F24EEF20;
        }
        v165[4] = v18;
        v165[5] = v20;
        v164[5] = @"reservationId";
        v164[6] = @"reservationFor";
        v162[0] = @"@type";
        v162[1] = @"name";
        v163[0] = @"http://schema.org/LodgingBusiness";
        v163[1] = v11;
        v162[2] = @"address";
        if (v14) {
          uint64_t v21 = v14;
        }
        else {
          uint64_t v21 = &stru_1F24EEF20;
        }
        if (v13) {
          uint64_t v21 = v13;
        }
        v163[2] = v21;
        long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v163 forKeys:v162 count:3];
        v165[6] = v22;
        v164[7] = @"underName";
        v160[0] = @"@type";
        v160[1] = @"name";
        uint64_t v23 = v125;
        if (!v125) {
          uint64_t v23 = &stru_1F24EEF20;
        }
        v161[0] = @"http://schema.org/Person";
        v161[1] = v23;
        BOOL v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v161 forKeys:v160 count:2];
        v165[7] = v24;
        id v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = v165;
        id v27 = v164;
        uint64_t v28 = 8;
        goto LABEL_133;
      }
      v111 = [a1 tupleWithError:v128 label:@"reservationId"];
      v159[0] = v111;
      long long v84 = [a1 tupleWithEntity:v11 label:@"hotelName"];
      v159[1] = v84;
      long long v85 = [a1 tupleWithError:v127 label:@"address"];
      v159[2] = v85;
      long long v86 = [a1 tupleWithEntity:v129 label:@"startDate"];
      v159[3] = v86;
      long long v87 = [a1 tupleWithEntity:v126 label:@"endDate"];
      v159[4] = v87;
      uint64_t v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v159 count:5];
      long long v29 = [a1 nilEntities:v88];

      id v48 = sgEventsLogHandle();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_146;
      }
      v77 = objc_msgSend(v29, "_pas_componentsJoinedByString:", @", ");
      *(_DWORD *)buf = 138412290;
      id v167 = v77;
      unsigned int v78 = "SGStructuredEventDissector: Missing entities for hotel extraction: %@";
      goto LABEL_145;
    case 5u:
      v114 = v12;
      if ([v8 isCancelled]
        && ([v8 providerName], (uint64_t v31 = objc_claimAutoreleasedReturnValue()) != 0)
        && ((v31, !v128) || v129)
        || ([v8 providerName], uint64_t v32 = objc_claimAutoreleasedReturnValue(), v32, v32)
        && v129
        && v126
        && !v128
        && !v127
        && !v123
        && !v122
        && !v121)
      {
        v148[0] = @"@context";
        v148[1] = @"@type";
        v149[0] = @"http://schema.org";
        v149[1] = @"http://schema.org/RentalCarReservation";
        uint64_t v33 = (__CFString *)v10;
        if (!v10) {
          uint64_t v33 = &stru_1F24EEF20;
        }
        v149[2] = v33;
        v148[2] = @"reservationId";
        v148[3] = @"reservationStatus";
        uint64_t v34 = objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v8, "isCancelled"));
        uint64_t v105 = (void *)v34;
        unsigned int v35 = (__CFString *)v129;
        if (!v129) {
          unsigned int v35 = &stru_1F24EEF20;
        }
        v149[3] = v34;
        v149[4] = v35;
        v148[4] = @"pickupTime";
        v148[5] = @"pickupLocation";
        v146[0] = @"@type";
        v146[1] = @"address";
        if (v14) {
          uint64_t v36 = v14;
        }
        else {
          uint64_t v36 = &stru_1F24EEF20;
        }
        if (v13) {
          uint64_t v36 = v13;
        }
        v147[0] = @"http://schema.org/Place";
        v147[1] = v36;
        v146[2] = @"name";
        v37 = v124;
        if (!v124) {
          v37 = &stru_1F24EEF20;
        }
        v147[2] = v37;
        uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v147 forKeys:v146 count:3];
        v103 = (void *)v38;
        uint64_t v39 = v126;
        if (!v126) {
          uint64_t v39 = &stru_1F24EEF20;
        }
        v149[5] = v38;
        v149[6] = v39;
        v148[6] = @"dropoffTime";
        v148[7] = @"dropoffLocation";
        v144[0] = @"@type";
        v144[1] = @"address";
        uint64_t v40 = v119;
        if (!v119) {
          uint64_t v40 = &stru_1F24EEF20;
        }
        if (v120) {
          uint64_t v40 = v120;
        }
        v145[0] = @"http://schema.org/Place";
        v145[1] = v40;
        v144[2] = @"name";
        BOOL v41 = v118;
        if (!v118) {
          BOOL v41 = &stru_1F24EEF20;
        }
        v145[2] = v41;
        uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v145 forKeys:v144 count:3];
        v149[7] = v42;
        v148[8] = @"provider";
        v143[0] = @"http://schema.org/Organization";
        v142[0] = @"type";
        v142[1] = @"name";
        id v43 = [v8 providerName];
        v143[1] = v43;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v143 forKeys:v142 count:2];
        uint64_t v109 = v14;
        v45 = uint64_t v44 = v13;
        v149[8] = v45;
        v148[9] = @"underName";
        v140[0] = @"@type";
        v140[1] = @"name";
        uint64_t v46 = v125;
        if (!v125) {
          uint64_t v46 = &stru_1F24EEF20;
        }
        v141[0] = @"http://schema.org/Person";
        v141[1] = v46;
        long long v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v141 forKeys:v140 count:2];
        v149[9] = v47;
        id v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v149 forKeys:v148 count:10];

        id v13 = v44;
        id v14 = v109;

        goto LABEL_134;
      }
      v115 = v13;
      v110 = [a1 tupleWithError:v128 label:@"reservationId"];
      v139[0] = v110;
      v107 = [a1 tupleWithError:v127 label:@"address"];
      v139[1] = v107;
      uint64_t v104 = [a1 tupleWithError:v121 label:@"endAddress"];
      v139[2] = v104;
      v102 = [a1 tupleWithError:v123 label:@"place"];
      v139[3] = v102;
      id v101 = [a1 tupleWithError:v122 label:@"endPlace"];
      v139[4] = v101;
      long long v79 = [a1 tupleWithEntity:v129 label:@"startDate"];
      v139[5] = v79;
      long long v80 = [a1 tupleWithEntity:v126 label:@"endDate"];
      v139[6] = v80;
      long long v81 = [v8 providerName];
      long long v82 = [a1 tupleWithEntity:v81 label:@"providerName"];
      v139[7] = v82;
      long long v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:8];
      long long v29 = [a1 nilEntities:v83];

      id v48 = sgEventsLogHandle();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_146;
      }
      v77 = objc_msgSend(v29, "_pas_componentsJoinedByString:", @", ");
      *(_DWORD *)buf = 138412290;
      id v167 = v77;
      unsigned int v78 = "SGStructuredEventDissector: Missing entities for car extraction: %@";
      goto LABEL_145;
    case 6u:
      v115 = v13;
      v114 = v12;
      if ([v8 isCancelled] && v12 && (!v128 || v129)
        || v12 && v129 && !v128 && !v127 && !v15)
      {
        v157[0] = @"@context";
        v157[1] = @"@type";
        v158[0] = @"http://schema.org";
        v158[1] = @"http://schema.org/EventReservation";
        v157[2] = @"reservationStatus";
        uint64_t v49 = objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v8, "isCancelled"));
        v106 = (void *)v49;
        if (v10) {
          uint64_t v50 = (__CFString *)v10;
        }
        else {
          uint64_t v50 = &stru_1F24EEF20;
        }
        v158[2] = v49;
        v158[3] = v50;
        v157[3] = @"reservationId";
        v157[4] = @"reservationFor";
        v155[0] = @"@type";
        v155[1] = @"name";
        v156[0] = @"http://schema.org/Event";
        v156[1] = v12;
        uint64_t v51 = (__CFString *)v129;
        if (!v129) {
          uint64_t v51 = &stru_1F24EEF20;
        }
        v155[2] = @"startDate";
        v155[3] = @"endDate";
        uint64_t v52 = v126;
        if (!v126) {
          uint64_t v52 = &stru_1F24EEF20;
        }
        v156[2] = v51;
        v156[3] = v52;
        v155[4] = @"location";
        v153[0] = @"@type";
        v153[1] = @"name";
        long long v53 = v124;
        if (!v124) {
          long long v53 = &stru_1F24EEF20;
        }
        v154[0] = @"http://schema.org/Place";
        v154[1] = v53;
        v153[2] = @"address";
        if (v14) {
          uint64_t v54 = v14;
        }
        else {
          uint64_t v54 = &stru_1F24EEF20;
        }
        if (v13) {
          uint64_t v54 = v13;
        }
        v154[2] = v54;
        uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v154 forKeys:v153 count:3];
        v156[4] = v55;
        uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v156 forKeys:v155 count:5];
        v158[4] = v56;
        v157[5] = @"underName";
        v151[0] = @"@type";
        v151[1] = @"name";
        uint64_t v57 = v125;
        if (!v125) {
          uint64_t v57 = &stru_1F24EEF20;
        }
        v152[0] = @"http://schema.org/Person";
        v152[1] = v57;
        uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:v151 count:2];
        v158[5] = v58;
        id v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v158 forKeys:v157 count:6];

        id v13 = v115;
        id v12 = v114;
        goto LABEL_111;
      }
      v112 = [a1 tupleWithError:v128 label:@"reservationId"];
      v150[0] = v112;
      id v89 = [a1 tupleWithEntity:v12 label:@"movieName"];
      v150[1] = v89;
      long long v90 = [a1 tupleWithError:v15 label:@"place"];
      v150[2] = v90;
      long long v91 = [a1 tupleWithError:v127 label:@"address"];
      v150[3] = v91;
      long long v92 = [a1 tupleWithEntity:v129 label:@"startDate"];
      v150[4] = v92;
      long long v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:5];
      long long v29 = [a1 nilEntities:v93];

      id v48 = sgEventsLogHandle();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_146;
      }
      v77 = objc_msgSend(v29, "_pas_componentsJoinedByString:", @", ");
      *(_DWORD *)buf = 138412290;
      id v167 = v77;
      unsigned int v78 = "SGStructuredEventDissector: Missing entities for ticket extraction: %@";
      goto LABEL_145;
    case 7u:
      v115 = v13;
      if ([v8 isCancelled] && v12 && (!v128 || v129)
        || v12 && v129 && !v128 && !v127 && !v15)
      {
        v137[0] = @"@context";
        v137[1] = @"@type";
        v138[0] = @"http://schema.org";
        v138[1] = @"http://schema.org/EventReservation";
        uint64_t v59 = (__CFString *)v10;
        if (!v10) {
          uint64_t v59 = &stru_1F24EEF20;
        }
        v138[2] = v59;
        v137[2] = @"reservationId";
        v137[3] = @"reservationStatus";
        v106 = objc_msgSend(a1, "schemaStringForEventStatus:", objc_msgSend(v8, "isCancelled"));
        v138[3] = v106;
        v137[4] = @"reservationFor";
        v135[0] = @"@type";
        v135[1] = @"name";
        v136[0] = @"http://schema.org/ScreeningEvent";
        v136[1] = v12;
        v60 = (__CFString *)v129;
        if (!v129) {
          v60 = &stru_1F24EEF20;
        }
        v136[2] = v60;
        v135[2] = @"startDate";
        v135[3] = @"location";
        v133[0] = @"@type";
        v133[1] = @"name";
        uint64_t v61 = v124;
        if (!v124) {
          uint64_t v61 = &stru_1F24EEF20;
        }
        v134[0] = @"http://schema.org/Place";
        v134[1] = v61;
        v133[2] = @"address";
        if (v14) {
          BOOL v62 = v14;
        }
        else {
          BOOL v62 = &stru_1F24EEF20;
        }
        if (v13) {
          BOOL v62 = v13;
        }
        v134[2] = v62;
        uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v134 forKeys:v133 count:3];
        v136[3] = v55;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v136 forKeys:v135 count:4];
        v64 = v63 = v12;
        v138[4] = v64;
        v137[5] = @"underName";
        v131[0] = @"@type";
        v131[1] = @"name";
        v65 = v125;
        if (!v125) {
          v65 = &stru_1F24EEF20;
        }
        v132[0] = @"http://schema.org/Person";
        v132[1] = v65;
        int v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:v131 count:2];
        v138[5] = v66;
        id v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v138 forKeys:v137 count:6];

        id v13 = v115;
        id v12 = v63;
LABEL_111:

        id v30 = [v48 sg_deepCopyWithoutEmptySchemaObjects];
        long long v29 = 0;
        goto LABEL_147;
      }
      v108 = objc_opt_class();
      v113 = [a1 tupleWithError:v128 label:@"reservationId"];
      v114 = v12;
      v130[0] = v113;
      long long v94 = [a1 tupleWithEntity:v12 label:@"movieName"];
      v130[1] = v94;
      long long v95 = [a1 tupleWithError:v127 label:@"address"];
      v130[2] = v95;
      long long v96 = [a1 tupleWithError:v15 label:@"place"];
      v130[3] = v96;
      v97 = [a1 tupleWithEntity:v129 label:@"startDate"];
      v130[4] = v97;
      id v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:5];
      long long v29 = [v108 nilEntities:v98];

      id v48 = sgEventsLogHandle();
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_146;
      }
      v77 = objc_msgSend(v29, "_pas_componentsJoinedByString:", @", ");
      *(_DWORD *)buf = 138412290;
      id v167 = v77;
      unsigned int v78 = "SGStructuredEventDissector: Missing entities for movie extraction: %@";
      goto LABEL_145;
    case 8u:
      v114 = v12;
      v115 = v13;
      if ([v8 isCancelled] && v11)
      {
        if (!(v10 | v129)) {
          goto LABEL_135;
        }
LABEL_120:
        v173[0] = @"@context";
        v173[1] = @"@type";
        v174[0] = @"http://schema.org";
        v174[1] = @"http://schema.org/FoodEstablishmentReservation";
        if (v10) {
          v67 = (__CFString *)v10;
        }
        else {
          v67 = &stru_1F24EEF20;
        }
        v174[2] = v67;
        v173[2] = @"reservationId";
        v173[3] = @"reservationStatus";
        uint64_t v19 = objc_msgSend(a1, "schemaStringForReservationStatus:", objc_msgSend(v8, "isCancelled"));
        void v174[3] = v19;
        v173[4] = @"reservationFor";
        v171[0] = @"@type";
        v171[1] = @"name";
        v172[0] = @"http://schema.org/FoodEstablishment";
        v172[1] = v11;
        v171[2] = @"address";
        if (v14) {
          id v68 = v14;
        }
        else {
          id v68 = &stru_1F24EEF20;
        }
        if (v13) {
          id v68 = v13;
        }
        v172[2] = v68;
        uint64_t v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v172 forKeys:v171 count:3];
        long long v22 = (void *)v69;
        v70 = (__CFString *)v129;
        if (!v129) {
          v70 = &stru_1F24EEF20;
        }
        v174[4] = v69;
        v174[5] = v70;
        void v173[5] = @"startTime";
        v173[6] = @"underName";
        v169[0] = @"@type";
        v169[1] = @"name";
        id v71 = v125;
        if (!v125) {
          id v71 = &stru_1F24EEF20;
        }
        v170[0] = @"http://schema.org/Person";
        v170[1] = v71;
        BOOL v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v170 forKeys:v169 count:2];
        v174[6] = v24;
        id v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = v174;
        id v27 = v173;
        uint64_t v28 = 7;
LABEL_133:
        id v48 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:v28];

LABEL_134:
        id v30 = [v48 sg_deepCopyWithoutEmptySchemaObjects];
        long long v29 = 0;
        id v12 = v114;
        goto LABEL_147;
      }
      if (v11 && v129 && !v128 && !v127) {
        goto LABEL_120;
      }
LABEL_135:
      v72 = [a1 tupleWithEntity:v11 label:@"hotelName"];
      v168[0] = v72;
      uint64_t v73 = [a1 tupleWithError:v127 label:@"address"];
      v168[1] = v73;
      uint64_t v74 = [a1 tupleWithError:v128 label:@"reservationId"];
      v168[2] = v74;
      id v75 = [a1 tupleWithEntity:v129 label:@"startDate"];
      v168[3] = v75;
      uint64_t v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v168 count:4];
      long long v29 = [a1 nilEntities:v76];

      id v48 = sgEventsLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v77 = objc_msgSend(v29, "_pas_componentsJoinedByString:", @", ");
        *(_DWORD *)buf = 138412290;
        id v167 = v77;
        unsigned int v78 = "SGStructuredEventDissector: Missing entities for restaurant extraction: %@";
LABEL_145:
        _os_log_error_impl(&dword_1CA650000, v48, OS_LOG_TYPE_ERROR, v78, buf, 0xCu);
      }
LABEL_146:
      id v30 = 0;
      id v12 = v114;
      id v13 = v115;
LABEL_147:

      uint64_t v10 = v116;
LABEL_148:
      [v9 setObject:v30 forKeyedSubscript:@"schema"];
      [v9 setObject:v29 forKeyedSubscript:@"missingEntities"];
      v99 = sgEventsLogHandle();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        id v167 = v9;
        _os_log_impl(&dword_1CA650000, v99, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: foundInEventResult result schema %{private}@", buf, 0xCu);
      }

LABEL_151:
      return v9;
    default:
      long long v29 = 0;
      id v30 = 0;
      goto LABEL_148;
  }
}

+ (id)schemaOrgAndMissingEntitiesForPreprocessed:(id)a3 eventClassification:(id)a4 fromSuggestTool:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  BOOL v9 = [(id)objc_opt_class() schemaOrgAndMissingEntitiesForPreprocessed:v8 eventClassification:v7 fromSuggestTool:v5 addressThreshold:0 pflTrainable:0 hasEvent:0];

  return v9;
}

+ (void)addSchemaAsEnrichment:(id)a3 inMessage:(id)a4 parentEntity:(id)a5 eventClassification:(id)a6 mlDefaultExtraction:(BOOL)a7
{
  BOOL v38 = a7;
  v51[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v40 = a6;
  id v13 = objc_opt_new();
  unsigned int v35 = v10;
  uint64_t v39 = [v10 objectForKeyedSubscript:@"mergedSchema"];
  v51[0] = v39;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  uint64_t v34 = v13;
  BOOL v41 = v11;
  uint64_t v15 = [v13 enrichmentsFromSchemas:v14 inMessage:v11 parentEntity:v12];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v15;
  uint64_t v42 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v42)
  {
    uint64_t v37 = *(void *)v44;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v44 != v37) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v43 + 1) + 8 * v16);
        uint64_t v18 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v19 = [MEMORY[0x1E4F5D9F0] extractedFromTemplateWithName:@"ML"];
        [v17 addTag:v19];

        long long v20 = [MEMORY[0x1E4F5D9F0] extractedFromTemplateWithShortName:@"ML"];
        [v17 addTag:v20];

        uint64_t v21 = [v41 from];
        long long v22 = [v21 emailAddress];
        uint64_t v23 = emailAddressDomain(v22);

        if (v23)
        {
          BOOL v24 = [MEMORY[0x1E4F5D9F0] domain:v23];
          [v17 addTag:v24];
        }
        id v25 = [v12 duplicateKey];
        uint64_t v26 = [v25 bundleId];

        id v27 = objc_alloc(MEMORY[0x1E4F5DA18]);
        uint64_t v28 = +[SGStructuredEventClassification describeCategory:](SGStructuredEventClassification, "describeCategory:", [v40 category]);
        uint64_t v49 = v39;
        long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
        id v30 = (void *)[v27 initWithType:1 categoryDescription:v28 originBundleId:v26 confidence:v29 schemaOrg:0 participants:0 eventActivities:1.0];

        uint64_t v31 = [v30 toJsonString];
        if (v31)
        {
          uint64_t v32 = [MEMORY[0x1E4F5D9F0] eventMetadata:v31];
          [v17 addTag:v32];
        }
        else
        {
          uint64_t v32 = sgLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v48 = v30;
            _os_log_error_impl(&dword_1CA650000, v32, OS_LOG_TYPE_ERROR, "Failed to convert object to JSON: %@", buf, 0xCu);
          }
        }

        if (v38) {
          [v12 addOrReplaceEventEnrichment:v17];
        }
        else {
          [v12 addEnrichment:v17];
        }
        uint64_t v33 = sgEventsLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA650000, v33, OS_LOG_TYPE_DEFAULT, "SGStructuredEventDissector: Added enrichment", buf, 2u);
        }

        ++v16;
      }
      while (v42 != v16);
      uint64_t v42 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v42);
  }
}

+ (id)mergeFallbackSchema:(id)a3 parentEntity:(id)a4
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v37[0] = @"mergedSchema";
  v37[1] = @"diff";
  v38[0] = v6;
  v38[1] = &stru_1F24EEF20;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  if ([v7 hasEventEnrichment])
  {
    BOOL v9 = [a1 eventEnrichmentFromEntity:v7];
    id v10 = v9;
    if (v9)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v11 = [v9 tags];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v31;
LABEL_5:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * v15);
          if ([v16 isSchemaOrg]) {
            break;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
            if (v13) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        id v17 = [v16 value];

        if (!v17) {
          goto LABEL_18;
        }
        uint64_t v18 = (void *)MEMORY[0x1E4F28D90];
        uint64_t v19 = [v17 dataUsingEncoding:4];
        id v29 = 0;
        long long v20 = [v18 JSONObjectWithData:v19 options:0 error:&v29];
        id v21 = v29;

        if (v20 && [v20 count])
        {
          id v28 = v21;
          long long v22 = objc_opt_new();
          id v35 = v6;
          uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
          BOOL v24 = [v20 firstObject];
          uint64_t v34 = v24;
          id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
          uint64_t v27 = [v22 mergeSchemas:v23 withExpectedSchemas:v25];

          id v8 = (void *)v27;
          id v21 = v28;
        }
      }
      else
      {
LABEL_11:
        id v17 = v11;
      }
    }
LABEL_18:
  }
  return v8;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken3 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken3, &__block_literal_global_39);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_16345;
  return v2;
}

void __44__SGStructuredEventDissector_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_16345;
  sharedInstance__pasExprOnceResult_16345 = v1;
}

@end