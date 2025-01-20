@interface DeviceAccountPrivacyUpdater
+ (_TtC12amsaccountsd27DeviceAccountPrivacyUpdater)shared;
- (_TtC12amsaccountsd27DeviceAccountPrivacyUpdater)init;
- (void)updateIfNeededWithAccount:(ACAccount *)a3 completionHandler:(id)a4;
- (void)updateIfNeededWithCompletionHandler:(id)a3;
@end

@implementation DeviceAccountPrivacyUpdater

+ (_TtC12amsaccountsd27DeviceAccountPrivacyUpdater)shared
{
  id v2 = sub_1000ABD00();
  return (_TtC12amsaccountsd27DeviceAccountPrivacyUpdater *)v2;
}

- (void)updateIfNeededWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;
  sub_10000E8D0((uint64_t)&unk_10012F9C8, v5);
}

- (void)updateIfNeededWithAccount:(ACAccount *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_10000E8D0((uint64_t)&unk_10012F988, (uint64_t)v7);
}

- (_TtC12amsaccountsd27DeviceAccountPrivacyUpdater)init
{
  return (_TtC12amsaccountsd27DeviceAccountPrivacyUpdater *)sub_1000AE498();
}

- (void).cxx_destruct
{
}

@end