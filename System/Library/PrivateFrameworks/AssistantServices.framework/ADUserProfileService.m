@interface ADUserProfileService
+ (id)sharedService;
- (ADUserProfileService)init;
- (NSMutableArray)profilesChangedHandlers;
- (id)_init;
- (os_unfair_lock_s)lock;
- (void)_withLock:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setProfilesChangedHandlers:(id)a3;
@end

@implementation ADUserProfileService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilesChangedHandlers, 0);
  objc_storeStrong((id *)&self->_namesToDelete, 0);
  objc_storeStrong((id *)&self->_homeUserProfileNames, 0);
  objc_storeStrong((id *)&self->_localUserProfileNames, 0);
  objc_storeStrong((id *)&self->_userProfileCommand, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setProfilesChangedHandlers:(id)a3
{
}

- (NSMutableArray)profilesChangedHandlers
{
  return self->_profilesChangedHandlers;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)_init
{
  v15.receiver = self;
  v15.super_class = (Class)ADUserProfileService;
  v2 = [(ADUserProfileService *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.user-profile-service", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[NSMutableSet set];
    namesToDelete = v2->_namesToDelete;
    v2->_namesToDelete = (NSMutableSet *)v7;

    uint64_t v9 = +[NSMutableSet set];
    homeUserProfileNames = v2->_homeUserProfileNames;
    v2->_homeUserProfileNames = (NSMutableSet *)v9;

    v2->_needsProfileNameSync = 1;
    uint64_t v11 = +[NSMutableArray array];
    profilesChangedHandlers = v2->_profilesChangedHandlers;
    v2->_profilesChangedHandlers = (NSMutableArray *)v11;

    v2->isATVOnly = AFIsATV();
  }
  v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[ADUserProfileService _init]";
    __int16 v18 = 2048;
    v19 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s %p", buf, 0x16u);
  }
  return v2;
}

- (ADUserProfileService)init
{
  v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"ADUserProfileService.m" lineNumber:103 description:@"Use + sharedService"];

  return 0;
}

+ (id)sharedService
{
  if (qword_100585F60 != -1) {
    dispatch_once(&qword_100585F60, &stru_100507650);
  }
  v2 = (void *)qword_100585F58;
  return v2;
}

@end