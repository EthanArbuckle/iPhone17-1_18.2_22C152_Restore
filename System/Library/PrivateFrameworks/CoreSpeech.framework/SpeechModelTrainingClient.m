@interface SpeechModelTrainingClient
+ (void)initialize;
- (SpeechModelTrainingClient)init;
- (id)_serviceProxyWithErrorHandler:(id)a3;
- (void)buildPhoneticMatchWithLanguage:(id)a3 saveIntermediateFsts:(BOOL)a4 completion:(id)a5;
- (void)buildSpeechProfileForLanguage:(id)a3;
- (void)dealloc;
- (void)extractBundledOovs:(id)a3 appLmDataFileSandboxExtension:(id)a4 appBundleId:(id)a5 completion:(id)a6;
- (void)generateAudioWithTexts:(id)a3 language:(id)a4 completion:(id)a5;
- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedNbest:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12;
- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedTokens:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12;
- (void)invalidate;
- (void)trainAllAppLMWithLanguage:(id)a3;
- (void)trainAllAppLMWithLanguage:(id)a3 completion:(id)a4;
- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmDataFileSandboxExtension:(id)a7;
- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmDataFileSandboxExtension:(id)a7 completion:(id)a8;
- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmModelFile:(id)a7 appLmDataFileSandboxExtension:(id)a8;
- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmModelFile:(id)a7 appLmDataFileSandboxExtension:(id)a8 completion:(id)a9;
- (void)trainGlobalNNLMwithFidesSessionURL:(id)a3 completion:(id)a4;
- (void)trainPartialAllAppLMWithLanguage:(id)a3;
- (void)trainPartialAllAppLMWithLanguage:(id)a3 completion:(id)a4;
- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 asset:(id)a5 directory:(id)a6 completion:(id)a7;
- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 asset:(id)a5 fides:(BOOL)a6 activity:(id)a7 completion:(id)a8;
- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 fides:(BOOL)a5 activity:(id)a6 completion:(id)a7;
- (void)trainPersonalizedLMWithLanguage:(id)a3 directory:(id)a4 completion:(id)a5;
- (void)upperCaseString:(id)a3 completion:(id)a4;
- (void)wakeUpWithCompletion:(id)a3;
- (void)xpcExitClean;
@end

@implementation SpeechModelTrainingClient

- (void).cxx_destruct
{
}

- (void)invalidate
{
  v3 = qword_1002A3578;
  if (os_log_type_enabled((os_log_t)qword_1002A3578, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Invalidating", v4, 2u);
  }
  [(NSXPCConnection *)self->_smtConnection invalidate];
}

- (void)xpcExitClean
{
  id v2 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:&stru_10024E2A8];
  [v2 xpcExitClean];
}

- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedNbest:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12
{
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100007D98;
  v29[3] = &unk_10024E158;
  id v30 = a12;
  id v18 = v30;
  id v19 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  v27 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:v29];
  [v27 generateConfusionPairsWithUUID:v26 parameters:v25 language:v24 task:v23 samplingRate:a7 recognizedNbest:v22 recognizedText:v21 correctedText:v20 selectedAlternatives:v19 completion:v18];
}

- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedTokens:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12
{
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100008004;
  v29[3] = &unk_10024E158;
  id v30 = a12;
  id v18 = v30;
  id v19 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  v27 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:v29];
  [v27 generateConfusionPairsWithUUID:v26 parameters:v25 language:v24 task:v23 samplingRate:a7 recognizedTokens:v22 recognizedText:v21 correctedText:v20 selectedAlternatives:v19 completion:v18];
}

- (void)generateAudioWithTexts:(id)a3 language:(id)a4 completion:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000081E4;
  v12[3] = &unk_10024E158;
  id v13 = a5;
  id v8 = v13;
  id v9 = a4;
  id v10 = a3;
  v11 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:v12];
  [v11 generateAudioWithTexts:v10 language:v9 completion:v8];
}

- (void)buildPhoneticMatchWithLanguage:(id)a3 saveIntermediateFsts:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100008424;
  v17[3] = &unk_10024E1A8;
  id v18 = a5;
  id v8 = v18;
  id v9 = a3;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_10000843C;
  v15 = &unk_10024E158;
  v16 = objc_retainBlock(v17);
  id v10 = v16;
  v11 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:&v12];
  objc_msgSend(v11, "buildPhoneticMatchWithLanguage:saveIntermediateFsts:completion:", v9, v5, v8, v12, v13, v14, v15);
}

- (void)buildSpeechProfileForLanguage:(id)a3
{
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    NSLog(@"buildSpeechProfile is unavailable when siri_vocabulary_speech_profile feature flag is enabled.");
  }
  else
  {
    v4 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:&stru_10024E288];
    [v4 buildSpeechProfileForLanguage:v5];
  }
}

- (void)extractBundledOovs:(id)a3 appLmDataFileSandboxExtension:(id)a4 appBundleId:(id)a5 completion:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008790;
  v15[3] = &unk_10024E158;
  id v16 = a6;
  id v10 = v16;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:v15];
  [v14 extractBundledOovs:v13 appLmDataFileSandboxExtension:v12 appBundleId:v11 completion:v10];
}

- (void)trainPartialAllAppLMWithLanguage:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:&stru_10024E268];
  [v8 trainPartialAllAppLMWithLanguage:v7 completion:v6];
}

- (void)trainPartialAllAppLMWithLanguage:(id)a3
{
  id v4 = a3;
  id v5 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:&stru_10024E248];
  [v5 trainPartialAllAppLMWithLanguage:v4];
}

- (void)trainAllAppLMWithLanguage:(id)a3
{
  id v4 = a3;
  id v5 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:&stru_10024E228];
  [v5 trainAllAppLMWithLanguage:v4];
}

- (void)trainAllAppLMWithLanguage:(id)a3 completion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008D5C;
  v9[3] = &unk_10024E158;
  id v10 = a4;
  id v6 = v10;
  id v7 = a3;
  id v8 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:v9];
  [v8 trainAllAppLMWithLanguage:v7 completion:v6];
}

- (void)wakeUpWithCompletion:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008F10;
  v6[3] = &unk_10024E158;
  id v7 = a3;
  id v4 = v7;
  id v5 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:v6];
  [v5 wakeUpWithCompletion:v4];
}

- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmModelFile:(id)a7 appLmDataFileSandboxExtension:(id)a8 completion:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:&stru_10024E208];
  [v23 trainAppLMWithLanguage:v22 configuration:v21 appBundleId:v20 appLmDataFile:v19 appLmModelFile:v18 appLmDataFileSandboxExtension:v17 completion:v16];
}

- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmModelFile:(id)a7 appLmDataFileSandboxExtension:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:&stru_10024E1E8];
  [v20 trainAppLMWithLanguage:v19 configuration:v18 appBundleId:v17 appLmDataFile:v16 appLmModelFile:v15 appLmDataFileSandboxExtension:v14];
}

- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmDataFileSandboxExtension:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:&stru_10024E1C8];
  [v17 trainAppLMWithLanguage:v16 configuration:v15 appBundleId:v14 appLmDataFile:v13 appLmDataFileSandboxExtension:v12];
}

- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmDataFileSandboxExtension:(id)a7 completion:(id)a8
{
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100009678;
  v21[3] = &unk_10024E158;
  id v22 = a8;
  id v14 = v22;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:v21];
  [v20 trainAppLMWithLanguage:v19 configuration:v18 appBundleId:v17 appLmDataFile:v16 appLmDataFileSandboxExtension:v15 completion:v14];
}

- (void)trainGlobalNNLMwithFidesSessionURL:(id)a3 completion:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009850;
  v9[3] = &unk_10024E158;
  id v10 = a4;
  id v6 = v10;
  id v7 = a3;
  id v8 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:v9];
  [v8 trainGlobalNNLMwithFidesSessionURL:v7 completion:v6];
}

- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 fides:(BOOL)a5 activity:(id)a6 completion:(id)a7
{
  BOOL v7 = a5;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100009AF8;
  v21[3] = &unk_10024E1A8;
  id v22 = a7;
  id v11 = v22;
  id v12 = a4;
  id v13 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100009B10;
  v19[3] = &unk_10024E158;
  id v14 = objc_retainBlock(v21);
  id v20 = v14;
  id v15 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:v19];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100009C00;
  v17[3] = &unk_10024E1A8;
  id v18 = v14;
  id v16 = v14;
  [v15 trainPersonalizedLMWithLanguage:v13 configuration:v12 fides:v7 write:1 completion:v17];
}

- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 asset:(id)a5 fides:(BOOL)a6 activity:(id)a7 completion:(id)a8
{
}

- (void)trainPersonalizedLMWithLanguage:(id)a3 directory:(id)a4 completion:(id)a5
{
}

- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 asset:(id)a5 directory:(id)a6 completion:(id)a7
{
  id v39 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10000A12C;
  v45[3] = &unk_10024E1A8;
  id v14 = a7;
  id v46 = v14;
  v40 = objc_retainBlock(v45);
  id v15 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  id v16 = [v15 firstObject];

  id v17 = [v16 stringByAppendingPathComponent:@"Assistant/SpeechPersonalizedLM"];
  id v18 = [v17 stringByStandardizingPath];

  id v19 = [v16 stringByAppendingPathComponent:@"Assistant/SpeechPersonalizedLM_Fides"];
  id v20 = [v19 stringByStandardizingPath];

  id v21 = qword_1002A3578;
  if (os_log_type_enabled((os_log_t)qword_1002A3578, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v50 = v18;
    __int16 v51 = 2112;
    v52 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "personalizedLMPath=%@ fidesPersonalizedLMPath=%@", buf, 0x16u);
  }
  if ([v13 isEqualToString:v18])
  {
    id v22 = qword_1002A3578;
    if (os_log_type_enabled((os_log_t)qword_1002A3578, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Client is 24-hour job", buf, 2u);
    }
    id v23 = self;
    id v24 = v39;
    id v25 = v39;
    id v26 = v11;
    id v27 = v12;
    uint64_t v28 = 0;
LABEL_11:
    [(SpeechModelTrainingClient *)v23 trainPersonalizedLMWithLanguage:v25 configuration:v26 asset:v27 fides:v28 activity:0 completion:v14];
    goto LABEL_12;
  }
  if ([v13 isEqualToString:v20])
  {
    v29 = qword_1002A3578;
    if (os_log_type_enabled((os_log_t)qword_1002A3578, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Client is DictationPersonalizationFidesPlugin", buf, 2u);
    }
    id v23 = self;
    id v24 = v39;
    id v25 = v39;
    id v26 = v11;
    id v27 = v12;
    uint64_t v28 = 1;
    goto LABEL_11;
  }
  if ([v13 length])
  {
    id v30 = [objc_alloc((Class)NSString) initWithFormat:@"Input directory path(%@) does not match expected path", v13];
    v31 = qword_1002A3578;
    v32 = v30;
    if (os_log_type_enabled((os_log_t)qword_1002A3578, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    v48 = v32;
    v33 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v34 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:202 userInfo:v33];
    ((void (*)(void *, void, void *))v40[2])(v40, 0, v34);

    id v24 = v39;
  }
  else
  {
    v35 = qword_1002A3578;
    if (os_log_type_enabled((os_log_t)qword_1002A3578, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Client is PersonalizedLmFidesPlugin", buf, 2u);
    }
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10000A144;
    v43[3] = &unk_10024E158;
    v36 = v40;
    id v44 = v36;
    v37 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:v43];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10000A234;
    v41[3] = &unk_10024E1A8;
    v42 = v36;
    id v24 = v39;
    [v37 trainPersonalizedLMWithLanguage:v39 configuration:v11 fides:0 write:0 completion:v41];
  }
LABEL_12:
}

- (void)upperCaseString:(id)a3 completion:(id)a4
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000A3C0;
  v15[3] = &unk_10024E130;
  id v16 = a4;
  id v6 = v16;
  id v7 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A3D8;
  v13[3] = &unk_10024E158;
  id v8 = objc_retainBlock(v15);
  id v14 = v8;
  id v9 = [(SpeechModelTrainingClient *)self _serviceProxyWithErrorHandler:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A3F0;
  v11[3] = &unk_10024E180;
  id v12 = v8;
  id v10 = v8;
  [v9 upperCaseString:v7 withReply:v11];
}

- (id)_serviceProxyWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_smtConnection synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (void)dealloc
{
  v3 = qword_1002A3578;
  if (os_log_type_enabled((os_log_t)qword_1002A3578, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dealloc-ing", buf, 2u);
  }
  [(NSXPCConnection *)self->_smtConnection invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SpeechModelTrainingClient;
  [(SpeechModelTrainingClient *)&v4 dealloc];
}

- (SpeechModelTrainingClient)init
{
  v12.receiver = self;
  v12.super_class = (Class)SpeechModelTrainingClient;
  id v2 = [(SpeechModelTrainingClient *)&v12 init];
  if (v2)
  {
    v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.corespeech.speechmodeltraining.xpc" options:0];
    smtConnection = v2->_smtConnection;
    v2->_smtConnection = v3;

    id v5 = v2->_smtConnection;
    id v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SpeechModelTrainingProtocol];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    v14[3] = objc_opt_class();
    id v7 = +[NSArray arrayWithObjects:v14 count:4];
    id v8 = +[NSSet setWithArray:v7];

    [v6 setClasses:v8 forSelector:"trainPersonalizedLMWithLanguage:configuration:fides:write:completion:" argumentIndex:0 ofReply:1];
    [v6 setClasses:v8 forSelector:"trainAppLMWithLanguage:configuration:appBundleId:appLmDataFile:appLmDataFileSandboxExtension:completion:" argumentIndex:0 ofReply:1];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    id v9 = +[NSArray arrayWithObjects:v13 count:2];
    id v10 = +[NSSet setWithArray:v9];
    [v6 setClasses:v10 forSelector:"trainAppLMWithLanguage:configuration:appBundleId:appLmDataFile:appLmDataFileSandboxExtension:completion:" argumentIndex:1 ofReply:1];

    [v6 setClasses:v8 forSelector:"trainAllAppLMWithLanguage:completion:" argumentIndex:0 ofReply:1];
    [v6 setClasses:v8 forSelector:"buildPhoneticMatchWithLanguage:saveIntermediateFsts:completion:" argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];
    [(NSXPCConnection *)v2->_smtConnection setInterruptionHandler:&stru_10024E0E8];
    [(NSXPCConnection *)v2->_smtConnection setInvalidationHandler:&stru_10024E108];
    [(NSXPCConnection *)v2->_smtConnection resume];
  }
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.speech.speechmodeltraining", "SpeechModelTrainingClient");
    v3 = (void *)qword_1002A3578;
    qword_1002A3578 = (uint64_t)v2;
  }
}

@end