@interface LSRLanguageModel
+ (BOOL)createAppLmLmeProfileWithLanguage:(id)a3 modelRoot:(id)a4 customPronsData:(id)a5 newOovs:(id)a6 writeToVocabFile:(id)a7;
+ (id)_userProfileWithModelRoot:(id)a3 language:(id)a4;
+ (void)initialize;
- (BOOL)addProns:(id)a3 forWord:(id)a4;
- (BOOL)appLmNeedsRebuild:(id)a3 language:(id)a4 error:(id *)a5;
- (LSRLanguageModel)initWithAssetPath:(id)a3;
- (LSRLanguageModel)initWithLocale:(id)a3 clientID:(id)a4;
- (id)createSpeechProfileFromOovs:(id)a3 customProns:(id)a4 language:(id)a5;
- (id)deserializeNgramCountsData:(id)a3;
- (id)metrics;
- (id)ngramCountsSerializeData;
- (id)oovWordsAndFrequenciesInNgramCount;
- (id)oovsFromSentenceAddedToNgramCounts:(id)a3;
- (int64_t)lmeThreshold;
- (void)addSentenceToNgramCounts:(id)a3;
- (void)createNgramCountsArtifactFromPhraseCountArtifact:(id)a3 saveTo:(id)a4;
- (void)createPhraseCountArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 saveTo:(id)a6;
- (void)trainAppLmFromNgramCountsArtifact:(id)a3 forApp:(id)a4 language:(id)a5 appLmArtifact:(id *)a6 vocabFile:(id *)a7;
- (void)trainAppLmFromNgramsSerializedData:(id)a3 customPronsData:(id)a4 language:(id)a5 writeToAppLmDir:(id *)a6 vocabFile:(id *)a7;
- (void)trainAppLmFromPlainTextAndWriteToAppDirectory:(id *)a3 vocabFile:(id *)a4;
@end

@implementation LSRLanguageModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_localeCode, 0);
  objc_storeStrong((id *)&self->_recognizerConfigFilePath, 0);

  objc_storeStrong((id *)&self->_appLmData, 0);
}

- (BOOL)appLmNeedsRebuild:(id)a3 language:(id)a4 error:(id *)a5
{
  id v6 = a3;
  v7 = [v6 path];
  unsigned int v8 = +[_EARArtifact isValid:v7];

  if (v8)
  {
    id v9 = objc_alloc((Class)_EARAppLmArtifact);
    v10 = [v6 path];
    id v11 = [v9 initWithPath:v10];

    if (v11) {
      unsigned int v12 = [v11 isAdaptableToSpeechModelVersion:self->_modelVersion locale:self->_localeCode] ^ 1;
    }
    else {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (void)trainAppLmFromNgramCountsArtifact:(id)a3 forApp:(id)a4 language:(id)a5 appLmArtifact:(id *)a6 vocabFile:(id *)a7
{
  id v68 = a3;
  id v11 = (__CFString *)a4;
  id v12 = a5;
  v103[0] = kSFCoreAnalyticsLanguageKey;
  v103[1] = kSFCoreAnalyticsAppnameKey;
  CFStringRef modelVersion = @"<unknown>";
  if (v11) {
    CFStringRef v14 = v11;
  }
  else {
    CFStringRef v14 = @"<unknown>";
  }
  v67 = v12;
  v104[0] = v12;
  v104[1] = v14;
  v103[2] = kSFCoreAnalyticsModelVersionKey;
  if (self->_modelVersion) {
    CFStringRef modelVersion = (const __CFString *)self->_modelVersion;
  }
  v104[2] = modelVersion;
  v15 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:3];
  v16 = SFAnalyticsEventTypeGetName();
  v90 = _NSConcreteStackBlock;
  uint64_t v91 = 3221225472;
  v92 = sub_100030888;
  v93 = &unk_100059D20;
  id v17 = v15;
  id v94 = v17;
  AnalyticsSendEventLazy();

  v18 = +[NSProcessInfo processInfo];
  [v18 systemUptime];
  double v20 = v19;

  v21 = [v68 path];
  recognizerConfigFilePath = self->_recognizerConfigFilePath;
  v23 = [*a6 path];
  unsigned __int8 v24 = +[_EARAppLmArtifact transitionArtifactAt:v21 toStage:5 configPath:recognizerConfigFilePath dataRoot:0 estimationRoot:0 minimize:1 saveTo:v23];

  v25 = +[NSProcessInfo processInfo];
  [v25 systemUptime];
  double v27 = v26;

  double v28 = v27 - v20;
  if (v24)
  {
    id v29 = objc_alloc((Class)_EARAppLmArtifact);
    v30 = [v68 path];
    id v31 = [v29 initWithPath:v30];

    if (v31)
    {
      v32 = +[NSProcessInfo processInfo];
      [v32 systemUptime];
      double v34 = v33;

      v35 = [v31 loadCustomPronData:self->_recognizerConfigFilePath dataRoot:0];
      v36 = +[NSProcessInfo processInfo];
      [v36 systemUptime];
      double v38 = v37;

      if (v35)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v100 = sub_100030C34;
        v101 = sub_100030C44;
        id v102 = objc_alloc_init((Class)NSMutableDictionary);
        if ([v35 isValid])
        {
          v39 = [v35 getProns];
          v74[0] = _NSConcreteStackBlock;
          v74[1] = 3221225472;
          v74[2] = sub_100030C4C;
          v74[3] = &unk_100059B40;
          v74[4] = buf;
          [v39 enumerateObjectsUsingBlock:v74];
        }
        else
        {
          v39 = SFLogConnection;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v46 = [v35 validationError];
            *(_DWORD *)v95 = 136315394;
            v96 = "-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
            __int16 v97 = 2112;
            id v98 = v46;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s Artifact contained invalid custom prons; skipping. %@",
              v95,
              0x16u);
          }
        }

        id v47 = objc_alloc((Class)_EARAppLmArtifact);
        v48 = [*a6 path];
        id v65 = [v47 initWithPath:v48];

        if (v65)
        {
          v49 = [v65 loadOovs];
          if (!v49)
          {
            v50 = SFLogConnection;
            if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v95 = 136315138;
              v96 = "-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%s Could not get OOVs from artifact", v95, 0xCu);
            }
            v49 = &__NSArray0__struct;
          }
          v51 = +[NSProcessInfo processInfo];
          [v51 systemUptime];
          double v53 = v52;

          v54 = [(LSRLanguageModel *)self createSpeechProfileFromOovs:v49 customProns:*(void *)(*(void *)&buf[8] + 40) language:v67];
          v55 = +[NSProcessInfo processInfo];
          [v55 systemUptime];
          double v57 = v56;

          if (v54)
          {
            [v54 writeToURL:*a7 atomically:0];
            v58 = SFLogConnection;
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              v59 = [*a7 path];
              *(_DWORD *)v95 = 136315394;
              v96 = "-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
              __int16 v97 = 2112;
              id v98 = v59;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "%s Wrote profile data to file:%@", v95, 0x16u);
            }
            v60 = SFAnalyticsEventTypeGetName();
            v61 = v69;
            v69[0] = _NSConcreteStackBlock;
            v69[1] = 3221225472;
            v69[2] = sub_100030F74;
            v69[3] = &unk_100059B68;
            v69[4] = v17;
            v69[5] = v31;
            *(double *)&v69[6] = v28;
            *(double *)&v69[7] = v38 - v34;
            *(double *)&v69[8] = v57 - v53;
            *(double *)&v69[9] = v20;
            AnalyticsSendEventLazy();
          }
          else
          {
            *a7 = 0;
            v60 = SFAnalyticsEventTypeGetName();
            v61 = v70;
            v70[0] = _NSConcreteStackBlock;
            v70[1] = 3221225472;
            v70[2] = sub_100030E24;
            v70[3] = &unk_100059B18;
            v70[4] = v17;
            v70[5] = v31;
            *(double *)&v70[6] = v20;
            AnalyticsSendEventLazy();
          }
        }
        else
        {
          v62 = SFLogConnection;
          if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
          {
            id v63 = *a6;
            *(_DWORD *)v95 = 136315394;
            v96 = "-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
            __int16 v97 = 2112;
            id v98 = v63;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "%s Failed to load language model artifact at: %@", v95, 0x16u);
          }
          *a7 = 0;
          v64 = SFAnalyticsEventTypeGetName();
          v70[7] = _NSConcreteStackBlock;
          v70[8] = 3221225472;
          v70[9] = sub_100030CD4;
          v70[10] = &unk_100059B18;
          id v71 = v17;
          id v72 = v31;
          double v73 = v20;
          AnalyticsSendEventLazy();

          v49 = v71;
        }

        _Block_object_dispose(buf, 8);
      }
      else
      {
        v44 = SFLogConnection;
        if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = "-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s Failed to load custom prons from artifact", buf, 0xCu);
        }
        *a7 = 0;
        v45 = SFAnalyticsEventTypeGetName();
        v74[5] = _NSConcreteStackBlock;
        v74[6] = 3221225472;
        v74[7] = sub_100030AE4;
        v74[8] = &unk_100059B18;
        id v75 = v17;
        id v76 = v31;
        double v77 = v20;
        AnalyticsSendEventLazy();

        v35 = 0;
      }
    }
    else
    {
      v42 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v68;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%s Failed to read ngram counts artifact at: %@", buf, 0x16u);
      }
      *a7 = 0;
      v43 = SFAnalyticsEventTypeGetName();
      v78 = _NSConcreteStackBlock;
      uint64_t v79 = 3221225472;
      v80 = sub_1000309A8;
      v81 = &unk_100059AF0;
      id v82 = v17;
      double v83 = v20;
      AnalyticsSendEventLazy();

      v35 = v82;
    }
  }
  else
  {
    v40 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[LSRLanguageModel trainAppLmFromNgramCountsArtifact:forApp:language:appLmArtifact:vocabFile:]";
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%s Failed to train app-specific LM", buf, 0xCu);
    }
    *a7 = 0;
    *a6 = 0;
    v41 = SFAnalyticsEventTypeGetName();
    v84 = _NSConcreteStackBlock;
    uint64_t v85 = 3221225472;
    v86 = sub_100030890;
    v87 = &unk_100059AF0;
    id v88 = v17;
    double v89 = v27 - v20;
    AnalyticsSendEventLazy();
  }
}

- (id)createSpeechProfileFromOovs:(id)a3 customProns:(id)a4 language:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  recognizerConfigFilePath = self->_recognizerConfigFilePath;
  id v11 = a5;
  id v12 = [(NSString *)recognizerConfigFilePath stringByDeletingLastPathComponent];
  v13 = +[LSRLanguageModel _userProfileWithModelRoot:v12 language:v11];

  if (v13)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100031568;
    v27[3] = &unk_100059A50;
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    id v28 = v14;
    [v8 enumerateObjectsUsingBlock:v27];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000315E0;
    v25[3] = &unk_100059AC8;
    id v15 = v14;
    id v26 = v15;
    [v9 enumerateKeysAndObjectsUsingBlock:v25];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000315EC;
    v23[3] = &unk_100059AC8;
    id v16 = v13;
    id v24 = v16;
    [v15 enumerateKeysAndObjectsUsingBlock:v23];
    id v17 = [v16 dataProfile];
    v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      v21 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[LSRLanguageModel createSpeechProfileFromOovs:customProns:language:]";
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Failed to create user profile", buf, 0xCu);
      }
    }
  }
  else
  {
    double v20 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[LSRLanguageModel createSpeechProfileFromOovs:customProns:language:]";
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Failed to create user profile object", buf, 0xCu);
    }
    v18 = 0;
  }

  return v18;
}

- (void)createNgramCountsArtifactFromPhraseCountArtifact:(id)a3 saveTo:(id)a4
{
  id v6 = a4;
  id v9 = [a3 path];
  recognizerConfigFilePath = self->_recognizerConfigFilePath;
  id v8 = [v6 path];

  +[_EARAppLmArtifact transitionArtifactAt:v9 toStage:4 configPath:recognizerConfigFilePath dataRoot:0 estimationRoot:0 minimize:1 saveTo:v8];
}

- (void)createPhraseCountArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 saveTo:(id)a6
{
  localeCode = self->_localeCode;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v15 = [a4 path];
  v13 = [v11 path];

  id v14 = [v10 path];

  +[_EARAppLmArtifact createPhraseCountsArtifact:v12 version:@"1.0" locale:localeCode rawPhraseCountsPath:v15 customPronunciationsPath:v13 saveTo:v14];
}

- (void)trainAppLmFromNgramsSerializedData:(id)a3 customPronsData:(id)a4 language:(id)a5 writeToAppLmDir:(id *)a6 vocabFile:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v39 = a5;
  id v14 = +[_EARLmModel2 deserializeModelData:v12];
  id v15 = [v14 objectForKeyedSubscript:EARModelOovsKey];
  id v16 = [v14 objectForKeyedSubscript:EARModelTrainingDataKey];
  id v17 = +[NSCharacterSet newlineCharacterSet];
  v18 = [v16 componentsSeparatedByCharactersInSet:v17];

  if (!a7)
  {
LABEL_5:
    double v20 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s No oovs in training data", buf, 0xCu);
    }
    goto LABEL_11;
  }
  id v19 = [v15 count];
  if (!v13 && !v19)
  {
    *a7 = 0;
    goto LABEL_5;
  }
  id v21 = *a7;
  v22 = [(NSString *)self->_recognizerConfigFilePath stringByDeletingLastPathComponent];
  unsigned __int8 v23 = +[LSRLanguageModel createAppLmLmeProfileWithLanguage:v39 modelRoot:v22 customPronsData:v13 newOovs:v15 writeToVocabFile:v21];

  if ((v23 & 1) == 0)
  {

    double v38 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:]";
      _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s Failed to write LME", buf, 0xCu);
    }

    goto LABEL_33;
  }
  id v24 = SFLogConnection;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = [v21 path];
    *(_DWORD *)buf = 136315394;
    v46 = "-[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:]";
    __int16 v47 = 2112;
    id v48 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Successfully wrote LME: %@", buf, 0x16u);
  }
LABEL_11:
  [(_EARAppLmData *)self->_appLmData setInputFormat:2];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v26 = v18;
  id v27 = [v26 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v41;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(v26);
        }
        [(_EARAppLmData *)self->_appLmData addNgramCountWithType:0 content:*(void *)(*((void *)&v40 + 1) + 8 * i)];
      }
      id v27 = [v26 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v27);
  }

  v30 = +[_EARLmBuilder buildLmWithConfig:self->_recognizerConfigFilePath root:@"app-lm.NGRAM" data:self->_appLmData dir:&stru_10005A2E0 shouldStop:0];
  if (v30)
  {
    if (!a6)
    {
LABEL_24:

      appLmData = self->_appLmData;
      self->_appLmData = 0;

      goto LABEL_33;
    }
    id v31 = *a6;
    v32 = [v31 path];
    unsigned __int8 v33 = [v30 writeToDirectory:v32];

    if (v33)
    {
      double v34 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:]";
        __int16 v47 = 2112;
        id v48 = v31;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s Successfully wrote app-lm to path=%@", buf, 0x16u);
      }

      goto LABEL_24;
    }

    double v37 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:]";
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s Failed to write trained AppLm", buf, 0xCu);
    }
  }
  else
  {
    v36 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LSRLanguageModel trainAppLmFromNgramsSerializedData:customPronsData:language:writeToAppLmDir:vocabFile:]";
      _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s Failed to train from ngram counts", buf, 0xCu);
    }
  }
LABEL_33:
}

- (id)metrics
{
  return [(_EARAppLmData *)self->_appLmData metrics];
}

- (int64_t)lmeThreshold
{
  return (int64_t)[(_EARAppLmData *)self->_appLmData lmeThreshold];
}

- (id)deserializeNgramCountsData:(id)a3
{
  return +[_EARLmModel2 deserializeModelData:a3];
}

- (id)ngramCountsSerializeData
{
  id v3 = [objc_alloc((Class)_EARSpeechModelInfo) initWithConfig:self->_recognizerConfigFilePath];
  [(_EARAppLmData *)self->_appLmData setInputFormat:1];
  v4 = +[_EARLmBuilder generateNgramCountsWithConfig:self->_recognizerConfigFilePath root:@"app-lm.NGRAM" data:self->_appLmData];
  id v5 = [objc_alloc((Class)_EARNgramLmModel) initWithConfiguration:self->_recognizerConfigFilePath root:@"app-lm.NGRAM"];
  id v6 = [v3 language];
  v7 = [(LSRLanguageModel *)self oovWordsAndFrequenciesInNgramCount];
  id v8 = [v7 allKeys];
  id v9 = [v5 serializedModelWithLanguage:v6 modelData:v4 oovs:v8];

  id v10 = SFLogConnection;
  if (v9)
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      id v13 = "-[LSRLanguageModel ngramCountsSerializeData]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Successfully serialized ngram counts and OOVs", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315138;
    id v13 = "-[LSRLanguageModel ngramCountsSerializeData]";
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Failed to serialize ngram counts data", (uint8_t *)&v12, 0xCu);
  }

  return v9;
}

- (void)trainAppLmFromPlainTextAndWriteToAppDirectory:(id *)a3 vocabFile:(id *)a4
{
  [(_EARAppLmData *)self->_appLmData setInputFormat:1];
  v7 = +[_EARLmBuilder buildLmWithConfig:self->_recognizerConfigFilePath root:@"app-lm.NGRAM" data:self->_appLmData dir:&stru_10005A2E0 shouldStop:0];
  id v8 = SFLogConnection;
  if (!v7)
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      id v16 = "-[LSRLanguageModel trainAppLmFromPlainTextAndWriteToAppDirectory:vocabFile:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Failed to train model successfully", (uint8_t *)&v15, 0xCu);
      if (!a3) {
        goto LABEL_13;
      }
    }
    else if (!a3)
    {
      goto LABEL_13;
    }
    *a3 = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315138;
    id v16 = "-[LSRLanguageModel trainAppLmFromPlainTextAndWriteToAppDirectory:vocabFile:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Model trained successfully!", (uint8_t *)&v15, 0xCu);
    id v8 = SFLogConnection;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v12 = *a3;
    id v13 = v8;
    id v14 = [v12 path];
    int v15 = 136315394;
    id v16 = "-[LSRLanguageModel trainAppLmFromPlainTextAndWriteToAppDirectory:vocabFile:]";
    __int16 v17 = 2112;
    v18 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Writing to: %@", (uint8_t *)&v15, 0x16u);
  }
  id v9 = [*a3 path];
  unsigned __int8 v10 = [v7 writeToDirectory:v9];

  if ((v10 & 1) == 0)
  {
    id v11 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      id v16 = "-[LSRLanguageModel trainAppLmFromPlainTextAndWriteToAppDirectory:vocabFile:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Write process failed", (uint8_t *)&v15, 0xCu);
    }
    a4 = a3;
    goto LABEL_14;
  }
LABEL_13:
  if (a4) {
LABEL_14:
  }
    *a4 = 0;
}

- (id)oovWordsAndFrequenciesInNgramCount
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(_EARAppLmData *)self->_appLmData orderedOovs];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned __int8 v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 frequency]);
        id v11 = [v9 orthography];
        [v3 setObject:v10 forKey:v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = [v3 copy];

  return v12;
}

- (id)oovsFromSentenceAddedToNgramCounts:(id)a3
{
  return [(_EARAppLmData *)self->_appLmData addOovTokensFromSentence:a3];
}

- (BOOL)addProns:(id)a3 forWord:(id)a4
{
  return [(_EARAppLmData *)self->_appLmData setXsampaProns:a3 forWord:a4];
}

- (void)addSentenceToNgramCounts:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUUID UUID];
  id v6 = [v5 UUIDString];

  [(_EARAppLmData *)self->_appLmData addSentenceWithType:0 uuid:v6 content:v4];
}

- (LSRLanguageModel)initWithAssetPath:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LSRLanguageModel;
  id v5 = [(LSRLanguageModel *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringByAppendingPathComponent:@"mini.json"];
    recognizerConfigFilePath = v5->_recognizerConfigFilePath;
    v5->_recognizerConfigFilePath = (NSString *)v6;

    id v8 = (_EARAppLmData *)[objc_alloc((Class)_EARAppLmData) initWithConfiguration:v5->_recognizerConfigFilePath recognizerConfigPath:v5->_recognizerConfigFilePath];
    appLmData = v5->_appLmData;
    v5->_appLmData = v8;

    if (!v5->_appLmData)
    {
      v18 = 0;
      goto LABEL_6;
    }
    id v10 = [objc_alloc((Class)_EARSpeechRecognizer) initWithConfiguration:v5->_recognizerConfigFilePath];
    id v11 = [v10 modelInfo];
    id v12 = [v11 language];
    uint64_t v13 = +[SFUtilities stringByReplacingHyphensWithUnderscores:v12];
    localeCode = v5->_localeCode;
    v5->_localeCode = (NSString *)v13;

    long long v15 = [v10 modelInfo];
    uint64_t v16 = [v15 version];
    CFStringRef modelVersion = v5->_modelVersion;
    v5->_CFStringRef modelVersion = (NSString *)v16;
  }
  v18 = v5;
LABEL_6:

  return v18;
}

- (LSRLanguageModel)initWithLocale:(id)a3 clientID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)LSRLanguageModel;
  id v8 = [(LSRLanguageModel *)&v16 init];
  if (v8)
  {
    id v9 = +[SFUtilities localeCodeForLocale:v6];
    uint64_t v10 = +[SFUtilities stringByReplacingHyphensWithUnderscores:v9];
    localeCode = v8->_localeCode;
    v8->_localeCode = (NSString *)v10;

    id v12 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v8->_localeCode assetType:3];
    uint64_t v13 = +[SFEntitledAssetManager sharedInstance];
    long long v14 = [v13 installedAssetWithConfig:v12 regionId:0 shouldSubscribe:1 subscriberId:v7 expiration:0];

    if (v14) {
      id v8 = [(LSRLanguageModel *)v8 initWithAssetPath:v14];
    }
  }
  return v8;
}

+ (BOOL)createAppLmLmeProfileWithLanguage:(id)a3 modelRoot:(id)a4 customPronsData:(id)a5 newOovs:(id)a6 writeToVocabFile:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  long long v15 = +[LSRLanguageModel _userProfileWithModelRoot:a4 language:v11];
  if (v15)
  {
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100032BA8;
    v40[3] = &unk_100059A50;
    id v16 = objc_alloc_init((Class)NSMutableDictionary);
    id v41 = v16;
    [v13 enumerateObjectsUsingBlock:v40];
    if (v12)
    {
      id v17 = [objc_alloc((Class)_EARPlsParser) initWithData:v12];
      v18 = [v17 lexemes];
      id v19 = +[NSDictionary dictionaryWithDictionary:v18];

      id v20 = objc_alloc((Class)_EARPhonesetMapping);
      id v21 = +[SFUtilities stringByReplacingHyphensWithUnderscores:v11];
      id v22 = [v20 initWithLanguage:v21];

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100032C20;
      v37[3] = &unk_100059AA0;
      id v38 = v22;
      id v39 = v16;
      id v23 = v22;
      [v19 enumerateKeysAndObjectsUsingBlock:v37];
    }
    v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    double v34 = sub_100032D0C;
    v35 = &unk_100059AC8;
    id v24 = v15;
    id v36 = v24;
    [v16 enumerateKeysAndObjectsUsingBlock:&v32];
    v25 = objc_msgSend(v24, "dataProfile", v32, v33, v34, v35);
    id v26 = v25;
    BOOL v27 = v25 != 0;
    if (v25)
    {
      [v25 writeToURL:v14 atomically:0];
      uint64_t v28 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        long long v43 = "+[LSRLanguageModel createAppLmLmeProfileWithLanguage:modelRoot:customPronsData:newOovs:writeToVocabFile:]";
        __int16 v44 = 2112;
        id v45 = v14;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s Wrote profile data to file:%@", buf, 0x16u);
      }
    }
    else
    {
      v30 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        long long v43 = "+[LSRLanguageModel createAppLmLmeProfileWithLanguage:modelRoot:customPronsData:newOovs:writeToVocabFile:]";
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s Failed to create user profile", buf, 0xCu);
      }
    }
  }
  else
  {
    id v29 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v43 = "+[LSRLanguageModel createAppLmLmeProfileWithLanguage:modelRoot:customPronsData:newOovs:writeToVocabFile:]";
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Failed to create user profile object", buf, 0xCu);
    }
    BOOL v27 = 0;
  }

  return v27;
}

+ (id)_userProfileWithModelRoot:(id)a3 language:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 stringByAppendingPathComponent:@"mini.json"];
  id v8 = [v6 stringByAppendingPathComponent:@"ncs"];

  id v9 = [v8 stringByAppendingPathComponent:@"en_US_napg.json"];
  uint64_t v10 = [v8 stringByAppendingPathComponent:@"vocdelta.voc"];
  id v11 = [v8 stringByAppendingPathComponent:@"pg.voc"];
  id v12 = [v8 stringByAppendingPathComponent:@"mrec.psh"];
  id v13 = [objc_alloc((Class)_EARUserProfile) initWithConfiguration:v7 language:v5 overrides:0 sdapiOverrides:v9 emptyVoc:v10 pgVoc:v11 paramsetHolder:v12];

  return v13;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    SFLogInitIfNeeded();
  }
}

@end