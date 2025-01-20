@interface MPUNowPlayingIndicatorView
- (BOOL)showsLevelGutters;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPUNowPlayingIndicatorView)initWithFrame:(CGRect)a3;
- (UIColor)levelGuttersColor;
- (double)interLevelSpacing;
- (double)levelCornerRadius;
- (double)levelWidth;
- (double)maximumLevelHeight;
- (double)minimumFrameInterval;
- (double)minimumLevelHeight;
- (int64_t)numberOfLevels;
- (int64_t)playbackState;
- (void)_reloadLevelViews;
- (void)_updateLevelAnimations;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setInterLevelSpacing:(double)a3;
- (void)setLevelCornerRadius:(double)a3;
- (void)setLevelGuttersColor:(id)a3;
- (void)setLevelWidth:(double)a3;
- (void)setMaximumLevelHeight:(double)a3;
- (void)setMinimumFrameInterval:(double)a3;
- (void)setMinimumLevelHeight:(double)a3;
- (void)setNumberOfLevels:(int64_t)a3;
- (void)setPlaybackState:(int64_t)a3;
- (void)setShowsLevelGutters:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation MPUNowPlayingIndicatorView

- (MPUNowPlayingIndicatorView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MPUNowPlayingIndicatorView;
  v3 = -[MPUNowPlayingIndicatorView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MPUNowPlayingIndicatorView *)v3 setUserInteractionEnabled:0];
    v5 = [MEMORY[0x263F1C550] clearColor];
    [(MPUNowPlayingIndicatorView *)v4 setBackgroundColor:v5];

    v6 = [MEMORY[0x263F1C920] mainScreen];
    [v6 scale];
    double v8 = v7;

    v4->_interLevelSpacing = 1.0 / v8 + 1.0;
    v4->_levelCornerRadius = 1.0 / v8;
    v4->_levelWidth = 3.0;
    v4->_maximumLevelHeight = 13.0;
    v4->_minimumLevelHeight = 3.0;
    v4->_numberOfLevels = 3;
    v4->_minimumFrameInterval = 0.0;
    [(MPUNowPlayingIndicatorView *)v4 _reloadLevelViews];
  }
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)MPUNowPlayingIndicatorView;
  [(MPUNowPlayingIndicatorView *)&v24 layoutSubviews];
  [(MPUNowPlayingIndicatorView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v11 = self->_levelViews;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v17, "frame", (void)v20);
        double v19 = v18;
        v27.origin.x = v4;
        v27.origin.y = v6;
        v27.size.width = v8;
        v27.size.height = v10;
        objc_msgSend(v17, "setFrame:", (self->_levelWidth + self->_interLevelSpacing) * (double)(v14 + i), CGRectGetMaxY(v27), self->_levelWidth, v19);
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      v14 += i;
    }
    while (v13);
  }
}

- (void)drawRect:(CGRect)a3
{
  if (self->_showsLevelGutters)
  {
    levelGuttersColor = self->_levelGuttersColor;
    if (levelGuttersColor)
    {
      double v5 = levelGuttersColor;
    }
    else
    {
      double v5 = [(MPUNowPlayingIndicatorView *)self tintColor];
    }
    CGFloat v10 = v5;
    [(UIColor *)v5 setFill];
    [(MPUNowPlayingIndicatorView *)self bounds];
    double levelWidth = self->_levelWidth;
    double MaxY = CGRectGetMaxY(v12);
    if (self->_numberOfLevels >= 1)
    {
      CGFloat v8 = MaxY;
      int64_t v9 = 0;
      do
      {
        v13.origin.x = (self->_levelWidth + self->_interLevelSpacing) * (double)v9;
        v13.origin.y = 0.0;
        v13.size.width = levelWidth;
        v13.size.height = v8;
        UIRectFillUsingBlendMode(v13, kCGBlendModeNormal);
        ++v9;
      }
      while (v9 < self->_numberOfLevels);
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int64_t numberOfLevels = self->_numberOfLevels;
  if (numberOfLevels)
  {
    double v4 = self->_interLevelSpacing * (double)(numberOfLevels - 1) + (double)numberOfLevels * self->_levelWidth;
    p_maximumLevelHeight = &self->_maximumLevelHeight;
  }
  else
  {
    p_maximumLevelHeight = (double *)(MEMORY[0x263F001B0] + 8);
    double v4 = *MEMORY[0x263F001B0];
  }
  double v6 = *p_maximumLevelHeight;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)tintColorDidChange
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)MPUNowPlayingIndicatorView;
  [(MPUNowPlayingIndicatorView *)&v15 tintColorDidChange];
  if (self->_showsLevelGutters) {
    [(MPUNowPlayingIndicatorView *)self setNeedsDisplay];
  }
  levelGuttersColor = self->_levelGuttersColor;
  if (levelGuttersColor)
  {
    double v4 = levelGuttersColor;
  }
  else
  {
    double v4 = [(MPUNowPlayingIndicatorView *)self tintColor];
  }
  double v5 = v4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v6 = self->_levelViews;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "setBackgroundColor:", v5, (void)v11);
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)setLevelCornerRadius:(double)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_levelCornerRadius != a3)
  {
    self->_levelCornerRadius = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v4 = self->_levelViews;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "layer", (void)v10);
          [v9 setCornerRadius:self->_levelCornerRadius];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setLevelWidth:(double)a3
{
  if (self->_levelWidth != a3)
  {
    self->_double levelWidth = a3;
    [(MPUNowPlayingIndicatorView *)self setNeedsLayout];
  }
}

- (void)setMaximumLevelHeight:(double)a3
{
  if (self->_maximumLevelHeight != a3)
  {
    self->_maximumLevelHeight = a3;
    [(MPUNowPlayingIndicatorView *)self _updateLevelAnimations];
  }
}

- (void)setMinimumLevelHeight:(double)a3
{
  if (self->_minimumLevelHeight != a3)
  {
    self->_minimumLevelHeight = a3;
    [(MPUNowPlayingIndicatorView *)self _updateLevelAnimations];
  }
}

- (void)setNumberOfLevels:(int64_t)a3
{
  if (self->_numberOfLevels != a3)
  {
    self->_int64_t numberOfLevels = a3;
    [(MPUNowPlayingIndicatorView *)self _reloadLevelViews];
  }
}

- (void)setPlaybackState:(int64_t)a3
{
  if (self->_playbackState != a3)
  {
    self->_playbackState = a3;
    [(MPUNowPlayingIndicatorView *)self _updateLevelAnimations];
  }
}

- (void)setShowsLevelGutters:(BOOL)a3
{
  if (self->_showsLevelGutters != a3)
  {
    self->_showsLevelGutters = a3;
    [(MPUNowPlayingIndicatorView *)self setNeedsDisplay];
  }
}

- (void)setLevelGuttersColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  p_levelGuttersColor = &self->_levelGuttersColor;
  if (self->_levelGuttersColor != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_levelGuttersColor, a3);
    p_levelGuttersColor = (UIColor **)[(MPUNowPlayingIndicatorView *)self _reloadLevelViews];
    uint64_t v5 = v7;
  }

  MEMORY[0x270F9A758](p_levelGuttersColor, v5);
}

- (void)_reloadLevelViews
{
  if (self->_numberOfLevels < 1)
  {
    unint64_t v3 = 0;
  }
  else
  {
    unint64_t v3 = 0;
    double v4 = *MEMORY[0x263F001A8];
    double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
    do
    {
      if (v3 >= [(NSMutableArray *)self->_levelViews count]
        || ([(NSMutableArray *)self->_levelViews objectAtIndex:v3],
            (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v4, v5, v6, v7);
        uint64_t v9 = [v8 layer];
        [v9 setCornerRadius:self->_levelCornerRadius];
        objc_msgSend(v9, "setAnchorPoint:", 0.5, 1.0);
        levelViews = self->_levelViews;
        if (!levelViews)
        {
          long long v11 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_numberOfLevels];
          long long v12 = self->_levelViews;
          self->_levelViews = v11;

          levelViews = self->_levelViews;
        }
        [(NSMutableArray *)levelViews addObject:v8];
        [(MPUNowPlayingIndicatorView *)self addSubview:v8];
      }
      levelGuttersColor = self->_levelGuttersColor;
      if (levelGuttersColor)
      {
        long long v14 = levelGuttersColor;
      }
      else
      {
        long long v14 = [(MPUNowPlayingIndicatorView *)self tintColor];
      }
      uint64_t v15 = v14;
      [v8 setBackgroundColor:v14];

      ++v3;
    }
    while ((int64_t)v3 < self->_numberOfLevels);
  }
  while (v3 < [(NSMutableArray *)self->_levelViews count])
  {
    v16 = [(NSMutableArray *)self->_levelViews objectAtIndex:v3];
    [v16 removeFromSuperview];
    [(NSMutableArray *)self->_levelViews removeObjectAtIndex:v3];
  }
  [(MPUNowPlayingIndicatorView *)self _updateLevelAnimations];

  [(MPUNowPlayingIndicatorView *)self setNeedsLayout];
}

- (void)_updateLevelAnimations
{
  v2 = self;
  uint64_t v51 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(MPUNowPlayingIndicatorView *)self window];
  double v4 = [v3 screen];
  double v5 = v4;
  if (v4)
  {
    [v4 _refreshRate];
    double v7 = v6;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F1C920] mainScreen];
    [v8 _refreshRate];
    double v7 = v9;
  }
  [(MPUNowPlayingIndicatorView *)v2 minimumFrameInterval];
  if (v10 == 0.0) {
    double v11 = 0.0166666667;
  }
  else {
    [(MPUNowPlayingIndicatorView *)v2 minimumFrameInterval];
  }
  if (v7 < v11) {
    double v7 = v11;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obj = v2->_levelViews;
  uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v46;
    uint64_t v44 = *MEMORY[0x263F15EB8];
    uint64_t v43 = *MEMORY[0x263F15AA8];
    uint64_t v41 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = [*(id *)(*((void *)&v45 + 1) + 8 * i) layer];
        int64_t playbackState = v2->_playbackState;
        if (playbackState == 2)
        {
          double v18 = [MEMORY[0x263F15760] animationWithKeyPath:@"bounds.size.height"];
          [v18 setDuration:0.45];
          v35 = [MEMORY[0x263F15808] functionWithName:v44];
          [v18 setTimingFunction:v35];

          [v18 setRemovedOnCompletion:0];
          [v18 setFillMode:v43];
          v36 = NSNumber;
          v37 = [v16 presentationLayer];
          v38 = v37;
          if (!v37) {
            v37 = v16;
          }
          [v37 bounds];
          v39 = [v36 numberWithDouble:CGRectGetHeight(v53)];
          [v18 setFromValue:v39];

          v40 = [NSNumber numberWithDouble:v2->_minimumLevelHeight];
          [v18 setToValue:v40];
        }
        else if (playbackState == 1)
        {
          double v18 = [MEMORY[0x263F157D8] animationWithKeyPath:@"bounds.size.height"];
          objc_super v24 = [MEMORY[0x263F15808] functionWithName:v44];
          [v18 setTimingFunction:v24];

          [v18 setRemovedOnCompletion:0];
          [v18 setFillMode:v43];
          uint32_t v25 = arc4random();
          double maximumLevelHeight = v2->_maximumLevelHeight;
          double v27 = maximumLevelHeight * 0.5 + (double)(v25 % 0xB) / 10.0 * (maximumLevelHeight * 0.5);
          [v18 setDuration:maximumLevelHeight / v27 * 0.65];
          v28 = [NSNumber numberWithDouble:v2->_minimumLevelHeight];
          v49[0] = v28;
          v29 = [NSNumber numberWithDouble:v27];
          v49[1] = v29;
          [NSNumber numberWithDouble:v2->_minimumLevelHeight];
          uint64_t v30 = v13;
          v32 = v31 = v2;
          v49[2] = v32;
          v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:3];
          [v18 setValues:v33];

          uint64_t v14 = v41;
          v2 = v31;
          uint64_t v13 = v30;

          LODWORD(v34) = 2139095040;
          [v18 setRepeatCount:v34];
        }
        else
        {
          if (playbackState) {
            goto LABEL_25;
          }
          double v18 = [MEMORY[0x263F15760] animationWithKeyPath:@"bounds.size.height"];
          [v18 setDuration:0.45];
          double v19 = [MEMORY[0x263F15808] functionWithName:v44];
          [v18 setTimingFunction:v19];

          [v18 setRemovedOnCompletion:0];
          [v18 setFillMode:v43];
          long long v20 = NSNumber;
          long long v21 = [v16 presentationLayer];
          long long v22 = v21;
          if (!v21) {
            long long v21 = v16;
          }
          [v21 bounds];
          long long v23 = [v20 numberWithDouble:CGRectGetHeight(v52)];
          [v18 setFromValue:v23];

          [v18 setToValue:&unk_26DAC2998];
        }
        [v18 setFrameInterval:v7];
        [v16 addAnimation:v18 forKey:@"nowPlayingIndicatorAnimation"];

LABEL_25:
      }
      uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v13);
  }
}

- (double)interLevelSpacing
{
  return self->_interLevelSpacing;
}

- (void)setInterLevelSpacing:(double)a3
{
  self->_interLevelSpacing = a3;
}

- (double)levelCornerRadius
{
  return self->_levelCornerRadius;
}

- (double)levelWidth
{
  return self->_levelWidth;
}

- (double)maximumLevelHeight
{
  return self->_maximumLevelHeight;
}

- (double)minimumLevelHeight
{
  return self->_minimumLevelHeight;
}

- (int64_t)numberOfLevels
{
  return self->_numberOfLevels;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (BOOL)showsLevelGutters
{
  return self->_showsLevelGutters;
}

- (UIColor)levelGuttersColor
{
  return self->_levelGuttersColor;
}

- (double)minimumFrameInterval
{
  return self->_minimumFrameInterval;
}

- (void)setMinimumFrameInterval:(double)a3
{
  self->_minimumFrameInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_levelGuttersColor, 0);

  objc_storeStrong((id *)&self->_levelViews, 0);
}

@end