@interface SGSelfIdentification
+ (id)processConversation:(id)a3 options:(unint64_t)a4;
+ (id)processConversation:(id)a3 threadLength:(unint64_t)a4 options:(unint64_t)a5;
@end

@implementation SGSelfIdentification

+ (id)processConversation:(id)a3 options:(unint64_t)a4
{
  v6 = sgMap();
  v7 = [a1 processConversation:v6 threadLength:0 options:a4 | 0x100];

  return v7;
}

SGTextMessageItem *__52__SGSelfIdentification_processConversation_options___block_invoke(uint64_t a1, void *a2)
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v4 = (SGTextMessageItem *)v2;
  v5 = v4;
  v6 = v4;
  if (isKindOfClass)
  {
    uint64_t v7 = [(SGTextMessageItem *)v4 hasPrefix:@"sent:"];
    v8 = [SGTextMessageItem alloc];
    v9 = [SGTextMessage alloc];
    v15[0] = @"isSent";
    v10 = [NSNumber numberWithBool:v7];
    v15[1] = @"body";
    v16[0] = v10;
    v11 = v5;
    if (v7)
    {
      v11 = [(SGTextMessageItem *)v5 substringFromIndex:5];
    }
    v16[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    v13 = [(SGTextMessage *)v9 initWithMessageDictionary:v12];
    v6 = [(SGTextMessageItem *)v8 initWithTextMessage:v13];

    if (v7) {
  }
    }

  return v6;
}

+ (id)processConversation:(id)a3 threadLength:(unint64_t)a4 options:(unint64_t)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (![v9 count])
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, a1, @"SGSelfIdentification.m", 108, @"Invalid parameter not satisfying: %@", @"conversation.count > 0" object file lineNumber description];
  }
  v45 = [v9 lastObject];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__7481;
  v55 = __Block_byref_object_dispose__7482;
  id v56 = 0;
  v10 = [v45 message];
  int v11 = [v10 isSent];

  if (v11)
  {
    v12 = sgLogHandle();
    v44 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "Self-id: Skipping - outgoing message", (uint8_t *)&buf, 2u);
    }
    id v13 = 0;
  }
  else
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __65__SGSelfIdentification_processConversation_threadLength_options___block_invoke;
    v50[3] = &__block_descriptor_48_e67___NSString_36__0_SGMSIPatternType__Q_8__NSString_16__NSString_24B32l;
    v50[4] = a5;
    v50[5] = a4;
    v14 = (void *)MEMORY[0x1CB79B4C0](v50);
    v15 = [v45 text];
    v16 = _PASNormalizeUnicodeStringMinimally();

    v17 = sgLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_debug_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEBUG, "Self-id: looking for pattern match in: \"%@\"", (uint8_t *)&buf, 0xCu);
    }

    v42 = +[SGDetectedAttributeDissector patterns];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __65__SGSelfIdentification_processConversation_threadLength_options___block_invoke_21;
    v46[3] = &unk_1E65B6AD8;
    v44 = v14;
    v48 = v44;
    v49 = &v51;
    id v47 = v16;
    id v18 = v47;
    v19 = v46;
    v20 = +[SGDetectedAttributeDissector patterns];
    v21 = [v20 regex2ForKey:@"MyName/F"];
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v58 = __enumerateMyNameInstances_block_invoke;
    v59 = &unk_1E65B6B48;
    id v60 = v18;
    id v61 = v19;
    id v22 = v18;
    v23 = v19;
    v43 = v22;
    [v21 enumerateMatchesInString:v22 ngroups:4 blockWithSubregexp:&buf];

    v24 = (void *)v52[5];
    if (!v24)
    {
      v25 = [v42 regex2ForKey:@"NameRequest/F"];
      for (uint64_t i = (int)([v9 count] - 2); ; --i)
      {
        int v27 = [v9 count];
        int v28 = v27 <= 3 ? 3 : v27;
        if (i < (v28 - 3)) {
          break;
        }
        v29 = [v9 objectAtIndexedSubscript:i];
        v30 = [v29 message];
        if ([v30 isSent])
        {
          v31 = [v29 text];
          v32 = _PASNormalizeUnicodeString();
          v33 = [v25 existsInString:v32];

          if (v33)
          {
            v34 = [v33 hashId];
            v35 = ((void (*)(NSObject *, void, void *, void *, void))v44[2].isa)(v44, *MEMORY[0x1E4F5DE50], v34, v43, 0);

            if ([v35 length])
            {
              uint64_t v36 = objc_opt_new();
              v37 = (void *)v52[5];
              v52[5] = v36;

              [(id)v52[5] setName:v35];
              [(id)v52[5] setContext:v43];
              uint64_t v38 = [v43 length];
              objc_msgSend((id)v52[5], "setContextRange:", 0, v38);
              v39 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:2 modelVersion:0 confidence:0];
              [(id)v52[5] setExtractionInfo:v39];
            }
            break;
          }
        }
        else
        {
        }
      }

      v24 = (void *)v52[5];
    }
    id v13 = v24;
  }
  _Block_object_dispose(&v51, 8);

  return v13;
}

id __65__SGSelfIdentification_processConversation_threadLength_options___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, char a5)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = _PASCollapseWhitespaceAndStrip();
  if (![v11 length])
  {
    id v13 = 0;
    goto LABEL_33;
  }
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  if (SGGuessNamingTradition(v11) != 1)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v32 = __65__SGSelfIdentification_processConversation_threadLength_options___block_invoke_2;
    v33 = &unk_1E65B6A90;
    v35 = &v50;
    uint64_t v36 = &v46;
    v37 = &v42;
    id v34 = v10;
    uint64_t v38 = &v58;
    uint64_t v14 = *(void *)(a1 + 32);
    v39 = &v54;
    v40 = &v62;
    uint64_t v41 = v14;
    id v15 = v11;
    v16 = v31;
    uint64_t v67 = 0;
    v68 = &v67;
    uint64_t v69 = 0x2020000000;
    uint64_t v70 = 0;
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __enumerateNameComponents_block_invoke;
    v72 = &unk_1E65B6B20;
    v74 = &v67;
    v17 = v16;
    id v73 = v17;
    +[SGTokenizer enumerateTokensInString:v15 block:buf];
    if (!v68[3])
    {
      char v66 = 0;
      uint64_t v18 = [v15 length];
      ((void (*)(void *, id, void, uint64_t, char *))v32)(v17, v15, 0, v18, &v66);
    }

    _Block_object_dispose(&v67, 8);
    uint64_t v19 = v51[3];
    unint64_t v20 = v59[3];
    if (v19 != v20)
    {
      if (v55[3] < v20)
      {
        uint64_t v21 = 0;
        goto LABEL_12;
      }
      if (v43[3]) {
        goto LABEL_13;
      }
      BOOL v29 = v19 == 0;
      char v30 = a5 ^ 1;
      if (!v29) {
        char v30 = 0;
      }
      if ((v30 & 1) != 0 || (*(void *)(a1 + 32) & 2) == 0) {
        goto LABEL_13;
      }
    }
    uint64_t v21 = [v15 length];
LABEL_12:
    v63[3] = v21;
LABEL_13:

    goto LABEL_14;
  }
  if (+[SGNames isSalientNameByChars:v11])
  {
    uint64_t v12 = [v11 length];
    v63[3] = v12;
  }
LABEL_14:
  uint64_t v22 = v63[3];
  if (!v22)
  {
    v23 = sgLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&buf[4] = v10;
      _os_log_debug_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEBUG, "Self-id: Found NO name to extract from candidate \"%@\"", buf, 0xCu);
    }
    id v13 = 0;
    goto LABEL_22;
  }
  if (v22 == [v11 length])
  {
    id v13 = v11;
    v23 = sgLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      v24 = "Self-id: Extracted name \"%@\" from candidate \"%@\"";
LABEL_43:
      _os_log_debug_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEBUG, v24, buf, 0x16u);
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x1CB79B230]();
    objc_msgSend(v11, "substringWithRange:", 0, v63[3]);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v23 = sgLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      v24 = "Self-id: Extracted partial name \"%@\" from candidate \"%@\"";
      goto LABEL_43;
    }
  }
LABEL_22:

  if ((*(unsigned char *)(a1 + 33) & 1) == 0)
  {
    if ([v13 length])
    {
      v26 = (void *)MEMORY[0x1E4F5DE38];
    }
    else if (v47[3])
    {
      v26 = (void *)MEMORY[0x1E4F5DE30];
    }
    else
    {
      v26 = (void *)MEMORY[0x1E4F5DE40];
    }
    if (v9) {
      int v27 = v9;
    }
    else {
      int v27 = @"NA";
    }
    [MEMORY[0x1E4F5DAD0] recordSelfIdMatchWithPatternType:a2 patternHash:v27 nameTokenCount:v59[3] nameClassification:*v26 messageIndex:*(void *)(a1 + 40)];
  }
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);
LABEL_33:

  return v13;
}

void __65__SGSelfIdentification_processConversation_threadLength_options___block_invoke_21(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v13 = a1[5];
  id v14 = a2;
  id v15 = [a5 hashId];
  (*(void (**)(uint64_t, void, void *, id, uint64_t))(v13 + 16))(v13, *MEMORY[0x1E4F5DE48], v15, v14, a6);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  if ([v20 length])
  {
    uint64_t v16 = objc_opt_new();
    uint64_t v17 = *(void *)(a1[6] + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    [*(id *)(*(void *)(a1[6] + 8) + 40) setName:v20];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setContext:a1[4]];
    objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "setContextRange:", a3, a4);
    uint64_t v19 = [MEMORY[0x1E4F5DA20] extractionInfoWithExtractionType:2 modelVersion:0 confidence:0];
    [*(id *)(*(void *)(a1[6] + 8) + 40) setExtractionInfo:v19];

    *a7 = 1;
  }
}

void __65__SGSelfIdentification_processConversation_threadLength_options___block_invoke_2(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  char v8 = +[SGNames attributesForNameWord:v7];
  char v9 = v8;
  if ((v8 & 4) != 0)
  {
    uint64_t v11 = a1[5];
LABEL_8:
    ++*(void *)(*(void *)(v11 + 8) + 24);
    goto LABEL_9;
  }
  if (v8)
  {
    uint64_t v11 = a1[6];
    goto LABEL_8;
  }
  ++*(void *)(*(void *)(a1[7] + 8) + 24);
  id v10 = sgLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v34 = a1[4];
    *(_DWORD *)buffer = 138412546;
    *(void *)&buffer[2] = v7;
    buffer[6] = 2112;
    *(void *)&buffer[7] = v34;
    _os_log_debug_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEBUG, "Self-id: Not-a-known-name \"%@\" word in candidate \"%@\"", (uint8_t *)buffer, 0x16u);
  }

LABEL_9:
  ++*(void *)(*(void *)(a1[8] + 8) + 24);
  id v12 = v7;
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetUppercaseLetter);
  id v14 = (__CFString *)v12;
  id v15 = self;

  if (!v15) {
    goto LABEL_43;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  memset(buffer, 0, sizeof(buffer));
  CFIndex Length = CFStringGetLength(v14);
  CFStringRef theString = v14;
  uint64_t v47 = 0;
  CFIndex v48 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v14);
  CStringPtr = 0;
  uint64_t v45 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v14, 0x600u);
  }
  int64_t v49 = 0;
  int64_t v50 = 0;
  uint64_t v46 = CStringPtr;
  if (Length > 0)
  {
    char v35 = v9;
    uint64_t v36 = a4;
    uint64_t v19 = 0;
    int64_t v20 = 0;
    int v21 = 0;
    char v22 = 0;
    uint64_t v23 = 64;
    do
    {
      if ((unint64_t)v20 >= 4) {
        uint64_t v24 = 4;
      }
      else {
        uint64_t v24 = v20;
      }
      CFIndex v25 = v48;
      if (v48 <= v20)
      {
        UniChar v26 = 0;
      }
      else if (v45)
      {
        UniChar v26 = v45[v20 + v47];
      }
      else if (v46)
      {
        UniChar v26 = v46[v47 + v20];
      }
      else
      {
        int64_t v28 = v49;
        if (v50 <= v20 || v49 > v20)
        {
          uint64_t v30 = v24 + v19;
          uint64_t v31 = v23 - v24;
          int64_t v32 = v20 - v24;
          CFIndex v33 = v32 + 64;
          if (v32 + 64 >= v48) {
            CFIndex v33 = v48;
          }
          int64_t v49 = v32;
          int64_t v50 = v33;
          if (v48 >= v31) {
            CFIndex v25 = v31;
          }
          v52.length = v25 + v30;
          v52.location = v32 + v47;
          CFStringGetCharacters(theString, v52, buffer);
          int64_t v28 = v49;
        }
        UniChar v26 = buffer[v20 - v28];
      }
      int IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, v26);
      if (v22)
      {
        if (!IsCharacterMember) {
          ++v21;
        }
      }
      else if (!IsCharacterMember)
      {
        a4 = v36;
        char v9 = v35;
        goto LABEL_43;
      }
      ++v20;
      --v19;
      ++v23;
      char v22 = 1;
    }
    while (Length != v20);

    a4 = v36;
    char v9 = v35;
    if (v21 >= 1) {
      ++*(void *)(*(void *)(a1[9] + 8) + 24);
    }
  }
  else
  {
LABEL_43:
  }
  if ((v9 & 4) != 0
    && (a1[11] & 1) != 0
    && *(void *)(*(void *)(a1[5] + 8) + 24) == *(void *)(*(void *)(a1[8] + 8) + 24))
  {
    *(void *)(*(void *)(a1[10] + 8) + 24) = a3 + a4;
  }
}

@end