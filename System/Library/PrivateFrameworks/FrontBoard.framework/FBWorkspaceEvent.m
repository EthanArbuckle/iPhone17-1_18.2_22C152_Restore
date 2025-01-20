@interface FBWorkspaceEvent
- (void)execute;
@end

@implementation FBWorkspaceEvent

- (void)execute
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = FBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = self;
    _os_log_impl(&dword_1A62FC000, v3, OS_LOG_TYPE_DEFAULT, "[FBWorkspaceEvent] Executing: %{public}@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)FBWorkspaceEvent;
  [(BSEventQueueEvent *)&v4 execute];
}

@end