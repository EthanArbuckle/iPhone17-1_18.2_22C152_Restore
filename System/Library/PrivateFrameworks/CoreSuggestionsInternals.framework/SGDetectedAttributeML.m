@interface SGDetectedAttributeML
- (SGDetectedAttributeML)init;
- (SGDetectedAttributeML)initWithTraining:(id)a3;
- (id)birthdayCongratsTextMessage:(id)a3 andLanguage:(id)a4 andHealthStore:(id)a5;
- (id)detectionFromMatch:(id)a3 plainTextContent:(id)a4 extractionInfo:(id)a5 isUnlikelyPhone:(BOOL)a6;
- (id)detectionFromMessage:(id)a3 ddMatch:(id)a4 matchedContext:(id)a5 withSupervision:(id)a6 inConversation:(id)a7 entityLanguage:(id)a8;
- selfIdDetectionWithTextMessage:(id)a3 inConversation:(id)a4 withSupervision:(id)a5;
- (void)addSessionForTrainingWithSource:(id)a3 label:(int64_t)a4 language:(id)a5 objective:(unint64_t)a6 spotlightRef:(id)a7 embeddedFeaturizer:(id)a8;
- (void)handleTextMessageContactSharing:(id)a3 andMatch:(id)a4 andContext:(id)a5 andLanguage:(id)a6 withSupervision:(id)a7;
- (void)handleTextMessageContactSharingWithNegativeSample:(id)a3 andLanguage:(id)a4;
@end

@implementation SGDetectedAttributeML

- (void).cxx_destruct
{
}

- (void)handleTextMessageContactSharingWithNegativeSample:(id)a3 andLanguage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = [v8 conversationIdentifier];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    v15 = sgLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v15, OS_LOG_TYPE_ERROR, "ContactMLSharing: Text message has no conversation identifier", buf, 2u);
    }
    goto LABEL_15;
  }
  if (self->_localTraining)
  {
    uint64_t v11 = [v8 spotlightReference];
    if (!v11)
    {
      v15 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v12 = (void *)v11;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __87__SGDetectedAttributeML_handleTextMessageContactSharingWithNegativeSample_andLanguage___block_invoke;
    v37[3] = &unk_1E65BE748;
    id v13 = v8;
    id v38 = v13;
    id v14 = v7;
    id v39 = v14;
    v40 = self;
    v15 = v12;
    v41 = v15;
    v16 = (void (**)(void, void, void))MEMORY[0x1CB79B4C0](v37);
    *(void *)buf = 0;
    v34 = buf;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    char v32 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __87__SGDetectedAttributeML_handleTextMessageContactSharingWithNegativeSample_andLanguage___block_invoke_3;
    v21[3] = &unk_1E65BE770;
    v24 = buf;
    id v22 = v14;
    id v23 = v13;
    v25 = v31;
    v26 = &v27;
    v17 = (unsigned int (**)(void))MEMORY[0x1CB79B4C0](v21);
    [MEMORY[0x1E4F5DAF0] contactSharingNegativeSamplingRate];
    float v19 = v18;
    if (v18 == 1.0 || (uint32_t v20 = arc4random_uniform(2u)) == 0)
    {
      v16[2](v16, 4, 0);
      if (v19 == 1.0) {
        goto LABEL_12;
      }
    }
    else if (v20 == 1)
    {
LABEL_12:
      if (v17[2](v17)) {
        v16[2](v16, 4, v28[3]);
      }
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(v31, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_15;
  }
LABEL_16:
}

void __87__SGDetectedAttributeML_handleTextMessageContactSharingWithNegativeSample_andLanguage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  v22[0] = @"INPUT_TEXT";
  id v6 = (id *)(a1 + 32);
  id v7 = [*(id *)(a1 + 32) textContent];
  v23[0] = v7;
  v22[1] = @"DD_MATCHES";
  id v8 = [*v6 plainTextDetectedData];
  v23[1] = v8;
  v22[2] = @"NEGATIVE_SAMPLE_CHOPPABLE_START";
  v9 = [NSNumber numberWithUnsignedInteger:a3];
  v23[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__35027;
  v20[4] = __Block_byref_object_dispose__35028;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__SGDetectedAttributeML_handleTextMessageContactSharingWithNegativeSample_andLanguage___block_invoke_2;
  v15[3] = &unk_1E65BE658;
  float v18 = v20;
  id v11 = v10;
  id v16 = v11;
  id v17 = *(id *)(a1 + 40);
  uint64_t v19 = a2;
  v12 = (void (**)(void))MEMORY[0x1CB79B4C0](v15);
  if (+[SGModelRules shouldCollectTrainingDataForObjective:a2 language:*(void *)(a1 + 40)])
  {
    id v13 = v12[2](v12);
    id v14 = [v13 vector];

    if ([v14 numberOfNonZeroValues]) {
      [*(id *)(a1 + 48) addSessionForTrainingWithSource:v11 label:0 language:*(void *)(a1 + 40) objective:a2 spotlightRef:*(void *)(a1 + 56) embeddedFeaturizer:v12];
    }
  }
  _Block_object_dispose(v20, 8);
}

uint64_t __87__SGDetectedAttributeML_handleTextMessageContactSharingWithNegativeSample_andLanguage___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v2 = [[SGNameDetector alloc] initWithLanguage:*(void *)(a1 + 32)];
    v3 = [*(id *)(a1 + 40) textContent];
    v4 = [(SGNameDetector *)v2 detectNames:v3 algorithm:2];

    if ([v4 count] == 1)
    {
      v5 = [v4 firstObject];
      int v6 = [v5 confidence];

      if (v6 >= 0) {
        unsigned int v7 = v6;
      }
      else {
        unsigned int v7 = -v6;
      }
      BOOL v8 = v7 > 9;
    }
    else
    {
      BOOL v8 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
    v9 = [v4 firstObject];
    uint64_t v10 = [v9 range];
    id v11 = [v4 firstObject];
    [v11 range];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v12 + v10;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

id __87__SGDetectedAttributeML_handleTextMessageContactSharingWithNegativeSample_andLanguage___block_invoke_2(void *a1)
{
  v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = +[SGModel trainingFeaturesOf:a1[4] inLanguage:a1[5] withObjective:a1[7]];
    uint64_t v4 = *(void *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  }
  return v2;
}

- (id)birthdayCongratsTextMessage:(id)a3 andLanguage:(id)a4 andHealthStore:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![MEMORY[0x1E4F5DAF0] useMLModelForContacts]) {
    goto LABEL_11;
  }
  id v11 = [v8 conversationIdentifier];
  uint64_t v12 = [v11 length];

  if (!v12)
  {
    float v18 = sgLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v43 = 0;
      _os_log_error_impl(&dword_1CA650000, v18, OS_LOG_TYPE_ERROR, "BirthdayMLExtraction: Text message has no conversation identifier", v43, 2u);
    }

    goto LABEL_11;
  }
  id v13 = [v8 textContent];
  if ((unint64_t)[v13 length] >= 0x119)
  {

    goto LABEL_11;
  }
  id v14 = [v8 textContent];
  unint64_t v15 = [v14 length];

  if (v15 < 5)
  {
LABEL_11:
    id v17 = 0;
    goto LABEL_12;
  }
  id v16 = [v8 textContent];
  if (![v8 isSent])
  {
    id v39 = 0;
    uint32_t v20 = [v10 dateOfBirthComponentsWithError:&v39];
    id v21 = v39;
    if (!self->_localTraining) {
      goto LABEL_31;
    }
    id v22 = [v8 spotlightReference];
    BOOL v23 = v22 == 0;

    if (v23
      || !+[SGModelRules shouldCollectTrainingDataForObjective:7 language:v9])
    {
      goto LABEL_31;
    }
    *(void *)v43 = 0;
    v44 = v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__35027;
    v47 = __Block_byref_object_dispose__35028;
    id v48 = 0;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __80__SGDetectedAttributeML_birthdayCongratsTextMessage_andLanguage_andHealthStore___block_invoke_2;
    v35[3] = &unk_1E65BE6A8;
    id v38 = v43;
    id v33 = v16;
    id v36 = v33;
    id v24 = v9;
    id v37 = v24;
    v34 = (void *)MEMORY[0x1CB79B4C0](v35);
    if (v21)
    {
      v25 = sgLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v50 = v21;
        _os_log_error_impl(&dword_1CA650000, v25, OS_LOG_TYPE_ERROR, "Error fetching user DOB: %@", buf, 0xCu);
      }
      goto LABEL_29;
    }
    if (!v20)
    {
LABEL_30:

      _Block_object_dispose(v43, 8);
LABEL_31:

      id v17 = 0;
      goto LABEL_32;
    }
    id v26 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v25 = [v26 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    uint64_t v27 = [v8 date];
    char v32 = [v25 components:24 fromDate:v27];

    uint64_t v28 = [v32 day];
    if (v28 == [v20 day] && (uint64_t v29 = objc_msgSend(v32, "month"), v29 == objc_msgSend(v20, "month")))
    {
      objc_msgSend(v8, "spotlightReference", 1);
    }
    else
    {
      if ((float)((float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10) > 0.0027397)
      {
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      objc_msgSend(v8, "spotlightReference", 0);
    uint64_t v30 = };
    [(SGDetectedAttributeML *)self addSessionForTrainingWithSource:v33 label:v31 language:v24 objective:7 spotlightRef:v30 embeddedFeaturizer:v34];

    goto LABEL_28;
  }
  *(void *)v43 = 0;
  v44 = v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__35027;
  v47 = __Block_byref_object_dispose__35028;
  id v48 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __80__SGDetectedAttributeML_birthdayCongratsTextMessage_andLanguage_andHealthStore___block_invoke;
  v40[3] = &unk_1E65BE720;
  id v41 = v16;
  v42 = v43;
  +[SGModelRules loadBinaryClassificationModelFromMobileAssetForObjective:7 language:v9 withBlock:v40];
  id v17 = *((id *)v44 + 5);

  _Block_object_dispose(v43, 8);
LABEL_32:

LABEL_12:
  return v17;
}

void __80__SGDetectedAttributeML_birthdayCongratsTextMessage_andLanguage_andHealthStore___block_invoke(uint64_t a1, void *a2)
{
  id v13 = [a2 predictLabelForInput:*(void *)(a1 + 32)];
  uint64_t v3 = [v13 first];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F5DA20];
    int v6 = NSNumber;
    unsigned int v7 = [MEMORY[0x1E4F5DFA8] asset];
    id v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "assetVersion"));
    id v9 = [v13 second];
    uint64_t v10 = [v5 extractionInfoWithExtractionType:2 modelVersion:v8 confidence:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

id __80__SGDetectedAttributeML_birthdayCongratsTextMessage_andLanguage_andHealthStore___block_invoke_2(void *a1)
{
  v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = +[SGModel trainingFeaturesOf:a1[4] inLanguage:a1[5] withObjective:7];
    uint64_t v4 = *(void *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  }
  return v2;
}

- (void)handleTextMessageContactSharing:(id)a3 andMatch:(id)a4 andContext:(id)a5 andLanguage:(id)a6 withSupervision:(id)a7
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([MEMORY[0x1E4F5DAF0] useMLModelForContactSharing])
  {
    id v17 = [v12 conversationIdentifier];
    uint64_t v18 = [v17 length];

    if (!v18)
    {
      uint64_t v19 = sgLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA650000, v19, OS_LOG_TYPE_ERROR, "ContactMLSharing: Text message has no conversation identifier", buf, 2u);
      }
      goto LABEL_16;
    }
    if (self->_localTraining
      && (([v16 isFirstPerson] & 1) != 0 || objc_msgSend(v16, "isThirdPerson")))
    {
      uint64_t v19 = [v12 spotlightReference];
      if (!v19)
      {
LABEL_16:

        goto LABEL_17;
      }
      uint32_t v20 = [v12 textContent];
      if (!v20
        || ![v16 ignoreAfter]
        || (unint64_t v21 = [v16 ignoreAfter], v21 > objc_msgSend(v20, "length"))
        || [v13 range] == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v22 = sgLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v87 = [v20 length];
          v67 = v22;
          v68 = v20;
          uint64_t v69 = [v16 ignoreAfter];
          uint64_t v70 = [v13 range];
          [v13 range];
          *(_DWORD *)buf = 134218752;
          uint64_t v104 = v87;
          __int16 v105 = 2048;
          uint64_t v106 = v69;
          uint32_t v20 = v68;
          id v22 = v67;
          __int16 v107 = 2048;
          uint64_t v108 = v70;
          __int16 v109 = 2048;
          uint64_t v110 = v71;
          _os_log_error_impl(&dword_1CA650000, v67, OS_LOG_TYPE_ERROR, "ContactMLSharing: Invalid contact detail range plainTextContent.length %tu supervision.ignoreAfter %tu match.range [%tu, %tu]", buf, 0x2Au);
        }
        goto LABEL_13;
      }
      id v85 = v14;
      BOOL v23 = (void *)MEMORY[0x1CB79B230]();
      v84 = v20;
      uint64_t v24 = objc_msgSend(v20, "substringWithRange:", 0, objc_msgSend(v16, "ignoreAfter"));
      v101[0] = @"INPUT_TEXT";
      v101[1] = @"TARGET_MATCH";
      v102[0] = v24;
      v102[1] = v13;
      id v86 = v15;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:2];
      v99[0] = @"INPUT_TEXT";
      v99[1] = @"TARGET_MATCH";
      id v22 = v24;
      v100[0] = v24;
      v100[1] = v13;
      v99[2] = @"NEGATIVE_SAMPLE_CHOPPABLE_START";
      v100[2] = &unk_1F25363D8;
      id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:3];
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __105__SGDetectedAttributeML_handleTextMessageContactSharing_andMatch_andContext_andLanguage_withSupervision___block_invoke;
      v92[3] = &unk_1E65BE6F8;
      id v83 = v25;
      id v93 = v83;
      id v27 = v15;
      id v94 = v27;
      id v28 = v26;
      id v95 = v28;
      v96 = self;
      v97 = v19;
      uint64_t v29 = (void (**)(void, void, void))MEMORY[0x1CB79B4C0](v92);
      id v81 = v27;
      if (!+[SGModelRules shouldCollectTrainingDataForObjective:4 language:v27])
      {
LABEL_45:

        uint32_t v20 = v84;
        id v14 = v85;
LABEL_13:

        goto LABEL_16;
      }
      uint64_t v30 = (void *)MEMORY[0x1CB79B230]();
      int v79 = [v16 isFirstPerson];
      if (v79)
      {
        uint64_t PersonContactSharingLabelFromMatchType = firstPersonContactSharingLabelFromMatchType([v13 matchType]);
        v29[2](v29, 4, PersonContactSharingLabelFromMatchType);
      }
      v80 = v13;
      char v32 = objc_opt_new();
      id v33 = [v16 matchingContacts];
      if (!v33)
      {
LABEL_44:

        id v13 = v80;
        goto LABEL_45;
      }
      v77 = v30;
      v78 = v22;
      v73 = v29;
      id v74 = v28;
      v75 = v19;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v34 = v33;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v88 objects:v98 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v89;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v89 != v37) {
              objc_enumerationMutation(v34);
            }
            id v39 = *(void **)(*((void *)&v88 + 1) + 8 * i);
            v40 = [v39 givenName];
            uint64_t v41 = [v40 length];

            if (v41)
            {
              v42 = [v39 givenName];
              v43 = [v42 lowercaseString];
              [v32 addObject:v43];
            }
            v44 = [v39 familyName];
            uint64_t v45 = [v44 length];

            if (v45)
            {
              v46 = [v39 familyName];
              v47 = [v46 lowercaseString];
              [v32 addObject:v47];
            }
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v88 objects:v98 count:16];
        }
        while (v36);
      }

      id v48 = [[SGNameDetector alloc] initWithLanguage:v81];
      id v22 = v78;
      v49 = [(SGNameDetector *)v48 detectNames:v78 withNameSet:v32];
      v72 = v48;
      id v50 = [(SGNameDetector *)v48 detectNames:v78 algorithm:2];
      v76 = v50;
      v82 = v49;
      if ([v49 count] != 1) {
        goto LABEL_40;
      }
      if ([v50 count])
      {
        uint64_t v51 = [v49 count];
        if (v51 != [v50 count]) {
          goto LABEL_40;
        }
        v52 = [v49 firstObject];
        NSUInteger v53 = [v52 range];
        NSUInteger v55 = v54;
        v56 = [v50 firstObject];
        v113.location = [v56 range];
        v113.NSUInteger length = v57;
        v112.location = v53;
        v112.NSUInteger length = v55;
        NSUInteger length = NSIntersectionRange(v112, v113).length;

        if (!length) {
          goto LABEL_40;
        }
      }
      if (![v16 isThirdPerson]) {
        goto LABEL_40;
      }
      v59 = (void *)MEMORY[0x1CB79B230]();
      v60 = [v49 firstObject];
      uint64_t v61 = [v60 range];
      v63 = -[NSObject substringWithRange:](v78, "substringWithRange:", v61, v62);

      BOOL v64 = +[SGContactPipelineHelper personExistsInContacts:v34 name:v63 handle:0];

      if (v64)
      {
        uint64_t matched = thirdPersonContactSharingLabelFromMatchType([v80 matchType]);
        id v15 = v86;
        id v28 = v74;
        uint64_t v19 = v75;
        v66 = v72;
        uint64_t v29 = v73;
      }
      else
      {
LABEL_40:
        id v15 = v86;
        id v28 = v74;
        uint64_t v19 = v75;
        v66 = v72;
        uint64_t v29 = v73;
        if (v79)
        {
LABEL_43:

          uint64_t v30 = v77;
          goto LABEL_44;
        }
        uint64_t matched = 0;
      }
      v29[2](v29, 4, matched);
      goto LABEL_43;
    }
  }
LABEL_17:
}

void __105__SGDetectedAttributeML_handleTextMessageContactSharing_andMatch_andContext_andLanguage_withSupervision___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__35027;
  void v23[4] = __Block_byref_object_dispose__35028;
  id v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__35027;
  void v21[4] = __Block_byref_object_dispose__35028;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__SGDetectedAttributeML_handleTextMessageContactSharing_andMatch_andContext_andLanguage_withSupervision___block_invoke_2;
  v16[3] = &unk_1E65BE658;
  uint64_t v19 = v23;
  id v17 = *(id *)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  uint64_t v20 = a2;
  int v6 = (void *)MEMORY[0x1CB79B4C0](v16);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __105__SGDetectedAttributeML_handleTextMessageContactSharing_andMatch_andContext_andLanguage_withSupervision___block_invoke_3;
  uint64_t v11 = &unk_1E65BE658;
  id v14 = v21;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  uint64_t v15 = a2;
  unsigned int v7 = (void *)MEMORY[0x1CB79B4C0](&v8);
  objc_msgSend(*(id *)(a1 + 56), "addSessionForTrainingWithSource:label:language:objective:spotlightRef:embeddedFeaturizer:", *(void *)(a1 + 32), a3, *(void *)(a1 + 40), a2, *(void *)(a1 + 64), v6, v8, v9, v10, v11);
  if (a3) {
    [*(id *)(a1 + 56) addSessionForTrainingWithSource:*(void *)(a1 + 48) label:0 language:*(void *)(a1 + 40) objective:a2 spotlightRef:*(void *)(a1 + 64) embeddedFeaturizer:v7];
  }

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
}

id __105__SGDetectedAttributeML_handleTextMessageContactSharing_andMatch_andContext_andLanguage_withSupervision___block_invoke_2(void *a1)
{
  v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = +[SGModel trainingFeaturesOf:a1[4] inLanguage:a1[5] withObjective:a1[7]];
    uint64_t v4 = *(void *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  }
  return v2;
}

id __105__SGDetectedAttributeML_handleTextMessageContactSharing_andMatch_andContext_andLanguage_withSupervision___block_invoke_3(void *a1)
{
  v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = +[SGModel trainingFeaturesOf:a1[4] inLanguage:a1[5] withObjective:a1[7]];
    uint64_t v4 = *(void *)(a1[6] + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  }
  return v2;
}

- selfIdDetectionWithTextMessage:(id)a3 inConversation:(id)a4 withSupervision:(id)a5
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v88 = a4;
  id v9 = a5;
  uint64_t v87 = v8;
  if (![MEMORY[0x1E4F5DAF0] useMLModelForSelfId])
  {
    id v14 = 0;
    goto LABEL_36;
  }
  id v85 = v9;
  uint64_t v10 = [v8 uniqueIdentifier];
  uint64_t v11 = [v88 messages];
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __87__SGDetectedAttributeML_selfIdDetectionWithTextMessage_inConversation_withSupervision___block_invoke;
  v108[3] = &unk_1E65BE630;
  id v86 = v10;
  id v109 = v86;
  uint64_t v12 = [v11 indexOfObjectWithOptions:2 passingTest:v108];

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = sgLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v86;
      _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "Couldn't find uniqueIdentifier %@ in conversation -- aborting selfIdDetectionWithEntity", buf, 0xCu);
    }
    id v14 = 0;
    goto LABEL_35;
  }
  uint64_t v15 = [v88 messages];
  v84 = [v15 objectAtIndexedSubscript:v12];

  id v16 = [v88 messages];
  id v17 = [v16 lastObject];
  BOOL v18 = v84 == v17;

  if (v18)
  {
    uint64_t v20 = [v84 text];
    unint64_t v21 = [v87 textContent];
    int v83 = [v20 isEqualToString:v21];

    if (!v83
      || [v85 candidateNameRange] == 0x7FFFFFFFFFFFFFFFLL
      || (uint64_t v22 = [v85 candidateNameRange],
          [v85 candidateNameRange],
          uint64_t v24 = v23,
          [v84 text],
          v25 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v22) = v24 + v22 > (unint64_t)[v25 length],
          v25,
          v22))
    {
      id v26 = [v88 messages];
      BOOL v27 = [v26 count] == 0;

      if (!v27)
      {
        unint64_t v28 = 0;
        do
        {
          uint64_t v29 = sgLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            uint64_t v30 = [v88 messages];
            uint64_t v31 = [v30 objectAtIndexedSubscript:v28];
            char v32 = [v31 message];
            id v33 = [v32 uniqueIdentifier];
            id v34 = [v88 messages];
            uint64_t v35 = [v34 objectAtIndexedSubscript:v28];
            uint64_t v36 = [v35 text];
            uint64_t v37 = [v36 length];
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)&uint8_t buf[4] = v28;
            *(_WORD *)&uint8_t buf[8] = 2112;
            *(void *)&buf[10] = v33;
            *(_WORD *)&buf[18] = 2048;
            *(void *)&buf[20] = v37;
            _os_log_impl(&dword_1CA650000, v29, OS_LOG_TYPE_INFO, "Conversation message %d with id %@ and content length %lu", buf, 0x1Cu);
          }
          id v38 = [v88 messages];
          unint64_t v39 = [v38 count];

          ++v28;
        }
        while (v39 > v28);
      }
      v40 = sgLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        uint64_t v41 = [v87 uniqueIdentifier];
        v42 = [v87 textContent];
        uint64_t v43 = [v42 length];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v43;
        _os_log_impl(&dword_1CA650000, v40, OS_LOG_TYPE_INFO, "Entity message with id %@, content length %lu", buf, 0x16u);
      }
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      v44 = [v87 plainTextDetectedData];
      uint64_t v45 = [v44 countByEnumeratingWithState:&v104 objects:v116 count:16];
      if (v45)
      {
        uint64_t v46 = *(void *)v105;
        do
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v105 != v46) {
              objc_enumerationMutation(v44);
            }
            uint64_t v48 = *(void *)(*((void *)&v104 + 1) + 8 * i);
            v49 = sgLogHandle();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v48;
              _os_log_impl(&dword_1CA650000, v49, OS_LOG_TYPE_INFO, "Entity message with detected data item %@", buf, 0xCu);
            }
          }
          uint64_t v45 = [v44 countByEnumeratingWithState:&v104 objects:v116 count:16];
        }
        while (v45);
      }

      id v50 = sgLogHandle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v83;
        _os_log_fault_impl(&dword_1CA650000, v50, OS_LOG_TYPE_FAULT, "Target message unrecoverable state with matching content = %d", buf, 8u);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        abort();
      }
      goto LABEL_33;
    }
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    v52 = [v88 messages];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v100 objects:v115 count:16];
    if (v53)
    {
      uint64_t v54 = *(void *)v101;
      while (2)
      {
        for (uint64_t j = 0; j != v53; ++j)
        {
          if (*(void *)v101 != v54) {
            objc_enumerationMutation(v52);
          }
          v56 = [*(id *)(*((void *)&v100 + 1) + 8 * j) text];
          BOOL v57 = (unint64_t)[v56 length] > 0x8C;

          if (v57)
          {

            goto LABEL_33;
          }
        }
        uint64_t v53 = [v52 countByEnumeratingWithState:&v100 objects:v115 count:16];
        if (v53) {
          continue;
        }
        break;
      }
    }

    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__35027;
    NSRange v113 = __Block_byref_object_dispose__35028;
    id v114 = 0;
    v110[0] = @"INPUT_CONVERSATION";
    v58 = [v88 messages];
    v111[0] = v58;
    v110[1] = @"SG_MODEL_INPUT_TARGET_RANGE";
    v59 = (void *)MEMORY[0x1E4F29238];
    uint64_t v60 = [v85 candidateNameRange];
    uint64_t v62 = objc_msgSend(v59, "valueWithRange:", v60, v61);
    v111[1] = v62;
    v110[2] = @"SG_MODEL_INPUT_TARGET_MESSAGE_INDEX";
    v63 = [NSNumber numberWithUnsignedInteger:v12];
    v111[2] = v63;
    v110[3] = @"DD_MATCHES";
    BOOL v64 = [v87 plainTextDetectedData];
    v111[3] = v64;
    v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:v110 count:4];

    v98[0] = 0;
    v98[1] = v98;
    v98[2] = 0x3032000000;
    v98[3] = __Block_byref_object_copy__35027;
    v98[4] = __Block_byref_object_dispose__35028;
    id v99 = 0;
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __87__SGDetectedAttributeML_selfIdDetectionWithTextMessage_inConversation_withSupervision___block_invoke_146;
    v94[3] = &unk_1E65BE6A8;
    v97 = v98;
    id v66 = v65;
    id v95 = v66;
    id v67 = v88;
    id v96 = v67;
    v68 = (void *)MEMORY[0x1CB79B4C0](v94);
    uint64_t v69 = [v87 spotlightReference];
    if (self->_localTraining)
    {
      if ([v85 isPositiveExample])
      {
        if (!v69) {
          goto LABEL_58;
        }
      }
      else
      {
        char v70 = [v85 isNegativeExample];
        if (v69) {
          char v71 = v70;
        }
        else {
          char v71 = 0;
        }
        if ((v71 & 1) == 0) {
          goto LABEL_58;
        }
      }
      v72 = [v67 likelyLanguage];
      BOOL v73 = +[SGModelRules shouldCollectTrainingDataForObjective:3 language:v72];

      if (v73)
      {
        unsigned int v74 = [v85 isPositiveExample];
        v75 = [v67 likelyLanguage];
        [(SGDetectedAttributeML *)self addSessionForTrainingWithSource:v66 label:v74 language:v75 objective:3 spotlightRef:v69 embeddedFeaturizer:v68];
      }
    }
LABEL_58:
    v76 = [v67 messages];
    if ([v76 count] == 1)
    {
      v77 = [v67 messages];
      v78 = [v77 firstObject];
      int v79 = [v78 text];
      uint64_t v80 = [v79 length];
      [v85 candidateNameRange];
      LOBYTE(v80) = (unint64_t)(v80 - v81) < 4;

      if (v80)
      {
        id v14 = 0;
LABEL_63:

        _Block_object_dispose(v98, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_34;
      }
    }
    else
    {
    }
    v82 = [v67 likelyLanguage];
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __87__SGDetectedAttributeML_selfIdDetectionWithTextMessage_inConversation_withSupervision___block_invoke_2;
    v89[3] = &unk_1E65BE6D0;
    id v90 = v66;
    id v93 = buf;
    long long v91 = v84;
    id v92 = v85;
    +[SGModelRules loadBinaryClassificationModelFromMobileAssetForObjective:3 language:v82 withBlock:v89];

    id v14 = *(id *)(*(void *)&buf[8] + 40);
    goto LABEL_63;
  }
  uint64_t v19 = sgLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v86;
    _os_log_impl(&dword_1CA650000, v19, OS_LOG_TYPE_INFO, "Target message (uniqueIdentifier=%@) not the last in conversation -- aborting selfIdDetectionWithEntity", buf, 0xCu);
  }

LABEL_33:
  id v14 = 0;
LABEL_34:
  id v13 = v84;
LABEL_35:

  id v9 = v85;
LABEL_36:

  return v14;
}

uint64_t __87__SGDetectedAttributeML_selfIdDetectionWithTextMessage_inConversation_withSupervision___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 message];
  uint64_t v4 = [v3 uniqueIdentifier];
  uint64_t v5 = [v2 isEqual:v4];

  return v5;
}

id __87__SGDetectedAttributeML_selfIdDetectionWithTextMessage_inConversation_withSupervision___block_invoke_146(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) likelyLanguage];
    uint64_t v5 = +[SGModel trainingFeaturesOf:v3 inLanguage:v4 withObjective:3];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    unsigned int v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  return v2;
}

void __87__SGDetectedAttributeML_selfIdDetectionWithTextMessage_inConversation_withSupervision___block_invoke_2(uint64_t a1, void *a2)
{
  id v24 = a2;
  uint64_t v3 = [v24 predictLabelForInput:*(void *)(a1 + 32)];
  uint64_t v4 = [v3 first];
  if ([v4 BOOLValue])
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);

    if (!v5)
    {
      uint64_t v6 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v7 = objc_opt_new();
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v11 = [*(id *)(a1 + 40) text];
      uint64_t v12 = [*(id *)(a1 + 48) candidateNameRange];
      id v14 = objc_msgSend(v11, "substringWithRange:", v12, v13);

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setName:v14];

      uint64_t v15 = [*(id *)(a1 + 40) text];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setContext:v15];

      uint64_t v16 = [*(id *)(a1 + 48) candidateNameRange];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "setContextRange:", v16, v17);
      BOOL v18 = (void *)MEMORY[0x1E4F5DA20];
      uint64_t v19 = NSNumber;
      uint64_t v20 = [MEMORY[0x1E4F5DFA8] asset];
      unint64_t v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "assetVersion"));
      uint64_t v22 = [v3 second];
      uint64_t v23 = [v18 extractionInfoWithExtractionType:2 modelVersion:v21 confidence:v22];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setExtractionInfo:v23];
    }
  }
  else
  {
  }
}

- (id)detectionFromMatch:(id)a3 plainTextContent:(id)a4 extractionInfo:(id)a5 isUnlikelyPhone:(BOOL)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  int v12 = [v11 matchType];
  if (v12 == 2) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v12 == 1;
  }
  uint64_t v14 = [v11 valueRange];
  uint64_t v16 = v15;
  uint64_t v17 = [v11 valueString];
  [v11 labelRange];
  uint64_t v19 = v18;

  LOBYTE(v23) = a6;
  LOBYTE(v22) = v19 != 0;
  uint64_t v20 = +[SGDetection detectionWithType:text:matchRange:matchString:label:hasPhoneLabel:extractionInfo:isUnlikelyPhone:](SGDetection, "detectionWithType:text:matchRange:matchString:label:hasPhoneLabel:extractionInfo:isUnlikelyPhone:", v13, v10, v14, v16, v17, 0, v22, v9, v23);

  return v20;
}

- (id)detectionFromMessage:(id)a3 ddMatch:(id)a4 matchedContext:(id)a5 withSupervision:(id)a6 inConversation:(id)a7 entityLanguage:(id)a8
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v70 = a5;
  id v69 = a6;
  id v16 = a7;
  id v17 = a8;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (![v15 matchType] && (isKindOfClass & 1) != 0)
  {
    id v19 = 0;
    goto LABEL_65;
  }
  id v66 = self;
  uint64_t v91 = 0;
  id v92 = &v91;
  uint64_t v93 = 0x3032000000;
  id v94 = __Block_byref_object_copy__35027;
  id v95 = __Block_byref_object_dispose__35028;
  id v96 = 0;
  unsigned int v20 = [v15 matchType];
  unsigned int v21 = v20;
  if (isKindOfClass)
  {
    if (v20 == 1)
    {
      uint64_t v22 = 6;
      goto LABEL_12;
    }
    if (v20 == 2)
    {
      uint64_t v22 = 5;
LABEL_12:
      uint64_t v67 = v22;
      goto LABEL_15;
    }
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    id v26 = objc_msgSend(NSString, "stringWithUTF8String:", "SGModelObjective convertSGDDMatchToModelObjective(SGDataDetectorMatchType, BOOL)");
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"SGDetectedAttributeML.m", 62, @"Unknown model objective for SGDataDetectorMatchType = %lu and SGTextMessage", v21);
  }
  else
  {
    if (v20 < 3)
    {
      uint64_t v22 = qword_1CA8D1CD8[v20];
      goto LABEL_12;
    }
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    id v24 = objc_msgSend(NSString, "stringWithUTF8String:", "SGModelObjective convertSGDDMatchToModelObjective(SGDataDetectorMatchType, BOOL)");
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"SGDetectedAttributeML.m", 71, @"Unknown model objective for SGDataDetectorMatchType = %lu for non SGTextMessage", v21);
  }
  uint64_t v67 = 0;
LABEL_15:
  uint64_t v27 = [v16 likelyLanguage];
  unint64_t v28 = (void *)v27;
  if (v27) {
    uint64_t v29 = (void *)v27;
  }
  else {
    uint64_t v29 = v17;
  }
  id v68 = v29;

  if (v68)
  {
    v89[0] = 0;
    v89[1] = v89;
    v89[2] = 0x3032000000;
    v89[3] = __Block_byref_object_copy__35027;
    void v89[4] = __Block_byref_object_dispose__35028;
    id v90 = 0;
    if ((unint64_t)(v67 - 5) > 1)
    {
      v97[0] = @"INPUT_TEXT";
      id v30 = [v14 textContent];
      v98[0] = v30;
      v97[1] = @"DD_MATCHES";
      v42 = [v14 plainTextDetectedData];
      v97[2] = @"TARGET_MATCH";
      v98[1] = v42;
      v98[2] = v15;
      uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:3];
    }
    else
    {
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v30 = [v16 messages];
      uint64_t v31 = [v30 countByEnumeratingWithState:&v85 objects:v103 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v86;
        while (2)
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v86 != v32) {
              objc_enumerationMutation(v30);
            }
            id v34 = [*(id *)(*((void *)&v85 + 1) + 8 * i) text];
            BOOL v35 = (unint64_t)[v34 length] > 0x8C;

            if (v35)
            {
              id v19 = 0;
              goto LABEL_63;
            }
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v85 objects:v103 count:16];
          if (v31) {
            continue;
          }
          break;
        }
      }

      uint64_t v36 = [v14 uniqueIdentifier];
      uint64_t v37 = [v16 messages];
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __115__SGDetectedAttributeML_detectionFromMessage_ddMatch_matchedContext_withSupervision_inConversation_entityLanguage___block_invoke;
      v83[3] = &unk_1E65BE630;
      id v30 = v36;
      id v84 = v30;
      uint64_t v38 = [v37 indexOfObjectWithOptions:2 passingTest:v83];

      unint64_t v39 = &v84;
      if (v38 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v40 = sgLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v102 = v30;
          uint64_t v41 = "Couldn't find uniqueIdentifier %@ in conversation -- aborting detectionFromEntity";
LABEL_50:
          _os_log_impl(&dword_1CA650000, v40, OS_LOG_TYPE_DEFAULT, v41, buf, 0xCu);
          goto LABEL_51;
        }
        goto LABEL_51;
      }
      uint64_t v51 = [v16 messages];
      BOOL v52 = v38 == [v51 count] - 1;

      if (!v52)
      {
        v40 = sgLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v102 = v30;
          uint64_t v41 = "Target message (uniqueIdentifier=%@) not the last in conversation -- aborting detectionFromEntity";
          goto LABEL_50;
        }
LABEL_51:
        id v19 = 0;
        goto LABEL_62;
      }
      v99[0] = @"INPUT_CONVERSATION";
      uint64_t v53 = [v16 messages];
      v100[0] = v53;
      v99[1] = @"SG_MODEL_INPUT_TARGET_MESSAGE_INDEX";
      uint64_t v54 = [NSNumber numberWithUnsignedInteger:v38];
      v100[1] = v54;
      v99[2] = @"DD_MATCHES";
      NSUInteger v55 = [v14 plainTextDetectedData];
      void v99[3] = @"TARGET_MATCH";
      v100[2] = v55;
      void v100[3] = v15;
      uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:4];

      v42 = v84;
    }

    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __115__SGDetectedAttributeML_detectionFromMessage_ddMatch_matchedContext_withSupervision_inConversation_entityLanguage___block_invoke_130;
    v78[3] = &unk_1E65BE658;
    uint64_t v81 = v89;
    id v30 = v43;
    id v79 = v30;
    BOOL v64 = v68;
    uint64_t v80 = v64;
    uint64_t v82 = v67;
    v65 = (void *)MEMORY[0x1CB79B4C0](v78);
    if (![MEMORY[0x1E4F5DAF0] useMLModelForContacts])
    {
LABEL_57:
      if ((unint64_t)[v70 length] < 0x46) {
        goto LABEL_59;
      }
      v56 = (void *)MEMORY[0x1CB79B230]();
      BOOL v57 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      v58 = [v70 componentsSeparatedByCharactersInSet:v57];

      BOOL v59 = (unint64_t)[v58 count] < 0xF;

      if (v59) {
LABEL_59:
      }
        id v19 = 0;
      else {
        id v19 = (id)v92[5];
      }

      unint64_t v39 = &v79;
      v40 = v80;
LABEL_62:

LABEL_63:
      _Block_object_dispose(v89, 8);

      goto LABEL_64;
    }
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __115__SGDetectedAttributeML_detectionFromMessage_ddMatch_matchedContext_withSupervision_inConversation_entityLanguage___block_invoke_2;
    v71[3] = &unk_1E65BE680;
    v77 = &v91;
    id v63 = v30;
    id v72 = v63;
    BOOL v73 = v66;
    id v74 = v15;
    id v44 = v14;
    id v75 = v44;
    id v45 = v69;
    id v76 = v45;
    +[SGModelRules loadBinaryClassificationModelFromMobileAssetForObjective:v67 language:v64 withBlock:v71];
    if ((([v45 isThirdPerson] & 1) != 0
       || ([v45 isFirstPerson] & 1) != 0
       || [v45 isUnlikelyPhone])
      && v44
      && v66->_localTraining)
    {
      uint64_t v46 = [v44 author];
      v47 = [v46 displayName];
      if ([v47 length])
      {
        uint64_t v62 = [v44 author];
        uint64_t v48 = [v62 displayName];
        BOOL v61 = [v48 rangeOfString:@"@"] == 0x7FFFFFFFFFFFFFFFLL;

        if (!v61
          || !+[SGModelRules shouldCollectTrainingDataForObjective:v67 language:v64])
        {
          goto LABEL_56;
        }
        v49 = [v44 spotlightReference];
        if (v49)
        {
          if ([v45 isFirstPerson]) {
            uint64_t v50 = [v45 isUnlikelyPhone] ^ 1;
          }
          else {
            uint64_t v50 = 0;
          }
          [(SGDetectedAttributeML *)v66 addSessionForTrainingWithSource:v63 label:v50 language:v64 objective:v67 spotlightRef:v49 embeddedFeaturizer:v65];
        }
      }
      else
      {

        v49 = v46;
      }
    }
LABEL_56:

    goto LABEL_57;
  }
  id v19 = 0;
LABEL_64:

  _Block_object_dispose(&v91, 8);
LABEL_65:

  return v19;
}

uint64_t __115__SGDetectedAttributeML_detectionFromMessage_ddMatch_matchedContext_withSupervision_inConversation_entityLanguage___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 message];
  uint64_t v4 = [v3 uniqueIdentifier];
  uint64_t v5 = [v2 isEqual:v4];

  return v5;
}

id __115__SGDetectedAttributeML_detectionFromMessage_ddMatch_matchedContext_withSupervision_inConversation_entityLanguage___block_invoke_130(void *a1)
{
  v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = +[SGModel trainingFeaturesOf:a1[4] inLanguage:a1[5] withObjective:a1[7]];
    uint64_t v4 = *(void *)(a1[6] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = *(void **)(*(void *)(a1[6] + 8) + 40);
  }
  return v2;
}

void __115__SGDetectedAttributeML_detectionFromMessage_ddMatch_matchedContext_withSupervision_inConversation_entityLanguage___block_invoke_2(uint64_t a1, void *a2)
{
  id v17 = [a2 predictLabelForInput:*(void *)(a1 + 32)];
  uint64_t v3 = [v17 first];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F5DA20];
    uint64_t v6 = NSNumber;
    uint64_t v7 = [MEMORY[0x1E4F5DFA8] asset];
    uint64_t v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "assetVersion"));
    id v9 = [v17 second];
    id v10 = [v5 extractionInfoWithExtractionType:2 modelVersion:v8 confidence:v9];

    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = [*(id *)(a1 + 56) textContent];
    uint64_t v14 = objc_msgSend(v11, "detectionFromMatch:plainTextContent:extractionInfo:isUnlikelyPhone:", v12, v13, v10, objc_msgSend(*(id *)(a1 + 64), "isUnlikelyPhone"));
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

- (void)addSessionForTrainingWithSource:(id)a3 label:(int64_t)a4 language:(id)a5 objective:(unint64_t)a6 spotlightRef:(id)a7 embeddedFeaturizer:(id)a8
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  uint64_t v18 = (void (**)(void))a8;
  if (!v15)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SGDetectedAttributeML.m", 249, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];
  }
  id v19 = +[SGModel transformerInstanceForLanguage:v16 withObjective:a6];
  unsigned int v20 = v19;
  if (v19)
  {
    unsigned int v21 = [v19 sessionDescriptor];
    uint64_t v22 = v18[2](v18);
    uint64_t v23 = [v22 vector];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      __assert_rtn("-[SGDetectedAttributeML addSessionForTrainingWithSource:label:language:objective:spotlightRef:embeddedFeaturizer:]", "SGDetectedAttributeML.m", 259, "[vector isKindOfClass:[PMLSparseVector class]]");
    }
    if (v23)
    {
      if (v21)
      {
        [(PMLTrainingProtocol *)self->_localTraining addSessionWithCovariates:v23 label:a4 sessionDescriptor:v21 spotlightReference:v17 isInternal:0];
LABEL_14:

        goto LABEL_15;
      }
      id v24 = sgLogHandle();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        goto LABEL_14;
      }
      *(_WORD *)buf = 0;
      v25 = "SGDetectedAttributeML - failed to get training descriptor.";
    }
    else
    {
      id v24 = sgLogHandle();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      v25 = "SGDetectedAttributeML: failed to generate vector.";
    }
    _os_log_error_impl(&dword_1CA650000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_13;
  }
  unsigned int v21 = sgLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v16;
    __int16 v29 = 2048;
    unint64_t v30 = a6;
    _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "SGDetectedAttributeML - Failed to load transformer instance for language: %@, %lu", buf, 0x16u);
  }
LABEL_15:
}

- (SGDetectedAttributeML)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F93860];
  int v4 = +[SGPaths suggestionsDirectory];
  uint64_t v5 = [v3 sharedSingletonWithDirectory:v4];

  uint64_t v6 = [(SGDetectedAttributeML *)self initWithTraining:v5];
  return v6;
}

- (SGDetectedAttributeML)initWithTraining:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGDetectedAttributeML;
  uint64_t v6 = [(SGDetectedAttributeML *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_localTraining, a3);
  }

  return v7;
}

@end