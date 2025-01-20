@interface ICSDowntimeAnnouncement
- (VSSpeechRequest)speechRequest;
- (VSSpeechSynthesizer)speechSynthesizer;
- (id)text;
- (void)setSpeechRequest:(id)a3;
- (void)setSpeechSynthesizer:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ICSDowntimeAnnouncement

- (VSSpeechSynthesizer)speechSynthesizer
{
  speechSynthesizer = self->_speechSynthesizer;
  if (!speechSynthesizer)
  {
    v4 = (VSSpeechSynthesizer *)objc_alloc_init((Class)VSSpeechSynthesizer);
    v5 = self->_speechSynthesizer;
    self->_speechSynthesizer = v4;

    speechSynthesizer = self->_speechSynthesizer;
  }

  return speechSynthesizer;
}

- (void)start
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)VSSpeechRequest);
  v5 = [(ICSDowntimeAnnouncement *)self text];
  [v4 setText:v5];

  v6 = +[AFPreferences sharedPreferences];
  v7 = [v6 outputVoice];

  v8 = [v7 languageCode];
  [v4 setLanguageCode:v8];

  v9 = [v7 name];
  [v4 setVoiceName:v9];

  [(ICSDowntimeAnnouncement *)self setSpeechRequest:v4];
  [(ICSAnnouncement *)self delay];
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000293E8;
  v13[3] = &unk_1002CDDE0;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v13);
}

- (void)stop
{
  id v2 = [(ICSDowntimeAnnouncement *)self speechSynthesizer];
  [v2 stopSpeakingAtNextBoundary:1 synchronously:0 error:0];
}

- (id)text
{
  id v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"ANNOUNCEMENT_CALL_WILL_END_RESTRICTED" value:&stru_1002D6110 table:@"InCallService"];

  return v3;
}

- (VSSpeechRequest)speechRequest
{
  return self->_speechRequest;
}

- (void)setSpeechRequest:(id)a3
{
}

- (void)setSpeechSynthesizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);

  objc_storeStrong((id *)&self->_speechRequest, 0);
}

@end