@interface ADSpeechPlaybackSimulator
+ (id)_speechLogDecodingError;
- (ADSpeechPlaybackSimulator)initWithQueue:(id)a3 speechController:(id)a4 audioSessionController:(id)a5 audioPlaybackService:(id)a6 experimentContext:(id)a7;
- (id)delegate;
- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3;
- (void)getLastStartpointTimestampAndCurrentTime:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startPlaybackWithURL:(id)a3 narrowBand:(BOOL)a4 dictation:(BOOL)a5 completion:(id)a6;
- (void)stopSpeechCaptureForEvent:(int64_t)a3 suppressAlert:(BOOL)a4 hostTime:(unint64_t)a5;
- (void)updateEndpointHintForRC:(id)a3 forceAccept:(BOOL)a4 completion:(id)a5;
@end

@implementation ADSpeechPlaybackSimulator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startPlaybackWithURL:(id)a3 narrowBand:(BOOL)a4 dictation:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  v11 = (void (**)(void))a6;
  char v61 = 0;
  v12 = +[ADSpeechLog buffersFromSpeechLogAtURL:v10 isNarrowBand:&v61];
  if (v12)
  {
    if (v61) {
      int v13 = 1;
    }
    else {
      int v13 = v8;
    }
    v14 = [v10 pathExtension];
    BOOL v15 = [v14 caseInsensitiveCompare:@"opx"] == 0;

    v16 = (id *)&SASCodecOPUS_Mono_8000HzValue;
    if (!v15) {
      v16 = (id *)&SASCodecSpeex_NB_Quality7Value;
    }
    v17 = (id *)&SASCodecOPUS_Mono_16000HzValue;
    if (!v15) {
      v17 = (id *)&SASCodecSpeex_WB_Quality8Value;
    }
    if (!v13) {
      v16 = v17;
    }
    id v42 = *v16;
    id v18 = [objc_alloc((Class)CSSiriRecordingInfo) initWithDictation:v7 codec:v42];
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002CEC5C;
    block[3] = &unk_10050E160;
    block[4] = self;
    id v41 = v18;
    id v59 = v41;
    dispatch_async(queue, block);
    id v20 = [v12 count];
    if (AFPreferencesSimulateImmediateSpeechCapture())
    {
      v21 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "-[ADSpeechPlaybackSimulator startPlaybackWithURL:narrowBand:dictation:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Simulating immediate speech capture", buf, 0xCu);
      }
      v22 = self->_queue;
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_1002CECB8;
      v55[3] = &unk_10050E278;
      v55[4] = self;
      id v56 = v12;
      id v57 = v20;
      dispatch_async(v22, v55);
      v23 = self->_queue;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_1002CED10;
      v54[3] = &unk_10050D8C0;
      v54[4] = self;
      v54[5] = v20;
      dispatch_async(v23, v54);
      if (v11) {
        v11[2](v11);
      }
    }
    else
    {
      v26 = [v12 reverseObjectEnumerator];
      v27 = [v26 allObjects];
      v28 = +[NSMutableArray arrayWithArray:v27];

      id v40 = [v28 count];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      uint64_t v67 = 0;
      AFPreferencesBufferedSpeechCapturePacketInterval();
      if (v29 == 0.0) {
        double v30 = 0.01;
      }
      else {
        double v30 = v29;
      }
      v31 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v62 = 136315394;
        v63 = "-[ADSpeechPlaybackSimulator startPlaybackWithURL:narrowBand:dictation:completion:]";
        __int16 v64 = 2048;
        double v65 = v30;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s Simulating buffered speech capture, speech packets sent every %f seconds", v62, 0x16u);
      }
      objc_initWeak((id *)v62, self);
      v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v33 = dispatch_queue_create(0, v32);
      v34 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v33);

      dispatch_source_set_timer(v34, 0, (unint64_t)(v30 * 1000000000.0), 0);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1002CED70;
      handler[3] = &unk_10050A858;
      id v49 = v28;
      v50 = self;
      id v39 = v28;
      objc_copyWeak(&v53, (id *)v62);
      v52 = buf;
      v35 = v34;
      v51 = v35;
      dispatch_source_set_event_handler(v35, handler);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1002CEEEC;
      v43[3] = &unk_10050A8A8;
      v47[1] = v40;
      v46 = buf;
      v43[4] = self;
      objc_copyWeak(v47, (id *)v62);
      v36 = v35;
      v44 = v36;
      v45 = v11;
      dispatch_source_set_cancel_handler(v36, v43);
      dispatch_resume(v36);
      playbackSource = self->_playbackSource;
      self->_playbackSource = (OS_dispatch_source *)v36;
      v38 = v36;

      objc_destroyWeak(v47);
      objc_destroyWeak(&v53);

      objc_destroyWeak((id *)v62);
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    v24 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[ADSpeechPlaybackSimulator startPlaybackWithURL:narrowBand:dictation:completion:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Couldn't decode Speex / Opus buffers for speech log at URL %{public}@", buf, 0x16u);
    }
    v25 = self->_queue;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_1002CEBE4;
    v60[3] = &unk_10050E138;
    v60[4] = self;
    dispatch_async(v25, v60);
  }
}

- (void)updateEndpointHintForRC:(id)a3 forceAccept:(BOOL)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void, void, void))a5 + 2))(a5, 0, 0, 0);
  }
}

- (void)getLastStartpointTimestampAndCurrentTime:(id)a3
{
  if (a3) {
    (*((void (**)(id, double, double))a3 + 2))(a3, 0.0, 0.0);
  }
}

- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3
{
  playbackSource = self->_playbackSource;
  if (playbackSource) {
    dispatch_source_cancel(playbackSource);
  }
}

- (void)stopSpeechCaptureForEvent:(int64_t)a3 suppressAlert:(BOOL)a4 hostTime:(unint64_t)a5
{
  playbackSource = self->_playbackSource;
  if (playbackSource) {
    dispatch_source_cancel(playbackSource);
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002CF230;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (ADSpeechPlaybackSimulator)initWithQueue:(id)a3 speechController:(id)a4 audioSessionController:(id)a5 audioPlaybackService:(id)a6 experimentContext:(id)a7
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ADSpeechPlaybackSimulator;
  id v10 = [(ADSpeechPlaybackSimulator *)&v13 init];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_queue, a3);
  }

  return v11;
}

+ (id)_speechLogDecodingError
{
  return +[NSError errorWithDomain:kAFAssistantErrorDomain code:204 userInfo:0];
}

@end