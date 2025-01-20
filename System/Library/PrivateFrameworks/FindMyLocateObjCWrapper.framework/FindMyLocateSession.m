@interface FindMyLocateSession
+ (BOOL)FMFAllowed;
+ (BOOL)FMFRestricted;
- (FindMyLocateSession)init;
- (_TtC23FindMyLocateObjCWrapper13ObjCBootstrap)trampoline;
- (id)cachedFriendsFollowingMyLocation;
- (id)cachedFriendsSharingLocationsWithMe;
- (id)cachedLocationForHandle:(id)a3;
- (id)cachedLocationForHandle:(id)a3 includeAddress:(BOOL)a4;
- (id)cachedOfferExpirationForHandle:(id)a3 groupId:(id)a4;
- (id)friendshipUpdateCallback;
- (id)locationUpdateCallback;
- (id)meDeviceUpdateCallback;
- (int64_t)cachedCanShareLocationWithHandle:(id)a3 isFromGroup:(BOOL)a4;
- (void)canShareLocationWithHandle:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5;
- (void)friendshipStateWithHandle:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5;
- (void)getActiveLocationSharingDeviceWithCompletion:(id)a3;
- (void)getFriendsFollowingMyLocationWithCompletion:(id)a3;
- (void)getFriendsSharingLocationsWithMeWithCompletion:(id)a3;
- (void)getOfferExpirationForHandle:(id)a3 groupId:(id)a4 completion:(id)a5;
- (void)sendFriendshipInviteToHandle:(id)a3 from:(id)a4 isFromGroup:(BOOL)a5 completion:(id)a6;
- (void)sendFriendshipInviteToHandle:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5;
- (void)sendFriendshipOfferToHandles:(id)a3 expiration:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6;
- (void)sendFriendshipOfferToHandles:(id)a3 from:(id)a4 expiration:(int64_t)a5 isFromGroup:(BOOL)a6 completion:(id)a7;
- (void)setActiveLocationSharingDevice:(id)a3 completion:(id)a4;
- (void)setFriendshipUpdateCallback:(id)a3;
- (void)setLocationUpdateCallback:(id)a3;
- (void)setMeDeviceUpdateCallback:(id)a3;
- (void)setTrampoline:(id)a3;
- (void)startMonitoringActiveLocationSharingDeviceChangeWithCompletion:(id)a3;
- (void)startRefreshingLocationForHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6;
- (void)startRefreshingLocationForHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 reverseGeocode:(BOOL)a6 completion:(id)a7;
- (void)startUpdatingFriendsWithInitialUpdates:(BOOL)a3 completion:(id)a4;
- (void)stopRefreshingLocationForHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6;
- (void)stopRefreshingLocationWithCompletion:(id)a3;
- (void)stopSharingLocationWith:(id)a3 from:(id)a4 isFromGroup:(BOOL)a5 completion:(id)a6;
- (void)stopSharingLocationWith:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5;
- (void)stopUpdatingFriendsWithCompletion:(id)a3;
@end

@implementation FindMyLocateSession

- (FindMyLocateSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)FindMyLocateSession;
  v2 = [(FindMyLocateSession *)&v5 init];
  v3 = objc_alloc_init(_TtC23FindMyLocateObjCWrapper13ObjCBootstrap);
  [(FindMyLocateSession *)v2 setTrampoline:v3];

  return v2;
}

- (void)setLocationUpdateCallback:(id)a3
{
  id v4 = a3;
  id v5 = [(FindMyLocateSession *)self trampoline];
  [v5 setLocationUpdateCallback:v4];
}

- (id)locationUpdateCallback
{
  v2 = [(FindMyLocateSession *)self trampoline];
  v3 = [v2 locationUpdateCallback];

  return v3;
}

- (void)setFriendshipUpdateCallback:(id)a3
{
  id v4 = a3;
  id v5 = [(FindMyLocateSession *)self trampoline];
  [v5 setFriendshipUpdateCallback:v4];
}

- (id)friendshipUpdateCallback
{
  v2 = [(FindMyLocateSession *)self trampoline];
  v3 = [v2 friendshipUpdateCallback];

  return v3;
}

- (void)setMeDeviceUpdateCallback:(id)a3
{
  id v4 = a3;
  id v5 = [(FindMyLocateSession *)self trampoline];
  [v5 setMeDeviceUpdateCallback:v4];
}

- (id)meDeviceUpdateCallback
{
  v2 = [(FindMyLocateSession *)self trampoline];
  v3 = [v2 meDeviceUpdateCallback];

  return v3;
}

- (void)sendFriendshipOfferToHandles:(id)a3 expiration:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(FindMyLocateSession *)self trampoline];
  [v12 sendFriendshipOfferTo:v11 from:0 end:a4 isFromGroup:v6 completionHandler:v10];
}

- (void)sendFriendshipOfferToHandles:(id)a3 from:(id)a4 expiration:(int64_t)a5 isFromGroup:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(FindMyLocateSession *)self trampoline];
  [v15 sendFriendshipOfferTo:v14 from:v13 end:a5 isFromGroup:v7 completionHandler:v12];
}

- (void)sendFriendshipInviteToHandle:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(FindMyLocateSession *)self trampoline];
  [v10 sendFriendshipInviteTo:v9 from:0 isFromGroup:v5 completionHandler:v8];
}

- (void)sendFriendshipInviteToHandle:(id)a3 from:(id)a4 isFromGroup:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(FindMyLocateSession *)self trampoline];
  [v13 sendFriendshipInviteTo:v12 from:v11 isFromGroup:v6 completionHandler:v10];
}

- (void)stopSharingLocationWith:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(FindMyLocateSession *)self trampoline];
  [v10 stopSharingLocationWith:v9 from:0 isFromGroup:v5 completionHandler:v8];
}

- (void)stopSharingLocationWith:(id)a3 from:(id)a4 isFromGroup:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(FindMyLocateSession *)self trampoline];
  [v13 stopSharingLocationWith:v12 from:v11 isFromGroup:v6 completionHandler:v10];
}

- (void)startRefreshingLocationForHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(FindMyLocateSession *)self trampoline];
  [v12 startRefreshingLocationFor:v11 priority:a4 isFromGroup:v6 reverseGeocode:1 completionHandler:v10];
}

- (void)startRefreshingLocationForHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 reverseGeocode:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a3;
  id v14 = [(FindMyLocateSession *)self trampoline];
  [v14 startRefreshingLocationFor:v13 priority:a4 isFromGroup:v8 reverseGeocode:v7 completionHandler:v12];
}

- (void)stopRefreshingLocationForHandles:(id)a3 priority:(int64_t)a4 isFromGroup:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(FindMyLocateSession *)self trampoline];
  [v12 stopRefreshingLocationFor:v11 priority:a4 isFromGroup:v6 completionHandler:v10];
}

- (void)stopRefreshingLocationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FindMyLocateSession *)self trampoline];
  [v5 stopRefreshingLocationWithCompletionHandler:v4];
}

- (void)startUpdatingFriendsWithInitialUpdates:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(FindMyLocateSession *)self trampoline];
  [v7 startUpdatingFriendsWithInitialUpdates:v4 completionHandler:v6];
}

- (void)stopUpdatingFriendsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FindMyLocateSession *)self trampoline];
  [v5 stopUpdatingFriendsWithCompletionHandler:v4];
}

- (void)startMonitoringActiveLocationSharingDeviceChangeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FindMyLocateSession *)self trampoline];
  [v5 startMonitoringActiveLocationSharingDeviceWithCompletionHandler:v4];
}

- (void)setActiveLocationSharingDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FindMyLocateSession *)self trampoline];
  [v8 setActiveLocationSharingDevice:v7 completionHandler:v6];
}

- (void)getActiveLocationSharingDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FindMyLocateSession *)self trampoline];
  [v5 getActiveLocationSharingDeviceWithCompletionHandler:v4];
}

- (void)getFriendsSharingLocationsWithMeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FindMyLocateSession *)self trampoline];
  [v5 getFriendsWith:1 completionHandler:v4];
}

- (void)getFriendsFollowingMyLocationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FindMyLocateSession *)self trampoline];
  [v5 getFriendsWith:0 completionHandler:v4];
}

- (void)canShareLocationWithHandle:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(FindMyLocateSession *)self trampoline];
  [v10 canShareLocationWithHandle:v9 isFromGroup:v5 completionHandler:v8];
}

- (void)friendshipStateWithHandle:(id)a3 isFromGroup:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(FindMyLocateSession *)self trampoline];
  [v10 friendshipStateWithHandle:v9 isFromGroup:v5 completionHandler:v8];
}

- (void)getOfferExpirationForHandle:(id)a3 groupId:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(FindMyLocateSession *)self trampoline];
  [v11 getOfferExpirationForHandle:v10 groupId:v9 completionHandler:v8];
}

+ (BOOL)FMFAllowed
{
  if (([(id)FMFAllowed_fmfAllowedNumber BOOLValue] & 1) == 0)
  {
    v2 = (void *)MGCopyAnswer();
    objc_storeStrong((id *)&FMFAllowed_fmfAllowedNumber, v2);
    if (v2) {
      CFRelease(v2);
    }
  }
  v3 = (void *)FMFAllowed_fmfAllowedNumber;

  return [v3 BOOLValue];
}

+ (BOOL)FMFRestricted
{
  uint64_t v2 = *MEMORY[0x263F538D0];
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  LOBYTE(v2) = [v3 effectiveBoolValueForSetting:v2] == 2;

  return v2;
}

- (id)cachedFriendsFollowingMyLocation
{
  uint64_t v2 = [(FindMyLocateSession *)self trampoline];
  v3 = [v2 cachedFriendsFollowingMyLocation];

  return v3;
}

- (id)cachedFriendsSharingLocationsWithMe
{
  uint64_t v2 = [(FindMyLocateSession *)self trampoline];
  v3 = [v2 cachedFriendsSharingLocationWithMe];

  return v3;
}

- (id)cachedLocationForHandle:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(FindMyLocateSession *)self trampoline];
  id v6 = [v5 cachedLocationFor:v4 includeAddress:1];

  return v6;
}

- (id)cachedLocationForHandle:(id)a3 includeAddress:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(FindMyLocateSession *)self trampoline];
  id v8 = [v7 cachedLocationFor:v6 includeAddress:v4];

  return v8;
}

- (id)cachedOfferExpirationForHandle:(id)a3 groupId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FindMyLocateSession *)self trampoline];
  id v9 = [v8 cachedOfferExpirationFor:v7 groupId:v6];

  return v9;
}

- (int64_t)cachedCanShareLocationWithHandle:(id)a3 isFromGroup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(FindMyLocateSession *)self trampoline];
  int64_t v8 = [v7 cachedCanShareLocationWithHandle:v6 isFromGroup:v4];

  return v8;
}

- (_TtC23FindMyLocateObjCWrapper13ObjCBootstrap)trampoline
{
  return self->_trampoline;
}

- (void)setTrampoline:(id)a3
{
}

- (void).cxx_destruct
{
}

@end