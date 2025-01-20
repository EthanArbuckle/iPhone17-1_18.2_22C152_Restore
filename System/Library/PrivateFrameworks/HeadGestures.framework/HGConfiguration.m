@interface HGConfiguration
- (BOOL)enableRawDataLogging;
- (BOOL)requestPartGestures;
- (BOOL)singleDelivery;
- (HGAudioFeedbackConfiguration)audioFeedbackConfig;
- (HGConfiguration)init;
- (HGConfigurationInternal)internal;
- (HGMLConfiguration)mlConfig;
- (void)setAudioFeedbackConfig:(id)a3;
- (void)setEnableRawDataLogging:(BOOL)a3;
- (void)setInternal:(id)a3;
- (void)setMlConfig:(id)a3;
- (void)setRequestPartGestures:(BOOL)a3;
- (void)setSingleDelivery:(BOOL)a3;
@end

@implementation HGConfiguration

- (HGConfiguration)init
{
  v13.receiver = self;
  v13.super_class = (Class)HGConfiguration;
  v2 = [(HGConfiguration *)&v13 init];
  if (v2)
  {
    v3 = objc_alloc_init(HGAudioFeedbackConfiguration);
    [(HGConfiguration *)v2 setAudioFeedbackConfig:v3];

    v4 = objc_alloc_init(HGMLConfiguration);
    [(HGConfiguration *)v2 setMlConfig:v4];

    v5 = [HGConfigurationInternal alloc];
    v6 = [(HGConfiguration *)v2 mlConfig];
    v7 = [v6 internal];
    v8 = [(HGConfiguration *)v2 audioFeedbackConfig];
    v9 = [v8 internal];
    uint64_t v10 = [(HGConfigurationInternal *)v5 initWithML:v7 audioFeedbackConfig:v9];
    internal = v2->_internal;
    v2->_internal = (HGConfigurationInternal *)v10;
  }
  return v2;
}

- (BOOL)singleDelivery
{
  return [(HGConfigurationInternal *)self->_internal singleDelivery];
}

- (void)setSingleDelivery:(BOOL)a3
{
}

- (BOOL)enableRawDataLogging
{
  return [(HGConfigurationInternal *)self->_internal enableRawDataLogging];
}

- (BOOL)requestPartGestures
{
  return [(HGConfigurationInternal *)self->_internal requestPartGestures];
}

- (void)setRequestPartGestures:(BOOL)a3
{
}

- (void)setEnableRawDataLogging:(BOOL)a3
{
}

- (void)setAudioFeedbackConfig:(id)a3
{
  objc_storeStrong((id *)&self->_audioFeedbackConfig, a3);
  id v5 = a3;
  id v6 = [v5 internal];
  [(HGConfigurationInternal *)self->_internal setAudioFeedbackConfig:v6];
}

- (void)setMlConfig:(id)a3
{
  objc_storeStrong((id *)&self->_mlConfig, a3);
  id v5 = a3;
  id v6 = [v5 internal];
  [(HGConfigurationInternal *)self->_internal setMlConfig:v6];
}

- (HGMLConfiguration)mlConfig
{
  return self->_mlConfig;
}

- (HGAudioFeedbackConfiguration)audioFeedbackConfig
{
  return self->_audioFeedbackConfig;
}

- (HGConfigurationInternal)internal
{
  return self->_internal;
}

- (void)setInternal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_audioFeedbackConfig, 0);
  objc_storeStrong((id *)&self->_mlConfig, 0);
}

@end