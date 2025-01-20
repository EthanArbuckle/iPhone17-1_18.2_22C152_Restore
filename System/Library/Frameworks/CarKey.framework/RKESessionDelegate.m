@interface RKESessionDelegate
- (_TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE118RKESessionDelegate)init;
- (void)sesSession:(id)a3 didCreateKey:(id)a4 forVehicle:(id)a5;
- (void)sesSession:(id)a3 didInvalidateWithError:(id)a4;
- (void)sesSession:(id)a3 didReceivePassthroughMessage:(id)a4 fromVehicle:(id)a5;
- (void)sesSession:(id)a3 event:(id)a4 fromVehicle:(id)a5;
@end

@implementation RKESessionDelegate

- (void)sesSession:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_2211D54D8();
}

- (void)sesSession:(id)a3 didCreateKey:(id)a4 forVehicle:(id)a5
{
  uint64_t v7 = sub_2211D7D20();
  uint64_t v9 = v8;
  uint64_t v10 = sub_2211D7D20();
  uint64_t v12 = v11;
  id v13 = a3;
  v14 = self;
  sub_2211D57D8(v7, v9, v10, v12);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)sesSession:(id)a3 event:(id)a4 fromVehicle:(id)a5
{
  uint64_t v7 = sub_2211D7D00();
  uint64_t v8 = sub_2211D7D20();
  uint64_t v10 = v9;
  id v11 = a3;
  uint64_t v12 = self;
  sub_2211D60FC(v7, v8, v10);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)sesSession:(id)a3 didReceivePassthroughMessage:(id)a4 fromVehicle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17 = self;
  uint64_t v11 = sub_2211D7BD0();
  unint64_t v13 = v12;

  uint64_t v14 = sub_2211D7D20();
  uint64_t v16 = v15;

  sub_2211D6868(v11, v13, v14, v16);
  swift_bridgeObjectRelease();
  sub_2211D2E00(v11, v13);
}

- (_TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE118RKESessionDelegate)init
{
  result = (_TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE118RKESessionDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end