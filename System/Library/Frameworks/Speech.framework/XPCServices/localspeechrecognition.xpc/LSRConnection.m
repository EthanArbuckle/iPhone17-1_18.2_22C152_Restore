@interface LSRConnection
+ (id)_jitProfileWithLanguage:(id)a3 modelRoot:(id)a4;
+ (id)modelRootWithLanguage:(id)a3 assetType:(unint64_t)a4 clientID:(id)a5 modelOverrideURL:(id)a6 error:(id *)a7;
+ (id)modelRootWithLanguage:(id)a3 assetType:(unint64_t)a4 clientID:(id)a5 modelOverrideURL:(id)a6 isSpelling:(BOOL)a7 error:(id *)a8;
+ (id)processStartTimeOnce;
+ (int)countOfRecognizers;
+ (void)_cachedRecognizerCleanUp;
+ (void)_cancelCooldownTimer;
+ (void)_cooldownTimerFired;
+ (void)_scheduleCooldownTimer;
+ (void)captureProcessStartTime;
+ (void)initialize;
- ($115C4C562B26FF47E01F9F4EA65B5887)_auditToken;
- (BOOL)_callerHasWritePriviledge:(id)a3;
- (BOOL)_consumeSandboxExtensions:(id)a3 error:(id *)a4;
- (BOOL)prepareRecognizerWithLanguage:(id)a3 recognitionOverrides:(id)a4 modelOverrideURL:(id)a5 anyConfiguration:(BOOL)a6 task:(id)a7 clientID:(id)a8 error:(id *)a9;
- (LSRConnection)init;
- (LSRConnection)initWithXPCConnection:(id)a3;
- (id)_delegate;
- (id)_requestContext;
- (void)addAudioPacket:(id)a3;
- (void)addProns:(id)a3 forWord:(id)a4 completion:(id)a5;
- (void)addSentenceToNgramCounts:(id)a3;
- (void)addSentenceToNgramCounts:(id)a3 completion:(id)a4;
- (void)appLmNeedsRebuild:(id)a3 language:(id)a4 sandboxExtensions:(id)a5 completion:(id)a6;
- (void)cancelSpeech;
- (void)cleanupCacheWithCompletion:(id)a3;
- (void)configParametersForVoicemailWithLanguage:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)createNgramCountsArtifactFromPhraseCountArtifact:(id)a3 writeToDirectory:(id)a4 sandboxExtensions:(id)a5 completion:(id)a6;
- (void)createPhraseCountsArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 writeToDirectory:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8;
- (void)dealloc;
- (void)deserializeNgramCountsData:(id)a3 completion:(id)a4;
- (void)downloadAssetsForConfig:(id)a3 clientID:(id)a4 detailedProgress:(BOOL)a5;
- (void)fetchAssetsForLanguage:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)generateNgramCountsSerializeDataWithCompletion:(id)a3;
- (void)getJitProfileData:(id)a3 contextualStrings:(id)a4 clientID:(id)a5 reply:(id)a6;
- (void)initializeLmWithAssetPath:(id)a3 completion:(id)a4;
- (void)initializeLmWithLocale:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)initializeWithSandboxExtensions:(id)a3;
- (void)installedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4;
- (void)lmeThresholdWithCompletion:(id)a3;
- (void)logCoreAnalyticsEvent:(id)a3 withAnalytics:(id)a4;
- (void)makeEARLanguageDetectorWithDetectorOptions:(id)a3 clientInfo:(id)a4 analysisOptions:(id)a5 reply:(id)a6;
- (void)makeEARSpeechRecognizerWithSupportedFeatures:(id)a3 clientInfo:(id)a4 analysisContext:(id)a5 analysisOptions:(id)a6 sandboxExtensions:(id)a7 reply:(id)a8;
- (void)makeEuclidInstanceWithLocale:(id)a3 clientID:(id)a4 encoderType:(int64_t)a5 initFlag:(int64_t)a6 reply:(id)a7;
- (void)makeLSRAssetsForLocale:(id)a3 taskName:(id)a4 clientID:(id)a5 modelOverrideURL:(id)a6 isSpelling:(BOOL)a7 reply:(id)a8;
- (void)metricsWithCompletion:(id)a3;
- (void)oovWordsAndFrequenciesWithCompletion:(id)a3;
- (void)pathToAssetWithConfig:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)preloadRecognizerForLanguage:(id)a3 task:(id)a4 clientID:(id)a5 recognitionOverrides:(id)a6 modelOverrideURL:(id)a7 completion:(id)a8;
- (void)processStartTimeOnceWithReply:(id)a3;
- (void)reportFailureWithError:(id)a3;
- (void)setCachedJitProfileBuilder:(id)a3;
- (void)setCachedLanguage:(id)a3;
- (void)setCachedModelRoot:(id)a3;
- (void)setPurgeabilityForAssetWithConfig:(id)a3 purgeable:(BOOL)a4 clientID:(id)a5 completion:(id)a6;
- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4;
- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4;
- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4;
- (void)startRecordedAudioDictationWithParameters:(id)a3;
- (void)stopSpeech;
- (void)subscriptionsForClientId:(id)a3 completion:(id)a4;
- (void)supportedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4;
- (void)synchronousComputeEuclidEmbeddingsForSources:(id)a3 completion:(id)a4;
- (void)synchronousCreateEuclidInstanceForLanguageStr:(id)a3 clientID:(id)a4 inputFormat:(int64_t)a5 loadingOption:(int64_t)a6 completion:(id)a7;
- (void)trainAppLmFromNgramCountsArtifact:(id)a3 forApp:(id)a4 language:(id)a5 writeToDirectory:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8;
- (void)trainAppLmFromNgramsSerializedData:(id)a3 customPronsData:(id)a4 language:(id)a5 writeToDirectory:(id)a6 sandboxExtension:(id)a7 completion:(id)a8;
- (void)trainFromPlainTextAndWriteToDirectory:(id)a3 sandboxExtension:(id)a4 completion:(id)a5;
- (void)unsubscribeFromAssetWithConfig:(id)a3 clientID:(id)a4 completion:(id)a5;
- (void)updateAudioDuration:(id)a3;
- (void)wakeUpWithCompletion:(id)a3;
@end

@implementation LSRConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_euclidInstance, 0);
  objc_storeStrong((id *)&self->_generalASRAssetDelegateInterface, 0);
  objc_storeStrong((id *)&self->_assistantAssetDelegateInterface, 0);
  objc_storeStrong((id *)&self->_earInterface, 0);
  objc_storeStrong((id *)&self->_lsrLanguageModel, 0);
  objc_storeStrong((id *)&self->sigterm_source, 0);
  objc_storeStrong((id *)&self->sigterm_queue, 0);
  objc_storeStrong((id *)&self->_modelRoot, 0);
  objc_storeStrong((id *)&self->_audioDump, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_consumedSandboxExtensions, 0);
  objc_storeStrong((id *)&self->_lastRecognitionResult, 0);
  objc_storeStrong((id *)&self->_bufferedAudioPackets, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);

  objc_destroyWeak((id *)&self->_recognizer);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResults:(id)a4
{
}

- (void)speechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100035624;
  v4[3] = &unk_10005A1B8;
  v4[4] = self;
  *(double *)&v4[5] = a4;
  dispatch_async((dispatch_queue_t)qword_100065438, v4);
}

- (void)speechRecognizer:(id)a3 didFinishRecognitionWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = qword_100065438;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035744;
  block[3] = &unk_10005A168;
  id v12 = v7;
  v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)speechRecognizer:(id)a3 didRecognizeFinalResultPackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = qword_100065438;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000363E0;
  block[3] = &unk_10005A168;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)speechRecognizer:(id)a3 didRecognizePartialResult:(id)a4
{
  id v5 = a4;
  id v6 = qword_100065438;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100036924;
  v8[3] = &unk_100059D48;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)makeEARLanguageDetectorWithDetectorOptions:(id)a3 clientInfo:(id)a4 analysisOptions:(id)a5 reply:(id)a6
{
}

- (void)makeEuclidInstanceWithLocale:(id)a3 clientID:(id)a4 encoderType:(int64_t)a5 initFlag:(int64_t)a6 reply:(id)a7
{
}

- (void)processStartTimeOnceWithReply:(id)a3
{
}

- (void)makeLSRAssetsForLocale:(id)a3 taskName:(id)a4 clientID:(id)a5 modelOverrideURL:(id)a6 isSpelling:(BOOL)a7 reply:(id)a8
{
}

- (void)getJitProfileData:(id)a3 contextualStrings:(id)a4 clientID:(id)a5 reply:(id)a6
{
}

- (void)makeEARSpeechRecognizerWithSupportedFeatures:(id)a3 clientInfo:(id)a4 analysisContext:(id)a5 analysisOptions:(id)a6 sandboxExtensions:(id)a7 reply:(id)a8
{
}

- (void)synchronousComputeEuclidEmbeddingsForSources:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  euclidInstance = self->_euclidInstance;
  if (euclidInstance)
  {
    id v9 = [(_EAREuclid *)euclidInstance computeEmbeddings:v6];
    id v10 = (void *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      id v12 = v10;
      int v13 = 136315394;
      id v14 = "-[LSRConnection synchronousComputeEuclidEmbeddingsForSources:completion:]";
      __int16 v15 = 2048;
      id v16 = [v6 count];
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s _EAREuclid.computeEmbeddings(sources:) replying with %lu requested embedding(s)", (uint8_t *)&v13, 0x16u);
    }
    v7[2](v7, v9);
  }
  else
  {
    v11 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      id v14 = "-[LSRConnection synchronousComputeEuclidEmbeddingsForSources:completion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s No instance of _EAREuclid", (uint8_t *)&v13, 0xCu);
    }
    v7[2](v7, 0);
  }
}

- (void)synchronousCreateEuclidInstanceForLanguageStr:(id)a3 clientID:(id)a4 inputFormat:(int64_t)a5 loadingOption:(int64_t)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  int v13 = (void (**)(id, void))a7;
  id v14 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[LSRConnection synchronousCreateEuclidInstanceForLanguageStr:clientID:inputFormat:loadingOption:completion:]";
    __int16 v27 = 2112;
    id v28 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s Initializing _EAREuclid instance for languageStr: %@", buf, 0x16u);
  }
  __int16 v15 = +[LSRConnection modelRootWithLanguage:v11 assetType:3 clientID:v12 modelOverrideURL:0 isSpelling:0 error:0];
  id v16 = [v15 stringByAppendingPathComponent:@"mini.json"];
  v17 = (_EAREuclid *)[objc_alloc((Class)_EAREuclid) initWithConfiguration:v16 euclidEncoderType:a5 initFlag:1];
  euclidInstance = self->_euclidInstance;
  self->_euclidInstance = v17;

  if (self->_euclidInstance)
  {
    v13[2](v13, 0);
  }
  else
  {
    v19 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[LSRConnection synchronousCreateEuclidInstanceForLanguageStr:clientID:inputFormat:loadingOption:completion:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s Initialization of _EAREuclid instance failed", buf, 0xCu);
    }
    v20 = +[NSString stringWithFormat:@"Initialization of _EAREuclid instance failed", NSLocalizedDescriptionKey];
    v24 = v20;
    v21 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v22 = +[NSError errorWithDomain:@"kLSRErrorDomain" code:0 userInfo:v21];

    ((void (**)(id, void *))v13)[2](v13, v22);
  }
}

- (void)subscriptionsForClientId:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (!sub_100037048())
  {
    v8 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "-[LSRConnection subscriptionsForClientId:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Request not authorized", (uint8_t *)&v9, 0xCu);
      if (!v6) {
        goto LABEL_7;
      }
    }
    else if (!v6)
    {
      goto LABEL_7;
    }
    v6[2](v6, &__NSArray0__struct);
    goto LABEL_7;
  }
  if (v6)
  {
    id v7 = +[SFEntitledAssetManager subscriptionsForSubscriberId:v5];
    v6[2](v6, v7);
  }
LABEL_7:
}

- (void)unsubscribeFromAssetWithConfig:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, void *))a5;
  if (!sub_100037048())
  {
    id v10 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      int v13 = "-[LSRConnection unsubscribeFromAssetWithConfig:clientID:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Request not authorized", (uint8_t *)&v12, 0xCu);
      if (!v9) {
        goto LABEL_7;
      }
    }
    else if (!v9)
    {
      goto LABEL_7;
    }
    id v11 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1700 userInfo:0];
    v9[2](v9, v11);

    goto LABEL_7;
  }
  +[SFEntitledAssetManager unsubscribeFromAssetWithConfig:v7 regionId:0 subscriberId:v8];
  if (v9) {
    v9[2](v9, 0);
  }
LABEL_7:
}

- (void)appLmNeedsRebuild:(id)a3 language:(id)a4 sandboxExtensions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void (**)(id, id, id))a6;
  id v14 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[LSRConnection appLmNeedsRebuild:language:sandboxExtensions:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Checking if app LM needs a rebuild", buf, 0xCu);
  }
  id v22 = 0;
  unsigned __int8 v15 = [(LSRConnection *)self _consumeSandboxExtensions:v12 error:&v22];
  id v16 = v22;
  if (v15)
  {
    lsrLanguageModel = self->_lsrLanguageModel;
    id v21 = 0;
    BOOL v18 = [(LSRLanguageModel *)lsrLanguageModel appLmNeedsRebuild:v10 language:v11 error:&v21];
    id v19 = v21;
    v13[2](v13, (id)v18, v19);
  }
  else
  {
    v20 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[LSRConnection appLmNeedsRebuild:language:sandboxExtensions:completion:]";
      __int16 v25 = 2112;
      id v26 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Failed to consume sandbox extensions when checking for App LM rebuild: %@", buf, 0x16u);
    }
    v13[2](v13, (id)1, v16);
  }
}

- (void)trainAppLmFromNgramCountsArtifact:(id)a3 forApp:(id)a4 language:(id)a5 writeToDirectory:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v37 = a4;
  id v35 = a5;
  id v15 = a6;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100037878;
  v41[3] = &unk_10005A0F0;
  id v16 = a8;
  id v42 = v16;
  id v17 = a7;
  BOOL v18 = objc_retainBlock(v41);
  id v19 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[LSRConnection trainAppLmFromNgramCountsArtifact:forApp:language:writeToDirectory:sandboxExtensions:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Starting training of App LM from ngram count.", buf, 0xCu);
  }
  id v40 = 0;
  unsigned __int8 v20 = -[LSRConnection _consumeSandboxExtensions:error:](self, "_consumeSandboxExtensions:error:", v17, &v40, v35);

  id v21 = v40;
  id v22 = SFLogConnection;
  if (v20)
  {
    id v23 = v14;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[LSRConnection trainAppLmFromNgramCountsArtifact:forApp:language:writeToDirectory:sandboxExtensions:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Successfully consumed sandbox extensions", buf, 0xCu);
    }
    v24 = [v15 URLByAppendingPathComponent:@"AppLmModelFile"];
    __int16 v25 = [v15 URLByAppendingPathComponent:@"SpeechProfile"];
    id v26 = +[NSFileManager defaultManager];
    [v26 removeItemAtURL:v24 error:0];

    __int16 v27 = +[NSFileManager defaultManager];
    [v27 removeItemAtURL:v25 error:0];

    lsrLanguageModel = self->_lsrLanguageModel;
    id v38 = v25;
    id v39 = v24;
    id v14 = v23;
    id v29 = v23;
    v31 = v36;
    v30 = v37;
    [(LSRLanguageModel *)lsrLanguageModel trainAppLmFromNgramCountsArtifact:v29 forApp:v37 language:v36 appLmArtifact:&v39 vocabFile:&v38];
    id v32 = v39;

    id v33 = v38;
    v34 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[LSRConnection trainAppLmFromNgramCountsArtifact:forApp:language:writeToDirectory:sandboxExtensions:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s Finished training of App LM from ngram count.", buf, 0xCu);
    }
    ((void (*)(void *, id, id))v18[2])(v18, v32, v33);
  }
  else
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[LSRConnection trainAppLmFromNgramCountsArtifact:forApp:language:writeToDirectory:sandboxExtensions:completion:]";
      __int16 v45 = 2112;
      id v46 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Failed to consume sandbox extensions: %@", buf, 0x16u);
    }
    ((void (*)(void *, void, void))v18[2])(v18, 0, 0);
    v31 = v36;
    v30 = v37;
  }
}

- (void)createNgramCountsArtifactFromPhraseCountArtifact:(id)a3 writeToDirectory:(id)a4 sandboxExtensions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100037AD4;
  v20[3] = &unk_10005A118;
  id v12 = a6;
  id v21 = v12;
  id v13 = a5;
  id v14 = objc_retainBlock(v20);
  id v19 = 0;
  unsigned __int8 v15 = [(LSRConnection *)self _consumeSandboxExtensions:v13 error:&v19];

  id v16 = v19;
  id v17 = SFLogConnection;
  if (v15)
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[LSRConnection createNgramCountsArtifactFromPhraseCountArtifact:writeToDirectory:sandboxExtensions:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Successfully consumed sandbox extensions", buf, 0xCu);
    }
    BOOL v18 = [v11 URLByAppendingPathComponent:@"NgramCountsFile" isDirectory:0];
    [(LSRLanguageModel *)self->_lsrLanguageModel createNgramCountsArtifactFromPhraseCountArtifact:v10 saveTo:v18];
    ((void (*)(void *, void *))v14[2])(v14, v18);
  }
  else
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "-[LSRConnection createNgramCountsArtifactFromPhraseCountArtifact:writeToDirectory:sandboxExtensions:completion:]";
      __int16 v24 = 2112;
      id v25 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Failed to consume sandbox extensions: %@", buf, 0x16u);
    }
    ((void (*)(void *, void))v14[2])(v14, 0);
  }
}

- (void)createPhraseCountsArtifactWithIdentifier:(id)a3 rawPhraseCountsPath:(id)a4 customPronunciationsPath:(id)a5 writeToDirectory:(id)a6 sandboxExtensions:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100037D60;
  v26[3] = &unk_10005A118;
  id v18 = a8;
  id v27 = v18;
  id v19 = a7;
  unsigned __int8 v20 = objc_retainBlock(v26);
  id v25 = 0;
  unsigned __int8 v21 = [(LSRConnection *)self _consumeSandboxExtensions:v19 error:&v25];

  id v22 = v25;
  id v23 = SFLogConnection;
  if (v21)
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[LSRConnection createPhraseCountsArtifactWithIdentifier:rawPhraseCountsPath:customPronunciationsPath:writeT"
            "oDirectory:sandboxExtensions:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Successfully consumed sandbox extensions", buf, 0xCu);
    }
    __int16 v24 = [v17 URLByAppendingPathComponent:@"PhraseCountsFile" isDirectory:0];
    [(LSRLanguageModel *)self->_lsrLanguageModel createPhraseCountArtifactWithIdentifier:v14 rawPhraseCountsPath:v15 customPronunciationsPath:v16 saveTo:v24];
    ((void (*)(void *, void *))v20[2])(v20, v24);
  }
  else
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v29 = "-[LSRConnection createPhraseCountsArtifactWithIdentifier:rawPhraseCountsPath:customPronunciationsPath:writeT"
            "oDirectory:sandboxExtensions:completion:]";
      __int16 v30 = 2112;
      id v31 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Failed to consume sandbox extensions: %@", buf, 0x16u);
    }
    ((void (*)(void *, void))v20[2])(v20, 0);
  }
}

- (void)wakeUpWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)trainAppLmFromNgramsSerializedData:(id)a3 customPronsData:(id)a4 language:(id)a5 writeToDirectory:(id)a6 sandboxExtension:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100038318;
  v51[3] = &unk_10005A0F0;
  id v19 = a8;
  id v52 = v19;
  unsigned __int8 v20 = objc_retainBlock(v51);
  unsigned __int8 v21 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[LSRConnection trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtension:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Starting training of App LM from ngram count.", buf, 0xCu);
  }
  if (sub_100037048())
  {
    id v46 = v15;
    id v57 = v18;
    id v22 = +[NSArray arrayWithObjects:&v57 count:1];
    id v50 = 0;
    unsigned __int8 v23 = [(LSRConnection *)self _consumeSandboxExtensions:v22 error:&v50];
    id v45 = v50;

    __int16 v24 = SFLogConnection;
    if ((v23 & 1) == 0)
    {
      __int16 v30 = v45;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v54 = "-[LSRConnection trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtens"
              "ion:completion:]";
        __int16 v55 = 2112;
        id v56 = v45;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Failed to consume sandbox extensions: %@", buf, 0x16u);
      }
      ((void (*)(void *, void, void))v20[2])(v20, 0, 0);
      id v15 = v46;
      goto LABEL_25;
    }
    id v42 = v16;
    id v44 = v14;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "-[LSRConnection trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtension:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Successfully consumed sandbox extensions", buf, 0xCu);
    }
    id v25 = [v17 URLByAppendingPathComponent:@"app-lm"];
    id v26 = +[NSFileManager defaultManager];
    id v27 = [v25 path];
    unsigned __int8 v28 = [v26 fileExistsAtPath:v27];

    v43 = v26;
    if (v28)
    {
      id v41 = 0;
      id v15 = v46;
      id v16 = v42;
    }
    else
    {
      id v49 = 0;
      unsigned __int8 v31 = [v26 createDirectoryAtURL:v25 withIntermediateDirectories:0 attributes:0 error:&v49];
      id v41 = v49;
      id v15 = v46;
      if ((v31 & 1) == 0)
      {
        id v40 = SFLogConnection;
        id v39 = v41;
        id v16 = v42;
        if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v54 = "-[LSRConnection trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExte"
                "nsion:completion:]";
          __int16 v55 = 2112;
          id v56 = v41;
          _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s Write failed error:%@", buf, 0x16u);
        }
        ((void (*)(void *, void, void))v20[2])(v20, 0, 0);
        id v14 = v44;
        __int16 v30 = v45;
        id v38 = v43;
        goto LABEL_24;
      }
      id v32 = SFLogConnection;
      id v16 = v42;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v54 = "-[LSRConnection trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtens"
              "ion:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s Write successfull", buf, 0xCu);
      }
    }
    id v33 = [v17 URLByAppendingPathComponent:@"SpeechProfile"];
    lsrLanguageModel = self->_lsrLanguageModel;
    id v47 = v33;
    id v48 = v25;
    [(LSRLanguageModel *)lsrLanguageModel trainAppLmFromNgramsSerializedData:v44 customPronsData:v15 language:v16 writeToAppLmDir:&v48 vocabFile:&v47];
    id v35 = v48;

    id v36 = v47;
    id v37 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "-[LSRConnection trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtension:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s Finished training of App LM from ngram count.", buf, 0xCu);
    }
    ((void (*)(void *, id, id))v20[2])(v20, v35, v36);

    id v25 = v35;
    id v14 = v44;
    __int16 v30 = v45;
    id v15 = v46;
    id v38 = v43;
    id v39 = v41;
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  id v29 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[LSRConnection trainAppLmFromNgramsSerializedData:customPronsData:language:writeToDirectory:sandboxExtension:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s Request not authorized", buf, 0xCu);
  }
  ((void (*)(void *, void, void))v20[2])(v20, 0, 0);
LABEL_26:
}

- (void)metricsWithCompletion:(id)a3
{
  if (a3)
  {
    lsrLanguageModel = self->_lsrLanguageModel;
    id v5 = a3;
    id v6 = [(LSRLanguageModel *)lsrLanguageModel metrics];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (void)lmeThresholdWithCompletion:(id)a3
{
  if (a3)
  {
    lsrLanguageModel = self->_lsrLanguageModel;
    id v5 = a3;
    (*((void (**)(id, int64_t))a3 + 2))(v5, [(LSRLanguageModel *)lsrLanguageModel lmeThreshold]);
  }
}

- (void)deserializeNgramCountsData:(id)a3 completion:(id)a4
{
  if (a4)
  {
    lsrLanguageModel = self->_lsrLanguageModel;
    id v7 = a4;
    id v8 = [(LSRLanguageModel *)lsrLanguageModel deserializeNgramCountsData:a3];
    (*((void (**)(id, id))a4 + 2))(v7, v8);
  }
}

- (void)generateNgramCountsSerializeDataWithCompletion:(id)a3
{
  if (a3)
  {
    lsrLanguageModel = self->_lsrLanguageModel;
    id v5 = a3;
    id v6 = [(LSRLanguageModel *)lsrLanguageModel ngramCountsSerializeData];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (void)trainFromPlainTextAndWriteToDirectory:(id)a3 sandboxExtension:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100038988;
  v33[3] = &unk_10005A0F0;
  id v10 = a5;
  id v34 = v10;
  id v11 = objc_retainBlock(v33);
  if (sub_100037048())
  {
    id v39 = v9;
    id v12 = +[NSArray arrayWithObjects:&v39 count:1];
    id v32 = 0;
    unsigned __int8 v13 = [(LSRConnection *)self _consumeSandboxExtensions:v12 error:&v32];
    id v14 = v32;

    id v15 = SFLogConnection;
    if ((v13 & 1) == 0)
    {
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v36 = "-[LSRConnection trainFromPlainTextAndWriteToDirectory:sandboxExtension:completion:]";
        __int16 v37 = 2112;
        id v38 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Failed to consume sandbox extensions: %@", buf, 0x16u);
      }
      ((void (*)(void *, void, void))v11[2])(v11, 0, 0);
      goto LABEL_21;
    }
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v36 = "-[LSRConnection trainFromPlainTextAndWriteToDirectory:sandboxExtension:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Successfully consumed sandbox extensions", buf, 0xCu);
    }
    id v16 = objc_msgSend(v8, "URLByAppendingPathComponent:", @"app-lm", v14);
    id v17 = +[NSFileManager defaultManager];
    id v18 = [v16 path];
    unsigned __int8 v19 = [v17 fileExistsAtPath:v18];

    if (v19)
    {
      id v20 = 0;
    }
    else
    {
      id v31 = 0;
      unsigned __int8 v22 = [v17 createDirectoryAtURL:v16 withIntermediateDirectories:0 attributes:0 error:&v31];
      id v20 = v31;
      unsigned __int8 v23 = SFLogConnection;
      if ((v22 & 1) == 0)
      {
        if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v36 = "-[LSRConnection trainFromPlainTextAndWriteToDirectory:sandboxExtension:completion:]";
          __int16 v37 = 2112;
          id v38 = v20;
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Write failed error:%@", buf, 0x16u);
        }
        ((void (*)(void *, void, void))v11[2])(v11, 0, 0);
        goto LABEL_20;
      }
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v36 = "-[LSRConnection trainFromPlainTextAndWriteToDirectory:sandboxExtension:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Write successfull", buf, 0xCu);
      }
    }
    __int16 v24 = [v8 URLByAppendingPathComponent:@"SpeechProfile"];
    lsrLanguageModel = self->_lsrLanguageModel;
    id v29 = v24;
    id v30 = v16;
    [(LSRLanguageModel *)lsrLanguageModel trainAppLmFromPlainTextAndWriteToAppDirectory:&v30 vocabFile:&v29];
    id v26 = v30;

    id v27 = v29;
    ((void (*)(void *, id, id))v11[2])(v11, v26, v27);

    id v16 = v26;
LABEL_20:
    id v14 = v28;

LABEL_21:
    goto LABEL_22;
  }
  unsigned __int8 v21 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v36 = "-[LSRConnection trainFromPlainTextAndWriteToDirectory:sandboxExtension:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Request not authorized", buf, 0xCu);
  }
  ((void (*)(void *, void, void))v11[2])(v11, 0, 0);
LABEL_22:
}

- (void)addProns:(id)a3 forWord:(id)a4 completion:(id)a5
{
  if (a5)
  {
    lsrLanguageModel = self->_lsrLanguageModel;
    id v9 = a5;
    (*((void (**)(id, BOOL))a5 + 2))(v9, [(LSRLanguageModel *)lsrLanguageModel addProns:a3 forWord:a4]);
  }
}

- (void)oovWordsAndFrequenciesWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    id v8 = "-[LSRConnection oovWordsAndFrequenciesWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s oovs words and frequencies", (uint8_t *)&v7, 0xCu);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    id v6 = [(LSRLanguageModel *)self->_lsrLanguageModel oovWordsAndFrequenciesInNgramCount];
    v4[2](v4, v6);
  }
LABEL_4:
}

- (void)addSentenceToNgramCounts:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  id v8 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    id v11 = "-[LSRConnection addSentenceToNgramCounts:completion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Adding oovs from sentence", (uint8_t *)&v10, 0xCu);
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v7)
  {
LABEL_3:
    id v9 = [(LSRLanguageModel *)self->_lsrLanguageModel oovsFromSentenceAddedToNgramCounts:v6];
    v7[2](v7, v9);
  }
LABEL_4:
}

- (void)addSentenceToNgramCounts:(id)a3
{
  id v4 = a3;
  id v5 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    int v7 = "-[LSRConnection addSentenceToNgramCounts:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Adding sentence=%@", (uint8_t *)&v6, 0x16u);
  }
  [(LSRLanguageModel *)self->_lsrLanguageModel addSentenceToNgramCounts:v4];
}

- (void)initializeLmWithAssetPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = qword_100065438;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038DC4;
  block[3] = &unk_10005A0C8;
  unsigned __int8 v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)initializeLmWithLocale:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = qword_100065438;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100039100;
  v15[3] = &unk_10005A0A0;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)setPurgeabilityForAssetWithConfig:(id)a3 purgeable:(BOOL)a4 clientID:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  if (sub_100037048())
  {
    id v10 = qword_100065438;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100039454;
    block[3] = &unk_10005A078;
    id v14 = v8;
    BOOL v16 = a4;
    id v15 = v9;
    dispatch_async(v10, block);

    id v11 = v14;
LABEL_6:

    goto LABEL_7;
  }
  id v12 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v18 = "-[LSRConnection setPurgeabilityForAssetWithConfig:purgeable:clientID:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Request not authorized", buf, 0xCu);
    if (!v9) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (v9)
  {
LABEL_5:
    id v11 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1700 userInfo:0];
    (*((void (**)(id, void *))v9 + 2))(v9, v11);
    goto LABEL_6;
  }
LABEL_7:
}

- (void)configParametersForVoicemailWithLanguage:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100039670;
  v18[3] = &unk_10005A028;
  id v9 = a5;
  id v19 = v9;
  id v10 = objc_retainBlock(v18);
  if (sub_100037048())
  {
    id v11 = qword_100065438;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100039688;
    block[3] = &unk_10005A050;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v11, block);
  }
  else
  {
    id v12 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unsigned __int8 v21 = "-[LSRConnection configParametersForVoicemailWithLanguage:clientID:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Request not authorized", buf, 0xCu);
    }
    ((void (*)(void *, void))v10[2])(v10, 0);
  }
}

- (void)fetchAssetsForLanguage:(id)a3 clientID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (sub_100037048())
  {
    id v10 = qword_100065438;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100039AF4;
    block[3] = &unk_10005A0C8;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(v10, block);

    id v11 = v14;
LABEL_6:

    goto LABEL_7;
  }
  id v12 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v18 = "-[LSRConnection fetchAssetsForLanguage:clientID:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Request not authorized", buf, 0xCu);
    if (!v9) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (v9)
  {
LABEL_5:
    id v11 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1700 userInfo:0];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v11);
    goto LABEL_6;
  }
LABEL_7:
}

- (void)downloadAssetsForConfig:(id)a3 clientID:(id)a4 detailedProgress:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!sub_100037048())
  {
    id v10 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unsigned __int8 v28 = "-[LSRConnection downloadAssetsForConfig:clientID:detailedProgress:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Request not authorized", buf, 0xCu);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100039E7C;
    block[3] = &unk_100059D70;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)qword_100065438, block);
  }
  id v11 = [v8 language];

  if (!v11)
  {
    id v12 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      unsigned __int8 v28 = "-[LSRConnection downloadAssetsForConfig:clientID:detailedProgress:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Language cannot be nil.", buf, 0xCu);
    }
    id v13 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:31 userInfo:0];
    id v14 = qword_100065438;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100039F00;
    v24[3] = &unk_100059D48;
    v24[4] = self;
    id v25 = v13;
    id v15 = v13;
    dispatch_async(v14, v24);
  }
  id v16 = qword_100065438;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100039F58;
  v19[3] = &unk_10005A000;
  id v20 = v8;
  unsigned __int8 v21 = self;
  id v22 = v9;
  BOOL v23 = a5;
  id v17 = v9;
  id v18 = v8;
  dispatch_async(v16, v19);
}

- (void)installedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void (**)(void, void))v6;
  if (v6)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFBLL) != 3)
    {
      id v9 = qword_100065438;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003B1EC;
      block[3] = &unk_100059E08;
      unint64_t v16 = a3;
      id v15 = v6;
      dispatch_async(v9, block);
      id v10 = v15;
LABEL_13:

      goto LABEL_14;
    }
    if (a3 == 3)
    {
      uint64_t v8 = 208;
    }
    else
    {
      if (a3 != 7)
      {
        id v10 = 0;
        goto LABEL_10;
      }
      uint64_t v8 = 216;
    }
    id v10 = [*(id *)((char *)&self->super.isa + v8) statusForLanguage];
LABEL_10:
    id v11 = SFEntitledAssetTypeToString();
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x3032000000;
    unsigned __int8 v21 = sub_10003B16C;
    id v22 = sub_10003B17C;
    id v23 = +[NSMutableSet set];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003B184;
    v17[3] = &unk_100059DE0;
    v17[4] = &v18;
    [v10 enumerateKeysAndObjectsUsingBlock:v17];
    id v12 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = v19[5];
      *(_DWORD *)buf = 136315650;
      id v25 = "-[LSRConnection installedLanguagesForAssetType:completion:]";
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      uint64_t v29 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Using the cached status for %@ assets, available languages: %@", buf, 0x20u);
    }
    v7[2](v7, v19[5]);
    _Block_object_dispose(&v18, 8);

    goto LABEL_13;
  }
LABEL_14:
}

- (void)supportedLanguagesForAssetType:(unint64_t)a3 completion:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = +[SFEntitledAssetManager supportedLanguagesForAssetType:a3];
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }
}

- (void)pathToAssetWithConfig:(id)a3 clientID:(id)a4 completion:(id)a5
{
  if (a5)
  {
    id v7 = a5;
    id v8 = a3;
    id v10 = +[SFEntitledAssetManager sharedInstance];
    id v9 = [v10 installedAssetWithConfig:v8];

    (*((void (**)(id, void *))a5 + 2))(v7, v9);
  }
}

- (void)setCachedJitProfileBuilder:(id)a3
{
}

- (void)setCachedModelRoot:(id)a3
{
}

- (void)setCachedLanguage:(id)a3
{
}

- (void)reportFailureWithError:(id)a3
{
  id v4 = a3;
  id v5 = SFAnalyticsEventTypeGetName();
  id v8 = v4;
  id v6 = v4;
  AnalyticsSendEventLazy();

  id v7 = [(LSRConnection *)self _delegate];
  [v7 localSpeechRecognitionDidFail:v6];
}

- (void)cleanupCacheWithCompletion:(id)a3
{
  a3;
  if (qword_100065490
    && [(id)qword_100065490 isEqualToString:kSFSpeechRecognizerTaskCaptioning])
  {
    +[LSRConnection _cachedRecognizerCleanUp];
  }

  _objc_release_x1();
}

- (void)logCoreAnalyticsEvent:(id)a3 withAnalytics:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

- (void)initializeWithSandboxExtensions:(id)a3
{
  id v4 = a3;
  id v5 = qword_100065438;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003B764;
  v7[3] = &unk_100059D48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)cancelSpeech
{
  v3 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[LSRConnection cancelSpeech]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s cancelSpeech - %p", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B9AC;
  block[3] = &unk_100059D70;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)qword_100065438, block);
}

- (void)stopSpeech
{
  v3 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[LSRConnection stopSpeech]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s stopSpeech - %p", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BBA4;
  block[3] = &unk_100059D70;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)qword_100065438, block);
}

- (void)updateAudioDuration:(id)a3
{
  id v4 = qword_100065438;
  id v5 = a3;
  dispatch_assert_queue_V2(v4);
  LODWORD(v4) = [(SFRequestParameters *)self->_requestParameters narrowband];
  unint64_t v6 = (unint64_t)[v5 length];

  double v7 = 16000.0;
  if (v4) {
    double v7 = 8000.0;
  }
  self->_audioDuration = self->_audioDuration + (double)(v6 >> 1) / v7;
}

- (void)addAudioPacket:(id)a3
{
  id v4 = a3;
  id v5 = qword_100065438;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003BD90;
  v7[3] = &unk_100059D48;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)startRecordedAudioDictationWithParameters:(id)a3
{
  id v5 = a3;
  id v6 = SFLogConnection;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Starting..", buf, 0xCu);
  }

  *(_WORD *)&self->_recognitionResultPackageGenerated = 0;
  *(_OWORD *)&self->_audioDuration = 0u;
  *(_OWORD *)&self->_lastAudioPacketTime = 0u;
  *(_OWORD *)&self->_firstAudioPacketTime = 0u;
  *(_OWORD *)&self->_silStartFirstToken = 0u;
  self->_asrInitializationTime = 0.0;
  unsigned int v7 = [v5 onDeviceOnly];
  id v8 = +[NSXPCConnection currentConnection];
  id v9 = v8;
  if (!v8)
  {
    id v14 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "CheckPrerecordedConnectionAccess";
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Called from outside of an XPC connection", buf, 0xCu);
    }
    id v15 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1700 userInfo:0];
    goto LABEL_21;
  }
  id v10 = [v8 valueForEntitlement:@"com.apple.assistant.dictation.prerecorded"];
  if (objc_opt_respondsToSelector())
  {
    if ((([v10 BOOLValue] | v7 ^ 1) & 1) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    id v12 = 0;
    char v13 = 1;
    goto LABEL_16;
  }
  if (!v7) {
    goto LABEL_13;
  }
LABEL_6:
  id v11 = +[AFPreferences sharedPreferences];
  if (([v11 assistantIsEnabled] & 1) != 0
    || ([v11 dictationIsEnabled] & 1) != 0)
  {
    id v12 = 0;
    char v13 = 1;
  }
  else
  {
    id v12 = +[NSError lsr_errorWithCode:201 description:@"Siri and Dictation are disabled"];
    char v13 = 0;
  }

LABEL_16:
  id v15 = v12;
  if (v13)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)qword_100065438);
    if (self->_audioBuffer)
    {
      unint64_t v16 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = @"Recognizer is busy";
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
      NSErrorUserInfoKey v223 = NSLocalizedDescriptionKey;
      CFStringRef v224 = @"Recognizer is busy";
      id v17 = +[NSDictionary dictionaryWithObjects:&v224 forKeys:&v223 count:1];
      uint64_t v18 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:1100 userInfo:v17];
      [(LSRConnection *)self reportFailureWithError:v18];

      goto LABEL_24;
    }
    uint64_t v20 = +[NSBundle mainBundle];
    CFStringRef v21 = (const __CFString *)[v20 bundleIdentifier];

    uint64_t v22 = kSFSpeechRecognizerDumpedTaskIdentifierKey;
    if (CFPreferencesAppValueIsForced(kSFSpeechRecognizerDumpedTaskIdentifierKey, v21)
      || SFIsInternalInstall())
    {
      id v23 = [v5 taskIdentifier];
      BOOL v24 = v23 == 0;

      if (!v24)
      {
        id v25 = [v5 applicationName];
        __int16 v26 = [v5 taskIdentifier];
        id v27 = +[NSString stringWithFormat:@"%@.%@", v25, v26];

        __int16 v28 = +[NSUserDefaults standardUserDefaults];
        uint64_t v29 = [v28 stringForKey:v22];

        LODWORD(v26) = [v29 isEqualToString:v27];
        id v30 = SFLogConnection;
        id v31 = (NSMutableArray *)v30;
        if (v26)
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            id v32 = [v5 requestIdentifier];
            id v33 = [v5 taskIdentifier];
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v32;
            *(_WORD *)&buf[22] = 2112;
            v214 = v33;
            _os_log_impl((void *)&_mh_execute_header, &v31->super.super, OS_LOG_TYPE_INFO, "%s Audio dumps will be enabled for request: %@ with taskIdentifier: %@", buf, 0x20u);
          }
          id v34 = [LSRAudioDump alloc];
          id v35 = [v5 taskIdentifier];
          id v36 = [(LSRAudioDump *)v34 initWithTaskIdentifier:v35];
          audioDump = self->_audioDump;
          self->_audioDump = v36;

          long long v205 = 0u;
          long long v206 = 0u;
          long long v203 = 0u;
          long long v204 = 0u;
          id v31 = self->_bufferedAudioPackets;
          id v38 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v203 objects:v222 count:16];
          if (v38)
          {
            uint64_t v39 = *(void *)v204;
            do
            {
              for (i = 0; i != v38; i = (char *)i + 1)
              {
                if (*(void *)v204 != v39) {
                  objc_enumerationMutation(v31);
                }
                [(LSRAudioDump *)self->_audioDump appendBytes:*(void *)(*((void *)&v203 + 1) + 8 * i)];
              }
              id v38 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v203 objects:v222 count:16];
            }
            while (v38);
          }
        }
        else if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v29;
          *(_WORD *)&buf[22] = 2112;
          v214 = v27;
          _os_log_debug_impl((void *)&_mh_execute_header, &v31->super.super, OS_LOG_TYPE_DEBUG, "%s Dump will not be created because dump identifier (%@) doesn't match the qualified task identifier (%@).", buf, 0x20u);
        }
      }
    }
    id v41 = +[NSProcessInfo processInfo];
    [v41 systemUptime];
    double v43 = v42;

    p_requestParameters = &self->_requestParameters;
    objc_storeStrong((id *)&self->_requestParameters, a3);
    id v44 = [v5 task];
    LODWORD(v41) = v44 == 0;

    if (v41)
    {
      v58 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
        _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%s task name is nil", buf, 0xCu);
      }
      v59 = +[NSBundle bundleForClass:objc_opt_class()];
      id v51 = [v59 localizedStringForKey:@"task name is nil" value:&stru_10005A2E0 table:@"Localizable"];

      v60 = +[NSError lsr_errorWithCode:3 description:v51];
      [(LSRConnection *)self reportFailureWithError:v60];

      goto LABEL_146;
    }
    id v45 = [v5 language];
    id v46 = [v5 recognitionOverrides];
    id v47 = [v5 modelOverrideURL];
    id v48 = [v5 task];
    id v49 = [v5 clientIdentifier];
    id v202 = 0;
    unsigned __int8 v50 = [(LSRConnection *)self prepareRecognizerWithLanguage:v45 recognitionOverrides:v46 modelOverrideURL:v47 anyConfiguration:0 task:v48 clientID:v49 error:&v202];
    id v51 = v202;

    if ((v50 & 1) == 0)
    {
      [(LSRConnection *)self reportFailureWithError:v51];
LABEL_146:

      goto LABEL_24;
    }
    if (SFIsInternalInstall())
    {
      id v52 = [(SFRequestParameters *)*p_requestParameters task];
      unsigned __int8 v53 = [v52 isEqualToString:kSFSpeechRecognizerTaskCaptioning];

      if (v53)
      {
        QuasarC_setLogLevel();
        v54 = +[NSUserDefaults standardUserDefaults];
        __int16 v55 = [v54 stringForKey:kSFSpeechRecognizerQuasarLoggingKey];

        if ([v55 length] && objc_msgSend(v55, "intValue"))
        {
          id v56 = SFLogConnection;
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            unsigned int v57 = [v55 intValue];
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v57;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s Customized Quasar log level to:%d", buf, 0x12u);
          }

          [v55 intValue];
          QuasarC_setLogLevel();
        }
      }
    }
    else
    {
      QuasarC_setLogLevel();
    }
    v61 = +[NSProcessInfo processInfo];
    [v61 systemUptime];
    self->_recognitionBeginTime = v62;

    location = (id *)&self->_recognizer;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_recognizer);
    [(SFRequestParameters *)self->_requestParameters maximumRecognitionDuration];
    objc_msgSend(WeakRetained, "setMaximumRecognitionDuration:");

    id v64 = objc_loadWeakRetained((id *)&self->_recognizer);
    objc_msgSend(v64, "setConcatenateUtterances:", -[SFRequestParameters detectMultipleUtterances](self->_requestParameters, "detectMultipleUtterances") ^ 1);

    id v65 = objc_loadWeakRetained((id *)&self->_recognizer);
    objc_msgSend(v65, "setDisableAutoPunctuation:", -[SFRequestParameters enableAutoPunctuation](self->_requestParameters, "enableAutoPunctuation") ^ 1);

    unsigned int v66 = [(SFRequestParameters *)self->_requestParameters narrowband];
    uint64_t v67 = 16000;
    if (v66) {
      uint64_t v67 = 8000;
    }
    uint64_t v182 = v67;
    v68 = (void *)qword_100065488;
    v69 = [v5 task];
    id v70 = v68;
    id v71 = v69;
    v72 = [v70 tasks];
    if ([v72 containsObject:v71])
    {
      id v186 = v71;
      id v73 = v51;
    }
    else
    {
      v74 = +[NSBundle bundleForClass:objc_opt_class()];
      v75 = [v74 localizedStringForKey:@"Task %@ not available for %@, supported tasks are %@", &stru_10005A2E0, @"Localizable" value table];
      v76 = [v70 language];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v75, v71, v76, v72);
      os_log_t logb = (os_log_t)objc_claimAutoreleasedReturnValue();

      *(void *)v208 = NSLocalizedFailureReasonErrorKey;
      *(void *)buf = logb;
      v77 = +[NSDictionary dictionaryWithObjects:buf forKeys:v208 count:1];
      id v73 = +[NSError errorWithDomain:@"kLSRErrorDomain" code:3 userInfo:v77];

      id v186 = 0;
    }

    id v184 = v73;
    if (!v186)
    {
      v94 = +[NSBundle bundleForClass:objc_opt_class()];
      v95 = [v94 localizedStringForKey:@"Failed to find task for recognizer" value:&stru_10005A2E0 table:@"Localizable"];

      if (v184)
      {
        v220[0] = NSLocalizedDescriptionKey;
        v220[1] = NSUnderlyingErrorKey;
        v221[0] = v95;
        v221[1] = v184;
        +[NSDictionary dictionaryWithObjects:v221 forKeys:v220 count:2];
      }
      else
      {
        NSErrorUserInfoKey v218 = NSLocalizedDescriptionKey;
        v219 = v95;
        +[NSDictionary dictionaryWithObjects:&v219 forKeys:&v218 count:1];
      v185 = };
      v96 = +[NSError errorWithDomain:@"kLSRErrorDomain" code:3 userInfo:v185];
      [(LSRConnection *)self reportFailureWithError:v96];

LABEL_145:
      id v51 = v184;
      goto LABEL_146;
    }
    v78 = [(SFRequestParameters *)*p_requestParameters inlineItemList];
    if (!v78
      || ([(SFRequestParameters *)*p_requestParameters inlineItemList],
          v79 = objc_claimAutoreleasedReturnValue(),
          BOOL v80 = [v79 count] == 0,
          v79,
          v78,
          v80))
    {
      v88 = objc_loadWeakRetained(location);
      [v88 setJitProfileData:0];
    }
    else
    {
      v81 = +[NSProcessInfo processInfo];
      [v81 systemUptime];
      double v83 = v82;

      v84 = SFLogConnection;
      if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
      {
        v85 = [(SFRequestParameters *)*p_requestParameters inlineItemList];
        id v86 = [v85 count];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v86;
        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "%s Inline LME input size=%zu", buf, 0x16u);
      }
      v87 = [(SFRequestParameters *)self->_requestParameters language];
      v88 = +[LSRConnection _jitProfileWithLanguage:v87 modelRoot:self->_modelRoot];

      if (v88)
      {
        v89 = [(SFRequestParameters *)*p_requestParameters inlineItemList];
        v90 = [v88 jitProfileFromContextualStrings:v89];

        if (!v90)
        {
          v91 = SFLogConnection;
          if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
            _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_INFO, "%s Failed to build jitData", buf, 0xCu);
          }
        }
        id v92 = objc_loadWeakRetained(location);
        [v92 setJitProfileData:v90];

        v93 = SFLogConnection;
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "%s Set JIT profile for the request", buf, 0xCu);
        }
      }
      else
      {
        v90 = SFLogConnection;
        if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = 0;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, "%s Failed to build jitProfile with error %@", buf, 0x16u);
        }
      }

      v97 = +[NSProcessInfo processInfo];
      [v97 systemUptime];
      self->_jitLmeProcessingTime = v98 - v83;
    }
    uint64_t v99 = [(SFRequestParameters *)self->_requestParameters language];
    v100 = (void *)qword_100065460;
    qword_100065460 = v99;

    objc_storeStrong((id *)&qword_100065470, self->_modelRoot);
    v101 = [(SFRequestParameters *)self->_requestParameters dynamicLanguageModel];

    if (!v101)
    {
      v185 = &__NSArray0__struct;
LABEL_104:
      id v124 = objc_loadWeakRetained(location);
      [v124 setExtraLmList:v185];

      v125 = [(SFRequestParameters *)*p_requestParameters dynamicVocabulary];

      if (v125)
      {
        v126 = [(SFRequestParameters *)*p_requestParameters dynamicVocabulary];
        v127 = [v126 path];
        v128 = +[NSData dataWithContentsOfFile:v127];

        if (v128)
        {
          v129 = SFLogConnection;
          if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
          {
            v130 = [(SFRequestParameters *)*p_requestParameters dynamicVocabulary];
            id v131 = [v130 path];
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v131;
            _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_INFO, "%s Loaded Dynamic Vocab: %@", buf, 0x16u);
          }
          id v132 = objc_loadWeakRetained(location);
          [v132 setUserProfileData:v128];
        }
      }
      else
      {
        v128 = objc_loadWeakRetained(location);
        [v128 setUserProfileData:0];
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v214 = sub_10003B16C;
      v215 = sub_10003B17C;
      id v216 = 0;
      v201[0] = _NSConcreteStackBlock;
      v201[1] = 3221225472;
      v201[2] = sub_10003DBA8;
      v201[3] = &unk_100059CF8;
      v201[4] = self;
      v201[5] = buf;
      v180 = objc_retainBlock(v201);
      v133 = [(SFRequestParameters *)self->_requestParameters task];
      v134 = [(SFRequestParameters *)*p_requestParameters taskIdentifier];
      id v135 = v133;
      id v136 = v134;
      if ([v135 isEqualToString:kSFSpeechRecognizerTaskCaptioning]
        && ([v136 isEqualToString:kSFSpeechRecognizerTaskIdentifierCallScreening] & 1) != 0
        || ([v135 isEqualToString:kSFSpeechRecognizerTaskVoiceMail] & 1) != 0)
      {
        BOOL v137 = 1;
      }
      else
      {
        v138 = +[MCProfileConnection sharedConnection];
        BOOL v137 = [v138 effectiveBoolValueForSetting:MCFeatureAssistantProfanityFilterForced] == 1;
      }
      v139 = SFLogConnection;
      if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v208 = 136315394;
        *(void *)&v208[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
        __int16 v209 = 1024;
        LODWORD(v210) = v137;
        _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_INFO, "%s Censor Speech enabled: %d", v208, 0x12u);
      }

      if (v137)
      {
        ((void (*)(void))v180[2])();
        id v181 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v181 = 0;
      }
      id v140 = objc_loadWeakRetained(location);
      [v140 setRecognitionReplacements:v181];

      if ([v186 isEqualToString:kSFSpeechRecognizerTaskVoiceMail])
      {
        v141 = VoicemailConfidenceSubtractionForLanguage(self->_modelRoot);
        if (!v141)
        {
          v142 = ((void (*)(void))v180[2])();
          v141 = EtiquetteConfidenceSubtraction(v142);
        }
        id v143 = objc_loadWeakRetained(location);
        [v143 setRecognitionConfidenceSubtraction:v141];
      }
      else
      {
        v141 = objc_loadWeakRetained(location);
        [v141 setRecognitionConfidenceSubtraction:&__NSDictionary0__struct];
      }

      id v144 = objc_loadWeakRetained(location);
      v183 = [v144 activeConfiguration];

      os_log_t loga = (os_log_t)[v183 copy];
      v145 = [loga farFieldFilter];
      LOBYTE(v144) = v145 == 0;

      if ((v144 & 1) == 0)
      {
        v146 = [loga farFieldFilter];
        v147 = [v146 setByAddingObject:&__kCFBooleanFalse];
        [loga setFarFieldFilter:v147];
      }
      v148 = [loga samplingRateFilter];
      BOOL v149 = v148 == 0;

      if (!v149)
      {
        v150 = [loga samplingRateFilter];
        v151 = +[NSNumber numberWithUnsignedInteger:v182];
        v152 = [v150 setByAddingObject:v151];
        [loga setSamplingRateFilter:v152];
      }
      v153 = [loga taskTypeFilter];
      BOOL v154 = v153 == 0;

      if (!v154)
      {
        v155 = [loga taskTypeFilter];
        v156 = [v155 setByAddingObject:v186];
        [loga setTaskTypeFilter:v156];
      }
      v157 = [loga atypicalSpeechFilter];
      BOOL v158 = v157 == 0;

      if (!v158)
      {
        v159 = [loga atypicalSpeechFilter];
        v160 = [v159 setByAddingObject:&__kCFBooleanFalse];
        [loga setAtypicalSpeechFilter:v160];
      }
      [loga setDeviceIdFilter:0];
      v161 = SFLogConnection;
      if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
      {
        sub_10003DD5C(v183);
        id v162 = (id)objc_claimAutoreleasedReturnValue();
        sub_10003DD5C(loga);
        id v163 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v208 = 136315650;
        *(void *)&v208[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
        __int16 v209 = 2112;
        id v210 = v162;
        __int16 v211 = 2112;
        id v212 = v163;
        _os_log_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_INFO, "%s Changing active configuration from \n%@ to \n%@", v208, 0x20u);
      }
      id v164 = objc_loadWeakRetained(location);
      [v164 setActiveConfiguration:loga];

      id v165 = objc_loadWeakRetained(location);
      v166 = [(SFRequestParameters *)*p_requestParameters language];
      v167 = [v165 runRecognitionWithResultStream:self language:v166 task:v186 samplingRate:v182];
      audioBuffer = self->_audioBuffer;
      self->_audioBuffer = v167;

      objc_storeStrong((id *)&qword_100065440, self->_audioBuffer);
      v169 = +[NSProcessInfo processInfo];
      [v169 systemUptime];
      self->_asrInitializationTime = v170 - v43;

      v171 = SFAnalyticsEventTypeGetName();
      v196 = _NSConcreteStackBlock;
      uint64_t v197 = 3221225472;
      v198 = sub_10003DE58;
      v199 = &unk_100059D20;
      v200 = self;
      AnalyticsSendEventLazy();

      long long v194 = 0u;
      long long v195 = 0u;
      long long v192 = 0u;
      long long v193 = 0u;
      v172 = self->_bufferedAudioPackets;
      id v173 = [(NSMutableArray *)v172 countByEnumeratingWithState:&v192 objects:v207 count:16];
      if (v173)
      {
        uint64_t v174 = *(void *)v193;
        do
        {
          for (j = 0; j != v173; j = (char *)j + 1)
          {
            if (*(void *)v193 != v174) {
              objc_enumerationMutation(v172);
            }
            v176 = *(void **)(*((void *)&v192 + 1) + 8 * (void)j);
            unint64_t v177 = (unint64_t)[v176 length];
            v178 = self->_audioBuffer;
            id v179 = v176;
            -[_EARSpeechRecognitionAudioBuffer addAudioSamples:count:](v178, "addAudioSamples:count:", [v179 bytes], v177 >> 1);
            [(LSRConnection *)self updateAudioDuration:v179];
          }
          id v173 = [(NSMutableArray *)v172 countByEnumeratingWithState:&v192 objects:v207 count:16];
        }
        while (v173);
      }

      [(NSMutableArray *)self->_bufferedAudioPackets removeAllObjects];
      if (self->_bufferedAudioEnded)
      {
        [(_EARSpeechRecognitionAudioBuffer *)self->_audioBuffer endAudio];
        self->_bufferedAudioEnded = 0;
      }
      +[LSRConnection _cancelCooldownTimer];

      _Block_object_dispose(buf, 8);
      goto LABEL_145;
    }
    v102 = [(SFRequestParameters *)*p_requestParameters dynamicLanguageModel];
    v103 = [v102 path];
    unsigned int v104 = +[_EARArtifact isValid:v103];

    if (v104)
    {
      id v105 = objc_alloc((Class)_EARAppLmArtifact);
      v106 = [(SFRequestParameters *)*p_requestParameters dynamicLanguageModel];
      v107 = [v106 path];
      os_log_t log = (os_log_t)[v105 initWithPath:v107];

      if (log)
      {
        id v108 = objc_loadWeakRetained(location);
        v109 = [v108 modelInfo];
        v110 = [v109 version];
        id v111 = objc_loadWeakRetained(location);
        v112 = [v111 modelInfo];
        v113 = [v112 language];
        unsigned int v114 = [log isAdaptableToSpeechModelVersion:v110 locale:v113];

        if (v114)
        {
          v115 = [log loadLmHandle];
          v116 = SFLogConnection;
          BOOL v117 = os_log_type_enabled(v116, OS_LOG_TYPE_INFO);
          if (v115)
          {
            if (v117)
            {
              v118 = [(SFRequestParameters *)*p_requestParameters dynamicLanguageModel];
              id v119 = [v118 path];
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v119;
              _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_INFO, "%s Loaded Dynamic LM: %@", buf, 0x16u);
            }
            v217 = v115;
            v185 = +[NSArray arrayWithObjects:&v217 count:1];
            goto LABEL_102;
          }
          if (v117)
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
            _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_INFO, "%s Failed to load Dynamic LM from Artifact", buf, 0xCu);
          }

          v115 = 0;
        }
        else
        {
          v115 = SFLogConnection;
          if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
          {
            v122 = [(SFRequestParameters *)*p_requestParameters dynamicLanguageModel];
            id v123 = [v122 path];
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v123;
            _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_INFO, "%s Dynamic LM at %@ was out of sync with current asset", buf, 0x16u);
          }
        }
        v185 = &__NSArray0__struct;
LABEL_102:

        goto LABEL_103;
      }
      os_log_t log = 0;
    }
    else
    {
      os_log_t log = (os_log_t)SFLogConnection;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        v120 = [(SFRequestParameters *)*p_requestParameters dynamicLanguageModel];
        id v121 = [v120 path];
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v121;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s Dynamic LM at %@ was not valid", buf, 0x16u);
      }
    }
    v185 = &__NSArray0__struct;
LABEL_103:

    goto LABEL_104;
  }
LABEL_21:
  id v19 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[LSRConnection startRecordedAudioDictationWithParameters:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Error: %@", buf, 0x16u);
  }
  [(LSRConnection *)self reportFailureWithError:v15];
LABEL_24:
}

- (void)preloadRecognizerForLanguage:(id)a3 task:(id)a4 clientID:(id)a5 recognitionOverrides:(id)a6 modelOverrideURL:(id)a7 completion:(id)a8
{
  id v14 = (void (**)(id, void))a8;
  id v19 = 0;
  LOBYTE(a6) = [(LSRConnection *)self prepareRecognizerWithLanguage:a3 recognitionOverrides:a6 modelOverrideURL:a7 anyConfiguration:1 task:a4 clientID:a5 error:&v19];
  id v15 = v19;
  id v16 = 0;
  if ((a6 & 1) == 0)
  {
    id v17 = SFLogConnection;
    BOOL v18 = os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR);
    id v16 = v15;
    if (v18)
    {
      *(_DWORD *)buf = 136315394;
      CFStringRef v21 = "-[LSRConnection preloadRecognizerForLanguage:task:clientID:recognitionOverrides:modelOverrideURL:completion:]";
      __int16 v22 = 2112;
      id v23 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Failed to prepare recognizer in advance: %@", buf, 0x16u);
      id v16 = v15;
    }
  }
  ((void (**)(id, id))v14)[2](v14, v16);
}

- (BOOL)prepareRecognizerWithLanguage:(id)a3 recognitionOverrides:(id)a4 modelOverrideURL:(id)a5 anyConfiguration:(BOOL)a6 task:(id)a7 clientID:(id)a8 error:(id *)a9
{
  BOOL v72 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id obj = a7;
  id v17 = a7;
  id v18 = a8;
  id v19 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    double v82 = "-[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Preparing recognizer...", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100065438);
  uint64_t v20 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
  CFStringRef v21 = (void *)v20;
  if (v20) {
    __int16 v22 = (void *)v20;
  }
  else {
    __int16 v22 = v14;
  }
  CFStringRef v23 = v22;

  BOOL v24 = v17;
  if (v17) {
    unint64_t v25 = SFEntitledAssetTypeForTaskName();
  }
  else {
    unint64_t v25 = 3;
  }
  self->_modelAssetType = v25;
  v76[1] = 0;
  __int16 v26 = (__CFString *)v23;
  v74 = v18;
  v75 = v16;
  id v27 = +[LSRConnection modelRootWithLanguage:assetType:clientID:modelOverrideURL:error:](LSRConnection, "modelRootWithLanguage:assetType:clientID:modelOverrideURL:error:", v23);
  id v28 = 0;
  id v29 = v28;
  id v73 = v27;
  if (!v27 || v28)
  {
    id v33 = (void *)SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      id v64 = v33;
      id v65 = [v29 localizedDescription];
      *(_DWORD *)buf = 136315650;
      double v82 = "-[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:]";
      __int16 v83 = 2112;
      CFStringRef v84 = @"modelRoot is nil";
      __int16 v85 = 2112;
      id v86 = v65;
      _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%s %@ %@", buf, 0x20u);
    }
    if (a9)
    {
      id v34 = +[NSBundle bundleForClass:objc_opt_class()];
      id v35 = [v34 localizedStringForKey:@"Failed to access assets" value:&stru_10005A2E0 table:@"Localizable"];

      if (v29)
      {
        v91[0] = NSLocalizedDescriptionKey;
        v91[1] = NSUnderlyingErrorKey;
        v92[0] = v35;
        v92[1] = v29;
        id v36 = (void **)v92;
        __int16 v37 = (NSErrorUserInfoKey *)v91;
        uint64_t v38 = 2;
      }
      else
      {
        NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
        v90 = v35;
        id v36 = &v90;
        __int16 v37 = &v89;
        uint64_t v38 = 1;
      }
      v61 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v37 count:v38];
      *a9 = +[NSError errorWithDomain:@"kLSRErrorDomain" code:102 userInfo:v61];
    }
    goto LABEL_49;
  }
  p_modelRoot = &self->_modelRoot;
  objc_storeStrong((id *)&self->_modelRoot, v27);
  if (qword_100065440)
  {
    id v30 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      double v82 = "-[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%s Recognizer is running, cancel the request", buf, 0xCu);
    }
    [(id)qword_100065478 cancelRecognition];
    id v31 = (void *)qword_100065440;
    qword_100065440 = 0;
  }
  if (qword_100065478)
  {
    if ([(id)qword_100065460 isEqualToString:v23]
      && [(id)qword_100065470 isEqualToString:*p_modelRoot]
      && ((id)qword_100065480 == v15 || [(id)qword_100065480 isEqualToDictionary:v15]))
    {
      id v32 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
      {
        v69 = *p_modelRoot;
        *(_DWORD *)buf = 136315906;
        double v82 = "-[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:"
              "clientID:error:]";
        __int16 v83 = 2112;
        CFStringRef v84 = v23;
        __int16 v85 = 2112;
        id v86 = v69;
        __int16 v87 = 2112;
        id v88 = v15;
        _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%s Using cached recognizer for language=%@ modelRoot=%@ overrides=%@", buf, 0x2Au);
      }
      objc_storeWeak((id *)&self->_recognizer, (id)qword_100065478);
      id v29 = 0;
      goto LABEL_35;
    }
    uint64_t v39 = (void *)qword_100065478;
    if (qword_100065478)
    {
      id v40 = +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForNothing];
      [v39 setActiveConfiguration:v40];

      id v41 = (void *)qword_100065478;
      qword_100065478 = 0;
    }
  }
  double v42 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v66 = *p_modelRoot;
    *(_DWORD *)buf = 136315906;
    double v82 = "-[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:]";
    __int16 v83 = 2112;
    CFStringRef v84 = v23;
    __int16 v85 = 2112;
    id v86 = v66;
    __int16 v87 = 2112;
    id v88 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%s Initializing a new recognizer for language=%@ modelRoot=%@ overrides=%@", buf, 0x2Au);
  }
  modelRoot = self->_modelRoot;
  v76[0] = 0;
  id v44 = v15;
  id v45 = +[_EARSpeechRecognizer _speechRecognizerWithLanguage:v23 overrides:v15 anyConfiguration:v72 taskConfiguration:v17 modelRoot:modelRoot error:v76 modelLoadTime:&self->_modelLoadTime];
  id v29 = v76[0];
  objc_storeWeak((id *)&self->_recognizer, v45);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_recognizer);
  if (WeakRetained)
  {
    id v47 = objc_loadWeakRetained((id *)&self->_recognizer);
    id v48 = (void *)qword_100065478;
    qword_100065478 = (uint64_t)v47;

    objc_storeStrong((id *)&qword_100065480, a4);
    id v49 = objc_loadWeakRetained((id *)&self->_recognizer);
    uint64_t v50 = [v49 modelInfo];
    id v51 = (void *)qword_100065488;
    qword_100065488 = v50;

    objc_storeStrong((id *)&qword_100065460, v22);
    objc_storeStrong((id *)&qword_100065470, *p_modelRoot);
    objc_storeStrong((id *)&qword_100065490, obj);
  }
  id v15 = v44;
  __int16 v26 = (__CFString *)v23;
LABEL_35:
  BOOL v24 = v17;
  if (qword_100065478) {
    +[LSRConnection _scheduleCooldownTimer];
  }
  id v52 = objc_loadWeakRetained((id *)&self->_recognizer);

  unsigned __int8 v53 = (void *)SFLogConnection;
  if (!v52)
  {
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v67 = v53;
      v68 = [v29 localizedDescription];
      *(_DWORD *)buf = 136315650;
      double v82 = "-[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:]";
      __int16 v83 = 2112;
      CFStringRef v84 = @"_EARSpeechRecognizer is nil";
      __int16 v85 = 2112;
      id v86 = v68;
      _os_log_error_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%s %@ %@", buf, 0x20u);
    }
    if (a9)
    {
      if (v29)
      {
        v79[0] = NSLocalizedDescriptionKey;
        v79[1] = NSUnderlyingErrorKey;
        v80[0] = @"Failed to initialize recognizer";
        v80[1] = v29;
        v58 = (const __CFString **)v80;
        v59 = (NSErrorUserInfoKey *)v79;
        uint64_t v60 = 2;
      }
      else
      {
        NSErrorUserInfoKey v77 = NSLocalizedDescriptionKey;
        CFStringRef v78 = @"Failed to initialize recognizer";
        v58 = &v78;
        v59 = &v77;
        uint64_t v60 = 1;
      }
      double v62 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v59 count:v60];
      *a9 = +[NSError errorWithDomain:@"kLSRErrorDomain" code:300 userInfo:v62];
    }
LABEL_49:
    BOOL v54 = 0;
    goto LABEL_50;
  }
  BOOL v54 = 1;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    __int16 v55 = (void *)qword_100065488;
    id v56 = v53;
    unsigned int v57 = [v55 description];
    *(_DWORD *)buf = 136315394;
    double v82 = "-[LSRConnection prepareRecognizerWithLanguage:recognitionOverrides:modelOverrideURL:anyConfiguration:task:clientID:error:]";
    __int16 v83 = 2112;
    CFStringRef v84 = v57;
    BOOL v54 = 1;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s Created _EARSpeechRecognizer successfully with modelInfo: %@", buf, 0x16u);

    BOOL v24 = v17;
  }
LABEL_50:

  return v54;
}

- (id)_requestContext
{
  v3 = (void *)SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
  {
    requestParameters = self->_requestParameters;
    id v5 = v3;
    id v6 = [(SFRequestParameters *)requestParameters language];
    unsigned int v7 = [(SFRequestParameters *)self->_requestParameters task];
    id v8 = [(SFRequestParameters *)self->_requestParameters taskIdentifier];
    unsigned int v9 = [(SFRequestParameters *)self->_requestParameters narrowband];
    id v10 = [(SFRequestParameters *)self->_requestParameters applicationName];
    unsigned int v11 = [(SFRequestParameters *)self->_requestParameters enableAutoPunctuation];
    *(_DWORD *)buf = 136316674;
    id v34 = "-[LSRConnection _requestContext]";
    __int16 v35 = 2112;
    id v36 = v6;
    __int16 v37 = 2112;
    uint64_t v38 = v7;
    __int16 v39 = 2112;
    id v40 = v8;
    __int16 v41 = 1024;
    unsigned int v42 = v9;
    __int16 v43 = 2112;
    id v44 = v10;
    __int16 v45 = 1024;
    unsigned int v46 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s RequestContext: language:%@ task:%@ taskIdentifier:%@ narrowband:%d appname:%@ enableAutoPunctuation:%d", buf, 0x40u);
  }
  uint64_t v12 = [(SFRequestParameters *)self->_requestParameters language];
  char v13 = (void *)v12;
  if (v12) {
    CFStringRef v14 = (const __CFString *)v12;
  }
  else {
    CFStringRef v14 = @"none";
  }
  v32[0] = v14;
  v31[1] = kSFCoreAnalyticsTaskKey;
  uint64_t v15 = [(SFRequestParameters *)self->_requestParameters task];
  id v16 = (void *)v15;
  if (v15) {
    CFStringRef v17 = (const __CFString *)v15;
  }
  else {
    CFStringRef v17 = @"none";
  }
  v32[1] = v17;
  v31[2] = kSFCoreAnalyticsTaskIdentifierKey;
  uint64_t v18 = [(SFRequestParameters *)self->_requestParameters taskIdentifier];
  id v19 = (void *)v18;
  if (v18) {
    CFStringRef v20 = (const __CFString *)v18;
  }
  else {
    CFStringRef v20 = @"none";
  }
  v32[2] = v20;
  v31[3] = kSFCoreAnalyticsNarrowbandKey;
  CFStringRef v21 = +[NSNumber numberWithBool:[(SFRequestParameters *)self->_requestParameters narrowband]];
  v32[3] = v21;
  v31[4] = kSFCoreAnalyticsAppnameKey;
  uint64_t v22 = [(SFRequestParameters *)self->_requestParameters applicationName];
  CFStringRef v23 = (void *)v22;
  if (v22) {
    CFStringRef v24 = (const __CFString *)v22;
  }
  else {
    CFStringRef v24 = @"none";
  }
  v32[4] = v24;
  v32[5] = &__kCFBooleanTrue;
  v31[5] = kSFCoreAnalyticsOndeviceKey;
  v31[6] = kSFCoreAnalyticsUsesCustomLmKey;
  unint64_t v25 = [(SFRequestParameters *)self->_requestParameters dynamicLanguageModel];
  __int16 v26 = +[NSNumber numberWithInt:v25 != 0];
  v32[6] = v26;
  v31[7] = kSFCoreAnalyticsUsesCustomVocabKey;
  id v27 = [(SFRequestParameters *)self->_requestParameters dynamicVocabulary];
  id v28 = +[NSNumber numberWithInt:v27 != 0];
  v32[7] = v28;
  id v29 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:8];

  return v29;
}

- (BOOL)_callerHasWritePriviledge:(id)a3
{
  id v4 = a3;
  [(LSRConnection *)self _auditToken];
  int v5 = sandbox_check_by_audit_token();
  id v6 = SFLogConnection;
  BOOL v7 = os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v11 = "-[LSRConnection _callerHasWritePriviledge:]";
      __int16 v12 = 2112;
      id v13 = v4;
      id v8 = "%s Caller does not have write priviledges for: %@";
LABEL_7:
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v8, buf, 0x16u);
    }
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v11 = "-[LSRConnection _callerHasWritePriviledge:]";
    __int16 v12 = 2112;
    id v13 = v4;
    id v8 = "%s Caller has write priviledges for: %@";
    goto LABEL_7;
  }

  return v5 == 0;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)_auditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_connection;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result auditToken];
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (BOOL)_consumeSandboxExtensions:(id)a3 error:(id *)a4
{
  id v6 = (char *)a3;
  BOOL v7 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v33 = "-[LSRConnection _consumeSandboxExtensions:error:]";
    __int16 v34 = 2112;
    __int16 v35 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Consuming sandbox extensions: %@", buf, 0x16u);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (!v9) {
    goto LABEL_11;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v26;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(v8);
      }
      [*(id *)(*((void *)&v25 + 1) + 8 * i) UTF8String];
      uint64_t v13 = sandbox_extension_consume();
      if (v13 < 0)
      {
        id v16 = (void *)SFLogConnection;
        if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = v16;
          CFStringRef v23 = __error();
          CFStringRef v24 = strerror(*v23);
          *(_DWORD *)buf = 136315394;
          id v33 = "-[LSRConnection _consumeSandboxExtensions:error:]";
          __int16 v34 = 2080;
          __int16 v35 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Error consuming sandbox extension: %s", buf, 0x16u);

          if (!a4) {
            goto LABEL_15;
          }
        }
        else if (!a4)
        {
          goto LABEL_15;
        }
        v29[0] = NSLocalizedDescriptionKey;
        CFStringRef v17 = __error();
        uint64_t v18 = +[NSString stringWithFormat:@"Error consuming sandbox extension: %s", strerror(*v17)];
        v30[0] = v18;
        v29[1] = NSUnderlyingErrorKey;
        id v19 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
        v30[1] = v19;
        CFStringRef v20 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
        *a4 = +[NSError errorWithDomain:@"kLSRErrorDomain" code:1 userInfo:v20];

        LOBYTE(a4) = 0;
        goto LABEL_15;
      }
      consumedSandboxExtensions = self->_consumedSandboxExtensions;
      uint64_t v15 = +[NSNumber numberWithLongLong:v13];
      [(NSMutableArray *)consumedSandboxExtensions addObject:v15];
    }
    id v10 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_11:
  LOBYTE(a4) = 1;
LABEL_15:

  return (char)a4;
}

- (id)_delegate
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxy];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  [(_EARSpeechRecognitionAudioBuffer *)self->_audioBuffer cancelRecognition];
  [(NSMutableArray *)self->_consumedSandboxExtensions enumerateObjectsUsingBlock:&stru_100059C58];
  audioBuffer = self->_audioBuffer;
  if (audioBuffer == (_EARSpeechRecognitionAudioBuffer *)qword_100065440)
  {
    qword_100065440 = 0;
  }
  id v4 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v7 = "-[LSRConnection dealloc]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s %@ deallocating", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)LSRConnection;
  [(LSRConnection *)&v5 dealloc];
}

- (LSRConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)LSRConnection;
  id v6 = [(LSRConnection *)&v30 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    __int16 v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    bufferedAudioPackets = v7->_bufferedAudioPackets;
    v7->_bufferedAudioPackets = v8;

    id v10 = (SFRequestParameters *)objc_alloc_init((Class)SFRequestParameters);
    requestParameters = v7->_requestParameters;
    v7->_requestParameters = v10;

    uint64_t v12 = objc_opt_new();
    earInterface = v7->_earInterface;
    v7->_earInterface = (_TtC22localspeechrecognition12EARInterface *)v12;

    uint64_t v14 = +[AssistantAssetDelegateInterface sharedInstance];
    assistantAssetDelegateInterface = v7->_assistantAssetDelegateInterface;
    v7->_assistantAssetDelegateInterface = (_TtC22localspeechrecognition31AssistantAssetDelegateInterface *)v14;

    uint64_t v16 = +[GeneralASRAssetDelegateInterface sharedInstance];
    generalASRAssetDelegateInterface = v7->_generalASRAssetDelegateInterface;
    v7->_generalASRAssetDelegateInterface = (_TtC22localspeechrecognition32GeneralASRAssetDelegateInterface *)v16;

    [(NSXPCConnection *)v7->_connection _setQueue:qword_100065438];
    signal(15, (void (__cdecl *)(int))1);
    uint64_t v18 = dispatch_get_global_queue(21, 0);
    sigterm_queue = v7->sigterm_queue;
    v7->sigterm_queue = (OS_dispatch_queue *)v18;

    dispatch_source_t v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)v7->sigterm_queue);
    sigterm_source = v7->sigterm_source;
    v7->sigterm_source = (OS_dispatch_source *)v20;

    dispatch_source_set_event_handler((dispatch_source_t)v7->sigterm_source, &stru_100059BF0);
    dispatch_activate((dispatch_object_t)v7->sigterm_source);
    objc_initWeak(&location, v7);
    CFStringRef v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    long long v26 = sub_10003FA2C;
    long long v27 = &unk_100059C18;
    objc_copyWeak(&v28, &location);
    uint64_t v22 = objc_retainBlock(&v24);
    objc_msgSend(v5, "setInterruptionHandler:", v22, v24, v25, v26, v27);
    [v5 setInvalidationHandler:v22];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (LSRConnection)init
{
  return 0;
}

+ (void)_cachedRecognizerCleanUp
{
  v2 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    uint64_t v14 = "+[LSRConnection _cachedRecognizerCleanUp]";
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s _cachedRecognizerCleanUp", (uint8_t *)&v13, 0xCu);
  }
  v3 = (void *)qword_100065478;
  id v4 = +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForNothing];
  [v3 setActiveConfiguration:v4];

  id v5 = (void *)qword_100065478;
  qword_100065478 = 0;

  id v6 = (void *)qword_100065460;
  qword_100065460 = 0;

  BOOL v7 = (void *)qword_100065470;
  qword_100065470 = 0;

  __int16 v8 = (void *)qword_100065480;
  qword_100065480 = 0;

  id v9 = (void *)qword_100065468;
  qword_100065468 = 0;

  id v10 = (void *)qword_100065488;
  qword_100065488 = 0;

  uint64_t v11 = (void *)qword_100065490;
  qword_100065490 = 0;

  uint64_t v12 = +[SFEntitledAssetManager sharedInstance];
  [v12 releaseAssetSets];
}

+ (void)_cooldownTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100065438);
  v3 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "+[LSRConnection _cooldownTimerFired]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s _cooldownTimerFired", (uint8_t *)&v4, 0xCu);
  }
  +[LSRConnection _cachedRecognizerCleanUp];
  [a1 _cancelCooldownTimer];
}

+ (void)_cancelCooldownTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100065438);
  v2 = qword_100065498;
  if (qword_100065498)
  {
    v3 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 136315138;
      id v6 = "+[LSRConnection _cancelCooldownTimer]";
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s _cancelCooldownTimer", (uint8_t *)&v5, 0xCu);
      v2 = qword_100065498;
    }
    dispatch_source_cancel(v2);
    int v4 = (void *)qword_100065498;
    qword_100065498 = 0;
  }
}

+ (void)_scheduleCooldownTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100065438);
  [a1 _cancelCooldownTimer];
  if (!qword_100065498)
  {
    v3 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315138;
      id v9 = "+[LSRConnection _scheduleCooldownTimer]";
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s _scheduleCooldownTimer", (uint8_t *)&v8, 0xCu);
    }
    dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100065438);
    int v5 = (void *)qword_100065498;
    qword_100065498 = (uint64_t)v4;

    dispatch_source_set_event_handler((dispatch_source_t)qword_100065498, &stru_100059D90);
    id v6 = qword_100065498;
    dispatch_time_t v7 = dispatch_time(0, 1000000000 * kCooldownTimerIntervalSeconds);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)qword_100065498);
  }
}

+ (int)countOfRecognizers
{
  return qword_100065478 != 0;
}

+ (id)_jitProfileWithLanguage:(id)a3 modelRoot:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if ([(id)qword_100065460 isEqualToString:v5]) {
      BOOL v7 = qword_100065468 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7 || ![(id)qword_100065470 isEqualToString:v6])
    {
      id v10 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 136315650;
        uint64_t v18 = "+[LSRConnection _jitProfileWithLanguage:modelRoot:]";
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Initialized a new JIT profile builder for language=%@ modelRoot=%@", (uint8_t *)&v17, 0x20u);
      }
      uint64_t v11 = [v6 stringByAppendingPathComponent:@"mini.json"];
      uint64_t v12 = [v6 stringByAppendingPathComponent:@"ncs"];
      id v13 = [objc_alloc((Class)_EARJitProfile) initWithConfiguration:v11 ncsRoot:v12 language:v5];
      uint64_t v14 = (void *)qword_100065468;
      qword_100065468 = (uint64_t)v13;

      id v9 = (id)qword_100065468;
    }
    else
    {
      int v8 = SFLogConnection;
      if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 136315650;
        uint64_t v18 = "+[LSRConnection _jitProfileWithLanguage:modelRoot:]";
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Using cached JIT profile builder for language=%@ modelRoot=%@", (uint8_t *)&v17, 0x20u);
      }
      id v9 = (id)qword_100065468;
    }
  }
  else
  {
    uint64_t v15 = SFLogConnection;
    if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      uint64_t v18 = "+[LSRConnection _jitProfileWithLanguage:modelRoot:]";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Could not locate asset", (uint8_t *)&v17, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

+ (id)modelRootWithLanguage:(id)a3 assetType:(unint64_t)a4 clientID:(id)a5 modelOverrideURL:(id)a6 isSpelling:(BOOL)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = v12;
  uint64_t v16 = _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();
  int v17 = v16;
  id v18 = v15;
  if (v16)
  {
    id v18 = v16;
  }
  if (!v14 || !SFIsInternalInstall())
  {
    id v20 = [objc_alloc((Class)SFEntitledAssetConfig) initWithLanguage:v18 assetType:a4];
    long long v27 = +[SFEntitledAssetManager sharedInstance];
    __int16 v19 = [v27 installedAssetWithConfig:v20 regionId:0 shouldSubscribe:1 subscriberId:v13 expiration:0];

    if (!v19) {
      goto LABEL_6;
    }
LABEL_12:
    id v28 = v19;
    goto LABEL_13;
  }
  __int16 v19 = [v14 path];
  id v20 = 0;
  if (v19) {
    goto LABEL_12;
  }
LABEL_6:
  objc_super v30 = a8;
  id v31 = v13;
  __int16 v21 = +[NSBundle bundleForClass:objc_opt_class()];
  id v22 = [v21 localizedStringForKey:@"No %@ asset for language %@" value:&stru_10005A2E0 table:@"Localizable"];
  [v20 assetType];
  CFStringRef v23 = SFEntitledAssetTypeToString();
  CFStringRef v24 = [v20 language];
  id v32 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v23, v24);

  uint64_t v25 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v36 = "+[LSRConnection modelRootWithLanguage:assetType:clientID:modelOverrideURL:isSpelling:error:]";
    __int16 v37 = 2112;
    uint64_t v38 = v32;
    _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  if (v30)
  {
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    __int16 v34 = v32;
    long long v26 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id *v30 = +[NSError errorWithDomain:@"kLSRErrorDomain" code:101 userInfo:v26];
  }
  id v13 = v31;
LABEL_13:

  return v19;
}

+ (id)modelRootWithLanguage:(id)a3 assetType:(unint64_t)a4 clientID:(id)a5 modelOverrideURL:(id)a6 error:(id *)a7
{
  return [a1 modelRootWithLanguage:a3 assetType:a4 clientID:a5 modelOverrideURL:a6 isSpelling:0 error:a7];
}

+ (id)processStartTimeOnce
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  int v8 = sub_10003B16C;
  id v9 = sub_10003B17C;
  id v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040784;
  block[3] = &unk_100059CA0;
  void block[4] = &v5;
  if (qword_100065458 != -1) {
    dispatch_once(&qword_100065458, block);
  }
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (void)captureProcessStartTime
{
  if (qword_100065448 != -1) {
    dispatch_once(&qword_100065448, &stru_100059C78);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.speech.localspeechrecognition", v2);
    dispatch_source_t v4 = (void *)qword_100065438;
    qword_100065438 = (uint64_t)v3;

    SFLogInitIfNeeded();
  }
}

@end