@interface ASVHitTestStrategy
- (id)decisionForHitTestOfType:(ASVHitTestStrategy *)self atScreenPoint:(SEL)a2 inFrame:(int64_t)a3 withViewportSize:(id)a4 assetPosition:(CGSize)a5 maxDistance:(float)a6;
- (id)decisionForHitTestOfType:(ASVHitTestStrategy *)self atScreenPoint:(SEL)a2 inSession:(int64_t)a3 withViewportSize:(id)a4 assetPosition:(CGSize)a5 maxDistance:(float)a6;
@end

@implementation ASVHitTestStrategy

- (id)decisionForHitTestOfType:(ASVHitTestStrategy *)self atScreenPoint:(SEL)a2 inSession:(int64_t)a3 withViewportSize:(id)a4 assetPosition:(CGSize)a5 maxDistance:(float)a6
{
  return 0;
}

- (id)decisionForHitTestOfType:(ASVHitTestStrategy *)self atScreenPoint:(SEL)a2 inFrame:(int64_t)a3 withViewportSize:(id)a4 assetPosition:(CGSize)a5 maxDistance:(float)a6
{
  return 0;
}

@end