@interface WKCompositingLayer
- (id)description;
@end

@implementation WKCompositingLayer

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)WKCompositingLayer;
  v3 = [(WKCompositingLayer *)&v6 description];
  return (id)WebKit::RemoteLayerTreeNode::appendLayerDescription(v3, (NSString *)&self->super.super.isa, v4);
}

@end