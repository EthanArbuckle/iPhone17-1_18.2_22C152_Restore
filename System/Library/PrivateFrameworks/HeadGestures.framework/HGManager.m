@interface HGManager
- (BOOL)muteAudioFeedback;
- (BOOL)requestPartGestures;
- (HGConfiguration)configuration;
- (HGManager)initWithDelegate:(id)a3 config:(id)a4;
- (HGManagerInternal)internal;
- (void)setConfiguration:(id)a3;
- (void)setMuteAudioFeedback:(BOOL)a3;
- (void)setRequestPartGestures:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)stopWithCompletionHandler:(id)a3;
@end

@implementation HGManager

- (HGManager)initWithDelegate:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HGManager;
  v8 = [(HGManager *)&v17 init];
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      [(HGManager *)v8 setConfiguration:v7];
    }
    else
    {
      v10 = objc_alloc_init(HGConfiguration);
      [(HGManager *)v9 setConfiguration:v10];
    }
    v11 = [HGManagerInternal alloc];
    v12 = [(HGManager *)v9 configuration];
    v13 = [v12 internal];
    uint64_t v14 = [(HGManagerInternal *)v11 initWithDelegate:v6 config:v13];
    internal = v9->_internal;
    v9->_internal = (HGManagerInternal *)v14;
  }
  return v9;
}

- (void)start
{
}

- (void)stop
{
}

- (void)stopWithCompletionHandler:(id)a3
{
}

- (void)setMuteAudioFeedback:(BOOL)a3
{
}

- (void)setRequestPartGestures:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HGManagerInternal *)self->_internal configuration];
  [v4 setRequestPartGestures:v3];
}

- (BOOL)muteAudioFeedback
{
  return self->_muteAudioFeedback;
}

- (BOOL)requestPartGestures
{
  return self->_requestPartGestures;
}

- (HGConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (HGManagerInternal)internal
{
  return (HGManagerInternal *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end