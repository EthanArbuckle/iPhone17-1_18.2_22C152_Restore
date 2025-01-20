@interface NTKCollieAvatarStoreListener
+ (NTKCollieAvatarStoreListener)sharedInstance;
- (AVTAvatarStore)avatarStore;
- (NTKCollieAvatarStoreListener)init;
- (void)_avatarStoreDidChange:(id)a3;
- (void)dealloc;
@end

@implementation NTKCollieAvatarStoreListener

+ (NTKCollieAvatarStoreListener)sharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  WeakRetained = (NTKCollieAvatarStoreListener *)objc_loadWeakRetained(&qword_2F7F8);
  if (!WeakRetained)
  {
    WeakRetained = objc_alloc_init(NTKCollieAvatarStoreListener);
    objc_storeWeak(&qword_2F7F8, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

- (NTKCollieAvatarStoreListener)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKCollieAvatarStoreListener;
  id v2 = [(NTKCollieAvatarStoreListener *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[AVTAvatarStore avatarStoreForWatch];
    v4 = (void *)_avtStore;
    _avtStore = v3;

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_avatarStoreDidChange:" name:AVTAvatarStoreDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AVTAvatarStoreDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKCollieAvatarStoreListener;
  [(NTKCollieAvatarStoreListener *)&v4 dealloc];
}

- (AVTAvatarStore)avatarStore
{
  return (AVTAvatarStore *)(id)_avtStore;
}

- (void)_avatarStoreDidChange:(id)a3
{
}

@end