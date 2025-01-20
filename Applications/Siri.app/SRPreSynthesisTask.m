@interface SRPreSynthesisTask
- (BOOL)handlePreSynthesisCommandWithError:(id *)a3;
- (SAAceCommand)replyAceCommand;
- (SAPreSynthesizeTTS)preSynthesizeTTSCommand;
- (SRPreSynthesisTask)init;
- (id)completion;
- (void)didFinishSynthesisRequest:(id)a3 withInstrumentMetrics:(id)a4 error:(id)a5;
- (void)setCompletion:(id)a3;
- (void)setPreSynthesizeTTSCommand:(id)a3;
- (void)setReplyAceCommand:(id)a3;
@end

@implementation SRPreSynthesisTask

- (SRPreSynthesisTask)init
{
  v8.receiver = self;
  v8.super_class = (Class)SRPreSynthesisTask;
  v2 = [(SRPreSynthesisTask *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[AFConnection outputVoice];
    outputVoice = v2->_outputVoice;
    v2->_outputVoice = (AFVoiceInfo *)v3;

    v5 = (SiriTTSDaemonSession *)objc_alloc_init((Class)SiriTTSDaemonSession);
    speechSynthesizer = v2->_speechSynthesizer;
    v2->_speechSynthesizer = v5;
  }
  return v2;
}

- (void)setPreSynthesizeTTSCommand:(id)a3
{
  v5 = (SAPreSynthesizeTTS *)a3;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_1000BA214();
  }
  p_preSynthesizeTTSCommand = &self->_preSynthesizeTTSCommand;
  if (self->_preSynthesizeTTSCommand != v5)
  {
    objc_storeStrong((id *)&self->_preSynthesizeTTSCommand, a3);
    preSynthesizedTTSAudioDurations = self->_preSynthesizedTTSAudioDurations;
    self->_preSynthesizedTTSAudioDurations = 0;

    parsedDialogStringsForPreSynthesis = self->_parsedDialogStringsForPreSynthesis;
    self->_parsedDialogStringsForPreSynthesis = 0;

    parsedDialogStringIndicies = self->_parsedDialogStringIndicies;
    self->_parsedDialogStringIndicies = 0;

    currentError = self->_currentError;
    self->_currentError = 0;

    if (self->_preSynthesizeTTSCommand)
    {
      v52 = v5;
      id v11 = objc_alloc((Class)NSLocale);
      v12 = AFUIGetLanguageCode();
      id v13 = [v11 initWithLocaleIdentifier:v12];

      v51 = v13;
      id v14 = [objc_alloc((Class)AFSpeakableUtteranceParser) initWithLocale:v13];
      [v14 setHandleTTSCodes:1];
      v15 = +[NSMutableArray array];
      v16 = +[NSMutableDictionary dictionary];
      v17 = self->_parsedDialogStringIndicies;
      self->_parsedDialogStringIndicies = v16;

      v18 = [(SAPreSynthesizeTTS *)self->_preSynthesizeTTSCommand dialogStrings];
      id v19 = [v18 count];

      v21 = 0;
      if (v19)
      {
        unint64_t v22 = 0;
        *(void *)&long long v20 = 136315906;
        long long v50 = v20;
        do
        {

          v23 = [(SAPreSynthesizeTTS *)*p_preSynthesizeTTSCommand dialogStrings];
          v24 = [v23 objectAtIndexedSubscript:v22];

          id v53 = 0;
          v25 = [v14 parseStringWithFormat:v24 error:&v53];
          v21 = (NSMutableDictionary *)v53;
          if ([v25 length])
          {
            [v15 addObject:v25];
            v26 = +[NSNumber numberWithUnsignedInteger:v22];
            [(NSMutableDictionary *)self->_parsedDialogStringIndicies setObject:v26 forKeyedSubscript:v25];
          }
          if (v21)
          {
            v27 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              v30 = v27;
              v31 = [(SAPreSynthesizeTTS *)v52 dialogStrings];
              *(_DWORD *)buf = v50;
              v55 = "-[SRPreSynthesisTask setPreSynthesizeTTSCommand:]";
              __int16 v56 = 2114;
              v57 = v31;
              __int16 v58 = 2114;
              id v59 = v14;
              __int16 v60 = 2114;
              v61 = v21;
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s #presynthesize Speakable utterance parser failed to parse presynthesis dialogStrings. (speakableText = %{public}@, speakableUtteranceParser = %{public}@, error = %{public}@)", buf, 0x2Au);
            }
          }

          ++v22;
          v28 = [(SAPreSynthesizeTTS *)*p_preSynthesizeTTSCommand dialogStrings];
          id v29 = [v28 count];
        }
        while (v22 < (unint64_t)v29);
      }
      id v32 = [v15 count:v50];
      v33 = [(SAPreSynthesizeTTS *)*p_preSynthesizeTTSCommand dialogStrings];
      if (v32 == [v33 count])
      {
        id v34 = [(NSMutableDictionary *)self->_parsedDialogStringIndicies count];
        v35 = [(SAPreSynthesizeTTS *)self->_preSynthesizeTTSCommand dialogStrings];
        id v36 = [v35 count];

        if (v34 == v36)
        {
LABEL_19:
          if ([v15 count]) {
            objc_storeStrong((id *)&self->_parsedDialogStringsForPreSynthesis, v15);
          }
          v38 = [(SAPreSynthesizeTTS *)self->_preSynthesizeTTSCommand dialogStrings];
          +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v38 count]);
          v39 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          v40 = self->_preSynthesizedTTSAudioDurations;
          self->_preSynthesizedTTSAudioDurations = v39;

          v41 = [(SAPreSynthesizeTTS *)self->_preSynthesizeTTSCommand dialogStrings];
          id v42 = [v41 count];

          if (v42)
          {
            unint64_t v43 = 0;
            do
            {
              [(NSMutableArray *)self->_preSynthesizedTTSAudioDurations setObject:&off_100149A40 atIndexedSubscript:v43++];
              v44 = [(SAPreSynthesizeTTS *)self->_preSynthesizeTTSCommand dialogStrings];
              id v45 = [v44 count];
            }
            while (v43 < (unint64_t)v45);
          }

          v5 = v52;
          goto LABEL_25;
        }
      }
      else
      {
      }
      v37 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        preSynthesizeTTSCommand = self->_preSynthesizeTTSCommand;
        v47 = v37;
        v48 = [(SAPreSynthesizeTTS *)preSynthesizeTTSCommand dialogStrings];
        v49 = self->_parsedDialogStringIndicies;
        *(_DWORD *)buf = 136315906;
        v55 = "-[SRPreSynthesisTask setPreSynthesizeTTSCommand:]";
        __int16 v56 = 2114;
        v57 = v48;
        __int16 v58 = 2114;
        id v59 = v15;
        __int16 v60 = 2114;
        v61 = v49;
        _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s #presynthesize Failed to generate same number of utterances for dialogStrings = %{public}@, parsedDialogs = %{public}@, _parsedDialogStringIndicies = %{public}@)", buf, 0x2Au);
      }
      goto LABEL_19;
    }
  }
LABEL_25:
}

- (SAAceCommand)replyAceCommand
{
  p_preSynthesizeTTSCommand = &self->_preSynthesizeTTSCommand;
  if (!self->_preSynthesizeTTSCommand || [(NSMutableDictionary *)self->_parsedDialogStringIndicies count])
  {
    id v4 = 0;
    goto LABEL_15;
  }
  v5 = [(SAPreSynthesizeTTS *)*p_preSynthesizeTTSCommand aceAudioData];
  if (v5)
  {

LABEL_7:
    v7 = AFSiriLogContextConnection;
    if (self->_currentError)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_1000BA294((uint64_t *)p_preSynthesizeTTSCommand, v7);
      }
      objc_super v8 = (objc_class *)SACommandFailed;
    }
    else
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *p_preSynthesizeTTSCommand;
        int v17 = 136315394;
        v18 = "-[SRPreSynthesisTask replyAceCommand]";
        __int16 v19 = 2112;
        long long v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s PreSynthesizeTTS command (%@) succeeded", (uint8_t *)&v17, 0x16u);
      }
      objc_super v8 = (objc_class *)SACommandSucceeded;
    }
    id v4 = objc_alloc_init(v8);
    v10 = [(SAPreSynthesizeTTS *)*p_preSynthesizeTTSCommand aceId];
    [v4 setRefId:v10];

    goto LABEL_15;
  }
  v6 = [(SAPreSynthesizeTTS *)*p_preSynthesizeTTSCommand streamIds];

  if (v6) {
    goto LABEL_7;
  }
  id v4 = objc_alloc_init((Class)SAPreSynthesizeTTSCompleted);
  v12 = [(SAPreSynthesizeTTS *)self->_preSynthesizeTTSCommand aceId];
  [v4 setRefId:v12];

  if ([(NSMutableArray *)self->_preSynthesizedTTSAudioDurations count])
  {
    unint64_t v13 = 0;
    do
    {
      id v14 = [(NSMutableArray *)self->_preSynthesizedTTSAudioDurations objectAtIndexedSubscript:v13];
      [v14 doubleValue];
      double v16 = v15;

      if (v16 < 0.0) {
        [(NSMutableArray *)self->_preSynthesizedTTSAudioDurations setObject:&off_100149A50 atIndexedSubscript:v13];
      }
      ++v13;
    }
    while (v13 < (unint64_t)[(NSMutableArray *)self->_preSynthesizedTTSAudioDurations count]);
  }
  [v4 setApproximateSpeechDuration:self->_preSynthesizedTTSAudioDurations];
LABEL_15:

  return (SAAceCommand *)v4;
}

- (BOOL)handlePreSynthesisCommandWithError:(id *)a3
{
  id v4 = self;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    sub_1000BA4DC(v5);
    id v4 = self;
  }
  v73 = a3;
  if (a3)
  {
    if (*a3) {
      *a3 = 0;
    }
    p_preSynthesizeTTSCommand = (id *)&v4->_preSynthesizeTTSCommand;
    if (v4->_preSynthesizeTTSCommand)
    {
      parsedDialogStringsForPreSynthesis = v4->_parsedDialogStringsForPreSynthesis;
      p_parsedDialogStringsForPreSynthesis = (id *)&v4->_parsedDialogStringsForPreSynthesis;
      v7 = parsedDialogStringsForPreSynthesis;
      if (!parsedDialogStringsForPreSynthesis)
      {
        id *v73 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:11 userInfo:&__NSDictionary0__struct];
LABEL_49:
        long long v50 = AFSiriLogContextConnection;
        BOOL v42 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR);
        if (!v42) {
          return v42;
        }
        sub_1000BA39C(v50, v51, v52, v53, v54, v55, v56, v57);
        goto LABEL_55;
      }
      goto LABEL_11;
    }
    id *v73 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:11 userInfo:&__NSDictionary0__struct];
LABEL_47:
    v41 = AFSiriLogContextConnection;
    BOOL v42 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR);
    if (!v42) {
      return v42;
    }
    sub_1000BA324(v41, v43, v44, v45, v46, v47, v48, v49);
    goto LABEL_55;
  }
  p_preSynthesizeTTSCommand = (id *)&v4->_preSynthesizeTTSCommand;
  if (!v4->_preSynthesizeTTSCommand) {
    goto LABEL_47;
  }
  v10 = v4->_parsedDialogStringsForPreSynthesis;
  p_parsedDialogStringsForPreSynthesis = (id *)&v4->_parsedDialogStringsForPreSynthesis;
  v7 = v10;
  if (!v10) {
    goto LABEL_49;
  }
LABEL_11:
  if ([(NSArray *)v7 count])
  {
    if ([*p_parsedDialogStringsForPreSynthesis count])
    {
      unint64_t v12 = 0;
      uint64_t v74 = kAFAssistantErrorDomain;
      *(void *)&long long v11 = 136315650;
      long long v72 = v11;
      do
      {
        unint64_t v13 = [*p_preSynthesizeTTSCommand aceAudioData];
        if (v13)
        {
          id v14 = [*p_preSynthesizeTTSCommand aceAudioData];
          if (v12 >= (unint64_t)[v14 count])
          {
            double v16 = 0;
          }
          else
          {
            double v15 = [*p_preSynthesizeTTSCommand aceAudioData];
            double v16 = [v15 objectAtIndexedSubscript:v12];
          }
        }
        else
        {
          double v16 = 0;
        }

        int v17 = [*p_preSynthesizeTTSCommand streamIds];
        if (v17)
        {
          v18 = [*p_preSynthesizeTTSCommand streamIds];
          if (v12 >= (unint64_t)[v18 count])
          {
            unint64_t v22 = 0;
          }
          else
          {
            __int16 v19 = [*p_preSynthesizeTTSCommand streamIds];
            long long v20 = [v19 objectAtIndexedSubscript:v12];
            if ([v20 length])
            {
              v21 = [*p_preSynthesizeTTSCommand streamIds];
              unint64_t v22 = [v21 objectAtIndexedSubscript:v12];
            }
            else
            {
              unint64_t v22 = 0;
            }
          }
        }
        else
        {
          unint64_t v22 = 0;
        }

        v23 = [*p_parsedDialogStringsForPreSynthesis objectAtIndexedSubscript:v12];
        if (![v23 length])
        {
          v25 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
            sub_1000BA48C(v86, &v87, v25);
          }
          v26 = +[NSError errorWithDomain:v74 code:11 userInfo:&__NSDictionary0__struct];
          currentError = self->_currentError;
          self->_currentError = v26;
          goto LABEL_37;
        }
        v24 = [v16 audioBuffer];
        if ([v24 length])
        {
        }
        else
        {
          BOOL v28 = [v22 length] == 0;

          if (v28)
          {
            id v29 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              id v30 = *p_preSynthesizeTTSCommand;
              v31 = v29;
              id v32 = [v30 speakableContextInfo];
              *(_DWORD *)buf = v72;
              *(void *)&uint8_t buf[4] = "-[SRPreSynthesisTask handlePreSynthesisCommandWithError:]";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v23;
              *(_WORD *)&buf[22] = 2112;
              v83 = v32;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s Presynthesizing text:%@, context:%@)", buf, 0x20u);
            }
            id v33 = objc_alloc((Class)SiriTTSSynthesisVoice);
            id v34 = [(AFVoiceInfo *)self->_outputVoice languageCode];
            v35 = [(AFVoiceInfo *)self->_outputVoice name];
            currentError = (NSError *)[v33 initWithLanguage:v34 name:v35];

            id v36 = [objc_alloc((Class)SiriTTSSynthesisRequest) initWithText:v23 voice:currentError];
            v37 = [(SAPreSynthesizeTTS *)self->_preSynthesizeTTSCommand speakableContextInfo];
            [v36 setContextInfo:v37];

            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v83 = sub_100068680;
            v84 = sub_100068690;
            id v85 = 0;
            v81[0] = _NSConcreteStackBlock;
            v81[1] = 3221225472;
            v81[2] = sub_100068698;
            v81[3] = &unk_100144790;
            v81[4] = buf;
            [v36 setDidReportInstrument:v81];
            objc_initWeak(&location, self);
            speechSynthesizer = self->_speechSynthesizer;
            v76[0] = _NSConcreteStackBlock;
            v76[1] = 3221225472;
            v76[2] = sub_1000686A8;
            v76[3] = &unk_1001447B8;
            objc_copyWeak(&v79, &location);
            id v39 = v36;
            id v77 = v39;
            v78 = buf;
            [(SiriTTSDaemonSession *)speechSynthesizer synthesizeWithRequest:v39 didFinish:v76];

            objc_destroyWeak(&v79);
            objc_destroyWeak(&location);
            _Block_object_dispose(buf, 8);

            goto LABEL_37;
          }
        }
        currentError = (NSError *)[objc_alloc((Class)SiriTTSInlineStreamingSignal) initWithText:v23 identifier:v22];
        [(SiriTTSDaemonSession *)self->_speechSynthesizer signalWithInlineStreaming:currentError];
LABEL_37:

        ++v12;
      }
      while (v12 < (unint64_t)[*p_parsedDialogStringsForPreSynthesis count]);
    }
    if (v73) {
      id *v73 = self->_currentError;
    }
    v40 = [*p_preSynthesizeTTSCommand aceAudioData];
    if (v40)
    {
    }
    else
    {
      v68 = [*p_preSynthesizeTTSCommand streamIds];
      BOOL v69 = v68 == 0;

      if (v69)
      {
        v70 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[SRPreSynthesisTask handlePreSynthesisCommandWithError:]";
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%s Defer calling completion for PreSynthesisTTS to SiriTTSDaemonSession didFinish callback", buf, 0xCu);
        }
        goto LABEL_58;
      }
    }
    (*((void (**)(void))self->_completion + 2))();
LABEL_58:
    LOBYTE(v42) = 1;
    return v42;
  }
  if (self->_completion)
  {
    __int16 v58 = +[NSError errorWithDomain:kAFAssistantErrorDomain code:11 userInfo:&__NSDictionary0__struct];
    id v59 = self->_currentError;
    self->_currentError = v58;

    __int16 v60 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000BA414(v60, v61, v62, v63, v64, v65, v66, v67);
    }
    (*((void (**)(void))self->_completion + 2))();
  }
LABEL_55:
  LOBYTE(v42) = 0;
  return v42;
}

- (void)didFinishSynthesisRequest:(id)a3 withInstrumentMetrics:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_1000BA560();
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100068838;
  v14[3] = &unk_1001434D8;
  id v15 = v8;
  double v16 = self;
  id v17 = v10;
  id v18 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
}

- (SAPreSynthesizeTTS)preSynthesizeTTSCommand
{
  return self->_preSynthesizeTTSCommand;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void)setReplyAceCommand:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyAceCommand, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_preSynthesizeTTSCommand, 0);
  objc_storeStrong((id *)&self->_parsedDialogStringIndicies, 0);
  objc_storeStrong((id *)&self->_preSynthesizedTTSAudioDurations, 0);
  objc_storeStrong((id *)&self->_parsedDialogStringsForPreSynthesis, 0);
  objc_storeStrong((id *)&self->_currentError, 0);
  objc_storeStrong((id *)&self->_outputVoice, 0);

  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
}

@end