@interface FPConflictLoser
- (BOOL)isEqual:(id)a3;
- (int64_t)hash;
@end

@implementation FPConflictLoser

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_10096C9D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = FPConflictLoser.isEqual(_:)((uint64_t)v8);

  sub_10017D1A4((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  id v3 = [(FPConflictLoser *)v2 etag];
  _sSo28NSFileProviderItemIdentifiera9libfssyncE15parseableStringSSvg_0();

  int64_t v4 = sub_10096BE90();
  swift_bridgeObjectRelease();
  return v4;
}

@end