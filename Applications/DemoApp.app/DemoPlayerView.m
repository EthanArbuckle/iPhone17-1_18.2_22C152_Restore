@interface DemoPlayerView
+ (Class)layerClass;
- (AVPlayer)player;
- (void)setPlayer:(id)a3;
@end

@implementation DemoPlayerView

+ (Class)layerClass
{
  return (Class)_objc_opt_class(AVPlayerLayer, a2);
}

- (AVPlayer)player
{
  v2 = [(DemoPlayerView *)self layer];
  v3 = [v2 player];

  return (AVPlayer *)v3;
}

- (void)setPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [(DemoPlayerView *)self layer];
  [v5 setPlayer:v4];
}

@end