@interface SRUserAttentionSignalProviderFactory
+ (id)_attentionAwarenessConfigurationWithIdentifier:(id)a3 eventMask:(unint64_t)a4 samplingInterval:(double)a5 attentionLossTimeout:(double)a6;
- (SRUserAttentionSignalProviderFactory)initWithSamplingInterval:(double)a3 attentionLossTimeout:(double)a4 supportedAttentionAwarenessEvents:(unint64_t)a5;
- (id)buttonPressAwarenessClient;
- (id)faceAttentionAwarenessClient;
- (id)touchAttentionAwarenessClient;
- (id)wakeGestureManager;
- (unint64_t)_buttonPressAwarenessClientEventMask;
- (unint64_t)_faceAttentionAwarenessEventMask;
- (unint64_t)_touchAttentionAwarenessEventMask;
@end

@implementation SRUserAttentionSignalProviderFactory

- (SRUserAttentionSignalProviderFactory)initWithSamplingInterval:(double)a3 attentionLossTimeout:(double)a4 supportedAttentionAwarenessEvents:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SRUserAttentionSignalProviderFactory;
  result = [(SRUserAttentionSignalProviderFactory *)&v9 init];
  if (result)
  {
    result->_samplingInterval = a3;
    result->_attentionLossTimeout = a4;
    result->_supportedAttentionAwarenessEvents = a5;
  }
  return result;
}

- (id)faceAttentionAwarenessClient
{
  id v3 = objc_alloc_init((Class)AWAttentionAwarenessClient);
  v4 = [_attentionAwarenessConfigurationWithIdentifier:@"com.apple.siri.AttentionAwareness.Face" eventMask:[self _faceAttentionAwarenessEventMask] samplingInterval:self->_samplingInterval attentionLossTimeout:self->_attentionLossTimeout];
  [v3 setConfiguration:v4 shouldReset:1];

  return v3;
}

- (id)touchAttentionAwarenessClient
{
  id v3 = objc_alloc_init((Class)AWAttentionAwarenessClient);
  v4 = [objc_opt_class() _attentionAwarenessConfigurationWithIdentifier:@"com.apple.siri.AttentionAwareness.Touch" eventMask:[self _touchAttentionAwarenessEventMask] samplingInterval:0.1 attentionLossTimeout:0.1];
  [v3 setConfiguration:v4 shouldReset:1];

  return v3;
}

- (id)buttonPressAwarenessClient
{
  id v3 = objc_alloc_init((Class)AWAttentionAwarenessClient);
  v4 = [objc_opt_class() _attentionAwarenessConfigurationWithIdentifier:@"com.apple.siri.AttentionAwareness.ButtonPress" eventMask:[self _buttonPressAwarenessClientEventMask] samplingInterval:0.1 attentionLossTimeout:0.1];
  [v3 setConfiguration:v4 shouldReset:1];

  return v3;
}

- (id)wakeGestureManager
{
  return +[CMWakeGestureManager sharedManager];
}

- (unint64_t)_faceAttentionAwarenessEventMask
{
  return self->_supportedAttentionAwarenessEvents & 0x81;
}

- (unint64_t)_touchAttentionAwarenessEventMask
{
  return self->_supportedAttentionAwarenessEvents & 0x209;
}

- (unint64_t)_buttonPressAwarenessClientEventMask
{
  return self->_supportedAttentionAwarenessEvents & 3;
}

+ (id)_attentionAwarenessConfigurationWithIdentifier:(id)a3 eventMask:(unint64_t)a4 samplingInterval:(double)a5 attentionLossTimeout:(double)a6
{
  id v9 = a3;
  id v10 = objc_alloc_init((Class)AWAttentionAwarenessConfiguration);
  [v10 setIdentifier:v9];

  [v10 setEventMask:a4];
  [v10 setSamplingInterval:a5];
  [v10 setAttentionLostTimeout:a6];

  return v10;
}

@end