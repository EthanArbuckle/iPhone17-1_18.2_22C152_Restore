@interface PHSOSAlertController
+ (void)playSOSEntryHaptic;
- (BOOL)playingWithAudio;
- (TLAlert)alert;
- (TLAlertActivationAssertion)alertActivationAssertion;
- (TLAlertConfiguration)alertConfiguration;
- (void)playAlertWithAudio:(BOOL)a3 alertTopic:(id)a4;
- (void)setAlert:(id)a3;
- (void)setAlertActivationAssertion:(id)a3;
- (void)setAlertConfiguration:(id)a3;
- (void)setPlayingWithAudio:(BOOL)a3;
- (void)stopAlert;
@end

@implementation PHSOSAlertController

+ (void)playSOSEntryHaptic
{
  id v3 = [objc_alloc((Class)TLAlertConfiguration) initWithType:22];
  [v3 setTopic:TLAlertTopicSOSButtonChordingTimeout];
  v2 = +[TLAlert alertWithConfiguration:v3];
  [v2 play];
}

- (void)playAlertWithAudio:(BOOL)a3 alertTopic:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(PHSOSAlertController *)self playingWithAudio] != v4)
  {
    [(PHSOSAlertController *)self setPlayingWithAudio:v4];
    [(PHSOSAlertController *)self stopAlert];
  }
  unsigned int v7 = +[SOSUtilities BOOLOverrideForDefaultsKey:@"debug.countdown.subtle" defaultValue:0];
  char v8 = v7;
  if (v7)
  {
    uint64_t v9 = 22;
    if ([(PHSOSAlertController *)self playingWithAudio] && (id)TLAlertTopicSOSCountdownTick == v6)
    {
      id v10 = TLAlertTopicIncomingCallFaceTimeParticipantJoined;

      uint64_t v9 = 1;
      id v6 = v10;
    }
  }
  else
  {
    uint64_t v9 = 22;
  }
  uint64_t v11 = [(PHSOSAlertController *)self alertConfiguration];
  if (!v11) {
    goto LABEL_10;
  }
  v12 = (void *)v11;
  v13 = [(PHSOSAlertController *)self alertConfiguration];
  id v14 = [v13 topic];

  if (v14 != v6)
  {
LABEL_10:
    id v15 = [objc_alloc((Class)TLAlertConfiguration) initWithType:v9];
    [v15 setTopic:v6];
    if (v6 == (id)TLAlertTopicSOSCountdownTick) {
      [v15 setMaximumDuration:0.850000024];
    }
    if (![(PHSOSAlertController *)self playingWithAudio]) {
      [v15 setToneIdentifier:TLToneIdentifierNone];
    }
    [(PHSOSAlertController *)self setAlertConfiguration:v15];
  }
  v16 = [(PHSOSAlertController *)self alertConfiguration];
  v17 = +[TLAlert alertWithConfiguration:v16];

  [(PHSOSAlertController *)self setAlert:v17];
  id v18 = [(PHSOSAlertController *)self alertActivationAssertion];
  if (!v18 && v6 != (id)TLAlertTopicSOSButtonChordingTimeout)
  {
    if (v8) {
      goto LABEL_20;
    }
    id v18 = [objc_alloc((Class)TLAlertActivationAssertion) initWithAlert:v17];
    [v18 acquire];
    [(PHSOSAlertController *)self setAlertActivationAssertion:v18];
  }

LABEL_20:
  v19 = sub_1000D5130();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [(PHSOSAlertController *)self alertConfiguration];
    int v22 = 138412290;
    v23 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Playing countdown alert sound with alertConfiguration: %@", (uint8_t *)&v22, 0xCu);
  }
  v21 = [(PHSOSAlertController *)self alert];
  [v21 play];
}

- (void)stopAlert
{
  id v3 = [(PHSOSAlertController *)self alert];

  if (v3)
  {
    BOOL v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping countdown alert sound...", buf, 2u);
    }

    v5 = [(PHSOSAlertController *)self alert];
    [v5 stop];
  }
  id v6 = [(PHSOSAlertController *)self alertActivationAssertion];

  if (v6)
  {
    unsigned int v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Relinquishing alert activation assertion...", v10, 2u);
    }

    char v8 = [(PHSOSAlertController *)self alertActivationAssertion];
    [v8 relinquish];

    [(PHSOSAlertController *)self setAlertActivationAssertion:0];
  }
  uint64_t v9 = [(PHSOSAlertController *)self alertConfiguration];

  if (v9) {
    [(PHSOSAlertController *)self setAlertConfiguration:0];
  }
}

- (TLAlertConfiguration)alertConfiguration
{
  return self->_alertConfiguration;
}

- (void)setAlertConfiguration:(id)a3
{
}

- (TLAlertActivationAssertion)alertActivationAssertion
{
  return self->_alertActivationAssertion;
}

- (void)setAlertActivationAssertion:(id)a3
{
}

- (TLAlert)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
}

- (BOOL)playingWithAudio
{
  return self->_playingWithAudio;
}

- (void)setPlayingWithAudio:(BOOL)a3
{
  self->_playingWithAudio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_alertActivationAssertion, 0);

  objc_storeStrong((id *)&self->_alertConfiguration, 0);
}

@end