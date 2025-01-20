@interface GKUnauthenticatedPlayerInternal
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (id)alias;
- (id)playerID;
- (void)alias;
- (void)encodeWithCoder:(id)a3;
- (void)playerID;
@end

@implementation GKUnauthenticatedPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (atomic_uint *)(&self->super._allowMultiplayerFriendInvites + 1);
  id v5 = a3;
  GKAtomicIncrement32(v4);
  v6.receiver = self;
  v6.super_class = (Class)GKUnauthenticatedPlayerInternal;
  [(GKPlayerInternal *)&v6 encodeWithCoder:v5];

  GKAtomicDecrement32(v4);
}

- (id)playerID
{
  if (!*(_DWORD *)(&self->super._allowMultiplayerFriendInvites + 1))
  {
    if (!os_log_GKGeneral) {
      id v2 = GKOSLoggers();
    }
    v3 = (void *)os_log_GKAccount;
    if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_DEBUG)) {
      -[GKUnauthenticatedPlayerInternal playerID](v3);
    }
  }
  return 0;
}

- (id)alias
{
  if (!*(_DWORD *)(&self->super._allowMultiplayerFriendInvites + 1))
  {
    if (!os_log_GKGeneral) {
      id v2 = GKOSLoggers();
    }
    v3 = (void *)os_log_GKAccount;
    if (os_log_type_enabled((os_log_t)os_log_GKAccount, OS_LOG_TYPE_DEBUG)) {
      -[GKUnauthenticatedPlayerInternal alias](v3);
    }
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (void)playerID
{
  id v1 = a1;
  id v2 = GKStackTraceWithFrameLimit(5);
  OUTLINED_FUNCTION_0_5(&dword_1C2D22000, v3, v4, "asking for GKLocalPlayer playerID when player is not authenticated. Might be in the process of being authenticated or this is a race condition.Call stack:%@", v5, v6, v7, v8, 2u);
}

- (void)alias
{
  id v1 = a1;
  id v2 = GKStackTraceWithFrameLimit(5);
  OUTLINED_FUNCTION_0_5(&dword_1C2D22000, v3, v4, "asking for GKLocalPlayer playerID when player is not authenticated.Might be in the process of being authenticated or this is a race condition.Call stack:%@", v5, v6, v7, v8, 2u);
}

@end