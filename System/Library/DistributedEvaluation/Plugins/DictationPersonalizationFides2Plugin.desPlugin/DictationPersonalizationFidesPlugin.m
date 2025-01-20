@interface DictationPersonalizationFidesPlugin
- (BOOL)_invalidated;
- (BOOL)_redecodeWithSession:(id)a3 selectedRecordInfos:(id)a4 selectedRecordDatas:(id)a5 personalizedLMPath:(id)a6 personalizedLMTrainingAsset:(id)a7 optIn:(BOOL)a8 result:(id)a9 error:(id *)a10;
- (BOOL)_selectRecordsWithSession:(id)a3 recordInfosOut:(id *)a4 recordDatasOut:(id *)a5 error:(id *)a6;
- (BOOL)_trainPersonalizedLMWithSession:(id)a3 directory:(id)a4 trainingAssetOut:(id *)a5 resultOut:(id *)a6 error:(id *)a7;
- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5;
- (id)_modelVersionForLanguage:(id)a3;
- (void)_invalidate;
- (void)performEvaluation:(id)a3;
- (void)performSystematicErrorEvaluation:(id)a3;
@end

@implementation DictationPersonalizationFidesPlugin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizer, 0);
  objc_storeStrong((id *)&self->_smtClient, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)shouldDownloadAttachmentWithURL:(id)a3 recipe:(id)a4 recordInfo:(id)a5
{
  return 1;
}

- (void)performEvaluation:(id)a3
{
  id v3 = a3;
  v4 = AFSiriLogContextFides;
  if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v122 = "-[DictationPersonalizationFidesPlugin performEvaluation:]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s Starting Fides evaluation for Dictation Personalization", buf, 0xCu);
    v4 = AFSiriLogContextFides;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = [v3 recipe];
    v7 = [v6 attachments];
    *(_DWORD *)buf = 136315394;
    v122 = "-[DictationPersonalizationFidesPlugin performEvaluation:]";
    __int16 v123 = 2112;
    *(void *)v124 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s Attachments: %@", buf, 0x16u);

    v4 = AFSiriLogContextFides;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = v4;
    v9 = [v3 matchingRecordSet];
    id v10 = [v9 count];
    *(_DWORD *)buf = 136315394;
    v122 = "-[DictationPersonalizationFidesPlugin performEvaluation:]";
    __int16 v123 = 2048;
    *(void *)v124 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%s Fides data size: %ld", buf, 0x16u);

    v4 = AFSiriLogContextFides;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v11 = v4;
    v12 = [v3 recipe];
    v13 = [v12 recipeUserInfo];
    *(_DWORD *)buf = 136315394;
    v122 = "-[DictationPersonalizationFidesPlugin performEvaluation:]";
    __int16 v123 = 2112;
    *(void *)v124 = v13;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%s Fides recipe parameters: %@", buf, 0x16u);
  }
  v14 = +[AFPreferences sharedPreferences];
  unsigned __int8 v15 = [v14 dictationIsEnabled];

  if (v15)
  {
    v16 = [v3 recipe];
    v17 = [v16 recipeUserInfo];

    int v18 = AFIsInternalInstall();
    v19 = +[AFPreferences sharedPreferences];
    v20 = (char *)[v19 siriDataSharingOptInStatus];

    BOOL v21 = v20 == (unsigned char *)&dword_0 + 1;
    v22 = [v17 objectForKeyedSubscript:@"reportWithFides"];
    unsigned int v23 = [v22 BOOLValue];

    v24 = [v17 objectForKeyedSubscript:@"disableMTELogging"];
    unsigned __int8 v25 = [v24 BOOLValue];

    v26 = AFSiriLogContextFides;
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v122 = "-[DictationPersonalizationFidesPlugin performEvaluation:]";
      __int16 v123 = 1024;
      *(_DWORD *)v124 = v18;
      *(_WORD *)&v124[4] = 1024;
      *(_DWORD *)&v124[6] = v20 == (unsigned char *)&dword_0 + 1;
      __int16 v125 = 1024;
      unsigned int v126 = v23;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "%s internal %d optIn %d reportWithFides %d", buf, 0x1Eu);
    }
    if (v20 != (unsigned char *)&dword_0 + 1)
    {
      NSErrorUserInfoKey v119 = NSLocalizedDescriptionKey;
      CFStringRef v120 = @"User not opted-in";
      v32 = +[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
      v33 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1502 userInfo:v32];

      [v3 completeWithError:v33 completionHandler:0];
      goto LABEL_76;
    }
    v27 = [v17 objectForKeyedSubscript:@"performSystematicErrorEvaluation"];
    unsigned int v28 = [v27 BOOLValue];

    if (v28)
    {
      v29 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v122 = "-[DictationPersonalizationFidesPlugin performEvaluation:]";
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "%s Performing systematic error evaluation instead of dictation personalization", buf, 0xCu);
      }
      [(DictationPersonalizationFidesPlugin *)self performSystematicErrorEvaluation:v3];
      goto LABEL_76;
    }
    v34 = [FidesSelfHelper alloc];
    v35 = [v17 objectForKeyedSubscript:@"experimentId"];
    v36 = [(FidesSelfHelper *)v34 initWithExperimentId:v35];

    [(FidesSelfHelper *)v36 logDictationPersonalizationExperimentStartedOrChanged];
    v37 = +[NSMutableDictionary dictionary];
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472;
    v105[2] = sub_6264;
    v105[3] = &unk_105F0;
    char v109 = v18;
    BOOL v110 = v21;
    char v111 = v23;
    id v38 = v3;
    id v106 = v38;
    id v93 = v37;
    id v107 = v93;
    v92 = v36;
    v108 = v92;
    unsigned __int8 v112 = v25;
    v91 = objc_retainBlock(v105);
    v94 = [v17 objectForKeyedSubscript:@"language"];
    [v93 setObject:v94 forKeyedSubscript:@"language"];
    v39 = [v17 objectForKeyedSubscript:@"experimentId"];
    [v93 setObject:v39 forKeyedSubscript:@"experimentId"];

    v40 = [v38 matchingRecordSet];
    v41 = [v40 nativeRecordInfo];
    v42 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v41 count]);
    [v93 setObject:v42 forKeyedSubscript:@"numAudio"];

    v43 = [(DictationPersonalizationFidesPlugin *)self _modelVersionForLanguage:v94];
    [(FidesSelfHelper *)v92 setDatapackVersion:v43];
    if (v94 && ![v43 length])
    {
      v49 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v122 = "-[DictationPersonalizationFidesPlugin performEvaluation:]";
        _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "%s PLM: No model installed", buf, 0xCu);
      }
      ((void (*)(void))v91[2])();
      goto LABEL_75;
    }
    v90 = [v17 objectForKeyedSubscript:@"modelVersions"];
    if (v90) {
      BOOL v44 = v94 != 0;
    }
    else {
      BOOL v44 = 0;
    }
    if (v44 && (!v43 || ([v90 containsObject:v43] & 1) == 0))
    {
      v48 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v122 = "-[DictationPersonalizationFidesPlugin performEvaluation:]";
        _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "%s PLM: Rejected model", buf, 0xCu);
      }
      ((void (*)(void))v91[2])();
      goto LABEL_74;
    }
    id v103 = 0;
    id v104 = 0;
    id v102 = 0;
    unsigned __int8 v45 = [(DictationPersonalizationFidesPlugin *)self _selectRecordsWithSession:v38 recordInfosOut:&v104 recordDatasOut:&v103 error:&v102];
    id v46 = v104;
    id v88 = v103;
    id v47 = v102;
    v87 = v47;
    v89 = v46;
    if (v47)
    {
      [v38 completeWithError:v47 completionHandler:0];
LABEL_73:

LABEL_74:
LABEL_75:

      goto LABEL_76;
    }
    v50 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v46 count]);
    [v93 setObject:v50 forKeyedSubscript:@"numSelectedAudio"];

    if ((v45 & 1) == 0)
    {
      ((void (*)(void))v91[2])();
      goto LABEL_73;
    }
    v51 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.speech-dictation-personalization", 0);
    queue = self->_queue;
    self->_queue = v51;

    v53 = [v38 activity];

    if (v53)
    {
      objc_initWeak(&location, self);
      v54 = [v38 activity];
      v99[1] = _NSConcreteStackBlock;
      v99[2] = (id)3221225472;
      v99[3] = sub_62FC;
      v99[4] = &unk_10578;
      objc_copyWeak(&v100, &location);
      uint64_t v86 = xpc_activity_add_eligibility_changed_handler();

      v55 = [v38 activity];
      BOOL should_defer = xpc_activity_should_defer(v55);

      if (should_defer)
      {
        v57 = AFSiriLogContextFides;
        if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v122 = "-[DictationPersonalizationFidesPlugin performEvaluation:]";
          _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "%s PLM: Deferred", buf, 0xCu);
        }
        NSErrorUserInfoKey v117 = NSLocalizedDescriptionKey;
        CFStringRef v118 = @"Deferred";
        v58 = +[NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
        v59 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1503 userInfo:v58];

        [v38 completeWithError:v59 completionHandler:0];
        objc_destroyWeak(&v100);
        objc_destroyWeak(&location);
        v60 = 0;
        goto LABEL_69;
      }
      objc_destroyWeak(&v100);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v86 = 0;
    }
    v61 = [v17 objectForKeyedSubscript:@"personalizedLM"];
    v62 = [v61 objectForKeyedSubscript:@"train"];
    unsigned int v63 = [v62 BOOLValue];

    if (v63)
    {
      uint64_t v64 = sub_63E4();
      id v65 = [objc_alloc((Class)CoreEmbeddedSpeechRecognizer) initWithDelegate:0 instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDBackground];
      [v65 removePersonalizedLMForFidesOnly:1];
      v84 = v65;
      id v98 = 0;
      v99[0] = 0;
      id v97 = 0;
      unsigned __int8 v83 = [(DictationPersonalizationFidesPlugin *)self _trainPersonalizedLMWithSession:v38 directory:v64 trainingAssetOut:v99 resultOut:&v98 error:&v97];
      id v85 = v99[0];
      id v66 = v98;
      id v67 = v97;
      if (v67)
      {
        v68 = v66;
        [v38 completeWithError:v67 completionHandler:0];
LABEL_65:

        v74 = v84;
        goto LABEL_66;
      }
      v68 = v66;
      [v93 setObject:v66 forKeyedSubscript:@"personalizedLM"];
      if ((v83 & 1) == 0)
      {
        ((void (*)(void))v91[2])();
        goto LABEL_65;
      }

      v60 = (void *)v64;
      v69 = v85;
    }
    else
    {
      v60 = 0;
      v69 = 0;
    }
    if ([(DictationPersonalizationFidesPlugin *)self _invalidated])
    {
      id v85 = v69;
      v70 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v122 = "-[DictationPersonalizationFidesPlugin performEvaluation:]";
        _os_log_impl(&dword_0, v70, OS_LOG_TYPE_INFO, "%s PLM: Deferred", buf, 0xCu);
      }
      NSErrorUserInfoKey v115 = NSLocalizedDescriptionKey;
      CFStringRef v116 = @"Deferred";
      v71 = +[NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
      uint64_t v72 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1503 userInfo:v71];

      v73 = v38;
      v74 = (void *)v72;
      [v73 completeWithError:v72 completionHandler:0];
    }
    else if ([v89 count] {
           && (id v96 = 0,
    }
               [(DictationPersonalizationFidesPlugin *)self _redecodeWithSession:v38 selectedRecordInfos:v89 selectedRecordDatas:v88 personalizedLMPath:v60 personalizedLMTrainingAsset:v69 optIn:1 result:v93 error:&v96], (id v75 = v96) != 0))
    {
      id v76 = v75;
      [v38 completeWithError:v75 completionHandler:0];
      v74 = v76;
      id v85 = v69;
    }
    else
    {
      if (![(DictationPersonalizationFidesPlugin *)self _invalidated])
      {
        ((void (*)(void))v91[2])();
        goto LABEL_67;
      }
      id v85 = v69;
      v77 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v122 = "-[DictationPersonalizationFidesPlugin performEvaluation:]";
        _os_log_impl(&dword_0, v77, OS_LOG_TYPE_INFO, "%s PLM: Deferred", buf, 0xCu);
      }
      NSErrorUserInfoKey v113 = NSLocalizedDescriptionKey;
      CFStringRef v114 = @"Deferred";
      v78 = +[NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
      uint64_t v79 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1503 userInfo:v78];

      v80 = v38;
      v74 = (void *)v79;
      [v80 completeWithError:v79 completionHandler:0];
    }
    uint64_t v64 = (uint64_t)v60;
LABEL_66:

    v60 = (void *)v64;
    v69 = v85;
LABEL_67:

    uint64_t v81 = v86;
    if (!v60)
    {
LABEL_70:
      if (v81) {
        xpc_activity_remove_eligibility_changed_handler();
      }

      goto LABEL_73;
    }
    id v82 = [objc_alloc((Class)CoreEmbeddedSpeechRecognizer) initWithDelegate:0 instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDBackground];
    [v82 removePersonalizedLMForFidesOnly:1];

LABEL_69:
    uint64_t v81 = v86;
    goto LABEL_70;
  }
  v30 = AFSiriLogContextFides;
  if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v122 = "-[DictationPersonalizationFidesPlugin performEvaluation:]";
    _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "%s PLM: Dictation disabled", buf, 0xCu);
  }
  NSErrorUserInfoKey v127 = NSLocalizedDescriptionKey;
  CFStringRef v128 = @"PLM: Dictation disabled";
  v31 = +[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
  v17 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:34 userInfo:v31];

  [v3 completeWithError:v17 completionHandler:0];
LABEL_76:
}

- (void)performSystematicErrorEvaluation:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextFides;
  if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s Starting systematic error evaluation in DictationPersonalizationFidesPlugin", (uint8_t *)&buf, 0xCu);
  }
  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.speech-recognition-systematic-error", 0);
  queue = self->_queue;
  val = self;
  self->_queue = v6;

  v8 = [v4 recipe];
  id v93 = [v8 recipeUserInfo];

  v9 = [v93 objectForKeyedSubscript:@"leftContextSize"];
  id v78 = [v9 integerValue];

  id v10 = [v93 objectForKeyedSubscript:@"rightContextSize"];
  id v77 = [v10 integerValue];

  v11 = [v93 objectForKeyedSubscript:@"recordLimit"];
  if ([v11 integerValue])
  {
    v12 = [v93 objectForKeyedSubscript:@"recordLimit"];
    id v90 = [v12 integerValue];
  }
  else
  {
    id v90 = &dword_0 + 1;
  }

  v13 = [v93 objectForKeyedSubscript:@"keepMTELogging"];
  unsigned __int8 v14 = [v13 BOOLValue];

  unsigned __int8 v15 = [v93 objectForKeyedSubscript:@"recognizedTTSASRShouldMatch"];
  unsigned __int8 v76 = [v15 BOOLValue];

  v16 = [v93 objectForKeyedSubscript:@"caseSensitive"];
  unsigned __int8 v75 = [v16 BOOLValue];

  v17 = [v93 objectForKeyedSubscript:@"skipLME"];
  [v17 BOOLValue];

  id v85 = [v93 objectForKeyedSubscript:@"wordSenseAccessList"];
  if (v85)
  {
    uint64_t v79 = +[NSSet setWithArray:](NSSet, "setWithArray:");
  }
  else
  {
    uint64_t v79 = 0;
  }
  int v18 = [FidesSelfHelper alloc];
  v19 = [v93 objectForKeyedSubscript:@"experimentId"];
  v20 = [(FidesSelfHelper *)v18 initWithExperimentId:v19];

  [(FidesSelfHelper *)v20 logUserEditExperimentStartedOrChanged];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v137 = 0x3032000000;
  v138 = sub_7750;
  v139 = sub_7760;
  id v140 = (id)objc_opt_new();
  v118[0] = _NSConcreteStackBlock;
  v118[1] = 3221225472;
  v118[2] = sub_7768;
  v118[3] = &unk_10550;
  v84 = v20;
  NSErrorUserInfoKey v119 = v84;
  p_long long buf = &buf;
  unsigned __int8 v122 = v14;
  id v83 = v4;
  id v120 = v83;
  id v82 = objc_retainBlock(v118);
  id v88 = [v93 objectForKeyedSubscript:@"language"];
  [*(id *)(*((void *)&buf + 1) + 40) setObject:v88 forKeyedSubscript:@"language"];
  BOOL v21 = [v93 objectForKeyedSubscript:@"experimentId"];
  [*(id *)(*((void *)&buf + 1) + 40) setObject:v21 forKeyedSubscript:@"experimentId"];

  v87 = [(DictationPersonalizationFidesPlugin *)self _modelVersionForLanguage:v88];
  [(FidesSelfHelper *)v84 setDatapackVersion:v87];
  if (!v88 || [v87 length])
  {
    uint64_t v81 = [v93 objectForKeyedSubscript:@"modelVersions"];
    if (v88 && v81 && (!v87 || ([v81 containsObject:v87] & 1) == 0))
    {
      v24 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v129 = 136315138;
        *(void *)&v129[4] = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "%s SEE: Rejected model", v129, 0xCu);
      }
      ((void (*)(void))v82[2])();
      goto LABEL_99;
    }
    id v117 = 0;
    id v116 = 0;
    id v115 = 0;
    unsigned __int8 v22 = [(DictationPersonalizationFidesPlugin *)self _selectRecordsWithSession:v83 recordInfosOut:&v117 recordDatasOut:&v116 error:&v115];
    id v94 = v117;
    id v96 = v116;
    id v23 = v115;
    v74 = v23;
    if (v23)
    {
      [v83 completeWithError:v23 completionHandler:0];
LABEL_98:

LABEL_99:
      goto LABEL_100;
    }
    if ((v22 & 1) == 0)
    {
      ((void (*)(void))v82[2])();
      goto LABEL_98;
    }
    v26 = [v94 allKeys];
    uint64_t v86 = objc_opt_new();
    v92 = objc_opt_new();
    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id obj = v26;
    id v27 = [obj countByEnumeratingWithState:&v111 objects:v135 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v112;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v112 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void *)(*((void *)&v111 + 1) + 8 * i);
          v31 = AFSiriLogContextFides;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = [v94 objectForKeyedSubscript:v30];
            *(_DWORD *)v129 = 136315394;
            *(void *)&v129[4] = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
            *(_WORD *)&v129[12] = 2112;
            *(void *)&v129[14] = v32;
            _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "%s record info: %@", v129, 0x16u);
          }
          v33 = [v96 objectForKeyedSubscript:v30];
          if (v33)
          {
            v34 = +[CESRFidesASRRecord recordFromData:v33];
            v35 = v34;
            if (v34)
            {
              v36 = [v34 correctedText];
              if ([v36 length])
              {
                id v37 = [v35 samplingRate];
                id v38 = AFSiriLogContextFides;
                if (v37 == &loc_3E80)
                {
                  if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v129 = 136315394;
                    *(void *)&v129[4] = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
                    *(_WORD *)&v129[12] = 2112;
                    *(void *)&v129[14] = v36;
                    _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "%s Retrieved corrected text: %@", v129, 0x16u);
                  }
                  if ([v92 count] < v90)
                  {
                    [v86 setObject:v33 forKeyedSubscript:v30];
                    [v92 setObject:v36 forKeyedSubscript:v30];
                  }
                }
                else
                {
                  v42 = AFSiriLogContextFides;
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    id v43 = [v35 samplingRate];
                    *(_DWORD *)v129 = 136315650;
                    *(void *)&v129[4] = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
                    *(_WORD *)&v129[12] = 2048;
                    *(void *)&v129[14] = v43;
                    *(_WORD *)&v129[22] = 2048;
                    v130 = (uint64_t (*)(uint64_t, uint64_t))&loc_3E80;
                    _os_log_error_impl(&dword_0, v42, OS_LOG_TYPE_ERROR, "%s Sampling rate does not match, record sampling rate: %lu, downsampling rate: %lu", v129, 0x20u);
                  }
                }
              }
              else
              {
                v41 = AFSiriLogContextFides;
                if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v129 = 136315138;
                  *(void *)&v129[4] = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
                  _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "%s No corrected text in record, skipping TTS ASR pipeline", v129, 0xCu);
                }
              }
            }
            else
            {
              v40 = AFSiriLogContextFides;
              if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v129 = 136315138;
                *(void *)&v129[4] = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
                _os_log_error_impl(&dword_0, v40, OS_LOG_TYPE_ERROR, "%s Unable to load localSpeechDESRecord", v129, 0xCu);
              }
            }
          }
          else
          {
            v39 = AFSiriLogContextFides;
            if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v129 = 136315138;
              *(void *)&v129[4] = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
              _os_log_error_impl(&dword_0, v39, OS_LOG_TYPE_ERROR, "%s Nil record data", v129, 0xCu);
            }
          }
        }
        id v27 = [obj countByEnumeratingWithState:&v111 objects:v135 count:16];
      }
      while (v27);
    }

    if (!v92 || ![v92 count])
    {
      v52 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v129 = 136315138;
        *(void *)&v129[4] = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
        _os_log_impl(&dword_0, v52, OS_LOG_TYPE_INFO, "%s No corrected text found in sampled dodML records, exiting...", v129, 0xCu);
      }
      ((void (*)(void))v82[2])();
      goto LABEL_97;
    }
    BOOL v44 = val->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_77F4;
    block[3] = &unk_104B0;
    block[4] = val;
    dispatch_sync(v44, block);
    unsigned __int8 v45 = [v83 activity];

    if (v45)
    {
      objc_initWeak(location, val);
      id v46 = [v83 activity];
      v108[5] = _NSConcreteStackBlock;
      v108[6] = 3221225472;
      v108[7] = sub_7864;
      v108[8] = &unk_10578;
      objc_copyWeak(&v109, location);
      uint64_t v91 = xpc_activity_add_eligibility_changed_handler();

      id v47 = [v83 activity];
      BOOL should_defer = xpc_activity_should_defer(v47);

      if (should_defer)
      {
        v49 = AFSiriLogContextFides;
        if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v129 = 136315138;
          *(void *)&v129[4] = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
          _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "%s SEE: Deferred", v129, 0xCu);
        }
        NSErrorUserInfoKey v133 = NSLocalizedDescriptionKey;
        CFStringRef v134 = @"Deferred";
        v50 = +[NSDictionary dictionaryWithObjects:&v134 forKeys:&v133 count:1];
        v51 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1503 userInfo:v50];

        [v83 completeWithError:v51 completionHandler:0];
        objc_destroyWeak(&v109);
        objc_destroyWeak(location);
LABEL_95:
        if (v91) {
          xpc_activity_remove_eligibility_changed_handler();
        }
LABEL_97:

        goto LABEL_98;
      }
      objc_destroyWeak(&v109);
      objc_destroyWeak(location);
    }
    else
    {
      uint64_t v91 = 0;
    }
    *(void *)v129 = 0;
    *(void *)&v129[8] = v129;
    *(void *)&v129[16] = 0x3032000000;
    v130 = sub_7750;
    v131 = sub_7760;
    id v132 = 0;
    id v53 = objc_alloc_init((Class)SpeechModelTrainingClient);
    v54 = v53;
    if (v53)
    {
      v108[0] = _NSConcreteStackBlock;
      v108[1] = 3221225472;
      v108[2] = sub_794C;
      v108[3] = &unk_105A0;
      v108[4] = v129;
      [v53 generateAudioWithTexts:v92 language:v88 completion:v108];
    }
    v55 = *(void **)(*(void *)&v129[8] + 40);
    if (v55 && [v55 count])
    {
      v89 = v54;
      if ([(DictationPersonalizationFidesPlugin *)val _invalidated])
      {
        v56 = AFSiriLogContextFides;
        if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
        {
          LODWORD(location[0]) = 136315138;
          *(id *)((char *)location + 4) = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
          _os_log_impl(&dword_0, v56, OS_LOG_TYPE_INFO, "%s SEE: Deferred", (uint8_t *)location, 0xCu);
        }
        NSErrorUserInfoKey v126 = NSLocalizedDescriptionKey;
        CFStringRef v127 = @"Deferred";
        v57 = +[NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
        id v58 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1503 userInfo:v57];

        [v83 completeWithError:v58 completionHandler:0];
      }
      else
      {
        v60 = +[NSMutableArray array];
        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        id v61 = v86;
        id v62 = [v61 countByEnumeratingWithState:&v104 objects:v125 count:16];
        if (v62)
        {
          uint64_t v63 = *(void *)v105;
          do
          {
            for (j = 0; j != v62; j = (char *)j + 1)
            {
              if (*(void *)v105 != v63) {
                objc_enumerationMutation(v61);
              }
              id v65 = [*(id *)(*(void *)&v129[8] + 40) objectForKeyedSubscript:*(void *)(*((void *)&v104 + 1) + 8 * (void)j)];
              BOOL v66 = v65 == 0;

              if (v66)
              {
                id v67 = AFSiriLogContextFides;
                if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
                {
                  LODWORD(location[0]) = 136315138;
                  *(id *)((char *)location + 4) = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
                  _os_log_impl(&dword_0, v67, OS_LOG_TYPE_INFO, "%s TTS failure when performing systematic error evaluation", (uint8_t *)location, 0xCu);
                }
                v68 = objc_opt_new();
                [v68 setValue:&off_11650 forKey:@"errorCode"];
                [v60 addObject:v68];
              }
            }
            id v62 = [v61 countByEnumeratingWithState:&v104 objects:v125 count:16];
          }
          while (v62);
        }

        recognizer = val->_recognizer;
        uint64_t v70 = *(void *)(*(void *)&v129[8] + 40);
        v97[0] = _NSConcreteStackBlock;
        v97[1] = 3221225472;
        v97[2] = sub_7A54;
        v97[3] = &unk_105C8;
        v99 = &buf;
        id v58 = v60;
        unsigned __int8 v102 = v76;
        unsigned __int8 v103 = v75;
        id v98 = v58;
        id v100 = v78;
        id v101 = v77;
        -[CoreEmbeddedSpeechRecognizer runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRate:caseSensitive:skipLME:wordSenseAccessListSet:completion:](recognizer, "runCorrectedTextEvaluationWithAudioDatas:recordDatas:language:samplingRate:caseSensitive:skipLME:wordSenseAccessListSet:completion:", v70, v61, v88, 16000, v79, v97);
        if ([(DictationPersonalizationFidesPlugin *)val _invalidated])
        {
          v71 = AFSiriLogContextFides;
          if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
          {
            LODWORD(location[0]) = 136315138;
            *(id *)((char *)location + 4) = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
            _os_log_impl(&dword_0, v71, OS_LOG_TYPE_INFO, "%s SEE: Deferred", (uint8_t *)location, 0xCu);
          }
          NSErrorUserInfoKey v123 = NSLocalizedDescriptionKey;
          CFStringRef v124 = @"Deferred";
          uint64_t v72 = +[NSDictionary dictionaryWithObjects:&v124 forKeys:&v123 count:1];
          v73 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1503 userInfo:v72];

          [v83 completeWithError:v73 completionHandler:0];
        }
        else
        {
          ((void (*)(void))v82[2])();
        }
      }
      v54 = v89;
    }
    else
    {
      v59 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_ERROR))
      {
        LODWORD(location[0]) = 136315138;
        *(id *)((char *)location + 4) = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
        _os_log_error_impl(&dword_0, v59, OS_LOG_TYPE_ERROR, "%s Failed to generate TTS audios", (uint8_t *)location, 0xCu);
      }
      ((void (*)(void))v82[2])();
    }

    _Block_object_dispose(v129, 8);
    goto LABEL_95;
  }
  unsigned __int8 v25 = AFSiriLogContextFides;
  if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v129 = 136315138;
    *(void *)&v129[4] = "-[DictationPersonalizationFidesPlugin performSystematicErrorEvaluation:]";
    _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "%s SEE: No model installed", v129, 0xCu);
  }
  ((void (*)(void))v82[2])();
LABEL_100:

  _Block_object_dispose(&buf, 8);
}

- (BOOL)_redecodeWithSession:(id)a3 selectedRecordInfos:(id)a4 selectedRecordDatas:(id)a5 personalizedLMPath:(id)a6 personalizedLMTrainingAsset:(id)a7 optIn:(BOOL)a8 result:(id)a9 error:(id *)a10
{
  BOOL v47 = a8;
  id v14 = a3;
  id v54 = a4;
  id v15 = a5;
  id v51 = a6;
  id v50 = a7;
  id v45 = a9;
  id v46 = v14;
  v16 = [v14 recipe];
  v49 = [v16 recipeUserInfo];

  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v18 = v15;
  id v19 = [v18 countByEnumeratingWithState:&v80 objects:v89 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v81;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v81 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = *(void *)(*((void *)&v80 + 1) + 8 * i);
        id v23 = [v54 objectForKeyedSubscript:v22];
        v24 = [v23 objectForKeyedSubscript:@"language"];

        unsigned __int8 v25 = [v17 objectForKeyedSubscript:v24];
        LODWORD(v23) = v25 == 0;

        if (v23)
        {
          id v26 = objc_alloc_init((Class)NSMutableDictionary);
          [v17 setObject:v26 forKeyedSubscript:v24];
        }
        id v27 = [v18 objectForKeyedSubscript:v22];
        uint64_t v28 = [v17 objectForKeyedSubscript:v24];
        [v28 setObject:v27 forKeyedSubscript:v22];
      }
      id v19 = [v18 countByEnumeratingWithState:&v80 objects:v89 count:16];
    }
    while (v19);
  }

  uint64_t v74 = 0;
  unsigned __int8 v75 = &v74;
  uint64_t v76 = 0x3032000000;
  id v77 = sub_7750;
  id v78 = sub_7760;
  id v79 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = sub_7750;
  uint64_t v72 = sub_7760;
  id v73 = objc_alloc_init((Class)NSMutableArray);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8884;
  block[3] = &unk_104B0;
  block[4] = self;
  dispatch_sync(queue, block);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v30 = v17;
  id v31 = [v30 countByEnumeratingWithState:&v63 objects:v88 count:16];
  if (v31)
  {
    uint64_t v52 = *(void *)v64;
    unsigned int v48 = !v47;
LABEL_12:
    uint64_t v32 = 0;
    while (1)
    {
      if (*(void *)v64 != v52) {
        objc_enumerationMutation(v30);
      }
      uint64_t v33 = *(void *)(*((void *)&v63 + 1) + 8 * v32);
      uint64_t v57 = 0;
      id v58 = &v57;
      uint64_t v59 = 0x3032000000;
      v60 = sub_7750;
      id v61 = sub_7760;
      id v62 = 0;
      v34 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        id v85 = "-[DictationPersonalizationFidesPlugin _redecodeWithSession:selectedRecordInfos:selectedRecordDatas:persona"
              "lizedLMPath:personalizedLMTrainingAsset:optIn:result:error:]";
        __int16 v86 = 2112;
        uint64_t v87 = v33;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "%s Run evaluation using embeddedspeech recognizer for language %@", buf, 0x16u);
      }
      char v35 = objc_opt_respondsToSelector();
      recognizer = self->_recognizer;
      if (v35) {
        break;
      }
      if (objc_opt_respondsToSelector())
      {
        v40 = self->_recognizer;
        id v37 = [v30 objectForKeyedSubscript:v33];
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_8AAC;
        v55[3] = &unk_10528;
        v55[4] = v33;
        v55[5] = &v57;
        v55[6] = &v74;
        v55[7] = &v68;
        [(CoreEmbeddedSpeechRecognizer *)v40 runEvaluationWithDESRecordDatas:v37 language:v33 recipe:v49 fidesPersonalizedLMPath:v51 fidesPersonalizedLMTrainingAsset:v50 scrubResult:v48 completion:v55];
        goto LABEL_21;
      }
LABEL_22:
      if (v58[5])
      {
        v42 = AFSiriLogContextFides;
        if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315138;
          id v85 = "-[DictationPersonalizationFidesPlugin _redecodeWithSession:selectedRecordInfos:selectedRecordDatas:perso"
                "nalizedLMPath:personalizedLMTrainingAsset:optIn:result:error:]";
          _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "%s Evaluation failure", buf, 0xCu);
        }
        if (a10) {
          *a10 = (id) v58[5];
        }
        _Block_object_dispose(&v57, 8);

        BOOL v41 = 0;
        goto LABEL_31;
      }
      _Block_object_dispose(&v57, 8);

      if (v31 == (id)++v32)
      {
        id v31 = [v30 countByEnumeratingWithState:&v63 objects:v88 count:16];
        if (v31) {
          goto LABEL_12;
        }
        goto LABEL_25;
      }
    }
    id v37 = [v30 objectForKeyedSubscript:v33];
    id v38 = [v46 recipe];
    v39 = [v38 attachments];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_88F4;
    v56[3] = &unk_10528;
    v56[4] = v33;
    v56[5] = &v57;
    v56[6] = &v74;
    v56[7] = &v68;
    LOBYTE(v44) = v48;
    [(CoreEmbeddedSpeechRecognizer *)recognizer runEvaluationWithDESRecordDatas:v37 language:v33 recipe:v49 attachments:v39 fidesPersonalizedLMPath:v51 fidesPersonalizedLMTrainingAsset:v50 scrubResult:v44 completion:v56];

LABEL_21:
    goto LABEL_22;
  }
LABEL_25:

  [v45 setObject:v75[5] forKeyedSubscript:@"audioResults"];
  [v45 setObject:v69[5] forKeyedSubscript:@"languageMetadata"];
  BOOL v41 = 1;
LABEL_31:
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  return v41;
}

- (BOOL)_trainPersonalizedLMWithSession:(id)a3 directory:(id)a4 trainingAssetOut:(id *)a5 resultOut:(id *)a6 error:(id *)a7
{
  v60 = self;
  id v8 = a3;
  id v65 = a4;
  long long v66 = v8;
  v9 = [v8 recipe];
  id v67 = [v9 recipeUserInfo];

  v69 = [v67 objectForKeyedSubscript:@"language"];
  id v68 = objc_alloc_init((Class)NSMutableDictionary);
  if ([v69 length])
  {
    *(void *)v89 = 0;
    *(void *)&v89[8] = v89;
    *(void *)&v89[16] = 0x3032000000;
    id v90 = sub_7750;
    uint64_t v91 = sub_7760;
    id v92 = 0;
    id v10 = [objc_alloc((Class)CoreEmbeddedSpeechRecognizer) initWithDelegate:0 instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDBackground];
    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_9934;
    v72[3] = &unk_10618;
    uint64_t v74 = v89;
    v12 = v11;
    id v73 = v12;
    [v10 getOfflineDictationStatusWithCompletion:v72];
    dispatch_time_t v13 = dispatch_time(0, 10000000000);
    dispatch_group_wait(v12, v13);
    id v14 = *(id *)(*(void *)&v89[8] + 40);
    id v15 = objc_alloc_init((Class)NSMutableSet);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v16 = v14;
    id v17 = [v16 countByEnumeratingWithState:&v75 objects:v93 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v76;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v76 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v75 + 1) + 8 * i);
          BOOL v21 = objc_msgSend(v16, "objectForKeyedSubscript:", v20, v60);
          int IsInstalled = AFOfflineDictationStatusStringIsInstalled();

          if (IsInstalled) {
            [v15 addObject:v20];
          }
        }
        id v17 = [v16 countByEnumeratingWithState:&v75 objects:v93 count:16];
      }
      while (v17);
    }

    id v23 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      v84 = "getPersonalizedLMUserLanguage";
      __int16 v85 = 2112;
      id v86 = v15;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "%s PLM: installedLanguages=%@", buf, 0x16u);
    }
    if (!objc_msgSend(v15, "count", v60))
    {
      unsigned __int8 v25 = 0;
      goto LABEL_33;
    }
    if ([v15 count] == (char *)&dword_0 + 1)
    {
      v24 = [v15 allObjects];
      unsigned __int8 v25 = [v24 firstObject];

      id v26 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        v84 = "getPersonalizedLMUserLanguage";
        __int16 v85 = 2112;
        id v86 = v25;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "%s PLM: Found one dictation language %@", buf, 0x16u);
      }
LABEL_33:

      _Block_object_dispose(v89, 8);
      [v68 setObject:v25 forKeyedSubscript:@"userLanguage"];
      id v37 = AFSiriLogContextFides;
      if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v93 = 136315394;
        *(void *)&v93[4] = "-[DictationPersonalizationFidesPlugin _trainPersonalizedLMWithSession:directory:trainingAss"
                             "etOut:resultOut:error:]";
        *(_WORD *)&v93[12] = 2112;
        *(void *)&v93[14] = v25;
        _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "%s PLM: user language: %@", v93, 0x16u);
      }
      if ([v25 isEqualToString:v69])
      {
        id v38 = [v66 recipe];
        id v39 = [v38 attachments];
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v40 = [v39 countByEnumeratingWithState:&v75 objects:v93 count:16];
        if (v40)
        {
          uint64_t v41 = *(void *)v76;
          while (2)
          {
            for (j = 0; j != v40; j = (char *)j + 1)
            {
              if (*(void *)v76 != v41) {
                objc_enumerationMutation(v39);
              }
              id v43 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
              uint64_t v44 = [v43 lastPathComponent];
              unsigned __int8 v45 = [v44 isEqualToString:@"lm-personalize.json"];

              if (v45)
              {
                id v40 = v43;
                goto LABEL_51;
              }
            }
            id v40 = [v39 countByEnumeratingWithState:&v75 objects:v93 count:16];
            if (v40) {
              continue;
            }
            break;
          }
        }
LABEL_51:

        BOOL v47 = [v40 path];

        id v48 = [v47 length];
        char v28 = v48 != 0;
        if (v48)
        {
          *(void *)id v93 = 0;
          *(void *)&v93[8] = v93;
          *(void *)&v93[16] = 0x3032000000;
          id v94 = sub_7750;
          v95 = sub_7760;
          id v96 = 0;
          *(void *)&long long v75 = 0;
          *((void *)&v75 + 1) = &v75;
          *(void *)&long long v76 = 0x3032000000;
          *((void *)&v76 + 1) = sub_7750;
          *(void *)&long long v77 = sub_7760;
          *((void *)&v77 + 1) = 0;
          v49 = AFSiriLogContextFides;
          if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v89 = 136315138;
            *(void *)&v89[4] = "-[DictationPersonalizationFidesPlugin _trainPersonalizedLMWithSession:directory:trainin"
                                 "gAssetOut:resultOut:error:]";
            _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "%s PLM: Client start training", v89, 0xCu);
          }
          id v50 = *(NSObject **)(v61 + 8);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_9994;
          block[3] = &unk_104B0;
          block[4] = v61;
          dispatch_sync(v50, block);
          id v51 = *(void **)(v61 + 24);
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472;
          v70[2] = sub_99F4;
          v70[3] = &unk_10500;
          v70[4] = v93;
          v70[5] = &v75;
          [v51 trainPersonalizedLMWithLanguage:v69 configuration:v47 asset:0 directory:v65 completion:v70];
          uint64_t v52 = *(void **)(*((void *)&v75 + 1) + 40);
          if (v52)
          {
            id v53 = AFSiriLogContextFides;
            if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v89 = 136315394;
              *(void *)&v89[4] = "-[DictationPersonalizationFidesPlugin _trainPersonalizedLMWithSession:directory:train"
                                   "ingAssetOut:resultOut:error:]";
              *(_WORD *)&v89[12] = 2112;
              *(void *)&v89[14] = v52;
              _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, "%s PLM: Client training failed: %@", v89, 0x16u);
              uint64_t v52 = *(void **)(*((void *)&v75 + 1) + 40);
            }
            id v54 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v52 code]);
            [v68 setObject:v54 forKeyedSubscript:@"trainErrorCode"];

            v55 = [*(id *)(*((void *)&v75 + 1) + 40) userInfo];
            v56 = [v55 objectForKeyedSubscript:NSLocalizedDescriptionKey];
            [v68 setObject:v56 forKeyedSubscript:@"trainErrorDescription"];
          }
          [v68 setObject:*(void *)(*(void *)&v93[8] + 40) forKeyedSubscript:@"train"];
          if (a6) {
            *a6 = v68;
          }
          if (a5)
          {
            *a5 = [*(id *)(*(void *)&v93[8] + 40) objectForKeyedSubscript:@"asset"];
          }
          _Block_object_dispose(&v75, 8);

          _Block_object_dispose(v93, 8);
        }
        else
        {
          uint64_t v57 = AFSiriLogContextFides;
          if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id v93 = 136315138;
            *(void *)&v93[4] = "-[DictationPersonalizationFidesPlugin _trainPersonalizedLMWithSession:directory:trainin"
                                 "gAssetOut:resultOut:error:]";
            _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "%s PLM: Recipe attachments missing configuration", v93, 0xCu);
          }
          if (a7)
          {
            NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
            CFStringRef v80 = @"PLM: Recipe attachments missing configuration";
            id v58 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
            *a7 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1501 userInfo:v58];
          }
        }
      }
      else
      {
        id v46 = AFSiriLogContextFides;
        if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)id v93 = 136315650;
          *(void *)&v93[4] = "-[DictationPersonalizationFidesPlugin _trainPersonalizedLMWithSession:directory:trainingA"
                               "ssetOut:resultOut:error:]";
          *(_WORD *)&v93[12] = 2112;
          *(void *)&v93[14] = v25;
          *(_WORD *)&v93[22] = 2112;
          id v94 = v69;
          _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "%s PLM: User language (%@) does not match recipe language (%@)", v93, 0x20u);
        }
        if (a6) {
          *a6 = v68;
        }
        char v28 = 1;
      }
      goto LABEL_68;
    }
    v29 = +[AFPreferences sharedPreferences];
    id v30 = [v29 languageCode];

    id v31 = AFOfflineDictationLanguageForKeyboardLanguage();
    uint64_t v32 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      v84 = "getPersonalizedLMUserLanguage";
      __int16 v85 = 2112;
      id v86 = v30;
      __int16 v87 = 2112;
      id v88 = v31;
      _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "%s PLM: Trying Siri language %@ result %@", buf, 0x20u);
    }
    if ([v31 length])
    {
      uint64_t v33 = v30;
    }
    else
    {
      v34 = +[NSLocale currentLocale];
      uint64_t v33 = [v34 localeIdentifier];

      AFOfflineDictationLanguageForKeyboardLanguage();
      id v35 = (id)objc_claimAutoreleasedReturnValue();

      v36 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315650;
        v84 = "getPersonalizedLMUserLanguage";
        __int16 v85 = 2112;
        id v86 = v33;
        __int16 v87 = 2112;
        id v88 = v35;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "%s PLM: Trying system language %@ result %@", buf, 0x20u);
      }
      if (![v35 length])
      {
        unsigned __int8 v25 = 0;
        goto LABEL_32;
      }
      id v31 = v35;
    }
    id v35 = v31;
    unsigned __int8 v25 = v35;
LABEL_32:

    goto LABEL_33;
  }
  id v27 = AFSiriLogContextFides;
  if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v93 = 136315138;
    *(void *)&v93[4] = "-[DictationPersonalizationFidesPlugin _trainPersonalizedLMWithSession:directory:trainingAssetOu"
                         "t:resultOut:error:]";
    _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "%s PLM: Recipe missing language", v93, 0xCu);
  }
  if (a7)
  {
    NSErrorUserInfoKey v81 = NSLocalizedDescriptionKey;
    CFStringRef v82 = @"PLM: Recipe missing language";
    unsigned __int8 v25 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    +[NSError errorWithDomain:kAFAssistantErrorDomain code:1501 userInfo:v25];
    char v28 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_68:

    goto LABEL_69;
  }
  char v28 = 0;
LABEL_69:

  return v28;
}

- (BOOL)_selectRecordsWithSession:(id)a3 recordInfosOut:(id *)a4 recordDatasOut:(id *)a5 error:(id *)a6
{
  id v6 = a3;
  v7 = [v6 recipe];
  id v8 = [v7 recipeUserInfo];

  v9 = [v8 objectForKeyedSubscript:@"minAudio"];
  id v36 = [v9 unsignedIntegerValue];

  id v10 = [v8 objectForKeyedSubscript:@"maxAudio"];
  id v44 = [v10 unsignedIntegerValue];

  id v40 = v8;
  v11 = [v8 objectForKeyedSubscript:@"language"];
  id v43 = v6;
  v12 = [v6 matchingRecordSet];
  dispatch_time_t v13 = [v12 nativeRecordInfo];

  unsigned __int8 v45 = v13;
  id v14 = [v13 allKeys];
  id v15 = [v14 mutableCopy];

  id v16 = (char *)[v15 count];
  if ((unint64_t)v16 >= 2)
  {
    do
    {
      unint64_t v17 = (unint64_t)(v16 - 1);
      [v15 exchangeObjectAtIndex:v16 - 1 withObjectAtIndex:arc4random_uniform((uint32_t)v16)];
      id v16 = (char *)v17;
    }
    while (v17 > 1);
  }
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  id v41 = objc_alloc_init((Class)NSMutableDictionary);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v15;
  id v19 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v48;
LABEL_5:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v48 != v21) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(void **)(*((void *)&v47 + 1) + 8 * v22);
      if (objc_msgSend(v18, "count", v36) >= v44) {
        break;
      }
      v24 = [v45 objectForKeyedSubscript:v23];
      unsigned __int8 v25 = v24;
      if (!v11
        || ([v24 objectForKeyedSubscript:@"language"],
            id v26 = objc_claimAutoreleasedReturnValue(),
            unsigned int v27 = [v11 isEqualToString:v26],
            v26,
            v27))
      {
        char v28 = [v43 matchingRecordSet];
        id v46 = 0;
        v29 = [v28 nativeRecordDataForRecordUUID:v23 error:&v46];
        id v30 = v46;

        if (v29)
        {
          id v31 = [v23 UUIDString];
          [v18 setObject:v25 forKeyedSubscript:v31];
          [v41 setObject:v29 forKeyedSubscript:v31];
        }
        else
        {
          uint64_t v32 = AFSiriLogContextFides;
          if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315394;
            uint64_t v52 = "-[DictationPersonalizationFidesPlugin _selectRecordsWithSession:recordInfosOut:recordDatasOut:error:]";
            __int16 v53 = 2112;
            id v54 = v30;
            _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "%s Nil record data: %@", buf, 0x16u);
          }
        }
      }
      if (v20 == (id)++v22)
      {
        id v20 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v20) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  if (a4) {
    *a4 = v18;
  }
  if (a5) {
    *a5 = v41;
  }
  id v33 = objc_msgSend(v18, "count", v36);
  BOOL v34 = (unint64_t)v33 >= v37;

  return v34;
}

- (id)_modelVersionForLanguage:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [objc_alloc((Class)CoreEmbeddedSpeechRecognizer) initWithDelegate:0 instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDBackground];
    id v5 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v3 assetType:3];
    id v13 = 0;
    id v6 = [v4 modelPropertiesForAssetConfig:v5 error:&v13];
    id v7 = v13;
    [v4 invalidate];
    id v8 = (void *)AFSiriLogContextFides;
    if (os_log_type_enabled(AFSiriLogContextFides, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      id v10 = [v6 modelVersion];
      *(_DWORD *)long long buf = 136315906;
      id v15 = "-[DictationPersonalizationFidesPlugin _modelVersionForLanguage:]";
      __int16 v16 = 2112;
      id v17 = v3;
      __int16 v18 = 2112;
      id v19 = v10;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%s language: %@ modelVersion: %@ error: %@", buf, 0x2Au);
    }
    v11 = [v6 modelVersion];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_invalidated
{
  queue = self->_queue;
  if (!queue) {
    __assert_rtn("-[DictationPersonalizationFidesPlugin _invalidated]", "DictationPersonalizationFidesPlugin.m", 158, "_queue");
  }
  dispatch_assert_queue_not_V2(queue);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v4 = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_A14C;
  v7[3] = &unk_104D8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)_invalidate
{
  queue = self->_queue;
  if (!queue) {
    __assert_rtn("-[DictationPersonalizationFidesPlugin _invalidate]", "DictationPersonalizationFidesPlugin.m", 148, "_queue");
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A1F8;
  block[3] = &unk_104B0;
  block[4] = self;
  dispatch_async(queue, block);
}

@end