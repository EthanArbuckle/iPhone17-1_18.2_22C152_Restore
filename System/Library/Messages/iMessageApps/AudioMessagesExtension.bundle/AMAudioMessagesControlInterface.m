@interface AMAudioMessagesControlInterface
+ (BOOL)isCurrentEntryViewEmpty;
- (AMAudioMessagesControlInterface)init;
- (AMAudioMessagesControlInterface)initWithDelegate:(id)a3;
- (AMAudioMessagesControlInterfaceDelegate)controlInterfaceDelegate;
- (BOOL)audioMessageRecordingAvailable;
- (CKMessageEntryView)currentEntryView;
- (NSArray)powerLevels;
- (double)duration;
- (void)audioMessageDidCancelMessage;
- (void)audioMessageDidChangeAudioPowerLevel:(float)a3 duration:(double)a4;
- (void)audioMessageDidChangeCurrentPlaybackTime:(double)a3;
- (void)audioMessageDidEndPlayback;
- (void)audioMessageDidSendMessage;
- (void)audioMessageDidStartPlayback;
- (void)audioMessageRecordingAvailabilityChanged;
- (void)audioMessageStartedRecordingFromMessages;
- (void)audioMessageStoppedRecordingFromMessages;
- (void)cancelAudioMessage;
- (void)disableRotationWhileRecordingAudioMessage;
- (void)pausePlaying;
- (void)sendAudioMessage;
- (void)setControlInterfaceDelegate:(id)a3;
- (void)setCurrentEntryView:(id)a3;
- (void)startPlaying;
- (void)startRecording;
- (void)stopRecording;
@end

@implementation AMAudioMessagesControlInterface

- (AMAudioMessagesControlInterface)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMAudioMessagesControlInterface;
  v5 = [(AMAudioMessagesControlInterface *)&v9 init];
  if (v5)
  {
    v6 = +[CKMessageEntryView currentEntryView];
    objc_storeWeak((id *)&v5->_currentEntryView, v6);

    id WeakRetained = objc_loadWeakRetained((id *)&v5->_currentEntryView);
    [WeakRetained setAudioMessageAppDelegate:v5];

    objc_storeWeak((id *)&v5->_controlInterfaceDelegate, v4);
  }

  return v5;
}

- (AMAudioMessagesControlInterface)init
{
  return [(AMAudioMessagesControlInterface *)self initWithDelegate:0];
}

- (BOOL)audioMessageRecordingAvailable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentEntryView);
  unsigned __int8 v3 = [WeakRetained isAudioMessageRecordingAvailable];

  return v3;
}

- (NSArray)powerLevels
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentEntryView);
  unsigned __int8 v3 = [WeakRetained powerLevels];

  return (NSArray *)v3;
}

- (double)duration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentEntryView);
  [WeakRetained duration];
  double v4 = v3;

  return v4;
}

- (void)startRecording
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[AMAudioMessagesControlInterface startRecording]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentEntryView);
  [WeakRetained startRecording];
}

- (void)stopRecording
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[AMAudioMessagesControlInterface stopRecording]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentEntryView);
  [WeakRetained stopRecording];
}

- (void)sendAudioMessage
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[AMAudioMessagesControlInterface sendAudioMessage]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentEntryView);
  [WeakRetained sendAudioMessage];
}

- (void)cancelAudioMessage
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[AMAudioMessagesControlInterface cancelAudioMessage]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentEntryView);
  [WeakRetained cancelAudioMessage];
}

- (void)startPlaying
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[AMAudioMessagesControlInterface startPlaying]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentEntryView);
  [WeakRetained startPlaying];
}

- (void)pausePlaying
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[AMAudioMessagesControlInterface pausePlaying]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentEntryView);
  [WeakRetained pausePlaying];
}

- (void)disableRotationWhileRecordingAudioMessage
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    v8 = "-[AMAudioMessagesControlInterface disableRotationWhileRecordingAudioMessage]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }
  p_currentEntryView = &self->_currentEntryView;
  id WeakRetained = objc_loadWeakRetained((id *)p_currentEntryView);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_currentEntryView);
    [v6 disableRotationWhileRecordingAudioMessage];
  }
}

+ (BOOL)isCurrentEntryViewEmpty
{
  v2 = +[CKMessageEntryView currentEntryView];
  double v3 = [v2 composition];
  char v4 = [v3 hasContent] ^ 1;

  return v4;
}

- (void)audioMessageDidCancelMessage
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    char v5 = "-[AMAudioMessagesControlInterface audioMessageDidCancelMessage]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlInterfaceDelegate);
  [WeakRetained audioMessageDidCancelMessage];
}

- (void)audioMessageDidChangeAudioPowerLevel:(float)a3 duration:(double)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    v10 = "-[AMAudioMessagesControlInterface audioMessageDidChangeAudioPowerLevel:duration:]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlInterfaceDelegate);
  *(float *)&double v8 = a3;
  [WeakRetained audioMessageDidChangeAudioPowerLevel:v8 duration:a4];
}

- (void)audioMessageDidChangeCurrentPlaybackTime:(double)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    int v7 = "-[AMAudioMessagesControlInterface audioMessageDidChangeCurrentPlaybackTime:]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlInterfaceDelegate);
  [WeakRetained audioMessageDidChangeCurrentPlaybackTime:a3];
}

- (void)audioMessageDidEndPlayback
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    char v5 = "-[AMAudioMessagesControlInterface audioMessageDidEndPlayback]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlInterfaceDelegate);
  [WeakRetained audioMessageDidEndPlayback];
}

- (void)audioMessageDidSendMessage
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    char v5 = "-[AMAudioMessagesControlInterface audioMessageDidSendMessage]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlInterfaceDelegate);
  [WeakRetained audioMessageDidSendMessage];
}

- (void)audioMessageDidStartPlayback
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    char v5 = "-[AMAudioMessagesControlInterface audioMessageDidStartPlayback]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlInterfaceDelegate);
  [WeakRetained audioMessageDidStartPlayback];
}

- (void)audioMessageRecordingAvailabilityChanged
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    char v5 = "-[AMAudioMessagesControlInterface audioMessageRecordingAvailabilityChanged]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlInterfaceDelegate);
  [WeakRetained audioMessageRecordingAvailabilityChanged];
}

- (void)audioMessageStartedRecordingFromMessages
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    char v5 = "-[AMAudioMessagesControlInterface audioMessageStartedRecordingFromMessages]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlInterfaceDelegate);
  [WeakRetained audioMessageStartedRecordingFromMessages];
}

- (void)audioMessageStoppedRecordingFromMessages
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    char v5 = "-[AMAudioMessagesControlInterface audioMessageStoppedRecordingFromMessages]";
    _os_log_impl(&def_3AC7C, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlInterfaceDelegate);
  [WeakRetained audioMessageStoppedRecordingFromMessages];
}

- (AMAudioMessagesControlInterfaceDelegate)controlInterfaceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlInterfaceDelegate);

  return (AMAudioMessagesControlInterfaceDelegate *)WeakRetained;
}

- (void)setControlInterfaceDelegate:(id)a3
{
}

- (CKMessageEntryView)currentEntryView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentEntryView);

  return (CKMessageEntryView *)WeakRetained;
}

- (void)setCurrentEntryView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentEntryView);

  objc_destroyWeak((id *)&self->_controlInterfaceDelegate);
}

@end