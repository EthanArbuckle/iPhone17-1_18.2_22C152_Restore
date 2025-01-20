@interface SGDetectedAttributeDissector
+ (BOOL)isAddressContext:(id)a3;
+ (BOOL)isBirthdayContext:(id)a3;
+ (BOOL)isMaybeNameContext:(id)a3;
+ (BOOL)isNameRequest:(id)a3;
+ (BOOL)isPhoneContext:(id)a3;
+ (BOOL)isTwoPersonConversation:(id)a3;
+ (id)currentPatterns;
+ (id)dissectorWithMockedMLTrainingForTests;
+ (id)patterns;
+ (void)_logSelfIDForMessage:(id)a3 detection:(id)a4 modelType:(SGMSelfIdModelType_)a5 modelVersion:(unint64_t)a6;
+ (void)clearConversationCache;
- (SGDetectedAttributeDissector)init;
- (SGDetectedAttributeDissector)initWithML:(id)a3 withMLQR:(id)a4 andHealthStore:(id)a5;
- (id)_extractEmailishTokenFromMailHeader:(id)a3;
- (id)_makeAlnum:(id)a3;
- (id)_makeSimplifiedListIdEmail:(id)a3;
- (id)detailTypeFromPrefix:(id)a3;
- (id)detailTypeFromPrefix:(id)a3 detectedLabelPointer:(_NSRange *)a4;
- (id)detectionFromBodyDDMatch:(id)a3 message:(id)a4 withSupervisionToFill:(id)a5 isUnlikelyPhone:(BOOL)a6;
- (id)detectionFromSignatureDDMatch:(id)a3 message:(id)a4 detectedLabelRange:(_NSRange *)a5 lastClaimedLabelRange:(_NSRange)a6 isUnlikelyPhone:(BOOL)a7;
- (id)filterDangerousSigAddressDetections:(id)a3;
- (id)filterDangerousSigDetections:(id)a3 message:(id)a4;
- (id)filterDangerousSigEmailDetections:(id)a3 message:(id)a4;
- (id)filterDangerousSigPhoneDetections:(id)a3 message:(id)a4;
- (id)getLineContaining:(_NSRange)a3 inText:(id)a4;
- (id)getResponsesForBirthdayExtractionFromMessage:(id)a3 withLanguage:(id)a4;
- (id)processTextMessageConversation:(id)a3 threadLength:(unint64_t)a4;
- (unint64_t)selfIdentificationMessageCount;
- (void)_addAuthorContactForMessage:(id)a3 entity:(id)a4;
- (void)_dissectMessage:(id)a3 entity:(id)a4;
- (void)_removeUnwantedContactDetails:(id)a3 entity:(id)a4;
- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5;
- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5;
- (void)handleTextMessageBirthdayCongratulation:(id)a3 entity:(id)a4 withConversationHistory:(id)a5;
- (void)handleTextMessageSelfIdentification:(id)a3 entity:(id)a4 withConversationHistory:(id)a5;
- (void)logBirthdayExtractionMetricForPerson:(id)a3 forDate:(id)a4 isFromCongratulation:(unsigned __int8)a5 withModelVersion:(id)a6 didRegexTrigger:(unsigned __int8)a7 didResponseKitTrigger:(unsigned __int8)a8;
- (void)setSelfIdentificationMessageCount:(unint64_t)a3;
@end

@implementation SGDetectedAttributeDissector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreNLPTrustedLanguages, 0);
  objc_storeStrong((id *)&self->_ddTrustedLanguages, 0);
  objc_storeStrong((id *)&self->_hmmTrustedLanguages, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_contactsHelper, 0);
  objc_storeStrong((id *)&self->_mlQR, 0);
  objc_storeStrong((id *)&self->_ml, 0);
}

- (void)setSelfIdentificationMessageCount:(unint64_t)a3
{
  self->_selfIdentificationMessageCount = a3;
}

- (unint64_t)selfIdentificationMessageCount
{
  return self->_selfIdentificationMessageCount;
}

- (id)detailTypeFromPrefix:(id)a3
{
  return [(SGDetectedAttributeDissector *)self detailTypeFromPrefix:a3 detectedLabelPointer:0];
}

- (id)detailTypeFromPrefix:(id)a3 detectedLabelPointer:(_NSRange *)a4
{
  id v5 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__24821;
  v26 = __Block_byref_object_dispose__24822;
  id v27 = 0;
  uint64_t v17 = 0;
  v18 = (_NSRange *)&v17;
  uint64_t v19 = 0x3010000000;
  v20 = "";
  long long v21 = xmmword_1CA8CB4A0;
  v6 = +[SGDetectedAttributeDissector patterns];
  v7 = [v6 rawValueForKey:@"DetailTypes"];

  v8 = regex2ForKey(@"DetailType");
  uint64_t v9 = [v7 count];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__SGDetectedAttributeDissector_detailTypeFromPrefix_detectedLabelPointer___block_invoke;
  v13[3] = &unk_1E65BA2B8;
  id v10 = v7;
  id v14 = v10;
  v15 = &v22;
  v16 = &v17;
  [v8 enumerateMatchesInString:v5 ngroups:v9 block:v13];

  if (a4) {
    *a4 = v18[2];
  }
  id v11 = (id)v23[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v22, 8);

  return v11;
}

uint64_t __74__SGDetectedAttributeDissector_detailTypeFromPrefix_detectedLabelPointer___block_invoke(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = -1;
  uint64_t v5 = 24;
  while ([*(id *)(a1 + 32) count] > (unint64_t)++v4)
  {
    uint64_t v6 = *(void *)((char *)a2 + v5);
    v5 += 24;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v4];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      *(_OWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = *a2;
      return 0;
    }
  }
  return 0;
}

- (id)getLineContaining:(_NSRange)a3 inText:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(v6, "rangeOfString:options:range:", @"\n", 6, 0, location);
  uint64_t v9 = v8;
  uint64_t v10 = objc_msgSend(v6, "rangeOfString:options:range:", @"\n", 2, location + length, objc_msgSend(v6, "length") - (location + length));
  if (!v11) {
    uint64_t v10 = [v6 length];
  }
  uint64_t v12 = v10;
  if (v9) {
    uint64_t v13 = v7 + 1;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = (void *)MEMORY[0x1CB79B230]();
  v15 = objc_msgSend(v6, "substringWithRange:", v13, v12 - v13);

  return v15;
}

- (void)_dissectMessage:(id)a3 entity:(id)a4
{
  uint64_t v219 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v178 = [v5 textContent];
  if (!v178) {
    goto LABEL_209;
  }
  uint64_t v7 = [v5 author];

  if (!v7)
  {
    v16 = sgLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      uint64_t v17 = "Skipping DetectedAttribute dissection: No author.";
      goto LABEL_58;
    }
LABEL_12:

    goto LABEL_209;
  }
  uint64_t v8 = [v6 plainTextSigRange];
  NSUInteger v186 = v9;
  NSUInteger v187 = v8;
  uint64_t v185 = [v5 detectedDataSignatureRange];
  uint64_t v10 = [v6 tags];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    int v12 = [v6 isInhuman];

    if (v12)
    {
      uint64_t v13 = sgLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_debug_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEBUG, "Skipping DetectedAttribute dissection: Inhuman sender.", (uint8_t *)&buf, 2u);
      }

      +[SGDetectedAttributeMetrics recordExtractionOutcome:forDetectionsInMessage:signatureRange:isDDSignature:](SGDetectedAttributeMetrics, "recordExtractionOutcome:forDetectionsInMessage:signatureRange:isDDSignature:", *MEMORY[0x1E4F5DCC0], v5, v187, v186, v185 != 0x7FFFFFFFFFFFFFFFLL);
      goto LABEL_209;
    }
  }
  id v14 = [v5 source];
  int v15 = [v14 isEqual:@"warmUpSuggestions"];

  if (v15)
  {
    v16 = sgLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      uint64_t v17 = "Skipping DetectedAttribute dissection: warm up message.";
LABEL_58:
      _os_log_debug_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&buf, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = v5;
    uint64_t v19 = v18;
    if (v18)
    {
      v20 = [v18 conversationIdentifier];
      uint64_t v21 = [v20 length];

      if (v21)
      {
        uint64_t v22 = (void *)MEMORY[0x1CB79B230]();
        v23 = +[SGTextMessageConversationTracker instance];
        uint64_t v24 = [SGTextMessageItem alloc];
        v25 = [v19 plainTextDetectedData];
        v26 = [(SGTextMessageItem *)v24 initWithTextMessage:v19 detectedData:v25];
        v166 = [v23 addTextMessageItem:v26];

        int v165 = 0;
        id v27 = 0;
      }
      else
      {
        int v165 = 0;
        id v27 = 0;
        v166 = 0;
      }
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v19 = 0;
LABEL_20:
    id v27 = 0;
    goto LABEL_21;
  }
  id v27 = v5;
  uint64_t v19 = 0;
LABEL_21:
  v166 = 0;
  int v165 = 1;
LABEL_22:
  if (([MEMORY[0x1E4F5DAF0] detectContacts] & 1) == 0)
  {
    log = sgLogHandle();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_debug_impl(&dword_1CA650000, log, OS_LOG_TYPE_DEBUG, "Skipping DetectedAttribute dissector: detectContacts is OFF", (uint8_t *)&buf, 2u);
    }
    goto LABEL_208;
  }
  v154 = v27;
  v28 = [v5 author];
  uint64_t v29 = +[SGIdentityKey keyForPersonHandle:v28];

  log = v29;
  if (!v29)
  {
    log = 0;
    goto LABEL_207;
  }
  v30 = [v5 plainTextDetectedData];
  if (v154)
  {
    v31 = [v154 quotedRegions];
  }
  else
  {
    v31 = objc_opt_new();
  }
  id v174 = v31;

  [v6 releaseDissectorLock];
  v32 = sgLogHandle();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v30;
    _os_log_debug_impl(&dword_1CA650000, v32, OS_LOG_TYPE_DEBUG, "Detections: %@", (uint8_t *)&buf, 0xCu);
  }

  long long v207 = 0u;
  long long v208 = 0u;
  long long v205 = 0u;
  long long v206 = 0u;
  id v33 = v30;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v205 objects:v218 count:16];
  obuint64_t j = v33;
  v176 = v6;
  if (v34)
  {
    uint64_t v35 = v34;
    id v36 = v5;
    memset(&v189, 0, 12);
    int v188 = 0;
    int v37 = 0;
    uint64_t v38 = *(void *)v206;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v206 != v38) {
          objc_enumerationMutation(obj);
        }
        v40 = *(void **)(*((void *)&v205 + 1) + 8 * i);
        v220.NSUInteger location = [v40 range];
        v222.NSUInteger length = v186;
        v222.NSUInteger location = v187;
        NSUInteger length = NSIntersectionRange(v220, v222).length;
        int v42 = [v40 matchType];
        BOOL v43 = v42 == 0;
        if (v42) {
          int v44 = DWORD2(v189);
        }
        else {
          int v44 = DWORD2(v189) + 1;
        }
        DWORD2(v189) = v44;
        int v45 = [v40 matchType];
        int v46 = v45 == 1;
        int v47 = DWORD1(v189);
        if (v45 == 1) {
          int v47 = DWORD1(v189) + 1;
        }
        DWORD1(v189) = v47;
        if (length) {
          BOOL v48 = v43;
        }
        else {
          BOOL v48 = 0;
        }
        LODWORD(v189) = v189 + v48;
        if (!length) {
          int v46 = 0;
        }
        v188 += v46;
        if ([v40 matchType] == 2) {
          ++v37;
        }
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v205 objects:v218 count:16];
    }
    while (v35);

    if (SDWORD2(v189) >= 6)
    {
      v49 = sgLogHandle();
      id v6 = v176;
      id v5 = v36;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 67109376;
        DWORD1(buf) = DWORD2(v189);
        WORD4(buf) = 1024;
        *(_DWORD *)((char *)&buf + 10) = 5;
        _os_log_debug_impl(&dword_1CA650000, v49, OS_LOG_TYPE_DEBUG, "Skipping DetectedAttribute dissection: too many phone numbers (%i, limit %i)", (uint8_t *)&buf, 0xEu);
      }

      [v176 acquireDissectorLock];
      goto LABEL_206;
    }
    id v6 = v176;
    id v5 = v36;
  }
  else
  {

    int v37 = 0;
    memset(&v189, 0, 12);
    int v188 = 0;
  }
  if ((v165 & 1) == 0)
  {
    v50 = (void *)MEMORY[0x1CB79B230]();
    v51 = sgSignpostHandle();
    int ptr = 7;
    os_signpost_id_t v52 = os_signpost_id_make_with_pointer(v51, &ptr);

    if (!*(void *)((char *)&v189 + 4) && !v37)
    {
      if ([MEMORY[0x1E4F5DAF0] useMLModelForContactSharing])
      {
        [MEMORY[0x1E4F5DAF0] contactSharingNegativeSamplingRate];
        if ((float)((float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10) < v53)
        {
          v54 = sgSignpostHandle();
          v55 = v54;
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA650000, v55, OS_SIGNPOST_INTERVAL_BEGIN, v52, "ContactSharingNegativeExample", "Start", (uint8_t *)&buf, 2u);
          }

          ml = self->_ml;
          v57 = [v166 likelyLanguage];
          [(SGDetectedAttributeML *)ml handleTextMessageContactSharingWithNegativeSample:v19 andLanguage:v57];

          v58 = sgSignpostHandle();
          v59 = v58;
          if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA650000, v59, OS_SIGNPOST_INTERVAL_END, v52, "ContactSharingNegativeExample", "Completed", (uint8_t *)&buf, 2u);
          }
        }
      }
    }
  }
  uint64_t v60 = [MEMORY[0x1E4F5DFA0] detectLanguageFromText:v178];
  v164 = (void *)v60;
  if (v60)
  {
    v61 = &OBJC_IVAR___SGDetectedAttributeDissector__hmmTrustedLanguages;
    if (v185 != 0x7FFFFFFFFFFFFFFFLL) {
      v61 = &OBJC_IVAR___SGDetectedAttributeDissector__ddTrustedLanguages;
    }
    char v161 = [*(id *)((char *)&self->super.super.isa + *v61) containsObject:v60];
  }
  else
  {
    char v161 = 0;
  }
  v160 = v19;
  v159 = objc_opt_new();
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  long long v203 = xmmword_1CA8CB4A0;
  id v168 = [obj reverseObjectEnumerator];
  v184 = v5;
  uint64_t v179 = [v168 countByEnumeratingWithState:&v199 objects:v217 count:16];
  if (!v179)
  {
    char v162 = 0;
    goto LABEL_181;
  }
  char v162 = 0;
  uint64_t v177 = *(void *)v200;
  uint64_t v163 = *MEMORY[0x1E4F5DCA0];
  uint64_t v155 = *MEMORY[0x1E4F5DCC8];
  uint64_t v156 = *MEMORY[0x1E4F5DC98];
  uint64_t v158 = *MEMORY[0x1E4F5DCB0];
  uint64_t v167 = *MEMORY[0x1E4F5DCB8];
  do
  {
    uint64_t v62 = 0;
    do
    {
      if (*(void *)v200 != v177) {
        objc_enumerationMutation(v168);
      }
      v63 = *(void **)(*((void *)&v199 + 1) + 8 * v62);
      v64 = (void *)MEMORY[0x1CB79B230]();
      if ([v63 matchType] == 1
        || ![v63 matchType]
        || [v63 matchType] == 2
        || [v63 matchType] == 3)
      {
        if (![v63 matchType])
        {
          uint64_t v65 = [v63 range];
          if (SGIsPhoneNumberWithRangeBlocked(v178, v65, v66))
          {
            v67 = sgLogHandle();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(buf) = 0;
              _os_log_debug_impl(&dword_1CA650000, v67, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Blocked phone number.", (uint8_t *)&buf, 2u);
            }

            goto LABEL_174;
          }
        }
        v183 = v64;
        v221.NSUInteger location = [v63 range];
        v223.NSUInteger length = v186;
        v223.NSUInteger location = v187;
        NSUInteger v68 = NSIntersectionRange(v221, v223).length;
        uint64_t v69 = [v63 range];
        if (objc_msgSend(v174, "intersectsIndexesInRange:", v69, v70))
        {
          v71 = (void *)MEMORY[0x1CB79B230]();
          v72 = sgLogHandle();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(buf) = 0;
            _os_log_debug_impl(&dword_1CA650000, v72, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Quoted region.", (uint8_t *)&buf, 2u);
          }

          LOBYTE(v152) = 0;
          +[SGDetectedAttributeMetrics recordExtractionOutcome:v167 fromMessage:v5 foundInSignature:v68 != 0 isDDSignature:v185 != 0x7FFFFFFFFFFFFFFFLL match:v63 modelVersion:&unk_1F2535F28 isUnlikelyPhone:v152];
LABEL_123:
          v64 = v183;
          goto LABEL_174;
        }
        if ([v63 matchType])
        {
          int v73 = 0;
        }
        else
        {
          v74 = [v63 valueString];
          int v73 = [v74 containsString:@","];
        }
        if (self->_filterWithAddressBook && ![v63 matchType])
        {
          contactsHelper = self->_contactsHelper;
          v77 = [v63 valueString];
          int v75 = ![(SGContactPipelineHelper *)contactsHelper numberMatchesContactsForm:v77];
        }
        else
        {
          int v75 = 0;
        }
        uint64_t v78 = v73 | v75;
        if (v78 == 1)
        {
          float v79 = (float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10;
          float unlikelyPhoneSamplingRate = self->_unlikelyPhoneSamplingRate;
          v81 = sgLogHandle();
          BOOL v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG);
          if (v79 >= unlikelyPhoneSamplingRate)
          {
            if (v82)
            {
              LOWORD(buf) = 0;
              _os_log_debug_impl(&dword_1CA650000, v81, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Low quality phone number match.", (uint8_t *)&buf, 2u);
            }

            goto LABEL_123;
          }
          if (v82)
          {
            LOWORD(buf) = 0;
            _os_log_debug_impl(&dword_1CA650000, v81, OS_LOG_TYPE_DEBUG, "Processing low quality phone number match for ML supervision and metrics; detections to be discarded.",
              (uint8_t *)&buf,
              2u);
          }
        }
        *(void *)&long long buf = 261887;
        HIDWORD(buf) = v189;
        int v214 = DWORD2(v189);
        int v215 = v188;
        int v216 = DWORD1(v189);
        BYTE4(buf) = [v63 matchType] == 0;
        BYTE5(buf) = [v63 matchType] == 1;
        double v83 = (double)(unint64_t)[v63 range];
        float v84 = v83 / (double)(unint64_t)[v178 length];
        *((float *)&buf + 2) = v84;
        v85 = [[SGContactDetailSupervision alloc] initWithMessage:v5 ddMatch:v63 isUnlikelyPhone:v78];
        v86 = (void *)MEMORY[0x1CB79B230]();
        int v180 = v78;
        if (v68)
        {
          v87 = [(SGDetectedAttributeDissector *)self detectionFromSignatureDDMatch:v63 message:v5 detectedLabelRange:&v203 lastClaimedLabelRange:v203 isUnlikelyPhone:v78];
          if (v87)
          {
            v88 = sgLogHandle();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
            {
              v127 = [v87 extraction];
              *(_DWORD *)v211 = 138412290;
              v212 = v127;
              _os_log_debug_impl(&dword_1CA650000, v88, OS_LOG_TYPE_DEBUG, "Detected attribute (sig/*): '%@'", v211, 0xCu);

              id v6 = v176;
            }

            if (v185 == 0x7FFFFFFFFFFFFFFFLL) {
              BYTE6(buf) = 1;
            }
            else {
              BYTE7(buf) = 1;
            }
            [v159 addObject:v87];
            SGFeatureVectorLog((uint64_t)&buf);
          }
        }
        else
        {
          SGFeatureVectorLog((uint64_t)&buf);
          v87 = [(SGDetectedAttributeDissector *)self detectionFromBodyDDMatch:v63 message:v5 withSupervisionToFill:v85 isUnlikelyPhone:v78];
          if (v87)
          {
            v89 = sgLogHandle();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
            {
              v128 = [v87 extraction];
              *(_DWORD *)v211 = 138412290;
              v212 = v128;
              _os_log_debug_impl(&dword_1CA650000, v89, OS_LOG_TYPE_DEBUG, "Detected attribute (body): '%@'", v211, 0xCu);
            }
            if (([v87 isUnlikelyPhone] & 1) != 0
              || ([v176 acquireDissectorLock],
                  [v87 extractionInfo],
                  v90 = objc_claimAutoreleasedReturnValue(),
                  [v176 addDetection:v87 forIdentity:log extractionInfo:v90],
                  v90,
                  [v176 releaseDissectorLock],
                  [v87 type] != 3))
            {
              id v5 = v184;
            }
            else
            {
              id v5 = v184;
              v91 = [v184 author];
              v92 = [v63 detectedDate];
              [(SGDetectedAttributeDissector *)self logBirthdayExtractionMetricForPerson:v91 forDate:v92 isFromCongratulation:0 withModelVersion:0 didRegexTrigger:0 didResponseKitTrigger:1];
            }
            id v6 = v176;
          }
        }
        [v6 acquireDissectorLock];
        uint64_t v93 = [v63 valueRange];
        [v63 valueRange];
        v95 = textToMatch(v93, v94 + v93, v178, [v63 matchType]);
        v173 = v95;
        if ([v63 matchType] == 1
          || ![v63 matchType]
          || [v63 matchType] == 2)
        {
          v96 = (void *)MEMORY[0x1CB79B230]();
          v97 = [(SGDetectedAttributeML *)self->_ml detectionFromMessage:v5 ddMatch:v63 matchedContext:v95 withSupervision:v85 inConversation:v166 entityLanguage:v164];
          id v98 = v87;
          if (v97)
          {
            int v99 = v180;
            if (!v98)
            {
              if ([(SGContactDetailSupervision *)v85 isThirdPerson]
                || [(SGContactDetailSupervision *)v85 isFirstPerson])
              {
                id v98 = 0;
              }
              else
              {
                v100 = v6;
                id v98 = v97;
                v101 = sgLogHandle();
                if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
                {
                  v171 = [v98 extraction];
                  *(_DWORD *)v211 = 138412290;
                  v212 = v171;
                  _os_log_debug_impl(&dword_1CA650000, v101, OS_LOG_TYPE_DEBUG, "Detected attribute (ml): '%@'", v211, 0xCu);
                }
                if (([v98 isUnlikelyPhone] & 1) == 0)
                {
                  v102 = [v98 extractionInfo];
                  [v100 addDetection:v98 forIdentity:log extractionInfo:v102];
                }
                id v6 = v100;
                v95 = v173;
              }
            }
          }
          else
          {
            int v99 = v180;
          }
        }
        else
        {
          v97 = 0;
          id v98 = v87;
          int v99 = v180;
        }
        if (v98) {
          char v103 = v99;
        }
        else {
          char v103 = 1;
        }
        if ((v103 & 1) == 0)
        {
          char v104 = v68 ? v161 : 0;
          if ((v104 & 1) != 0 || !v68)
          {
            v162 |= v104;
            [v6 setContactInformationExtracted:1];
          }
        }
        uint64_t v105 = [v6 releaseDissectorLock];
        id v170 = v98;
        v172 = v85;
        if (v97)
        {
          BOOL v106 = v68 != 0;
          v107 = (void *)MEMORY[0x1CB79B230](v105);
          uint64_t v108 = [(SGContactDetailSupervision *)v85 metricsContactDetailOwner];
          v109 = [v97 extractionInfo];
          v110 = [v109 modelVersion];
          LOBYTE(v153) = v180;
          int v99 = v180;
          id v6 = v176;
          +[SGDetectedAttributeMetrics recordExtractionOutcome:v163 fromMessage:v184 foundInSignature:v106 isDDSignature:v185 != 0x7FFFFFFFFFFFFFFFLL match:v63 foundInCNContact:v108 modelVersion:v110 isUnlikelyPhone:v153];

          goto LABEL_161;
        }
        if ([(SGContactDetailSupervision *)v85 regexDoesNotBelongToSender])
        {
          BOOL v111 = v68 != 0;
          v107 = (void *)MEMORY[0x1CB79B230]();
          uint64_t v112 = [(SGContactDetailSupervision *)v85 metricsContactDetailOwner];
          v113 = [v98 extractionInfo];
          v114 = [v113 modelVersion];
          LOBYTE(v153) = v180;
          +[SGDetectedAttributeMetrics recordExtractionOutcome:v158 fromMessage:v184 foundInSignature:v111 isDDSignature:v185 != 0x7FFFFFFFFFFFFFFFLL match:v63 foundInCNContact:v112 modelVersion:v114 isUnlikelyPhone:v153];
          goto LABEL_160;
        }
        if ([(SGContactDetailSupervision *)v85 regexBelongsToSender])
        {
          BOOL v157 = v68 != 0;
          v107 = (void *)MEMORY[0x1CB79B230]();
          uint64_t v115 = [(SGContactDetailSupervision *)v85 metricsContactDetailOwner];
          v113 = [v98 extractionInfo];
          v114 = [v113 modelVersion];
          LOBYTE(v153) = v180;
          +[SGDetectedAttributeMetrics recordExtractionOutcome:v156 fromMessage:v184 foundInSignature:v157 isDDSignature:v185 != 0x7FFFFFFFFFFFFFFFLL match:v63 foundInCNContact:v115 modelVersion:v114 isUnlikelyPhone:v153];
LABEL_160:

          int v99 = v180;
          id v6 = v176;
LABEL_161:
          id v98 = v170;
          v95 = v173;
        }
        else if (!v98)
        {
          BOOL v126 = v68 != 0;
          v107 = (void *)MEMORY[0x1CB79B230]();
          LOBYTE(v153) = v99;
          +[SGDetectedAttributeMetrics recordExtractionOutcome:v155 fromMessage:v184 foundInSignature:v126 isDDSignature:v185 != 0x7FFFFFFFFFFFFFFFLL match:v63 foundInCNContact:[(SGContactDetailSupervision *)v85 metricsContactDetailOwner] modelVersion:0 isUnlikelyPhone:v153];
          goto LABEL_161;
        }
        if (((v165 | v99) & 1) == 0
          && ([v63 matchType] == 1
           || ![v63 matchType]
           || [v63 matchType] == 2))
        {
          v181 = v97;
          v116 = (void *)MEMORY[0x1CB79B230]();
          v117 = sgSignpostHandle();
          int v198 = 7;
          os_signpost_id_t v118 = os_signpost_id_make_with_pointer(v117, &v198);

          v119 = sgSignpostHandle();
          v120 = v119;
          if (v118 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v119))
          {
            *(_WORD *)v211 = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA650000, v120, OS_SIGNPOST_INTERVAL_BEGIN, v118, "ContactSharingPositiveExample", "Start", v211, 2u);
          }

          v121 = self->_ml;
          v122 = [v166 likelyLanguage];
          v123 = v121;
          v95 = v173;
          [(SGDetectedAttributeML *)v123 handleTextMessageContactSharing:v160 andMatch:v63 andContext:v173 andLanguage:v122 withSupervision:v172];

          v124 = sgSignpostHandle();
          v125 = v124;
          if (v118 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v124))
          {
            *(_WORD *)v211 = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA650000, v125, OS_SIGNPOST_INTERVAL_END, v118, "ContactSharingPositiveExample", "Completed", v211, 2u);
          }

          id v98 = v170;
          v97 = v181;
        }

        v64 = v183;
        id v5 = v184;
      }
LABEL_174:
      ++v62;
    }
    while (v179 != v62);
    uint64_t v129 = [v168 countByEnumeratingWithState:&v199 objects:v217 count:16];
    uint64_t v179 = v129;
  }
  while (v129);
LABEL_181:

  if ((v165 & 1) == 0)
  {
    v130 = (void *)MEMORY[0x1CB79B230]();
    [(SGDetectedAttributeDissector *)self handleTextMessageSelfIdentification:v160 entity:v6 withConversationHistory:v166];
    [(SGDetectedAttributeDissector *)self handleTextMessageBirthdayCongratulation:v160 entity:v6 withConversationHistory:v166];
  }
  [v6 acquireDissectorLock];
  if ([v159 count])
  {
    id v131 = (id)objc_opt_new();
  }
  else
  {
    id v131 = 0;
  }
  if (v162)
  {
    v132 = (void *)MEMORY[0x1CB79B230]();
    long long v194 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    v133 = [(SGDetectedAttributeDissector *)self filterDangerousSigDetections:v159 message:v184];
    v134 = [v133 reverseObjectEnumerator];

    uint64_t v135 = [v134 countByEnumeratingWithState:&v194 objects:v210 count:16];
    if (v135)
    {
      uint64_t v136 = v135;
      uint64_t v137 = *(void *)v195;
      do
      {
        for (uint64_t j = 0; j != v136; ++j)
        {
          if (*(void *)v195 != v137) {
            objc_enumerationMutation(v134);
          }
          uint64_t v139 = *(void *)(*((void *)&v194 + 1) + 8 * j);
          v140 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:1 modelVersion:0 confidence:0];
          [v176 addDetection:v139 forIdentity:log extractionInfo:v140];

          v141 = [MEMORY[0x1E4F29238] valueWithPointer:v139];
          [v131 addObject:v141];
        }
        uint64_t v136 = [v134 countByEnumeratingWithState:&v194 objects:v210 count:16];
      }
      while (v136);
    }
  }
  long long v192 = 0u;
  long long v193 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  *((void *)&v189 + 1) = v159;
  uint64_t v142 = [*((id *)&v189 + 1) countByEnumeratingWithState:&v190 objects:v209 count:16];
  if (v142)
  {
    uint64_t v143 = v142;
    uint64_t v144 = *(void *)v191;
    uint64_t v145 = *MEMORY[0x1E4F5DC98];
    uint64_t v146 = *MEMORY[0x1E4F5DCA8];
    do
    {
      for (uint64_t k = 0; k != v143; ++k)
      {
        if (*(void *)v191 != v144) {
          objc_enumerationMutation(*((id *)&v189 + 1));
        }
        uint64_t v148 = *(void *)(*((void *)&v190 + 1) + 8 * k);
        v149 = (void *)MEMORY[0x1CB79B230]();
        v150 = [MEMORY[0x1E4F29238] valueWithPointer:v148];
        if ([v131 containsObject:v150]) {
          uint64_t v151 = v145;
        }
        else {
          uint64_t v151 = v146;
        }
        +[SGDetectedAttributeMetrics recordExtractionOutcome:v151 fromMessage:v184 foundInSignature:1 isDDSignature:v185 != 0x7FFFFFFFFFFFFFFFLL detection:v148];
      }
      uint64_t v143 = [*((id *)&v189 + 1) countByEnumeratingWithState:&v190 objects:v209 count:16];
    }
    while (v143);
  }

  id v5 = v184;
  id v6 = v176;
  uint64_t v19 = v160;
LABEL_206:

LABEL_207:
  id v27 = v154;
LABEL_208:

LABEL_209:
}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
  [(SGDetectedAttributeDissector *)self _addAuthorContactForMessage:v11 entity:v8];
  [(SGDetectedAttributeDissector *)self _dissectMessage:v11 entity:v8];
  [(SGDetectedAttributeDissector *)self _removeUnwantedContactDetails:v11 entity:v8];
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
  [(SGDetectedAttributeDissector *)self _addAuthorContactForMessage:v11 entity:v8];
  [(SGDetectedAttributeDissector *)self _dissectMessage:v11 entity:v8];
  [(SGDetectedAttributeDissector *)self _removeUnwantedContactDetails:v11 entity:v8];
}

- (void)_removeUnwantedContactDetails:(id)a3 entity:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  id v8 = [v6 duplicateKey];
  if ([v8 entityType] == 13)
  {
    char v9 = [v6 contactInformationExtracted];

    if ((v9 & 1) == 0) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v5 senderIsAccountOwner])
  {
    int v21 = 0;
    goto LABEL_19;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = [v6 enrichments];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v16 = [v15 duplicateKey];
        uint64_t v17 = [v16 entityType];

        if (v17 == 20)
        {
          id v18 = [v15 duplicateKey];
          uint64_t v19 = [v18 contactDetailKey];
          v20 = [v19 identityKey];
          [v7 addObject:v20];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

LABEL_17:
  int v21 = 1;
LABEL_19:
  if (([v6 isInhuman] & 1) != 0 || objc_msgSend(v6, "isFromForwardedMessage"))
  {
    [v7 removeAllObjects];
  }
  else if (!v21)
  {
    goto LABEL_23;
  }
  uint64_t v22 = [v6 enrichments];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  id v25 = v7;
  id v26 = v6;
  v23 = sgFilter();
  objc_msgSend(v26, "setEnrichments:", v23, v24, 3221225472, __69__SGDetectedAttributeDissector__removeUnwantedContactDetails_entity___block_invoke, &unk_1E65BA290);

LABEL_23:
}

uint64_t __69__SGDetectedAttributeDissector__removeUnwantedContactDetails_entity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 duplicateKey];
  [v6 entityType];
  int IsContact = SGEntityTypeIsContact();
  if (IsContact)
  {
    id v8 = *(void **)(a1 + 32);
    v2 = [v5 duplicateKey];
    v3 = [v2 identityKey];
    if ([v8 containsObject:v3])
    {

LABEL_18:
      uint64_t v19 = 1;
      goto LABEL_19;
    }
  }
  char v9 = [v5 duplicateKey];
  if ([v9 entityType] == 20)
  {
    uint64_t v23 = a1;
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v5 duplicateKey];
    uint64_t v12 = [v11 contactDetailKey];
    uint64_t v13 = [v12 identityKey];
    char v14 = [v10 containsObject:v13];

    if (IsContact)
    {
    }
    a1 = v23;
    if (v14) {
      goto LABEL_18;
    }
  }
  else
  {

    if (IsContact)
    {
    }
  }
  int v15 = [v5 duplicateKey];
  [v15 entityType];
  if (SGEntityTypeIsContact())
  {
  }
  else
  {
    v16 = [v5 duplicateKey];
    [v16 entityType];
    int IsContactDetail = SGEntityTypeIsContactDetail();

    if (!IsContactDetail) {
      goto LABEL_18;
    }
  }
  id v18 = sgLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    int v21 = [*(id *)(a1 + 40) duplicateKey];
    uint64_t v22 = [v5 duplicateKey];
    *(_DWORD *)long long buf = 138412546;
    id v25 = v21;
    __int16 v26 = 2112;
    long long v27 = v22;
    _os_log_debug_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEBUG, "Unexpected Contact detail found in forwarded or inhuman text message: %@ %@", buf, 0x16u);
  }
  uint64_t v19 = 0;
LABEL_19:

  return v19;
}

- (void)_addAuthorContactForMessage:(id)a3 entity:(id)a4
{
  id v20 = a3;
  id v5 = a4;
  id v6 = [v20 author];

  if (v6)
  {
    uint64_t v7 = [v20 author];
    id v8 = +[SGIdentityKey keyForPersonHandle:v7];

    if (!v8)
    {
LABEL_12:

      goto LABEL_13;
    }
    char v9 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v10 = [v20 author];
    uint64_t v11 = [v10 displayName];

    uint64_t v12 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v13 = [[SGPipelineEnrichment alloc] initWithPseudoContactWithKey:v8 parent:v5 name:v11];
    if (+[SGNames isDifficultName:v11])
    {
      char v14 = [MEMORY[0x1E4F5D9F0] hardName];
      [(SGEntity *)v13 addTag:v14];
    }
    if ([v8 hasEmailAddress])
    {
      int v15 = [v8 emailAddress];
      BOOL v16 = +[SGInhumans isInhumanEmailAddress:v15];

      if (!v16) {
        goto LABEL_11;
      }
    }
    else
    {
      if (![v8 hasPhone]) {
        goto LABEL_11;
      }
      uint64_t v17 = [v8 phone];
      BOOL v18 = +[SGInhumans isInhumanPhoneNumber:v17];

      if (!v18) {
        goto LABEL_11;
      }
    }
    uint64_t v19 = [MEMORY[0x1E4F5D9F0] inhuman];
    [(SGEntity *)v13 addTag:v19];

LABEL_11:
    [v5 addEnrichment:v13];

    goto LABEL_12;
  }
LABEL_13:
}

- (void)handleTextMessageSelfIdentification:(id)a3 entity:(id)a4 withConversationHistory:(id)a5
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v84 = a4;
  id v86 = a5;
  v87 = v7;
  id v8 = [v7 conversationIdentifier];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    uint64_t v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "Self-id: Text message has no conversation identifier", (uint8_t *)&buf, 2u);
    }
    goto LABEL_9;
  }
  if (+[SGDetectedAttributeDissector isTwoPersonConversation:v7])
  {
    if ([v7 senderIsBusinessChat])
    {
      uint64_t v10 = sgLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        uint64_t v11 = "Self-id: processing is disabled for business chat";
LABEL_21:
        __int16 v26 = v10;
        uint32_t v27 = 2;
        goto LABEL_22;
      }
      goto LABEL_9;
    }
    uint64_t v12 = [v7 domainIdentifier];

    if (!v12)
    {
      uint64_t v23 = sgLogHandle();
      uint64_t v10 = v23;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [v87 uniqueIdentifier];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v24;
        _os_log_error_impl(&dword_1CA650000, v23, OS_LOG_TYPE_ERROR, "Self-id: No domain identifier found for message: %@", (uint8_t *)&buf, 0xCu);

        uint64_t v10 = v23;
      }
      goto LABEL_9;
    }
    uint64_t v13 = +[SGChatLengthEstimator sharedInstance];
    char v14 = [v7 domainIdentifier];
    unint64_t v15 = [v13 estimateMessagesInChat:v14];

    unint64_t v16 = [(SGDetectedAttributeDissector *)self selfIdentificationMessageCount];
    unint64_t v80 = v15;
    if (v15 >= v16)
    {
      int v25 = v16;
      uint64_t v10 = sgLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 67109376;
        DWORD1(buf) = v80;
        WORD4(buf) = 1024;
        *(_DWORD *)((char *)&buf + 10) = v25;
        uint64_t v11 = "Self-id: ignoring message far in thread (position: %i >= %i)";
        __int16 v26 = v10;
        uint32_t v27 = 14;
LABEL_22:
        _os_log_debug_impl(&dword_1CA650000, v26, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&buf, v27);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    v81 = [v87 textContent];
    uint64_t v17 = [v86 likelyLanguage];

    if (v17)
    {
      if ((unint64_t)[v81 length] <= 0x8C)
      {
        context = (void *)MEMORY[0x1CB79B230]();
        BOOL v18 = [SGNameDetector alloc];
        uint64_t v19 = [v86 likelyLanguage];
        id v20 = [(SGNameDetector *)v18 initWithLanguage:v19];

        float v79 = v20;
        int v21 = [(SGNameDetector *)v20 detectNames:v81 algorithm:2];
        uint64_t v22 = v21;
        if ([v21 count])
        {
          int v82 = 0;
        }
        else
        {
          uint64_t v32 = (void *)MEMORY[0x1CB79B230]();
          uint64_t v22 = [(SGNameDetector *)v79 detectNames:v81 algorithm:1];

          coreNLPTrustedLanguages = self->_coreNLPTrustedLanguages;
          uint64_t v34 = [v86 likelyLanguage];
          int v82 = ![(NSSet *)coreNLPTrustedLanguages containsObject:v34];
        }
        if ([v22 count] && (unint64_t)objc_msgSend(v22, "count") <= 4)
        {
          v77 = v22;
          uint64_t v35 = sgSignpostHandle();
          int ptr = 7;
          os_signpost_id_t spid = os_signpost_id_make_with_pointer(v35, &ptr);

          id v36 = sgSignpostHandle();
          int v37 = v36;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA650000, v37, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SelfIdFeaturizations", "Start", (uint8_t *)&buf, 2u);
          }

          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          obuint64_t j = v22;
          long long v30 = 0;
          v31 = 0;
          uint64_t v38 = [obj countByEnumeratingWithState:&v94 objects:v106 count:16];
          if (v38)
          {
            uint64_t v39 = *(void *)v95;
            float v40 = 0.0;
            do
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v95 != v39) {
                  objc_enumerationMutation(obj);
                }
                int v42 = *(void **)(*((void *)&v94 + 1) + 8 * i);
                BOOL v43 = (void *)MEMORY[0x1CB79B230]();
                int v44 = [SGSelfIDSupervision alloc];
                uint64_t v45 = [v42 range];
                int v47 = -[SGSelfIDSupervision initWithMessage:candidateName:](v44, "initWithMessage:candidateName:", v87, v45, v46);
                BOOL v48 = [(SGDetectedAttributeML *)self->_ml selfIdDetectionWithTextMessage:v87 inConversation:v86 withSupervision:v47];
                v49 = [v48 extractionInfo];
                v50 = [v49 confidence];
                [v50 floatValue];
                float v52 = v51;

                if (v48 && v52 >= v40)
                {
                  id v53 = v48;
                  if (v82) {
                    v54 = v31;
                  }
                  else {
                    v54 = v30;
                  }
                  if (v82) {
                    v31 = v53;
                  }
                  else {
                    long long v30 = v53;
                  }

                  float v40 = v52;
                }
              }
              uint64_t v38 = [obj countByEnumeratingWithState:&v94 objects:v106 count:16];
            }
            while (v38);
          }

          v55 = sgSignpostHandle();
          v56 = v55;
          if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v55))
          {
            LOWORD(buf) = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA650000, v56, OS_SIGNPOST_INTERVAL_END, spid, "SelfIdFeaturizations", "Completed", (uint8_t *)&buf, 2u);
          }

          uint64_t v22 = v77;
        }
        else
        {
          long long v30 = 0;
          v31 = 0;
        }

LABEL_58:
        v57 = [v86 messages];
        if (v57)
        {
          v58 = [(SGDetectedAttributeDissector *)self processTextMessageConversation:v57 threadLength:v80];
          v59 = v58;
          if ((v30 != 0) != (v58 != 0))
          {
            if (v58)
            {
              uint64_t v60 = [v58 name];
LABEL_64:
              v61 = [v87 recipients];
              uint64_t v62 = [v61 firstObject];
              v63 = [v62 displayName];

              if ([v63 containsString:v60])
              {

                long long v30 = 0;
                v59 = 0;
              }

              goto LABEL_68;
            }
LABEL_63:
            uint64_t v60 = [v30 name];
            v59 = 0;
            goto LABEL_64;
          }
        }
        else
        {
          if (v30) {
            goto LABEL_63;
          }
          v59 = 0;
        }
LABEL_68:
        +[SGDetectedAttributeDissector _logSelfIDForMessage:v87 detection:v59 modelType:*MEMORY[0x1E4F5DE68] modelVersion:0];
        v64 = [MEMORY[0x1E4F5DFA8] asset];
        uint64_t v65 = [v64 assetVersion];
        +[SGDetectedAttributeDissector _logSelfIDForMessage:v87 detection:v30 modelType:*MEMORY[0x1E4F5DE60] modelVersion:v65];

        unint64_t v66 = [MEMORY[0x1E4F5DFA8] asset];
        uint64_t v67 = [v66 assetVersion];
        +[SGDetectedAttributeDissector _logSelfIDForMessage:v87 detection:v31 modelType:*MEMORY[0x1E4F5DE58] modelVersion:v67];

        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v102 = 0x3032000000;
        char v103 = __Block_byref_object_copy__24821;
        char v104 = __Block_byref_object_dispose__24822;
        id v105 = 0;
        v91[0] = MEMORY[0x1E4F143A8];
        v91[1] = 3221225472;
        v91[2] = __99__SGDetectedAttributeDissector_handleTextMessageSelfIdentification_entity_withConversationHistory___block_invoke;
        v91[3] = &unk_1E65C0728;
        id v68 = v84;
        id v92 = v68;
        p_long long buf = &buf;
        [v68 runWithDissectorLock:v91];
        if (*(void *)(*((void *)&buf + 1) + 40))
        {
          uint64_t v69 = sgLogHandle();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)int v99 = 0;
            _os_log_debug_impl(&dword_1CA650000, v69, OS_LOG_TYPE_DEBUG, "Self-id: doesn't look for self id if message has a display name", v99, 2u);
          }
        }
        else
        {
          if (v59) {
            uint64_t v70 = v59;
          }
          else {
            uint64_t v70 = v30;
          }
          id v71 = v70;
          if (v71)
          {
            v72 = v71;
            int v73 = sgLogHandle();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
            {
              v74 = [v72 name];
              uint64_t v75 = [v74 length];
              *(_DWORD *)int v99 = 134217984;
              uint64_t v100 = v75;
              _os_log_debug_impl(&dword_1CA650000, v73, OS_LOG_TYPE_DEBUG, "Self-id: updating pseudo-contact entity with name length: %tu", v99, 0xCu);
            }
            v88[0] = MEMORY[0x1E4F143A8];
            v88[1] = 3221225472;
            v88[2] = __99__SGDetectedAttributeDissector_handleTextMessageSelfIdentification_entity_withConversationHistory___block_invoke_156;
            v88[3] = &unk_1E65BFD88;
            id v89 = v68;
            uint64_t v69 = v72;
            v90 = v69;
            [v89 runWithDissectorLock:v88];
          }
          else
          {
            uint64_t v69 = 0;
          }
        }

        _Block_object_dispose(&buf, 8);
        uint64_t v10 = v81;
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v28 = sgLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1CA650000, v28, OS_LOG_TYPE_DEFAULT, "Self-id: No likely language prediction for conversation", (uint8_t *)&buf, 2u);
      }

      if ((unint64_t)[v81 length] < 0x8D) {
        goto LABEL_29;
      }
    }
    long long v29 = sgLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_debug_impl(&dword_1CA650000, v29, OS_LOG_TYPE_DEBUG, "Self-id: text length too long", (uint8_t *)&buf, 2u);
    }

LABEL_29:
    long long v30 = 0;
    v31 = 0;
    goto LABEL_58;
  }
  uint64_t v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    uint64_t v11 = "Self-id: processing is disabled for group messages";
    goto LABEL_21;
  }
LABEL_9:
}

void __99__SGDetectedAttributeDissector_handleTextMessageSelfIdentification_entity_withConversationHistory___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [*(id *)(a1 + 32) enrichments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v8 = [v7 duplicateKey];
        if ([v8 entityType] == 4)
        {
          uint64_t v9 = [v7 title];
          uint64_t v10 = [v9 length];

          if (v10)
          {
            uint64_t v11 = sgLogHandle();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)unint64_t v16 = 0;
              _os_log_debug_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEBUG, "Self-id: doesn't look for self id if message has a display name", v16, 2u);
            }

            uint64_t v13 = [v7 title];
            uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
            unint64_t v15 = *(void **)(v14 + 40);
            *(void *)(v14 + 40) = v13;

            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

void __99__SGDetectedAttributeDissector_handleTextMessageSelfIdentification_entity_withConversationHistory___block_invoke_156(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) author];
  uint64_t v3 = +[SGIdentityKey keyForPersonHandle:v2];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v22 = a1;
  obuint64_t j = [*(id *)(a1 + 32) enrichments];
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v4)
  {
LABEL_15:

LABEL_18:
    unint64_t v15 = sgLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEFAULT, "Self-id: Could not find author-pseudocontact to augment with text message self-identification.", buf, 2u);
    }
    goto LABEL_20;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v26;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v26 != v6) {
      objc_enumerationMutation(obj);
    }
    id v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
    uint64_t v9 = [v8 duplicateKey];
    if ([v9 entityType] == 4 && v3 != 0) {
      break;
    }

LABEL_13:
    if (v5 == ++v7)
    {
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v5) {
        goto LABEL_3;
      }
      goto LABEL_15;
    }
  }
  uint64_t v11 = [v8 duplicateKey];
  uint64_t v12 = [v11 pseudoContactKey];
  uint64_t v13 = [v12 identityKey];
  char v14 = [v13 isEqualToIdentityKey:v3];

  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
  unint64_t v15 = v8;

  if (!v15) {
    goto LABEL_18;
  }
  unint64_t v16 = [*(id *)(v22 + 40) name];
  [v15 setTitle:v16];

  long long v17 = [*(id *)(v22 + 40) context];
  [v15 setContent:v17];

  uint64_t v18 = [*(id *)(v22 + 40) contextRange];
  -[NSObject setContentRangeOfInterest:](v15, "setContentRangeOfInterest:", v18, v19);
  long long v20 = [*(id *)(v22 + 40) extractionInfo];
  [v15 setExtractionInfo:v20];

  int v21 = [MEMORY[0x1E4F5D9F0] fromTextMessage];
  [v15 addTag:v21];

  [*(id *)(v22 + 32) setContactInformationExtracted:1];
LABEL_20:
}

- (id)getResponsesForBirthdayExtractionFromMessage:(id)a3 withLanguage:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 textContent];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F962A8] sharedManager];
    uint64_t v9 = [v8 responsesForMessage:v7 maximumResponses:0 forContext:0 withLanguage:v6 options:544];
    if (!v9)
    {
      uint64_t v10 = sgLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [v5 uniqueIdentifier];
        int v16 = 138412290;
        long long v17 = v11;
        _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "No responses found for message: %@", (uint8_t *)&v16, 0xCu);
      }
    }
    uint64_t v12 = v9;

    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v12 = sgLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      char v14 = [v5 uniqueIdentifier];
      int v16 = 138412290;
      long long v17 = v14;
      _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEFAULT, "SGDetectedAttributeDissector: getResponsesForBirthdayExtractionFromMessage: text message has nil textContent: %@", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)handleTextMessageBirthdayCongratulation:(id)a3 entity:(id)a4 withConversationHistory:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v70 = a4;
  id v69 = a5;
  v72 = v7;
  id v8 = [v7 conversationIdentifier];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    oslog = sgLogHandle();
    if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    LOWORD(buf) = 0;
    uint64_t v23 = "Birthday: Text message has no conversation identifier";
LABEL_19:
    _os_log_error_impl(&dword_1CA650000, oslog, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&buf, 2u);
    goto LABEL_54;
  }
  uint64_t v10 = [v7 date];

  if (!v10)
  {
    oslog = sgLogHandle();
    if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    LOWORD(buf) = 0;
    uint64_t v23 = "Birthday: Entity with type SGEntityTextMessage has invalid message date";
    goto LABEL_19;
  }
  if (+[SGDetectedAttributeDissector isTwoPersonConversation:v7])
  {
    oslog = [v69 likelyLanguage];
    [(SGDetectedAttributeDissector *)self getResponsesForBirthdayExtractionFromMessage:v7 withLanguage:oslog];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v74 objects:v83 count:16];
    if (v12)
    {
      char v13 = 0;
      uint64_t v14 = *(void *)v75;
      uint64_t v15 = *MEMORY[0x1E4F962C0];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v75 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v17 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          uint64_t v18 = [v17 attributes];
          BOOL v19 = v18 == 0;

          if (!v19)
          {
            long long v20 = [v17 attributes];
            int v21 = [v20 objectForKey:@"subtype"];
            char v22 = [v21 isEqualToString:v15];

            v13 |= v22;
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v74 objects:v83 count:16];
      }
      while (v12);

      if (v13)
      {
        unsigned int v65 = 1;
        goto LABEL_26;
      }
    }
    else
    {
    }
    uint64_t v24 = sgLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      long long v25 = [v72 uniqueIdentifier];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEFAULT, "RKAttributedTokenBirthdayType not found for message: %@", (uint8_t *)&buf, 0xCu);
    }
    unsigned int v65 = 0;
LABEL_26:
    long long v26 = [v72 textContent];
    uint64_t v67 = _PASNormalizeUnicodeString();

    unint64_t v66 = regex2ForKey(@"Birthday/F");
    long long v27 = [v66 existsInString:v67];
    long long v28 = v27;
    if (v27)
    {
      +[SGAggregateLogging reMatched:v27];
      long long v28 = v27;
    }
    BOOL v29 = v28 != 0;
    ml = self->_ml;
    v31 = [v69 likelyLanguage];
    uint64_t v32 = [(SGDetectedAttributeML *)ml birthdayCongratsTextMessage:v72 andLanguage:v31 andHealthStore:self->_healthStore];

    if (((v65 | v29) & 1) == 0 && !v32) {
      goto LABEL_53;
    }
    context = (void *)MEMORY[0x1CB79B230]();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v79 = 0x3010000000;
    uint64_t v81 = 0;
    uint64_t v82 = 0;
    unint64_t v80 = "";
    if ((v65 | (v32 != 0)) == 1)
    {
      id v33 = [v72 textContent];
      uint64_t v34 = [v33 length];
      uint64_t v35 = *((void *)&buf + 1);
      *(void *)(*((void *)&buf + 1) + 32) = 0;
      *(void *)(v35 + 40) = v34;
    }
    else
    {
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __103__SGDetectedAttributeDissector_handleTextMessageBirthdayCongratulation_entity_withConversationHistory___block_invoke;
      v73[3] = &unk_1E65BA268;
      v73[4] = &buf;
      [v27 enumerateMatchesInString:v67 ngroups:0 block:v73];
    }
    uint64_t v62 = [v72 date];
    id v36 = [v72 recipients];
    v64 = [v36 firstObject];

    v61 = +[SGIdentityKey keyForPersonHandle:v64];
    if (!v61)
    {

LABEL_52:
      _Block_object_dispose(&buf, 8);
LABEL_53:

      goto LABEL_54;
    }
    int v37 = [v72 isSent];
    v63 = [v64 displayName];
    uint64_t v38 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789+-()"];
    uint64_t v39 = [v64 handleIdentifier];
    v57 = v38;
    if ([v63 isEqual:v39] & 1) != 0 || (objc_msgSend(v63, "containsString:", @"@"))
    {
    }
    else
    {
      v55 = [v38 invertedSet];
      BOOL v56 = [v63 rangeOfCharacterFromSet:v55] == 0x7FFFFFFFFFFFFFFFLL;

      if (!v56) {
        goto LABEL_38;
      }
    }

    v63 = 0;
LABEL_38:
    uint64_t v60 = [[SGPipelineEnrichment alloc] initWithPseudoContactWithKey:v61 parent:v70 name:v63];
    float v40 = [v64 displayName];
    BOOL v41 = +[SGNames isDifficultName:v40];

    if (v41)
    {
      int v42 = [MEMORY[0x1E4F5D9F0] hardName];
      [(SGEntity *)v60 addTag:v42];
    }
    int v43 = v37 ^ 1;
    __103__SGDetectedAttributeDissector_handleTextMessageBirthdayCongratulation_entity_withConversationHistory___block_invoke_2(v60, v37 ^ 1);
    [v70 acquireDissectorLock];
    [v70 addEnrichment:v60];
    int v44 = objc_opt_new();
    [v44 setDateFormat:@"dd-MM"];
    uint64_t v45 = [v44 stringFromDate:v62];
    uint64_t v46 = (void *)*MEMORY[0x1E4F5DED8];
    id v47 = v45;
    id v48 = v46;
    v49 = v47;
    v58 = [[SGLabeledValue alloc] initWithLabel:v48 value:v47];

    v50 = [v72 textContent];
    uint64_t v51 = *((void *)&buf + 1);
    if (v32)
    {
      float v52 = v32;
    }
    else
    {
      float v52 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:2 modelVersion:0 confidence:0];
    }
    id v53 = objc_msgSend(v70, "birthday:forIdentity:context:contextRangeOfInterest:extractionInfo:", v58, v61, v50, *(void *)(v51 + 32), *(void *)(v51 + 40), v52);
    if (!v32) {

    }
    __103__SGDetectedAttributeDissector_handleTextMessageBirthdayCongratulation_entity_withConversationHistory___block_invoke_2(v53, v43);
    [v70 addBirthdayEnrichment:v53];
    [v70 setContactInformationExtracted:1];
    [v70 releaseDissectorLock];
    if (v32)
    {
      v54 = [v32 modelVersion];
    }
    else
    {
      v54 = 0;
    }
    [(SGDetectedAttributeDissector *)self logBirthdayExtractionMetricForPerson:v64 forDate:v62 isFromCongratulation:1 withModelVersion:v54 didRegexTrigger:v27 != 0 didResponseKitTrigger:v65];
    if (v32) {

    }
    goto LABEL_52;
  }
  oslog = sgLogHandle();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_debug_impl(&dword_1CA650000, oslog, OS_LOG_TYPE_DEBUG, "Birthday: processing is disabled for group messages", (uint8_t *)&buf, 2u);
  }
LABEL_54:
}

uint64_t __103__SGDetectedAttributeDissector_handleTextMessageBirthdayCongratulation_entity_withConversationHistory___block_invoke(uint64_t a1, _OWORD *a2)
{
  *(_OWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = *a2;
  return 0;
}

void __103__SGDetectedAttributeDissector_handleTextMessageBirthdayCongratulation_entity_withConversationHistory___block_invoke_2(void *a1, int a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F5D9F0];
  id v4 = a1;
  id v5 = [v3 isSent];
  if (a2) {
    [v4 addTag:v5];
  }
  else {
    [v4 removeTag:v5];
  }
}

- (void)logBirthdayExtractionMetricForPerson:(id)a3 forDate:(id)a4 isFromCongratulation:(unsigned __int8)a5 withModelVersion:(id)a6 didRegexTrigger:(unsigned __int8)a7 didResponseKitTrigger:(unsigned __int8)a8
{
  unsigned int v8 = a8;
  unsigned int v9 = a7;
  unsigned int v11 = a5;
  v55[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    float v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"SGDetectedAttributeDissector.m", 639, @"Invalid parameter not satisfying: %@", @"targetPerson" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  BOOL v41 = [MEMORY[0x1E4F28B00] currentHandler];
  [v41 handleFailureInMethod:a2, self, @"SGDetectedAttributeDissector.m", 640, @"Invalid parameter not satisfying: %@", @"birthdayDate" object file lineNumber description];

LABEL_3:
  uint64_t v18 = [v15 contactIdentifier];
  v55[0] = *MEMORY[0x1E4F1AD90];
  BOOL v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  if (v18)
  {
    unsigned int v48 = v11;
    unsigned int v49 = v9;
    long long v20 = +[SGContactStoreFactory contactStoreWithDonatedContacts];
    id v50 = 0;
    int v21 = +[SGContactsInterface unifiedContactWithIdentifier:v18 keysToFetch:v19 usingContactStore:v20 error:&v50];
    char v22 = v50;

    if (!v21 || v22)
    {
      uint64_t v23 = sgLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412546;
        id v52 = v18;
        __int16 v53 = 2112;
        v54 = v22;
        _os_log_debug_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEBUG, "unifiedContactWithIdentifier for %@ failed with error %@", buf, 0x16u);
      }
      goto LABEL_36;
    }
    unsigned int v47 = v8;
    uint64_t v23 = [v21 birthday];
    id v24 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    long long v25 = (void *)[v24 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    long long v26 = [v25 components:2097180 fromDate:v16];
    long long v27 = v26;
    if (!v23 || !v26)
    {
LABEL_35:

LABEL_36:
      goto LABEL_37;
    }
    -[NSObject setYear:](v23, "setYear:", [v26 year]);
    uint64_t v28 = [v25 dateFromComponents:v23];
    if (v28)
    {
      id v44 = v17;
      uint64_t v46 = (void *)v28;
      BOOL v29 = [v25 components:16 fromDate:v16 toDate:v28 options:0];
      uint64_t v45 = v29;
      if ([v29 day])
      {
        uint64_t v30 = [v29 day];
        if (v30 >= 0) {
          unint64_t v31 = v30;
        }
        else {
          unint64_t v31 = -v30;
        }
        if (v31 <= 7)
        {
          uint64_t v32 = [v29 day];
          if (v32 >= 0) {
            unint64_t v33 = v32;
          }
          else {
            unint64_t v33 = -v32;
          }
          unint64_t v42 = v33;
          uint64_t v34 = [v29 day];
          uint64_t v35 = @"SGM2BirthdayPreviousDay";
          if (v34 > 0) {
            uint64_t v35 = @"SGM2BirthdayNextDay";
          }
          id v36 = @"SGM2BirthdayNextWeek";
          if (v34 <= 0) {
            id v36 = @"SGM2BirthdayPreviousWeek";
          }
          if (v42 > 1) {
            uint64_t v35 = v36;
          }
          int v43 = v35;
          id v17 = v44;
          +[SGDetectedAttributeMetrics recordBirthdayExtractionAccuracy:0 withOffset:v43 withModelVersion:v44 isFromCongratulation:v48 didRegexTrigger:v49 didResponseKitTrigger:v47];

          goto LABEL_34;
        }
        uint64_t v38 = @"SGM2BirthdayWrongDay";
        uint64_t v39 = 0;
      }
      else
      {
        uint64_t v38 = @"SGM2BirthdaySameDay";
        uint64_t v39 = 1;
      }
      id v17 = v44;
      +[SGDetectedAttributeMetrics recordBirthdayExtractionAccuracy:v39 withOffset:v38 withModelVersion:v44 isFromCongratulation:v48 didRegexTrigger:v49 didResponseKitTrigger:v47];
LABEL_34:

      goto LABEL_35;
    }
    int v37 = sgLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v37, OS_LOG_TYPE_ERROR, "unifiedContactWithIdentifier failed to generate date for birthday.", buf, 2u);
    }

    char v22 = v21;
  }
  else
  {
    char v22 = sgLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v52 = v15;
      _os_log_debug_impl(&dword_1CA650000, v22, OS_LOG_TYPE_DEBUG, "No contact identifier for %@", buf, 0xCu);
    }
  }
LABEL_37:
}

- (id)processTextMessageConversation:(id)a3 threadLength:(unint64_t)a4
{
  return +[SGSelfIdentification processConversation:a3 threadLength:a4 options:3];
}

- (id)filterDangerousSigDetections:(id)a3 message:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = objc_opt_new();
  unsigned int v9 = objc_opt_new();
  uint64_t v10 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        int v17 = objc_msgSend(v16, "type", (void)v24);
        uint64_t v18 = v8;
        if (!v17) {
          goto LABEL_11;
        }
        if (v17 == 1)
        {
          uint64_t v18 = v9;
LABEL_11:
          [v18 addObject:v16];
          continue;
        }
        uint64_t v18 = v10;
        if (v17 == 2) {
          goto LABEL_11;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  BOOL v19 = [(SGDetectedAttributeDissector *)self filterDangerousSigPhoneDetections:v8 message:v7];
  long long v20 = [(SGDetectedAttributeDissector *)self filterDangerousSigAddressDetections:v9];
  int v21 = [(SGDetectedAttributeDissector *)self filterDangerousSigEmailDetections:v10 message:v7];
  char v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v20, "count") + objc_msgSend(v19, "count") + objc_msgSend(v21, "count"));
  [v22 addObjectsFromArray:v19];
  [v22 addObjectsFromArray:v20];
  [v22 addObjectsFromArray:v21];

  return v22;
}

- (id)filterDangerousSigEmailDetections:(id)a3 message:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  BOOL v41 = self;
  if (objc_opt_isKindOfClass())
  {
    int v43 = [(SGDetectedAttributeDissector *)self _makeSimplifiedListIdEmail:v7];
  }
  else
  {
    int v43 = 0;
  }
  id v42 = (id)objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = off_1E65B4000;
    uint64_t v11 = *(void *)v49;
    uint64_t v44 = *(void *)v49;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
        uint64_t v14 = (void *)MEMORY[0x1CB79B230]();
        id v15 = v10[56];
        id v16 = [v7 textContent];
        uint64_t v17 = [v13 match];
        BOOL v19 = objc_msgSend(v16, "substringWithRange:", v17, v18);
        LODWORD(v15) = [(__objc2_class *)v15 isInhumanEmailAddress:v19];

        if (v15)
        {
          long long v20 = sgLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_debug_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Inhuman email address in signature.", buf, 2u);
          }
        }
        else
        {
          uint64_t v46 = v14;
          int v21 = v7;
          uint64_t v22 = v9;
          uint64_t v23 = v10;
          long long v24 = [v21 textContent];
          long long v25 = v21;
          long long v26 = [v21 textContent];
          uint64_t v27 = [v13 match];
          uint64_t v29 = objc_msgSend(v26, "lineRangeForRange:", v27, v28);
          unint64_t v31 = objc_msgSend(v24, "substringWithRange:", v29, v30);
          uint64_t v32 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          long long v20 = [v31 stringByTrimmingCharactersInSet:v32];

          int v33 = [v20 characterAtIndex:[v20 length] - 1];
          if (v33 == 65306 || v33 == 58)
          {
            uint64_t v34 = sgLogHandle();
            uint64_t v9 = v22;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)long long buf = 0;
              _os_log_debug_impl(&dword_1CA650000, v34, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Email address with colon at end of line in signature.", buf, 2u);
            }

            uint64_t v10 = v23;
            id v7 = v25;
LABEL_17:
            uint64_t v11 = v44;
            uint64_t v14 = v46;
            goto LABEL_18;
          }
          uint64_t v9 = v22;
          if (+[SGDataDetectorMatch stringHasDatesOrTimes:v20])
          {
            uint64_t v35 = sgLogHandle();
            uint64_t v10 = v23;
            id v7 = v25;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)long long buf = 0;
              _os_log_debug_impl(&dword_1CA650000, v35, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Email address with date or time in line in signature.", buf, 2u);
            }

            goto LABEL_17;
          }
          uint64_t v10 = v23;
          id v7 = v25;
          uint64_t v11 = v44;
          uint64_t v14 = v46;
          if (!v43) {
            goto LABEL_27;
          }
          id v36 = [v13 extraction];
          int v37 = [(SGDetectedAttributeDissector *)v41 _makeAlnum:v36];

          if ([v37 compare:v43 options:1])
          {

LABEL_27:
            objc_msgSend(v42, "addObject:", v13, v41);
            goto LABEL_18;
          }
          uint64_t v38 = sgLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_debug_impl(&dword_1CA650000, v38, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Email address in signature is close match to List-Id header.", buf, 2u);
          }
        }
LABEL_18:

        ++v12;
      }
      while (v9 != v12);
      uint64_t v39 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      uint64_t v9 = v39;
    }
    while (v39);
  }

  return v42;
}

- (id)_makeSimplifiedListIdEmail:(id)a3
{
  id v4 = [a3 headersDictionary];
  id v5 = [v4 objectForKeyedSubscript:@"list-id"];

  if ([v5 count])
  {
    id v6 = [v5 firstObject];
    id v7 = [(SGDetectedAttributeDissector *)self _extractEmailishTokenFromMailHeader:v6];
    if (v7)
    {
      uint64_t v8 = [(SGDetectedAttributeDissector *)self _makeAlnum:v7];
      if ((unint64_t)[v8 length] >= 8) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_makeAlnum:(id)a3
{
  id v3 = a3;
  CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
  id v4 = _PASKeepOnlyCharacterSet();

  return v4;
}

- (id)_extractEmailishTokenFromMailHeader:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F5DB38] namedEmailAddressWithFieldValue:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 emailAddress];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v9 = [v3 componentsSeparatedByCharactersInSet:v8];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = objc_msgSend(v9, "reverseObjectEnumerator", 0);
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
          id v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v15 containsString:@"<"]
            && ([v15 containsString:@">"] & 1) != 0)
          {
            id v6 = v15;

            goto LABEL_16;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    if ([v9 count])
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = 0;
    }
LABEL_16:
  }
  return v6;
}

- (id)filterDangerousSigAddressDetections:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] < 3)
  {
    id v5 = v3;
  }
  else
  {
    id v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Too many postal addresses in signature.", v7, 2u);
    }

    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)filterDangerousSigPhoneDetections:(id)a3 message:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (!v7) {
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  int v9 = 0;
  uint64_t v10 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v42 != v10) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v41 + 1) + 8 * i) hasPhoneLabel]) {
        int v12 = 1;
      }
      else {
        int v12 = 2;
      }
      v9 += v12;
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v41 objects:v46 count:16];
  }
  while (v8);
  if (v9 >= 7)
  {
    uint64_t v13 = sgLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Too many phones in signature.", buf, 2u);
    }
    id v33 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
LABEL_15:
    id v33 = (id)objc_opt_new();
    id v31 = v6;
    uint64_t v13 = [v6 textContent];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v32 = v5;
    obuint64_t j = v5;
    uint64_t v14 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(obj);
          }
          long long v18 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          long long v19 = (void *)MEMORY[0x1CB79B230]();
          long long v20 = (void *)MEMORY[0x1CB79B230]();
          uint64_t v21 = [v18 match];
          uint64_t v23 = -[NSObject substringWithRange:](v13, "substringWithRange:", v21, v22);
          if (_PASIsAllDigits() && ([v18 hasPhoneLabel] & 1) == 0)
          {
            long long v26 = sgLogHandle();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)long long buf = 0;
              _os_log_debug_impl(&dword_1CA650000, v26, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: All-digit phone without label in signature.", buf, 2u);
            }
          }
          else
          {
            uint64_t v24 = [v18 match];
            long long v26 = -[SGDetectedAttributeDissector getLineContaining:inText:](self, "getLineContaining:inText:", v24, v25, v13);
            uint64_t v27 = regex2ForKey(@"LogLine");
            uint64_t v28 = [v27 existsInString:v26];

            if (v28)
            {
              uint64_t v29 = sgLogHandle();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)long long buf = 0;
                _os_log_debug_impl(&dword_1CA650000, v29, OS_LOG_TYPE_DEBUG, "Ignoring DataDetector match: Log line in signature.", buf, 2u);
              }
            }
            else
            {
              [v33 addObject:v18];
            }
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v15);
    }

    id v6 = v31;
    id v5 = v32;
  }

  return v33;
}

- (id)detectionFromBodyDDMatch:(id)a3 message:(id)a4 withSupervisionToFill:(id)a5 isUnlikelyPhone:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v40 = 0;
  long long v41 = &v40;
  uint64_t v42 = 0x3032000000;
  long long v43 = __Block_byref_object_copy__24821;
  long long v44 = __Block_byref_object_dispose__24822;
  id v45 = 0;
  uint64_t v13 = [v10 valueRange];
  [v10 valueRange];
  uint64_t v15 = v14;
  uint64_t v16 = [v11 textContent];
  long long v17 = textToMatch(v13, v15 + v13, v16, [v10 matchType]);

  if (![v10 matchType]
    || [v10 matchType] == 1
    || [v10 matchType] == 3)
  {
    context = (void *)MEMORY[0x1CB79B230]();
    int v18 = [v10 matchType];
    long long v19 = @"MyAddress/F";
    if (v18 == 3) {
      long long v19 = @"BirthdayDate/F";
    }
    if (v18) {
      long long v20 = v19;
    }
    else {
      long long v20 = @"MyPhone/F";
    }
    uint64_t v21 = regex2ForKey(v20);
    if ([v10 matchType]) {
      uint64_t v22 = @"NotMyAddress/F";
    }
    else {
      uint64_t v22 = @"NotMyPhone/F";
    }
    uint64_t v23 = regex2ForKey(v22);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __103__SGDetectedAttributeDissector_detectionFromBodyDDMatch_message_withSupervisionToFill_isUnlikelyPhone___block_invoke;
    v31[3] = &unk_1E65BA240;
    id v24 = v12;
    id v32 = v24;
    id v25 = v23;
    id v33 = v25;
    id v34 = v17;
    id v35 = v10;
    long long v38 = &v40;
    id v36 = v11;
    long long v37 = self;
    BOOL v39 = a6;
    [v21 enumerateMatchesInString:v34 ngroups:0 block:v31];
    if (([v24 regexBelongsToSender] & 1) == 0)
    {
      long long v26 = sgLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_debug_impl(&dword_1CA650000, v26, OS_LOG_TYPE_DEBUG, "DataDetector is not a definitive match: Not in definitive phrase.", buf, 2u);
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    +[SGDetectedAttributeMetrics recordSentContactDetailWithMessage:match:found:](SGDetectedAttributeMetrics, "recordSentContactDetailWithMessage:match:found:", v11, v10, [v12 metricsContactDetailFoundIn]);
  }
  id v27 = (id)v41[5];

  _Block_object_dispose(&v40, 8);
  return v27;
}

uint64_t __103__SGDetectedAttributeDissector_detectionFromBodyDDMatch_message_withSupervisionToFill_isUnlikelyPhone___block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) setRegexBelongsToSender:1];
  if (([*(id *)(a1 + 40) isTrivial] & 1) != 0
    || ([*(id *)(a1 + 40) existsInString:*(void *)(a1 + 48)],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    uint64_t v6 = [*(id *)(a1 + 56) matchType];
    uint64_t v7 = v6;
    if (v6)
    {
      if (v6 == 3)
      {
        id v8 = (id)*MEMORY[0x1E4F5DED8];
      }
      else
      {
        id v8 = 0;
        uint64_t v7 = 1;
      }
    }
    else
    {
      id v8 = 0;
    }
    int v9 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:2 modelVersion:0 confidence:0];
    id v10 = [*(id *)(a1 + 64) textContent];
    uint64_t v11 = [*(id *)(a1 + 56) valueRange];
    uint64_t v13 = v12;
    uint64_t v14 = [*(id *)(a1 + 56) valueString];
    uint64_t v15 = v8;
    if (!v8)
    {
      context = (void *)MEMORY[0x1CB79B230]();
      uint64_t v16 = *(void **)(a1 + 72);
      long long v17 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", *a2, a2[1]);
      uint64_t v15 = [v16 detailTypeFromPrefix:v17];
    }
    [*(id *)(a1 + 56) labelRange];
    LOBYTE(v24) = *(unsigned char *)(a1 + 88);
    LOBYTE(v23) = v18 != 0;
    uint64_t v19 = +[SGDetection detectionWithType:text:matchRange:matchString:label:hasPhoneLabel:extractionInfo:isUnlikelyPhone:](SGDetection, "detectionWithType:text:matchRange:matchString:label:hasPhoneLabel:extractionInfo:isUnlikelyPhone:", v7, v10, v11, v13, v14, v15, v23, v9, v24);
    uint64_t v20 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    if (!v8) {
  }
    }
  else
  {
    id v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "DataDetector is not a definitive match: Anti-pattern.", buf, 2u);
    }

    [*(id *)(a1 + 32) setRegexDoesNotBelongToSender:1];
  }
  return 0;
}

- (id)detectionFromSignatureDDMatch:(id)a3 message:(id)a4 detectedLabelRange:(_NSRange *)a5 lastClaimedLabelRange:(_NSRange)a6 isUnlikelyPhone:(BOOL)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = 0;
  uint64_t v16 = [v13 matchType];
  switch((int)v16)
  {
    case 0:
      id v71 = a5;
      BOOL v72 = a7;
      context = (void *)MEMORY[0x1CB79B230]();
      long long v77 = xmmword_1CA8CB4A0;
      long long v78 = xmmword_1CA8CB4A0;
      long long v17 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v18 = [v14 textContent];
      uint64_t v19 = [v13 range];
      uint64_t v21 = objc_msgSend(v18, "substringWithRange:", v19, v20);

      id v69 = self;
      id v15 = [(SGDetectedAttributeDissector *)self detailTypeFromPrefix:v21 detectedLabelPointer:&v78];

      if ((void)v78 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v22 = [v13 range];
        *(void *)&long long v78 = v78 + v22;
      }
      uint64_t v23 = [v13 range];
      unint64_t v25 = v23 + v24;
      long long v26 = [v14 textContent];
      unint64_t v27 = [v26 length];

      if (v25 >= v27)
      {
        a5 = v71;
      }
      else
      {
        id v66 = v15;
        NSUInteger v67 = location;
        NSUInteger v68 = length;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        uint64_t v28 = [v14 plainTextDetectedData];
        uint64_t v29 = [v28 countByEnumeratingWithState:&v73 objects:v79 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          id v31 = 0;
          uint64_t v32 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v74 != v32) {
                objc_enumerationMutation(v28);
              }
              id v34 = *(void **)(*((void *)&v73 + 1) + 8 * i);
              if ([v34 range] >= v25)
              {
                if (!v31 || (unint64_t v35 = [v34 range], v35 < objc_msgSend(v31, "range")))
                {
                  id v36 = v34;

                  id v31 = v36;
                }
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v73 objects:v79 count:16];
          }
          while (v30);
        }
        else
        {
          id v31 = 0;
        }

        long long v37 = [v14 textContent];
        long long v38 = [v14 textContent];
        unint64_t v39 = objc_msgSend(v37, "rangeOfString:options:range:", @"\n", 0, v25 - 1, objc_msgSend(v38, "length") - (v25 - 1));

        uint64_t v40 = [v14 textContent];
        unint64_t v41 = [v40 length];

        if (v39 >= v41) {
          unint64_t v42 = v41;
        }
        else {
          unint64_t v42 = v39;
        }
        if (v31)
        {
          NSUInteger length = v68;
          long long v43 = v66;
          if ([v31 valueRange] == 0x7FFFFFFFFFFFFFFFLL) {
            unint64_t v44 = [v31 range];
          }
          else {
            unint64_t v44 = [v31 valueRange];
          }
          NSUInteger location = v67;
          if (v44 < v42) {
            unint64_t v42 = v44;
          }
        }
        else
        {
          NSUInteger location = v67;
          NSUInteger length = v68;
          long long v43 = v66;
        }
        id v45 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v46 = [v14 textContent];
        uint64_t v47 = objc_msgSend(v46, "substringWithRange:", v25, v42 - v25);

        uint64_t v48 = [(SGDetectedAttributeDissector *)v69 detailTypeFromPrefix:v47 detectedLabelPointer:&v77];
        long long v49 = (void *)v48;
        if (v48) {
          long long v50 = (void *)v48;
        }
        else {
          long long v50 = v43;
        }
        id v51 = v50;
        id v52 = v43;
        id v15 = v51;

        if ((void)v77 != 0x7FFFFFFFFFFFFFFFLL) {
          *(void *)&long long v77 = v77 + v25;
        }

        a5 = v71;
        if ((void)v77 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v53 = &v77;
          goto LABEL_39;
        }
      }
      uint64_t v53 = &v78;
LABEL_39:
      *a5 = (_NSRange)*v53;
      goto LABEL_40;
    case 1:
    case 2:
      BOOL v72 = a7;
      id v15 = 0;
      goto LABEL_41;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      goto LABEL_45;
    default:
      BOOL v72 = a7;
LABEL_40:
      uint64_t v16 = 0;
LABEL_41:
      v82.NSUInteger location = location;
      v82.NSUInteger length = length;
      if (NSIntersectionRange(v82, *a5).length) {
        v54 = 0;
      }
      else {
        v54 = v15;
      }
      id v55 = v54;

      BOOL v56 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:1 modelVersion:0 confidence:0];
      v57 = [v14 textContent];
      uint64_t v58 = [v13 valueRange];
      uint64_t v60 = v59;
      v61 = [v13 valueString];
      [v13 labelRange];
      LOBYTE(v65) = v72;
      LOBYTE(v64) = v62 != 0;
      +[SGDetection detectionWithType:text:matchRange:matchString:label:hasPhoneLabel:extractionInfo:isUnlikelyPhone:](SGDetection, "detectionWithType:text:matchRange:matchString:label:hasPhoneLabel:extractionInfo:isUnlikelyPhone:", v16, v57, v58, v60, v61, v55, v64, v56, v65);
      id v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_45:
      return v15;
  }
}

- (SGDetectedAttributeDissector)init
{
  id v3 = objc_opt_new();
  id v4 = objc_opt_new();
  id v5 = (void *)MEMORY[0x1E4F93860];
  uint64_t v6 = +[SGPaths suggestionsDirectory];
  uint64_t v7 = [v5 sharedSingletonWithDirectory:v6];

  if (v7)
  {
    id v8 = [[SGQuickResponsesML alloc] initWithTraining:v7];
  }
  else
  {
    int v9 = sgLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_fault_impl(&dword_1CA650000, v9, OS_LOG_TYPE_FAULT, "Failed to retrieve PMLTraining singleton", v12, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
    id v8 = 0;
  }
  id v10 = [(SGDetectedAttributeDissector *)self initWithML:v3 withMLQR:v8 andHealthStore:v4];

  return v10;
}

- (SGDetectedAttributeDissector)initWithML:(id)a3 withMLQR:(id)a4 andHealthStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v38.receiver = self;
  v38.super_class = (Class)SGDetectedAttributeDissector;
  uint64_t v12 = [(SGDetectedAttributeDissector *)&v38 init];
  if (v12)
  {
    id v13 = +[SGDetectedAttributeDissector patterns];
    id v14 = [v13 rawValueForKey:@"SelfIdentMsgCount"];
    v12->_selfIdentificationMessageCount = [v14 unsignedIntegerValue];

    objc_storeStrong((id *)&v12->_ml, a3);
    objc_storeStrong((id *)&v12->_mlQR, a4);
    uint64_t v15 = +[SGContactPipelineHelper sharedInstance];
    contactsHelper = v12->_contactsHelper;
    v12->_contactsHelper = (SGContactPipelineHelper *)v15;

    long long v17 = +[SGDetectedAttributeDissector patterns];
    uint64_t v18 = [v17 rawValueForKey:@"FilterWithAddressBook"];
    v12->_filterWithAddressBoouint64_t k = [v18 BOOLValue];

    uint64_t v19 = +[SGDetectedAttributeDissector patterns];
    uint64_t v20 = [v19 rawValueForKey:@"UnlikelyPhoneSampling"];
    [v20 floatValue];
    v12->_float unlikelyPhoneSamplingRate = v21;

    objc_storeStrong((id *)&v12->_healthStore, a5);
    id v22 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v23 = [MEMORY[0x1E4F5DFA8] signatureRules];
    uint64_t v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F5DF30]];
    uint64_t v25 = [v22 initWithArray:v24];
    hmmTrustedLanguages = v12->_hmmTrustedLanguages;
    v12->_hmmTrustedLanguages = (NSSet *)v25;

    id v27 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v28 = [MEMORY[0x1E4F5DFA8] signatureRules];
    uint64_t v29 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F5DF28]];
    uint64_t v30 = [v27 initWithArray:v29];
    ddTrustedLanguages = v12->_ddTrustedLanguages;
    v12->_ddTrustedLanguages = (NSSet *)v30;

    id v32 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    id v33 = [MEMORY[0x1E4F5DFA8] nameDetectorRules];
    id v34 = [v33 objectForKeyedSubscript:*MEMORY[0x1E4F5DF20]];
    uint64_t v35 = [v32 initWithArray:v34];
    coreNLPTrustedLanguages = v12->_coreNLPTrustedLanguages;
    v12->_coreNLPTrustedLanguages = (NSSet *)v35;
  }
  return v12;
}

+ (void)clearConversationCache
{
  id v2 = +[SGTextMessageConversationTracker instance];
  [v2 clear];
}

+ (id)currentPatterns
{
  v11[6] = *MEMORY[0x1E4F143B8];
  id v2 = [a1 patterns];
  id v3 = [v2 regex2ForKey:@"MyAddress/F"];
  v11[0] = v3;
  id v4 = [v2 regex2ForKey:@"NotMyAddress/F"];
  v11[1] = v4;
  id v5 = [v2 regex2ForKey:@"MyPhone/F"];
  v11[2] = v5;
  uint64_t v6 = [v2 regex2ForKey:@"NotMyPhone/F"];
  v11[3] = v6;
  uint64_t v7 = [v2 regex2ForKey:@"MyName/F"];
  v11[4] = v7;
  id v8 = [v2 regex2ForKey:@"NameRequest/F"];
  v11[5] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];

  return v9;
}

+ (id)patterns
{
  if (patterns_onceToken_25058 != -1) {
    dispatch_once(&patterns_onceToken_25058, &__block_literal_global_175);
  }
  id v2 = (void *)patterns_patterns_25059;
  return v2;
}

uint64_t __40__SGDetectedAttributeDissector_patterns__block_invoke()
{
  patterns_patterns_25059 = +[SGPatterns patternsForClass:objc_opt_class()];
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)isBirthdayContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"%DATE%" options:2];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    _PASNormalizeUnicodeString();
  }
  else {
  uint64_t v6 = textToMatch(v4, v4 + v5, v3, 3u);
  }

  BOOL v7 = attributionRegexpMatches(@"BirthdayDate/F", v6) || attributionRegexpMatches(@"Birthday/F", v6);
  return v7;
}

+ (BOOL)isNameRequest:(id)a3
{
  id v3 = _PASNormalizeUnicodeString();
  BOOL v4 = attributionRegexpMatches(@"NameRequest/F", v3);

  return v4;
}

+ (BOOL)isMaybeNameContext:(id)a3
{
  id v3 = _PASNormalizeUnicodeStringMinimally();
  BOOL v4 = attributionRegexpMatches(@"MyName/F", v3);

  return v4;
}

+ (BOOL)isPhoneContext:(id)a3
{
  return attributionPatternMatches(a3, @"MyPhone/F", @"NotMyPhone/F", @"%PHONE%", 0);
}

+ (BOOL)isAddressContext:(id)a3
{
  return attributionPatternMatches(a3, @"MyAddress/F", @"NotMyAddress/F", @"%ADDRESS%", 1u);
}

+ (void)_logSelfIDForMessage:(id)a3 detection:(id)a4 modelType:(SGMSelfIdModelType_)a5 modelVersion:(unint64_t)a6
{
  id v15 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [SGSelfIDSupervision alloc];
    uint64_t v10 = [v8 contextRange];
    uint64_t v12 = -[SGSelfIDSupervision initWithMessage:candidateName:](v9, "initWithMessage:candidateName:", v15, v10, v11);
    if ([(SGSelfIDSupervision *)v12 isPositiveExample])
    {
      id v13 = (unsigned int *)MEMORY[0x1E4F5DE80];
    }
    else
    {
      BOOL v14 = [(SGSelfIDSupervision *)v12 isNegativeExample];
      id v13 = (unsigned int *)MEMORY[0x1E4F5DE78];
      if (v14) {
        id v13 = (unsigned int *)MEMORY[0x1E4F5DE70];
      }
    }
    +[SGDetectedAttributeMetrics recordSelfIdModelScore:1 model:a5.var0 supervision:*v13];
  }
  else
  {
    +[SGDetectedAttributeMetrics recordSelfIdModelScore:0 model:a5.var0 supervision:*MEMORY[0x1E4F5DE78]];
  }
}

+ (BOOL)isTwoPersonConversation:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 recipients];
  unint64_t v5 = [v4 count];

  if (v5 <= 2)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    id v8 = [v3 sender];
    id v9 = [v8 handles];
    long long v26 = (void *)[v7 initWithArray:v9];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v10 = [v3 recipients];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      unint64_t v25 = v5;
      uint64_t v13 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v15, "handleIdentifier", v25);
          long long v17 = [v3 sender];
          uint64_t v18 = [v17 handleIdentifier];
          int v19 = [v16 isEqualToString:v18];

          if (v19)
          {
            id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
            float v21 = [v15 handles];
            id v22 = (void *)[v20 initWithArray:v21];
            int v23 = [v22 isEqual:v26];

            if (v23)
            {
              unint64_t v5 = v25 - 1;
              goto LABEL_14;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      unint64_t v5 = v25;
    }
LABEL_14:

    BOOL v6 = v5 == 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)dissectorWithMockedMLTrainingForTests
{
  id v2 = (void *)[objc_alloc((Class)a1) initWithML:0 withMLQR:0 andHealthStore:0];
  return v2;
}

@end