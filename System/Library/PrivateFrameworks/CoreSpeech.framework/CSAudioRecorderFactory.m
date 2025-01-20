@interface CSAudioRecorderFactory
+ (id)audioRecorderWithQueue:(id)a3 error:(id *)a4;
@end

@implementation CSAudioRecorderFactory

+ (id)audioRecorderWithQueue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[CSFPreferences sharedPreferences];
  unsigned int v7 = [v6 programmableAudioInjectionEnabled];

  if (v7)
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      v12 = "+[CSAudioRecorderFactory audioRecorderWithQueue:error:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Using audioInjectionProvider as recorder", (uint8_t *)&v11, 0xCu);
    }
    id v9 = +[CSAudioInjectionProvider defaultInjectionProvider];
    [v9 start];
  }
  else
  {
    id v9 = [objc_alloc((Class)CSAudioRecorder) initWithQueue:v5 error:a4];
  }

  return v9;
}

@end