@interface VMPlayerControlButton
+ (id)buttonWithState:(unint64_t)a3;
- (unint64_t)playerState;
- (void)setPlayerState:(unint64_t)a3;
- (void)setPlayerState:(unint64_t)a3 enabled:(BOOL)a4;
- (void)updateButtonGlyphImage;
@end

@implementation VMPlayerControlButton

+ (id)buttonWithState:(unint64_t)a3
{
  v4 = +[VMPlayerControlButton buttonWithType:1];
  [v4 setBounds:0.0, 0.0, 40.0, 40.0];
  [v4 setPlayerState:a3];
  [v4 setClipsToBounds:1];
  v5 = +[UIColor clearColor];
  [v4 setBackgroundColor:v5];

  [v4 _setTouchInsets:-40.0, -40.0, -40.0, -40.0];
  [v4 updateButtonGlyphImage];

  return v4;
}

- (void)setPlayerState:(unint64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(VMPlayerControlButton *)self playerState] != a3
    || [(VMPlayerControlButton *)self isEnabled] != v4)
  {
    [(VMPlayerControlButton *)self setPlayerState:a3];
    [(VMPlayerControlButton *)self setEnabled:v4];
    [(VMPlayerControlButton *)self updateButtonGlyphImage];
  }
}

- (void)updateButtonGlyphImage
{
  unint64_t v3 = [(VMPlayerControlButton *)self playerState];
  if (v3 == 1)
  {
    uint64_t v4 = +[UIImage voicemailPauseGlyphImage];
    goto LABEL_5;
  }
  if (!v3)
  {
    uint64_t v4 = +[UIImage voicemailPlayGlyphImage];
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:
  id v6 = v5;
  [(VMPlayerControlButton *)self setImage:v5 forState:0];
}

- (unint64_t)playerState
{
  return self->_playerState;
}

- (void)setPlayerState:(unint64_t)a3
{
  self->_playerState = a3;
}

@end