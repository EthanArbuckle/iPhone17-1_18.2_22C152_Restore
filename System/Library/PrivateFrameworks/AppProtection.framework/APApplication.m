@interface APApplication
+ (APApplication)applicationWithBundleIdentifier:(id)a3;
+ (id)applicationsWithContentHiddenFromSearch;
+ (id)bundleIdentifiersWithContentHiddenFromSearch;
+ (id)effectivelyLockedAppBundleIdentifiers;
+ (id)hiddenAppBundleIdentifiers;
+ (id)hiddenApplications;
+ (id)lockedAppBundleIdentifiers;
+ (id)lockedApplications;
- (BOOL)isEffectivelyLocked;
- (BOOL)isHidden;
- (BOOL)isLocked;
- (NSString)description;
- (id)bundleIdentifier;
- (id)effectiveBundleIdentifier;
- (id)initFileprivWithBundleID:(id)a3 arena:(id)a4;
- (void)dealloc;
@end

@implementation APApplication

- (id)initFileprivWithBundleID:(id)a3 arena:(id)a4
{
  uint64_t v6 = sub_247DD2C20();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___APApplication__bundleIdentifier);
  uint64_t *v7 = v6;
  v7[1] = v8;
  v10.receiver = self;
  v10.super_class = (Class)APApplication;
  return [(APSubject *)&v10 initWithArena:a4];
}

- (BOOL)isLocked
{
  v2 = self;
  char v3 = APApplication.isLocked.getter();

  return v3 & 1;
}

- (void)dealloc
{
  sub_247D3A424((uint64_t)self + OBJC_IVAR___APSubject_clientArenaStorage, (uint64_t)v7);
  uint64_t v3 = *__swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v4 = self;
  id v5 = [(APApplication *)v4 bundleIdentifier];
  sub_247DD2C20();

  if (os_unfair_lock_trylock((os_unfair_lock_t)(v3 + 24)))
  {
    sub_247D3B624((void **)(v3 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 24));
  }
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  v6.receiver = v4;
  v6.super_class = (Class)APApplication;
  [(APApplication *)&v6 dealloc];
}

+ (id)bundleIdentifiersWithContentHiddenFromSearch
{
  id v2 = objc_msgSend(a1, sel_lockedAppBundleIdentifiers);
  sub_247DD2DA0();

  uint64_t v3 = (void *)sub_247DD2D90();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)isEffectivelyLocked
{
  id v2 = self;
  char v3 = APApplication.isEffectivelyLocked.getter();

  return v3 & 1;
}

- (NSString)description
{
  id v2 = self;
  APApplication.description.getter();

  char v3 = (void *)sub_247DD2BF0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isHidden
{
  id v2 = self;
  char v3 = APApplication.isHidden.getter();

  return v3 & 1;
}

+ (APApplication)applicationWithBundleIdentifier:(id)a3
{
  sub_247DD2C20();
  if (qword_26B138EF8 != -1) {
    swift_once();
  }
  sub_247D3A424((uint64_t)qword_26B139290, (uint64_t)v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  char v3 = (void *)sub_247D39E60();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  swift_bridgeObjectRelease();
  return (APApplication *)v3;
}

- (id)bundleIdentifier
{
  return sub_247D3A858();
}

- (void).cxx_destruct
{
}

+ (id)applicationsWithContentHiddenFromSearch
{
  return sub_247D35108((uint64_t)a1, (uint64_t)a2, static APApplication.applicationsWithContentHiddenFromSearch());
}

+ (id)lockedApplications
{
  return sub_247D35108((uint64_t)a1, (uint64_t)a2, static APApplication.lockedApplications());
}

+ (id)hiddenApplications
{
  return sub_247D35108((uint64_t)a1, (uint64_t)a2, static APApplication.hiddenApplications());
}

+ (id)lockedAppBundleIdentifiers
{
  return sub_247D353AC((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_247D35408);
}

+ (id)hiddenAppBundleIdentifiers
{
  return sub_247D353AC((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_247D31600);
}

- (id)effectiveBundleIdentifier
{
  id v2 = self;
  id v3 = [(APApplication *)v2 bundleIdentifier];
  sub_247DD2C20();

  v4 = (void *)sub_247DD2BF0();
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)effectivelyLockedAppBundleIdentifiers
{
  return sub_247D353AC((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_247DC8A4C);
}

@end