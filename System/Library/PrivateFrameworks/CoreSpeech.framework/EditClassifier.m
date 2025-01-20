@interface EditClassifier
+ (void)initialize;
- (EditClassifier)initWithLanguage:(id)a3 task:(id)a4 samplingRate:(unint64_t)a5;
- (id)classifyWithUUID:(id)a3 parameters:(id)a4 nbestTokens:(id)a5 recognizedText:(id)a6 correctedText:(id)a7;
- (id)confusionPairs;
- (id)labelConfusionPair:(id)a3 errorType:(int64_t)a4;
- (id)labelConfusionPair:(id)a3 errorType:(int64_t)a4 alignedSourceIndex:(unint64_t)a5 alignedTargetIndex:(unint64_t)a6;
@end

@implementation EditClassifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confusionPairs, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_aligner, 0);
  objc_storeStrong((id *)&self->_synthesizer, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

- (id)confusionPairs
{
  return self->_confusionPairs;
}

- (id)labelConfusionPair:(id)a3 errorType:(int64_t)a4
{
  return [(EditClassifier *)self labelConfusionPair:a3 errorType:a4 alignedSourceIndex:0 alignedTargetIndex:0];
}

- (id)labelConfusionPair:(id)a3 errorType:(int64_t)a4 alignedSourceIndex:(unint64_t)a5 alignedTargetIndex:(unint64_t)a6
{
  id v10 = a3;
  [v10 setErrorType:a4];
  [v10 setAlignedSourceIndex:a5];
  [v10 setAlignedTargetIndex:a6];
  [(NSMutableArray *)self->_confusionPairs addObject:v10];

  return 0;
}

- (id)classifyWithUUID:(id)a3 parameters:(id)a4 nbestTokens:(id)a5 recognizedText:(id)a6 correctedText:(id)a7
{
  id v12 = a3;
  id v63 = a4;
  id v62 = a5;
  id v13 = a6;
  id v64 = a7;
  v65 = v12;
  v61 = v13;
  v14 = [[ConfusionPairAligner alloc] initWithUttId:v12 recognizedText:v13 correctedText:v64 errorType:0 editMethod:0];
  v15 = v14;
  if (!v14)
  {
    v34 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:355 userInfo:0];
    goto LABEL_49;
  }
  v60 = [(ConfusionPairAligner *)v14 confusionPairs];
  if ([v60 count])
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v16 = v60;
    id v17 = [v16 countByEnumeratingWithState:&v79 objects:v94 count:16];
    if (v17)
    {
      char v18 = 0;
      uint64_t v19 = *(void *)v80;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v80 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          if ([v21 isPunctuationEdit]) {
            id v22 = [(EditClassifier *)self labelConfusionPair:v21 errorType:3];
          }
          else {
            char v18 = 1;
          }
        }
        id v17 = [v16 countByEnumeratingWithState:&v79 objects:v94 count:16];
      }
      while (v17);

      if (v18)
      {
        id v23 = objc_alloc_init((Class)NSMutableArray);
        v24 = qword_1000443C0;
        if (os_log_type_enabled((os_log_t)qword_1000443C0, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "User Edit: Start TTS", buf, 2u);
        }
        synthesizer = self->_synthesizer;
        v92 = v65;
        id v93 = v64;
        v26 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
        v27 = [(SRAudioGenerator *)synthesizer generateTTSAudiosFromTexts:v26 language:self->_language downsample:0];

        if (v27 && [v27 count])
        {
          v28 = qword_1000443C0;
          if (os_log_type_enabled((os_log_t)qword_1000443C0, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "User Edit: Successfully received TTS audio", buf, 2u);
          }
          *(void *)buf = 0;
          v74 = buf;
          uint64_t v75 = 0x3032000000;
          v76 = sub_1000123F0;
          v77 = sub_100012400;
          id v78 = 0;
          recognizer = self->_recognizer;
          language = self->_language;
          task = self->_task;
          unint64_t samplingRate = self->_samplingRate;
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472;
          v70[2] = sub_100012408;
          v70[3] = &unk_10003CAB0;
          v72 = buf;
          id v33 = v23;
          id v71 = v33;
          [(CoreEmbeddedSpeechRecognizer *)recognizer redecodeWithAudioDatas:v27 language:language task:task samplingRate:samplingRate completion:v70];
          if ([v33 count] && !*((void *)v74 + 5))
          {
            v36 = (id)qword_1000443C0;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              id v37 = [v62 count];
              id v38 = [v33 count];
              id v39 = [v63 nbestAlignmentSourceBound];
              id v40 = [v63 nbestAlignmentTargetBound];
              *(_DWORD *)v84 = 134218752;
              id v85 = v37;
              __int16 v86 = 2048;
              id v87 = v38;
              __int16 v88 = 2048;
              id v89 = v39;
              __int16 v90 = 2048;
              id v91 = v40;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "User Edit: Aligning original decoding nbest result and redecoded nbest result, original nbest size: %lu, redecoded nbest size: %lu, alignment source bound: %lu, alignment target bound: %lu", v84, 0x2Au);
            }

            v58 = sub_100012574(v62);
            id v59 = objc_alloc_init((Class)NSMutableDictionary);
            int v41 = sub_100012824(self->_aligner, v33, v58, (unint64_t)[v63 nbestAlignmentSourceBound], (unint64_t)objc_msgSend(v63, "nbestAlignmentTargetBound"), v59);
            v42 = [v59 objectForKeyedSubscript:@"sourceIndex"];
            signed int v43 = [v42 intValue];

            v44 = [v59 objectForKeyedSubscript:@"targetIndex"];
            signed int v45 = [v44 intValue];

            v56 = v27;
            id v57 = v23;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id v46 = v16;
            id v47 = [v46 countByEnumeratingWithState:&v66 objects:v83 count:16];
            if (v47)
            {
              uint64_t v48 = *(void *)v67;
              do
              {
                for (j = 0; j != v47; j = (char *)j + 1)
                {
                  if (*(void *)v67 != v48) {
                    objc_enumerationMutation(v46);
                  }
                  v50 = *(void **)(*((void *)&v66 + 1) + 8 * (void)j);
                  if ((objc_msgSend(v50, "isPunctuationEdit", v56, v57) & 1) == 0)
                  {
                    if (v41) {
                      id v51 = [(EditClassifier *)self labelConfusionPair:v50 errorType:1 alignedSourceIndex:v43 alignedTargetIndex:v45];
                    }
                    else {
                      id v52 = [(EditClassifier *)self labelConfusionPair:v50 errorType:2];
                    }
                  }
                }
                id v47 = [v46 countByEnumeratingWithState:&v66 objects:v83 count:16];
              }
              while (v47);
            }

            v27 = v56;
            id v23 = v57;
            v53 = (id)qword_1000443C0;
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              id v54 = [v46 count];
              *(_DWORD *)v84 = 138412546;
              id v85 = v65;
              __int16 v86 = 2048;
              id v87 = v54;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "User Edit: Added confusion pairs, uuid: %@, count: %zu", v84, 0x16u);
            }

            v34 = 0;
          }
          else
          {
            v34 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:353 userInfo:0];
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          v34 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:354 userInfo:0];
        }

        goto LABEL_48;
      }
    }
    else
    {
    }
    v35 = qword_1000443C0;
    if (os_log_type_enabled((os_log_t)qword_1000443C0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "User Edit: Skip classification because there is no text edit", buf, 2u);
    }
    v34 = 0;
    goto LABEL_48;
  }
  v34 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:355 userInfo:0];
LABEL_48:

LABEL_49:
  return v34;
}

- (EditClassifier)initWithLanguage:(id)a3 task:(id)a4 samplingRate:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)EditClassifier;
  id v10 = [(EditClassifier *)&v26 init];
  if (!v10) {
    goto LABEL_9;
  }
  v11 = (CoreEmbeddedSpeechRecognizer *)[objc_alloc((Class)CoreEmbeddedSpeechRecognizer) initWithDelegate:0 instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDBackground];
  recognizer = v10->_recognizer;
  v10->_recognizer = v11;

  if (!v10->_recognizer) {
    goto LABEL_10;
  }
  id v13 = objc_alloc_init(SRAudioGenerator);
  synthesizer = v10->_synthesizer;
  v10->_synthesizer = v13;

  if (!v10->_synthesizer
    || (v15 = (_EAREditDistance *)objc_alloc_init((Class)_EAREditDistance),
        aligner = v10->_aligner,
        v10->_aligner = v15,
        aligner,
        !v10->_aligner)
    || ![v8 length])
  {
LABEL_10:
    char v18 = 0;
    goto LABEL_11;
  }
  id v17 = [v9 length];
  char v18 = 0;
  if (a5 && v17)
  {
    uint64_t v19 = (NSString *)[v8 copy];
    language = v10->_language;
    v10->_language = v19;

    v21 = (NSString *)[v9 copy];
    task = v10->_task;
    v10->_task = v21;

    v10->_unint64_t samplingRate = a5;
    id v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    confusionPairs = v10->_confusionPairs;
    v10->_confusionPairs = v23;

LABEL_9:
    char v18 = v10;
  }
LABEL_11:

  return v18;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_1000443C0 = (uint64_t)os_log_create("com.apple.speech.speechmodeltraining", "useredit");
    _objc_release_x1();
  }
}

@end