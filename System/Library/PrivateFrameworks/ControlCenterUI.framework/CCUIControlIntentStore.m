@interface CCUIControlIntentStore
- (CCUIControlIntentStore)init;
- (id)intentWithBundleIdentifier:(id)a3 dataSourceIdentifier:(id)a4 defaultIntentProvider:(id)a5;
- (void)deleteIntentWithBundleIdentifier:(id)a3 dataSourceIdentifier:(id)a4;
- (void)storeIntent:(id)a3 bundleIdentifier:(id)a4 dataSourceIdentifier:(id)a5;
@end

@implementation CCUIControlIntentStore

- (void)storeIntent:(id)a3 bundleIdentifier:(id)a4 dataSourceIdentifier:(id)a5
{
  uint64_t v7 = sub_1D7BB7258();
  unint64_t v9 = v8;
  uint64_t v10 = sub_1D7BB7258();
  unint64_t v12 = v11;
  id v13 = a3;
  v14 = self;
  sub_1D7B75BBC(v13, v7, v9, v10, v12);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)deleteIntentWithBundleIdentifier:(id)a3 dataSourceIdentifier:(id)a4
{
  uint64_t v6 = sub_1D7BB7258();
  unint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = sub_1D7BB7258();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  unint64_t v11 = self;
  sub_1D7B75E8C(v6, v8, v9, (unint64_t)a4);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)intentWithBundleIdentifier:(id)a3 dataSourceIdentifier:(id)a4 defaultIntentProvider:(id)a5
{
  uint64_t v6 = (uint64_t (*)(uint64_t))_Block_copy(a5);
  uint64_t v7 = sub_1D7BB7258();
  unint64_t v9 = v8;
  uint64_t v10 = sub_1D7BB7258();
  unint64_t v12 = v11;
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    uint64_t v6 = (uint64_t (*)(uint64_t))sub_1D7B7C2EC;
  }
  id v13 = self;
  v14 = sub_1D7B765D4(v7, v9, v10, v12, v6);
  sub_1D7B65FA0((uint64_t)v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v14;
}

- (CCUIControlIntentStore)init
{
  uint64_t v3 = OBJC_IVAR___CCUIControlIntentStore_localIntentsCache;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1D7B69014(MEMORY[0x1E4FBC860]);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ControlIntentStore();
  return [(CCUIControlIntentStore *)&v6 init];
}

- (void).cxx_destruct
{
}

@end