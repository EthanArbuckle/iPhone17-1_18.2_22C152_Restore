@interface SRAudioGenerator
+ (void)initialize;
- (SRAudioGenerator)init;
- (id)generateTTSAudiosFromTexts:(id)a3 language:(id)a4 downsample:(BOOL)a5;
@end

@implementation SRAudioGenerator

- (void).cxx_destruct
{
}

- (id)generateTTSAudiosFromTexts:(id)a3 language:(id)a4 downsample:(BOOL)a5
{
  id v6 = a3;
  id v37 = a4;
  v7 = qword_100044418;
  if (os_log_type_enabled((os_log_t)qword_100044418, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v53 = v37;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SRAudioGenerator: Start generating TTS audio with language: %@", buf, 0xCu);
  }
  v36 = objc_opt_new();
  v8 = (SiriTTSDaemonSession *)objc_alloc_init((Class)SiriTTSDaemonSession);
  synthesizer = self->_synthesizer;
  self->_synthesizer = v8;

  if (self->_synthesizer)
  {
    group = dispatch_group_create();
    if (v6 && [v6 count])
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v34 = v6;
      id v10 = v6;
      id v11 = [v10 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v38 = *(void *)v48;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v48 != v38) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            v15 = [v10 objectForKeyedSubscript:v14];
            id v16 = [v15 length];

            if (v16)
            {
              id v17 = [objc_alloc((Class)SiriTTSSynthesisVoice) initWithLanguage:v37 name:0];
              id v18 = objc_alloc((Class)SiriTTSSynthesisRequest);
              v19 = [v10 objectForKeyedSubscript:v14];
              id v20 = [v18 initWithText:v19 voice:v17];

              [v20 setPrivacySensitive:1];
              dispatch_group_enter(group);
              id v21 = objc_alloc_init((Class)NSMutableArray);
              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472;
              v45[2] = sub_10002431C;
              v45[3] = &unk_10003D1F0;
              id v22 = v21;
              id v46 = v22;
              [v20 setDidGenerateAudio:v45];
              v23 = (void *)qword_100044418;
              if (os_log_type_enabled((os_log_t)qword_100044418, OS_LOG_TYPE_INFO))
              {
                v24 = v23;
                v25 = [v10 objectForKeyedSubscript:v14];
                *(_DWORD *)buf = 138412290;
                id v53 = v25;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "SRAudioGenerator: Start TTS request, text: %@", buf, 0xCu);
              }
              v26 = self->_synthesizer;
              v40[0] = _NSConcreteStackBlock;
              v40[1] = 3221225472;
              v40[2] = sub_100024428;
              v40[3] = &unk_10003D218;
              v27 = group;
              v41 = v27;
              id v42 = v22;
              uint64_t v43 = v14;
              id v44 = v36;
              id v28 = v22;
              [(SiriTTSDaemonSession *)v26 synthesizeWithRequest:v20 didFinish:v40];
              dispatch_time_t v29 = dispatch_time(0, (uint64_t)(((double)(unint64_t)v16 * 0.2 + 10.0) * 1000000000.0));
              dispatch_group_wait(v27, v29);
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v12);
      }

      id v30 = v36;
      id v6 = v34;
    }
    else
    {
      v31 = qword_100044418;
      if (os_log_type_enabled((os_log_t)qword_100044418, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "SRAudioGenerator: No texts found", buf, 2u);
      }
      id v30 = 0;
    }
  }
  else
  {
    v32 = qword_100044418;
    if (os_log_type_enabled((os_log_t)qword_100044418, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "SRAudioGenerator: Synthesizer initialize failed", buf, 2u);
    }
    id v30 = 0;
  }

  return v30;
}

- (SRAudioGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)SRAudioGenerator;
  return [(SRAudioGenerator *)&v3 init];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_100044418 = (uint64_t)os_log_create("com.apple.speech.speechmodeltraining", "SRAudioGenerator");
    _objc_release_x1();
  }
}

@end