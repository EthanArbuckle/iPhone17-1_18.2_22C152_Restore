@interface RestrictionsCache
+ (_TtC9appstored17RestrictionsCache)shared;
- (BOOL)isDiagnosticsSubmissionAllowed;
- (_TtC9appstored17RestrictionsCache)init;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation RestrictionsCache

- (_TtC9appstored17RestrictionsCache)init
{
  return (_TtC9appstored17RestrictionsCache *)sub_1000340D0();
}

+ (_TtC9appstored17RestrictionsCache)shared
{
  if (qword_1005A2FB0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1005B1450;
  return (_TtC9appstored17RestrictionsCache *)v2;
}

- (BOOL)isDiagnosticsSubmissionAllowed
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored17RestrictionsCache_lockedCachedValues);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  sub_1000342E8((unsigned char *)(v2 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  BOOL v4 = v6;

  swift_release();
  return v4;
}

- (void).cxx_destruct
{
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored17RestrictionsCache_lockedCachedValues);
  id v6 = a3;
  v7 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 20));
  sub_100034348((unsigned char *)(v5 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 20));

  swift_release();
}

@end