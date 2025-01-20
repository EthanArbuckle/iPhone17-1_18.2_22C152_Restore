@interface AVVoiceTriggerNotificationForwarder
- (VoiceTriggerNotificationInterface)target;
- (void)portStateChangedNotification:(id)a3;
- (void)setTarget:(id)a3;
- (void)siriClientRecordStateChangedNotification:(BOOL)a3 recordingCount:(unint64_t)a4;
- (void)speakerMuteStateChangedNotification:(BOOL)a3;
- (void)speakerStateChangedNotification:(id)a3;
- (void)voiceTriggerNotification:(id)a3;
@end

@implementation AVVoiceTriggerNotificationForwarder

- (void)speakerStateChangedNotification:(id)a3
{
  p_target = &self->_target;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_target);
  [WeakRetained speakerStateChangedNotification:v4];
}

- (void)portStateChangedNotification:(id)a3
{
  p_target = &self->_target;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_target);
  [WeakRetained portStateChangedNotification:v4];
}

- (void).cxx_destruct
{
}

- (void)setTarget:(id)a3
{
}

- (VoiceTriggerNotificationInterface)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (VoiceTriggerNotificationInterface *)WeakRetained;
}

- (void)siriClientRecordStateChangedNotification:(BOOL)a3 recordingCount:(unint64_t)a4
{
  BOOL v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  [WeakRetained siriClientRecordStateChangedNotification:v5 recordingCount:a4];
}

- (void)speakerMuteStateChangedNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  [WeakRetained speakerMuteStateChangedNotification:v3];
}

- (void)voiceTriggerNotification:(id)a3
{
  p_target = &self->_target;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_target);
  [WeakRetained voiceTriggerNotification:v4];
}

@end