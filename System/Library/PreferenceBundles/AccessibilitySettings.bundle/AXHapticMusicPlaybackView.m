@interface AXHapticMusicPlaybackView
- (void)didMoveToWindow;
- (void)setLabelText:(id)a3;
@end

@implementation AXHapticMusicPlaybackView

- (void)didMoveToWindow
{
  id v4 = +[UIColor clearColor];
  v3 = [(AXHapticMusicPlaybackView *)self contentView];
  [v3 setBackgroundColor:v4];
}

- (void)setLabelText:(id)a3
{
  id v4 = a3;
  id v5 = [(AXHapticMusicPlaybackView *)self titleLabel];
  [v5 setText:v4];
}

@end