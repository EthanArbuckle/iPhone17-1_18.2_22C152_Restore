@interface _SFSiriReaderPlaybackPositionAndStateController
- (id)_imageForSiriIsPlaying:(BOOL)a3;
- (void)decrementValue:(id)a3;
- (void)incrementValue:(id)a3;
- (void)prepareStepper:(id)a3;
- (void)resetValue:(id)a3;
@end

@implementation _SFSiriReaderPlaybackPositionAndStateController

- (void)prepareStepper:(id)a3
{
  p_stepper = &self->_stepper;
  id v9 = a3;
  objc_storeWeak((id *)p_stepper, v9);
  v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"gobackward"];
  [v9 setImage:v5 forButton:1];

  v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"goforward"];
  [v9 setImage:v6 forButton:0];

  v7 = [MEMORY[0x1E4F78360] sharedPlaybackController];
  self->_isPlaying = [v7 currentPlaybackState] == 1;

  v8 = [(_SFSiriReaderPlaybackPositionAndStateController *)self _imageForSiriIsPlaying:self->_isPlaying];
  [v9 setImage:v8 forButton:2];

  [v9 setEnabled:1 forButton:2];
  [v9 setEnabled:1 forButton:0];
  [v9 setEnabled:1 forButton:1];
}

- (void)incrementValue:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F78360], "sharedPlaybackController", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 skipForward];
}

- (void)decrementValue:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F78360], "sharedPlaybackController", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 skipBackward];
}

- (void)resetValue:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stepper);
  BOOL isPlaying = self->_isPlaying;
  v5 = [MEMORY[0x1E4F78360] sharedPlaybackController];
  v6 = v5;
  if (isPlaying) {
    [v5 pause];
  }
  else {
    [v5 play];
  }

  BOOL v7 = !self->_isPlaying;
  self->_isPlaying ^= 1u;
  v8 = [(_SFSiriReaderPlaybackPositionAndStateController *)self _imageForSiriIsPlaying:v7];
  [WeakRetained setImage:v8 forButton:2];
}

- (id)_imageForSiriIsPlaying:(BOOL)a3
{
  if (a3) {
    id v3 = @"pause";
  }
  else {
    id v3 = @"play";
  }
  return (id)[MEMORY[0x1E4FB1818] systemImageNamed:v3];
}

- (void).cxx_destruct
{
}

@end