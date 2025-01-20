@interface WKUIRemoteView
- (NSString)description;
- (WKUIRemoteView)initWithFrame:(CGRect)a3 pid:(int)a4 contextID:(unsigned int)a5;
@end

@implementation WKUIRemoteView

- (WKUIRemoteView)initWithFrame:(CGRect)a3 pid:(int)a4 contextID:(unsigned int)a5
{
  v6.receiver = self;
  v6.super_class = (Class)WKUIRemoteView;
  return -[_UIRemoteView initWithFrame:pid:contextID:](&v6, sel_initWithFrame_pid_contextID_, *(void *)&a4, *(void *)&a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)WKUIRemoteView;
  v3 = [(WKUIRemoteView *)&v7 description];
  v4 = (NSString *)[(WKUIRemoteView *)self layer];
  return (NSString *)WebKit::RemoteLayerTreeNode::appendLayerDescription((WebKit::RemoteLayerTreeNode *)v3, v4, v5);
}

@end