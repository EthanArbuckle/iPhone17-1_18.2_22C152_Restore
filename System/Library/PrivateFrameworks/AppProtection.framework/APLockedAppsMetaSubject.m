@interface APLockedAppsMetaSubject
- (BOOL)isHidden;
- (BOOL)isLocked;
- (BOOL)shieldable;
- (NSString)description;
- (_TtC13AppProtection23APLockedAppsMetaSubject)init;
- (_TtC13AppProtection23APLockedAppsMetaSubject)initWithArena:(id)a3;
- (id)effectiveBundleIdentifier;
@end

@implementation APLockedAppsMetaSubject

- (_TtC13AppProtection23APLockedAppsMetaSubject)init
{
  result = (_TtC13AppProtection23APLockedAppsMetaSubject *)sub_247DD3210();
  __break(1u);
  return result;
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isLocked
{
  v2 = self;
  BOOL v3 = sub_247DC7FF8();

  return v3;
}

- (NSString)description
{
  v2 = (void *)sub_247DD2BF0();
  return (NSString *)v2;
}

- (BOOL)shieldable
{
  return 0;
}

- (id)effectiveBundleIdentifier
{
  v2 = (void *)sub_247DD2BF0();
  return v2;
}

- (_TtC13AppProtection23APLockedAppsMetaSubject)initWithArena:(id)a3
{
}

@end