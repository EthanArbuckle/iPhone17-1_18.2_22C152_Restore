@interface CFPrefsRecreateFileWatcher
@end

@implementation CFPrefsRecreateFileWatcher

uint64_t ___CFPrefsRecreateFileWatcher_block_invoke()
{
  os_unfair_lock_lock((os_unfair_lock_t)&dirWatcherLock);
  uint64_t locked = _onqueue_locked_CFPrefsRecreateFileWatcher();
  os_unfair_lock_unlock((os_unfair_lock_t)&dirWatcherLock);
  v1 = (uint64_t (*)(uint64_t))fsEventStreamStart;

  return v1(locked);
}

@end