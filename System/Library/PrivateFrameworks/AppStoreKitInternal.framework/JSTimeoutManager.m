@interface JSTimeoutManager
- (_TtC19AppStoreKitInternal16JSTimeoutManager)init;
- (id)makePromise:(id)a3 :(id)a4;
- (void)setTimeout:(id)a3 :(id)a4;
@end

@implementation JSTimeoutManager

- (_TtC19AppStoreKitInternal16JSTimeoutManager)init
{
  return (_TtC19AppStoreKitInternal16JSTimeoutManager *)sub_1E16753AC();
}

- (id)makePromise:(id)a3 :(id)a4
{
  sub_1E1D5BE58();
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  id v6 = a4;
  v7 = self;
  v8 = (void *)sub_1E1D5CC88();
  v9 = (void *)sub_1E1D5CC98();

  swift_bridgeObjectRelease();
  return v9;
}

- (void)setTimeout:(id)a3 :(id)a4
{
  uint64_t v6 = sub_1E1D5BE58();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_1E1A984A0(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();
}

@end