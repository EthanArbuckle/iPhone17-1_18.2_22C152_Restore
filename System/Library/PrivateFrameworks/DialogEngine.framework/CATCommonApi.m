@interface CATCommonApi
+ (BOOL)UpdatesEnabled:(int)a3;
+ (id)CreateDEExecutor:(id)a3 templateDir:(id)a4 catId:(id)a5 paramsXML:(id)a6 localeXML:(id)a7 parameters:(id)a8 globalContext:(id)a9 callback:(id)a10 options:(int)a11;
+ (id)DEResultToCATResult:(id)a3 catId:(id)a4;
+ (id)DEResultToDialogExecutionResult:(id)a3 catId:(id)a4;
+ (id)NSErrorFromString:(id)a3 errorCode:(id)a4;
+ (void)ConfigureDEExecutor:(id)a3 parameters:(id)a4 globalParameters:(id)a5 catId:(id)a6 callback:(id)a7 options:(int)a8;
@end

@implementation CATCommonApi

+ (id)CreateDEExecutor:(id)a3 templateDir:(id)a4 catId:(id)a5 paramsXML:(id)a6 localeXML:(id)a7 parameters:(id)a8 globalContext:(id)a9 callback:(id)a10 options:(int)a11
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v20 = v18;
LABEL_4:
    v21 = v20;
    v22 = objc_opt_new();
    if (v14) {
      +[DEExecutor bundleTemplateDir:v14];
    }
    else {
    v23 = [v15 path];
    }
    [v22 setTemplateDir:v23];

    +[CATCommonApi ConfigureDEExecutor:v22 parameters:v17 globalParameters:v21 catId:v16 callback:v19 options:a11];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = [v18 toDictionary];
    goto LABEL_4;
  }
  siri::dialogengine::Log::Error((siri::dialogengine::Log *)"Invalid globals object - must be a Dictionary or CATContext instance", v25);
  v22 = 0;
LABEL_8:

  return v22;
}

+ (id)DEResultToDialogExecutionResult:(id)a3 catId:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v39 = a4;
  id v41 = (id)objc_opt_new();
  v43 = objc_opt_new();
  if (v42 && ([v42 meta], (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = [v42 meta];
    v40 = (void *)[v6 copy];
  }
  else
  {
    v40 = objc_opt_new();
  }
  [v41 setCatId:v39];
  [v41 setDialog:v43];
  [v41 setMeta:v40];
  if (v42)
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = [v42 response];
    uint64_t v7 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
    if (v7)
    {
      uint64_t v57 = *(void *)v63;
      do
      {
        uint64_t v58 = v7;
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v63 != v57) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          v61 = [v9 objectForKey:@"type"];
          if ([v61 isEqualToString:@"dialog"])
          {
            v10 = objc_opt_new();
            v11 = [v9 objectForKey:@"id"];
            [v10 setId:v11];

            v12 = [v9 objectForKey:@"content"];
            v13 = v12;
            if (v12)
            {
              v51 = v12;
              v56 = [v12 objectForKey:@"print"];
              v54 = [v13 objectForKey:@"speak"];
              v53 = [v13 objectForKey:@"redactedPrint"];
              v52 = [v13 objectForKey:@"redactedSpeak"];
              v55 = [v9 objectForKey:@"id"];
              [v10 setFullPrint:v56];
              [v10 setFullSpeak:v54];
              if (v53) {
                id v14 = v53;
              }
              else {
                id v14 = &stru_1F2127290;
              }
              [v10 setRedactedFullPrint:v14];
              if (v52) {
                id v15 = v52;
              }
              else {
                id v15 = &stru_1F2127290;
              }
              [v10 setRedactedFullSpeak:v15];
              [v10 setId:v55];
              id v16 = [v9 objectForKey:@"caption"];
              v59 = v16;
              if (v16)
              {
                uint64_t v17 = [v16 objectForKey:@"print"];
                uint64_t v18 = [v59 objectForKey:@"speak"];
                uint64_t v19 = [v59 objectForKey:@"redactedPrint"];
                uint64_t v20 = [v59 objectForKey:@"redactedSpeak"];
                v21 = (__CFString *)v17;
                v60 = (__CFString *)v18;
                v22 = (__CFString *)v19;
                v23 = (__CFString *)v20;
              }
              else
              {
                v23 = &stru_1F2127290;
                v21 = &stru_1F2127290;
                v60 = &stru_1F2127290;
                v22 = &stru_1F2127290;
              }
              v24 = v21;
              objc_msgSend(v10, "setSupportingPrint:");
              [v10 setSupportingSpeak:v60];
              [v10 setRedactedSupportingPrint:v22];
              [v10 setRedactedSupportingSpeak:v23];
              v25 = [v9 objectForKey:@"unfilteredContent"];
              v26 = v25;
              if (v25)
              {
                v44 = v25;
                v49 = [v25 objectForKey:@"print"];
                v48 = [v26 objectForKey:@"speak"];
                v47 = [v26 objectForKey:@"redactedPrint"];
                v50 = [v26 objectForKey:@"redactedSpeak"];
                [v10 setUnfilteredFullPrint:v49];
                [v10 setUnfilteredFullSpeak:v48];
                [v10 setUnfilteredRedactedFullPrint:v47];
                [v10 setUnfilteredRedactedFullSpeak:v50];
                v27 = [v9 objectForKey:@"unfilteredCaption"];
                v45 = v27;
                if (v27)
                {
                  uint64_t v28 = [v27 objectForKey:@"print"];
                  uint64_t v29 = [v45 objectForKey:@"speak"];
                  v30 = (__CFString *)v28;
                  v31 = (__CFString *)v29;
                }
                else
                {
                  v31 = &stru_1F2127290;
                  v30 = &stru_1F2127290;
                }
                v32 = v30;
                objc_msgSend(v10, "setUnfilteredSupportingPrint:");
                [v10 setUnfilteredSupportingSpeak:v31];
                v33 = [v9 objectForKey:@"printOnly"];
                if (!v33)
                {
                  v33 = [NSNumber numberWithBool:0];
                }
                v34 = [v9 objectForKey:@"spokenOnly"];
                [v10 setSpokenOnlyDefined:v34 != 0];
                if (!v34)
                {
                  v34 = [NSNumber numberWithBool:0];
                }
                objc_msgSend(v10, "setPrintOnly:", objc_msgSend(v33, "BOOLValue"));
                objc_msgSend(v10, "setSpokenOnly:", objc_msgSend(v34, "BOOLValue"));
                v35 = [v9 objectForKey:@"isApprovedForGrading"];
                v36 = v35;
                if (v35) {
                  uint64_t v37 = [v35 BOOLValue];
                }
                else {
                  uint64_t v37 = 0;
                }
                [v10 setIsApprovedForGrading:v37];
                [v43 addObject:v10];

                v26 = v44;
              }

              v13 = v51;
            }
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
      }
      while (v7);
    }

    [v41 setDialog:v43];
  }

  return v41;
}

+ (id)DEResultToCATResult:(id)a3 catId:(id)a4
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v57 = a4;
  id v73 = (id)objc_opt_new();
  v71 = objc_opt_new();
  v72 = objc_opt_new();
  v70 = objc_opt_new();
  v68 = objc_opt_new();
  v69 = objc_opt_new();
  uint64_t v67 = objc_opt_new();
  v66 = objc_opt_new();
  long long v64 = objc_opt_new();
  long long v62 = objc_opt_new();
  if (v59 && ([v59 meta], (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = [v59 meta];
    v56 = (void *)[v6 copy];
  }
  else
  {
    v56 = objc_opt_new();
  }
  v53 = objc_opt_new();
  v54 = objc_opt_new();
  v55 = objc_opt_new();
  uint64_t v58 = objc_opt_new();
  v60 = objc_opt_new();
  long long v63 = objc_opt_new();
  v61 = objc_opt_new();
  long long v65 = objc_opt_new();
  [v73 setCatId:v57];
  [v73 setSpeak:v71];
  [v73 setPrint:v72];
  [v73 setDialogId:v70];
  [v73 setMeta:v56];
  [v73 setCaptionSpeak:v68];
  [v73 setCaptionPrint:v69];
  [v73 setPrintOnly:v67];
  [v73 setSpokenOnly:v66];
  [v73 setSpokenOnlyDefined:v64];
  [v73 setIsApprovedForGrading:v62];
  [v73 setVisualId:0];
  [v73 setVisualParameters:0];
  [v73 setVisualResponse:0];
  [v73 setUnfilteredPrint:v54];
  [v73 setUnfilteredSpeak:v53];
  [v73 setUnfilteredCaptionPrint:v55];
  [v73 setUnfilteredCaptionSpeak:v58];
  [v73 setRedactedSpeak:v60];
  [v73 setRedactedPrint:v63];
  [v73 setRedactedCaptionSpeak:v65];
  [v73 setRedactedCaptionPrint:v61];
  if (!v59) {
    goto LABEL_76;
  }
  uint64_t v7 = [v59 response];

  if (!v7) {
    goto LABEL_61;
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = [v59 response];
  uint64_t v8 = [obj countByEnumeratingWithState:&v89 objects:v94 count:16];
  if (!v8) {
    goto LABEL_60;
  }
  uint64_t v80 = *(void *)v90;
  do
  {
    uint64_t v81 = v8;
    for (uint64_t i = 0; i != v81; ++i)
    {
      if (*(void *)v90 != v80) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v89 + 1) + 8 * i);
      v84 = objc_msgSend(v10, "objectForKey:", @"type", v53);
      if ([v84 isEqualToString:@"visual"])
      {
        uint64_t v83 = [v10 objectForKey:@"data"];
        if (!v83)
        {
          siri::dialogengine::Log::Error((siri::dialogengine::Log *)"Can't get base64 data from visual response", v11);
LABEL_19:
          v21 = 0;
          goto LABEL_58;
        }
        v82 = (__CFString *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v83 options:0];
        objc_msgSend(v73, "setVisualResponse:");
        siri::dialogengine::Log::Info((siri::dialogengine::Log *)"Added visual data to response", v12);
      }
      else
      {
        v13 = [v10 objectForKey:@"content"];
        id v14 = v13;
        if (!v13) {
          goto LABEL_19;
        }
        uint64_t v83 = (uint64_t)v13;
        v82 = [v13 objectForKey:@"print"];
        v79 = [v14 objectForKey:@"speak"];
        v76 = [v14 objectForKey:@"redactedPrint"];
        v75 = [v14 objectForKey:@"redactedSpeak"];
        v78 = [v10 objectForKey:@"id"];
        id v15 = [v10 objectForKey:@"caption"];
        id v16 = v15;
        if (v15)
        {
          uint64_t v17 = [v15 objectForKey:@"print"];
          uint64_t v18 = [v16 objectForKey:@"speak"];
          uint64_t v19 = [v16 objectForKey:@"redactedPrint"];
          uint64_t v20 = [v16 objectForKey:@"redactedSpeak"];
        }
        else
        {
          uint64_t v17 = &stru_1F2127290;
          uint64_t v18 = &stru_1F2127290;
          uint64_t v19 = &stru_1F2127290;
          uint64_t v20 = &stru_1F2127290;
        }
        v22 = [v10 objectForKey:@"printOnly"];
        if (!v22)
        {
          v22 = [NSNumber numberWithBool:0];
        }
        v23 = [v10 objectForKey:@"spokenOnly"];
        v24 = (void *)MEMORY[0x1E4F1CC38];
        if (!v23) {
          v24 = (void *)MEMORY[0x1E4F1CC28];
        }
        id v77 = v24;
        if (!v23)
        {
          v23 = [NSNumber numberWithBool:0];
        }
        v25 = [v10 objectForKey:@"isApprovedForGrading"];
        if (!v25)
        {
          v25 = [NSNumber numberWithBool:0];
        }
        if (v82) {
          v26 = v82;
        }
        else {
          v26 = &stru_1F2127290;
        }
        [v72 addObject:v26];
        if (v79) {
          v27 = v79;
        }
        else {
          v27 = &stru_1F2127290;
        }
        [v71 addObject:v27];
        if (v78) {
          uint64_t v28 = v78;
        }
        else {
          uint64_t v28 = &stru_1F2127290;
        }
        [v70 addObject:v28];
        if (v17) {
          uint64_t v29 = v17;
        }
        else {
          uint64_t v29 = &stru_1F2127290;
        }
        [v69 addObject:v29];
        if (v18) {
          v30 = v18;
        }
        else {
          v30 = &stru_1F2127290;
        }
        [v68 addObject:v30];
        [v67 addObject:v22];
        [v66 addObject:v23];
        [v64 addObject:v77];
        [v62 addObject:v25];
        if (v76) {
          v31 = v76;
        }
        else {
          v31 = &stru_1F2127290;
        }
        [v63 addObject:v31];
        if (v75) {
          v32 = v75;
        }
        else {
          v32 = &stru_1F2127290;
        }
        [v60 addObject:v32];
        if (v19) {
          v33 = v19;
        }
        else {
          v33 = &stru_1F2127290;
        }
        [v61 addObject:v33];
        if (v20) {
          v34 = v20;
        }
        else {
          v34 = &stru_1F2127290;
        }
        [v65 addObject:v34];
      }
      v21 = (void *)v83;
LABEL_58:
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v89 objects:v94 count:16];
  }
  while (v8);
LABEL_60:

LABEL_61:
  v35 = objc_msgSend(v59, "visualRefs", v53);
  BOOL v36 = v35 == 0;

  if (!v36)
  {
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    uint64_t v37 = [v59 visualRefs];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v85 objects:v93 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v86;
      while (2)
      {
        for (uint64_t j = 0; j != v38; ++j)
        {
          if (*(void *)v86 != v39) {
            objc_enumerationMutation(v37);
          }
          id v41 = *(void **)(*((void *)&v85 + 1) + 8 * j);
          id v42 = [v41 objectForKey:@"id"];
          if (v42)
          {
            v43 = [v41 objectForKey:@"parameters"];
            if (v43)
            {
              [v73 setVisualId:v42];
              [v73 setVisualParameters:v43];

              goto LABEL_74;
            }
          }
        }
        uint64_t v38 = [v37 countByEnumeratingWithState:&v85 objects:v93 count:16];
        if (v38) {
          continue;
        }
        break;
      }
    }
LABEL_74:
  }
  v44 = [v73 print];
  v45 = (void *)[v44 mutableCopy];
  [v73 setUnfilteredPrint:v45];

  v46 = [v73 speak];
  v47 = (void *)[v46 mutableCopy];
  [v73 setUnfilteredSpeak:v47];

  v48 = [v73 captionPrint];
  v49 = (void *)[v48 mutableCopy];
  [v73 setUnfilteredCaptionPrint:v49];

  v50 = [v73 captionSpeak];
  v51 = (void *)[v50 mutableCopy];
  [v73 setUnfilteredCaptionSpeak:v51];

LABEL_76:
  return v73;
}

+ (BOOL)UpdatesEnabled:(int)a3
{
  return (CATDisableUpdates & a3) == 0;
}

+ (void)ConfigureDEExecutor:(id)a3 parameters:(id)a4 globalParameters:(id)a5 catId:(id)a6 callback:(id)a7 options:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v48 = [v15 objectForKey:@"locale"];
  [v13 setCatId:v16];
  [v13 setParameters:v14];
  uint64_t v18 = [v15 objectForKey:@"globalParameters"];
  [v13 setGlobalParameters:v18];

  [v13 setLocale:v48];
  uint64_t v19 = [v15 objectForKey:@"customPronunciations"];
  [v13 setCustomPronunciations:v19];

  uint64_t v20 = [v15 objectForKey:@"userSettings"];
  [v13 setUserSettings:v20];

  [v13 setDebug:(CATDebugMode & v8) != 0];
  [v13 setTest:(CATTestMode & v8) != 0];
  [v13 setResetState:(CATResetState & v8) != 0];
  objc_msgSend(v13, "setEnableUpdates:", +[CATCommonApi UpdatesEnabled:](CATCommonApi, "UpdatesEnabled:", v8));
  [v13 setCreateTrace:(CATCreateTrace & v8) != 0];
  [v13 setVisual:(CATVisualMode & v8) != 0];
  [v13 setDeterministic:(CATDeterministic & v8) != 0];
  [v13 setIsSpotlight:(CATIsSpotlight & v8) != 0];
  [v13 setIsLabelMode:(CATLabelMode & v8) != 0];
  [v13 setSwitchFallthrough:(CATSwitchFallthrough & v8) != 0];
  [v13 setIncludeKeywords:(CATIncludeKeywords & v8) != 0];
  v21 = [v15 objectForKey:@"multiuser"];
  v22 = v21;
  if (v21) {
    uint64_t v23 = [v21 BOOLValue];
  }
  else {
    uint64_t v23 = 0;
  }
  [v13 setMultiuser:v23];
  v24 = [v15 objectForKey:@"grounding"];
  v25 = v24;
  if (v24) {
    uint64_t v26 = [v24 BOOLValue];
  }
  else {
    uint64_t v26 = 0;
  }
  [v13 setGrounding:v26];
  v27 = [v15 objectForKey:@"gender"];
  [v13 setVoiceGender:v27];

  uint64_t v28 = [v15 objectForKey:@"dialogMetadata"];
  [v13 setDialogMetadata:v28];

  uint64_t v29 = [v15 objectForKey:@"interactionId"];
  [v13 setInteractionId:v29];

  v30 = [v15 objectForKey:@"executionRequestId"];
  [v13 setExecutionRequestId:v30];

  v31 = [v15 objectForKey:@"responseMode"];
  [v13 setResponseMode:v31];

  std::string::basic_string[abi:ne180100]<0>(v51, "randomSeed");
  id v32 = v15;
  if (v52 >= 0) {
    v33 = v51;
  }
  else {
    v33 = (void **)v51[0];
  }
  v34 = [NSString stringWithUTF8String:v33];
  v35 = [v32 objectForKeyedSubscript:v34];

  if (!v35)
  {
LABEL_19:
    uint64_t v40 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    std::operator+<char>();
    uint64_t v38 = std::string::append(&v53, "' because it is not a number");
    long long v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
    std::string::size_type v55 = v38->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v39;
    v38->__r_.__value_.__l.__size_ = 0;
    v38->__r_.__value_.__r.__words[2] = 0;
    v38->__r_.__value_.__r.__words[0] = 0;
    siri::dialogengine::Log::LogWithLevel((uint64_t)__p, 1u);
    goto LABEL_15;
  }
  if ((unint64_t)[v35 integerValue] >> 32)
  {
    std::operator+<char>();
    BOOL v36 = std::string::append(&v53, "' because it is out of range");
    long long v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
    std::string::size_type v55 = v36->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v37;
    v36->__r_.__value_.__l.__size_ = 0;
    v36->__r_.__value_.__r.__words[2] = 0;
    v36->__r_.__value_.__r.__words[0] = 0;
    siri::dialogengine::Log::LogWithLevel((uint64_t)__p, 1u);
LABEL_15:
    if (SHIBYTE(v55) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v53.__r_.__value_.__l.__data_);
    }
    goto LABEL_19;
  }
  uint64_t v40 = [v35 unsignedIntValue];
LABEL_20:

  [v13 setRandomSeed:v40];
  if (v52 < 0) {
    operator delete(v51[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(v51, "currentTime");
  id v41 = v32;
  if (v52 >= 0) {
    id v42 = v51;
  }
  else {
    id v42 = (void **)v51[0];
  }
  v43 = [NSString stringWithUTF8String:v42];
  v44 = [v41 objectForKeyedSubscript:v43];

  if (v44)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v45 = [v44 longValue];
      goto LABEL_33;
    }
    std::operator+<char>();
    v46 = std::string::append(&v53, "' because it is not a number");
    long long v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
    std::string::size_type v55 = v46->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v47;
    v46->__r_.__value_.__l.__size_ = 0;
    v46->__r_.__value_.__r.__words[2] = 0;
    v46->__r_.__value_.__r.__words[0] = 0;
    siri::dialogengine::Log::LogWithLevel((uint64_t)__p, 1u);
    if (SHIBYTE(v55) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v53.__r_.__value_.__l.__data_);
    }
  }
  uint64_t v45 = 0;
LABEL_33:

  [v13 setCurrentTime:v45];
  if ((v52 & 0x80000000) == 0)
  {
    if (!v17) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  operator delete(v51[0]);
  if (v17)
  {
LABEL_37:
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __87__CATCommonApi_ConfigureDEExecutor_parameters_globalParameters_catId_callback_options___block_invoke;
    v49[3] = &unk_1E651DB78;
    id v50 = v17;
    [v13 setCallback:v49];
  }
LABEL_38:
}

id __87__CATCommonApi_ConfigureDEExecutor_parameters_globalParameters_catId_callback_options___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_opt_new();
  }
  id v15 = v14;
  id v16 = [[CATParams alloc] initWithParams:v14];
  id v17 = *(id *)(a1 + 32);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v19 = [*(id *)(a1 + 32) valueForComputedProperty:v9 typeName:v10 propName:v11 params:v16];
  }
  else
  {
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"Callback object does not implement valueForComputedProperty:typeName:propName:params:", v18);
    uint64_t v19 = 0;
  }

  return v19;
}

+ (id)NSErrorFromString:(id)a3 errorCode:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v6
    || ([v6 isEqualToString:@"success"] & 1) != 0
    || ([v7 isEqualToString:&stru_1F2127290] & 1) != 0)
  {
    uint64_t v8 = 0;
  }
  else
  {
    v16[0] = *MEMORY[0x1E4F28568];
    id v10 = [MEMORY[0x1E4F28B50] mainBundle];
    id v11 = [v10 localizedStringForKey:v5 value:&stru_1F2127290 table:0];
    v17[0] = v11;
    v16[1] = *MEMORY[0x1E4F28588];
    id v12 = [MEMORY[0x1E4F28B50] mainBundle];
    id v13 = (void *)[v7 copy];
    id v14 = [v12 localizedStringForKey:v13 value:&stru_1F2127290 table:0];
    v17[1] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.siri.DialogEngine" code:0 userInfo:v15];
  }
  return v8;
}

@end