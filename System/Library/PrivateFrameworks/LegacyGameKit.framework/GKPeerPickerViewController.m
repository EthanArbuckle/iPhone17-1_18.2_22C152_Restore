@interface GKPeerPickerViewController
- (BOOL)isVisible;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (GKContentView)btView;
- (GKContentView)connectTypeView;
- (GKContentView)currentView;
- (GKContentView)inviteView;
- (GKContentView)listView;
- (GKContentView)noPeersView;
- (GKContentView)statusView;
- (GKPeerPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (GKSession)currentSession;
- (id)delegate;
- (unint64_t)connectionTypesMask;
- (void)setBtView:(id)a3;
- (void)setConnectTypeView:(id)a3;
- (void)setConnectionTypesMask:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInviteView:(id)a3;
- (void)setListView:(id)a3;
- (void)setNoPeersView:(id)a3;
- (void)setStatusView:(id)a3;
@end

@implementation GKPeerPickerViewController

- (GKPeerPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GKPeerPickerViewController;
  return [(GKPeerPickerViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 0;
}

- (GKSession)currentSession
{
  return 0;
}

- (BOOL)isVisible
{
  return 0;
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (GKContentView)btView
{
  return self->_btView;
}

- (void)setBtView:(id)a3
{
}

- (GKContentView)listView
{
  return self->_listView;
}

- (void)setListView:(id)a3
{
}

- (GKContentView)statusView
{
  return self->_statusView;
}

- (void)setStatusView:(id)a3
{
}

- (GKContentView)inviteView
{
  return self->_inviteView;
}

- (void)setInviteView:(id)a3
{
}

- (GKContentView)connectTypeView
{
  return self->_connectTypeView;
}

- (void)setConnectTypeView:(id)a3
{
}

- (GKContentView)noPeersView
{
  return self->_noPeersView;
}

- (void)setNoPeersView:(id)a3
{
}

- (GKContentView)currentView
{
  return self->_currentView;
}

- (unint64_t)connectionTypesMask
{
  return self->_connectionTypesMask;
}

- (void)setConnectionTypesMask:(unint64_t)a3
{
  self->_connectionTypesMask = a3;
}

- (void).cxx_destruct
{
}

@end