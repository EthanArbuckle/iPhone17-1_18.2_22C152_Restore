@interface SpeechModelTrainingConnection
+ (void)initialize;
- (BOOL)shouldStop;
- (SpeechModelTrainingConnection)init;
- (SpeechModelTrainingConnection)initWithXPCConnection:(id)a3;
- (id)createDispatchTimerWithInterval:(double)a3 queue:(id)a4 block:(id)a5;
- (void)_assetForLanguage:(id)a3 completion:(id)a4;
- (void)buildPhoneticMatchWithLanguage:(id)a3 saveIntermediateFsts:(BOOL)a4 completion:(id)a5;
- (void)buildSpeechProfileForLanguage:(id)a3;
- (void)dealloc;
- (void)extractBundledOovs:(id)a3 appLmDataFileSandboxExtension:(id)a4 appBundleId:(id)a5 completion:(id)a6;
- (void)generateAudioWithTexts:(id)a3 language:(id)a4 completion:(id)a5;
- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedNbest:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12;
- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedTokens:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12;
- (void)recordWordsAndOov:(id)a3 data:(id)a4 vocab:(id)a5;
- (void)setShouldStop:(BOOL)a3;
- (void)trainAllAppLMWithLanguage:(id)a3;
- (void)trainAllAppLMWithLanguage:(id)a3 completion:(id)a4;
- (void)trainAllAppLMWithLanguage:(id)a3 outOf:(id)a4 into:(id)a5 completion:(id)a6;
- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmDataFileSandboxExtension:(id)a7;
- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmDataFileSandboxExtension:(id)a7 completion:(id)a8;
- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmModelFile:(id)a7 appLmDataFileSandboxExtension:(id)a8;
- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmModelFile:(id)a7 appLmDataFileSandboxExtension:(id)a8 completion:(id)a9;
- (void)trainGlobalNNLMwithFidesSessionURL:(id)a3 completion:(id)a4;
- (void)trainPartialAllAppLMWithLanguage:(id)a3;
- (void)trainPartialAllAppLMWithLanguage:(id)a3 completion:(id)a4;
- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 fides:(BOOL)a5 write:(BOOL)a6 completion:(id)a7;
- (void)upperCaseString:(id)a3 withReply:(id)a4;
- (void)wakeUpWithCompletion:(id)a3;
@end

@implementation SpeechModelTrainingConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumedSandboxExtensions, 0);
  objc_storeStrong((id *)&self->_downloadSession, 0);
  objc_storeStrong((id *)&self->_smtGlobalNNLM, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedTokens:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12
{
  id v33 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  v24 = qword_1000443D0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012E90;
  block[3] = &unk_10003D090;
  id v38 = v19;
  id v39 = v16;
  v40 = self;
  id v41 = v33;
  id v42 = v17;
  id v43 = v18;
  id v47 = v23;
  unint64_t v48 = a7;
  id v44 = v20;
  id v45 = v21;
  id v46 = v22;
  id v36 = v23;
  id v25 = v22;
  id v26 = v21;
  id v27 = v20;
  id v28 = v18;
  id v29 = v17;
  id v30 = v33;
  id v31 = v16;
  id v32 = v19;
  dispatch_async(v24, block);
}

- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedNbest:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12
{
  id v34 = a3;
  id v16 = a4;
  id v33 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = qword_1000443D0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013174;
  block[3] = &unk_10003D068;
  id v37 = v16;
  id v38 = v34;
  id v39 = v33;
  id v40 = v17;
  id v41 = v18;
  id v42 = v19;
  id v43 = v20;
  id v44 = v21;
  id v45 = v22;
  unint64_t v46 = a7;
  id v24 = v22;
  id v25 = v21;
  id v26 = v20;
  id v27 = v19;
  id v28 = v18;
  id v29 = v17;
  id v30 = v33;
  id v31 = v34;
  id v32 = v16;
  dispatch_async(v23, block);
}

- (void)generateAudioWithTexts:(id)a3 language:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = qword_1000443D0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013A94;
  block[3] = &unk_10003D018;
  id v16 = v8;
  id v17 = v9;
  id v15 = v7;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  dispatch_async(v10, block);
}

- (void)buildPhoneticMatchWithLanguage:(id)a3 saveIntermediateFsts:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = qword_1000443D0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100013D34;
  v13[3] = &unk_10003CFF0;
  id v15 = self;
  id v16 = v9;
  id v14 = v8;
  BOOL v17 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (void)buildSpeechProfileForLanguage:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    NSLog(@"buildSpeechProfile is unavailable when siri_vocabulary_speech_profile feature flag is enabled.");
  }
  else
  {
    v4 = (void *)os_transaction_create();
    v5 = qword_1000443D0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100015CB8;
    v7[3] = &unk_10003CFC8;
    id v8 = v3;
    id v9 = v4;
    id v6 = v4;
    dispatch_async(v5, v7);
  }
}

- (void)extractBundledOovs:(id)a3 appLmDataFileSandboxExtension:(id)a4 appBundleId:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v33 = a4;
  id v34 = a5;
  id v11 = a6;
  id v12 = qword_1000443C8;
  if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "UaaP: Extracting OOVs", (uint8_t *)&buf, 2u);
  }
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10001672C;
  v49[3] = &unk_10003CF50;
  id v13 = v11;
  id v50 = v13;
  id v14 = objc_retainBlock(v49);
  id v15 = [objc_alloc((Class)_EARAppLmArtifact) initWithPath:v10];
  id v16 = v15;
  if (v15)
  {
    BOOL v17 = [v15 getLocale];
    id v18 = v17;
    if (v17)
    {
      id v32 = v10;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v59 = 0x3032000000;
      v60 = sub_1000167D8;
      v61 = sub_1000167E8;
      id v62 = 0;
      uint64_t v43 = 0;
      id v44 = &v43;
      uint64_t v45 = 0x3032000000;
      unint64_t v46 = sub_1000167D8;
      id v47 = sub_1000167E8;
      id v48 = 0;
      uint64_t v37 = 0;
      id v38 = &v37;
      uint64_t v39 = 0x3032000000;
      id v40 = sub_1000167D8;
      id v41 = sub_1000167E8;
      id v42 = 0;
      id v19 = [v17 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000167F0;
      v36[3] = &unk_10003CDF8;
      v36[4] = &buf;
      v36[5] = &v43;
      v36[6] = &v37;
      [(SpeechModelTrainingConnection *)self _assetForLanguage:v19 completion:v36];

      uint64_t v20 = v38[5];
      if (v20)
      {
        id v21 = qword_1000443C8;
        if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
        {
          LODWORD(v53) = 138412290;
          *(void *)((char *)&v53 + 4) = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "UaaP: Failed to fetch assets for use in parsing custom prons: %@", (uint8_t *)&v53, 0xCu);
          uint64_t v20 = v38[5];
        }
        ((void (*)(void *, void *, void *, uint64_t))v14[2])(v14, &__NSArray0__struct, &__NSDictionary0__struct, v20);
      }
      else
      {
        id v25 = [v16 loadCustomPronData:v44[5] dataRoot:0];
        if (v25)
        {
          *(void *)&long long v53 = 0;
          *((void *)&v53 + 1) = &v53;
          uint64_t v54 = 0x3032000000;
          v55 = sub_1000167D8;
          v56 = sub_1000167E8;
          id v57 = objc_alloc_init((Class)NSMutableDictionary);
          if ([v25 isValid])
          {
            id v26 = [v25 getProns];
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_1000168AC;
            v35[3] = &unk_10003CF78;
            v35[4] = &v53;
            [v26 enumerateObjectsUsingBlock:v35];
          }
          else
          {
            id v26 = (id)qword_1000443C8;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              id v29 = [v25 validationError];
              *(_DWORD *)v51 = 138412290;
              v52 = v29;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "UaaP: Artifact contained invalid custom prons; skipping. %@",
                v51,
                0xCu);
            }
          }

          id v30 = [v16 loadOovs];
          if (!v30)
          {
            id v31 = qword_1000443C8;
            if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v51 = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "UaaP: Could not get OOVs from artifact", v51, 2u);
            }
            id v30 = &__NSArray0__struct;
          }
          ((void (*)(void *, void *, void, void))v14[2])(v14, v30, *(void *)(*((void *)&v53 + 1) + 40), 0);

          _Block_object_dispose(&v53, 8);
        }
        else
        {
          id v27 = qword_1000443C8;
          if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
          {
            LOWORD(v53) = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "UaaP: Failed to load custom prons from artifact", (uint8_t *)&v53, 2u);
          }
          id v28 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:255 userInfo:0];
          ((void (*)(void *, void *, void *, void *))v14[2])(v14, &__NSArray0__struct, &__NSDictionary0__struct, v28);
        }
      }
      _Block_object_dispose(&v37, 8);

      id v10 = v32;
      _Block_object_dispose(&v43, 8);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      id v23 = qword_1000443C8;
      if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "UaaP: Could not determine locale for incoming artifact", (uint8_t *)&buf, 2u);
      }
      id v24 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:255 userInfo:0];
      ((void (*)(void *, void *, void *, void *))v14[2])(v14, &__NSArray0__struct, &__NSDictionary0__struct, v24);

      id v18 = 0;
    }
  }
  else
  {
    id v22 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "UaaP: Failed to read app lm artifact at %@", (uint8_t *)&buf, 0xCu);
    }
    id v18 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:255 userInfo:0];
    ((void (*)(void *, void *, void *, void *))v14[2])(v14, &__NSArray0__struct, &__NSDictionary0__struct, v18);
  }
}

- (void)trainPartialAllAppLMWithLanguage:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [@"pruned" stringByAppendingPathComponent:@"current/lm.arpa"];
  [(SpeechModelTrainingConnection *)self trainAllAppLMWithLanguage:v8 outOf:v7 into:@"tempAllApp" completion:v6];
}

- (void)trainPartialAllAppLMWithLanguage:(id)a3
{
  id v4 = a3;
  v5 = (void *)os_transaction_create();
  id v6 = [@"pruned" stringByAppendingPathComponent:@"current/lm.arpa"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016B3C;
  v8[3] = &unk_10003CF28;
  id v7 = v5;
  id v9 = v7;
  [(SpeechModelTrainingConnection *)self trainAllAppLMWithLanguage:v4 outOf:v6 into:@"tempAllApp" completion:v8];
}

- (void)trainAllAppLMWithLanguage:(id)a3
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016D04;
  v6[3] = &unk_10003CF28;
  id v7 = (id)os_transaction_create();
  id v5 = v7;
  [(SpeechModelTrainingConnection *)self trainAllAppLMWithLanguage:v4 completion:v6];
}

- (void)trainAllAppLMWithLanguage:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016EE8;
  v8[3] = &unk_10003CF00;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(SpeechModelTrainingConnection *)self trainAllAppLMWithLanguage:v7 outOf:@"current/lm.arpa" into:@"allApp" completion:v8];
}

- (void)trainAllAppLMWithLanguage:(id)a3 outOf:(id)a4 into:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = qword_1000443D0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017770;
  block[3] = &unk_10003CE98;
  id v23 = v11;
  id v24 = v13;
  id v20 = v12;
  id v21 = v10;
  id v22 = self;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  id v18 = v13;
  dispatch_async(v14, block);
}

- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmModelFile:(id)a7 appLmDataFileSandboxExtension:(id)a8 completion:(id)a9
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  id v18 = qword_1000443D0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000182A8;
  v24[3] = &unk_10003CE48;
  id v25 = v13;
  id v26 = self;
  id v27 = v16;
  id v28 = v15;
  id v29 = v14;
  id v30 = v17;
  id v19 = v14;
  id v20 = v15;
  id v21 = v16;
  id v22 = v13;
  id v23 = v17;
  dispatch_async(v18, v24);
}

- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmModelFile:(id)a7 appLmDataFileSandboxExtension:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = (void *)os_transaction_create();
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000190AC;
  v24[3] = &unk_10003CDA8;
  id v20 = v15;
  id v25 = v20;
  id v21 = v13;
  id v26 = v21;
  id v27 = v19;
  id v22 = v19;
  [(SpeechModelTrainingConnection *)self trainAppLMWithLanguage:v21 configuration:v14 appBundleId:v20 appLmDataFile:v16 appLmModelFile:v17 appLmDataFileSandboxExtension:v18 completion:v24];
}

- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmDataFileSandboxExtension:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)os_transaction_create();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001936C;
  v21[3] = &unk_10003CDA8;
  id v18 = v14;
  id v22 = v18;
  id v19 = v12;
  id v23 = v19;
  id v24 = v17;
  id v20 = v17;
  [(SpeechModelTrainingConnection *)self trainAppLMWithLanguage:v19 configuration:v13 appBundleId:v18 appLmDataFile:v15 appLmDataFileSandboxExtension:v16 completion:v21];
}

- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmDataFileSandboxExtension:(id)a7 completion:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = sub_1000173C0(v22);
  id v20 = [v19 stringByAppendingPathComponent:v15];
  id v21 = [v20 stringByStandardizingPath];
  [(SpeechModelTrainingConnection *)self trainAppLMWithLanguage:v22 configuration:v14 appBundleId:v15 appLmDataFile:v16 appLmModelFile:v21 appLmDataFileSandboxExtension:v17 completion:v18];
}

- (void)_assetForLanguage:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = qword_1000443D8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000196C8;
  v10[3] = &unk_10003CD80;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_sync(v7, v10);
}

- (void)wakeUpWithCompletion:(id)a3
{
}

- (void)trainGlobalNNLMwithFidesSessionURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100019A80;
  v23[3] = &unk_10003CC18;
  id v25 = v26;
  id v7 = a4;
  id v24 = v7;
  id v8 = objc_retainBlock(v23);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100019BDC;
  v20[3] = &unk_10003CC40;
  id v21 = v7;
  id v22 = v26;
  id v9 = v7;
  id v10 = objc_retainBlock(v20);
  id v11 = qword_1000443D0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100019D04;
  v15[3] = &unk_10003CD58;
  id v16 = v6;
  id v17 = self;
  id v18 = v10;
  id v19 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v6;
  dispatch_async(v11, v15);

  _Block_object_dispose(v26, 8);
}

- (void)recordWordsAndOov:(id)a3 data:(id)a4 vocab:(id)a5
{
  id v7 = a3;
  id v32 = a4;
  id v31 = a5;
  id v8 = [v7 objectForKeyedSubscript:@"enableWordRecording"];

  if (v8)
  {
    id v9 = [v7 objectForKeyedSubscript:@"enableWordRecording"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v11 = [v7 objectForKeyedSubscript:@"enableWordRecording"];
      unsigned int v12 = [v11 BOOLValue];

      goto LABEL_7;
    }
    id v13 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v39 = @"enableWordRecording";
      __int16 v40 = 1024;
      int v41 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "recipe[%@] cannot be parsed as a BOOL. Default value of %d is used. ", buf, 0x12u);
    }
  }
  unsigned int v12 = 0;
LABEL_7:
  id v14 = [v7 objectForKeyedSubscript:@"language"];
  id v15 = v14;
  if (!v14) {
    id v14 = @"en-US";
  }
  id v16 = [(__CFString *)v14 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  id v17 = [v32 wordFrequency];
  if (v17) {
    unsigned int v18 = v12;
  }
  else {
    unsigned int v18 = 0;
  }
  if (v18 == 1)
  {
    id v30 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.siri.speech-global-nnlm.oov-recorder", v16];
    id v29 = [objc_alloc((Class)sub_10001D008()) initWithKey:v30];
    id v19 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v39 = v30;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "OOV recorder is initialized with key %@", buf, 0xCu);
    }
    id v20 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.siri.speech-global-nnlm.word-recorder", v16];
    id v21 = [objc_alloc((Class)sub_10001D008()) initWithKey:v20];
    id v22 = qword_1000443C8;
    if (os_log_type_enabled((os_log_t)qword_1000443C8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v39 = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Unigram recorder is initialized with key %@", buf, 0xCu);
    }
    id v23 = objc_opt_new();
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10001D0EC;
    v33[3] = &unk_10003CBF0;
    id v24 = v21;
    id v34 = v24;
    id v35 = v31;
    id v25 = v23;
    id v36 = v25;
    id v26 = v29;
    id v37 = v26;
    [v17 enumerateKeysAndObjectsUsingBlock:v33];
    if ([v25 count])
    {
      char v27 = (id)qword_1000443C8;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = [v25 componentsJoinedByString:@" "];
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v39 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "OOV detected: %@", buf, 0xCu);
      }
    }
  }
}

- (id)createDispatchTimerWithInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  id v7 = a5;
  id v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)a4);
  if (v8)
  {
    double v9 = a3 * 1000000000.0;
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)v9);
    dispatch_source_set_timer(v8, v10, (unint64_t)v9, 0);
    dispatch_source_set_event_handler(v8, v7);
    dispatch_resume(v8);
  }

  return v8;
}

- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 fides:(BOOL)a5 write:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = qword_1000443D0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D79C;
  block[3] = &unk_10003CBC8;
  void block[4] = self;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  BOOL v23 = a5;
  BOOL v24 = a6;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  dispatch_async(v15, block);
}

- (void)upperCaseString:(id)a3 withReply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v5 = [a3 uppercaseString];
  if (v6) {
    v6[2](v6, v5);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SpeechModelTrainingConnection;
  [(SpeechModelTrainingConnection *)&v3 dealloc];
}

- (SpeechModelTrainingConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SpeechModelTrainingConnection;
  id v6 = [(SpeechModelTrainingConnection *)&v18 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    id v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    consumedSandboxExtensions = v7->_consumedSandboxExtensions;
    v7->_consumedSandboxExtensions = v8;

    objc_initWeak(&location, v7);
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_10001F9A4;
    id v15 = &unk_10003CAD8;
    objc_copyWeak(&v16, &location);
    dispatch_time_t v10 = objc_retainBlock(&v12);
    objc_msgSend(v5, "setInterruptionHandler:", v10, v12, v13, v14, v15);
    [v5 setInvalidationHandler:v10];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (SpeechModelTrainingConnection)init
{
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.speech.speechmodeltraining", "SpeechModelTrainingConnection");
    objc_super v3 = (void *)qword_1000443C8;
    qword_1000443C8 = (uint64_t)v2;

    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SpeechModelTrainingConnection", v4);
    id v6 = (void *)qword_1000443D0;
    qword_1000443D0 = (uint64_t)v5;

    qword_1000443D8 = (uint64_t)dispatch_queue_create("com.apple.speechmodeltrainingd.asset-fetch", 0);
    _objc_release_x1();
  }
}

@end