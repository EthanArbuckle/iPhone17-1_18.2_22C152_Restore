@interface ICSSiriCallAnnouncement
- (ICSSiriCallAnnouncement)initWithCall:(id)a3;
- (VSSpeechSynthesizer)speechSynthesizer;
- (id)playAnnouncementBlock;
- (int64_t)callerIDType;
- (unsigned)audioSessionIdentifier;
- (void)pause;
- (void)setAudioSessionIdentifier:(unsigned int)a3;
- (void)setCallerIDType:(int64_t *)a3;
- (void)setPlayAnnouncementBlock:(id)a3;
- (void)setSpeechSynthesizer:(id)a3;
- (void)speechSynthesizer:(id)a3 didContinueSpeakingRequest:(id)a4;
- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 phonemesSpoken:(id)a6 withError:(id)a7;
- (void)speechSynthesizer:(id)a3 didPauseSpeakingRequest:(id)a4;
- (void)speechSynthesizer:(id)a3 didStartSpeakingRequest:(id)a4;
- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 forRequest:(id)a5;
- (void)start;
- (void)stop;
@end

@implementation ICSSiriCallAnnouncement

- (ICSSiriCallAnnouncement)initWithCall:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSSiriCallAnnouncement;
  result = [(ICSCallAnnouncement *)&v4 initWithCall:a3];
  if (result) {
    result->_audioSessionIdentifier = 0;
  }
  return result;
}

- (void)pause
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Pause ICSSiriCallAnnouncement", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022CDC;
  block[3] = &unk_1002CD518;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)start
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Start ICSSiriCallAnnouncement", (uint8_t *)buf, 2u);
  }

  objc_super v4 = [(ICSCallAnnouncement *)self contacts];
  id v5 = [objc_alloc((Class)AFSiriRingtone) initWithContacts:v4];
  v6 = [(ICSCallAnnouncement *)self callDestinationID];
  [v5 setCallDestinationID:v6];

  v7 = [(ICSCallAnnouncement *)self callDestinationID];
  unsigned __int8 v8 = [v7 destinationIdIsEmailAddress];

  if (v8)
  {
    uint64_t v9 = 2;
  }
  else
  {
    v10 = [(ICSCallAnnouncement *)self callDestinationID];
    unsigned int v11 = [v10 destinationIdIsPhoneNumber];

    uint64_t v9 = v11;
  }
  [v5 setCallDestinationIDType:v9];
  v12 = [(ICSCallAnnouncement *)self callServiceName];
  [v5 setCallServiceSpeakableName:v12];

  v13 = [(ICSCallAnnouncement *)self callerName];
  [v5 setDisplayedCallerID:v13];

  id v14 = objc_alloc_init((Class)VSSpeechRequest);
  v15 = [v5 voiceInfo];
  v16 = [v15 languageCode];
  [v14 setLanguageCode:v16];

  int64_t v17 = [(ICSCallAnnouncement *)self callerNameType];
  if (v17 == 2) {
    uint64_t v18 = 3;
  }
  else {
    uint64_t v18 = 4 * (v17 == 1);
  }
  [v5 setCallerIDType:v18];
  v19 = [v5 voiceInfo];
  v20 = (char *)[v19 gender];
  if ((unint64_t)(v20 - 1) >= 3) {
    v21 = 0;
  }
  else {
    v21 = v20;
  }
  [v14 setGender:v21];
  id v22 = [v19 footprint];
  if (v22 == (id)2) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = v22 == (id)1;
  }
  [v14 setAudioSessionID:[self audioSessionIdentifier]];
  [v14 setFootprint:v23];
  v24 = [v19 name];
  [v14 setVoiceName:v24];

  v25 = [v5 textToSpeak];
  [v14 setText:v25];

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000230D0;
  block[3] = &unk_1002CDCA8;
  objc_copyWeak(&v32, buf);
  id v31 = v14;
  id v26 = v14;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100023170;
  v28[3] = &unk_1002CDCD0;
  v28[4] = self;
  id v29 = dispatch_block_create((dispatch_block_flags_t)0, block);
  id v27 = v29;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v28);

  objc_destroyWeak(&v32);
  objc_destroyWeak(buf);
}

- (void)stop
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop ICSSiriCallAnnouncement", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023298;
  block[3] = &unk_1002CD518;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (VSSpeechSynthesizer)speechSynthesizer
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  speechSynthesizer = self->_speechSynthesizer;
  if (!speechSynthesizer)
  {
    objc_super v4 = (VSSpeechSynthesizer *)objc_alloc_init((Class)VSSpeechSynthesizer);
    id v5 = self->_speechSynthesizer;
    self->_speechSynthesizer = v4;

    [(VSSpeechSynthesizer *)self->_speechSynthesizer setDelegate:self];
    speechSynthesizer = self->_speechSynthesizer;
  }

  return speechSynthesizer;
}

- (void)speechSynthesizer:(id)a3 didStartSpeakingRequest:(id)a4
{
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", v9, 2u);
  }

  v6 = [(ICSAnnouncement *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    unsigned __int8 v8 = [(ICSAnnouncement *)self delegate];
    [v8 announcementDidStart:self];
  }
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 phonemesSpoken:(id)a6 withError:(id)a7
{
  id v8 = a7;
  uint64_t v9 = sub_1000D5130();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "", v14, 2u);
  }

  if (v8)
  {
    v10 = sub_1000D5130();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E95DC();
    }
  }
  unsigned int v11 = [(ICSAnnouncement *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(ICSAnnouncement *)self delegate];
    [v13 announcementDidFinish:self];
  }
}

- (void)speechSynthesizer:(id)a3 didPauseSpeakingRequest:(id)a4
{
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", v9, 2u);
  }

  v6 = [(ICSAnnouncement *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(ICSAnnouncement *)self delegate];
    [v8 announcementDidPause:self];
  }
}

- (void)speechSynthesizer:(id)a3 didContinueSpeakingRequest:(id)a4
{
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", v9, 2u);
  }

  v6 = [(ICSAnnouncement *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(ICSAnnouncement *)self delegate];
    [v8 announcementDidContinue:self];
  }
}

- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 forRequest:(id)a5
{
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", v6, 2u);
  }
}

- (unsigned)audioSessionIdentifier
{
  return self->_audioSessionIdentifier;
}

- (void)setAudioSessionIdentifier:(unsigned int)a3
{
  self->_audioSessionIdentifier = a3;
}

- (int64_t)callerIDType
{
  return self->_callerIDType;
}

- (void)setCallerIDType:(int64_t *)a3
{
  self->_callerIDType = a3;
}

- (void)setSpeechSynthesizer:(id)a3
{
}

- (id)playAnnouncementBlock
{
  return self->_playAnnouncementBlock;
}

- (void)setPlayAnnouncementBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_playAnnouncementBlock, 0);

  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
}

@end