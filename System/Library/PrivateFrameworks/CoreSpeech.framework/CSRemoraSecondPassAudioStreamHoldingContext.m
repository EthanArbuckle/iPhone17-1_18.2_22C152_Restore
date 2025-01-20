@interface CSRemoraSecondPassAudioStreamHoldingContext
- (CSAudioProvider)audioProvider;
- (CSAudioStreamHolding)audioStreamHolding;
- (void)setAudioProvider:(id)a3;
- (void)setAudioStreamHolding:(id)a3;
@end

@implementation CSRemoraSecondPassAudioStreamHoldingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioProvider, 0);
  objc_storeStrong((id *)&self->_audioStreamHolding, 0);
}

- (void)setAudioProvider:(id)a3
{
}

- (CSAudioProvider)audioProvider
{
  return self->_audioProvider;
}

- (void)setAudioStreamHolding:(id)a3
{
}

- (CSAudioStreamHolding)audioStreamHolding
{
  return self->_audioStreamHolding;
}

@end