@interface IMBalloonPluginManager
@end

@implementation IMBalloonPluginManager

void __93__IMBalloonPluginManager_ChatKitAdditions__balloonControllerForIMChatItem_contextIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 message];
  v4 = [v5 guid];
  +[CKSnapshotUtilities cacheSnapshot:v3 guid:v4 postChangeNotification:1];
}

@end