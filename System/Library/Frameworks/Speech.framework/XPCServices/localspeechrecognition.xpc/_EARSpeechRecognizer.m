@interface _EARSpeechRecognizer
+ (id)_speechRecognizerWithLanguage:(id)a3 overrides:(id)a4 anyConfiguration:(BOOL)a5 taskConfiguration:(id)a6 modelRoot:(id)a7 error:(id *)a8 modelLoadTime:(double *)a9;
- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10 modelContextDelegate:(id)a11 enableItn:(BOOL)a12;
@end

@implementation _EARSpeechRecognizer

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10 modelContextDelegate:(id)a11 enableItn:(BOOL)a12
{
  LOBYTE(v14) = a12;
  LOWORD(v13) = __PAIR16__(a10, a9);
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:", a3, a4, a5, a6, a7, a8, v13, 0, a11, v14);
}

+ (id)_speechRecognizerWithLanguage:(id)a3 overrides:(id)a4 anyConfiguration:(BOOL)a5 taskConfiguration:(id)a6 modelRoot:(id)a7 error:(id *)a8 modelLoadTime:(double *)a9
{
  BOOL v12 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  if (v17)
  {
    v18 = +[NSProcessInfo processInfo];
    [v18 systemUptime];
    double v20 = v19;

    v21 = [v17 stringByAppendingPathComponent:@"mini.json"];
    id v41 = v14;
    if (v12)
    {
      id v22 = +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForEverything];
      if (!v16)
      {
LABEL_10:
        id v29 = objc_alloc_init((Class)NSMutableDictionary);
        if ([v16 isEqualToString:kSFSpeechRecognizerTaskCaptioning]) {
          [v29 setValue:@"YES" forKey:@"keepANEModelLoaded"];
        }
        LOBYTE(v40) = 1;
        LOWORD(v39) = 0;
        id v30 = objc_msgSend(objc_alloc((Class)_EARSpeechRecognizer), "initWithConfig:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:error:", v21, v15, 0, v41, v22, v29, v39, 0, 0, v40, a8);
        v24 = v30;
        if (v30)
        {
          [v30 setDetectUtterances:1];
          [v24 setRecognizeEagerCandidates:1];
          [v24 setConcatenateUtterances:1];
          [v24 setEnableSpeakerCodeTraining:0];
          v31 = +[NSProcessInfo processInfo];
          [v31 systemUptime];
          double v33 = v32 - v20;

          v34 = SFLogConnection;
          if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v43 = "+[_EARSpeechRecognizer(LSRConnection) _speechRecognizerWithLanguage:overrides:anyConfiguration:taskCon"
                  "figuration:modelRoot:error:modelLoadTime:]";
            __int16 v44 = 2048;
            double v45 = v33;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s Created Recognizer in %lf sec", buf, 0x16u);
          }
          if (a9) {
            *a9 = v33;
          }
          id v35 = v24;
          goto LABEL_21;
        }
        v36 = SFLogConnection;
        if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v43 = "+[_EARSpeechRecognizer(LSRConnection) _speechRecognizerWithLanguage:overrides:anyConfiguration:taskConfi"
                "guration:modelRoot:error:modelLoadTime:]";
          __int16 v44 = 2112;
          double v45 = *(double *)&v21;
          _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s Failed to create recognizer from: %@", buf, 0x16u);
          if (!a8) {
            goto LABEL_21;
          }
        }
        else if (!a8)
        {
LABEL_21:

          id v14 = v41;
          goto LABEL_22;
        }
        v37 = +[NSString stringWithFormat:@"Failed to create recognizer from=%@", v21];
        *a8 = +[NSError lsr_errorWithCode:300 description:v37];

        goto LABEL_21;
      }
    }
    else
    {
      id v22 = objc_alloc_init((Class)_EARSpeechRecognitionActiveConfiguration);
      v25 = +[NSSet set];
      [v22 setSamplingRateFilter:v25];

      v26 = +[NSSet set];
      [v22 setTaskTypeFilter:v26];

      v27 = +[NSSet set];
      [v22 setFarFieldFilter:v27];

      [v22 setDeviceIdFilter:0];
      [v22 setAtypicalSpeechFilter:0];
      if (!v16) {
        goto LABEL_10;
      }
    }
    v28 = +[NSSet setWithObject:v16];
    [v22 setTaskTypeFilter:v28];

    goto LABEL_10;
  }
  v23 = SFLogConnection;
  if (os_log_type_enabled(SFLogConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v43 = "+[_EARSpeechRecognizer(LSRConnection) _speechRecognizerWithLanguage:overrides:anyConfiguration:taskConfigurati"
          "on:modelRoot:error:modelLoadTime:]";
    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Could not locate asset.", buf, 0xCu);
  }
  v24 = 0;
LABEL_22:

  return v24;
}

@end