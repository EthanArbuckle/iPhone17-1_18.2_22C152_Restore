@interface ANLocalPlaybackSessionInterfaceDelegateProxy
- (ANLocalPlaybackSessionServiceInterfaceDelegate)delegate;
- (void)announcementsStateUpdate:(unint64_t)a3;
- (void)announcementsWillStartPlaying:(unint64_t)a3;
- (void)didReceiveAnnouncement:(id)a3 forGroupID:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ANLocalPlaybackSessionInterfaceDelegateProxy

- (void)announcementsWillStartPlaying:(unint64_t)a3
{
  id v4 = [(ANLocalPlaybackSessionInterfaceDelegateProxy *)self delegate];
  [v4 announcementsWillStartPlaying:a3];
}

- (void)announcementsStateUpdate:(unint64_t)a3
{
  id v4 = [(ANLocalPlaybackSessionInterfaceDelegateProxy *)self delegate];
  [v4 announcementsStateUpdate:a3];
}

- (void)didReceiveAnnouncement:(id)a3 forGroupID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ANLocalPlaybackSessionInterfaceDelegateProxy *)self delegate];
  [v8 didReceiveAnnouncement:v7 forGroupID:v6];
}

- (ANLocalPlaybackSessionServiceInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ANLocalPlaybackSessionServiceInterfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end