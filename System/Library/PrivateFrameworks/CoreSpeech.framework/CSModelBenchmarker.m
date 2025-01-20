@interface CSModelBenchmarker
- (BOOL)_setupAudioInjectionEngineWithAudioURL:(id)a3;
- (CSAudioInjectionEngine)audioInjectionEngine;
- (CSModelBenchmarker)init;
- (CSSyncKeywordAnalyzerQuasar)vtSecondPassAnalyzer;
- (EARSyncPSRAudioProcessor)psrAudioProcessor;
- (NSString)tempCacheDirectoryForMil2Bnns;
- (OSDAnalyzer)osdAnalyzer;
- (OS_dispatch_queue)modelExeQueue;
- (OS_dispatch_queue)queue;
- (SLODLDProcessor)odldModelAnalyzer;
- (id)completion;
- (int64_t)inferenceTimeSpan;
- (int64_t)totalNumberSamples;
- (unint64_t)allFramesInferenceLatency;
- (void)_onDeviceCompilationWithConfigFile:(id)a3 locale:(id)a4 modelType:(int64_t)a5;
- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8;
- (void)audioEngineDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6;
- (void)audioEngineDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(unint64_t)a5;
- (void)benchmarkOnDeviceCompilationCleanup:(id)a3;
- (void)novDetectAnalyzer;
- (void)pingpong:(id)a3 completion:(id)a4;
- (void)reset;
- (void)runAudioInjectionOnly:(id)a3 completion:(id)a4;
- (void)runLstmPhsModelWithConfig:(id)a3 withUrl:(id)a4 withConfigRoot:(id)a5 completion:(id)a6;
- (void)runNCModelWithConfig:(id)a3 completion:(id)a4;
- (void)runNovDetectorWithConfig:(id)a3 configRoot:(id)a4 withUrl:(id)a5 completion:(id)a6;
- (void)runODLDModelWithConfig:(id)a3 locale:(id)a4 inputText:(id)a5 completion:(id)a6;
- (void)runOSDAnalyzerWithConfig:(id)a3 withUrl:(id)a4 completion:(id)a5;
- (void)runVTSecondPassModelWithConfig:(id)a3 locale:(id)a4 withUrl:(id)a5 completion:(id)a6;
- (void)setAllFramesInferenceLatency:(unint64_t)a3;
- (void)setAllProcessorsAsNil;
- (void)setAudioInjectionEngine:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setInferenceTimeSpan:(int64_t)a3;
- (void)setModelExeQueue:(id)a3;
- (void)setNovDetectAnalyzer:(void *)a3;
- (void)setOdldModelAnalyzer:(id)a3;
- (void)setOsdAnalyzer:(id)a3;
- (void)setPsrAudioProcessor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTempCacheDirectoryForMil2Bnns:(id)a3;
- (void)setTotalNumberSamples:(int64_t)a3;
- (void)setVtSecondPassAnalyzer:(id)a3;
@end

@implementation CSModelBenchmarker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempCacheDirectoryForMil2Bnns, 0);
  objc_storeStrong((id *)&self->_modelExeQueue, 0);
  objc_storeStrong((id *)&self->_audioInjectionEngine, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_odldModelAnalyzer, 0);
  objc_storeStrong((id *)&self->_osdAnalyzer, 0);
  objc_storeStrong((id *)&self->_psrAudioProcessor, 0);
  objc_storeStrong((id *)&self->_vtSecondPassAnalyzer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setTempCacheDirectoryForMil2Bnns:(id)a3
{
}

- (NSString)tempCacheDirectoryForMil2Bnns
{
  return self->_tempCacheDirectoryForMil2Bnns;
}

- (void)setInferenceTimeSpan:(int64_t)a3
{
  self->_inferenceTimeSpan = a3;
}

- (int64_t)inferenceTimeSpan
{
  return self->_inferenceTimeSpan;
}

- (void)setTotalNumberSamples:(int64_t)a3
{
  self->_totalNumberSamples = a3;
}

- (int64_t)totalNumberSamples
{
  return self->_totalNumberSamples;
}

- (void)setAllFramesInferenceLatency:(unint64_t)a3
{
  self->_allFramesInferenceLatency = a3;
}

- (unint64_t)allFramesInferenceLatency
{
  return self->_allFramesInferenceLatency;
}

- (void)setModelExeQueue:(id)a3
{
}

- (OS_dispatch_queue)modelExeQueue
{
  return self->_modelExeQueue;
}

- (void)setAudioInjectionEngine:(id)a3
{
}

- (CSAudioInjectionEngine)audioInjectionEngine
{
  return self->_audioInjectionEngine;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setNovDetectAnalyzer:(void *)a3
{
  self->_novDetectAnalyzer = a3;
}

- (void)novDetectAnalyzer
{
  return self->_novDetectAnalyzer;
}

- (void)setOdldModelAnalyzer:(id)a3
{
}

- (SLODLDProcessor)odldModelAnalyzer
{
  return self->_odldModelAnalyzer;
}

- (void)setOsdAnalyzer:(id)a3
{
}

- (OSDAnalyzer)osdAnalyzer
{
  return self->_osdAnalyzer;
}

- (void)setPsrAudioProcessor:(id)a3
{
}

- (EARSyncPSRAudioProcessor)psrAudioProcessor
{
  return self->_psrAudioProcessor;
}

- (void)setVtSecondPassAnalyzer:(id)a3
{
}

- (CSSyncKeywordAnalyzerQuasar)vtSecondPassAnalyzer
{
  return self->_vtSecondPassAnalyzer;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)_setupAudioInjectionEngineWithAudioURL:(id)a3
{
  audioInjectionEngine = self->_audioInjectionEngine;
  id v5 = a3;
  +[CSFAudioStreamBasicDescriptionFactory lpcmMonoInterleavedASBD];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000843A0;
  v8[3] = &unk_10024FF80;
  v8[4] = self;
  unsigned int v6 = [(CSAudioInjectionEngine *)audioInjectionEngine injectAudio:v5 withScaleFactor:v9 outASBD:&stru_10024FF58 playbackStarted:v8 completion:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0))];

  if (v6)
  {
    [(CSAudioInjectionEngine *)self->_audioInjectionEngine setDelegate:self];
    [(CSAudioInjectionEngine *)self->_audioInjectionEngine start];
    [(CSAudioInjectionEngine *)self->_audioInjectionEngine startAudioStreamWithOption:0];
  }
  return v6;
}

- (void)_onDeviceCompilationWithConfigFile:(id)a3 locale:(id)a4 modelType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[CSOnDeviceCompilationUtils readMilFilePathFromConfig:v8 modelType:a5];
  id v11 = +[CSOnDeviceCompilationUtils getBackendTypeFromModelFile:v10];
  if (v11 == (id)2)
  {
LABEL_6:
    id v14 = 0;
    goto LABEL_7;
  }
  if (v11 != (id)1)
  {
    v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[CSModelBenchmarker _onDeviceCompilationWithConfigFile:locale:modelType:]";
      __int16 v19 = 2112;
      v20 = v10;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s No Valid backend for compilation is found for model file: %@ from config: %@", buf, 0x20u);
    }
    goto LABEL_6;
  }
  v12 = +[CSOnDeviceCompilationHandler sharedHandler];
  tempCacheDirectoryForMil2Bnns = self->_tempCacheDirectoryForMil2Bnns;
  id v16 = 0;
  [v12 compileUsingConfig:v8 locale:v9 compileDirectory:tempCacheDirectoryForMil2Bnns modelType:a5 errOut:&v16];
  id v14 = v16;

LABEL_7:
}

- (void)audioEngineDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(unint64_t)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100084770;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioEngineBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 isFileLoadedBuffer:(BOOL)a8
{
  id v9 = a5;
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100084BE8;
  v12[3] = &unk_100253B08;
  id v13 = v9;
  id v14 = self;
  id v11 = v9;
  dispatch_async(queue, v12);
}

- (void)audioEngineDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
}

- (void)setAllProcessorsAsNil
{
  psrAudioProcessor = self->_psrAudioProcessor;
  self->_psrAudioProcessor = 0;

  vtSecondPassAnalyzer = self->_vtSecondPassAnalyzer;
  self->_vtSecondPassAnalyzer = 0;

  osdAnalyzer = self->_osdAnalyzer;
  self->_osdAnalyzer = 0;

  odldModelAnalyzer = self->_odldModelAnalyzer;
  self->_odldModelAnalyzer = 0;

  audioInjectionEngine = self->_audioInjectionEngine;
  self->_audioInjectionEngine = 0;

  if (self->_novDetectAnalyzer)
  {
    nd_close();
    self->_novDetectAnalyzer = 0;
  }
}

- (void)reset
{
  [(CSModelBenchmarker *)self setAllProcessorsAsNil];
  id completion = self->_completion;
  self->_id completion = 0;

  self->_allFramesInferenceLatency = 0;
  self->_inferenceTimeSpan = 0;
}

- (void)benchmarkOnDeviceCompilationCleanup:(id)a3
{
  v4 = (void (**)(id, id))a3;
  id v5 = +[NSFileManager defaultManager];
  tempCacheDirectoryForMil2Bnns = self->_tempCacheDirectoryForMil2Bnns;
  id v10 = 0;
  [v5 removeItemAtPath:tempCacheDirectoryForMil2Bnns error:&v10];
  id v7 = v10;

  id v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = self->_tempCacheDirectoryForMil2Bnns;
    *(_DWORD *)buf = 136315650;
    v12 = "-[CSModelBenchmarker benchmarkOnDeviceCompilationCleanup:]";
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s clean up benchmark cached bnnsir directory: %@ with error: %@", buf, 0x20u);
  }
  v4[2](v4, v7);
}

- (void)runAudioInjectionOnly:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008514C;
  block[3] = &unk_100253280;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)runNovDetectorWithConfig:(id)a3 configRoot:(id)a4 withUrl:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008539C;
  block[3] = &unk_10024FF18;
  id v22 = v12;
  id v23 = v13;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(queue, block);
}

- (void)runNCModelWithConfig:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  [(CSModelBenchmarker *)self _onDeviceCompilationWithConfigFile:v6 locale:@"agnosticLocale" modelType:3];
  id v25 = 0;
  id v23 = [objc_alloc((Class)SLUresMitigator) initWithConfig:v6 error:&v25];
  id v8 = v25;
  if (v8)
  {
    [(CSModelBenchmarker *)self reset];
    id v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSModelBenchmarker runNCModelWithConfig:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s model init error: %@", buf, 0x16u);
    }
    CFStringRef v36 = @"reason";
    id v10 = [v8 localizedDescription];
    id v37 = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    id v12 = +[NSError errorWithDomain:CSErrorDomain code:2001 userInfo:v11];
    v7[2](v7, v12);
  }
  else
  {
    id v10 = [objc_alloc((Class)SLUresMitigatorIpFeats) initWithDefaults];
    [v10 setSpeechPackage:0];
    [v10 setInputOrigin:&off_10025DBD0];
    [v10 setAcousticFTMScores:&off_10025DBD0];
    [v10 setBoronScore:&off_10025DBD0];
    [v10 setSpeakerIDScore:&off_10025DBB8];
    [v10 setDidDetectAttention:1];
    [v10 setDidDetectAttention:1];
    [v10 setDidDetectGazeAtOrb:1];
    [v10 setDidDetectVisualActivity:1];
    [v10 setIsAirpodsConnected:0];
    [v10 setTimeSinceLastQuery:1.0];
    [v10 setDecisionStage:1];
    [v10 setPrevStageOutput:0];
    [v10 setEosLikelihood:0];
    [v10 setNldaScore:&off_10025E418];
    [v10 setLrnnScore:&off_10025E418];
    [v10 setLrnnThreshold:&off_10025E428];
    [v10 setEmbeddingScore:&off_10025E428];
    [v10 setExternalLrnnScale:&off_10025DBB8];
    [v10 setExternalLrnnOffset:&off_10025DBD0];
    uint64_t v22 = mach_absolute_time();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v33 = sub_100085BF8;
    v34 = sub_100085C08;
    id v35 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100085C10;
    v24[3] = &unk_10024FEF0;
    v24[4] = buf;
    [v23 processInputFeats:v10 completion:v24];
    id v13 = v6;
    uint64_t v14 = mach_absolute_time();
    os_signpost_id_t v15 = os_signpost_id_generate(CSLogContextFacilityCoreSpeech);
    id v16 = CSLogContextFacilityCoreSpeech;
    id v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)v26 = 134349570;
      uint64_t v27 = v22;
      __int16 v28 = 2080;
      v29 = "SiriX";
      __int16 v30 = 2080;
      v31 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "allFramesProcessingLatency", "%{public, signpost.description:begin_time}llu, %s %s", v26, 0x20u);
    }

    id v6 = v13;
    self->_allFramesInferenceLatency += v14 - v22;
    id v18 = CSLogContextFacilityCoreSpeech;
    __int16 v19 = v18;
    if (v15 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
    {
      unint64_t v20 = self->_allFramesInferenceLatency + v22;
      *(_DWORD *)v26 = 134349570;
      uint64_t v27 = v20;
      __int16 v28 = 2080;
      v29 = "SiriX";
      __int16 v30 = 2080;
      v31 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, v15, "allFramesProcessingLatency", "%{public, signpost.description:end_time}llu, %s %s", v26, 0x20u);
    }

    if (*(void *)(*(void *)&buf[8] + 40))
    {
      [(CSModelBenchmarker *)self reset];
      if (v7) {
        v7[2](v7, 0);
      }
    }
    else
    {
      [(CSModelBenchmarker *)self reset];
      id v21 = +[NSError errorWithDomain:CSErrorDomain code:2002 userInfo:0];
      v7[2](v7, v21);
    }
    _Block_object_dispose(buf, 8);
  }
}

- (void)runODLDModelWithConfig:(id)a3 locale:(id)a4 inputText:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100085D10;
  v16[3] = &unk_100252D38;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(queue, v16);
}

- (void)runOSDAnalyzerWithConfig:(id)a3 withUrl:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100086134;
  v15[3] = &unk_100252D38;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)runVTSecondPassModelWithConfig:(id)a3 locale:(id)a4 withUrl:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100086474;
  block[3] = &unk_10024FF18;
  block[4] = self;
  id v20 = v10;
  id v22 = v12;
  id v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(queue, block);
}

- (void)runLstmPhsModelWithConfig:(id)a3 withUrl:(id)a4 withConfigRoot:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008686C;
  block[3] = &unk_10024FF18;
  block[4] = self;
  id v20 = v10;
  id v22 = v11;
  id v23 = v13;
  id v21 = v12;
  id v15 = v11;
  id v16 = v13;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(queue, block);
}

- (void)pingpong:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[CSModelBenchmarker pingpong:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  if (v6)
  {
    id v8 = [v5 copy];
    v6[2](v6, v8);
  }
}

- (CSModelBenchmarker)init
{
  v10.receiver = self;
  v10.super_class = (Class)CSModelBenchmarker;
  v2 = [(CSModelBenchmarker *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSBenchMarker Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_totalNumberSamples = 0;
    v2->_inferenceTimeSpan = 0;
    id v5 = +[CSFPreferences sharedPreferences];
    uint64_t v6 = [v5 getOnDeviceCompilationCacheDirectoryForBenchmark];
    tempCacheDirectoryForMil2Bnns = v2->_tempCacheDirectoryForMil2Bnns;
    v2->_tempCacheDirectoryForMil2Bnns = (NSString *)v6;

    id v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[CSModelBenchmarker init]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarker init", buf, 0xCu);
    }
  }
  return v2;
}

@end