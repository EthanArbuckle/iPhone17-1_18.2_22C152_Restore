@interface DOCRemoteBarButtonTrackingView
- (DOCRemoteBarButtonTrackingView)initWithUUID:(id)a3;
- (NSUUID)uuid;
@end

@implementation DOCRemoteBarButtonTrackingView

- (DOCRemoteBarButtonTrackingView)initWithUUID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DOCRemoteBarButtonTrackingView;
  v6 = [(DOCRemoteBarButtonTrackingView *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uuid, a3);
    [(DOCRemoteBarButtonTrackingView *)v7 setBackgroundColor:0];
    [(DOCRemoteBarButtonTrackingView *)v7 setOpaque:0];
    v8 = v7;
  }

  return v7;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 408, 1);
}

- (void).cxx_destruct
{
}

@end