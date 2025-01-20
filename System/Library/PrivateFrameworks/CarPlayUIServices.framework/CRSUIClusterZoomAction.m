@interface CRSUIClusterZoomAction
- (CRSUIClusterZoomAction)initWithZoomDirection:(int64_t)a3;
- (int64_t)zoomDirection;
@end

@implementation CRSUIClusterZoomAction

- (CRSUIClusterZoomAction)initWithZoomDirection:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F29C78]);
  v6 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v6 forSetting:1];

  v9.receiver = self;
  v9.super_class = (Class)CRSUIClusterZoomAction;
  v7 = [(CRSUIClusterZoomAction *)&v9 initWithInfo:v5 timeout:0 forResponseOnQueue:0 withHandler:0.0];

  return v7;
}

- (int64_t)zoomDirection
{
  v2 = [(CRSUIClusterZoomAction *)self info];
  v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

@end