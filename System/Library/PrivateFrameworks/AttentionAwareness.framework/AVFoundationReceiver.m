@interface AVFoundationReceiver
- (AVFoundationReceiving)receiver;
- (BOOL)activateAttentionDetection;
- (BOOL)activateEyeRelief;
- (BOOL)activatePersonDetection;
- (BOOL)running;
- (id)initForReceiver:(id)a3 activateAttentionDetection:(BOOL)a4 activateEyeRelief:(BOOL)a5 activatePersonDetection:(BOOL)a6;
- (void)setActivateAttentionDetection:(BOOL)a3;
- (void)setActivateEyeRelief:(BOOL)a3;
- (void)setActivatePersonDetection:(BOOL)a3;
- (void)setReceiver:(id)a3;
- (void)setRunning:(BOOL)a3;
@end

@implementation AVFoundationReceiver

- (void).cxx_destruct
{
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setActivatePersonDetection:(BOOL)a3
{
  self->_activatePersonDetection = a3;
}

- (BOOL)activatePersonDetection
{
  return self->_activatePersonDetection;
}

- (void)setActivateEyeRelief:(BOOL)a3
{
  self->_activateEyeRelief = a3;
}

- (BOOL)activateEyeRelief
{
  return self->_activateEyeRelief;
}

- (void)setActivateAttentionDetection:(BOOL)a3
{
  self->_activateAttentionDetection = a3;
}

- (BOOL)activateAttentionDetection
{
  return self->_activateAttentionDetection;
}

- (void)setReceiver:(id)a3
{
}

- (AVFoundationReceiving)receiver
{
  return self->_receiver;
}

- (id)initForReceiver:(id)a3 activateAttentionDetection:(BOOL)a4 activateEyeRelief:(BOOL)a5 activatePersonDetection:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AVFoundationReceiver;
  v12 = [(AVFoundationReceiver *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_receiver, a3);
    v13->_activateAttentionDetection = a4;
    v13->_activateEyeRelief = a5;
    v13->_activatePersonDetection = a6;
    v13->_running = 0;
  }

  return v13;
}

@end