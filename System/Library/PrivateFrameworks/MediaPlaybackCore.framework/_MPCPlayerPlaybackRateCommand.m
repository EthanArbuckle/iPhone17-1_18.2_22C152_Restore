@interface _MPCPlayerPlaybackRateCommand
- (NSArray)supportedPlaybackRates;
- (float)preferredPlaybackRate;
- (id)setPlaybackRate:(float)a3;
- (void)setPreferredPlaybackRate:(float)a3;
- (void)setSupportedPlaybackRates:(id)a3;
@end

@implementation _MPCPlayerPlaybackRateCommand

- (void).cxx_destruct
{
}

- (void)setPreferredPlaybackRate:(float)a3
{
  self->_preferredPlaybackRate = a3;
}

- (float)preferredPlaybackRate
{
  return self->_preferredPlaybackRate;
}

- (void)setSupportedPlaybackRates:(id)a3
{
}

- (NSArray)supportedPlaybackRates
{
  return self->_supportedPlaybackRates;
}

- (id)setPlaybackRate:(float)a3
{
  v4 = objc_msgSend(NSNumber, "numberWithFloat:");
  v5 = [(_MPCPlayerCommand *)self response];
  v6 = [v5 request];
  if ([v6 disablePlaybackRateValidation])
  {
  }
  else
  {
    v7 = [(_MPCPlayerPlaybackRateCommand *)self supportedPlaybackRates];
    int v8 = [v7 containsObject:v4];

    if (!v8)
    {
      v18 = 0;
      goto LABEL_8;
    }
  }
  v9 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  [v9 setObject:v4 forKeyedSubscript:*MEMORY[0x263F54D20]];
  v10 = [(_MPCPlayerItemCommand *)self contentItemID];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    v12 = [(_MPCPlayerItemCommand *)self contentItemID];
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x263F54CF8]];
  }
  v13 = [(_MPCPlayerCommand *)self response];
  v14 = [MPCPlayerCommandRequest alloc];
  v15 = [v13 controller];
  v16 = [v13 request];
  v17 = [v16 label];
  v18 = [(MPCPlayerCommandRequest *)v14 initWithMediaRemoteCommand:19 options:v9 controller:v15 label:v17];

LABEL_8:

  return v18;
}

@end