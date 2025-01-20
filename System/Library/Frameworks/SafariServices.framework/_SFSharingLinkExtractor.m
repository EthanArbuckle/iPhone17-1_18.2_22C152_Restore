@interface _SFSharingLinkExtractor
- (_SFSharingLinkExtractor)initWithWebView:(id)a3;
- (void)fetchSharingLinkWithCompletionHandler:(id)a3;
@end

@implementation _SFSharingLinkExtractor

- (_SFSharingLinkExtractor)initWithWebView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFSharingLinkExtractor;
  v5 = [(_SFSharingLinkExtractor *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    v7 = v6;
  }

  return v6;
}

- (void)fetchSharingLinkWithCompletionHandler:(id)a3
{
  p_webView = &self->_webView;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_webView);
  id v8 = [WeakRetained _remoteObjectRegistry];

  v6 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC77F40];
  v7 = [v8 remoteObjectProxyWithInterface:v6];
  [v7 fetchSharingLinkWithCompletionHandler:v4];
}

- (void).cxx_destruct
{
}

@end