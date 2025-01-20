@interface SGExtractionDissector
+ (BOOL)emailIsForwardOrReply:(id)a3;
+ (id)addParams:(id)a3 toParameterizedString:(id)a4;
+ (id)addParams:(id)a3 toParameterizedString:(id)a4 allowAlternatives:(BOOL)a5;
+ (id)addressDictionaryToString:(id)a3;
+ (id)subjectFromMailMessage:(id)a3;
- (BOOL)_areAllOutputTemplatesSchemaOrg:(id)a3;
- (BOOL)_wasMessageReceivedMoreThanAWeekAgo:(id)a3;
- (BOOL)checkCompletenessOfOutputEvent:(id)a3;
- (BOOL)checkHybridMLSupportForSenderOfMail:(id)a3;
- (BOOL)checkMLExtractionSupportForMailLocale:(id)a3;
- (BOOL)checkMLSupportForMailCategory:(unsigned __int8)a3;
- (BOOL)checkMLSupportForMailWithEventClassification:(id)a3;
- (BOOL)containsDateTextMessage:(id)a3;
- (BOOL)exceedsMaxHTMLContentLength:(unint64_t)a3;
- (BOOL)isSenderRelevant:(id)a3;
- (BOOL)isStructuredEventCandidateForURL:(id)a3 title:(id)a4;
- (BOOL)mlExtractionEnabledForTextMessage:(id)a3;
- (BOOL)requiredFieldsMissingForOutput:(id)a3;
- (BOOL)requiredFieldsMissingForOutputItems:(id)a3;
- (BOOL)shouldDownloadFull:(id)a3;
- (BOOL)shouldProcessTextMessage:(id)a3;
- (SGExtractionDissector)init;
- (double)_timeIntervalAfterReceivingMessage:(id)a3;
- (id)DUFoundInEventResultForMail:(id)a3;
- (id)_ensureHtmlIsString:(id)a3;
- (id)convertDUOutputToSchemas:(id)a3;
- (id)convertMailMessageToDUDocument:(id)a3;
- (id)convertTextMessageToDUDocument:(id)a3;
- (id)diffSchemas:(id)a3 withExpectedSchemas:(id)a4;
- (id)enrichmentsFromSchemas:(id)a3 inMessage:(id)a4 parentEntity:(id)a5;
- (id)enrichmentsFromSchemas:(id)a3 inTextMessage:(id)a4 parentEntity:(id)a5;
- (id)entityForOutputItem:(id)a3 parentEntity:(id)a4 outputExceptions:(id)a5 outputInfos:(id)a6;
- (id)entityForOutputItem:(id)a3 parentEntity:(id)a4 outputExceptions:(id)a5 outputInfos:(id)a6 interaction:(id)a7;
- (id)entityForOutputItem:(id)a3 withSiblings:(id)a4 parentEntity:(id)a5 outputExceptions:(id)a6 outputInfos:(id)a7 interaction:(id)a8;
- (id)entityForOutputItem:(id)a3 withSiblings:(id)a4 parentEntity:(id)a5 outputExceptions:(id)a6 outputInfos:(id)a7 interaction:(id)a8 tagPartialEvent:(BOOL)a9;
- (id)eventActivitiesForReservationWithReference:(id)a3 inParentEntity:(id)a4 interaction:(id)a5;
- (id)eventActivitiesForReservationWithSchema:(id)a3 enrichment:(id)a4;
- (id)eventClassificationForMailMessage:(id)a3;
- (id)eventClassificationWithoutXPCForMailMessage:(id)a3;
- (id)eventExtractionFromMail:(id)a3;
- (id)eventsFromSchemaOrgItems:(id)a3;
- (id)extractMissingValueFromMLForMail:(id)a3 schema:(id)a4 fromSuggestTool:(BOOL)a5 withFiEMLResults:(id)a6;
- (id)extractMissingValuesFromMLForMail:(id)a3 outputItems:(id)a4 fromSuggestTool:(BOOL)a5;
- (id)extractMissingValuesFromMLForMail:(id)a3 outputItems:(id)a4 fromSuggestTool:(BOOL)a5 withFiEMLResults:(id)a6;
- (id)extractSchemaFromMLForMail:(id)a3 fromSuggestTool:(BOOL)a4 withEventClassification:(id)a5 withFiEMLResults:(id)a6;
- (id)flightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5;
- (id)getAndRemoveItemReferencesFromSchemas:(id)a3;
- (id)getFlightReferencesAndReservationId:(id)a3;
- (id)getSenderNameOnContacts:(id)a3;
- (id)jsDictForResolveCandidates:(id)a3 forCategory:(id)a4 label:(id)a5 rawIndexSet:(id)a6 taggedCharacterRanges:(id)a7;
- (id)jsonLdOutputFromMailMessage:(id)a3;
- (id)jsonLdOutputFromMailMessage:(id)a3 schema:(id)a4;
- (id)jsonLdOutputFromPackedJSEntity:(id)a3;
- (id)jsonLdOutputFromTextMessage:(id)a3;
- (id)jsonLdOutputFromURL:(id)a3 title:(id)a4 payload:(id)a5 extractionDate:(id)a6;
- (id)mergeSchemas:(id)a3 withExpectedSchemas:(id)a4;
- (id)outputFromLLMDissectionOfMailMessage:(id)a3;
- (id)outputFromPackedJSMailMessage:(id)a3;
- (id)outputFromPackedJSSchema:(id)a3;
- (id)outputFromPackedJSTextMessage:(id)a3;
- (id)outputFromSchemas:(id)a3 inMessage:(id)a4;
- (id)packedJSInteractionFromInteraction:(id)a3 bundleIdentifier:(id)a4 creationTimestamp:(double)a5;
- (id)packedJSMailMessageFromMailMessage:(id)a3;
- (id)packedJSMailMessageFromMailMessage:(id)a3 context:(id)a4;
- (id)packedJSSchemaFromSchemaOrgItems:(id)a3;
- (id)packedJSTextMessageFromTextMessage:(id)a3;
- (id)packedJSURLFromURL:(id)a3 title:(id)a4 payload:(id)a5;
- (id)packedJSURLFromURL:(id)a3 title:(id)a4 payload:(id)a5 creationTimestamp:(double)a6;
- (id)parseHTML:(id)a3;
- (id)privacyAwareLogsForMLExtractions:(id)a3;
- (id)resolveCandidates:(id)a3 forCategory:(id)a4 label:(id)a5 rawIndexSet:(id)a6 taggedCharacterRanges:(id)a7;
- (id)resolveCandidatesWithoutXPC:(id)a3 forCategory:(id)a4 label:(id)a5 rawIndexSet:(id)a6 taggedCharacterRanges:(id)a7;
- (id)resolveSenderEmailAddressOnKnosis:(id)a3;
- (id)reverseMapMailMessage:(id)a3 withPreprocessedHTML:(id)a4 forCategory:(id)a5 withSchemExpectation:(id)a6;
- (id)serializeTextMessageForFIE:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_addEnrichmentsToEntityForOutput:(id)a3 entity:(id)a4 startTime:(unint64_t)a5 backPressureHazard:(int)a6;
- (void)_addEnrichmentsToEntityForOutput:(id)a3 interaction:(id)a4 entity:(id)a5 startTime:(unint64_t)a6 backPressureHazard:(int)a7;
- (void)_addEnrichmentsToEntityForOutputItems:(id)a3 exceptions:(id)a4 jsMessageLogs:(id)a5 interaction:(id)a6 entity:(id)a7 startTime:(unint64_t)a8 backPressureHazard:(int)a9 tagPartialEvent:(BOOL)a10;
- (void)_dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5;
- (void)_dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5;
- (void)addEnrichmentsToEntityForOutputItems:(id)a3 exceptions:(id)a4 jsMessageLogs:(id)a5 interaction:(id)a6 entity:(id)a7 startTime:(unint64_t)a8 backPressureHazard:(int)a9;
- (void)addInteractionTagsToEnrichment:(id)a3 inEntity:(id)a4 interaction:(id)a5;
- (void)addSchemaAsEnrichment:(id)a3 inMessage:(id)a4 parentEntity:(id)a5 eventClassification:(id)a6;
- (void)dealloc;
- (void)dissectInteraction:(id)a3 entity:(id)a4 context:(id)a5;
- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5;
- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5;
- (void)dissectURL:(id)a3 title:(id)a4 htmlPayload:(id)a5 entity:(id)a6;
- (void)fillReverseTemplateSchema:(id)a3 usingDUFoundInEvent:(id)a4 eventClassification:(id)a5 fromSuggestTool:(BOOL)a6;
@end

@implementation SGExtractionDissector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->knosisService, 0);
  objc_storeStrong((id *)&self->_ddScannerLock, 0);
  objc_storeStrong((id *)&self->_classifierCache, 0);
  objc_storeStrong((id *)&self->_reverseTemplateJSNoXPC, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (double)_timeIntervalAfterReceivingMessage:(id)a3
{
  v3 = [a3 date];
  v4 = [MEMORY[0x1E4F1C9C8] now];
  [v4 timeIntervalSinceDate:v3];
  double v6 = v5;

  return v6;
}

- (BOOL)_wasMessageReceivedMoreThanAWeekAgo:(id)a3
{
  [(SGExtractionDissector *)self _timeIntervalAfterReceivingMessage:a3];
  return v3 / 86400.0 > 7.0;
}

- (void)addSchemaAsEnrichment:(id)a3 inMessage:(id)a4 parentEntity:(id)a5 eventClassification:(id)a6
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v35 = a6;
  v37 = v10;
  v47[0] = v10;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  v36 = v11;
  v14 = [(SGExtractionDissector *)self enrichmentsFromSchemas:v13 inMessage:v11 parentEntity:v12];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v14;
  uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v38)
  {
    uint64_t v34 = *(void *)v40;
    *(void *)&long long v15 = 138412290;
    long long v32 = v15;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v39 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1CB79B230]();
        v19 = [v36 from];
        v20 = [v19 emailAddress];
        v21 = emailAddressDomain(v20);

        if (v21)
        {
          v22 = [MEMORY[0x1E4F5D9F0] domain:v21];
          [v17 addTag:v22];
        }
        v23 = objc_msgSend(v12, "duplicateKey", v32);
        v24 = [v23 bundleId];

        id v25 = objc_alloc(MEMORY[0x1E4F5DA18]);
        v26 = +[SGStructuredEventClassification describeCategory:](SGStructuredEventClassification, "describeCategory:", [v35 category]);
        v45 = v37;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
        v28 = (void *)[v25 initWithType:1 categoryDescription:v26 originBundleId:v24 confidence:v27 schemaOrg:0 participants:0 eventActivities:1.0];

        v29 = [v28 toJsonString];
        if (v29)
        {
          v30 = [MEMORY[0x1E4F5D9F0] eventMetadata:v29];
          [v17 addTag:v30];
        }
        else
        {
          v30 = sgLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v32;
            v44 = v28;
            _os_log_error_impl(&dword_1CA650000, v30, OS_LOG_TYPE_ERROR, "Failed to convert object to JSON: %@", buf, 0xCu);
          }
        }

        [v12 addEnrichment:v17];
        v31 = sgEventsLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA650000, v31, OS_LOG_TYPE_DEFAULT, "Added enrichment", buf, 2u);
        }

        ++v16;
      }
      while (v38 != v16);
      uint64_t v38 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v38);
  }
}

- (BOOL)checkCompletenessOfOutputEvent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"jsOutputLogs"];
  double v5 = [v4 objectForKeyedSubscript:@"outputUsecase"];

  [v5 isEqualToString:@"cancelled"];
  double v6 = [v3 objectForKeyedSubscript:@"schemas"];
  v7 = [v3 objectForKeyedSubscript:@"category"];
  v8 = objc_opt_new();
  v9 = [v8 getSchemaCreatorForEventString:v7];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (!objc_msgSend(v9, "checkCompletenessOfSchema:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17))
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (void)fillReverseTemplateSchema:(id)a3 usingDUFoundInEvent:(id)a4 eventClassification:(id)a5 fromSuggestTool:(BOOL)a6
{
  v293[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_new();
  if (([v9 detectedEventPolarity] & 1) == 0)
  {
    [v11 setObject:&unk_1F2536AE8 forKeyedSubscript:@"missingEntities"];
    goto LABEL_239;
  }
  uint64_t v12 = [v9 reservationIdError];
  uint64_t v13 = [v9 reservationId];
  v14 = [v9 hotelName];
  v259 = [v9 movieName];
  BOOL v15 = [v9 startAddressError];
  v263 = [v9 startAddressComponents];
  v258 = [v9 startAddress];
  v254 = [v9 endAddressError];
  v256 = [v9 endAddressComponents];
  v253 = [v9 endAddress];
  v261 = [v9 startPlaceError];
  v260 = [v9 startPlace];
  v257 = [v9 endPlaceError];
  v255 = [v9 endPlace];
  v264 = [v9 startDate];
  v262 = [v9 endDate];
  v265 = [v9 guestName];
  v251 = v13;
  v252 = v11;
  v250 = v15;
  switch([v10 category])
  {
    case 4u:
      uint64_t v16 = [v8 objectForKeyedSubscript:@"reservationId"];

      if (!v16)
      {
        if (v13) {
          long long v17 = v13;
        }
        else {
          long long v17 = &stru_1F24EEF20;
        }
        [v8 setObject:v17 forKeyedSubscript:@"reservationId"];
      }
      long long v18 = [v8 objectForKeyedSubscript:@"checkinTime"];

      if (!v18)
      {
        if (v264) {
          long long v19 = v264;
        }
        else {
          long long v19 = &stru_1F24EEF20;
        }
        [v8 setObject:v19 forKeyedSubscript:@"checkinTime"];
      }
      long long v20 = [v8 objectForKeyedSubscript:@"checkoutTime"];

      if (!v20)
      {
        if (v262) {
          v21 = v262;
        }
        else {
          v21 = &stru_1F24EEF20;
        }
        [v8 setObject:v21 forKeyedSubscript:@"checkoutTime"];
      }
      uint64_t v22 = [v8 objectForKeyedSubscript:@"reservationFor"];
      uint64_t v23 = [v22 objectForKeyedSubscript:@"name"];
      if (v23)
      {
        v24 = (void *)v23;
        id v25 = [v8 objectForKeyedSubscript:@"reservationFor"];
        v26 = [v25 objectForKeyedSubscript:@"address"];

        if (v26)
        {
LABEL_98:
          v107 = [v8 objectForKeyedSubscript:@"underName"];
          v108 = [v107 objectForKeyedSubscript:@"name"];

          if (!v108)
          {
            v286[1] = @"name";
            v287[0] = @"http://schema.org/Person";
            v286[0] = @"@type";
            v109 = v265;
            if (!v265)
            {
              v109 = [MEMORY[0x1E4F1CA98] null];
            }
            v287[1] = v109;
            v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v287 forKeys:v286 count:2];
            [v8 setObject:v110 forKeyedSubscript:@"underName"];

            if (!v265) {
          }
            }
          if ([v10 isCancelled])
          {
            v91 = [v8 objectForKeyedSubscript:@"reservationFor"];
            uint64_t v111 = [v91 objectForKeyedSubscript:@"name"];
            if (v111)
            {
              v93 = (void *)v111;
              uint64_t v94 = [v8 objectForKeyedSubscript:@"reservationId"];
              if (v94) {
                goto LABEL_106;
              }
              v193 = [v8 objectForKeyedSubscript:@"checkinTime"];

              if (v193) {
                goto LABEL_225;
              }
            }
            else
            {
            }
          }
          v93 = [v8 objectForKeyedSubscript:@"reservationFor"];
          uint64_t v157 = [v93 objectForKeyedSubscript:@"name"];
          if (!v157) {
            goto LABEL_233;
          }
          v112 = (void *)v157;
          uint64_t v158 = [v8 objectForKeyedSubscript:@"checkinTime"];
          if (v158)
          {
            v159 = (void *)v158;
            v156 = [v8 objectForKeyedSubscript:@"checkoutTime"];

            goto LABEL_152;
          }
          goto LABEL_166;
        }
      }
      else
      {
      }
      v96 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v97 = [v96 objectForKeyedSubscript:@"name"];
      v98 = v97;
      v246 = v12;
      if (v97 || (v98 = v14) != 0)
      {
        id v99 = v98;
      }
      else
      {
        id v99 = [MEMORY[0x1E4F1CA98] null];
      }
      v100 = v99;
      v249 = v14;

      v101 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v102 = [v101 objectForKeyedSubscript:@"address"];
      v103 = v102;
      if (v102 || (v103 = v263) != 0 || (v103 = v258) != 0)
      {
        id v104 = v103;
      }
      else
      {
        id v104 = [MEMORY[0x1E4F1CA98] null];
      }
      v105 = v104;

      v288[0] = @"@type";
      v288[1] = @"name";
      v289[0] = @"http://schema.org/LodgingBusiness";
      v289[1] = v100;
      v288[2] = @"address";
      v289[2] = v105;
      v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v289 forKeys:v288 count:3];
      [v8 setObject:v106 forKeyedSubscript:@"reservationFor"];

      uint64_t v12 = v246;
      v14 = v249;
      goto LABEL_98;
    case 5u:
      v28 = [v8 objectForKeyedSubscript:@"reservationId"];

      if (!v28)
      {
        if (v13) {
          v29 = v13;
        }
        else {
          v29 = &stru_1F24EEF20;
        }
        [v8 setObject:v29 forKeyedSubscript:@"reservationId"];
      }
      v30 = [v8 objectForKeyedSubscript:@"pickupTime"];

      if (!v30)
      {
        if (v264) {
          v31 = v264;
        }
        else {
          v31 = &stru_1F24EEF20;
        }
        [v8 setObject:v31 forKeyedSubscript:@"pickupTime"];
      }
      long long v32 = [v8 objectForKeyedSubscript:@"pickupLocation"];
      uint64_t v33 = [v32 objectForKeyedSubscript:@"address"];
      if (v33)
      {
        uint64_t v34 = (void *)v33;
        id v35 = [v8 objectForKeyedSubscript:@"pickupLocation"];
        v36 = [v35 objectForKeyedSubscript:@"name"];

        if (v36) {
          goto LABEL_116;
        }
      }
      else
      {
      }
      v113 = [v8 objectForKeyedSubscript:@"pickupLocation"];
      v114 = [v113 objectForKeyedSubscript:@"address"];
      v115 = v114;
      if (v114 || (v115 = v263) != 0 || (v115 = v258) != 0)
      {
        v116 = v12;
        id v117 = v115;
      }
      else
      {
        v116 = v12;
        id v117 = [MEMORY[0x1E4F1CA98] null];
      }
      v118 = v117;

      v119 = [v8 objectForKeyedSubscript:@"pickupLocation"];
      v120 = [v119 objectForKeyedSubscript:@"name"];
      v121 = v120;
      if (v120 || (v121 = v260) != 0)
      {
        id v122 = v121;
      }
      else
      {
        id v122 = [MEMORY[0x1E4F1CA98] null];
      }
      v123 = v122;

      v284[0] = @"@type";
      v284[1] = @"address";
      v285[0] = @"http://schema.org/Place";
      v285[1] = v118;
      v284[2] = @"name";
      v285[2] = v123;
      v124 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v285 forKeys:v284 count:3];
      [v8 setObject:v124 forKeyedSubscript:@"pickupLocation"];

      uint64_t v12 = v116;
LABEL_116:
      v125 = [v8 objectForKeyedSubscript:@"dropoffTime"];

      if (!v125)
      {
        if (v262) {
          v126 = v262;
        }
        else {
          v126 = &stru_1F24EEF20;
        }
        [v8 setObject:v126 forKeyedSubscript:@"dropoffTime"];
      }
      v127 = [v8 objectForKeyedSubscript:@"dropoffLocation"];
      uint64_t v128 = [v127 objectForKeyedSubscript:@"address"];
      if (v128)
      {
        v129 = (void *)v128;
        v130 = [v8 objectForKeyedSubscript:@"dropoffLocation"];
        v131 = [v130 objectForKeyedSubscript:@"name"];

        if (v131) {
          goto LABEL_133;
        }
      }
      else
      {
      }
      v132 = [v8 objectForKeyedSubscript:@"dropoffLocation"];
      v133 = [v132 objectForKeyedSubscript:@"address"];
      v134 = v133;
      if (v133 || (v134 = v256) != 0 || (v134 = v253) != 0)
      {
        v135 = v12;
        id v136 = v134;
      }
      else
      {
        v135 = v12;
        id v136 = [MEMORY[0x1E4F1CA98] null];
      }
      v137 = v136;

      v138 = [v8 objectForKeyedSubscript:@"dropoffLocation"];
      v139 = [v138 objectForKeyedSubscript:@"name"];
      v140 = v139;
      if (v139 || (v140 = v255) != 0)
      {
        id v141 = v140;
      }
      else
      {
        id v141 = [MEMORY[0x1E4F1CA98] null];
      }
      v142 = v141;

      v282[0] = @"@type";
      v282[1] = @"address";
      v283[0] = @"http://schema.org/Place";
      v283[1] = v137;
      v282[2] = @"name";
      v283[2] = v142;
      v143 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v283 forKeys:v282 count:3];
      [v8 setObject:v143 forKeyedSubscript:@"dropoffLocation"];

      uint64_t v12 = v135;
LABEL_133:
      v144 = [v8 objectForKeyedSubscript:@"provider"];
      v145 = [v144 objectForKeyedSubscript:@"name"];

      if (!v145)
      {
        v281[0] = @"http://schema.org/Organization";
        v280[0] = @"@type";
        v280[1] = @"name";
        v146 = [v10 providerName];
        v281[1] = v146;
        v147 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v281 forKeys:v280 count:2];
        [v8 setObject:v147 forKeyedSubscript:@"provider"];
      }
      v148 = [v8 objectForKeyedSubscript:@"underName"];
      v149 = [v148 objectForKeyedSubscript:@"name"];

      if (!v149)
      {
        v278[1] = @"name";
        v279[0] = @"http://schema.org/Person";
        v278[0] = @"@type";
        v150 = v265;
        if (!v265)
        {
          v150 = [MEMORY[0x1E4F1CA98] null];
        }
        v279[1] = v150;
        v151 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v279 forKeys:v278 count:2];
        [v8 setObject:v151 forKeyedSubscript:@"underName"];

        if (!v265) {
      }
        }
      if (![v10 isCancelled]) {
        goto LABEL_157;
      }
      v91 = [v8 objectForKeyedSubscript:@"provider"];
      uint64_t v152 = [v91 objectForKeyedSubscript:@"name"];
      if (v152)
      {
        v93 = (void *)v152;
        if (!v12) {
          goto LABEL_234;
        }
        v153 = [v8 objectForKeyedSubscript:@"pickupTime"];

        if (v153) {
          goto LABEL_225;
        }
      }
      else
      {
      }
LABEL_157:
      v93 = [v8 objectForKeyedSubscript:@"provider"];
      uint64_t v160 = [v93 objectForKeyedSubscript:@"name"];
      if (!v160) {
        goto LABEL_233;
      }
      v112 = (void *)v160;
      uint64_t v161 = [v8 objectForKeyedSubscript:@"pickupTime"];
      if (!v161)
      {
LABEL_166:
        v91 = v8;
        id v8 = 0;
        goto LABEL_167;
      }
      v162 = (void *)v161;
      v163 = [v8 objectForKeyedSubscript:@"dropoffTime"];

      id v27 = 0;
      if (!v163) {
        goto LABEL_235;
      }
      uint64_t v13 = v251;
      uint64_t v11 = v252;
      BOOL v15 = v250;
      if (v12 || v250 || v261 || v257 || v254) {
        goto LABEL_237;
      }
      goto LABEL_238;
    case 6u:
      v37 = [v8 objectForKeyedSubscript:@"reservationId"];

      if (!v37)
      {
        if (v13) {
          uint64_t v38 = v13;
        }
        else {
          uint64_t v38 = &stru_1F24EEF20;
        }
        [v8 setObject:v38 forKeyedSubscript:@"reservationId"];
      }
      long long v39 = [v8 objectForKeyedSubscript:@"reservationFor"];
      uint64_t v40 = [v39 objectForKeyedSubscript:@"name"];
      id v241 = v10;
      v243 = v12;
      v247 = v14;
      if (!v40) {
        goto LABEL_197;
      }
      long long v41 = (void *)v40;
      long long v42 = [v8 objectForKeyedSubscript:@"reservationFor"];
      uint64_t v43 = [v42 objectForKeyedSubscript:@"startDate"];
      if (!v43) {
        goto LABEL_196;
      }
      v44 = (void *)v43;
      v45 = [v8 objectForKeyedSubscript:@"reservationFor"];
      uint64_t v46 = [v45 objectForKeyedSubscript:@"endDate"];
      if (!v46) {
        goto LABEL_195;
      }
      v233 = (void *)v46;
      v237 = v45;
      v231 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v47 = [v231 objectForKeyedSubscript:@"location"];
      uint64_t v48 = [v47 objectForKeyedSubscript:@"name"];
      if (v48)
      {
        v49 = (void *)v48;
        v50 = [v8 objectForKeyedSubscript:@"reservationFor"];
        v51 = [v50 objectForKeyedSubscript:@"location"];
        [v51 objectForKeyedSubscript:@"address"];
        v52 = v230 = v47;

        id v10 = v241;
        uint64_t v12 = v243;
        v14 = v247;
        if (v52) {
          goto LABEL_215;
        }
      }
      else
      {

LABEL_195:
LABEL_196:

LABEL_197:
      }
      v194 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v195 = [v194 objectForKeyedSubscript:@"name"];
      v196 = v195;
      if (v195 || (v196 = v259) != 0)
      {
        id v197 = v196;
      }
      else
      {
        id v197 = [MEMORY[0x1E4F1CA98] null];
      }
      v240 = v197;

      v198 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v199 = [v198 objectForKeyedSubscript:@"startDate"];
      v200 = v199;
      if (v199 || (v200 = v264) != 0)
      {
        v201 = v200;
      }
      else
      {
        v201 = [MEMORY[0x1E4F1CA98] null];
      }
      v236 = v201;

      v202 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v203 = [v202 objectForKeyedSubscript:@"endDate"];
      v204 = v203;
      if (v203 || (v204 = v262) != 0)
      {
        v205 = v204;
      }
      else
      {
        v205 = [MEMORY[0x1E4F1CA98] null];
      }
      v232 = v205;

      v206 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v207 = [v206 objectForKeyedSubscript:@"location"];
      v208 = [v207 objectForKeyedSubscript:@"name"];
      v209 = v208;
      if (v208 || (v209 = v260) != 0)
      {
        id v210 = v209;
      }
      else
      {
        id v210 = [MEMORY[0x1E4F1CA98] null];
      }
      v211 = v210;

      v212 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v213 = [v212 objectForKeyedSubscript:@"location"];
      v214 = [v213 objectForKeyedSubscript:@"address"];
      v215 = v214;
      if (v214 || (v215 = v263) != 0 || (v215 = v258) != 0)
      {
        id v216 = v215;
      }
      else
      {
        id v216 = [MEMORY[0x1E4F1CA98] null];
      }
      v217 = v216;

      v276[0] = @"@type";
      v276[1] = @"name";
      v277[0] = @"http://schema.org/Event";
      v277[1] = v240;
      v276[2] = @"startDate";
      v276[3] = @"endDate";
      v277[2] = v236;
      v277[3] = v232;
      v276[4] = @"location";
      v274[0] = @"@type";
      v274[1] = @"name";
      v275[0] = @"http://schema.org/Place";
      v275[1] = v211;
      v274[2] = @"address";
      v275[2] = v217;
      v218 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v275 forKeys:v274 count:3];
      v277[4] = v218;
      v219 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v277 forKeys:v276 count:5];
      [v8 setObject:v219 forKeyedSubscript:@"reservationFor"];

      id v10 = v241;
      uint64_t v12 = v243;
      v14 = v247;
LABEL_215:
      v220 = [v8 objectForKeyedSubscript:@"underName"];
      v221 = [v220 objectForKeyedSubscript:@"name"];

      if (v221) {
        goto LABEL_221;
      }
      v272[1] = @"name";
      v273[0] = @"http://schema.org/Person";
      v272[0] = @"@type";
      v188 = v265;
      v189 = v265;
      if (!v265)
      {
        v189 = [MEMORY[0x1E4F1CA98] null];
      }
      v273[1] = v189;
      v190 = (void *)MEMORY[0x1E4F1C9E8];
      v191 = v273;
      v192 = v272;
      goto LABEL_219;
    case 7u:
      v53 = [v8 objectForKeyedSubscript:@"reservationId"];

      if (!v53)
      {
        if (v13) {
          v54 = v13;
        }
        else {
          v54 = &stru_1F24EEF20;
        }
        [v8 setObject:v54 forKeyedSubscript:@"reservationId"];
      }
      v55 = [v8 objectForKeyedSubscript:@"reservationFor"];
      uint64_t v56 = [v55 objectForKeyedSubscript:@"name"];
      id v242 = v10;
      v244 = v12;
      v248 = v14;
      if (!v56) {
        goto LABEL_170;
      }
      v57 = (void *)v56;
      v58 = [v8 objectForKeyedSubscript:@"reservationFor"];
      uint64_t v59 = [v58 objectForKeyedSubscript:@"startDate"];
      if (!v59) {
        goto LABEL_169;
      }
      v60 = (void *)v59;
      v238 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v61 = [v238 objectForKeyedSubscript:@"location"];
      uint64_t v62 = [v61 objectForKeyedSubscript:@"name"];
      if (v62)
      {
        v63 = (void *)v62;
        v64 = [v8 objectForKeyedSubscript:@"reservationFor"];
        v65 = [v64 objectForKeyedSubscript:@"location"];
        v234 = [v65 objectForKeyedSubscript:@"address"];

        id v10 = v242;
        uint64_t v12 = v244;
        v14 = v248;
        if (v234) {
          goto LABEL_185;
        }
      }
      else
      {

LABEL_169:
LABEL_170:
      }
      v164 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v165 = [v164 objectForKeyedSubscript:@"name"];
      v166 = v165;
      if (v165 || (v166 = v259) != 0)
      {
        id v167 = v166;
      }
      else
      {
        id v167 = [MEMORY[0x1E4F1CA98] null];
      }
      v239 = v167;

      v168 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v169 = [v168 objectForKeyedSubscript:@"startDate"];
      v170 = v169;
      if (v169 || (v170 = v264) != 0)
      {
        v171 = v170;
      }
      else
      {
        v171 = [MEMORY[0x1E4F1CA98] null];
      }
      v235 = v171;

      v172 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v173 = [v172 objectForKeyedSubscript:@"location"];
      v174 = [v173 objectForKeyedSubscript:@"name"];
      v175 = v174;
      if (v174 || (v175 = v260) != 0)
      {
        id v176 = v175;
      }
      else
      {
        id v176 = [MEMORY[0x1E4F1CA98] null];
      }
      v177 = v176;

      v178 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v179 = [v178 objectForKeyedSubscript:@"location"];
      v180 = [v179 objectForKeyedSubscript:@"address"];
      v181 = v180;
      if (v180 || (v181 = v263) != 0 || (v181 = v258) != 0)
      {
        id v182 = v181;
      }
      else
      {
        id v182 = [MEMORY[0x1E4F1CA98] null];
      }
      v183 = v182;

      v270[0] = @"@type";
      v270[1] = @"name";
      v271[0] = @"http://schema.org/ScreeningEvent";
      v271[1] = v239;
      v271[2] = v235;
      v270[2] = @"startDate";
      v270[3] = @"location";
      v268[0] = @"@type";
      v268[1] = @"name";
      v269[0] = @"http://schema.org/Place";
      v269[1] = v177;
      v268[2] = @"address";
      v269[2] = v183;
      v184 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v269 forKeys:v268 count:3];
      v271[3] = v184;
      v185 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v271 forKeys:v270 count:4];
      [v8 setObject:v185 forKeyedSubscript:@"reservationFor"];

      id v10 = v242;
      uint64_t v12 = v244;
      v14 = v248;
LABEL_185:
      v186 = [v8 objectForKeyedSubscript:@"underName"];
      v187 = [v186 objectForKeyedSubscript:@"name"];

      if (!v187)
      {
        v266[1] = @"name";
        v267[0] = @"http://schema.org/Person";
        v266[0] = @"@type";
        v188 = v265;
        v189 = v265;
        if (!v265)
        {
          v189 = [MEMORY[0x1E4F1CA98] null];
        }
        v267[1] = v189;
        v190 = (void *)MEMORY[0x1E4F1C9E8];
        v191 = v267;
        v192 = v266;
LABEL_219:
        v222 = [v190 dictionaryWithObjects:v191 forKeys:v192 count:2];
        [v8 setObject:v222 forKeyedSubscript:@"underName"];

        if (!v188) {
      }
        }
LABEL_221:
      if (![v10 isCancelled]) {
        goto LABEL_227;
      }
      v91 = [v8 objectForKeyedSubscript:@"reservationFor"];
      uint64_t v223 = [v91 objectForKeyedSubscript:@"name"];
      if (v223)
      {
        v93 = (void *)v223;
        if (!v12) {
          goto LABEL_234;
        }
        v224 = [v8 objectForKeyedSubscript:@"reservationFor"];
        v225 = [v224 objectForKeyedSubscript:@"startDate"];

        if (v225) {
          goto LABEL_225;
        }
      }
      else
      {
      }
LABEL_227:
      v93 = [v8 objectForKeyedSubscript:@"reservationFor"];
      uint64_t v226 = [v93 objectForKeyedSubscript:@"name"];
      if (!v226) {
        goto LABEL_233;
      }
      v227 = (void *)v226;
      v228 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v229 = [v228 objectForKeyedSubscript:@"startDate"];

      id v27 = 0;
      if (!v229) {
        goto LABEL_235;
      }
      uint64_t v11 = v252;
      if (v12) {
        goto LABEL_236;
      }
      BOOL v15 = v250;
      uint64_t v13 = v251;
      if (v250 || v261) {
        goto LABEL_237;
      }
      goto LABEL_238;
    case 8u:
      v66 = [v8 objectForKeyedSubscript:@"reservationId"];

      if (!v66)
      {
        if (v13) {
          v67 = v13;
        }
        else {
          v67 = &stru_1F24EEF20;
        }
        [v8 setObject:v67 forKeyedSubscript:@"reservationId"];
      }
      v68 = [v8 objectForKeyedSubscript:@"reservationFor"];
      uint64_t v69 = [v68 objectForKeyedSubscript:@"name"];
      if (v69)
      {
        v70 = (void *)v69;
        v71 = [v8 objectForKeyedSubscript:@"reservationFor"];
        v72 = [v71 objectForKeyedSubscript:@"address"];

        if (v72) {
          goto LABEL_74;
        }
      }
      else
      {
      }
      v73 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v74 = [v73 objectForKeyedSubscript:@"name"];
      v75 = v74;
      v245 = v12;
      if (v74 || (v75 = v14) != 0)
      {
        id v76 = v75;
      }
      else
      {
        id v76 = [MEMORY[0x1E4F1CA98] null];
      }
      v77 = v76;
      v78 = v14;

      v79 = [v8 objectForKeyedSubscript:@"reservationFor"];
      v80 = [v79 objectForKeyedSubscript:@"address"];
      v81 = v80;
      if (v80 || (v81 = v263) != 0 || (v81 = v258) != 0)
      {
        id v82 = v81;
      }
      else
      {
        id v82 = [MEMORY[0x1E4F1CA98] null];
      }
      v83 = v82;

      v292[0] = @"@type";
      v292[1] = @"name";
      v293[0] = @"http://schema.org/FoodEstablishment";
      v293[1] = v77;
      v292[2] = @"address";
      v293[2] = v83;
      v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v293 forKeys:v292 count:3];
      [v8 setObject:v84 forKeyedSubscript:@"reservationFor"];

      uint64_t v12 = v245;
      v14 = v78;
LABEL_74:
      v85 = [v8 objectForKeyedSubscript:@"startTime"];

      if (!v85)
      {
        if (v264) {
          v86 = v264;
        }
        else {
          v86 = &stru_1F24EEF20;
        }
        [v8 setObject:v86 forKeyedSubscript:@"startTime"];
      }
      v87 = [v8 objectForKeyedSubscript:@"underName"];
      v88 = [v87 objectForKeyedSubscript:@"name"];

      if (!v88)
      {
        v290[1] = @"name";
        v291[0] = @"http://schema.org/Person";
        v290[0] = @"@type";
        v89 = v265;
        if (!v265)
        {
          v89 = [MEMORY[0x1E4F1CA98] null];
        }
        v291[1] = v89;
        v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v291 forKeys:v290 count:2];
        [v8 setObject:v90 forKeyedSubscript:@"underName"];

        if (!v265) {
      }
        }
      if (![v10 isCancelled]) {
        goto LABEL_146;
      }
      v91 = [v8 objectForKeyedSubscript:@"reservationFor"];
      uint64_t v92 = [v91 objectForKeyedSubscript:@"name"];
      if (v92)
      {
        v93 = (void *)v92;
        uint64_t v94 = [v8 objectForKeyedSubscript:@"reservationId"];
        if (v94)
        {
LABEL_106:
          v112 = (void *)v94;
LABEL_167:

          goto LABEL_234;
        }
        v95 = [v8 objectForKeyedSubscript:@"startTime"];

        if (v95)
        {
LABEL_225:
          uint64_t v13 = v251;
          uint64_t v11 = v252;
          BOOL v15 = v250;
          goto LABEL_238;
        }
      }
      else
      {
      }
LABEL_146:
      v93 = [v8 objectForKeyedSubscript:@"reservationFor"];
      uint64_t v154 = [v93 objectForKeyedSubscript:@"name"];
      if (!v154)
      {
LABEL_233:
        v91 = v8;
        id v8 = 0;
LABEL_234:
        id v27 = v8;

        id v8 = v91;
        goto LABEL_235;
      }
      v155 = (void *)v154;
      v156 = [v8 objectForKeyedSubscript:@"startTime"];

LABEL_152:
      id v27 = 0;
      if (!v156)
      {
LABEL_235:
        uint64_t v11 = v252;
LABEL_236:
        BOOL v15 = v250;
        uint64_t v13 = v251;
        goto LABEL_237;
      }
      uint64_t v13 = v251;
      uint64_t v11 = v252;
      BOOL v15 = v250;
      if (v12 || v250)
      {
LABEL_237:

        id v8 = v27;
      }
LABEL_238:

LABEL_239:
      return;
    default:
      id v27 = 0;
      goto LABEL_237;
  }
}

- (id)DUFoundInEventResultForMail:(id)a3
{
  id v3 = a3;
  v4 = [SGSimpleMailMessage alloc];
  double v5 = [(SGSimpleMailMessage *)v4 convertMailMessageToBMMailMessage:v3];

  if (v5)
  {
    double v6 = [v5 encodeAsProto];
    v7 = objc_opt_new();
    *(void *)buf = 0;
    uint64_t v12 = buf;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__27714;
    BOOL v15 = __Block_byref_object_dispose__27715;
    id v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__SGExtractionDissector_DUFoundInEventResultForMail___block_invoke;
    v10[3] = &unk_1E65BB168;
    v10[4] = buf;
    [v7 foundInEventResultWithSerializedDocument:v6 documentType:0 completion:v10];
    id v8 = *((id *)v12 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    double v6 = sgEventsLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v6, OS_LOG_TYPE_ERROR, "SGExtractionDissector: Not able to fetch mail content.", buf, 2u);
    }
    id v8 = 0;
  }

  return v8;
}

void __53__SGExtractionDissector_DUFoundInEventResultForMail___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    double v6 = sgEventsLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: FoundInEvents DU XPC call error", v9, 2u);
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (BOOL)checkMLSupportForMailCategory:(unsigned __int8)a3
{
  return (a3 - 4) < 5;
}

- (BOOL)checkMLExtractionSupportForMailLocale:(id)a3
{
  id v3 = objc_msgSend(a3, "substringWithRange:", 0, 2);
  char v4 = [v3 isEqualToString:@"en"];

  return v4;
}

- (BOOL)checkMLSupportForMailWithEventClassification:(id)a3
{
  id v4 = a3;
  if ([v4 useCase] && objc_msgSend(v4, "useCase") != 1)
  {
    uint64_t v7 = [v4 locale];
    if ([(SGExtractionDissector *)self checkMLExtractionSupportForMailLocale:v7])
    {
      BOOL v6 = -[SGExtractionDissector checkMLSupportForMailCategory:](self, "checkMLSupportForMailCategory:", [v4 category]);
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    id v5 = sgEventsLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: Not classified as event, bailing", v9, 2u);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)checkHybridMLSupportForSenderOfMail:(id)a3
{
  id v3 = a3;
  id v4 = [v3 from];
  id v5 = [v4 emailAddress];

  if (v5)
  {
    BOOL v6 = +[SGStructuredEventExtractionModel sharedInstance];
    uint64_t v7 = [v3 from];
    id v8 = [v7 emailAddress];
    char v9 = [v6 isSenderSupportedForMLHybridExtraction:v8];
  }
  else
  {
    id v10 = sgEventsLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: No sender mail address found. Bailing from ensemble's ML pipeline.", v12, 2u);
    }

    char v9 = 0;
  }

  return v9;
}

- (id)extractSchemaFromMLForMail:(id)a3 fromSuggestTool:(BOOL)a4 withEventClassification:(id)a5 withFiEMLResults:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (![(SGExtractionDissector *)self checkHybridMLSupportForSenderOfMail:v10]) {
    goto LABEL_14;
  }
  uint64_t v13 = [v10 htmlBody];

  if (!v13)
  {
    id v16 = sgEventsLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: No HTML body found. Bailing early from ensemble's ML pipeline extraction.", (uint8_t *)&v19, 2u);
    }
    goto LABEL_13;
  }
  if (!v11)
  {
    id v16 = sgEventsLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_error_impl(&dword_1CA650000, v16, OS_LOG_TYPE_ERROR, "SGExtractionDissector: eventClassification is nil, bailing", (uint8_t *)&v19, 2u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (![(SGExtractionDissector *)self checkMLSupportForMailWithEventClassification:v11])
  {
LABEL_14:
    long long v17 = 0;
    goto LABEL_15;
  }
  v14 = sgEventsLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412290;
    id v20 = v11;
    _os_log_debug_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEBUG, "SGExtractionDissector eventClassification: %@", (uint8_t *)&v19, 0xCu);
  }

  if (a4)
  {
    id v15 = v12;
  }
  else
  {
    id v15 = [(SGExtractionDissector *)self DUFoundInEventResultForMail:v10];
  }
  long long v17 = v15;
LABEL_15:

  return v17;
}

- (id)extractMissingValueFromMLForMail:(id)a3 schema:(id)a4 fromSuggestTool:(BOOL)a5 withFiEMLResults:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v7)
  {
    uint64_t v13 = objc_opt_new();
    v14 = [v13 eventClassificationWithoutXPCForMailMessage:v10];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1CB79B230]();
    id v16 = objc_opt_new();
    v14 = [v16 eventClassificationForMailMessage:v10];
  }
  long long v17 = [(SGExtractionDissector *)self extractSchemaFromMLForMail:v10 fromSuggestTool:v7 withEventClassification:v14 withFiEMLResults:v12];
  if (v17)
  {
    long long v18 = objc_opt_new();
    if (v11)
    {
      uint64_t v19 = [v11 mutableCopy];

      long long v18 = (void *)v19;
    }
    [(SGExtractionDissector *)self fillReverseTemplateSchema:v18 usingDUFoundInEvent:v17 eventClassification:v14 fromSuggestTool:v7];
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (id)extractMissingValuesFromMLForMail:(id)a3 outputItems:(id)a4 fromSuggestTool:(BOOL)a5 withFiEMLResults:(id)a6
{
  BOOL v7 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v11)
  {
    v28 = self;
    BOOL v29 = v7;
    uint64_t v13 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "objectForKeyedSubscript:", @"schemas", v28);
          if (v19) {
            [v13 addObjectsFromArray:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v16);
    }

    if ([v13 count])
    {
      if ((unint64_t)[v13 count] <= 1)
      {
        uint64_t v21 = [v14 firstObject];
        uint64_t v22 = [v21 objectForKeyedSubscript:@"schemas"];
        uint64_t v23 = [v22 firstObject];

        v24 = [v14 firstObject];
        id v25 = [v24 objectForKeyedSubscript:@"requiredFieldsWithMissingValues"];

        if ([v25 count])
        {
          id v26 = [(SGExtractionDissector *)v28 extractMissingValueFromMLForMail:v10 schema:v23 fromSuggestTool:v29 withFiEMLResults:v12];
        }
        else
        {
          id v26 = v23;
        }
        id v20 = v26;
      }
      else
      {
        id v20 = 0;
      }
    }
    else
    {
      id v20 = [(SGExtractionDissector *)v28 extractMissingValueFromMLForMail:v10 schema:0 fromSuggestTool:v29 withFiEMLResults:v12];
    }
  }
  else
  {
    id v20 = [(SGExtractionDissector *)self extractMissingValueFromMLForMail:v10 schema:0 fromSuggestTool:v7 withFiEMLResults:v12];
  }

  return v20;
}

- (id)extractMissingValuesFromMLForMail:(id)a3 outputItems:(id)a4 fromSuggestTool:(BOOL)a5
{
  return [(SGExtractionDissector *)self extractMissingValuesFromMLForMail:a3 outputItems:a4 fromSuggestTool:a5 withFiEMLResults:0];
}

- (BOOL)requiredFieldsMissingForOutputItems:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v22 + 1) + 8 * i) objectForKeyedSubscript:@"requiredFieldsWithMissingValues"];
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v19;
            while (2)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v19 != v14) {
                  objc_enumerationMutation(v11);
                }
                if ([*(id *)(*((void *)&v18 + 1) + 8 * j) count])
                {

                  BOOL v16 = 1;
                  goto LABEL_21;
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
        BOOL v16 = 0;
      }
      while (v7);
    }
    else
    {
      BOOL v16 = 0;
    }
LABEL_21:
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)requiredFieldsMissingForOutput:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v4 = [a3 outputItems];
  LOBYTE(self) = [(SGExtractionDissector *)self requiredFieldsMissingForOutputItems:v4];

  return (char)self;
}

- (id)flightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__27714;
  long long v19 = __Block_byref_object_dispose__27715;
  id v20 = 0;
  id v11 = [(SGExtractionDissector *)self synchronousRemoteObjectProxyWithErrorHandler:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__SGExtractionDissector_flightInformationWithAirlineCode_flightNumber_flightDate___block_invoke;
  v14[3] = &unk_1E65BB6A8;
  v14[4] = &v15;
  [v11 flightInformationWithAirlineCode:v8 flightNumber:v9 flightDate:v10 reply:v14];

  id v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __82__SGExtractionDissector_flightInformationWithAirlineCode_flightNumber_flightDate___block_invoke(uint64_t a1, void *a2)
{
}

- (id)getFlightReferencesAndReservationId:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__27714;
  uint64_t v14 = __Block_byref_object_dispose__27715;
  id v15 = 0;
  id v5 = [(SGExtractionDissector *)self packedJSTextMessageFromTextMessage:v4];
  uint64_t v6 = [(SGExtractionDissector *)self synchronousRemoteObjectProxyWithErrorHandler:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SGExtractionDissector_getFlightReferencesAndReservationId___block_invoke;
  v9[3] = &unk_1E65BB0C8;
  v9[4] = &v10;
  [v6 getFlightReferencesAndReservationId:v5 reply:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __61__SGExtractionDissector_getFlightReferencesAndReservationId___block_invoke(uint64_t a1, void *a2)
{
}

- (id)enrichmentsFromSchemas:(id)a3 inTextMessage:(id)a4 parentEntity:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v26 = a5;
  id v9 = [(SGExtractionDissector *)self packedJSTextMessageFromTextMessage:a4];
  uint64_t v10 = (void *)[v9 mutableCopy];

  [v10 setObject:v8 forKeyedSubscript:@"schemas"];
  id v11 = [(SGExtractionDissector *)self outputFromPackedJSSchema:v10];
  id v25 = (id)objc_opt_new();
  if (v11)
  {
    long long v22 = v10;
    id v23 = v8;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [v11 outputItems];
    uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v17 = objc_opt_new();
          long long v18 = objc_opt_new();
          long long v19 = [v11 outputItems];
          id v20 = [(SGExtractionDissector *)self entityForOutputItem:v16 withSiblings:v19 parentEntity:v26 outputExceptions:v17 outputInfos:v18 interaction:0];

          if (v20) {
            [v25 addObject:v20];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }

    uint64_t v10 = v22;
    id v8 = v23;
  }

  return v25;
}

- (id)outputFromSchemas:(id)a3 inMessage:(id)a4
{
  id v6 = a3;
  id v7 = [(SGExtractionDissector *)self packedJSMailMessageFromMailMessage:a4];
  id v8 = (void *)[v7 mutableCopy];

  [v8 setObject:v6 forKeyedSubscript:@"schemas"];
  id v9 = [(SGExtractionDissector *)self outputFromPackedJSSchema:v8];

  return v9;
}

- (id)enrichmentsFromSchemas:(id)a3 inMessage:(id)a4 parentEntity:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a5;
  id v8 = [(SGExtractionDissector *)self outputFromSchemas:a3 inMessage:a4];
  id v20 = (id)objc_opt_new();
  if (v8)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = [v8 outputItems];
    uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v14 = objc_opt_new();
          id v15 = objc_opt_new();
          uint64_t v16 = [v8 outputItems];
          uint64_t v17 = [(SGExtractionDissector *)self entityForOutputItem:v13 withSiblings:v16 parentEntity:v21 outputExceptions:v14 outputInfos:v15 interaction:0];

          if (v17) {
            [v20 addObject:v17];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }
  }
  return v20;
}

- (id)eventActivitiesForReservationWithReference:(id)a3 inParentEntity:(id)a4 interaction:(id)a5
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v69 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8
    && ([v8 intentResponse],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v10,
        (isKindOfClass & 1) != 0))
  {
    context = (void *)MEMORY[0x1CB79B230]();
    v61 = v9;
    uint64_t v12 = [v9 intentResponse];
    uint64_t v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v68 = (id)objc_opt_new();
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    uint64_t v59 = v12;
    id obj = [v12 reservations];
    uint64_t v14 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v82;
      uint64_t v62 = *(void *)v82;
      id v63 = v7;
      v70 = v13;
      do
      {
        uint64_t v17 = 0;
        uint64_t v64 = v15;
        do
        {
          if (*(void *)v82 != v16) {
            objc_enumerationMutation(obj);
          }
          long long v18 = *(void **)(*((void *)&v81 + 1) + 8 * v17);
          long long v19 = (void *)MEMORY[0x1CB79B230]();
          id v20 = [v18 itemReference];
          int v21 = [v20 isEqual:v7];

          if (v21)
          {
            v66 = v19;
            uint64_t v67 = v17;
            long long v79 = 0u;
            long long v80 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            long long v22 = [v18 actions];
            uint64_t v23 = [v22 countByEnumeratingWithState:&v77 objects:v89 count:16];
            long long v24 = v69;
            if (v23)
            {
              uint64_t v25 = v23;
              uint64_t v26 = *(void *)v78;
              uint64_t v71 = *(void *)v78;
              v72 = v22;
              do
              {
                uint64_t v27 = 0;
                uint64_t v75 = v25;
                do
                {
                  if (*(void *)v78 != v26) {
                    objc_enumerationMutation(v22);
                  }
                  long long v28 = *(void **)(*((void *)&v77 + 1) + 8 * v27);
                  long long v29 = (void *)MEMORY[0x1CB79B230]();
                  if ([v28 type] == 1)
                  {
                    long long v30 = [v28 validDuration];
                    long long v31 = [v30 startDateComponents];

                    uint64_t v32 = [v28 validDuration];
                    long long v33 = [v32 endDateComponents];

                    if (v31) {
                      BOOL v34 = v33 == 0;
                    }
                    else {
                      BOOL v34 = 1;
                    }
                    if (!v34)
                    {
                      uint64_t v35 = [v31 timeZone];
                      v36 = v35;
                      if (v35)
                      {
                        id v37 = v35;
                      }
                      else
                      {
                        id v37 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
                      }
                      id v38 = v37;

                      [v13 setTimeZone:v38];
                      long long v39 = [v13 dateFromComponents:v31];
                      [v39 timeIntervalSinceReferenceDate];
                      double v41 = v40;

                      long long v42 = [v33 timeZone];
                      uint64_t v43 = v42;
                      v74 = v38;
                      if (v42)
                      {
                        id v44 = v42;
                      }
                      else
                      {
                        id v44 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
                      }
                      id v45 = v44;

                      v73 = v45;
                      [v13 setTimeZone:v45];
                      uint64_t v46 = [v13 dateFromComponents:v33];
                      [v46 timeIntervalSinceReferenceDate];
                      double v48 = v47;

                      v49 = [v24 duplicateKey];
                      v50 = [v49 bundleId];

                      if (v50)
                      {
                        id v76 = 0;
                        v51 = [MEMORY[0x1E4F223C8] bundleRecordWithBundleIdentifier:v50 allowPlaceholder:0 error:&v76];
                        v52 = v76;
                        if (!v51)
                        {
                          v53 = sgLogHandle();
                          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412546;
                            v86 = v50;
                            __int16 v87 = 2112;
                            v88 = v52;
                            _os_log_impl(&dword_1CA650000, v53, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: no record found for bundle id %@:%@", buf, 0x16u);
                          }
                        }
                        v54 = [v51 teamIdentifier];
                        if (v54)
                        {
                          id v55 = objc_alloc(MEMORY[0x1E4F5DA08]);
                          uint64_t v56 = [v28 userActivity];
                          v57 = (void *)[v55 initWithTeamIdentifier:v54 type:1 userActivity:v56 validStartDate:v41 validEndDate:v48];

                          [v68 addObject:v57];
                          long long v24 = v69;
                        }

                        uint64_t v13 = v70;
                        long long v22 = v72;
                      }
                      else
                      {
                        v52 = sgLogHandle();
                        long long v22 = v72;
                        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_1CA650000, v52, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: no bundle identifier identified", buf, 2u);
                        }
                      }

                      uint64_t v26 = v71;
                    }

                    uint64_t v25 = v75;
                  }
                  ++v27;
                }
                while (v25 != v27);
                uint64_t v25 = [v22 countByEnumeratingWithState:&v77 objects:v89 count:16];
              }
              while (v25);
            }

            uint64_t v16 = v62;
            id v7 = v63;
            uint64_t v15 = v64;
            long long v19 = v66;
            uint64_t v17 = v67;
          }
          ++v17;
        }
        while (v17 != v15);
        uint64_t v15 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
      }
      while (v15);
    }

    uint64_t v9 = v61;
  }
  else
  {
    id v68 = 0;
  }

  return v68;
}

- (id)eventActivitiesForReservationWithSchema:(id)a3 enrichment:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5
    && ([v6 tags],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [MEMORY[0x1E4F5D9F0] extractedFlight],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 containsObject:v9],
        v9,
        v8,
        v10))
  {
    v65 = v7;
    id v66 = v5;
    id v67 = (id)objc_opt_new();
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = v5;
    uint64_t v77 = [obj countByEnumeratingWithState:&v78 objects:v84 count:16];
    if (v77)
    {
      uint64_t v76 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v77; ++i)
        {
          if (*(void *)v79 != v76) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          uint64_t v13 = [v12 objectForKeyedSubscript:@"potentialAction"];
          uint64_t v14 = [v12 objectForKeyedSubscript:@"reservationFor"];
          uint64_t v15 = [v14 objectForKeyedSubscript:@"flightNumber"];

          uint64_t v16 = [v13 objectForKeyedSubscript:@"target"];
          if (v16) {
            uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v16];
          }
          else {
            uint64_t v17 = 0;
          }
          long long v18 = [v12 objectForKeyedSubscript:@"reservationId"];
          if (v18)
          {
            long long v19 = [v12 objectForKeyedSubscript:@"reservationId"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v20 = [v12 objectForKeyedSubscript:@"reservationId"];
            }
            else
            {
              id v20 = 0;
            }
          }
          else
          {
            id v20 = 0;
          }

          if (v13) {
            BOOL v21 = v15 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (!v21 && v17 != 0)
          {
            uint64_t v23 = [v17 scheme];

            if (v23)
            {
              if (v20)
              {
                v74 = v20;
                uint64_t v24 = [MEMORY[0x1E4F1C9A8] currentCalendar];
                uint64_t v25 = [v13 objectForKeyedSubscript:@"startTime"];

                uint64_t v26 = (void *)MEMORY[0x1E4F1C9D8];
                uint64_t v75 = (void *)v24;
                if (v25)
                {
                  uint64_t v27 = [v13 objectForKeyedSubscript:@"startTime"];
                  long long v28 = objc_msgSend(v26, "sg_dateComponentsFromISO8601String:", v27);
                }
                else
                {
                  [v12 objectForKeyedSubscript:@"reservationFor"];
                  uint64_t v71 = v15;
                  v30 = long long v29 = (void *)v24;
                  long long v31 = [v30 objectForKeyedSubscript:@"departureTime"];
                  uint64_t v27 = objc_msgSend(v26, "sg_dateComponentsFromISO8601String:", v31);

                  uint64_t v32 = [v29 dateFromComponents:v27];
                  long long v33 = [v32 dateByAddingTimeInterval:-86400.0];

                  BOOL v34 = v29;
                  uint64_t v15 = v71;
                  long long v28 = [v34 components:1048828 fromDate:v33];
                }
                uint64_t v35 = [v13 objectForKeyedSubscript:@"endTime"];

                v36 = (void *)MEMORY[0x1E4F1C9D8];
                if (v35)
                {
                  id v37 = [v13 objectForKeyedSubscript:@"endTime"];
                  id v38 = objc_msgSend(v36, "sg_dateComponentsFromISO8601String:", v37);
                }
                else
                {
                  id v37 = [v12 objectForKeyedSubscript:@"reservationFor"];
                  long long v39 = [v37 objectForKeyedSubscript:@"departureTime"];
                  id v38 = objc_msgSend(v36, "sg_dateComponentsFromISO8601String:", v39);
                }
                if (v28 && v38)
                {
                  double v40 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.internal.mail.checkinActivity"];
                  double v41 = [v13 objectForKeyedSubscript:@"@type"];
                  long long v42 = v41;
                  if (v41
                    && [v41 isEqualToString:@"http://schema.org/CheckInAction"])
                  {
                    id v69 = v42;
                    uint64_t v43 = +[SGFoundInAppsStrings foundInAppsStringForCheckInAction:v15];
                    [v40 setTitle:v43];

                    id v44 = v40;
                    long long v82 = @"reservationId";
                    long long v83 = v74;
                    id v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
                    [v40 setUserInfo:v45];

                    uint64_t v46 = (void *)MEMORY[0x1CB79B230]();
                    double v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"reservationId", 0);
                    [v44 setRequiredUserInfoKeys:v47];

                    v70 = v44;
                    [v44 setWebpageURL:v17];
                    double v48 = [v28 timeZone];
                    v49 = v48;
                    v72 = v15;
                    if (v48)
                    {
                      id v50 = v48;
                    }
                    else
                    {
                      id v50 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
                    }
                    id v51 = v50;

                    id v68 = v51;
                    [v75 setTimeZone:v51];
                    v52 = [v75 dateFromComponents:v28];
                    [v52 timeIntervalSinceReferenceDate];
                    double v54 = v53;

                    id v55 = [v38 timeZone];
                    uint64_t v56 = v55;
                    long long v42 = v69;
                    if (v55)
                    {
                      id v57 = v55;
                    }
                    else
                    {
                      id v57 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
                    }
                    id v58 = v57;

                    [v75 setTimeZone:v58];
                    [v75 dateFromComponents:v38];
                    v60 = uint64_t v59 = v58;
                    [v60 timeIntervalSinceReferenceDate];
                    double v62 = v61;

                    double v40 = v70;
                    id v63 = (void *)[objc_alloc(MEMORY[0x1E4F5DA08]) initWithTeamIdentifier:@"NoTeamId" type:1 userActivity:v70 validStartDate:v54 validEndDate:v62];
                    [v67 addObject:v63];

                    uint64_t v15 = v72;
                  }
                }
                id v20 = v74;
              }
            }
          }
        }
        uint64_t v77 = [obj countByEnumeratingWithState:&v78 objects:v84 count:16];
      }
      while (v77);
    }

    id v7 = v65;
    id v5 = v66;
  }
  else
  {
    id v67 = 0;
  }

  return v67;
}

- (id)getAndRemoveItemReferencesFromSchemas:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v20 = 0;
    uint64_t v5 = *(void *)v22;
    id v6 = @"itemReferenceIdentifier";
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x1CB79B230]();
        int v10 = [v8 objectForKeyedSubscript:v6];
        uint64_t v11 = [v8 objectForKeyedSubscript:@"itemReferenceName"];
        uint64_t v12 = (void *)v11;
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          uint64_t v14 = v6;
          uint64_t v15 = v5;
          uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F30750]) initWithVocabularyIdentifier:v10 spokenPhrase:v11 pronunciationHint:0];
          uint64_t v17 = v20;
          if (!v20) {
            uint64_t v17 = objc_opt_new();
          }
          id v20 = v17;
          [v17 addObject:v16];

          uint64_t v5 = v15;
          id v6 = v14;
        }
        [v8 removeObjectForKey:v6];
        [v8 removeObjectForKey:@"itemReferenceName"];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (void)addInteractionTagsToEnrichment:(id)a3 inEntity:(id)a4 interaction:(id)a5
{
  id v27 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F5D9F0] fromInteraction];
  [v27 addTag:v9];

  int v10 = (void *)MEMORY[0x1E4F5D9F0];
  uint64_t v11 = [v8 identifier];
  uint64_t v12 = [v10 interactionId:v11];
  [v27 addTag:v12];

  BOOL v13 = [v7 duplicateKey];
  uint64_t v14 = [v13 entityKey];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v16 = [v7 duplicateKey];
    uint64_t v17 = [v16 entityKey];
    long long v18 = [v17 bundleId];

    long long v19 = [MEMORY[0x1E4F5D9F0] interactionBundleId:v18];
    [v27 addTag:v19];

    if (v18)
    {
      id v20 = [MEMORY[0x1E4F5DAC8] originWithType:5 sourceKey:v18 externalKey:&stru_1F24EEF20 bundleId:v18 fromForwardedMessage:0];
      long long v21 = [v20 teamId];
      if (v21)
      {
        long long v22 = [MEMORY[0x1E4F5D9F0] interactionTeamId:v21];
        [v27 addTag:v22];
      }
    }
  }
  long long v23 = [v8 groupIdentifier];

  if (v23)
  {
    long long v24 = (void *)MEMORY[0x1E4F5D9F0];
    uint64_t v25 = [v8 groupIdentifier];
    uint64_t v26 = [v24 interactionGroupId:v25];
    [v27 addTag:v26];
  }
}

- (void)dissectURL:(id)a3 title:(id)a4 htmlPayload:(id)a5 entity:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  uint64_t v14 = sgEventsLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v11 loggingIdentifier];
    int v24 = 138740227;
    id v25 = v10;
    __int16 v26 = 2114;
    id v27 = v15;
    _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: Starting dissection of webpage (%{sensitive}@). [SGPipelineEntity (%{public}@)]", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v16 = mach_absolute_time();
  [v11 creationTimestamp];
  uint64_t v17 = -[SGExtractionDissector packedJSURLFromURL:title:payload:creationTimestamp:](self, "packedJSURLFromURL:title:payload:creationTimestamp:", v13, v10, v12);

  long long v18 = [v17 objectForKeyedSubscript:@"html"];
  if (-[SGExtractionDissector exceedsMaxHTMLContentLength:](self, "exceedsMaxHTMLContentLength:", [v18 length]))
  {
    long long v19 = sgEventsLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v11 loggingIdentifier];
      int v24 = 138543362;
      id v25 = v20;
      _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, "SGExtractionDissector dissectURL: Webpage processing stopped: HTML content exceeding max length. [SGPipelineEntity (%{public}@)]", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    uint64_t v21 = [(SGExtractionDissector *)self outputFromPackedJSMailMessage:v17];
    if (v21)
    {
      long long v19 = v21;
      [(SGExtractionDissector *)self _addEnrichmentsToEntityForOutput:v21 interaction:0 entity:v11 startTime:v16 backPressureHazard:1];
    }
    else
    {
      long long v22 = sgEventsLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        long long v23 = [v11 loggingIdentifier];
        int v24 = 138543362;
        id v25 = v23;
        _os_log_error_impl(&dword_1CA650000, v22, OS_LOG_TYPE_ERROR, "SGExtractionDissector dissectURL: SGOutput is null. [SGPipelineEntity (%{public}@)]", (uint8_t *)&v24, 0xCu);
      }
      long long v19 = 0;
    }
  }
}

- (BOOL)isStructuredEventCandidateForURL:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v9 = [(SGExtractionDissector *)self packedJSURLFromURL:v6 title:v7 payload:&stru_1F24EEF20];
  LOBYTE(self) = [(SGExtractionDissector *)self shouldDownloadFull:v9];

  return (char)self;
}

- (id)jsonLdOutputFromURL:(id)a3 title:(id)a4 payload:(id)a5 extractionDate:(id)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  [a6 timeIntervalSince1970];
  id v13 = -[SGExtractionDissector packedJSURLFromURL:title:payload:creationTimestamp:](self, "packedJSURLFromURL:title:payload:creationTimestamp:", v12, v11, v10);

  uint64_t v14 = [(SGExtractionDissector *)self jsonLdOutputFromPackedJSEntity:v13];

  return v14;
}

- (id)jsonLdOutputFromTextMessage:(id)a3
{
  uint64_t v4 = [(SGExtractionDissector *)self packedJSTextMessageFromTextMessage:a3];
  uint64_t v5 = [(SGExtractionDissector *)self jsonLdOutputFromPackedJSEntity:v4];

  return v5;
}

- (id)jsonLdOutputFromMailMessage:(id)a3 schema:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SGExtractionDissector *)self packedJSMailMessageFromMailMessage:v7];
  uint64_t v9 = (void *)[v8 mutableCopy];

  id v10 = [v7 from];

  id v11 = [v10 emailAddress];
  id v12 = [(SGExtractionDissector *)self resolveSenderEmailAddressOnKnosis:v11];
  BOOL v13 = [(SGExtractionDissector *)self isSenderRelevant:v12];

  if (v13)
  {
    uint64_t v14 = sgEventsLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v19 = 0;
      _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_INFO, "SGExtractionDissector jsonLdOutputFromMailMessage setting isForwardedKey to YES", v19, 2u);
    }

    [v9 setValue:MEMORY[0x1E4F1CC38] forKey:@"isForwarded"];
  }
  v20[0] = v6;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];

  [v9 setObject:v15 forKeyedSubscript:@"schemas"];
  uint64_t v16 = (void *)[v9 copy];
  uint64_t v17 = [(SGExtractionDissector *)self jsonLdOutputFromPackedJSEntity:v16];

  return v17;
}

- (id)jsonLdOutputFromMailMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SGExtractionDissector *)self packedJSMailMessageFromMailMessage:v4];
  id v6 = [v4 from];

  id v7 = [v6 emailAddress];
  id v8 = [(SGExtractionDissector *)self resolveSenderEmailAddressOnKnosis:v7];
  BOOL v9 = [(SGExtractionDissector *)self isSenderRelevant:v8];

  if (v9) {
    [v5 setValue:MEMORY[0x1E4F1CC38] forKey:@"isForwarded"];
  }
  id v10 = [(SGExtractionDissector *)self jsonLdOutputFromPackedJSEntity:v5];

  return v10;
}

- (id)reverseMapMailMessage:(id)a3 withPreprocessedHTML:(id)a4 forCategory:(id)a5 withSchemExpectation:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  BOOL v13 = [(SGExtractionDissector *)self packedJSMailMessageFromMailMessage:a3];
  uint64_t v14 = [(SGExtractionDissector *)self _ensureHtmlIsString:v13];
  uint64_t v15 = (void *)[v14 mutableCopy];

  uint64_t v16 = [v12 objectForKeyedSubscript:@"plainText"];
  [v15 setObject:v16 forKeyedSubscript:@"webKitPlainText"];

  uint64_t v17 = [v12 objectForKeyedSubscript:@"ddResult"];

  [v15 setObject:v17 forKeyedSubscript:@"webKitPlainTextDDResult"];
  if (reverseMapMailMessage_withPreprocessedHTML_forCategory_withSchemExpectation___pasOnceToken88 != -1) {
    dispatch_once(&reverseMapMailMessage_withPreprocessedHTML_forCategory_withSchemExpectation___pasOnceToken88, &__block_literal_global_913);
  }
  long long v18 = [(id)reverseMapMailMessage_withPreprocessedHTML_forCategory_withSchemExpectation___pasExprOnceResult reverseMapEntity:v15 forCategory:v11 withSchemaExpectation:v10];

  return v18;
}

void __101__SGExtractionDissector_reverseMapMailMessage_withPreprocessedHTML_forCategory_withSchemExpectation___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)reverseMapMailMessage_withPreprocessedHTML_forCategory_withSchemExpectation___pasExprOnceResult;
  reverseMapMailMessage_withPreprocessedHTML_forCategory_withSchemExpectation___pasExprOnceResult = v1;
}

- (id)jsonLdOutputFromPackedJSEntity:(id)a3
{
  uint64_t v3 = [(SGExtractionDissector *)self _ensureHtmlIsString:a3];
  [v3 setValue:MEMORY[0x1E4F1CC38] forKey:@"fromSuggestTool"];
  id v4 = objc_opt_new();
  if (jsonLdOutputFromPackedJSEntity___pasOnceToken87 != -1) {
    dispatch_once(&jsonLdOutputFromPackedJSEntity___pasOnceToken87, &__block_literal_global_898);
  }
  id v5 = (id)jsonLdOutputFromPackedJSEntity___pasExprOnceResult;
  if ([v5 shouldDownloadFull:v3])
  {
    id v6 = [v3 objectForKey:@"schemas"];

    if (v6)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __56__SGExtractionDissector_jsonLdOutputFromPackedJSEntity___block_invoke_2;
      v19[3] = &unk_1E65BB140;
      id v7 = &v20;
      id v20 = v4;
      [v5 schemaOrgToJsonLd:v3 reply:v19];
    }
    else
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __56__SGExtractionDissector_jsonLdOutputFromPackedJSEntity___block_invoke_3;
      uint64_t v17 = &unk_1E65BB140;
      id v7 = &v18;
      id v18 = v4;
      [v5 emailToJsonLd:v3 reply:&v14];
    }
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, @"jsEntity", v14, v15, v16, v17);
  id v8 = [v4 objectForKeyedSubscript:@"jsEntity"];
  BOOL v9 = [v8 objectForKeyedSubscript:@"html"];
  uint64_t v10 = +[SGMonochrome stringByExtractingPlainTextFromHTML:v9 tableDelimiters:1 stripLinks:1];
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  else {
    id v12 = &stru_1F24EEF20;
  }
  [v4 setObject:v12 forKeyedSubscript:@"monochrome"];

  return v4;
}

uint64_t __56__SGExtractionDissector_jsonLdOutputFromPackedJSEntity___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addEntriesFromDictionary:a2];
}

uint64_t __56__SGExtractionDissector_jsonLdOutputFromPackedJSEntity___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addEntriesFromDictionary:a2];
}

void __56__SGExtractionDissector_jsonLdOutputFromPackedJSEntity___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)jsonLdOutputFromPackedJSEntity___pasExprOnceResult;
  jsonLdOutputFromPackedJSEntity___pasExprOnceResult = v1;
}

- (id)_ensureHtmlIsString:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"html"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = (void *)[v3 mutableCopy];
    id v7 = NSString;
    id v8 = [v3 objectForKeyedSubscript:@"html"];
    BOOL v9 = objc_msgSend(v7, "_pas_stringWithDataNoCopy:encoding:nullTerminated:", v8, 4, 0);
    [v6 setObject:v9 forKeyedSubscript:@"html"];

    id v3 = v6;
  }
  return v3;
}

- (id)jsDictForResolveCandidates:(id)a3 forCategory:(id)a4 label:(id)a5 rawIndexSet:(id)a6 taggedCharacterRanges:(id)a7
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  id v12 = a6;
  BOOL v13 = (__CFString *)a5;
  uint64_t v14 = (__CFString *)a4;
  uint64_t v15 = (__CFString *)a3;
  uint64_t v16 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __104__SGExtractionDissector_jsDictForResolveCandidates_forCategory_label_rawIndexSet_taggedCharacterRanges___block_invoke;
  v25[3] = &unk_1E65C0208;
  id v26 = v11;
  id v27 = v16;
  uint64_t v17 = v16;
  id v18 = v11;
  [v12 enumerateRangesUsingBlock:v25];

  long long v19 = &stru_1F24EEF20;
  if (v15) {
    id v20 = v15;
  }
  else {
    id v20 = &stru_1F24EEF20;
  }
  v28[0] = @"candidates";
  v28[1] = @"category";
  if (v14) {
    uint64_t v21 = v14;
  }
  else {
    uint64_t v21 = &stru_1F24EEF20;
  }
  v29[0] = v20;
  v29[1] = v21;
  v28[2] = @"label";
  v28[3] = @"candidateTaggedCharacterRanges";
  if (v13) {
    long long v22 = v13;
  }
  else {
    long long v22 = &stru_1F24EEF20;
  }
  if (v17) {
    long long v19 = v17;
  }
  v29[2] = v22;
  v29[3] = v19;
  long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];

  return v23;
}

void __104__SGExtractionDissector_jsDictForResolveCandidates_forCategory_label_rawIndexSet_taggedCharacterRanges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", a2, a3, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        BOOL v13 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v14 = [v12 dictRepresentation];
        if (v14) {
          [v6 addObject:v14];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [*(id *)(a1 + 40) addObject:v6];
}

- (id)resolveCandidatesWithoutXPC:(id)a3 forCategory:(id)a4 label:(id)a5 rawIndexSet:(id)a6 taggedCharacterRanges:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__27714;
  id v26 = __Block_byref_object_dispose__27715;
  id v27 = 0;
  long long v17 = [(SGExtractionDissector *)self jsDictForResolveCandidates:v12 forCategory:v13 label:v14 rawIndexSet:v15 taggedCharacterRanges:v16];
  if (resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___pasOnceToken86 != -1) {
    dispatch_once(&resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___pasOnceToken86, &__block_literal_global_885);
  }
  id v18 = (id)resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___pasExprOnceResult;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __105__SGExtractionDissector_resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___block_invoke_2;
  v21[3] = &unk_1E65BE5E0;
  v21[4] = &v22;
  [v18 resolveCandidatesForJSDict:v17 reply:v21];
  id v19 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v19;
}

void __105__SGExtractionDissector_resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___block_invoke_2(uint64_t a1, void *a2)
{
}

void __105__SGExtractionDissector_resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___pasExprOnceResult;
  resolveCandidatesWithoutXPC_forCategory_label_rawIndexSet_taggedCharacterRanges___pasExprOnceResult = v1;
}

- (id)resolveCandidates:(id)a3 forCategory:(id)a4 label:(id)a5 rawIndexSet:(id)a6 taggedCharacterRanges:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__27714;
  id v26 = __Block_byref_object_dispose__27715;
  id v27 = 0;
  long long v17 = [(SGExtractionDissector *)self jsDictForResolveCandidates:v12 forCategory:v13 label:v14 rawIndexSet:v15 taggedCharacterRanges:v16];
  id v18 = [(SGExtractionDissector *)self synchronousRemoteObjectProxyWithErrorHandler:0];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __95__SGExtractionDissector_resolveCandidates_forCategory_label_rawIndexSet_taggedCharacterRanges___block_invoke;
  v21[3] = &unk_1E65BE5E0;
  v21[4] = &v22;
  [v18 resolveCandidatesForJSDict:v17 reply:v21];

  id v19 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v19;
}

void __95__SGExtractionDissector_resolveCandidates_forCategory_label_rawIndexSet_taggedCharacterRanges___block_invoke(uint64_t a1, void *a2)
{
}

- (id)parseHTML:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__27714;
  id v13 = __Block_byref_object_dispose__27715;
  id v14 = 0;
  id v5 = [(SGExtractionDissector *)self synchronousRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__SGExtractionDissector_parseHTML___block_invoke;
  v8[3] = &unk_1E65BB118;
  v8[4] = &v9;
  [v5 parseHTML:v4 reply:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __35__SGExtractionDissector_parseHTML___block_invoke(uint64_t a1, void *a2)
{
}

- (id)eventClassificationWithoutXPCForMailMessage:(id)a3
{
  id v4 = a3;
  if (eventClassificationWithoutXPCForMailMessage___pasOnceToken85 != -1) {
    dispatch_once(&eventClassificationWithoutXPCForMailMessage___pasOnceToken85, &__block_literal_global_880);
  }
  id v5 = (id)eventClassificationWithoutXPCForMailMessage___pasExprOnceResult;
  id v6 = [(SGExtractionDissector *)self packedJSMailMessageFromMailMessage:v4];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__27714;
  id v14 = __Block_byref_object_dispose__27715;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SGExtractionDissector_eventClassificationWithoutXPCForMailMessage___block_invoke_2;
  v9[3] = &unk_1E65BB0C8;
  v9[4] = &v10;
  [v5 eventClassificationForEntity:v6 reply:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __69__SGExtractionDissector_eventClassificationWithoutXPCForMailMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SGStructuredEventClassification alloc] initWithDictionary:v3];

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __69__SGExtractionDissector_eventClassificationWithoutXPCForMailMessage___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)eventClassificationWithoutXPCForMailMessage___pasExprOnceResult;
  eventClassificationWithoutXPCForMailMessage___pasExprOnceResult = v1;
}

- (id)mergeSchemas:(id)a3 withExpectedSchemas:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__27714;
  id v16 = __Block_byref_object_dispose__27715;
  id v17 = 0;
  uint64_t v8 = [(SGExtractionDissector *)self synchronousRemoteObjectProxyWithErrorHandler:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__SGExtractionDissector_mergeSchemas_withExpectedSchemas___block_invoke;
  v11[3] = &unk_1E65BB0C8;
  v11[4] = &v12;
  [v8 mergeSchemas:v6 withExpectedSchemas:v7 reply:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __58__SGExtractionDissector_mergeSchemas_withExpectedSchemas___block_invoke(uint64_t a1, void *a2)
{
}

- (id)diffSchemas:(id)a3 withExpectedSchemas:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__27714;
  id v16 = __Block_byref_object_dispose__27715;
  id v17 = 0;
  uint64_t v8 = [(SGExtractionDissector *)self synchronousRemoteObjectProxyWithErrorHandler:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__SGExtractionDissector_diffSchemas_withExpectedSchemas___block_invoke;
  v11[3] = &unk_1E65BB0C8;
  v11[4] = &v12;
  [v8 diffSchemas:v6 withExpectedSchemas:v7 reply:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __57__SGExtractionDissector_diffSchemas_withExpectedSchemas___block_invoke(uint64_t a1, void *a2)
{
}

- (id)privacyAwareLogsForMLExtractions:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__27714;
  uint64_t v14 = __Block_byref_object_dispose__27715;
  id v15 = 0;
  uint64_t v5 = [(SGExtractionDissector *)self packedJSMailMessageFromMailMessage:v4];
  id v6 = [(SGExtractionDissector *)self synchronousRemoteObjectProxyWithErrorHandler:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SGExtractionDissector_privacyAwareLogsForMLExtractions___block_invoke;
  v9[3] = &unk_1E65BB0C8;
  v9[4] = &v10;
  [v6 privacyAwareLogsForMLExtractions:v5 reply:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __58__SGExtractionDissector_privacyAwareLogsForMLExtractions___block_invoke(uint64_t a1, void *a2)
{
}

- (id)eventClassificationForMailMessage:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__27714;
  id v17 = __Block_byref_object_dispose__27715;
  id v18 = 0;
  classifierCache = self->_classifierCache;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SGExtractionDissector_eventClassificationForMailMessage___block_invoke;
  v9[3] = &unk_1E65BB0F0;
  uint64_t v12 = &v13;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  [(_PASLock *)classifierCache runWithLockAcquired:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __59__SGExtractionDissector_eventClassificationForMailMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) messageId];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v8 = sgEventsLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [*(id *)(a1 + 32) spotlightUniqueIdentifier];
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v9;
      _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, "Found cached event classification for email %{public}@", buf, 0xCu);
LABEL_9:
    }
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 40) packedJSMailMessageFromMailMessage:*(void *)(a1 + 32)];
    id v10 = [*(id *)(a1 + 40) synchronousRemoteObjectProxyWithErrorHandler:0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__SGExtractionDissector_eventClassificationForMailMessage___block_invoke_2;
    v13[3] = &unk_1E65BB0C8;
    v13[4] = *(void *)(a1 + 48);
    [v10 eventClassificationForEntity:v8 reply:v13];

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      if ((unint64_t)[v3 count] >= 0x32) {
        [v3 removeAllObjects];
      }
      uint64_t v11 = [*(id *)(a1 + 32) messageId];

      if (v11)
      {
        uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        id v9 = [*(id *)(a1 + 32) messageId];
        [v3 setObject:v12 forKeyedSubscript:v9];
        goto LABEL_9;
      }
    }
  }
}

void __59__SGExtractionDissector_eventClassificationForMailMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SGStructuredEventClassification alloc] initWithDictionary:v3];

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)_addEnrichmentsToEntityForOutputItems:(id)a3 exceptions:(id)a4 jsMessageLogs:(id)a5 interaction:(id)a6 entity:(id)a7 startTime:(unint64_t)a8 backPressureHazard:(int)a9 tagPartialEvent:(BOOL)a10
{
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  id v123 = a3;
  id v15 = a4;
  id v16 = a5;
  id v130 = a6;
  id v17 = a7;
  uint64_t v18 = mach_absolute_time() - a8;
  if (SGMachTimeToNanoseconds_onceToken != -1) {
    dispatch_once(&SGMachTimeToNanoseconds_onceToken, &__block_literal_global_16442);
  }
  unint64_t v132 = v18 * SGMachTimeToNanoseconds_machTimebaseInfo / *(unsigned int *)algn_1EB9F00D4 / 0xF4240;
  if (os_variant_has_internal_diagnostics())
  {
    id v19 = [v17 duplicateKey];
    if ([v19 entityType] == 13 || objc_msgSend(v123, "count")) {
      goto LABEL_6;
    }
    uint64_t v121 = [v15 count];

    if (!v121)
    {
      id v19 = +[SGRTCLogging defaultLogger];
      [v19 logEventExtractionForTemplateName:0 extractionStatus:3 outputExceptions:0 outputInfos:0 jsMessageLogs:v16 jsOutputLogs:0 timingProcessing:v132];
LABEL_6:
    }
  }
  v127 = v17;
  v134 = v16;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v20 = v15;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v149 objects:v176 count:16];
  v124 = v20;
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v150;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v150 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v149 + 1) + 8 * i);
        id v26 = sgEventsLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          long long v31 = [v25 objectForKeyedSubscript:@"templateExceptionMessage"];
          uint64_t v32 = [v25 objectForKeyedSubscript:@"templateName"];
          long long v33 = [v25 objectForKeyedSubscript:@"templateShortName"];
          BOOL v34 = [v127 loggingIdentifier];
          *(_DWORD *)buf = 138544130;
          uint64_t v161 = v31;
          __int16 v162 = 2114;
          uint64_t v163 = (uint64_t)v32;
          __int16 v164 = 2114;
          v165 = v33;
          __int16 v166 = 2114;
          id v167 = v34;
          _os_log_error_impl(&dword_1CA650000, v26, OS_LOG_TYPE_ERROR, "JS Extraction Status: Template exception %{public}@, in template: %{public}@ (%{public}@). [SGPipelineEntity (%{public}@)]", buf, 0x2Au);

          id v20 = v124;
        }

        id v27 = +[SGRTCLogging defaultLogger];
        uint64_t v28 = [v25 objectForKeyedSubscript:@"templateName"];
        v174 = @"templateExceptionMessage";
        long long v29 = [v25 objectForKeyedSubscript:@"templateExceptionMessage"];
        v175 = v29;
        long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v175 forKeys:&v174 count:1];
        [v27 logEventExtractionForTemplateName:v28 extractionStatus:1 outputExceptions:0 outputInfos:0 jsMessageLogs:v134 jsOutputLogs:v30 timingProcessing:v132];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v149 objects:v176 count:16];
    }
    while (v22);
  }

  if ([v123 count])
  {
    uint64_t v35 = sgEventsLogHandle();
    v36 = v127;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = [v127 loggingIdentifier];
      uint64_t v38 = [v123 count];
      long long v39 = [v134 objectForKeyedSubscript:@"assetVersion"];
      double v40 = [v134 objectForKeyedSubscript:@"deviceLocale"];
      double v41 = [v134 objectForKeyedSubscript:@"documentType"];
      long long v42 = [v134 objectForKeyedSubscript:@"containsSchemaorg"];
      uint64_t v43 = [v134 objectForKeyedSubscript:@"bundleID"];
      *(_DWORD *)buf = 138544898;
      uint64_t v161 = v37;
      __int16 v162 = 2048;
      uint64_t v163 = v38;
      __int16 v164 = 2114;
      v165 = v39;
      __int16 v166 = 2114;
      id v167 = v40;
      __int16 v168 = 2114;
      v169 = v41;
      __int16 v170 = 2114;
      v171 = v42;
      __int16 v172 = 2114;
      v173 = v43;
      _os_log_impl(&dword_1CA650000, v35, OS_LOG_TYPE_DEFAULT, "JS OUTPUT for [SGPipelineEntity (%{public}@)]: %lu output(s). Asset version: %{public}@. Device locale: %{public}@. Document type: %{public}@. Contains schemaOrg?: %{public}@. Bundle ID: %{public}@", buf, 0x48u);

      v36 = v127;
    }

    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    id obj = v123;
    id v44 = v134;
    id v45 = v130;
    uint64_t v126 = [obj countByEnumeratingWithState:&v145 objects:v159 count:16];
    if (v126)
    {
      uint64_t v125 = *(void *)v146;
      do
      {
        for (uint64_t j = 0; j != v126; ++j)
        {
          if (*(void *)v146 != v125) {
            objc_enumerationMutation(obj);
          }
          double v47 = *(void **)(*((void *)&v145 + 1) + 8 * j);
          context = (void *)MEMORY[0x1CB79B230]();
          double v48 = sgEventsLogHandle();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v49 = [v47 objectForKeyedSubscript:@"templateName"];
            id v50 = [v47 objectForKeyedSubscript:@"templateShortName"];
            id v51 = [v36 loggingIdentifier];
            *(_DWORD *)buf = 138412802;
            uint64_t v161 = v49;
            __int16 v162 = 2112;
            uint64_t v163 = (uint64_t)v50;
            __int16 v164 = 2114;
            v165 = v51;
            _os_log_impl(&dword_1CA650000, v48, OS_LOG_TYPE_DEFAULT, "JS template match: %@ shortName:%@. [SGPipelineEntity (%{public}@)]", buf, 0x20u);

            id v45 = v130;
          }

          v52 = sgEventsLogHandle();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            v106 = [v36 loggingIdentifier];
            *(_DWORD *)buf = 138543619;
            uint64_t v161 = v106;
            __int16 v162 = 2117;
            uint64_t v163 = (uint64_t)v47;
            _os_log_debug_impl(&dword_1CA650000, v52, OS_LOG_TYPE_DEBUG, "[SGEntity (%{public}@)] - Complete JS output: %{sensitive}@", buf, 0x16u);
          }
          uint64_t v53 = objc_opt_new();
          uint64_t v54 = objc_opt_new();
          [v47 objectForKeyedSubscript:@"jsOutputLogs"];
          id v136 = v135 = (void *)v53;
          LOBYTE(v122) = a10;
          v133 = (void *)v54;
          id v55 = [(SGExtractionDissector *)self entityForOutputItem:v47 withSiblings:obj parentEntity:v36 outputExceptions:v53 outputInfos:v54 interaction:v45 tagPartialEvent:v122];
          uint64_t v56 = sgEventsLogHandle();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            id v57 = [v36 loggingIdentifier];
            id v58 = [v55 loggingIdentifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v161 = v57;
            __int16 v162 = 2114;
            uint64_t v163 = (uint64_t)v58;
            _os_log_impl(&dword_1CA650000, v56, OS_LOG_TYPE_DEFAULT, "[SGPipelineEntity (%{public}@)] -> [SGPipelineEnrichment (%{public}@)]", buf, 0x16u);

            id v45 = v130;
          }

          if (v55)
          {
            [v36 acquireDissectorLock];
            long long v143 = 0u;
            long long v144 = 0u;
            long long v141 = 0u;
            long long v142 = 0u;
            uint64_t v59 = [v36 tags];
            uint64_t v60 = [v59 countByEnumeratingWithState:&v141 objects:v158 count:16];
            if (v60)
            {
              uint64_t v61 = v60;
              uint64_t v62 = *(void *)v142;
              do
              {
                for (uint64_t k = 0; k != v61; ++k)
                {
                  if (*(void *)v142 != v62) {
                    objc_enumerationMutation(v59);
                  }
                  [v55 addTag:*(void *)(*((void *)&v141 + 1) + 8 * k)];
                }
                uint64_t v61 = [v59 countByEnumeratingWithState:&v141 objects:v158 count:16];
              }
              while (v61);
            }

            uint64_t v64 = (void *)MEMORY[0x1E4F5D9F0];
            v65 = [v47 objectForKeyedSubscript:@"templateShortName"];
            id v66 = [v64 extractedFromTemplateWithShortName:v65];
            [v55 addTag:v66];

            id v67 = (void *)MEMORY[0x1E4F5D9F0];
            id v68 = [v47 objectForKeyedSubscript:@"templateName"];
            id v69 = [v67 extractedFromTemplateWithName:v68];
            [v55 addTag:v69];

            v70 = [v44 objectForKeyedSubscript:@"domain"];

            if (v70)
            {
              uint64_t v71 = (void *)MEMORY[0x1E4F5D9F0];
              v72 = [v44 objectForKeyedSubscript:@"domain"];
              v73 = [v71 domain:v72];
              [v55 addTag:v73];
            }
            v74 = [MEMORY[0x1E4F5D9F0] inhuman];
            [v36 addTag:v74];

            uint64_t v75 = [MEMORY[0x1E4F5D9F0] fromExtractedDomain];
            [v36 addTag:v75];

            uint64_t v76 = [v44 objectForKeyedSubscript:@"reverseMapped_EVENT_TIME__START_DATETIME"];

            if (v76)
            {
              uint64_t v77 = [MEMORY[0x1E4F5D9F0] fieldReverseMapped:@"reverseMapped_EVENT_TIME__START_DATETIME"];
              [v55 addTag:v77];
            }
            long long v78 = [v44 objectForKeyedSubscript:@"reverseMapped_EVENT_LOCATION__START_ADDRESS"];

            if (v78)
            {
              long long v79 = [MEMORY[0x1E4F5D9F0] fieldReverseMapped:@"reverseMapped_EVENT_LOCATION__START_ADDRESS"];
              [v55 addTag:v79];
            }
            long long v80 = [v44 objectForKeyedSubscript:@"reverseMapped_EVENT_LOCATION__START_PLACE"];

            if (v80)
            {
              long long v81 = [MEMORY[0x1E4F5D9F0] fieldReverseMapped:@"reverseMapped_EVENT_LOCATION__START_PLACE"];
              [v55 addTag:v81];
            }
            long long v82 = [v44 objectForKeyedSubscript:@"reverseMapped_TITLE__HOTEL_RESTAURANT_NAME"];

            if (v82)
            {
              long long v83 = [MEMORY[0x1E4F5D9F0] fieldReverseMapped:@"reverseMapped_TITLE__HOTEL_RESTAURANT_NAME"];
              [v55 addTag:v83];
            }
            long long v84 = [v44 objectForKeyedSubscript:@"reverseMapped_TITLE__MOVIE_TICKET_NAME"];

            if (v84)
            {
              uint64_t v85 = [MEMORY[0x1E4F5D9F0] fieldReverseMapped:@"reverseMapped_TITLE__MOVIE_TICKET_NAME"];
              [v55 addTag:v85];
            }
            v156 = @"locationType";
            v86 = +[SGRTCLogging locationTypeForEntity:v55];
            uint64_t v157 = v86;
            __int16 v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v157 forKeys:&v156 count:1];
            [v136 addEntriesFromDictionary:v87];

            uint64_t v154 = @"isAllDay";
            v88 = NSNumber;
            v89 = [v55 tags];
            v90 = [MEMORY[0x1E4F5D9F0] allDay];
            uint64_t v91 = objc_msgSend(v88, "numberWithBool:", objc_msgSend(v89, "containsObject:", v90));
            v155 = v91;
            uint64_t v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v155 forKeys:&v154 count:1];
            [v136 addEntriesFromDictionary:v92];

            v36 = v127;
            *(unsigned char *)([v127 inhumanFeatures] + 8) = 1;
            id v45 = v130;
            if (v130) {
              [(SGExtractionDissector *)self addInteractionTagsToEnrichment:v55 inEntity:v127 interaction:v130];
            }
            [v127 addEnrichment:v55];
            [v127 releaseDissectorLock];
            v93 = sgEventsLogHandle();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v94 = [v127 loggingIdentifier];
              *(_DWORD *)buf = 138543362;
              uint64_t v161 = v94;
              _os_log_impl(&dword_1CA650000, v93, OS_LOG_TYPE_DEFAULT, "JS Extraction Status: Event. [SGPipelineEntity (%{public}@)]", buf, 0xCu);
            }
            v95 = sgEventsLogHandle();
            id v44 = v134;
            if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
            {
              v96 = [v55 loggingIdentifier];
              v97 = [v136 objectForKeyedSubscript:@"locationType"];
              v98 = [v47 objectForKeyedSubscript:@"geocodingMode"];
              id v99 = [v136 objectForKeyedSubscript:@"isAllDay"];
              v100 = [v136 objectForKeyedSubscript:@"outputUsecase"];
              v101 = [v136 objectForKeyedSubscript:@"outputCategory"];
              *(_DWORD *)buf = 138544642;
              uint64_t v161 = v96;
              __int16 v162 = 2112;
              uint64_t v163 = (uint64_t)v97;
              __int16 v164 = 2112;
              v165 = v98;
              __int16 v166 = 2112;
              id v167 = v99;
              __int16 v168 = 2112;
              v169 = v100;
              __int16 v170 = 2112;
              v171 = v101;
              _os_log_impl(&dword_1CA650000, v95, OS_LOG_TYPE_DEFAULT, "JS outputItem for enrichment [SGPipelineEnrichment (%{public}@)]: LocationType: %@. Geocoding Mode: %@. isAllDay?: %@. Output Usecase: %@. Output Category: %@.", buf, 0x3Eu);

              id v44 = v134;
              id v45 = v130;

              v36 = v127;
            }
            uint64_t v102 = 0;
          }
          else
          {
            v95 = sgEventsLogHandle();
            if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
            {
              v107 = objc_msgSend(v135, "_pas_componentsJoinedByString:", @", ");
              v108 = [v36 loggingIdentifier];
              *(_DWORD *)buf = 138412546;
              uint64_t v161 = v107;
              __int16 v162 = 2114;
              uint64_t v163 = (uint64_t)v108;
              _os_log_error_impl(&dword_1CA650000, v95, OS_LOG_TYPE_ERROR, "JS Extraction Status: Output Exception %@. [SGPipelineEntity (%{public}@)]", buf, 0x16u);
            }
            uint64_t v102 = 2;
          }

          v103 = v135;
          if (([v135 containsObject:@"pastEvent"] & 1) == 0)
          {
            id v104 = +[SGRTCLogging defaultLogger];
            v105 = [v47 objectForKeyedSubscript:@"templateName"];
            [v104 logEventExtractionForTemplateName:v105 extractionStatus:v102 outputExceptions:v135 outputInfos:v133 jsMessageLogs:v44 jsOutputLogs:v136 timingProcessing:v132];

            v103 = v135;
          }
        }
        uint64_t v126 = [obj countByEnumeratingWithState:&v145 objects:v159 count:16];
      }
      while (v126);
    }
  }
  else
  {
    v36 = v127;
    if ([v20 count])
    {
      [v127 acquireDissectorLock];
      v109 = [MEMORY[0x1E4F5D9F0] templateException];
      [v127 addTag:v109];

      [v127 releaseDissectorLock];
    }
  }
  [v36 acquireDissectorLock];
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  v110 = [v36 enrichments];
  uint64_t v111 = [v110 countByEnumeratingWithState:&v137 objects:v153 count:16];
  if (v111)
  {
    uint64_t v112 = v111;
    uint64_t v113 = *(void *)v138;
    if (a9 == 1) {
      unsigned int v114 = 12;
    }
    else {
      unsigned int v114 = 0;
    }
    if (a9) {
      uint64_t v115 = v114;
    }
    else {
      uint64_t v115 = 13;
    }
    do
    {
      for (uint64_t m = 0; m != v112; ++m)
      {
        if (*(void *)v138 != v113) {
          objc_enumerationMutation(v110);
        }
        id v117 = *(void **)(*((void *)&v137 + 1) + 8 * m);
        v118 = (void *)MEMORY[0x1CB79B230]();
        v119 = [v117 duplicateKey];
        [v119 entityType];
        if (SGEntityTypeIsEvent())
        {
          char v120 = [v117 isNaturalLanguageEvent];

          if (v120) {
            goto LABEL_81;
          }
          v119 = +[SGRTCLogging defaultLogger];
          [v119 logEventInteractionForEntity:v117 interface:0 actionType:v115];
        }

LABEL_81:
      }
      uint64_t v112 = [v110 countByEnumeratingWithState:&v137 objects:v153 count:16];
    }
    while (v112);
  }

  [v127 releaseDissectorLock];
}

- (void)addEnrichmentsToEntityForOutputItems:(id)a3 exceptions:(id)a4 jsMessageLogs:(id)a5 interaction:(id)a6 entity:(id)a7 startTime:(unint64_t)a8 backPressureHazard:(int)a9
{
  BYTE4(v9) = 0;
  LODWORD(v9) = a9;
  -[SGExtractionDissector _addEnrichmentsToEntityForOutputItems:exceptions:jsMessageLogs:interaction:entity:startTime:backPressureHazard:tagPartialEvent:](self, "_addEnrichmentsToEntityForOutputItems:exceptions:jsMessageLogs:interaction:entity:startTime:backPressureHazard:tagPartialEvent:", a3, a4, a5, a6, a7, a8, v9);
}

- (void)_addEnrichmentsToEntityForOutput:(id)a3 interaction:(id)a4 entity:(id)a5 startTime:(unint64_t)a6 backPressureHazard:(int)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v14 outputItems];
  id v16 = [v14 exceptionTemplates];
  id v17 = [v14 jsMessageLogs];
  LODWORD(v19) = a7;
  [(SGExtractionDissector *)self addEnrichmentsToEntityForOutputItems:v15 exceptions:v16 jsMessageLogs:v17 interaction:v13 entity:v12 startTime:a6 backPressureHazard:v19];

  uint64_t v18 = [v14 sourceMetadata];

  id v20 = [v18 objectForKeyedSubscript:@"needsSourceVerification"];

  objc_msgSend(v12, "setNeedsSourceVerification:", objc_msgSend(v20, "BOOLValue"));
}

- (void)_addEnrichmentsToEntityForOutput:(id)a3 entity:(id)a4 startTime:(unint64_t)a5 backPressureHazard:(int)a6
{
}

- (void)dissectInteraction:(id)a3 entity:(id)a4 context:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = sgEventsLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_msgSend(v8, "sg_LoggingIdentifier");
    id v13 = [v9 loggingIdentifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v12;
    __int16 v29 = 2114;
    long long v30 = v13;
    _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: Starting dissection of interaction [INIteraction (%{public}@)], [SGPipelineEntity (%{public}@)]", buf, 0x16u);
  }
  if ([MEMORY[0x1E4F5DAF0] detectStructuredEvents])
  {
    if ([MEMORY[0x1E4F5DAF0] detectStructuredEventsML])
    {
      id v14 = sgEventsLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        id v15 = "SGExtractionDissector dissectInteraction: Not dissecting because ML extraction is on";
LABEL_9:
        _os_log_debug_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEBUG, v15, buf, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    uint64_t v26 = mach_absolute_time();
    id v16 = (void *)MEMORY[0x1CB79B230]([v9 releaseDissectorLock]);
    id v14 = [v8 toSchemas];
    id v17 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v18 = [v9 duplicateKey];
    uint64_t v19 = [v18 bundleId];
    [v9 creationTimestamp];
    id v20 = -[SGExtractionDissector packedJSInteractionFromInteraction:bundleIdentifier:creationTimestamp:](self, "packedJSInteractionFromInteraction:bundleIdentifier:creationTimestamp:", v8, v19);
    uint64_t v21 = (void *)[v20 mutableCopy];

    if (v14)
    {
      uint64_t v22 = (void *)MEMORY[0x1CB79B230]();
      [v21 setObject:v14 forKeyedSubscript:@"schemas"];
      uint64_t v23 = [(SGExtractionDissector *)self outputFromPackedJSSchema:v21];
      if (!v23)
      {
LABEL_16:
        [v9 acquireDissectorLock];

        goto LABEL_17;
      }
      uint64_t v24 = (void *)MEMORY[0x1CB79B230]();
      -[SGExtractionDissector _addEnrichmentsToEntityForOutput:interaction:entity:startTime:backPressureHazard:](self, "_addEnrichmentsToEntityForOutput:interaction:entity:startTime:backPressureHazard:", v23, v8, v9, v26, [v10 backpressureHazard]);
    }
    else
    {
      uint64_t v23 = sgEventsLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v25 = objc_msgSend(v8, "sg_LoggingIdentifier");
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v25;
        _os_log_error_impl(&dword_1CA650000, v23, OS_LOG_TYPE_ERROR, "SGExtractionDissector dissectInteraction: Could not convert INInteraction (%@) to schema", buf, 0xCu);
      }
    }

    goto LABEL_16;
  }
  id v14 = sgEventsLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    id v15 = "SGExtractionDissector dissectInteraction: Skipping reverse template dissector: detectStructuredEvents is OFF";
    goto LABEL_9;
  }
LABEL_17:
}

- (void)_dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([MEMORY[0x1E4F5DAF0] detectStructuredEvents] & 1) == 0)
  {
    uint64_t v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      id v12 = "Skipping reverse template dissector: detectStructuredEvents is OFF";
      goto LABEL_18;
    }
    goto LABEL_6;
  }
  if ([MEMORY[0x1E4F5DAF0] detectStructuredEventsML])
  {
    uint64_t v11 = sgEventsLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      id v12 = "SGExtractionDissector: Not dissecting because ML extraction is on";
LABEL_18:
      _os_log_debug_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEBUG, v12, buf, 2u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  if ([(SGExtractionDissector *)self shouldProcessTextMessage:v8])
  {
    uint64_t v42 = mach_absolute_time();
    id v13 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v11 = [(SGExtractionDissector *)self packedJSTextMessageFromTextMessage:v8];
    [v9 releaseDissectorLock];
    if ([(SGExtractionDissector *)self mlExtractionEnabledForTextMessage:v8])
    {
      id v14 = sgEventsLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v9 loggingIdentifier];
        *(_DWORD *)buf = 138543362;
        v52 = v15;
        _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: dissectTextMessage LM extraction [SGPipelineEntity (%{public}@)]", buf, 0xCu);
      }
      id v16 = [(SGExtractionDissector *)self serializeTextMessageForFIE:v8];
      if (v16)
      {
        id v17 = objc_opt_new();
        id v49 = 0;
        uint64_t v18 = [v17 requestEventExtractionWithSerializedDocument:v16 documentType:1 options:0 error:&v49];
        id v19 = v49;
      }
      else
      {
        uint64_t v18 = 0;
        id v19 = 0;
      }
      if ([v18 count])
      {
        id v40 = v19;
        double v41 = v16;
        uint64_t v22 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v23 = [(SGExtractionDissector *)self convertDUOutputToSchemas:v18];
        uint64_t v24 = sgEventsLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: dissectTextMessage convert schema to SGOutput", buf, 2u);
        }

        id v25 = [v11 mutableCopy];
        long long v39 = (void *)v23;
        uint64_t v26 = (void *)MEMORY[0x1CB79B230]([v25 setObject:v23 forKeyedSubscript:@"schemas"]);
        id v27 = [(SGExtractionDissector *)self outputFromPackedJSSchema:v25];
        if (v27)
        {
          uint64_t v28 = [v27 outputItems];
          [v27 exceptionTemplates];
          v29 = uint64_t v43 = v10;
          long long v30 = [v27 jsMessageLogs];
          BYTE4(v38) = 1;
          LODWORD(v38) = [v43 backpressureHazard];
          -[SGExtractionDissector _addEnrichmentsToEntityForOutputItems:exceptions:jsMessageLogs:interaction:entity:startTime:backPressureHazard:tagPartialEvent:](self, "_addEnrichmentsToEntityForOutputItems:exceptions:jsMessageLogs:interaction:entity:startTime:backPressureHazard:tagPartialEvent:", v28, v29, v30, 0, v9, v42, v38);

          id v10 = v43;
        }

        id v19 = v40;
        id v16 = v41;
      }
    }
    else
    {
      id v20 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v18 = [(SGExtractionDissector *)self outputFromPackedJSTextMessage:v11];
      if (!v18) {
        goto LABEL_28;
      }
      uint64_t v21 = (void *)MEMORY[0x1CB79B230]();
      -[SGExtractionDissector _addEnrichmentsToEntityForOutput:entity:startTime:backPressureHazard:](self, "_addEnrichmentsToEntityForOutput:entity:startTime:backPressureHazard:", v18, v9, v42, [v10 backpressureHazard]);
    }

LABEL_28:
    [v9 acquireDissectorLock];
    if ([(SGExtractionDissector *)self _wasMessageReceivedMoreThanAWeekAgo:v8])
    {
      id v44 = v10;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v31 = [v9 enrichments];
      uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v46 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            id v37 = [MEMORY[0x1E4F5D9F0] eventExtractedFromOldDocument];
            [v36 addTag:v37];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v33);
      }

      id v10 = v44;
    }
    goto LABEL_6;
  }
  uint64_t v11 = sgEventsLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    id v12 = "SGExtractionDissector: Not dissecting based on shouldProcessTextMessage";
    goto LABEL_18;
  }
LABEL_6:
}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = sgLogHandle();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = sgLogHandle();
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA650000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SGExtractionDissector:dissectTextMessage", "", buf, 2u);
  }

  [(SGExtractionDissector *)self _dissectTextMessage:v10 entity:v9 context:v8];
  id v15 = sgLogHandle();
  id v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)id v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA650000, v16, OS_SIGNPOST_INTERVAL_END, v12, "SGExtractionDissector:dissectTextMessage", "", v17, 2u);
  }
}

- (BOOL)containsDateTextMessage:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  os_signpost_id_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  ddScannerLocuint64_t k = self->_ddScannerLock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SGExtractionDissector_containsDateTextMessage___block_invoke;
  v8[3] = &unk_1E65BB0A0;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [(_PASLock *)ddScannerLock runWithLockAcquired:v8];
  LOBYTE(ddScannerLock) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)ddScannerLock;
}

void __49__SGExtractionDissector_containsDateTextMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = a2;
  if (v11[1])
  {
    id v3 = [*(id *)(a1 + 32) textContent];
    int v4 = DDScannerScanString();

    if (v4)
    {
      CFArrayRef v5 = (const __CFArray *)DDScannerCopyResultsWithOptions();
      if (v5)
      {
        CFArrayRef v6 = v5;
        CFIndex Count = CFArrayGetCount(v5);
        if (Count >= 1)
        {
          CFIndex v8 = Count;
          CFIndex v9 = 0;
          while (1)
          {
            id v10 = (void *)MEMORY[0x1CB79B230]();
            CFArrayGetValueAtIndex(v6, v9);
            if (DDResultGetCategory() == 4) {
              break;
            }
            if (v8 == ++v9) {
              goto LABEL_10;
            }
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        }
LABEL_10:
        CFRelease(v6);
      }
    }
  }
}

- (BOOL)shouldProcessTextMessage:(id)a3
{
  id v3 = a3;
  int v4 = [v3 textContent];
  uint64_t v5 = [v4 length];

  if (v5) {
    int v6 = [v3 isTapBack] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)serializeTextMessageForFIE:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 uniqueIdentifier];
  if (!v4) {
    goto LABEL_10;
  }
  uint64_t v5 = (void *)v4;
  uint64_t v6 = [v3 conversationIdentifier];
  if (!v6) {
    goto LABEL_9;
  }
  id v7 = (void *)v6;
  uint64_t v8 = [v3 textContent];
  if (!v8)
  {

LABEL_9:
    goto LABEL_10;
  }
  CFIndex v9 = (void *)v8;
  id v10 = [v3 sender];
  uint64_t v11 = [v10 handles];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F503B8]);
    char v14 = [v3 sender];
    id v15 = [v14 displayName];
    id v16 = [v3 sender];
    id v17 = [v16 handles];
    uint64_t v18 = [v17 firstObject];
    id v19 = (void *)[v13 initWithName:v15 handleType:0 handle:v18 contactIdentifier:0];

    id v20 = [v3 recipients];
    uint64_t v21 = objc_msgSend(v20, "_pas_mappedArrayWithTransform:", &__block_literal_global_822);
    uint64_t v22 = (void *)v21;
    uint64_t v23 = (void *)MEMORY[0x1E4F1CBF0];
    if (v21) {
      uint64_t v23 = (void *)v21;
    }
    id v24 = v23;

    id v25 = objc_alloc(MEMORY[0x1E4F503A0]);
    uint64_t v26 = [v3 uniqueIdentifier];
    id v27 = [v3 domainIdentifier];
    uint64_t v28 = [v3 date];
    [v28 timeIntervalSinceReferenceDate];
    double v30 = v29;
    uint64_t v31 = [v3 conversationIdentifier];
    uint64_t v32 = [v3 textContent];
    uint64_t v33 = (void *)[v25 initWithUniqueId:v26 domainId:v27 absoluteTimestamp:v31 conversationId:v19 fromHandle:v24 toHandles:0 suggestedNickname:v30 suggestedPhotoPath:0 content:v32 accountIdentifier:0 accountHandles:0 accountType:0 attachment:0 URL:0];

    uint64_t v34 = [v33 encodeAsProto];

    goto LABEL_13;
  }
LABEL_10:
  uint64_t v35 = sgEventsLogHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA650000, v35, OS_LOG_TYPE_ERROR, "SGExtractionDissector failed to serialize textMessage", buf, 2u);
  }

  uint64_t v34 = 0;
LABEL_13:

  return v34;
}

id __52__SGExtractionDissector_serializeTextMessageForFIE___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F503B8];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 displayName];
  uint64_t v6 = [v3 handles];

  uint64_t v7 = [v6 firstObject];
  uint64_t v8 = (void *)v7;
  if (v7) {
    CFIndex v9 = (__CFString *)v7;
  }
  else {
    CFIndex v9 = &stru_1F24EEF20;
  }
  id v10 = (void *)[v4 initWithName:v5 handleType:0 handle:v9 contactIdentifier:0];

  return v10;
}

- (BOOL)_areAllOutputTemplatesSchemaOrg:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 outputItems];
  id v4 = v3;
  if (v3 && [v3 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"templateName", (void)v16);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = [v10 objectForKeyedSubscript:@"templateName"];
          }
          else
          {
            uint64_t v12 = 0;
          }

          int v13 = [v12 isEqualToString:@"schemaorg"];
          if (!v13)
          {
            BOOL v14 = 0;
            goto LABEL_17;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 1;
LABEL_17:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)_dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = sgEventsLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v8 spotlightUniqueIdentifier];
    int v13 = [v9 loggingIdentifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v137 = (uint64_t)v12;
    __int16 v138 = 2114;
    long long v139 = v13;
    _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "SGPipelineEntity: Starting dissection of mail [SGSimpleMailMessage (%{public}@)], [SGPipelineEntity (%{public}@)]", buf, 0x16u);
  }
  if ([MEMORY[0x1E4F5DAF0] detectStructuredEvents])
  {
    if ([MEMORY[0x1E4F5DAF0] detectStructuredEventsML])
    {
      BOOL v14 = sgEventsLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v9 loggingIdentifier];
        *(_DWORD *)buf = 138543362;
        uint64_t v137 = (uint64_t)v15;
        _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector dissectMailMessage: Not dissecting because ML extraction is on. [SGPipelineEntity (%{public}@)]", buf, 0xCu);
      }
      goto LABEL_82;
    }
    long long v16 = [v8 from];
    long long v17 = [v16 emailAddress];
    uint64_t v18 = [(SGExtractionDissector *)self resolveSenderEmailAddressOnKnosis:v17];

    uint64_t v113 = v18;
    BOOL v19 = [(SGExtractionDissector *)self isSenderRelevant:v18];
    id v20 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v21 = [(SGExtractionDissector *)self packedJSMailMessageFromMailMessage:v8 context:v10];
    LODWORD(v20) = [v9 isPartiallyDownloaded];
    unsigned int v114 = v9;
    [v9 releaseDissectorLock];
    uint64_t v22 = [(SGExtractionDissector *)self eventClassificationForMailMessage:v8];
    id v23 = objc_alloc(MEMORY[0x1E4F93B68]);
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __60__SGExtractionDissector__dissectMailMessage_entity_context___block_invoke;
    v126[3] = &unk_1E65BB058;
    BOOL v131 = v19;
    id v118 = v8;
    id v127 = v118;
    id v111 = v22;
    id v128 = v111;
    v129 = self;
    id v116 = v21;
    id v130 = v116;
    id v24 = (void *)[v23 initWithBlock:v126];
    uint64_t v112 = v24;
    if (v20)
    {
      id v25 = [v24 result];
      int v26 = [v25 BOOLValue];

      if (v26)
      {
        id v9 = v114;
        [v114 acquireDissectorLock];
        [v114 requestFullDownload];
        id v27 = sgEventsLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = [v114 loggingIdentifier];
          *(_DWORD *)buf = 138543362;
          uint64_t v137 = (uint64_t)v28;
          _os_log_impl(&dword_1CA650000, v27, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector dissectMailMessage: Email is not fully downloaded. Requesting full download. [SGPipelineEntity (%{public}@)]", buf, 0xCu);
        }
        double v29 = +[SGRTCLogging defaultLogger];
        [v29 logAggregateSummaryForInteraction:@"emailDownloadRequested"];
        BOOL v14 = v113;
        double v30 = v111;
        goto LABEL_81;
      }
    }
    id obj = (id)mach_absolute_time();
    uint64_t v31 = objc_opt_new();
    uint64_t v32 = [v118 from];
    uint64_t v33 = [v32 name];

    if (v33)
    {
      uint64_t v34 = [v118 from];
      uint64_t v35 = [v34 name];
      v135 = v35;
      v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v135 count:1];
      [v31 setValue:v36 forKey:@"authors"];
    }
    uint64_t v115 = v31;
    id v37 = [v118 from];
    uint64_t v38 = [v37 emailAddress];

    id v9 = v114;
    if (v38)
    {
      long long v39 = [v118 from];
      id v40 = [v39 emailAddress];
      v134 = v40;
      double v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v134 count:1];
      [v115 setValue:v41 forKey:@"authorEmailAddresses"];
    }
    uint64_t v42 = [v118 subject];

    double v29 = v115;
    uint64_t v43 = v118;
    if (v42)
    {
      id v44 = [v118 subject];
      [v115 setValue:v44 forKey:@"subject"];
    }
    long long v45 = [v118 date];

    if (v45)
    {
      long long v46 = [v118 date];
      long long v47 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v46 dateStyle:1 timeStyle:3];
      [v115 setValue:v47 forKey:@"dateReceived"];

      uint64_t v43 = v118;
    }
    long long v48 = [v43 textContent];

    if (v48)
    {
      id v50 = [v43 textContent];
      unint64_t v51 = [v50 length];
      v52 = [v43 textContent];
      uint64_t v53 = v52;
      if (v51 >= 0x97)
      {
        uint64_t v54 = [v52 substringToIndex:150];

        uint64_t v53 = (void *)v54;
      }

      double v29 = v115;
      [v115 setValue:v53 forKey:@"bodySnippet"];

      uint64_t v43 = v118;
    }
    if (v19)
    {
      id v55 = [(SGExtractionDissector *)self getSenderNameOnContacts:v113];
      if (!v55)
      {
        uint64_t v56 = [v43 from];
        id v55 = [v56 name];

        if (!v55)
        {
          id v57 = [v43 from];
          id v55 = [v57 emailAddress];
        }
      }
      uint64_t v49 = [v29 setValue:v55 forKey:@"originalAuthors"];
    }
    else
    {
      id v55 = 0;
    }
    v110 = v10;
    uint64_t v58 = MEMORY[0x1CB79B230](v49);
    uint64_t v59 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v29 options:0 error:0];
    uint64_t v60 = (void *)v58;
    uint64_t v61 = (void *)v59;
    if (v61) {
      uint64_t v62 = (void *)[[NSString alloc] initWithData:v61 encoding:4];
    }
    else {
      uint64_t v62 = 0;
    }
    v108 = [v116 objectForKeyedSubscript:@"html"];
    uint64_t v63 = -[SGExtractionDissector exceedsMaxHTMLContentLength:](self, "exceedsMaxHTMLContentLength:", [v108 length]);
    v109 = v61;
    if (v63)
    {
      obja = sgEventsLogHandle();
      if (os_log_type_enabled(obja, OS_LOG_TYPE_ERROR))
      {
        v105 = [v114 loggingIdentifier];
        *(_DWORD *)buf = 138543362;
        uint64_t v137 = (uint64_t)v105;
        _os_log_error_impl(&dword_1CA650000, obja, OS_LOG_TYPE_ERROR, "SGExtractionDissector dissectMailMessage: HTML content exceeding max length. [SGPipelineEntity (%{public}@)]", buf, 0xCu);
      }
      BOOL v14 = v113;
      double v30 = v111;
LABEL_80:

      id v10 = v110;
LABEL_81:

      goto LABEL_82;
    }
    id v107 = v8;
    if (v19) {
      uint64_t v63 = [v116 setValue:MEMORY[0x1E4F1CC38] forKey:@"isForwarded"];
    }
    uint64_t v64 = (void *)MEMORY[0x1CB79B230](v63);
    v65 = [(SGExtractionDissector *)self outputFromPackedJSMailMessage:v116];
    id v66 = sgEventsLogHandle();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      id v67 = [v65 outputItems];
      uint64_t v68 = [v67 count];
      id v69 = [v114 loggingIdentifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v137 = v68;
      __int16 v138 = 2114;
      long long v139 = v69;
      _os_log_impl(&dword_1CA650000, v66, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector %lu items extracted by regex pipeline for [SGPipelineEntity (%{public}@)]", buf, 0x16u);

      uint64_t v43 = v118;
      id v9 = v114;
    }

    if (v19
      || [(SGExtractionDissector *)self _areAllOutputTemplatesSchemaOrg:v65]
      || ([(SGExtractionDissector *)self outputFromLLMDissectionOfMailMessage:v43], (uint64_t v70 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if ([(SGExtractionDissector *)self requiredFieldsMissingForOutput:v65])
      {
        if (v65)
        {
          uint64_t v77 = [v65 outputItems];
        }
        else
        {
          uint64_t v77 = 0;
        }
        long long v78 = [v9 sourceKey];
        long long v79 = -[SGExtractionDissector extractMissingValuesFromMLForMail:outputItems:fromSuggestTool:](self, "extractMissingValuesFromMLForMail:outputItems:fromSuggestTool:", v118, v77, [v78 isEqualToString:@"suggest_tool"]);

        if (v65) {
        if (v79)
        }
        {
          v133 = v79;
          long long v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v133 count:1];
          uint64_t v81 = [(SGExtractionDissector *)self outputFromSchemas:v80 inMessage:v118];
        }
        else
        {
          long long v82 = [SGOutput alloc];
          long long v80 = [v65 sourceMetadata];
          uint64_t v83 = [v65 exceptionTemplates];
          long long v84 = [v65 jsMessageLogs];
          uint64_t v81 = [(SGOutput *)v82 initWithOutputItems:0 sourceMetadata:v80 exeptionTemplates:v83 jsMessageLogs:v84];

          v65 = (void *)v83;
          id v9 = v114;
        }

        v65 = (void *)v81;
        uint64_t v43 = v118;
      }
      if (!v65) {
        goto LABEL_62;
      }
      uint64_t v85 = (void *)MEMORY[0x1CB79B230]();
      -[SGExtractionDissector _addEnrichmentsToEntityForOutput:entity:startTime:backPressureHazard:](self, "_addEnrichmentsToEntityForOutput:entity:startTime:backPressureHazard:", v65, v9, obj, [v110 backpressureHazard]);
    }
    else
    {
      uint64_t v71 = (void *)v70;
      v72 = (void *)MEMORY[0x1CB79B230]();
      v73 = sgEventsLogHandle();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v73, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: Create Enrichments from the SGOutput created using LLM extracted events", buf, 2u);
      }

      v74 = [v71 outputItems];
      uint64_t v75 = [v71 exceptionTemplates];
      uint64_t v76 = [v71 jsMessageLogs];
      BYTE4(v106) = 1;
      LODWORD(v106) = [v110 backpressureHazard];
      -[SGExtractionDissector _addEnrichmentsToEntityForOutputItems:exceptions:jsMessageLogs:interaction:entity:startTime:backPressureHazard:tagPartialEvent:](self, "_addEnrichmentsToEntityForOutputItems:exceptions:jsMessageLogs:interaction:entity:startTime:backPressureHazard:tagPartialEvent:", v74, v75, v76, 0, v114, obj, v106);

      id v9 = v114;

      uint64_t v43 = v118;
    }

LABEL_62:
    [v9 acquireDissectorLock];
    BOOL v86 = [(SGExtractionDissector *)self _wasMessageReceivedMoreThanAWeekAgo:v43];
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    obja = [v9 enrichments];
    uint64_t v87 = [obja countByEnumeratingWithState:&v122 objects:v132 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      uint64_t v89 = *(void *)v123;
      unint64_t v90 = 0x1E4F5D000uLL;
      uint64_t v117 = *(void *)v123;
      do
      {
        uint64_t v91 = 0;
        uint64_t v119 = v88;
        do
        {
          if (*(void *)v123 != v89) {
            objc_enumerationMutation(obja);
          }
          uint64_t v92 = *(void **)(*((void *)&v122 + 1) + 8 * v91);
          if (v62)
          {
            v93 = [*(id *)(v90 + 2544) eventSourceMetadata:v62];
            [v92 addTag:v93];
          }
          if (v19)
          {
            BOOL v94 = v86;
            v95 = v62;
            BOOL v96 = v19;
            v97 = [*(id *)(v90 + 2544) isForwardedMail:1];
            [v92 addTag:v97];

            v98 = [MEMORY[0x1E4F1CA60] dictionary];
            id v99 = [v118 from];
            [v99 emailAddress];
            unint64_t v100 = v90;
            uint64_t v102 = v101 = v55;
            [v98 setValue:v102 forKey:@"email"];

            id v55 = v101;
            unint64_t v90 = v100;

            [v98 setValue:v55 forKey:@"name"];
            v103 = [*(id *)(v100 + 2544) author:v98];
            if (v103) {
              [v92 addTag:v103];
            }

            BOOL v19 = v96;
            uint64_t v62 = v95;
            BOOL v86 = v94;
            uint64_t v89 = v117;
            uint64_t v88 = v119;
          }
          if (v86)
          {
            id v104 = [*(id *)(v90 + 2544) eventExtractedFromOldDocument];
            [v92 addTag:v104];
          }
          ++v91;
        }
        while (v88 != v91);
        uint64_t v88 = [obja countByEnumeratingWithState:&v122 objects:v132 count:16];
      }
      while (v88);
      id v8 = v107;
      id v9 = v114;
    }
    else
    {
      id v8 = v107;
    }
    BOOL v14 = v113;
    double v30 = v111;
    double v29 = v115;
    goto LABEL_80;
  }
  BOOL v14 = sgEventsLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector dissectMailMessage: Skipping reverse template dissector: detectStructuredEvents is OFF.", buf, 2u);
  }
LABEL_82:
}

id __60__SGExtractionDissector__dissectMailMessage_entity_context___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = sgEventsLogHandle();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
LABEL_3:

      id v3 = (void *)MEMORY[0x1E4F1CC38];
      goto LABEL_9;
    }
    id v5 = [*(id *)(a1 + 32) spotlightUniqueIdentifier];
    int v8 = 138543362;
    id v9 = v5;
    uint64_t v6 = "Found forwarded / reply email %{public}@";
LABEL_13:
    _os_log_debug_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v8, 0xCu);

    goto LABEL_3;
  }
  id v4 = *(void **)(a1 + 40);
  if (v4 && [v4 isCandidateForExtraction])
  {
    v2 = sgEventsLogHandle();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_3;
    }
    id v5 = [*(id *)(a1 + 32) spotlightUniqueIdentifier];
    int v8 = 138543362;
    id v9 = v5;
    uint64_t v6 = "Found cached event classification for email %{public}@";
    goto LABEL_13;
  }
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "shouldDownloadFull:", *(void *)(a1 + 56)));
LABEL_9:
  return v3;
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = sgLogHandle();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  int v13 = sgLogHandle();
  BOOL v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA650000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "SGExtractionDissector:dissectMailMessage", "", buf, 2u);
  }

  [(SGExtractionDissector *)self _dissectMailMessage:v10 entity:v9 context:v8];
  id v15 = sgLogHandle();
  long long v16 = v15;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)long long v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA650000, v16, OS_SIGNPOST_INTERVAL_END, v12, "SGExtractionDissector:dissectMailMessage", "", v17, 2u);
  }
}

- (id)eventExtractionFromMail:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [SGSimpleMailMessage alloc];
  id v5 = [(SGSimpleMailMessage *)v4 convertMailMessageToBMMailMessage:v3];

  if (v5)
  {
    uint64_t v6 = [v5 encodeAsProto];
    uint64_t v7 = objc_opt_new();
    id v8 = sgEventsLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: Calling Document Understanding for event extraction.", buf, 2u);
    }

    id v9 = objc_opt_new();
    id v19 = 0;
    id v10 = [v7 requestEventExtractionWithSerializedDocument:v6 documentType:0 options:0 error:&v19];
    id v11 = v19;

    os_signpost_id_t v12 = sgEventsLogHandle();
    int v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v11;
        _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "SGExtractionDissector: Received error from Document Understanding. Error: %@", buf, 0xCu);
      }

      id v14 = 0;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: Successful collection of events from Document Understanding", buf, 2u);
      }

      id v14 = v10;
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F5DC80];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = @"Not able to create mail content for event extraction.";
    long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v11 = [v15 errorWithDomain:v16 code:4 userInfo:v17];

    uint64_t v6 = sgEventsLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v11;
      _os_log_error_impl(&dword_1CA650000, v6, OS_LOG_TYPE_ERROR, "SGExtractionDissector: Error: %@", buf, 0xCu);
    }
    id v14 = 0;
  }

  return v14;
}

- (id)outputFromLLMDissectionOfMailMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(SGExtractionDissector *)self eventExtractionFromMail:v4];
  uint64_t v6 = v5;
  if (v5 && [v5 count])
  {
    uint64_t v7 = (void *)MEMORY[0x1CB79B230]();
    id v8 = [(SGExtractionDissector *)self convertDUOutputToSchemas:v6];
    id v9 = sgEventsLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_signpost_id_t v12 = 0;
      _os_log_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: Convert schema to SGOutput", v12, 2u);
    }

    id v10 = [(SGExtractionDissector *)self outputFromSchemas:v8 inMessage:v4];
  }
  else
  {
    id v8 = sgEventsLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: No events found in mail. Return Early", buf, 2u);
    }
    id v10 = 0;
  }

  return v10;
}

- (id)convertMailMessageToDUDocument:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = [v3 headers];
  id v9 = [v8 valueForKey:@"value"];
  id v10 = [v3 headers];
  id v11 = [v10 valueForKey:@"key"];
  os_signpost_id_t v12 = [v7 dictionaryWithObjects:v9 forKeys:v11];

  int v13 = [v3 subject];
  [v6 setSubject:v13];

  id v14 = [v3 from];
  id v15 = [v14 name];
  [v6 setSenderName:v15];

  uint64_t v16 = [v3 from];
  long long v17 = [v16 emailAddress];
  [v6 setSenderEmail:v17];

  uint64_t v18 = [v3 senderDomain];
  [v6 setSenderDomain:v18];

  id v19 = [v3 to];
  id v20 = sgMap();
  [v6 setRecipientNames:v20];

  id v21 = [v3 to];
  uint64_t v22 = sgMap();
  [v6 setRecipientEmails:v22];

  id v23 = [v3 cc];
  id v24 = sgMap();
  [v6 setCcNames:v24];

  id v25 = [v3 cc];
  int v26 = sgMap();
  [v6 setCcEmails:v26];

  id v27 = [v3 bcc];
  uint64_t v28 = sgMap();
  [v6 setBccNames:v28];

  double v29 = [v3 bcc];
  double v30 = sgMap();
  [v6 setBccEmails:v30];

  uint64_t v31 = [v3 date];
  [v6 setDateReceived:v31];

  [v6 setHeaders:v12];
  uint64_t v32 = [v3 textContent];
  [v6 setText:v32];

  [v5 setDocumentEmailData:v6];
  [v4 setDocumentHTMLData:v5];
  uint64_t v33 = [v3 textContent];
  [v4 setText:v33];

  uint64_t v34 = [v3 date];

  [v4 setDateCreated:v34];
  return v4;
}

uint64_t __56__SGExtractionDissector_convertMailMessageToDUDocument___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 emailAddress];
}

__CFString *__56__SGExtractionDissector_convertMailMessageToDUDocument___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  id v3 = v2;
  if (!v2) {
    v2 = &stru_1F24EEF20;
  }
  id v4 = v2;

  return v4;
}

uint64_t __56__SGExtractionDissector_convertMailMessageToDUDocument___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 emailAddress];
}

__CFString *__56__SGExtractionDissector_convertMailMessageToDUDocument___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  id v3 = v2;
  if (!v2) {
    v2 = &stru_1F24EEF20;
  }
  id v4 = v2;

  return v4;
}

uint64_t __56__SGExtractionDissector_convertMailMessageToDUDocument___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 emailAddress];
}

__CFString *__56__SGExtractionDissector_convertMailMessageToDUDocument___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  id v3 = v2;
  if (!v2) {
    v2 = &stru_1F24EEF20;
  }
  id v4 = v2;

  return v4;
}

- (id)convertTextMessageToDUDocument:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 textContent];
  [v4 setText:v5];

  uint64_t v6 = [v3 date];
  [v4 setDateCreated:v6];

  uint64_t v7 = [v3 uniqueIdentifier];

  [v4 setIdentifier:v7];
  return v4;
}

- (id)convertDUOutputToSchemas:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  uint64_t v6 = sgEventsLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEBUG, "SGExtractionDissector: Converting DU events to schema supported by suggestions", buf, 2u);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        int v13 = objc_msgSend(v4, "getSchemaCreatorForEvent:", v12, (void)v17);
        id v14 = [v13 processDURawEvent:v12];
        [v5 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v9);
  }

  id v15 = (void *)[v5 copy];
  return v15;
}

- (id)getSenderNameOnContacts:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = [v3 answers];
    uint64_t v20 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v20)
    {
      uint64_t v6 = *(void *)v27;
      id v21 = v5;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(v5);
          }
          uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v9 = [v8 facts];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v23;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v23 != v12) {
                  objc_enumerationMutation(v9);
                }
                id v14 = *(void **)(*((void *)&v22 + 1) + 8 * j);
                id v15 = [v14 predicateId];
                if ([v15 isEqualToString:@"PS33"])
                {
                  uint64_t v16 = [v14 objectID];

                  if (v16)
                  {
                    long long v17 = [v14 objectID];

                    id v5 = v21;
                    goto LABEL_23;
                  }
                }
                else
                {
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v11);
          }

          id v5 = v21;
          uint64_t v6 = v19;
        }
        long long v17 = 0;
        uint64_t v20 = [v21 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v20);
    }
    else
    {
      long long v17 = 0;
    }
LABEL_23:
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

- (BOOL)isSenderRelevant:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->shouldExtractFromFwdMail)
  {
    uint64_t v10 = sgEventsLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "SGExtractionDissector: 'CoreSuggestionsInternals/ForwardedEmailEventExtraction' is disabled";
      int v13 = buf;
      goto LABEL_12;
    }
LABEL_13:
    BOOL v11 = 0;
    goto LABEL_14;
  }
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v6 = [v4 answers];
  if (!v6
    || (id v7 = (void *)v6,
        [v5 answers],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v7,
        !v9))
  {
LABEL_8:
    uint64_t v10 = sgEventsLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      uint64_t v12 = "SGExtractionDissector: ignoring email from unknown sender";
      int v13 = (uint8_t *)&v16;
LABEL_12:
      _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  uint64_t v10 = sgEventsLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "SGExtractionDissector: extracting from forwarded / reply email", v15, 2u);
  }
  BOOL v11 = 1;
LABEL_14:

  return v11;
}

- (id)resolveSenderEmailAddressOnKnosis:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:@"pvp(PS520, qselect(NIL, pvp(PS406, '%@')))", v5];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F706A0]) initWithKGQ:v6 query:@"Suggestions Sender Relevancy Query" limit:&unk_1F25360C0 offset:&unk_1F2536030];
  knosisService = self->knosisService;
  id v15 = 0;
  uint64_t v9 = [(GDXPCKnosisService *)knosisService executeKGQ:v7 error:&v15];
  id v10 = v15;
  if (v10)
  {
    BOOL v11 = sgEventsLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v14 = [v10 debugDescription];
      *(_DWORD *)buf = 138412290;
      long long v17 = v14;
      _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "SGExtractionDissector resolveSenderEmailAddressOnKnosis error: %@", buf, 0xCu);
    }
    id v12 = 0;
  }
  else
  {
    id v12 = v9;
  }

  return v12;
}

- (id)eventsFromSchemaOrgItems:(id)a3
{
  id v3 = self;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = [(SGExtractionDissector *)self packedJSSchemaFromSchemaOrgItems:a3];
  id v5 = [(SGExtractionDissector *)v3 outputFromPackedJSSchema:v4];
  uint64_t v6 = [v5 outputItems];

  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v28 = +[SGSqlEntityStore sqlStoreInMemory];
  if (v28)
  {
    long long v23 = v6;
    long long v24 = v4;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v8 = v6;
    uint64_t v30 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v30)
    {
      uint64_t v29 = *(void *)v33;
      long long v25 = v7;
      long long v26 = v3;
      id v27 = v8;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(v8);
          }
          uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          BOOL v11 = +[SGDuplicateKey duplicateKeyForSchemaOrg];
          id v12 = [[SGPipelineEntity alloc] initWithDuplicateKey:v11 title:&stru_1F24EEF20];
          int v13 = objc_opt_new();
          id v14 = objc_opt_new();
          id v15 = [(SGExtractionDissector *)v3 entityForOutputItem:v10 withSiblings:v8 parentEntity:v12 outputExceptions:v13 outputInfos:v14 interaction:0];
          if (v15)
          {
            uint64_t v31 = v11;
            [v28 writeEnrichment:v15];
            __int16 v16 = [v15 duplicateKey];
            long long v17 = [v28 loadEventByDuplicateKey:v16];

            uint64_t v18 = [v17 convertToEvent:v28];
            uint64_t v19 = sgEventsLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v20 = [(SGEntity *)v12 loggingIdentifier];
              id v21 = [v18 loggingIdentifier];
              *(_DWORD *)buf = 138543618;
              id v37 = v20;
              __int16 v38 = 2114;
              long long v39 = v21;
              _os_log_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEFAULT, "[SGPipelineEnrichment (%{public}@)] -> [SGEvent (%{public}@)]", buf, 0x16u);

              id v3 = v26;
              id v7 = v25;
            }

            [v7 addObject:v18];
            id v8 = v27;
            BOOL v11 = v31;
          }
        }
        uint64_t v30 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v30);
    }

    uint64_t v6 = v23;
    id v4 = v24;
  }

  return v7;
}

- (id)outputFromPackedJSTextMessage:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__27714;
  int v13 = __Block_byref_object_dispose__27715;
  id v14 = 0;
  id v5 = [(SGExtractionDissector *)self synchronousRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SGExtractionDissector_outputFromPackedJSTextMessage___block_invoke;
  v8[3] = &unk_1E65BB008;
  void v8[4] = &v9;
  [v5 textMessageToOutput:v4 reply:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __55__SGExtractionDissector_outputFromPackedJSTextMessage___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  int v13 = [[SGOutput alloc] initWithOutputItems:v12 sourceMetadata:v11 exeptionTemplates:v10 jsMessageLogs:v9];

  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

- (id)outputFromPackedJSMailMessage:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__27714;
  int v13 = __Block_byref_object_dispose__27715;
  id v14 = 0;
  id v5 = [(SGExtractionDissector *)self synchronousRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SGExtractionDissector_outputFromPackedJSMailMessage___block_invoke;
  v8[3] = &unk_1E65BB008;
  void v8[4] = &v9;
  [v5 emailToOutput:v4 reply:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __55__SGExtractionDissector_outputFromPackedJSMailMessage___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  int v13 = [[SGOutput alloc] initWithOutputItems:v12 sourceMetadata:v11 exeptionTemplates:v10 jsMessageLogs:v9];

  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

- (id)outputFromPackedJSSchema:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__27714;
  int v13 = __Block_byref_object_dispose__27715;
  id v14 = 0;
  id v5 = [(SGExtractionDissector *)self synchronousRemoteObjectProxyWithErrorHandler:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__SGExtractionDissector_outputFromPackedJSSchema___block_invoke;
  v8[3] = &unk_1E65BB008;
  void v8[4] = &v9;
  [v5 schemaOrgToOutput:v4 reply:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __50__SGExtractionDissector_outputFromPackedJSSchema___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  int v13 = [[SGOutput alloc] initWithOutputItems:v12 sourceMetadata:v11 exeptionTemplates:v10 jsMessageLogs:v9];

  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

- (BOOL)shouldDownloadFull:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v5 = [(SGExtractionDissector *)self synchronousRemoteObjectProxyWithErrorHandler:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SGExtractionDissector_shouldDownloadFull___block_invoke;
  v7[3] = &unk_1E65BAFE0;
  v7[4] = &v8;
  [v5 shouldDownloadFull:v4 reply:v7];

  LOBYTE(v5) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

uint64_t __44__SGExtractionDissector_shouldDownloadFull___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)exceedsMaxHTMLContentLength:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 > 0xC8000)
  {
    id v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134218240;
      unint64_t v7 = a3;
      __int16 v8 = 1024;
      int v9 = 819200;
      _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "Skipping reverse template dissector: contentLen = %llu > %i", (uint8_t *)&v6, 0x12u);
    }
  }
  return a3 > 0xC8000;
}

- (id)packedJSSchemaFromSchemaOrgItems:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = @"schemas";
  v8[0] = a3;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  id v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (id)packedJSURLFromURL:(id)a3 title:(id)a4 payload:(id)a5 creationTimestamp:(double)a6
{
  id v9 = a3;
  uint64_t v10 = (__CFString *)a4;
  char v11 = (__CFString *)a5;
  id v12 = (void *)MEMORY[0x1CB79B230]();
  int v13 = [v9 host];
  uint64_t v14 = [v13 stringByReplacingOccurrencesOfString:@"www." withString:@"na@"];

  id v15 = objc_opt_new();
  __int16 v16 = v15;
  if (v14) {
    long long v17 = v14;
  }
  else {
    long long v17 = &stru_1F24EEF20;
  }
  [v15 setObject:v17 forKeyedSubscript:@"from"];
  if (v10) {
    uint64_t v18 = v10;
  }
  else {
    uint64_t v18 = &stru_1F24EEF20;
  }
  [v16 setObject:v18 forKeyedSubscript:@"subject"];
  if (v11) {
    uint64_t v19 = v11;
  }
  else {
    uint64_t v19 = &stru_1F24EEF20;
  }
  [v16 setObject:v19 forKeyedSubscript:@"html"];
  uint64_t v20 = [v9 absoluteString];
  id v21 = (void *)v20;
  if (v20) {
    long long v22 = (__CFString *)v20;
  }
  else {
    long long v22 = &stru_1F24EEF20;
  }
  [v16 setObject:v22 forKeyedSubscript:@"url"];

  long long v23 = [NSNumber numberWithDouble:a6];
  [v16 setObject:v23 forKeyedSubscript:@"epoch"];

  [v16 setObject:@"webpage" forKeyedSubscript:@"documentType"];

  return v16;
}

- (id)packedJSURLFromURL:(id)a3 title:(id)a4 payload:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  char v11 = objc_opt_new();
  [v11 timeIntervalSince1970];
  id v12 = -[SGExtractionDissector packedJSURLFromURL:title:payload:creationTimestamp:](self, "packedJSURLFromURL:title:payload:creationTimestamp:", v10, v9, v8);

  return v12;
}

- (id)packedJSInteractionFromInteraction:(id)a3 bundleIdentifier:(id)a4 creationTimestamp:(double)a5
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (__CFString *)a4;
  id v9 = (void *)MEMORY[0x1CB79B230]();
  v14[0] = @"epoch";
  id v10 = [NSNumber numberWithDouble:a5];
  v15[0] = v10;
  v15[1] = @"interaction";
  v14[1] = @"documentType";
  v14[2] = @"bundleID";
  if (v8) {
    char v11 = v8;
  }
  else {
    char v11 = &stru_1F24EEF20;
  }
  v15[2] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (id)packedJSTextMessageFromTextMessage:(id)a3
{
  void v19[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1CB79B230]();
  v18[0] = @"epoch";
  id v5 = NSNumber;
  int v6 = [v3 date];
  [v6 timeIntervalSince1970];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  v19[0] = v7;
  v18[1] = @"plain";
  uint64_t v8 = [v3 textContent];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_1F24EEF20;
  }
  v19[1] = v10;
  v18[2] = @"from";
  char v11 = [v3 author];
  id v12 = [v11 handles];
  uint64_t v13 = [v12 firstObject];
  uint64_t v14 = (void *)v13;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  else {
    id v15 = &stru_1F24EEF20;
  }
  v18[3] = @"documentType";
  v19[2] = v15;
  v19[3] = @"sms";
  __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];

  return v16;
}

- (id)packedJSMailMessageFromMailMessage:(id)a3
{
  return [(SGExtractionDissector *)self packedJSMailMessageFromMailMessage:a3 context:0];
}

- (id)packedJSMailMessageFromMailMessage:(id)a3 context:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v48 = a4;
  int v6 = objc_opt_new();
  id v7 = NSNumber;
  uint64_t v8 = [v5 date];
  [v8 timeIntervalSince1970];
  id v9 = objc_msgSend(v7, "numberWithDouble:");
  [v6 setObject:v9 forKeyedSubscript:@"epoch"];

  id v10 = [v5 from];
  uint64_t v11 = [v10 emailAddress];
  id v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  else {
    uint64_t v13 = &stru_1F24EEF20;
  }
  long long v47 = v13;

  uint64_t v14 = [v5 htmlContentData];
  id v15 = (void *)v14;
  __int16 v16 = (void *)*MEMORY[0x1E4F93BF8];
  if (v14) {
    __int16 v16 = (void *)v14;
  }
  id v46 = v16;

  long long v17 = [(id)objc_opt_class() subjectFromMailMessage:v5];
  uint64_t v18 = v17;
  if (v17)
  {
    long long v45 = v17;
  }
  else
  {
    uint64_t v19 = [v5 subject];
    uint64_t v20 = (void *)v19;
    if (v19) {
      id v21 = (__CFString *)v19;
    }
    else {
      id v21 = &stru_1F24EEF20;
    }
    long long v45 = v21;
  }
  uint64_t v49 = v5;
  long long v22 = [v5 headers];
  long long v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v24 = v22;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v51 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v30 = [v29 key];
        v54[0] = v30;
        uint64_t v31 = [v29 value];
        v54[1] = v31;
        long long v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
        [v23 addObject:v32];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v26);
  }

  [v6 setObject:v47 forKeyedSubscript:@"from"];
  [v6 setObject:v45 forKeyedSubscript:@"subject"];
  long long v33 = (void *)[v23 copy];
  [v6 setObject:v33 forKeyedSubscript:@"headers"];

  [v6 setObject:v46 forKeyedSubscript:@"html"];
  uint64_t v34 = [v49 textContent];
  long long v35 = (void *)v34;
  if (v34) {
    v36 = (__CFString *)v34;
  }
  else {
    v36 = &stru_1F24EEF20;
  }
  [v6 setObject:v36 forKeyedSubscript:@"text"];

  id v37 = [v49 accountHandles];

  if (v37)
  {
    __int16 v38 = [v49 accountHandles];
    long long v39 = (void *)[v38 copy];
    [v6 setObject:v39 forKeyedSubscript:@"accountHandles"];
  }
  id v40 = +[SGAccountsAdapter sharedInstance];
  uint64_t v41 = [v49 source];
  uint64_t v42 = [v40 serverIdentifierForAccount:v41];

  if (v42) {
    [v6 setObject:v42 forKeyedSubscript:@"accountServerIdentifier"];
  }
  [v6 setObject:@"email" forKeyedSubscript:@"documentType"];
  if (v48)
  {
    uint64_t v43 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v48, "extractionMode"));
    [v6 setObject:v43 forKeyedSubscript:@"extractionMode"];
  }
  else
  {
    [v6 setObject:&unk_1F2536030 forKeyedSubscript:@"extractionMode"];
  }

  return v6;
}

- (id)entityForOutputItem:(id)a3 withSiblings:(id)a4 parentEntity:(id)a5 outputExceptions:(id)a6 outputInfos:(id)a7 interaction:(id)a8 tagPartialEvent:(BOOL)a9
{
  v276[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v260 = a5;
  id v17 = a6;
  id v261 = a7;
  id v18 = a8;
  if (v16)
  {
    if ([v16 containsObject:v15])
    {
      v257 = v16;
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v20 = [v16 arrayByAddingObject:v15];

      v257 = (void *)v20;
    }
  }
  else
  {
    v276[0] = v15;
    v257 = [MEMORY[0x1E4F1C978] arrayWithObjects:v276 count:1];
  }
  id v21 = [v15 objectForKeyedSubscript:@"transportation"];
  long long v22 = (void *)[v21 mutableCopy];

  long long v23 = [v15 objectForKeyedSubscript:@"event"];
  id v24 = [v15 objectForKeyedSubscript:@"cancelled"];
  int v240 = [v24 BOOLValue];

  if (entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent__paramsOnceToken != -1) {
    dispatch_once(&entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent__paramsOnceToken, &__block_literal_global_542);
  }
  uint64_t v25 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent__paramsSharedKeySet];
  id v262 = v26;

  v246 = v17;
  v259 = v23;
  if (!v22
    || ([v22 objectForKeyedSubscript:@"graph"],
        uint64_t v27 = objc_claimAutoreleasedReturnValue(),
        int v28 = [v27 isEqual:@"iata"],
        v27,
        !v28))
  {
    char v59 = 0;
    v256 = 0;
    v258 = 0;
    goto LABEL_31;
  }
  context = (void *)MEMORY[0x1CB79B230]();
  uint64_t v29 = [v22 objectForKeyedSubscript:@"carrier"];
  uint64_t v30 = +[SGFlightData sharedInstance];
  uint64_t v31 = [v29 objectForKeyedSubscript:@"code"];

  if (v31)
  {
    long long v32 = [v29 objectForKeyedSubscript:@"code"];
    [v262 setObject:v32 forKeyedSubscript:&unk_1F2536060];
  }
  else
  {
    uint64_t v83 = [v29 objectForKeyedSubscript:@"name"];

    if (v83)
    {
      long long v84 = [v29 objectForKeyedSubscript:@"name"];
      long long v32 = [v30 carrierIataCodeForCarrierName:v84];

      if (v32)
      {
        [v262 setObject:v32 forKeyedSubscript:&unk_1F2536060];
        [v261 addObject:@"flightDataResolvedCarrierCode"];
      }
      else
      {
        v108 = [v29 objectForKeyedSubscript:@"name"];
        [v262 setObject:v108 forKeyedSubscript:&unk_1F2536060];
      }
    }
    else
    {
      long long v32 = 0;
    }
  }
  long long v33 = [v29 objectForKeyedSubscript:@"name"];

  if (v33)
  {
    uint64_t v34 = [v29 objectForKeyedSubscript:@"name"];
    [v262 setObject:v34 forKeyedSubscript:&unk_1F2536078];
LABEL_14:

    goto LABEL_15;
  }
  if (v32)
  {
    uint64_t v85 = [v30 nameForCarrier:v32];
    if (v85)
    {
      uint64_t v34 = (void *)v85;
      [v262 setObject:v85 forKeyedSubscript:&unk_1F2536078];
      [v261 addObject:@"flightDataResolvedCarrierName"];
      goto LABEL_14;
    }
    [v262 setObject:v32 forKeyedSubscript:&unk_1F2536078];
  }
LABEL_15:
  SEL v255 = a2;
  id v244 = v18;
  long long v35 = [v22 objectForKeyedSubscript:@"origin"];
  v36 = (void *)[v35 mutableCopy];
  [v22 setObject:v36 forKeyedSubscript:@"origin"];

  id v37 = [v22 objectForKeyedSubscript:@"destination"];
  __int16 v38 = (void *)[v37 mutableCopy];
  [v22 setObject:v38 forKeyedSubscript:@"destination"];

  long long v39 = [v22 objectForKeyedSubscript:@"origin"];
  id v40 = [v39 objectForKeyedSubscript:@"code"];

  uint64_t v41 = [v22 objectForKeyedSubscript:@"destination"];
  uint64_t v42 = [v41 objectForKeyedSubscript:@"code"];

  if (v42) {
    BOOL v43 = v40 == 0;
  }
  else {
    BOOL v43 = 1;
  }
  if (v43 && !v32) {
    [v261 addObject:@"flightMissingCarrierCode"];
  }
  v267[0] = MEMORY[0x1E4F143A8];
  v267[1] = 3221225472;
  void v267[2] = __128__SGExtractionDissector_entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent___block_invoke_578;
  v267[3] = &unk_1E65BAF70;
  id v268 = v257;
  id v249 = v29;
  id v269 = v249;
  v253 = (void (**)(void, void))MEMORY[0x1CB79B4C0](v267);
  if (v40)
  {
    id v44 = v262;
  }
  else
  {
    id v44 = v262;
    if (!v32) {
      goto LABEL_96;
    }
    long long v45 = [v22 objectForKeyedSubscript:@"origin"];
    uint64_t v46 = [v45 objectForKeyedSubscript:@"name"];
    if (v46)
    {
      long long v47 = (void *)v46;
      id v40 = [v22 objectForKeyedSubscript:@"routeDesignation"];

      if (!v40) {
        goto LABEL_96;
      }
      id v48 = [v22 objectForKeyedSubscript:@"origin"];
      uint64_t v49 = [v48 objectForKeyedSubscript:@"name"];
      long long v45 = ((void (**)(void, void *))v253)[2](v253, v49);

      long long v50 = NSNumber;
      long long v51 = [v22 objectForKeyedSubscript:@"routeDesignation"];
      long long v52 = objc_msgSend(v50, "numberWithInteger:", objc_msgSend(v51, "integerValue"));
      char v53 = [v45 containsObject:v52];

      if ((v53 & 1) == 0)
      {
        v230 = [MEMORY[0x1E4F28B00] currentHandler];
        [v230 handleFailureInMethod:v255, self, @"SGExtractionDissector.m", 490, @"Invalid parameter not satisfying: %@", @"[flightNumbers containsObject:@([transportationDict[@\"routeDesignation\"] integerValue])]" object file lineNumber description];
      }
      uint64_t v54 = [v22 objectForKeyedSubscript:@"origin"];
      id v55 = [v54 objectForKeyedSubscript:@"name"];
      uint64_t v56 = [v22 objectForKeyedSubscript:@"routeDesignation"];
      id v40 = objc_msgSend(v30, "airportCodeForAirportName:flightCarrier:flightNumber:otherKnownFlightsToAirport:outputInfos:", v55, v32, (unsigned __int16)objc_msgSend(v56, "integerValue"), v45, v261);

      if (v40)
      {
        id v57 = [v22 objectForKeyedSubscript:@"origin"];
        [v57 setObject:v40 forKeyedSubscript:@"code"];

        uint64_t v58 = @"flightDataResolvedAirportCode";
      }
      else
      {
        uint64_t v58 = @"flightMissingData";
      }
      id v44 = v262;
      [v261 addObject:v58];
    }
    else
    {
      id v40 = 0;
    }
  }
LABEL_96:
  v109 = [v22 objectForKeyedSubscript:@"origin"];
  v110 = [v109 objectForKeyedSubscript:@"name"];

  if (!v110)
  {
    if (!v40) {
      goto LABEL_102;
    }
    uint64_t v113 = [v30 bestLocalizedNameForAirport:v40];
    if (v113)
    {
      [v44 setObject:v113 forKeyedSubscript:&unk_1F2536090];
      [v261 addObject:@"flightDataResolvedAirportName"];
    }
    else
    {
      [v44 setObject:v40 forKeyedSubscript:&unk_1F2536090];
    }

LABEL_106:
    [v44 setObject:v40 forKeyedSubscript:&unk_1F2536030];
    unsigned int v114 = [v30 timezoneOlsonCodeForAirport:v40];
    if (v114)
    {
      v258 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v114];
      uint64_t v115 = @"flightDataResolvedAirportTZ";
    }
    else
    {
      v258 = 0;
      uint64_t v115 = @"flightMissingTZForAirportCode";
    }
    [v261 addObject:v115];

    if (v42) {
      goto LABEL_121;
    }
    goto LABEL_110;
  }
  id v111 = [v22 objectForKeyedSubscript:@"origin"];
  uint64_t v112 = [v111 objectForKeyedSubscript:@"name"];
  [v44 setObject:v112 forKeyedSubscript:&unk_1F2536090];

  if (v40) {
    goto LABEL_106;
  }
LABEL_102:
  v258 = 0;
  if (v42) {
    goto LABEL_121;
  }
LABEL_110:
  if (!v32) {
    goto LABEL_121;
  }
  id v116 = [v22 objectForKeyedSubscript:@"destination"];
  uint64_t v42 = [v116 objectForKeyedSubscript:@"name"];
  if (v42)
  {
    uint64_t v117 = [v22 objectForKeyedSubscript:@"routeDesignation"];

    if (!v117)
    {
      uint64_t v42 = 0;
      goto LABEL_121;
    }
    id v118 = [v22 objectForKeyedSubscript:@"destination"];
    uint64_t v119 = [v118 objectForKeyedSubscript:@"name"];
    id v116 = ((void (**)(void, void *))v253)[2](v253, v119);

    char v120 = NSNumber;
    uint64_t v121 = [v22 objectForKeyedSubscript:@"routeDesignation"];
    long long v122 = objc_msgSend(v120, "numberWithInteger:", objc_msgSend(v121, "integerValue"));
    char v123 = [v116 containsObject:v122];

    if ((v123 & 1) == 0)
    {
      v231 = [MEMORY[0x1E4F28B00] currentHandler];
      [v231 handleFailureInMethod:v255, self, @"SGExtractionDissector.m", 529, @"Invalid parameter not satisfying: %@", @"[flightNumbers containsObject:@([transportationDict[@\"routeDesignation\"] integerValue])]" object file lineNumber description];
    }
    long long v124 = [v22 objectForKeyedSubscript:@"destination"];
    long long v125 = [v124 objectForKeyedSubscript:@"name"];
    uint64_t v126 = [v22 objectForKeyedSubscript:@"routeDesignation"];
    uint64_t v42 = objc_msgSend(v30, "airportCodeForAirportName:flightCarrier:flightNumber:otherKnownFlightsToAirport:outputInfos:", v125, v32, (unsigned __int16)objc_msgSend(v126, "integerValue"), v116, v261);

    if (v42)
    {
      id v127 = [v22 objectForKeyedSubscript:@"destination"];
      [v127 setObject:v42 forKeyedSubscript:@"code"];

      id v128 = @"flightDataResolvedAirportCode";
    }
    else
    {
      id v128 = @"flightMissingData";
    }
    id v44 = v262;
    [v261 addObject:v128];
  }

LABEL_121:
  v129 = [v22 objectForKeyedSubscript:@"destination"];
  id v130 = [v129 objectForKeyedSubscript:@"name"];

  if (v130)
  {
    BOOL v131 = [v22 objectForKeyedSubscript:@"destination"];
    unint64_t v132 = [v131 objectForKeyedSubscript:@"name"];
    [v44 setObject:v132 forKeyedSubscript:&unk_1F25360A8];

    if (!v42) {
      goto LABEL_127;
    }
LABEL_130:
    [v44 setObject:v42 forKeyedSubscript:&unk_1F2536048];
    v134 = [v30 timezoneOlsonCodeForAirport:v42];
    if (v134)
    {
      v256 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v134];
      v135 = @"flightDataResolvedAirportTZ";
    }
    else
    {
      v256 = 0;
      v135 = @"flightMissingTZForAirportCode";
    }
    [v261 addObject:v135];

    goto LABEL_134;
  }
  if (v42)
  {
    v133 = [v30 bestLocalizedNameForAirport:v42];
    if (v133)
    {
      [v44 setObject:v133 forKeyedSubscript:&unk_1F25360A8];
      [v261 addObject:@"flightDataResolvedAirportName"];
    }
    else
    {
      [v44 setObject:v42 forKeyedSubscript:&unk_1F25360A8];
    }

    goto LABEL_130;
  }
LABEL_127:
  v256 = 0;
LABEL_134:
  id v136 = [v22 objectForKeyedSubscript:@"origin"];
  uint64_t v137 = [v136 objectForKeyedSubscript:@"code"];

  __int16 v138 = [v22 objectForKeyedSubscript:@"destination"];
  long long v139 = [v138 objectForKeyedSubscript:@"code"];

  int v140 = [v139 isEqual:v137];
  char v141 = v140;
  id v17 = v246;
  if (v140)
  {
    long long v142 = sgEventsLogHandle();
    if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
    {
      long long v143 = [v15 objectForKeyedSubscript:@"templateName"];
      long long v144 = [v15 objectForKeyedSubscript:@"templateShortName"];
      *(_DWORD *)buf = 138412802;
      v271 = v137;
      __int16 v272 = 2112;
      v273 = v143;
      __int16 v274 = 2112;
      v275 = v144;
      _os_log_debug_impl(&dword_1CA650000, v142, OS_LOG_TYPE_DEBUG, "The same origin and destination: %@ (template: %@, short %@)", buf, 0x20u);

      id v17 = v246;
    }

    [v17 addObject:@"flightHasSameOriginAndDestination"];
  }

  if (v141)
  {
    long long v78 = 0;
    id v18 = v244;
    goto LABEL_243;
  }
  char v59 = 1;
  id v18 = v244;
  long long v23 = v259;
LABEL_31:
  uint64_t v60 = [v15 objectForKeyedSubscript:@"title"];
  uint64_t v248 = +[SGExtractionDissector addParams:v262 toParameterizedString:v60 allowAlternatives:1];

  uint64_t v61 = [v15 objectForKeyedSubscript:@"groupId"];
  uint64_t v62 = +[SGExtractionDissector addParams:v262 toParameterizedString:v61];

  v254 = v62;
  if (![v62 length])
  {
    uint64_t v77 = sgEventsLogHandle();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v77, OS_LOG_TYPE_ERROR, "SGExtractionDissector - groupId is empty. Unable to create Duplicate keys", buf, 2u);
    }

    [v17 addObject:@"emptyGroupId"];
    long long v78 = 0;
    v74 = (void *)v248;
    goto LABEL_242;
  }
  uint64_t v63 = [v15 objectForKeyedSubscript:@"fallbackGroupId"];
  uint64_t v243 = +[SGExtractionDissector addParams:v262 toParameterizedString:v63];

  uint64_t v64 = [v15 objectForKeyedSubscript:@"notes"];
  v239 = +[SGExtractionDissector addParams:v262 toParameterizedString:v64];

  if (!v22)
  {
    v74 = (void *)v248;
    if (v23)
    {
      long long v79 = [v23 objectForKeyedSubscript:@"start"];

      if (v79)
      {
        long long v80 = (void *)MEMORY[0x1E4F1C9D8];
        uint64_t v81 = [v23 objectForKeyedSubscript:@"start"];
        long long v82 = [v81 objectForKeyedSubscript:@"dateTime"];
        contexta = objc_msgSend(v80, "sg_dateComponentsFromISO8601String:", v82);
      }
      else
      {
        contexta = 0;
      }
      BOOL v86 = [v23 objectForKeyedSubscript:@"end"];

      if (v86)
      {
        uint64_t v87 = (void *)MEMORY[0x1E4F1C9D8];
        uint64_t v88 = [v23 objectForKeyedSubscript:@"end"];
        uint64_t v89 = [v88 objectForKeyedSubscript:@"dateTime"];
        uint64_t v90 = objc_msgSend(v87, "sg_dateComponentsFromISO8601String:", v89);

        v250 = (void *)v90;
        if (v90) {
          goto LABEL_62;
        }
      }
      if ([contexta hour] != 0x7FFFFFFFFFFFFFFFLL)
      {
        v250 = (void *)[contexta copy];
        objc_msgSend(v250, "setMinute:", objc_msgSend(v250, "minute") + 90);
        int v234 = 1;
        goto LABEL_63;
      }
    }
    else
    {
      contexta = 0;
    }
    v250 = 0;
LABEL_62:
    int v234 = 0;
LABEL_63:
    unint64_t v76 = 0x1E4F1C000uLL;
    goto LABEL_64;
  }
  v65 = (void *)MEMORY[0x1E4F1C9D8];
  id v66 = [v22 objectForKeyedSubscript:@"origin"];
  id v67 = [v66 objectForKeyedSubscript:@"dateTime"];
  uint64_t v68 = objc_msgSend(v65, "sg_dateComponentsFromISO8601String:", v67);

  id v69 = (void *)v68;
  uint64_t v70 = (void *)MEMORY[0x1E4F1C9D8];
  uint64_t v71 = [v22 objectForKeyedSubscript:@"destination"];
  v72 = [v71 objectForKeyedSubscript:@"dateTime"];
  v250 = objc_msgSend(v70, "sg_dateComponentsFromISO8601String:", v72);

  v73 = [v69 timeZone];

  v74 = (void *)v248;
  if (!v73 && v258) {
    [v69 setTimeZone:v258];
  }
  contexta = v69;
  uint64_t v75 = [v250 timeZone];

  unint64_t v76 = 0x1E4F1C000;
  if (v75)
  {
    int v234 = 0;
    id v17 = v246;
    long long v23 = v259;
  }
  else
  {
    id v17 = v246;
    long long v23 = v259;
    if (v256) {
      objc_msgSend(v250, "setTimeZone:");
    }
    int v234 = 0;
  }
LABEL_64:
  if (entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent__locationsOnceToken != -1) {
    dispatch_once(&entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent__locationsOnceToken, &__block_literal_global_650_27847);
  }
  uint64_t v91 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v92 = [*(id *)(v76 + 2656) dictionaryWithSharedKeySet:entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent__locationsSharedKeySet];
  id v247 = v92;

  v93 = objc_opt_new();
  if (v23)
  {
    BOOL v94 = [v23 objectForKeyedSubscript:@"location"];

    if (v94)
    {
      v95 = [v23 objectForKeyedSubscript:@"location"];
      [v247 setObject:v95 forKeyedSubscript:&unk_1F2536030];
      int v96 = v240;
LABEL_74:

      goto LABEL_75;
    }
  }
  int v96 = v240;
  if (v22)
  {
    v97 = [v22 objectForKeyedSubscript:@"origin"];

    if (v97)
    {
      v98 = [v22 objectForKeyedSubscript:@"origin"];
      [v247 setObject:v98 forKeyedSubscript:&unk_1F2536060];
    }
    id v99 = [v22 objectForKeyedSubscript:@"destination"];

    if (v99)
    {
      v95 = [v22 objectForKeyedSubscript:@"destination"];
      [v247 setObject:v95 forKeyedSubscript:&unk_1F2536090];
      goto LABEL_74;
    }
  }
LABEL_75:
  v263[0] = MEMORY[0x1E4F143A8];
  v263[1] = 3221225472;
  v263[2] = __128__SGExtractionDissector_entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent___block_invoke_2;
  v263[3] = &unk_1E65BAF98;
  char v266 = v59;
  id v100 = v261;
  id v264 = v100;
  id v242 = v93;
  id v265 = v242;
  [v247 enumerateKeysAndObjectsUsingBlock:v263];
  v101 = [v260 duplicateKey];
  uint64_t v102 = +[SGDuplicateKey duplicateKeyForPseudoEventWithGroupId:v254 parentKey:v101];

  v236 = (void *)v102;
  v103 = [[SGPipelineEnrichment alloc] initWithDuplicateKey:v102 title:v74 parent:v260];
  if (v243)
  {
    id v104 = objc_msgSend(MEMORY[0x1E4F5D9F0], "extraKey:");
    [(SGEntity *)v103 addTag:v104];
  }
  [(SGEntity *)v103 setState:1];
  if (v96)
  {
    v105 = [MEMORY[0x1E4F5D9F0] extractedEventCancellation];
    [(SGEntity *)v103 addTag:v105];
  }
  uint64_t v106 = [v15 objectForKeyedSubscript:@"category"];
  v235 = v106;
  if ([v106 isEqual:@"flight"])
  {
    uint64_t v107 = [MEMORY[0x1E4F5D9F0] extractedFlight];
  }
  else if ([v106 isEqual:@"bus"])
  {
    uint64_t v107 = [MEMORY[0x1E4F5D9F0] extractedBus];
  }
  else if ([v106 isEqual:@"train"])
  {
    uint64_t v107 = [MEMORY[0x1E4F5D9F0] extractedTrain];
  }
  else if ([v106 isEqual:@"boat"])
  {
    uint64_t v107 = [MEMORY[0x1E4F5D9F0] extractedBoat];
  }
  else if ([v106 isEqual:@"hotel"])
  {
    uint64_t v107 = [MEMORY[0x1E4F5D9F0] extractedHotel];
  }
  else if ([v106 isEqual:@"carRental"])
  {
    uint64_t v107 = [MEMORY[0x1E4F5D9F0] extractedCarRental];
  }
  else if ([v106 isEqual:@"ticket"])
  {
    uint64_t v107 = [MEMORY[0x1E4F5D9F0] extractedTicket];
  }
  else if ([v106 isEqual:@"movie"])
  {
    uint64_t v107 = [MEMORY[0x1E4F5D9F0] extractedMovie];
  }
  else if ([v106 isEqual:@"food"])
  {
    uint64_t v107 = [MEMORY[0x1E4F5D9F0] extractedFood];
  }
  else if ([v106 isEqual:@"social"])
  {
    uint64_t v107 = [MEMORY[0x1E4F5D9F0] extractedSocial];
  }
  else
  {
    if (![v106 isEqual:@"appointment"]) {
      goto LABEL_154;
    }
    uint64_t v107 = [MEMORY[0x1E4F5D9F0] extractedAppointment];
  }
  long long v145 = (void *)v107;
  [(SGEntity *)v103 addTag:v107];

LABEL_154:
  long long v146 = [v15 objectForKeyedSubscript:@"geocodingMode"];

  if (!v146) {
    goto LABEL_165;
  }
  long long v147 = [v15 objectForKeyedSubscript:@"geocodingMode"];
  if ([v147 isEqual:@"address"])
  {
    uint64_t v148 = [MEMORY[0x1E4F5D9F0] geocodingModeAddressOnly];
LABEL_163:
    long long v149 = (void *)v148;
    [(SGEntity *)v103 addTag:v148];

    goto LABEL_164;
  }
  if ([v147 isEqual:@"poi"])
  {
    uint64_t v148 = [MEMORY[0x1E4F5D9F0] geocodingModePOIOnly];
    goto LABEL_163;
  }
  if ([v147 isEqual:@"address+poi"])
  {
    uint64_t v148 = [MEMORY[0x1E4F5D9F0] geocodingModeAddressThenPOI];
    goto LABEL_163;
  }
  if ([v147 isEqual:@"canonical"])
  {
    uint64_t v148 = [MEMORY[0x1E4F5D9F0] geocodingModeAddressWithCanonicalSearch];
    goto LABEL_163;
  }
LABEL_164:

LABEL_165:
  long long v150 = [v15 objectForKeyedSubscript:@"ekEventAvailabilityState"];

  if (v150)
  {
    long long v151 = [v15 objectForKeyedSubscript:@"ekEventAvailabilityState"];
    long long v152 = [MEMORY[0x1E4F5D9F0] ekEventAvailabilityState:v151];
    [(SGEntity *)v103 addTag:v152];
  }
  id v245 = v18;
  v153 = [v15 objectForKeyedSubscript:@"poiGeocodingFilters"];

  if (v153)
  {
    uint64_t v154 = [v15 objectForKeyedSubscript:@"poiGeocodingFilters"];
    v155 = [MEMORY[0x1E4F5D9F0] poiFilters:v154];
    [(SGEntity *)v103 addTag:v155];
  }
  v156 = [MEMORY[0x1E4F5DB40] rangeWithGregorianStartComponents:contexta endComponents:v250];
  if (((v96 | [MEMORY[0x1E4F5DAF0] showPastEvents]) & 1) == 0
    && [v156 isEndDatePast])
  {
    uint64_t v157 = sgDeveloperLogHandle();
    if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v157, OS_LOG_TYPE_DEFAULT, "Failed to process event suggestion – reservation end date in the past.", buf, 2u);
    }

    [v17 addObject:@"pastEvent"];
    if ([v156 isEndDatePastOver365days])
    {
      uint64_t v158 = sgEventsLogHandle();
      if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v158, OS_LOG_TYPE_DEFAULT, "SGExtractionEntity entityForOutputItem: Event is over one year in the past, processing stopped.", buf, 2u);
      }

      long long v78 = 0;
      v159 = (void *)v243;
      uint64_t v160 = v235;
      goto LABEL_241;
    }
  }
  v237 = v156;
  v233 = v22;
  if ([contexta hour] == 0x7FFFFFFFFFFFFFFFLL
    && ([contexta timeZone], uint64_t v161 = objc_claimAutoreleasedReturnValue(),
                                            v161,
                                            !v161))
  {
    unint64_t v165 = 0x1E4F5D000uLL;
    v173 = [MEMORY[0x1E4F5D9F0] allDay];
    [(SGEntity *)v103 addTag:v173];

    BOOL v232 = 0;
    __int16 v164 = (void *)v243;
    uint64_t v163 = v245;
  }
  else
  {
    __int16 v162 = [contexta timeZone];

    if (v162)
    {
      BOOL v232 = 0;
      __int16 v164 = (void *)v243;
      uint64_t v163 = v245;
      unint64_t v165 = 0x1E4F5D000;
    }
    else
    {
      __int16 v166 = (void *)MEMORY[0x1CB79B230]();
      unint64_t v165 = 0x1E4F5D000;
      if ([v242 indexOfObjectPassingTest:&__block_literal_global_710] == 0x7FFFFFFFFFFFFFFFLL
        && ([v15 objectForKeyedSubscript:@"minDurationForAllDayIfNoTz"],
            (uint64_t v167 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        __int16 v168 = (void *)v167;
        v169 = [v15 objectForKeyedSubscript:@"minDurationForAllDayIfNoTz"];
        __int16 v170 = [MEMORY[0x1E4F1CA98] null];
        char v171 = [v169 isEqual:v170];

        if (v171)
        {
          int v172 = 0;
          uint64_t v163 = v18;
          id v17 = v246;
          __int16 v164 = (void *)v243;
          unint64_t v165 = 0x1E4F5D000;
        }
        else
        {
          v202 = [v237 absoluteRange];
          [v202 end];
          double v204 = v203;
          [v202 start];
          double v206 = v204 - v205;
          v207 = [v15 objectForKeyedSubscript:@"minDurationForAllDayIfNoTz"];
          [v207 doubleValue];
          double v209 = v208;

          if (v206 >= v209)
          {
            [v100 addObject:@"convertedToAllDay"];
            [contexta setHour:0x7FFFFFFFFFFFFFFFLL];
            [contexta setMinute:0x7FFFFFFFFFFFFFFFLL];
            [contexta setSecond:0x7FFFFFFFFFFFFFFFLL];
            [contexta setNanosecond:0x7FFFFFFFFFFFFFFFLL];
            [v250 setHour:0x7FFFFFFFFFFFFFFFLL];
            [v250 setMinute:0x7FFFFFFFFFFFFFFFLL];
            [v250 setSecond:0x7FFFFFFFFFFFFFFFLL];
            [v250 setNanosecond:0x7FFFFFFFFFFFFFFFLL];
            id v210 = [MEMORY[0x1E4F5D9F0] allDay];
            [(SGEntity *)v103 addTag:v210];

            uint64_t v211 = [MEMORY[0x1E4F5DB40] rangeWithGregorianStartComponents:contexta endComponents:v250];

            int v172 = 0;
            v237 = (void *)v211;
            unint64_t v165 = 0x1E4F5D000uLL;
            id v17 = v246;
          }
          else
          {
            id v17 = v246;
            unint64_t v165 = 0x1E4F5D000;
            if ((v240 | a9) != 1)
            {
              [v246 addObject:@"noTimezone"];

              long long v78 = 0;
              v159 = (void *)v243;
              v74 = (void *)v248;
              uint64_t v160 = v235;
              v156 = v237;
              goto LABEL_241;
            }
            int v172 = v240 ^ 1;
          }
          __int16 v164 = (void *)v243;
          uint64_t v163 = v245;
        }
      }
      else
      {
        int v172 = 0;
        __int16 v164 = (void *)v243;
        uint64_t v163 = v245;
      }
      BOOL v232 = v172 != 0;
      v74 = (void *)v248;
    }
  }
  if (v234)
  {
    v174 = [*(id *)(v165 + 2544) defaultDuration];
    [(SGEntity *)v103 addTag:v174];
  }
  [(SGEntity *)v103 setTimeRange:v237];
  v175 = [(SGEntity *)v103 tags];
  id v176 = [*(id *)(v165 + 2544) allDay];
  int v177 = [v175 containsObject:v176];

  v156 = v237;
  if (v177 && ([v237 isValidAllDayRange] & 1) == 0) {
    __assert_rtn("-[SGExtractionDissector entityForOutputItem:withSiblings:parentEntity:outputExceptions:outputInfos:interaction:tagPartialEvent:]", "SGExtractionDissector.m", 828, "[timeRange isValidAllDayRange]");
  }
  [(SGEntity *)v103 setTitle:v74];
  [(SGEntity *)v103 setContent:v239];
  v178 = [(SGEntity *)v103 locations];
  [v178 addObjectsFromArray:v242];

  id v241 = [v15 objectForKeyedSubscript:@"schemas"];
  if (v241)
  {
    v159 = v164;
    if (v163)
    {
      v179 = v163;
      v180 = [(SGEntity *)v103 duplicateKey];
      uint64_t v181 = [v180 entityType];

      if (v181 == 2)
      {
        id v182 = [v163 intent];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        v184 = self;
        long long v22 = v233;
        if (isKindOfClass)
        {
          v185 = [v179 intent];
          v186 = [v185 reservationContainerReference];

          if (v186)
          {
            v187 = [MEMORY[0x1E4F5D9F0] reservationContainerReference:v186];
            [(SGEntity *)v103 addTag:v187];
          }
        }
        v188 = [v179 intentResponse];
        objc_opt_class();
        char v189 = objc_opt_isKindOfClass();

        if (v189)
        {
          v190 = [v179 intentResponse];
          v191 = [v190 userActivity];

          if (v191)
          {
            v192 = objc_msgSend(v191, "sg_serialize");
            if (v192)
            {
              v193 = [MEMORY[0x1E4F5D9F0] intentResponseUserActivityString:v192];
              if (v193)
              {
                [(SGEntity *)v103 addTag:v193];
              }
              else
              {
                v212 = sgLogHandle();
                if (os_log_type_enabled(v212, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v271 = v191;
                  _os_log_error_impl(&dword_1CA650000, v212, OS_LOG_TYPE_ERROR, "Could not create tag from NSUserActivity %@", buf, 0xCu);
                }
              }
              v184 = self;
            }
          }
        }
        v213 = [(SGExtractionDissector *)v184 getAndRemoveItemReferencesFromSchemas:v241];
        if ([v213 count])
        {
          v214 = [MEMORY[0x1E4F5D9F0] reservationItemReferences:v213];
          [(SGEntity *)v103 addTag:v214];

          v215 = [v213 firstObject];
          id v197 = [(SGExtractionDissector *)v184 eventActivitiesForReservationWithReference:v215 inParentEntity:v260 interaction:v179];
        }
        else
        {
          id v197 = 0;
        }
        unint64_t v201 = 0x1E4F5D000uLL;

        goto LABEL_228;
      }
    }
    v194 = [(SGEntity *)v103 duplicateKey];
    long long v22 = v233;
    if ([v194 entityType] == 2)
    {
      v195 = [(SGEntity *)v103 duplicateKey];
      v196 = [v195 parentKey];
      if ([v196 entityType] == 5)
      {

LABEL_211:
        id v197 = [(SGExtractionDissector *)self eventActivitiesForReservationWithSchema:v241 enrichment:v103];
        goto LABEL_212;
      }
      v198 = [(SGEntity *)v103 duplicateKey];
      v199 = [v198 parentKey];
      uint64_t v200 = [v199 entityType];

      if (v200 == 17) {
        goto LABEL_211;
      }
    }
    else
    {
    }
    id v197 = 0;
LABEL_212:
    unint64_t v201 = 0x1E4F5D000;
LABEL_228:
    id v216 = [*(id *)(v201 + 2544) schemaOrg:v241];
    if (v216) {
      [(SGEntity *)v103 addTag:v216];
    }
    v217 = [v260 duplicateKey];
    v218 = [v217 bundleId];

    id v219 = objc_alloc(MEMORY[0x1E4F5DA18]);
    v220 = [v15 objectForKeyedSubscript:@"categoryType"];
    v221 = [v15 objectForKeyedSubscript:@"schemas"];
    v222 = (void *)[v219 initWithType:1 categoryDescription:v220 originBundleId:v218 confidence:v221 schemaOrg:0 participants:v197 eventActivities:1.0];

    uint64_t v223 = [v222 toJsonString];
    if (v223)
    {
      v224 = (void *)MEMORY[0x1E4F5D9F0];
      v225 = [v222 toJsonString];
      uint64_t v226 = [v224 eventMetadata:v225];

      v159 = (void *)v243;
      [(SGEntity *)v103 addTag:v226];
    }
    else
    {
      uint64_t v226 = sgLogHandle();
      if (os_log_type_enabled(v226, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v271 = v222;
        _os_log_error_impl(&dword_1CA650000, v226, OS_LOG_TYPE_ERROR, "Failed to convert object to JSON: %@", buf, 0xCu);
      }
    }

    if (a9)
    {
      BOOL v227 = !v232
          && [(SGExtractionDissector *)self checkCompletenessOfOutputEvent:v15];
      v228 = [MEMORY[0x1E4F5D9F0] eventCompleteness:v227];
      [(SGEntity *)v103 addTag:v228];
    }
    [v260 creationTimestamp];
    -[SGPipelineEnrichment setCreationTimestamp:](v103, "setCreationTimestamp:");
    [v260 lastModifiedTimestamp];
    -[SGPipelineEnrichment setLastModifiedTimestamp:](v103, "setLastModifiedTimestamp:");
    long long v78 = v103;

    id v18 = v245;
    id v17 = v246;
    v74 = (void *)v248;
    uint64_t v160 = v235;
    v156 = v237;
    goto LABEL_240;
  }
  [v17 addObject:@"outputWithoutSchema"];
  long long v78 = 0;
  uint64_t v160 = v235;
  v159 = v164;
  id v18 = v163;
  long long v22 = v233;
LABEL_240:

LABEL_241:
LABEL_242:

LABEL_243:
  return v78;
}

id __128__SGExtractionDissector_entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent___block_invoke_578(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  long long v23 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v26 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "objectForKeyedSubscript:", @"transportation", v23);
        id v9 = v8;
        if (v8)
        {
          id v10 = [v8 objectForKeyedSubscript:@"graph"];
          int v11 = [v10 isEqual:@"iata"];

          if (v11)
          {
            id v12 = [v9 objectForKeyedSubscript:@"carrier"];
            int v13 = [v12 isEqual:*(void *)(v26 + 40)];

            if (v13)
            {
              uint64_t v14 = [v9 objectForKeyedSubscript:@"origin"];
              id v15 = [v14 objectForKeyedSubscript:@"name"];
              if ([v15 isEqual:v25])
              {
              }
              else
              {
                id v16 = [v9 objectForKeyedSubscript:@"destination"];
                id v17 = [v16 objectForKeyedSubscript:@"name"];
                int v24 = [v17 isEqual:v25];

                if (!v24) {
                  goto LABEL_15;
                }
              }
              id v18 = [v9 objectForKeyedSubscript:@"routeDesignation"];
              uint64_t v19 = v18;
              if (v18)
              {
                uint64_t v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "integerValue"));
                [v23 addObject:v20];
              }
            }
          }
        }
LABEL_15:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }

  id v21 = (void *)[v23 copy];
  return v21;
}

void __128__SGExtractionDissector_entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntValue];
  id v7 = v5;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"address"];

  if (v8)
  {
    id v9 = [v7 objectForKeyedSubscript:@"address"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v11 = [v7 objectForKeyedSubscript:@"address"];
      uint64_t v8 = +[SGExtractionDissector addressDictionaryToString:v11];
    }
    else
    {
      id v12 = [v7 objectForKeyedSubscript:@"address"];
      objc_opt_class();
      char v13 = objc_opt_isKindOfClass();

      if (v13)
      {
        uint64_t v8 = [v7 objectForKeyedSubscript:@"address"];
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
  }
  uint64_t v14 = [v7 objectForKeyedSubscript:@"name"];
  if (!v14)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v15 = [v7 objectForKeyedSubscript:@"code"];

      if (v15)
      {
        id v16 = +[SGFlightData sharedInstance];
        id v17 = [v7 objectForKeyedSubscript:@"code"];
        uint64_t v14 = [v16 bestLocalizedNameForAirport:v17];

        if (v14)
        {
          [*(id *)(a1 + 32) addObject:@"flightDataResolvedAirportNameForLocation"];
          goto LABEL_14;
        }
        uint64_t v14 = [v7 objectForKeyedSubscript:@"code"];
        if (v14) {
          goto LABEL_14;
        }
      }
    }
    uint64_t v14 = (uint64_t)(id)v8;
  }
LABEL_14:
  id v18 = [v7 objectForKeyedSubscript:@"coordinates"];

  if (v18)
  {
    uint64_t v19 = [v7 objectForKeyedSubscript:@"coordinates"];
    uint64_t v20 = [v19 objectAtIndexedSubscript:0];
    [v20 doubleValue];
    double v22 = v21;

    long long v23 = [v7 objectForKeyedSubscript:@"coordinates"];
    int v24 = [v23 objectAtIndexedSubscript:1];
    [v24 doubleValue];
    double v26 = v25;

    if (v22 >= -90.0 && v22 <= 90.0 && v26 >= -180.0 && v26 <= 180.0)
    {
      long long v27 = *(void **)(a1 + 40);
      long long v28 = [SGStorageLocation alloc];
      long long v29 = [v7 objectForKeyedSubscript:@"code"];
      uint64_t v30 = [(SGStorageLocation *)v28 initWithType:v6 label:v14 address:v8 airportCode:v29 latitude:0 longitude:v22 accuracy:v26 quality:0.0 handle:0.0];
LABEL_34:
      long long v47 = (void *)v30;
      [v27 addObject:v30];

      goto LABEL_35;
    }
  }
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v31 = [v7 objectForKeyedSubscript:@"code"];

    if (v31)
    {
      uint64_t v32 = +[SGFlightData sharedInstance];
      long long v33 = [v7 objectForKeyedSubscript:@"code"];
      uint64_t v34 = [v32 latitudeAndLongitudeForAirport:v33];

      if (v34)
      {
        [*(id *)(a1 + 32) addObject:@"flightDataResolvedAirportCoordinates"];
        long long v35 = [v34 first];
        [v35 doubleValue];
        double v37 = v36;

        __int16 v38 = [v34 second];
        [v38 doubleValue];
        double v40 = v39;

        if (v37 >= -90.0 && v37 <= 90.0 && v40 >= -180.0 && v40 <= 180.0)
        {
          uint64_t v41 = *(void **)(a1 + 40);
          uint64_t v42 = [SGStorageLocation alloc];
          BOOL v43 = [v7 objectForKeyedSubscript:@"code"];
          id v44 = [(SGStorageLocation *)v42 initWithType:v6 label:v14 address:v8 airportCode:v43 latitude:0 longitude:v37 accuracy:v40 quality:0.0 handle:0.0];
          [v41 addObject:v44];

          goto LABEL_35;
        }
        long long v45 = sgLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          id v48 = +[SGAsset asset];
          int v49 = 134217984;
          uint64_t v50 = [v48 assetVersion];
          _os_log_error_impl(&dword_1CA650000, v45, OS_LOG_TYPE_ERROR, "Invalid airport latitude or longitude. Asset version: %lu", (uint8_t *)&v49, 0xCu);
        }
      }
    }
  }
  if (v14 | v8)
  {
    long long v27 = *(void **)(a1 + 40);
    uint64_t v46 = [SGStorageLocation alloc];
    long long v29 = [v7 objectForKeyedSubscript:@"code"];
    uint64_t v30 = [(SGStorageLocation *)v46 initWithType:v6 label:v14 address:v8 airportCode:v29 accuracy:0.0 quality:0.0];
    goto LABEL_34;
  }
LABEL_35:
}

BOOL __128__SGExtractionDissector_entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent___block_invoke_707(uint64_t a1, void *a2)
{
  v2 = [a2 address];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __128__SGExtractionDissector_entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent___block_invoke_648()
{
  entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent__locationsSharedKeySet = [MEMORY[0x1E4F1C9E8] sharedKeySetForKeys:&unk_1F2536AD0];
  return MEMORY[0x1F41817F8]();
}

uint64_t __128__SGExtractionDissector_entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent___block_invoke()
{
  entityForOutputItem_withSiblings_parentEntity_outputExceptions_outputInfos_interaction_tagPartialEvent__paramsSharedKeySet = [MEMORY[0x1E4F1C9E8] sharedKeySetForKeys:&unk_1F2536AB8];
  return MEMORY[0x1F41817F8]();
}

- (id)entityForOutputItem:(id)a3 withSiblings:(id)a4 parentEntity:(id)a5 outputExceptions:(id)a6 outputInfos:(id)a7 interaction:(id)a8
{
  LOBYTE(v9) = 0;
  return [(SGExtractionDissector *)self entityForOutputItem:a3 withSiblings:a4 parentEntity:a5 outputExceptions:a6 outputInfos:a7 interaction:a8 tagPartialEvent:v9];
}

- (id)entityForOutputItem:(id)a3 parentEntity:(id)a4 outputExceptions:(id)a5 outputInfos:(id)a6 interaction:(id)a7
{
  return [(SGExtractionDissector *)self entityForOutputItem:a3 withSiblings:0 parentEntity:a4 outputExceptions:a5 outputInfos:a6 interaction:a7];
}

- (id)entityForOutputItem:(id)a3 parentEntity:(id)a4 outputExceptions:(id)a5 outputInfos:(id)a6
{
  return [(SGExtractionDissector *)self entityForOutputItem:a3 withSiblings:0 parentEntity:a4 outputExceptions:a5 outputInfos:a6 interaction:0];
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  reverseTemplateJSNoXPC = self->_reverseTemplateJSNoXPC;
  if (reverseTemplateJSNoXPC)
  {
    uint64_t v4 = reverseTemplateJSNoXPC;
  }
  else
  {
    xpcConnection = self->_xpcConnection;
    if (!a3) {
      a3 = &__block_literal_global_27914;
    }
    uint64_t v4 = [(NSXPCConnection *)xpcConnection synchronousRemoteObjectProxyWithErrorHandler:a3];
  }
  return v4;
}

void __70__SGExtractionDissector_synchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_1CA650000, v3, OS_LOG_TYPE_ERROR, "SGExtractionDissector: XPC error %@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)mlExtractionEnabledForTextMessage:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    int v4 = [v3 textContent];
    if ([v4 length] && (objc_msgSend(v3, "isSent") & 1) == 0)
    {
      uint64_t v6 = [v3 textContentLanguageIdentifier];
      char v5 = [v6 isEqualToString:@"en"];
    }
    else
    {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    [(NSXPCConnection *)xpcConnection invalidate];
    int v4 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SGExtractionDissector;
  [(SGExtractionDissector *)&v5 dealloc];
}

- (SGExtractionDissector)init
{
  v21.receiver = self;
  v21.super_class = (Class)SGExtractionDissector;
  id v2 = [(SGExtractionDissector *)&v21 init];
  if (!v2) {
    goto LABEL_7;
  }
  id v3 = objc_opt_class();
  objc_sync_enter(v3);
  WeakRetained = (SGExtractionDissector *)objc_loadWeakRetained(&sharedInstance_27919);
  objc_super v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
  }
  else
  {
    id v7 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2551348];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.reversetemplated" options:0];
    objc_storeStrong((id *)&v2->_xpcConnection, v9);
    [v9 setRemoteObjectInterface:v8];
    [v9 resume];

    id v10 = objc_alloc(MEMORY[0x1E4F93B70]);
    int v11 = objc_opt_new();
    uint64_t v12 = [v10 initWithGuardedData:v11];
    classifierCache = v2->_classifierCache;
    v2->_classifierCache = (_PASLock *)v12;

    id v14 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v15 = objc_opt_new();
    uint64_t v16 = [v14 initWithGuardedData:v15];
    ddScannerLocuint64_t k = v2->_ddScannerLock;
    v2->_ddScannerLocuint64_t k = (_PASLock *)v16;

    objc_storeWeak(&sharedInstance_27919, v2);
    v2->shouldExtractFromFwdMail = _os_feature_enabled_impl();
  }

  objc_sync_exit(v3);
  if (!v5)
  {
    uint64_t v18 = objc_opt_new();
    knosisService = v2->knosisService;
    v2->knosisService = (GDXPCKnosisService *)v18;

LABEL_7:
    objc_super v5 = v2;
  }

  return v5;
}

+ (BOOL)emailIsForwardOrReply:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  int v4 = [v3 headers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SGExtractionDissector_emailIsForwardOrReply___block_invoke;
  v6[3] = &unk_1E65BB030;
  v6[4] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

void __47__SGExtractionDissector_emailIsForwardOrReply___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 key];
  if ([v6 isEqual:@"in-reply-to"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
    uint64_t v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_debug_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEBUG, "found forward or reply header in email", v8, 2u);
    }
  }
}

+ (id)subjectFromMailMessage:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__27714;
  uint64_t v12 = __Block_byref_object_dispose__27715;
  id v13 = 0;
  id v13 = [v3 subject];
  int v4 = [v3 headers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SGExtractionDissector_subjectFromMailMessage___block_invoke;
  v7[3] = &unk_1E65BB030;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __48__SGExtractionDissector_subjectFromMailMessage___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 key];
  if ([v3 isEqual:@"subject"])
  {
    uint64_t v4 = [v7 value];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

+ (id)addressDictionaryToString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [v3 objectForKeyedSubscript:@"Street"];
  [v5 setStreet:v6];

  id v7 = [v3 objectForKeyedSubscript:@"City"];
  [v5 setCity:v7];

  uint64_t v8 = [v3 objectForKeyedSubscript:@"State"];
  [v5 setState:v8];

  uint64_t v9 = [v3 objectForKeyedSubscript:@"ZIP"];
  [v5 setPostalCode:v9];

  uint64_t v10 = [v3 objectForKeyedSubscript:@"Country"];
  [v5 setCountry:v10];

  int v11 = [v3 objectForKeyedSubscript:@"CountryCode"];
  [v5 setISOCountryCode:v11];

  uint64_t v12 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v5 style:0];
  id v13 = _PASCollapseWhitespaceAndStrip();

  return v13;
}

+ (id)addParams:(id)a3 toParameterizedString:(id)a4 allowAlternatives:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
    }
    else
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __75__SGExtractionDissector_addParams_toParameterizedString_allowAlternatives___block_invoke;
      v22[3] = &unk_1E65BAF48;
      id v10 = v7;
      id v23 = v10;
      int v11 = (void (**)(void, void, void, void))MEMORY[0x1CB79B4C0](v22);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        ((void (**)(void, id, id, BOOL))v11)[2](v11, v10, v8, v5);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        id v9 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0 && v5)
        {
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v12 = v8;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v24 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v19;
            while (2)
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v19 != v15) {
                  objc_enumerationMutation(v12);
                }
                ((void (**)(void, id, void, uint64_t))v11)[2](v11, v10, *(void *)(*((void *)&v18 + 1) + 8 * i), 1);
                id v9 = (id)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v9, "length", (void)v18))
                {

                  goto LABEL_19;
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v24 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

          id v9 = 0;
        }
      }
LABEL_19:
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

id __75__SGExtractionDissector_addParams_toParameterizedString_allowAlternatives___block_invoke(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 objectForKeyedSubscript:@"segments"];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v6 appendString:v12];
          }
          else
          {
            uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];

            if (v13)
            {
              uint64_t v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
              [v6 appendString:v14];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];

                if (!v15 && (a4 & 1) != 0)
                {

                  id v17 = 0;
                  goto LABEL_22;
                }
              }
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_19:
    id v16 = v6;
    goto LABEL_20;
  }
  id v16 = v5;
LABEL_20:
  id v17 = v16;
LABEL_22:

  return v17;
}

+ (id)addParams:(id)a3 toParameterizedString:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() addParams:v6 toParameterizedString:v5 allowAlternatives:0];

  return v7;
}

@end