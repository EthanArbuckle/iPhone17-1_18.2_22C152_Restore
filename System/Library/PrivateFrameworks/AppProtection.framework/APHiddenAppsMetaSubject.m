@interface APHiddenAppsMetaSubject
- (BOOL)isHidden;
- (BOOL)isLocked;
- (BOOL)shieldable;
- (NSString)description;
- (_TtC13AppProtection23APHiddenAppsMetaSubject)init;
- (_TtC13AppProtection23APHiddenAppsMetaSubject)initWithArena:(id)a3;
- (id)effectiveBundleIdentifier;
@end

@implementation APHiddenAppsMetaSubject

- (BOOL)isHidden
{
  v2 = self;
  BOOL v3 = sub_247D39CD4();

  return v3;
}

- (_TtC13AppProtection23APHiddenAppsMetaSubject)init
{
  result = (_TtC13AppProtection23APHiddenAppsMetaSubject *)sub_247DD3210();
  __break(1u);
  return result;
}

- (BOOL)isLocked
{
  return [(APHiddenAppsMetaSubject *)self isHidden];
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

- (_TtC13AppProtection23APHiddenAppsMetaSubject)initWithArena:(id)a3
{
}

@end