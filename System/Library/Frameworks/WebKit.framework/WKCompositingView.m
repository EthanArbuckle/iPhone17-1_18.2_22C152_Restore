@interface WKCompositingView
+ (Class)layerClass;
- (NSString)description;
@end

@implementation WKCompositingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)WKCompositingView;
  v3 = [(WKCompositingView *)&v7 description];
  v4 = (NSString *)[(WKCompositingView *)self layer];
  return (NSString *)WebKit::RemoteLayerTreeNode::appendLayerDescription((WebKit::RemoteLayerTreeNode *)v3, v4, v5);
}

@end