@interface ANRemotePlaybackSessionServiceClientInterfaceProxy
- (ANRemotePlaybackSessionServiceClientInterface)delegate;
- (void)didReceiveAnnouncement:(id)a3 forGroupID:(id)a4;
- (void)didUpdateAnnouncements:(id)a3 forGroupID:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ANRemotePlaybackSessionServiceClientInterfaceProxy

- (void)didUpdateAnnouncements:(id)a3 forGroupID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ANRemotePlaybackSessionServiceClientInterfaceProxy *)self delegate];
  [v8 didUpdateAnnouncements:v7 forGroupID:v6];
}

- (void)didReceiveAnnouncement:(id)a3 forGroupID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ANRemotePlaybackSessionServiceClientInterfaceProxy *)self delegate];
  [v8 didReceiveAnnouncement:v7 forGroupID:v6];
}

- (ANRemotePlaybackSessionServiceClientInterface)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ANRemotePlaybackSessionServiceClientInterface *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end