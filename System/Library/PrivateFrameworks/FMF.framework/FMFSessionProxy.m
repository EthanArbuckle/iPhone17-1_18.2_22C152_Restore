@interface FMFSessionProxy
- (FMFSession)session;
- (FMFSessionProxy)initWithFMFSession:(id)a3;
- (void)abDidChange;
- (void)abPreferencesDidChange;
- (void)didAddFollowerHandle:(id)a3;
- (void)didChangeActiveLocationSharingDevice:(id)a3;
- (void)didReceiveFriendshipRequest:(id)a3;
- (void)didReceiveServerError:(id)a3;
- (void)didRemoveFollowerHandle:(id)a3;
- (void)didStartFollowingHandle:(id)a3;
- (void)didStopFollowingHandle:(id)a3;
- (void)didUpdateActiveDeviceList:(id)a3;
- (void)didUpdateFavorites:(id)a3;
- (void)didUpdateFences:(id)a3;
- (void)didUpdateFollowers:(id)a3;
- (void)didUpdateFollowing:(id)a3;
- (void)didUpdateHideFromFollowersStatus:(BOOL)a3;
- (void)didUpdateLocations:(id)a3;
- (void)didUpdatePendingOffersForHandles:(id)a3;
- (void)didUpdatePreferences:(id)a3;
- (void)failedToGetLocationForHandle:(id)a3 error:(id)a4;
- (void)modelDidLoad;
- (void)networkReachabilityUpdated:(BOOL)a3;
- (void)sendMappingPacket:(id)a3 toHandle:(id)a4;
- (void)setLocations:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation FMFSessionProxy

- (void).cxx_destruct
{
}

- (void)didUpdatePreferences:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didUpdatePreferences:v4];
}

- (void)didChangeActiveLocationSharingDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didChangeActiveLocationSharingDevice:v4];
}

- (void)didUpdateFollowers:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didUpdateFollowers:v4];
}

- (void)didUpdateFences:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didUpdateFences:v4];
}

- (void)didUpdateLocations:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didUpdateLocations:v4];
}

- (void)didUpdateFollowing:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didUpdateFollowing:v4];
}

- (FMFSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (FMFSession *)WeakRetained;
}

- (FMFSessionProxy)initWithFMFSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMFSessionProxy;
  id v5 = [(FMFSessionProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    [(FMFSessionProxy *)v5 setSession:v4];
  }

  return v6;
}

- (void)setSession:(id)a3
{
}

- (void)modelDidLoad
{
  id v2 = [(FMFSessionProxy *)self session];
  [v2 modelDidLoad];
}

- (void)networkReachabilityUpdated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FMFSessionProxy *)self session];
  [v4 networkReachabilityUpdated:v3];
}

- (void)setLocations:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 setLocations:v4];
}

- (void)failedToGetLocationForHandle:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FMFSessionProxy *)self session];
  [v8 failedToGetLocationForHandle:v7 error:v6];
}

- (void)didAddFollowerHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didAddFollowerHandle:v4];
}

- (void)didRemoveFollowerHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didRemoveFollowerHandle:v4];
}

- (void)didStartFollowingHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didStartFollowingHandle:v4];
}

- (void)didStopFollowingHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didStopFollowingHandle:v4];
}

- (void)didReceiveFriendshipRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didReceiveFriendshipRequest:v4];
}

- (void)didUpdateHideFromFollowersStatus:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(FMFSessionProxy *)self session];
  [v4 didUpdateHideFromFollowersStatus:v3];
}

- (void)didUpdatePendingOffersForHandles:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didUpdatePendingOffersForHandles:v4];
}

- (void)didUpdateActiveDeviceList:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didUpdateActiveDeviceList:v4];
}

- (void)sendMappingPacket:(id)a3 toHandle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FMFSessionProxy *)self session];
  [v8 sendMappingPacket:v7 toHandle:v6];
}

- (void)didUpdateFavorites:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didUpdateFavorites:v4];
}

- (void)abDidChange
{
  id v2 = [(FMFSessionProxy *)self session];
  [v2 abDidChange];
}

- (void)abPreferencesDidChange
{
  id v2 = [(FMFSessionProxy *)self session];
  [v2 abPreferencesDidChange];
}

- (void)didReceiveServerError:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFSessionProxy *)self session];
  [v5 didReceiveServerError:v4];
}

@end