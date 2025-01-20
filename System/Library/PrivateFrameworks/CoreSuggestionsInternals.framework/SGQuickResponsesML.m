@interface SGQuickResponsesML
+ (BOOL)_isImageAttachment:(id)a3;
+ (BOOL)_isSharingSenderLocation:(id)a3 senderName:(id)a4;
- (SGQuickResponsesML)initWithTraining:(id)a3;
- (id)_dynamicLabelContentForReply:(id)a3 prompt:(id)a4 language:(id)a5;
- (void)trainQuickResponsesForMessage:(id)a3 withConversationHistory:(id)a4;
@end

@implementation SGQuickResponsesML

- (void).cxx_destruct
{
}

- (void)trainQuickResponsesForMessage:(id)a3 withConversationHistory:(id)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 likelyLanguage];

  if (!v9)
  {
    v12 = sgLogHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v18 = "Quick responses: No likely language prediction for conversation";
LABEL_13:
    _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, v18, buf, 2u);
    goto LABEL_33;
  }
  v10 = [v7 conversationIdentifier];
  uint64_t v11 = [v10 length];

  if (!v11)
  {
    v12 = sgLogHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v18 = "Quick responses: Text message has no conversation identifier";
    goto LABEL_13;
  }
  if (+[SGDetectedAttributeDissector isTwoPersonConversation:v7])
  {
    v12 = [v8 messages];
    v13 = [v12 objectAtIndexedSubscript:[v12 count] - 1];
    v14 = [v13 message];
    v15 = [v14 textContent];

    if ((unint64_t)[v15 length] >= 0x65)
    {
      v16 = sgLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v17 = "Quick responses: response message is much too long for labeling or DP reporting";
LABEL_17:
        _os_log_debug_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEBUG, v17, buf, 2u);
        goto LABEL_32;
      }
      goto LABEL_32;
    }
    if ((unint64_t)[v12 count] <= 1)
    {
      v16 = sgLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v17 = "Quick responses: processing requires at least two text messages";
        goto LABEL_17;
      }
LABEL_32:

      goto LABEL_33;
    }
    v19 = (void *)MEMORY[0x1E4F5DFD0];
    v20 = [v8 likelyLanguage];
    LOBYTE(v19) = [v19 areModelsAvailableInLanguage:v20];

    if ((v19 & 1) == 0)
    {
      v16 = sgLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v32 = [v8 likelyLanguage];
        *(_DWORD *)buf = 138412290;
        *(void *)v90 = v32;
        _os_log_debug_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEBUG, "Quick responses: No model available for language: %@", buf, 0xCu);
      }
      goto LABEL_32;
    }
    v87 = v15;
    v16 = [v12 objectAtIndexedSubscript:[v12 count] - 2];
    v21 = [v16 message];
    v22 = [v21 sender];
    v23 = [v22 handles];
    v88 = v13;
    if ([v23 count] == 1)
    {
      v79 = [v13 message];
      [v79 sender];
      v24 = v86 = v16;
      v25 = [v24 handles];
      uint64_t v83 = [v25 count];

      v16 = v86;
      if (v83 == 1)
      {
        v84 = [v86 message];
        v80 = [v84 sender];
        v77 = [v80 handles];
        v26 = [v77 firstObject];
        v27 = [v88 message];
        v28 = [v27 sender];
        v29 = [v28 handles];
        v30 = [v29 firstObject];
        int v74 = [v26 isEqualToString:v30];

        if (v74)
        {
          v31 = sgLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1CA650000, v31, OS_LOG_TYPE_DEBUG, "Quick responses: processing requires the reply to be to a different person's prompt", buf, 2u);
          }
          v13 = v88;
          v16 = v86;
          goto LABEL_31;
        }
        v33 = (void *)MEMORY[0x1E4F5DFC8];
        v34 = [v8 likelyLanguage];
        v31 = [v33 transformerInstanceForLanguage:v34 mode:0];

        v35 = [v31 config];
        v36 = [v35 classificationParams];

        v37 = +[SGTextMessageConversationTracker getMergedPrompt:v8 withParams:v36];
        v85 = v37;
        if (![v37 length] || !objc_msgSend(v87, "length"))
        {
          v40 = sgLogHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            v41 = "Quick responses: processing requires the prompt and the reply to have text content";
            v42 = v40;
            uint32_t v43 = 2;
            goto LABEL_74;
          }
LABEL_43:
          v13 = v88;
          v16 = v86;
LABEL_44:

LABEL_31:
          v15 = v87;
          goto LABEL_32;
        }
        unint64_t v38 = [v36 maxPromptLength];
        if (v38 >= 0x400) {
          unint64_t v39 = 1024;
        }
        else {
          unint64_t v39 = v38;
        }
        if ([v37 length] > v39)
        {
          v40 = sgLogHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)v90 = v39;
            v41 = "Quick responses: processing requires the prompt to be no more than %lu characters in length";
            v42 = v40;
            uint32_t v43 = 12;
LABEL_74:
            _os_log_debug_impl(&dword_1CA650000, v42, OS_LOG_TYPE_DEBUG, v41, buf, v43);
            goto LABEL_43;
          }
          goto LABEL_43;
        }
        v44 = [v8 likelyLanguage];
        uint64_t v45 = [(SGQuickResponsesML *)self _dynamicLabelContentForReply:v88 prompt:v37 language:v44];

        v81 = v45;
        if (v45)
        {
          v78 = v36;
          v46 = sgLogHandle();
          unint64_t v47 = 0x1E4F5D000;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v90 = v81;
            _os_log_debug_impl(&dword_1CA650000, v46, OS_LOG_TYPE_DEBUG, "Quick responses: using dynamic label with unique identifier %@", buf, 0xCu);
          }

          v40 = v81;
        }
        else
        {
          v40 = v87;
          unint64_t v48 = [v36 maxReplyLength];
          if (v48 >= 0x400) {
            unint64_t v49 = 1024;
          }
          else {
            unint64_t v49 = v48;
          }
          if ([v40 length] > v49)
          {
            v50 = sgLogHandle();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              *(void *)v90 = v49;
              _os_log_debug_impl(&dword_1CA650000, v50, OS_LOG_TYPE_DEBUG, "Quick responses: not keeping response message because it is greater than %lu characters in length", buf, 0xCu);
            }
            v13 = v88;
            v16 = v86;
            goto LABEL_81;
          }
          v78 = v36;
          unint64_t v47 = 0x1E4F5D000uLL;
        }
        v51 = *(void **)(v47 + 4040);
        v52 = [v8 likelyLanguage];
        uint64_t v53 = [v51 labelOf:v40 inLanguage:v52];

        if (v53)
        {
          BOOL v75 = v81 != 0;
          v54 = *(void **)(v47 + 4040);
          v55 = [v8 likelyLanguage];
          v82 = v53;
          char v56 = [v54 shouldSampleForLabel:v53 inLanguage:v55 isDynamicLabel:v75];

          v57 = sgLogHandle();
          BOOL v58 = os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG);
          if ((v56 & 1) == 0)
          {
            v67 = v57;
            v16 = v86;
            v36 = v78;
            if (v58)
            {
              *(_DWORD *)buf = 138412290;
              v50 = v82;
              *(void *)v90 = v82;
              _os_log_debug_impl(&dword_1CA650000, v67, OS_LOG_TYPE_DEBUG, "Quick responses: dropping sample with label %@", buf, 0xCu);
              v13 = v88;
            }
            else
            {
              v13 = v88;
              v50 = v82;
            }
            goto LABEL_80;
          }
          if (v58)
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v90 = v82;
            _os_log_debug_impl(&dword_1CA650000, v57, OS_LOG_TYPE_DEBUG, "Quick responses: keeping sample with label %@", buf, 0xCu);
          }

          v59 = [v31 source];
          v60 = [v59 sessionDescriptor];

          v61 = [v31 featurizer];
          uint64_t v62 = [v61 transform:v85];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v70 = [MEMORY[0x1E4F28B00] currentHandler];
            [v70 handleFailureInMethod:a2, self, @"SGQuickResponsesML.m", 303, @"Invalid parameter not satisfying: %@", @"[vector isKindOfClass:PMLSparseVector.class]" object file lineNumber description];
          }
          v76 = (void *)v62;
          if (self->_localTraining
            && ([v7 spotlightReference],
                v63 = objc_claimAutoreleasedReturnValue(),
                v63,
                v63)
            && v62
            && v60)
          {
            localTraining = self->_localTraining;
            v50 = v82;
            uint64_t v64 = [v82 unsignedIntegerValue];
            v65 = [v7 spotlightReference];
            uint64_t v66 = v64;
            v67 = v60;
            [(PMLTrainingProtocol *)localTraining addSessionWithCovariates:v62 label:v66 sessionDescriptor:v60 spotlightReference:v65 isInternal:0];
            v16 = v86;
          }
          else
          {
            v67 = v60;
            v65 = sgLogHandle();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
            {
              BOOL v71 = self->_localTraining != 0;
              v73 = [v7 spotlightReference];
              v69 = [v60 version];
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)v90 = v71;
              *(_WORD *)&v90[4] = 1024;
              *(_DWORD *)&v90[6] = v73 != 0;
              __int16 v91 = 1024;
              BOOL v92 = v76 != 0;
              __int16 v93 = 1024;
              BOOL v94 = v60 != 0;
              __int16 v95 = 2112;
              v96 = v69;
              _os_log_debug_impl(&dword_1CA650000, v65, OS_LOG_TYPE_DEBUG, "Quick responses: not adding session for training - localTraining %d, spotlightReference %d, vector %d, sessionDescriptor %d, version: %@", buf, 0x24u);
            }
            v16 = v86;
            v50 = v82;
          }

          v13 = v88;
        }
        else
        {
          v50 = 0;
          v67 = sgLogHandle();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
          {
            v68 = [v8 likelyLanguage];
            *(_DWORD *)buf = 138412290;
            *(void *)v90 = v68;
            _os_log_error_impl(&dword_1CA650000, v67, OS_LOG_TYPE_ERROR, "Quick responses: labeler failed to offer positive or negative label in language %@", buf, 0xCu);
          }
          v13 = v88;
          v16 = v86;
        }
        v36 = v78;
LABEL_80:

LABEL_81:
        goto LABEL_44;
      }
    }
    else
    {
    }
    v31 = sgLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v31, OS_LOG_TYPE_DEBUG, "Quick responses: processing requires the prompt and reply to have a single sender handle", buf, 2u);
    }
    v13 = v88;
    goto LABEL_31;
  }
  v12 = sgLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    v18 = "Quick responses: processing is disabled for group messages";
    goto LABEL_13;
  }
LABEL_33:
}

- (id)_dynamicLabelContentForReply:(id)a3 prompt:(id)a4 language:(id)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 message];
  uint64_t v11 = [v10 attachmentFilename];

  v12 = [v7 message];
  v13 = [v12 sender];
  v14 = [v13 displayName];

  if (v11)
  {
    if (+[SGQuickResponsesML _isImageAttachment:v11])
    {
      v15 = @"photoSharingUEhPVE8K";
      goto LABEL_56;
    }
    if (+[SGQuickResponsesML _isSharingSenderLocation:v11 senderName:v14])
    {
      v15 = @"firstPartyLocTE9DLjFwCg";
      goto LABEL_56;
    }
  }
  if (!v14)
  {
    v15 = 0;
    goto LABEL_56;
  }
  id v74 = v9;
  BOOL v75 = v14;
  v73 = v11;
  v16 = [v7 detectedData];
  if (![v16 count])
  {
    v17 = 0;
    v15 = 0;
    goto LABEL_55;
  }
  BOOL v71 = v8;
  v72 = v7;
  v17 = 0;
  int v18 = 0;
  uint64_t v19 = -1;
  unint64_t v20 = 1;
  do
  {
    v21 = [v16 objectAtIndexedSubscript:v20 - 1];
    int v22 = [v21 matchType];

    switch(v22)
    {
      case 2:
        uint64_t v19 = 2;
LABEL_16:
        uint64_t v28 = [v16 objectAtIndexedSubscript:v20 - 1];

        ++v18;
        v17 = (void *)v28;
        break;
      case 1:
        uint64_t v19 = 1;
        goto LABEL_16;
      case 0:
        uint64_t v23 = v19;
        v24 = +[SGContactPipelineHelper sharedInstance];
        v25 = [v16 objectAtIndexedSubscript:v20 - 1];
        v26 = [v25 valueString];
        char v27 = [v24 numberMatchesContactsForm:v26];

        if ((v27 & 1) == 0)
        {
          uint64_t v19 = v23;
          break;
        }
        uint64_t v19 = 0;
        goto LABEL_16;
    }
    if ([v16 count] <= v20) {
      break;
    }
    ++v20;
  }
  while (v18 < 2);
  if (v18 == 1)
  {
    v29 = [v17 valueString];
    id v8 = v71;
    id v7 = v72;
    if (!v29)
    {
      uint64_t v30 = [v17 range];
      uint64_t v32 = v31;
      v33 = [v72 message];
      v29 = [v33 textContent];

      if (v30 + v32 > (unint64_t)[v29 length])
      {
        v34 = sgLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218496;
          uint64_t v82 = v30;
          __int16 v83 = 2048;
          uint64_t v84 = v32;
          __int16 v85 = 2048;
          uint64_t v86 = [v29 length];
          _os_log_error_impl(&dword_1CA650000, v34, OS_LOG_TYPE_ERROR, "Range {%tu, %tu} out of bounds; string length: %tu",
            buf,
            0x20u);
        }
        v15 = 0;
        id v7 = v72;
        goto LABEL_54;
      }
      v35 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v36 = objc_msgSend(v29, "substringWithRange:", v30, v32);

      v29 = (void *)v36;
      id v7 = v72;
    }
    v37 = +[SGContactPipelineHelper findContactsForDetailType:v19 andValue:v29];
    v34 = v37;
    if (!v37 || ![v37 count])
    {
LABEL_36:
      v15 = 0;
      goto LABEL_54;
    }
    unint64_t v67 = v19;
    v68 = [v7 message];
    unint64_t v38 = [v68 sender];
    unint64_t v39 = [v38 handles];
    v40 = [v39 firstObject];
    v70 = v34;
    BOOL v41 = +[SGContactPipelineHelper personExistsInContacts:v34 name:v75 handle:v40];

    if (v41)
    {
      if (v67 < 3)
      {
        v15 = off_1E65B78C8[v67];
        goto LABEL_54;
      }
      goto LABEL_36;
    }
    v69 = v29;
    v42 = objc_opt_new();
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint32_t v43 = v34;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v76 objects:v80 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v77 != v46) {
            objc_enumerationMutation(v43);
          }
          unint64_t v48 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          unint64_t v49 = [v48 givenName];
          uint64_t v50 = [v49 length];

          if (v50)
          {
            v51 = [v48 givenName];
            v52 = [v51 lowercaseString];
            [v42 addObject:v52];
          }
          uint64_t v53 = [v48 familyName];
          uint64_t v54 = [v53 length];

          if (v54)
          {
            v55 = [v48 familyName];
            char v56 = [v55 lowercaseString];
            [v42 addObject:v56];
          }
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v76 objects:v80 count:16];
      }
      while (v45);
    }

    v57 = (void *)MEMORY[0x1CB79B230]();
    BOOL v58 = [[SGNameDetector alloc] initWithLanguage:v74];
    id v8 = v71;
    v59 = [(SGNameDetector *)v58 detectNames:v71 withNameSet:v42];

    if ([v59 count] != 1) {
      goto LABEL_52;
    }
    v60 = (void *)MEMORY[0x1CB79B230]();
    v61 = [v59 firstObject];
    uint64_t v62 = [v61 range];
    uint64_t v64 = objc_msgSend(v71, "substringWithRange:", v62, v63);

    id v8 = v71;
    BOOL v65 = +[SGContactPipelineHelper personExistsInContacts:v43 name:v64 handle:0];

    if (!v65) {
      goto LABEL_52;
    }
    if (v67 < 3)
    {
      v15 = off_1E65B78E0[v67];
    }
    else
    {
LABEL_52:

      v15 = 0;
    }
    id v7 = v72;
    v29 = v69;
    v34 = v70;
LABEL_54:
  }
  else
  {
    v15 = 0;
    id v8 = v71;
    id v7 = v72;
  }
LABEL_55:

  uint64_t v11 = v73;
  id v9 = v74;
  v14 = v75;
LABEL_56:

  return v15;
}

- (SGQuickResponsesML)initWithTraining:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGQuickResponsesML;
  v6 = [(SGQuickResponsesML *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_localTraining, a3);
  }

  return v7;
}

+ (BOOL)_isImageAttachment:(id)a3
{
  v3 = [a3 lowercaseString];
  v4 = [v3 pathExtension];

  LOBYTE(v3) = [&unk_1F25368A8 containsObject:v4];
  return (char)v3;
}

+ (BOOL)_isSharingSenderLocation:(id)a3 senderName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v10 = 1;
  if (([@"CL.loc.vcf" isEqualToString:v5] & 1) == 0
    && ([@"Shared Location.loc.vcf" isEqualToString:v5] & 1) == 0)
  {
    if (!v6 {
      || (id v7 = (void *)MEMORY[0x1CB79B230](),
    }
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

@end