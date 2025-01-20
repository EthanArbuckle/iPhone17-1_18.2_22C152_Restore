@interface ICSAnnouncement
- (AVSpeechSynthesizer)speechSynthesizer;
- (AVSpeechUtterance)speechUtterance;
- (ICSAnnouncement)init;
- (ICSAnnouncementDelegate)delegate;
- (NSString)text;
- (double)delay;
- (void)pause;
- (void)setDelay:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setSpeechSynthesizer:(id)a3;
- (void)setSpeechUtterance:(id)a3;
- (void)setText:(id)a3;
- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didContinueSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didPauseSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation ICSAnnouncement

- (ICSAnnouncement)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICSAnnouncement;
  result = [(ICSAnnouncement *)&v3 init];
  if (result) {
    result->_delay = 1.0;
  }
  return result;
}

- (void)pause
{
  id v2 = [(ICSAnnouncement *)self speechSynthesizer];
  [v2 pauseSpeakingAtBoundary:1];
}

- (void)start
{
  objc_super v3 = [(ICSAnnouncement *)self text];
  v4 = +[AVSpeechUtterance speechUtteranceWithString:v3];
  [(ICSAnnouncement *)self setSpeechUtterance:v4];

  [(ICSAnnouncement *)self delay];
  double v6 = v5;
  v7 = [(ICSAnnouncement *)self speechUtterance];
  [v7 setPreUtteranceDelay:v6];

  id v9 = [(ICSAnnouncement *)self speechSynthesizer];
  v8 = [(ICSAnnouncement *)self speechUtterance];
  [v9 speakUtterance:v8];
}

- (void)stop
{
  id v2 = [(ICSAnnouncement *)self speechSynthesizer];
  [v2 stopSpeakingAtBoundary:1];
}

- (AVSpeechSynthesizer)speechSynthesizer
{
  speechSynthesizer = self->_speechSynthesizer;
  if (!speechSynthesizer)
  {
    v4 = (AVSpeechSynthesizer *)objc_alloc_init((Class)AVSpeechSynthesizer);
    double v5 = self->_speechSynthesizer;
    self->_speechSynthesizer = v4;

    [(AVSpeechSynthesizer *)self->_speechSynthesizer setDelegate:self];
    speechSynthesizer = self->_speechSynthesizer;
  }

  return speechSynthesizer;
}

- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4
{
  double v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", v9, 2u);
  }

  double v6 = [(ICSAnnouncement *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(ICSAnnouncement *)self delegate];
    [v8 announcementDidStart:self];
  }
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  -[ICSAnnouncement setSpeechUtterance:](self, "setSpeechUtterance:", 0, a4);
  [(ICSAnnouncement *)self setText:0];
  double v5 = [(ICSAnnouncement *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ICSAnnouncement *)self delegate];
    [v7 announcementDidFinish:self];
  }
}

- (void)speechSynthesizer:(id)a3 didPauseSpeechUtterance:(id)a4
{
  double v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", v9, 2u);
  }

  char v6 = [(ICSAnnouncement *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(ICSAnnouncement *)self delegate];
    [v8 announcementDidPause:self];
  }
}

- (void)speechSynthesizer:(id)a3 didContinueSpeechUtterance:(id)a4
{
  double v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", v9, 2u);
  }

  char v6 = [(ICSAnnouncement *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(ICSAnnouncement *)self delegate];
    [v8 announcementDidContinue:self];
  }
}

- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "", v9, 2u);
  }

  [(ICSAnnouncement *)self speechSynthesizer:v7 didFinishSpeechUtterance:v6];
}

- (ICSAnnouncementDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ICSAnnouncementDelegate *)a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void)setSpeechSynthesizer:(id)a3
{
}

- (AVSpeechUtterance)speechUtterance
{
  return self->_speechUtterance;
}

- (void)setSpeechUtterance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechUtterance, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end