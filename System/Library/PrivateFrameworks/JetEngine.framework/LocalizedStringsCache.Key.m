@interface LocalizedStringsCache.Key
- (BOOL)isEqual:(id)a3;
- (_TtCC9JetEngine21LocalizedStringsCacheP33_5B10CF4EC9E6563F43A45CEBFA8559793Key)init;
- (int64_t)hash;
@end

@implementation LocalizedStringsCache.Key

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_19EE9305C();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19F1DCBEC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_19EEBCBCC((uint64_t)v8);

  sub_19EEBCB4C((uint64_t)v8);
  return v6 & 1;
}

- (_TtCC9JetEngine21LocalizedStringsCacheP33_5B10CF4EC9E6563F43A45CEBFA8559793Key)init
{
  result = (_TtCC9JetEngine21LocalizedStringsCacheP33_5B10CF4EC9E6563F43A45CEBFA8559793Key *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end