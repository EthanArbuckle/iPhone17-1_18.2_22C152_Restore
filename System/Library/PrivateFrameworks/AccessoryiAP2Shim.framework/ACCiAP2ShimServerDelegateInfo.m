@interface ACCiAP2ShimServerDelegateInfo
- (ACCiAP2ShimServerDelegate)delegate;
- (ACCiAP2ShimServerDelegateInfo)initWithDelegate:(id)a3;
- (void)dealloc;
@end

@implementation ACCiAP2ShimServerDelegateInfo

- (ACCiAP2ShimServerDelegateInfo)initWithDelegate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACCiAP2ShimServerDelegateInfo;
  v6 = [(ACCiAP2ShimServerDelegateInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delegate, a3);
  }

  return v7;
}

- (void)dealloc
{
  delegate = self->_delegate;
  self->_delegate = 0;

  v4.receiver = self;
  v4.super_class = (Class)ACCiAP2ShimServerDelegateInfo;
  [(ACCiAP2ShimServerDelegateInfo *)&v4 dealloc];
}

- (ACCiAP2ShimServerDelegate)delegate
{
  return (ACCiAP2ShimServerDelegate *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end