@interface AVVCDuckSettings
- (AVVCDuckFadeDuration)fadeDuration;
- (AVVCDuckLevel)duckLevel;
- (AVVCDuckOverride)duckOverride;
- (AVVCDuckSettings)init;
- (id)description;
- (void)setDuckLevel:(id)a3;
- (void)setDuckOverride:(id)a3;
- (void)setFadeDuration:(id)a3;
@end

@implementation AVVCDuckSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeDuration, 0);
  objc_storeStrong((id *)&self->_duckLevel, 0);

  objc_storeStrong((id *)&self->_duckOverride, 0);
}

- (void)setFadeDuration:(id)a3
{
}

- (AVVCDuckFadeDuration)fadeDuration
{
  return self->_fadeDuration;
}

- (void)setDuckLevel:(id)a3
{
}

- (AVVCDuckLevel)duckLevel
{
  return self->_duckLevel;
}

- (void)setDuckOverride:(id)a3
{
}

- (AVVCDuckOverride)duckOverride
{
  return self->_duckOverride;
}

- (id)description
{
  v2 = [NSString stringWithFormat:@"<duckOverride(%@), duckLevel(%@), fadeDuration(%@)>", self->_duckOverride, self->_duckLevel, self->_fadeDuration];

  return v2;
}

- (AVVCDuckSettings)init
{
  v8.receiver = self;
  v8.super_class = (Class)AVVCDuckSettings;
  v2 = [(AVVCDuckSettings *)&v8 init];
  v3 = v2;
  if (v2)
  {
    duckOverride = v2->_duckOverride;
    v2->_duckOverride = 0;

    duckLevel = v3->_duckLevel;
    v3->_duckLevel = 0;

    fadeDuration = v3->_fadeDuration;
    v3->_fadeDuration = 0;
  }
  return v3;
}

@end