@interface WKVideoView
+ (Class)layerClass;
- (CALayer)playerLayer;
- (WKVideoView)initWithFrame:(CGRect)a3 playerView:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation WKVideoView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (WKVideoView)initWithFrame:(CGRect)a3 playerView:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WKVideoView;
  v5 = -[WKVideoView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_playerView = (WebAVPlayerLayerView *)a4;
    [(WKVideoView *)v5 addSubview:a4];
  }
  return v6;
}

- (CALayer)playerLayer
{
  return (CALayer *)[(WebAVPlayerLayerView *)self->_playerView layer];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  if (-[WKVideoView pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y)) {
    return self;
  }
  else {
    return 0;
  }
}

- (void)layoutSubviews
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = (void *)[(WKVideoView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        [(WKVideoView *)self bounds];
        objc_msgSend(v8, "setFrame:");
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

@end