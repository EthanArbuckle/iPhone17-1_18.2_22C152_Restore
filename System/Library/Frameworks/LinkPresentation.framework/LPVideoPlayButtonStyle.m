@interface LPVideoPlayButtonStyle
- (LPSize)backgroundSize;
- (LPSize)size;
- (LPVideoPlayButtonStyle)initWithPlatform:(int64_t)a3;
- (UIColor)color;
- (double)disabledOpacity;
- (void)setBackgroundSize:(id)a3;
- (void)setColor:(id)a3;
- (void)setDisabledOpacity:(double)a3;
- (void)setSize:(id)a3;
@end

@implementation LPVideoPlayButtonStyle

- (LPVideoPlayButtonStyle)initWithPlatform:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)LPVideoPlayButtonStyle;
  v4 = [(LPVideoPlayButtonStyle *)&v15 init];
  if (v4)
  {
    if (a3 == 5)
    {
      v8 = [[LPSize alloc] initWithSquareSize:25.0];
      size = v4->_size;
      v4->_size = v8;

      uint64_t v7 = [MEMORY[0x1E4FB1618] labelColor];
    }
    else
    {
      if (a3 == 3) {
        v5 = [[LPSize alloc] initWithSquareSize:30.0];
      }
      else {
        v5 = [[LPSize alloc] initWithSquareSize:14.0];
      }
      v6 = v4->_size;
      v4->_size = v5;

      uint64_t v7 = [MEMORY[0x1E4FB1618] blackColor];
    }
    color = v4->_color;
    v4->_color = (UIColor *)v7;

    v11 = [[LPSize alloc] initWithSquareSize:48.0];
    backgroundSize = v4->_backgroundSize;
    v4->_backgroundSize = v11;

    v4->_disabledOpacity = 0.2;
    v13 = v4;
  }

  return v4;
}

- (LPSize)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (LPSize)backgroundSize
{
  return self->_backgroundSize;
}

- (void)setBackgroundSize:(id)a3
{
}

- (double)disabledOpacity
{
  return self->_disabledOpacity;
}

- (void)setDisabledOpacity:(double)a3
{
  self->_disabledOpacity = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_backgroundSize, 0);

  objc_storeStrong((id *)&self->_size, 0);
}

@end