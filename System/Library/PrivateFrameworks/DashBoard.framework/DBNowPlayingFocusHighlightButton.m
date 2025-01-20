@interface DBNowPlayingFocusHighlightButton
- (BOOL)shouldUpdateButtonOpacityForKnobUnfocused;
- (id)colorForKnobFocusLayer;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation DBNowPlayingFocusHighlightButton

- (BOOL)shouldUpdateButtonOpacityForKnobUnfocused
{
  return 0;
}

- (id)colorForKnobFocusLayer
{
  if ([(DBNowPlayingFocusHighlightButton *)self isFocused]) {
    [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] labelColor];
  }
  return v2;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DBNowPlayingFocusHighlightButton;
  id v6 = a3;
  [(DBNowPlayingFocusHighlightButton *)&v9 touchesBegan:v6 withEvent:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = ___DBTouchesContainsTouchType_block_invoke_0;
  v10[3] = &__block_descriptor_40_e21_B24__0__UITouch_8_B16l;
  v10[4] = 0;
  v7 = [v6 objectsPassingTest:v10];

  uint64_t v8 = [v7 count];
  if (v8) {
    [(DBNowPlayingFocusHighlightButton *)self setAlpha:0.5];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DBNowPlayingFocusHighlightButton;
  [(DBNowPlayingFocusHighlightButton *)&v5 touchesEnded:a3 withEvent:a4];
  [(DBNowPlayingFocusHighlightButton *)self setAlpha:1.0];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DBNowPlayingFocusHighlightButton;
  [(DBNowPlayingFocusHighlightButton *)&v5 touchesEnded:a3 withEvent:a4];
  [(DBNowPlayingFocusHighlightButton *)self setAlpha:1.0];
}

@end