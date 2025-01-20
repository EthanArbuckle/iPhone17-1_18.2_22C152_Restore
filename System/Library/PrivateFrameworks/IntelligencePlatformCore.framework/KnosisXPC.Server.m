@interface KnosisXPC.Server
- (_TtCC24IntelligencePlatformCore9KnosisXPC6Server)init;
- (void)executeIntent:(id)a3 withCompletion:(id)a4;
- (void)executeKGQ:(id)a3 withCompletion:(id)a4;
@end

@implementation KnosisXPC.Server

- (void)executeKGQ:(id)a3 withCompletion:(id)a4
{
}

- (void)executeIntent:(id)a3 withCompletion:(id)a4
{
}

- (_TtCC24IntelligencePlatformCore9KnosisXPC6Server)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtCC24IntelligencePlatformCore9KnosisXPC6Server_accessConfig;
  sub_1C79243C0();
  sub_1C6E04764();
  v5 = *(void (**)(char *, uint64_t))(v4 + 8);
  v5(v2, v3);
}

@end