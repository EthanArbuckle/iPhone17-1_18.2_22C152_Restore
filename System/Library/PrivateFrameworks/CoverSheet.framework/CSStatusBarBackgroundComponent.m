@interface CSStatusBarBackgroundComponent
- (CSStatusBarBackgroundComponent)init;
- (id)showBackgroundWhileTransitioning:(int64_t)a3;
- (void)setShowBackgroundWhileTransitioning:(int64_t)a3;
@end

@implementation CSStatusBarBackgroundComponent

- (CSStatusBarBackgroundComponent)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSStatusBarBackgroundComponent;
  v2 = [(CSComponent *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CSComponent *)v2 setType:8];
    [(CSStatusBarBackgroundComponent *)v3 setShowBackgroundWhileTransitioning:0x7FFFFFFFFFFFFFFFLL];
  }
  return v3;
}

- (id)showBackgroundWhileTransitioning:(int64_t)a3
{
  return self;
}

- (void)setShowBackgroundWhileTransitioning:(int64_t)a3
{
  if ([(CSComponent *)self flag] != a3)
  {
    [(CSComponent *)self setFlag:a3];
  }
}

@end