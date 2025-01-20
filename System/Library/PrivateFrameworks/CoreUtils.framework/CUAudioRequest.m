@interface CUAudioRequest
- (AVAudioPlayer)audioPlayer;
- (NSString)label;
- (id)completion;
- (void)setAudioPlayer:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation CUAudioRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setAudioPlayer:(id)a3
{
}

- (AVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

@end