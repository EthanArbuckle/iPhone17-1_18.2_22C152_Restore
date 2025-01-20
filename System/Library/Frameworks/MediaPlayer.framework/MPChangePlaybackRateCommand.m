@interface MPChangePlaybackRateCommand
- (NSArray)supportedPlaybackRates;
- (float)preferredRate;
- (id)_mediaRemoteCommandInfoOptions;
- (id)newCommandEventWithPlaybackRate:(float)a3;
- (void)setPreferredRate:(float)a3;
- (void)setSupportedPlaybackRates:(NSArray *)supportedPlaybackRates;
@end

@implementation MPChangePlaybackRateCommand

- (id)_mediaRemoteCommandInfoOptions
{
  if (self->_supportedPlaybackRates)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    [v3 setObject:self->_supportedPlaybackRates forKeyedSubscript:*MEMORY[0x1E4F77320]];
    if (fabsf(self->_preferredRate) > 0.00000011921)
    {
      v4 = objc_msgSend(NSNumber, "numberWithFloat:");
      [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F772A8]];
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setPreferredRate:(float)a3
{
  if (vabds_f32(self->_preferredRate, a3) > 0.00000011921)
  {
    self->_preferredRate = a3;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)setSupportedPlaybackRates:(NSArray *)supportedPlaybackRates
{
  v6 = supportedPlaybackRates;
  if (!-[NSArray isEqualToArray:](self->_supportedPlaybackRates, "isEqualToArray:"))
  {
    v4 = (NSArray *)[(NSArray *)v6 copy];
    v5 = self->_supportedPlaybackRates;
    self->_supportedPlaybackRates = v4;

    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void).cxx_destruct
{
}

- (NSArray)supportedPlaybackRates
{
  return self->_supportedPlaybackRates;
}

- (id)newCommandEventWithPlaybackRate:(float)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MPRemoteCommand *)self mediaRemoteCommandType];
  uint64_t v11 = *MEMORY[0x1E4F776F8];
  *(float *)&double v6 = a3;
  v7 = [NSNumber numberWithFloat:v6];
  v12[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [(MPRemoteCommand *)self newCommandEventWithCommandType:v5 options:v8];

  return v9;
}

- (float)preferredRate
{
  return self->_preferredRate;
}

@end